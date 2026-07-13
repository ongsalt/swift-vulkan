from __future__ import annotations
from dataclasses import dataclass, field
import re
from .parser import CContext, CEnum, CBitmask, CStruct, CType, CHandle, CMember, CCommand, CAlias
from . import typeconversion as tc


class SwiftEnum(CEnum):
    def __init__(self, c_enum: CEnum, raw_type: str, error: bool = False, **kwargs):
        super().__init__(**kwargs)
        self.c_enum = c_enum
        self.raw_type = raw_type
        self.error = error


class SwiftOptionSet(CEnum):
    def __init__(self, c_bitmask: CBitmask, raw_type: str, **kwargs):
        super().__init__(**kwargs)
        self.c_bitmask = c_bitmask
        self.raw_type = raw_type


@dataclass(eq=False)
class SwiftMember:
    name: str
    type: str
    is_closure: bool = False
    default_value: str | None = None
    is_static: bool = False


@dataclass(eq=False)
class SwiftStruct:
    c_struct: CStruct
    name: str
    members: list[SwiftMember]
    member_conversions: tc.MemberConversions
    # Set when a member is a dispatchable handle: rebuilding it from a C struct
    # needs the dispatch table that handle would carry.
    table_type: str | None = None
    protocols: list[str] = field(default_factory=list)
    protect: str | None = None

    @property
    def extension_name(self):
        return f'{self.name}Extension'


@dataclass(eq=False)
class SwiftCommand:
    c_command: CCommand
    name: str
    return_type: str
    throws: bool
    class_params: dict[str, SwiftClass]
    params: list[SwiftMember]
    param_conversions: tc.MemberConversions
    return_conversion: tc.Conversion
    output_param: str | None = None
    output_param_implicit_type: str | None = None
    output_param_custom_initializer: str | None = None
    output_param_structure_type: str | None = None
    unwrap_output_param: bool = False
    enumeration_pointer_param: str | None = None
    enumeration_count_param: str | None = None
    dispatcher: SwiftClass | None = None
    protect: str | None = None
    enumeration_is_bytes_array: bool = False
    chainable_out_parameters: list[str] | None = None
    # vkCreateInstance/vkCreateDevice allocate the table the new handle carries;
    # vkDestroyInstance/vkDestroyDevice free it again
    creates_table: DispatchTable | None = None
    destroys_table: bool = False


@dataclass(eq=False)
class DispatchTable:
    name: str
    # the function pointer used to load every other entry, stored as a field so
    # children can build their own table from it
    loader: tuple[str, str]
    param: tuple[str, str] | None = None
    # object retained by the table, supplying the loader function (Entry only)
    owner: tuple[str, str] | None = None
    commands: list[CCommand] = field(default_factory=list)


@dataclass(eq=False)
class SwiftClass:
    name: str
    reference_name: str
    c_handle: CHandle | None = None
    # dispatchable handles carry a dispatch table; the rest are just a raw handle
    dispatchable: bool = False
    table: DispatchTable | None = None
    # Entry/Instance/Device allocate the table they carry; Queue, CommandBuffer
    # and PhysicalDevice borrow their dispatcher's
    owns_table: bool = False
    # ObjectType case, for the type-erased (objectType, objectHandle) pair
    obj_type: str | None = None
    commands: list[SwiftCommand] = field(default_factory=list)
    protect: str | None = None


@dataclass(eq=False)
class SwiftAlias:
    c_alias: CAlias
    name: str
    alias: str
    protect: str | None = None


@dataclass(eq=False)
class SwiftContext:
    enums: list[SwiftEnum] = field(default_factory=list)
    option_sets: list[SwiftOptionSet] = field(default_factory=list)
    structs: list[SwiftStruct] = field(default_factory=list)
    classes: list[SwiftClass] = field(default_factory=list)
    aliases: list[SwiftAlias] = field(default_factory=list)
    dispatch_tables: list[DispatchTable] = field(default_factory=list)


# Types that are pointers by value, but are not declared as such in vk.xml:
# VkRemoteAddressNV is a `basetype` (typedef void*), the rest are external
# platform types whose definitions live in native headers.
POINTER_LIKE_TYPES = {
    'VkRemoteAddressNV',
    # windows.h
    'HANDLE',
    'HINSTANCE',
    'HWND',
    'HMONITOR',
    'LPCWSTR',
    # nvscisync.h / nvscibuf.h
    'NvSciSyncAttrList',
    'NvSciSyncObj',
    'NvSciBufAttrList',
    'NvSciBufObj',
}


class Importer:
    def __init__(self, c_context: CContext):
        self.c_context = c_context
        self.swift_context = SwiftContext()
        self.imported_enums: dict[str, SwiftEnum] = {}
        self.imported_structure_types: dict[str, str] = {}
        self.imported_object_types: dict[str, str] = {}
        self.imported_option_sets: dict[str, SwiftOptionSet] = {}
        self.imported_option_set_bits: dict[str, SwiftOptionSet] = {}
        self.imported_structs: dict[str, SwiftStruct] = {}
        self.imported_classes: dict[str, SwiftClass] = {}
        self.imported_aliases: dict[str, SwiftAlias] = {}
        self.pointer_types = [handle.name for handle in c_context.handles] + \
            [alias.name for alias in c_context.aliases]
        self.c_structs = {
            c_struct.name: c_struct for c_struct in c_context.structs}

    def import_all(self) -> SwiftContext:
        for enum in self.c_context.enums:
            self.import_enum(enum)

        for bitmask in self.c_context.bitmasks:
            self.import_bitmask(bitmask)

        for handle in self.c_context.handles:
            self.import_handle(handle)

        for alias in self.c_context.aliases:
            self.import_alias(alias)

        for struct in self.c_context.structs:
            if struct.name not in ('VkBaseInStructure', 'VkBaseOutStructure'):
                self.import_struct(struct)

        for command in self.c_context.commands:
            self.import_command(command)

        return self.swift_context

    def import_enum(self, c_enum: CEnum) -> SwiftEnum:
        swift_enum = SwiftEnum(
            name=remove_vk_prefix(c_enum.name),
            cases=[],
            c_enum=c_enum,
            raw_type='UInt32',
            error=c_enum.name == 'VkResult',
            protect=c_enum.protect
        )

        prefix, enum_tag = self.pop_extension_tag(swift_enum.name)

        starts_with_digit = False
        for case in c_enum.cases:
            name = remove_vk_prefix(case.name)
            name, tag = self.pop_extension_tag(name)
            name = snake_to_pascal(name)

            if name.startswith(prefix):
                name = name[len(prefix):]

            if not name:
                name = tag.lower()
            elif tag and tag != enum_tag:
                name += tag

            name = name[0].lower() + name[1:]

            if name[0].isdigit():
                starts_with_digit = True

            try:
                if int(case.value) < 0:
                    swift_enum.raw_type = 'Int32'
            except ValueError:
                pass

            swift_enum.cases.append(
                SwiftEnum.Case(name=name, value=case.value))
            if swift_enum.name == "StructureType":
                self.imported_structure_types[case.name] = name
            elif swift_enum.name == "ObjectType":
                self.imported_object_types[case.name] = name

        if starts_with_digit:
            for case in swift_enum.cases:
                case.name = 'type' + case.name[0].upper() + case.name[1:]

        self.swift_context.enums.append(swift_enum)
        self.imported_enums[c_enum.name] = swift_enum

        return swift_enum

    def import_bitmask(self, c_bitmask: CBitmask) -> SwiftOptionSet:
        option_set = SwiftOptionSet(
            name=remove_vk_prefix(c_bitmask.name),
            cases=[],
            c_bitmask=c_bitmask,
            raw_type='UInt64' if c_bitmask.is64 else 'UInt32',
            protect=c_bitmask.protect
        )

        if c_bitmask.enum:
            prefix, enum_tag = self.pop_extension_tag(option_set.name)

            if prefix.endswith('Flags'):
                prefix = prefix[:-5]
            elif prefix[:-1].endswith('Flags'):  # without version number
                prefix = prefix[:-6] + prefix[-1]

            starts_with_digit = False
            for case in c_bitmask.enum.cases:
                name = remove_vk_prefix(case.name)
                name, tag = self.pop_extension_tag(name)
                name = snake_to_pascal(name)

                if name.startswith(prefix):
                    name = name[len(prefix):]

                if name.endswith('Bit'):
                    name = name[:-3]

                if not name:
                    name = tag.lower()
                elif tag and tag != enum_tag:
                    name += tag

                name = name[0].lower() + name[1:]

                if name[0].isdigit():
                    starts_with_digit = True

                option_set.cases.append(
                    SwiftOptionSet.Case(name=name, value=case.value))

            if starts_with_digit:
                for case in option_set.cases:
                    case.name = 'type' + case.name[0].upper() + case.name[1:]

            self.imported_option_set_bits[c_bitmask.enum.name] = option_set

        self.swift_context.option_sets.append(option_set)
        self.imported_option_sets[c_bitmask.name] = option_set
        return option_set

    def import_struct(self, c_struct: CStruct) -> SwiftStruct:
        if c_struct.name in self.imported_structs:
            return self.imported_structs[c_struct.name]

        name = remove_vk_prefix(c_struct.name)

        table_type: str | None = None

        protocols: list[str] = []
        for base in c_struct.struct_extends:
            protocols.append(f"{remove_vk_prefix(base)}Extension")

        for member in c_struct.members:
            type_name = member.type.type_name
            if type_name in self.c_structs:
                child_struct = self.import_struct(self.c_structs[type_name])
                table_type = table_type or child_struct.table_type
            elif type_name:
                if type_name in self.imported_aliases:
                    type_name = self.imported_aliases[type_name].c_alias.alias
                cls = self.imported_classes.get(type_name)
                # only a dispatchable handle needs anything beyond its raw handle
                # to be rebuilt from a C struct
                if cls and cls.dispatchable and cls.table:
                    table_type = table_type or cls.table.name

        members, conversions = self.get_member_conversions(
            c_struct.members, c_struct=c_struct)
        struct = SwiftStruct(c_struct=c_struct,
                             name=name,
                             members=members,
                             member_conversions=conversions,
                             table_type=table_type,
                             protocols=protocols,
                             protect=c_struct.protect)
        self.swift_context.structs.append(struct)
        self.imported_structs[c_struct.name] = struct
        return struct

    def import_entry(self) -> SwiftClass:
        if 'entry' in self.imported_classes:
            return self.imported_classes['entry']

        dispatch_table = DispatchTable(
            'EntryDispatchTable',
            ('vkGetInstanceProcAddr', 'PFN_vkGetInstanceProcAddr'),
            owner=('loader', 'any Loader'))
        entry = SwiftClass(name='Entry', reference_name='entry',
                           dispatchable=True, table=dispatch_table, owns_table=True)

        self.swift_context.dispatch_tables.append(dispatch_table)
        self.swift_context.classes.append(entry)
        self.imported_classes['entry'] = entry
        return entry

    def import_handle(self, handle: CHandle) -> SwiftClass:
        if handle.name in self.imported_classes:
            return self.imported_classes[handle.name]

        name = remove_vk_prefix(handle.name)
        reference_name, _ = self.pop_extension_tag(name)
        reference_name = reference_name[0].lower() + reference_name[1:]

        owns_table = False
        if handle.name == 'VkInstance':
            self.import_entry()
            table = DispatchTable('InstanceDispatchTable',
                                  ('vkGetInstanceProcAddr',
                                   'PFN_vkGetInstanceProcAddr'),
                                  ('instance', 'VkInstance'))
            owns_table = True
            self.swift_context.dispatch_tables.append(table)
        elif handle.name == 'VkDevice':
            table = DispatchTable('DeviceDispatchTable',
                                  ('vkGetDeviceProcAddr',
                                   'PFN_vkGetDeviceProcAddr'),
                                  ('device', 'VkDevice'))
            owns_table = True
            self.swift_context.dispatch_tables.append(table)
        elif handle.dispatchable:
            # borrows the table of the instance/device it was created from
            table = self.get_dispatcher_of(handle).table
        else:
            table = None

        cls = SwiftClass(
            c_handle=handle,
            name=name,
            reference_name=reference_name,
            dispatchable=handle.dispatchable,
            table=table,
            owns_table=owns_table,
            obj_type=self.imported_object_types.get(handle.obj_type_enum or ''),
            protect=handle.protect
        )
        self.swift_context.classes.append(cls)
        self.imported_classes[handle.name] = cls
        return cls

    def get_dispatcher_of(self, handle: CHandle) -> SwiftClass:
        """The Instance/Device whose dispatch table dispatches this handle's commands."""
        current = handle
        while current:
            if current.name in ('VkInstance', 'VkDevice'):
                return self.import_handle(current)
            current = current.parent
        return self.imported_classes['entry']

    def import_command(self, c_command: CCommand) -> SwiftCommand:
        receiver = self.get_receiver(c_command)
        class_params_and_classes: list[tuple[CMember, SwiftClass]] = \
            [receiver] if receiver else []
        current_class = receiver[1] if receiver \
            else self.imported_classes['entry']

        class_name_without_extension, _ = self.pop_extension_tag(
            current_class.name)

        name = remove_vk_prefix(c_command.name)
        name = re.sub(
            f'({class_name_without_extension})([A-Z]\\w*)?$', r'\2', name)
        name = name[0].lower() + name[1:]
        if name.startswith('enumerate'):
            name = 'get' + name[9:]

        if name.startswith('cmd'):
            name = name[3].lower() + name[4:]

        c_return_type = c_command.return_type
        throws = False
        if c_return_type.name == 'VkResult':
            throws = True
            c_return_type = CType(name='void')

        return_type, return_conversion = self.get_type_conversion(
            c_return_type, force_optional=True)

        output_param: str | None = None
        output_param_implicit_type: str | None = None
        output_param_custom_initializer: str | None = None
        output_param_structure_type: str | None = None
        unwrap_output_param = False
        enumeration_pointer_params: list[str] = []
        enumeration_count_param: str | None = None
        enumeration_is_bytes_array = False
        
        if c_return_type.name == 'void':
            output_params = get_output_params(c_command)

            if len(output_params) == 1:
                if c_command.name == 'vkEnumerateInstanceVersion':
                    output_param = output_params[0].name
                    return_type, return_conversion = 'Version', tc.version_conversion
                    output_param_implicit_type = 'UInt32'

                elif is_array_convertible(output_params[0].type, ignore_const=True):
                    output_param = output_params[0].name
                    return_type, return_conversion = self.get_array_conversion(
                        output_params[0].type)
                    output_param_implicit_type, _ = self.get_type_conversion(output_params[0].type.pointer_to,
                                                                             implicit_only=True, force_optional=True)
                elif not output_params[0].type.length:
                    output_param = output_params[0].name
                    ty = output_params[0].type.pointer_to
                    assert ty is not None
                    return_type, return_conversion = self.get_type_conversion(
                        ty, force_optional=False)
                    output_param_implicit_type, _ = self.get_type_conversion(
                        ty, implicit_only=True, force_optional=False)
                    unwrap_output_param = self.is_pointer_type(ty)

                    output_param_type_struct = self.imported_structs.get(
                        output_param_implicit_type, None)

                    if ty.name in self.imported_enums:
                        output_param_custom_initializer = f'{output_param_implicit_type}(rawValue: 0)'

            # TODO: multiple out array
            elif len(output_params) == 2 and output_params[1].type.length == output_params[0].name:
                enumeration_pointer_params = output_params[1].name
                enumeration_count_param = output_params[0].name
                return_type, return_conversion = self.get_array_conversion(
                    output_params[1].type, force_optional=False)
                enumeration_is_bytes_array = output_params[1].type.pointer_to.name == 'void'

        
        if output_param_implicit_type and output_param_implicit_type in self.imported_structs: 
            c_struct = self.imported_structs[output_param_implicit_type].c_struct
            if c_struct.s_type:
                output_param_structure_type = c_struct.s_type

        class_params = [param for param, _ in class_params_and_classes]
        output_params = (
            output_param, enumeration_pointer_params, enumeration_count_param)
        c_input_params = [
            param for param in c_command.params if param.name not in output_params]
        c_input_params = class_params + c_input_params[len(class_params):]

        dispatcher = self.get_dispatcher(c_command)
        table = dispatcher.table
        # the loader function is already a stored field of the table it loads
        if table and c_command.name != table.loader[0]:
            table.commands.append(c_command)

        created_class = self.imported_classes.get(
            c_command.params[-1].type.type_name) if c_command.params else None
        creates_table = created_class.table \
            if created_class and created_class.owns_table else None
        destroys_table = c_command.name in ('vkDestroyInstance', 'vkDestroyDevice')

        # a Chainable<_> in overlaod
        should_generate_chainable_overload = self.should_generate_chainable_overload(
            c_command, c_input_params)
        
        chainable_out_parameters = self.get_chainable_out_parameters(c_command)

        if should_generate_chainable_overload:
            params, conversions = self.get_member_conversions(
                c_input_params, c_command=c_command, transform_chainable=True)

            command = SwiftCommand(
                c_command=c_command,
                name=remove_vk_prefix(name),
                return_type=return_type,
                throws=throws,
                class_params={param.name: cls for param,
                              cls in class_params_and_classes},
                params=params[len(class_params):],
                param_conversions=conversions,
                return_conversion=return_conversion,
                output_param=output_param,
                output_param_implicit_type=output_param_implicit_type,
                output_param_custom_initializer=output_param_custom_initializer,
                output_param_structure_type=output_param_structure_type,
                unwrap_output_param=unwrap_output_param,
                enumeration_pointer_param=enumeration_pointer_params,
                enumeration_count_param=enumeration_count_param,
                dispatcher=dispatcher,
                protect=c_command.protect,
                enumeration_is_bytes_array=enumeration_is_bytes_array,
                creates_table=creates_table,
                destroys_table=destroys_table,
            )
            current_class.commands.append(command)

        params, conversions = self.get_member_conversions(
            c_input_params, c_command=c_command, transform_chainable=False)

        command = SwiftCommand(
            c_command=c_command,
            name=remove_vk_prefix(name),
            return_type=return_type,
            throws=throws,
            class_params={param.name: cls for param,
                          cls in class_params_and_classes},
            params=params[len(class_params):],
            param_conversions=conversions,
            return_conversion=return_conversion,
            output_param=output_param,
            output_param_implicit_type=output_param_implicit_type,
            output_param_custom_initializer=output_param_custom_initializer,
            output_param_structure_type=output_param_structure_type,
            unwrap_output_param=unwrap_output_param,
            enumeration_pointer_param=enumeration_pointer_params,
            enumeration_count_param=enumeration_count_param,
            dispatcher=dispatcher,
            protect=c_command.protect,
            enumeration_is_bytes_array=enumeration_is_bytes_array,
            creates_table=creates_table,
            destroys_table=destroys_table,
        )

        current_class.commands.append(command)

        if len(chainable_out_parameters) == 1 and False:
            params, conversions = self.get_member_conversions(c_input_params, c_command=c_command)

            command = SwiftCommand(
                c_command=c_command,
                name=remove_vk_prefix(name),
                return_type=return_type,
                throws=throws,
                class_params={param.name: cls for param,
                            cls in class_params_and_classes},
                params=params[len(class_params):],
                param_conversions=conversions,
                return_conversion=return_conversion,
                output_param=output_param,
                output_param_implicit_type=output_param_implicit_type,
                output_param_custom_initializer=output_param_custom_initializer,
                output_param_structure_type=output_param_structure_type,
                unwrap_output_param=unwrap_output_param,
                enumeration_pointer_param=enumeration_pointer_params,
                enumeration_count_param=enumeration_count_param,
                dispatcher=dispatcher,
                protect=c_command.protect,
                enumeration_is_bytes_array=enumeration_is_bytes_array,
                creates_table=creates_table,
                destroys_table=destroys_table,
                chainable_out_parameters=chainable_out_parameters
            )

            current_class.commands.append(command)


        # unused return
        return command

    def import_alias(self, c_alias: CAlias) -> SwiftAlias:
        alias = SwiftAlias(c_alias, remove_vk_prefix(
            c_alias.name), self.imported_classes[c_alias.alias].name, protect=c_alias.protect)
        self.swift_context.aliases.append(alias)
        self.imported_aliases[c_alias.name] = alias
        return alias

    def get_dispatcher(self, command: CCommand) -> SwiftClass:
        # vkGetInstanceProcAddr is the loader function itself, and vkGetDeviceProcAddr
        # must be reachable from the instance table to build a device table.
        if command.name == 'vkGetInstanceProcAddr':
            return self.imported_classes['entry']
        if command.name == 'vkGetDeviceProcAddr':
            return self.imported_classes['VkInstance']

        if command.params:
            param = command.params[0]
            if param.type.name and param.type.name in self.imported_classes:
                cls = self.imported_classes[param.type.name]
                if cls.c_handle:
                    return self.get_dispatcher_of(cls.c_handle)
        return self.imported_classes['entry']

    def get_receiver(self, command: CCommand) -> tuple[CMember, SwiftClass] | None:
        """Vulkan always takes the dispatchable object as the first parameter.
        That object is the receiver; every other handle stays an ordinary parameter."""
        # the one command whose instance may legitimately be nil: it loads the
        # global entry points, so it belongs to Entry
        if command.name == 'vkGetInstanceProcAddr':
            return None
        if not command.params:
            return None
        param = command.params[0]
        if not param.type.name:
            return None
        cls = self.imported_classes.get(param.type.name)
        if cls is None or not cls.dispatchable:
            return None
        return CMember(param.name, CType(param.type.name)), cls

    def get_member_conversions(self, c_members: list[CMember], 
                               c_struct: CStruct | None = None, 
                               c_command: CCommand | None = None,
                               transform_chainable: bool = False,
                               ) -> tuple[list[SwiftMember], tc.MemberConversions]:
        members: list[SwiftMember] = []
        conversions = tc.MemberConversions()
        lengths: list[str] = []
        optional_lengths: set[str] = set()


        use_implcit_len = True
        if c_struct and c_struct.name in ('VkWriteDescriptorSet', 'VkDescriptorSetLayoutBinding'):
            use_implcit_len = False

        if use_implcit_len:
            for c_member in c_members:
                if is_array_convertible(c_member.type):
                    lengths.append(c_member.type.length)

        for c_member in c_members:
            if c_member.name in lengths:
                if c_member.type.optional:
                    optional_lengths.add(c_member.name)
                continue

            # currently every "values" field is used to specify VkStructureType
            if len(c_member.values) == 1:
                # treat it as sType
                c_name = 'sType'
                swift_name = 'structureType'
                
                conversion = tc.enum_conversion('VkStructureType', 'StructureType')
                conversions.add_conversion(c_name, f'{swift_name}', conversion)

                c_value = c_member.values[0]
                value = self.imported_structure_types[c_value]
                members.append(SwiftMember(swift_name, type="StructureType", is_static=True, default_value=f'.{value}'))
                continue
            elif len(c_member.values) > 1:
                print(
                    f'warning: unhandled case where c_member.values > 1 at {c_struct and c_struct.name}')

            if c_command and c_member.name == 'pAllocator':
                conversions.add_static_value(c_member.name, 'nil')
                continue

            if c_struct and c_member.name == 'pNext':
                # some pNext is mutable, some is not. And the header dont really follows the spec.
                conversions.add_static_value(
                    c_member.name, 'maybeMutable(pNext)')
                continue

            if (c_struct and (
                (c_struct.name in ('VkPhysicalDeviceProperties', 'VkApplicationInfo')
                    and c_member.name == 'apiVersion')
                or (c_struct.name == 'VkLayerProperties' and c_member.name == 'specVersion')
            )):
                swift_type, conversion = 'Version', tc.version_conversion

            elif c_struct and c_struct.name == 'VkDescriptorImageInfo':
                # make it optional
                swift_type, conversion = self.get_type_conversion(c_member.type, force_optional=True)

            # These are large tuples
            # TODO: automatically do this after certain threshold
            # require parser change btw
            # elif type(c_member.type.length) == int and c_member.type.length >= 16:
            #     swift_type, conversion = 'Array<MemoryType>', tc.tuple_array_conversion(
            #         tc.struct_array_conversion('MemoryType', 'memoryTypeCount'), 'VkMemoryType', c_member.type.length)

            elif c_struct and c_struct.name == 'VkPhysicalDeviceMemoryProperties' and c_member.name == 'memoryTypes':
                swift_type, conversion = 'Array<MemoryType>', tc.tuple_array_conversion(
                    tc.struct_array_conversion('MemoryType', 'memoryTypeCount'), 'VkMemoryType', c_member.type.length)

            elif c_struct and c_struct.name == 'VkPhysicalDeviceMemoryProperties' and c_member.name == 'memoryHeaps':
                swift_type, conversion = 'Array<MemoryHeap>', tc.tuple_array_conversion(
                    tc.struct_array_conversion('MemoryHeap', 'memoryHeapCount'), 'VkMemoryHeap', c_member.type.length)

            elif c_struct and c_struct.name == 'VkPhysicalDeviceGroupProperties' and c_member.name == 'physicalDevices':
                swift_type, conversion = 'Array<PhysicalDevice>', tc.tuple_array_conversion(
                    tc.array_mapped_conversion(
                        tc.class_conversion(
                            'PhysicalDevice', dispatchable=True), 'physicalDeviceCount'
                    ), 'VkPhysicalDevice?', c_member.type.length
                )

            else:
                swift_type, conversion = self.get_type_conversion(c_member.type,
                                                                  convert_array_to_pointer=c_command is not None,
                                                                  transform_chainable=c_command is not None and transform_chainable)

            swift_name = get_member_name(c_member.name, c_member.type)
            # VkAccelerationStructureBuildGeometryInfoKHR.{pGeometries, ppGeometries} both got translated to `geometries`
            for m in members:
                if m.name == swift_name:
                    # TODO: better naming maybe
                    swift_name = f"{swift_name}2"

            is_closure = bool(c_member.type.name and c_member.type.name.startswith(
                'PFN_') and not c_member.type.optional)

            # if this is a features struct we make everything default to false
            force_default = c_struct is not None and 'Features' in c_struct.name
            default_value = self.get_default_value(
                swift_type, c_member.type, optional_lengths, forced=force_default)

            member = SwiftMember(
                name=swift_name, type=swift_type, is_closure=is_closure, default_value=default_value)

            members.append(member)
            conversions.add_conversion(c_member.name, swift_name, conversion)

        return members, conversions

    def should_generate_chainable_overload(self, c_command: CCommand, c_input_params: list[CMember]):
        out = False

        for p in c_input_params:
            name = p.type.type_name
            if name in self.imported_structs and p.type.pointer_to and p.type.pointer_to.const and not p.type.name:
                swift_struct = self.imported_structs[name]
                if swift_struct.c_struct.is_chainable:
                    # if out == True:
                    #     print(
                    #         f"warning: {c_command.name} contains multiple chainable parameter")
                    out = True
                    break

        return out
    

    def get_chainable_out_parameters(self, c_command: CCommand) -> list[str]:
        chainable_out_params: list[str] = []
        for param in c_command.params:
            # ignoring array
            if is_array_convertible(param.type, ignore_const=True):
                continue
            # if its out param 
            ty = param.type.type_name
            if param.type.pointer_to and not param.type.pointer_to.const:
                # if its chainable
                if ty in self.imported_structs and self.imported_structs[ty].c_struct.is_chainable:
                    chainable_out_params.append(param.name)            
        
        if len(chainable_out_params) > 1:
            print(f'warning: {c_command.name} contains multiple chainable out parameter. skipping...')
            return []

        return chainable_out_params if len(chainable_out_params) == 1 else []
        

    def get_type_conversion(self, c_type: CType, implicit_only: bool = False, force_optional: bool | None = None,
                            convert_array_to_pointer: bool = False, transform_chainable=False) -> tuple[str, tc.Conversion]:
        optional = force_optional if force_optional is not None else c_type.optional
        if c_type.pointer_to and c_type.pointer_to.name in ('wl_display', 'wl_surface'):
            return 'OpaquePointer', tc.implicit_conversion

        if c_type.name:
            if c_type.name in tc.IMPLICIT_TYPE_MAP:
                return tc.IMPLICIT_TYPE_MAP[c_type.name], tc.implicit_conversion
            if not implicit_only:
                if c_type.name == 'VkBool32':
                    return 'Bool', tc.bool_conversion
                if c_type.name in self.imported_enums:
                    swift_enum = self.imported_enums[c_type.name]
                    return swift_enum.name, tc.enum_conversion(c_type.name, swift_enum.name)
                if c_type.name in self.imported_option_sets:
                    option_set = self.imported_option_sets[c_type.name]
                    return option_set.name, tc.option_set_conversion(option_set.name)
                if c_type.name in self.imported_option_set_bits:
                    option_set = self.imported_option_set_bits[c_type.name]
                    return option_set.name, tc.option_set_bit_conversion(c_type.name, option_set.name, option_set.c_bitmask.is64)
                if c_type.name in self.imported_structs:
                    swift_struct = self.imported_structs[c_type.name]
                    return swift_struct.name, tc.struct_conversion(swift_struct.name, swift_struct.table_type)

                alias = self.imported_aliases.get(c_type.name)
                c_name = alias.c_alias.alias if alias else c_type.name

                if c_name in self.imported_classes:
                    cls = self.imported_classes[c_name]
                    cls_name = alias.name if alias else cls.name
                    if optional:
                        return cls_name + '?', tc.optional_class_conversion(cls_name, cls.dispatchable)
                    else:
                        return cls_name, tc.class_conversion(cls_name, cls.dispatchable)

            swift_type = c_type.name
            if self.is_pointer_type(c_type) and optional:
                swift_type += '?'
            return swift_type, tc.implicit_conversion

        elif c_type.pointer_to:
            if c_type.pointer_to.name == 'void':
                swift_type = 'UnsafeRawPointer' if c_type.pointer_to.const else 'UnsafeMutableRawPointer'
                if optional:
                    swift_type += '?'
                return swift_type, tc.implicit_conversion

            if not implicit_only and c_type.pointer_to.const:
                if is_string_convertible(c_type):
                    if optional:
                        return 'String?', tc.optional_string_conversion
                    else:
                        return 'String', tc.string_conversion

                if is_array_convertible(c_type):
                    should_transform_chainable = transform_chainable and c_type.pointer_to.name in self.imported_structs
                    name, conversion = self.get_array_conversion(
                        c_type, force_optional=False if should_transform_chainable else None)
                    if should_transform_chainable:
                        swift_struct = self.imported_structs[c_type.pointer_to.name]
                        if swift_struct.c_struct.is_chainable:
                            ty_name = name
                            if ty_name.endswith('?'):
                                ty_name = ty_name[:-1]
                            ty_name = ty_name[6:][:-1]
                            # trim Array<...>
                            name = f"(AnyChainableArray<{ty_name}>)"

                    return name, conversion

                if c_type.pointer_to.name and not c_type.length and c_type.pointer_to.name in self.imported_structs:
                    swift_struct = self.imported_structs[c_type.pointer_to.name]

                    name = swift_struct.name
                    if transform_chainable:
                        name = f"(some Chainable<{name}>)"
                    if optional and not transform_chainable:
                        return name + '?', tc.optional_struct_conversion(swift_struct.name, swift_struct.table_type)
                    else:
                        return name, tc.struct_pointer_conversion(swift_struct.name, swift_struct.table_type)

            to_type, _ = self.get_type_conversion(
                c_type.pointer_to, implicit_only=True, force_optional=True)
            swift_type = f'UnsafePointer<{to_type}>' if c_type.pointer_to.const else f'UnsafeMutablePointer<{to_type}>'
            if optional:
                swift_type += '?'
            return swift_type, tc.implicit_conversion

        elif c_type.array_of:
            if c_type.array_of.name == 'char':
                return 'String', tc.char_array_conversion
            of_type, _ = self.get_type_conversion(
                c_type.array_of, implicit_only=True, force_optional=True)

            swift_type = of_type
            lenghts = [c_type.length] if type(
                c_type.length) == int else c_type.length
            for size in reversed(lenghts):
                swift_type = f'({", ".join([swift_type] * size)})'

            if convert_array_to_pointer:
                return swift_type, tc.tuple_pointer_conversion(of_type)
            else:
                return swift_type, tc.implicit_conversion

    def get_array_conversion(self, c_type: CType, force_optional: bool | None = None) -> tuple[str, tc.ArrayConversion]:
        optional = force_optional if force_optional is not None else c_type.optional

        if is_string_convertible(c_type.pointer_to) and not optional:
            return 'Array<String>', tc.string_array_conversion(c_type.length)

        # C takes an array of handles as UnsafePointer<VkX?>, which a plain
        # `map { $0.handle }` no longer produces now that handles are non-optional.
        # Note the elements are never optional, even when the array is.
        if c_type.pointer_to.name:
            cls = self.imported_classes.get(c_type.pointer_to.name)
            if cls:
                if not optional:
                    return f'Array<{cls.name}>', \
                        tc.handle_array_conversion(
                            cls.name, c_type.length, cls.dispatchable)
                else:
                    return f'Array<{cls.name}>?', \
                        tc.optional_handle_array_conversion(
                            cls.name, c_type.length, cls.dispatchable)

        if c_type.pointer_to.name and c_type.pointer_to.name in self.imported_structs:
            swift_struct = self.imported_structs[c_type.pointer_to.name]
            if not optional:
                return f'Array<{swift_struct.name}>', \
                    tc.struct_array_conversion(
                        swift_struct.name, c_type.length, swift_struct.table_type)
            else:
                return f'Array<{swift_struct.name}>?', \
                    tc.optional_struct_array_conversion(
                        swift_struct.name, c_type.length, swift_struct.table_type)

        if c_type.pointer_to.name == 'void':
            return 'Array<UInt8>', tc.byte_array_conversion(c_type.length)

        if c_type.pointer_to.name:
            element_type, element_conversion = self.get_type_conversion(
                c_type.pointer_to)
            if element_conversion != tc.implicit_conversion:
                if not optional:
                    return f'Array<{element_type}>', \
                        tc.array_mapped_conversion(
                            element_conversion, c_type.length)
                else:
                    return f'Array<{element_type}>?', \
                        tc.optional_array_mapped_conversion(
                            element_conversion, c_type.length)

        element_type, _ = self.get_type_conversion(
            c_type.pointer_to, implicit_only=True, force_optional=True)
        if not optional:
            return f'Array<{element_type}>', tc.array_conversion(c_type.length)
        else:
            return f'Array<{element_type}>?', tc.optional_array_conversion(c_type.length)

    def is_pointer_type(self, c_type: CType) -> bool:
        if c_type.name in POINTER_LIKE_TYPES:
            return True
        return (c_type.pointer_to is not None
                or (c_type.name and (c_type.name in self.pointer_types or c_type.name.startswith('PFN_'))))

    def pop_extension_tag(self, string: str) -> tuple[str, str | None]:
        for tag in self.c_context.extension_tags:
            if string.endswith(tag):
                return string[:-len(tag)].rstrip('_'), tag
        return string, None

    def get_default_value(self, swift_type: str | None, c_type: CType, optional_lengths: set[str] | None = None, forced: bool = False) -> str | None:
        if swift_type and swift_type.endswith('?'):
            return 'nil'

        ty = c_type
        if ty.length and type(ty.length) == str and ty.length != 'null-terminated':
            if optional_lengths and ty.length in optional_lengths:
                if ty.optional:
                    return 'nil'
                else:
                    return '[]'
        elif ty.optional or forced:
            if ty.pointer_to and not ty.length:
                return 'nil'
            elif ty.length == 'null-terminated':
                return 'nil'
            elif ty.name in tc.NUMERIC_TYPE:
                return '0'
            elif ty.name == 'VkBool32':
                return 'false'
            elif ty.name in self.imported_enums:
                return '.init(rawValue: 0)!'
            elif ty.name in self.imported_option_sets:
                return '[]'
            elif ty.name in self.imported_classes:
                return 'nil'

        # if this is a struct and the init of the struct can be written as .init()
        if swift_type and c_type.type_name in self.imported_structs and not c_type.length:
            struct = self.imported_structs[c_type.type_name]
            can_omit = True
            for member in struct.members:
                if member.default_value is None:
                    can_omit = False
                    break
            if can_omit:
                return f'{swift_type}()'

        return None


# excluding the one with pnext
def get_output_params(command: CCommand) -> list[CMember]:
    output_params: list[CMember] = []
    for param in command.params:
        if param.type.pointer_to and not param.type.pointer_to.const:
            if param.type.pointer_to.name == 'void':
                if param.type.length:
                    output_params.append(param)
            else:
                output_params.append(param)
    return output_params


def is_string_convertible(type_: CType) -> bool:
    return (type_.pointer_to and type_.pointer_to.name == 'char' and type_.length == 'null-terminated'
            and type_.pointer_to.const)


def is_array_convertible(type_: CType, ignore_const: bool = False) -> bool:
    return (type_.pointer_to and (type_.pointer_to.const or ignore_const)
            and type_.length and type_.length != 'null-terminated' and 'latexmath' not in type_.length
            and type_.pointer_to.name != 'void')


def remove_vk_prefix(string: str) -> str:
    if string[:2].lower() == 'vk':
        string = string[2:]
    return string.lstrip('_')


def snake_to_pascal(string: str) -> str:
    parts = string.lower().split('_')
    parts = map(lambda p: p[0].upper() + p[1:], parts)
    return ''.join(parts)


def snake_to_camel(string: str) -> str:
    pascal = snake_to_pascal(string)
    return pascal[0].lower() + pascal[1:]


def get_member_name(c_name: str, c_type: CType) -> str:
    if c_type.pointer_to and c_name.startswith('p'):
        return get_member_name(c_name[1].lower() + c_name[2:], c_type.pointer_to)
    return c_name
