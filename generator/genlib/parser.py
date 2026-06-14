from __future__ import annotations
import re
from xml.etree.ElementTree import Element, ElementTree, parse
from itertools import zip_longest
from dataclasses import dataclass, field


@dataclass(eq=False)
class CEnum:
    @dataclass(eq=False)
    class Case:
        name: str
        value: str

    name: str
    cases: list[CEnum.Case] = field(default_factory=list)
    protect: str | None = None


@dataclass(eq=False)
class CBitmask:
    name: str
    enum: CEnum | None = None
    is64: bool = False
    protect: str | None = None


@dataclass(eq=False)
class CType:
    name: str | None = None
    pointer_to: CType | None = None
    array_of: CType | None = None
    const: bool = False
    length: str | int | list[int] | None = None
    optional: bool = False

    @property
    def type_name(self) -> str | None:
        if self.pointer_to:
            return self.pointer_to.type_name
        if self.array_of:
            return self.array_of.type_name
        return self.name


@dataclass(eq=False)
class CMember:
    name: str
    type: CType
    values: list[str] = field(default_factory=list)
    noautovalidity: bool = False


@dataclass(eq=False)
class CStruct:
    name: str
    members: list[CMember] = field(default_factory=list)
    returned_only: bool = False
    struct_extends: list[str] = field(default_factory=list)
    is_chainable: bool = False
    protect: str | None = None


@dataclass(eq=False)
class CHandle:
    name: str
    parent: CHandle | None = None
    protect: str | None = None


@dataclass(eq=False)
class CCommand:
    name: str
    return_type: CType
    params: list[CMember] = field(default_factory=list)
    protect: str | None = None


@dataclass(eq=False)
class CExtension:
    name: str
    requires: list[CRequire]
    supported: str | None = None
    platform: str | None = None
    protect: str | None = None    
    # supported_apis: list[str] = field(default_factory=list)
    
@dataclass(eq=False)
class CFeature:
    name: str
    api: list[str]
    requires: list[CRequire]
    apitype: str | None = None

@dataclass(eq=False)
class CRequire:
    # supported_apis: list[str] = field(default_factory=list)
    # TODO: comment tags
    commands: list[str] = field(default_factory=list)
    enum_cases: dict[str, list[CEnum.Case]] = field(default_factory=dict)
    types: list[str] = field(default_factory=list)



@dataclass(eq=False)
class CAlias:
    name: str
    alias: str
    protect: str | None = None


class CContext:
    def __init__(self) -> None:
        self.platform_protects: dict[str, str] = {}
        self.extension_tags: list[str] = []
        self.extensions: list[CExtension] = []
        self.features: list[CFeature] = []
        self.handles: list[CHandle] = []
        self.enums: list[CEnum] = []
        self.bitmasks: list[CBitmask] = []
        self.structs: list[CStruct] = []
        self.commands: list[CCommand] = []
        self.aliases: list[CAlias] = []
        self.ignored_names: list[str] = []

    def parse(self, source):
        tree = parse(source)
        # TODO: parse feature block instead of doing this
        self.parse_tree(tree)

    def parse_tree(self, tree: ElementTree):
        self.parse_platforms(tree)
        self.parse_extension_tags(tree)
        self.parse_extensions(tree)
        self.parse_features(tree)

        known_enum_extensions = self.get_known_enum_extensions()
        # print(*self.ignored_names, sep="\n")
        # print(len(self.ignored_names))

        # types
        # not seen here: include, define, funcpointer
        self.parse_handles(tree)
        self.parse_enums(tree, known_enum_extensions)
        self.parse_bitmasks(tree, known_enum_extensions)
        self.parse_enum_extends(tree)
        self.parse_structs(tree)
        self.parse_commands(tree)

    def parse_platforms(self, tree: ElementTree):
        for platform in tree.findall('./platforms/platform'):
            self.platform_protects[platform.attrib['name']
                                   ] = platform.attrib['protect']

    def parse_features(self, tree: ElementTree):
        for feature in tree.findall('./feature'):
            requires: list[CRequire] = []
            should_ignore_feature = self.should_ignore(feature)
            for e_require in feature.findall('./require'):
                should_ignore = self.should_ignore(e_require) or should_ignore_feature
                requires.append(self.parse_require_block(e_require, should_ignore))

            apitype = None
            if apitype in feature.attrib:
                apitype = feature.attrib['apitype']

            c_feature = CFeature(
                name=feature.attrib['name'],
                api=feature.attrib['api'].split(","),
                requires=requires,
                apitype=apitype
            )
            self.features.append(c_feature)

    def parse_enum_extends(self, tree: ElementTree):
        enums = {e.name: e for e in self.enums}
        bitmask_flags = {b.enum.name: b.enum for b in self.bitmasks if b.enum}

        for e_enum in tree.findall('./feature/require/enum[@extends]'):
            extension_number = None
            if 'extnumber' in e_enum.attrib:
                extension_number = int(e_enum.attrib['extnumber'])
            if 'alias' in e_enum.attrib:
                continue
            value = parse_enum_value(e_enum, extension_number)
            c_case = CEnum.Case(e_enum.attrib['name'], value)
            extends = e_enum.attrib['extends']

            enum: CEnum | None = None
            if extends in enums:
                enum = enums[extends]
            elif extends in bitmask_flags:
                enum = bitmask_flags[extends]

            if not enum:
                print(
                    f"warning: enum {e_enum.attrib['extends']} not found (value={value})")
                continue

            # check for duplicated case
            for c in enum.cases:
                if c.name == c_case.name:
                    if c.value == c_case.value:
                        break
                    else:
                        print(
                            f"warning: duplicated enum case with different values: {enum.name}{c.name} = {c.value}, {c_case.value}")
            else:
                enum.cases.append(c_case)

    def parse_extensions(self, tree: ElementTree):
        for e_extension in tree.findall('./extensions/extension'):
            supported = e_extension.attrib['supported']
            
            should_ignore_extension = supported in ('vulkansc', 'disabled')

            extension_number = int(e_extension.attrib['number'])
            name = e_extension.attrib['name']
            platform = e_extension.get('platform')

            requires: list[CRequire] = []
            for e_require in e_extension.findall('./require'):
                should_ignore = self.should_ignore(e_require) or should_ignore_extension
                requires.append(self.parse_require_block(e_require, should_ignore, extension_number))

            c_extension = CExtension(
                name=name,
                requires=requires,
                supported=supported,
                platform=platform,
                protect=self.platform_protects[platform] if platform else None,
            )
            self.extensions.append(c_extension)

    def parse_extension_tags(self, tree: ElementTree):
        for tag in tree.findall('./tags/tag'):
            self.extension_tags.append(tag.attrib['name'])

    def parse_require_block(self, tree: Element, ignored: bool, extension_number: int | None = None, ) -> CRequire:
        types: list[str] = []
        for t in tree.findall('./type'):
            name = t.attrib['name']
            types.append(name)
            if ignored:
                self.ignored_names.append(name)

        commands: list[str] = []
        for c in tree.findall('./command'):
            name = c.attrib['name']
            commands.append(name)
            if ignored:
                self.ignored_names.append(name)

        # we wont skip enum case unless it case name colission, handled in import_enums 

        # this may include bitmask flag too
        enum_cases: dict[str, list[CEnum.Case]] = {}
        for e_enum in tree.findall('./enum[@extends]'):
            if 'alias' in e_enum.attrib:
                continue
            value = parse_enum_value(e_enum, extension_number)
            c_case = CEnum.Case(e_enum.attrib['name'], value)
            extends = e_enum.attrib['extends']

            enum_cases.setdefault(extends, []).append(c_case)

        return CRequire(enum_cases=enum_cases, commands=commands, types=types)

    def get_known_enum_extensions(self):
        requires: list[CRequire] = []
        for extension in self.extensions:
            requires.extend(extension.requires)
        for features in self.features:
            requires.extend(features.requires)

        known_enum_extensions: dict[str, list[CEnum.Case]] = {}
        for r in requires:
            for enum, cases in r.enum_cases.items():
                known_enum_extensions.setdefault(enum, []).extend(cases)

        return known_enum_extensions
        

    def parse_handles(self, tree: ElementTree):
        handles: dict[str, CHandle] = {}
        parents: dict[str, str] = {}

        for e_handle in tree.findall('./types/type[@category="handle"]'):
            if 'alias' in e_handle.attrib:
                handle_name = e_handle.attrib['name']
                alias = handles[e_handle.attrib['alias']]
                protect = self.find_protect(type_=handle_name)
                self.aliases.append(CAlias(handle_name, alias.name, protect))
                if alias.protect and not protect:
                    alias.protect = None
                continue

            handle_name: str = e_handle.find('./name').text
            if self.should_ignore(e_handle, name=handle_name):
                continue

            handle = CHandle(handle_name, protect=self.find_protect(type_=handle_name))
            self.handles.append(handle)
            handles[handle_name] = handle
            parents[handle_name] = e_handle.get('parent')

        for handle_name, handle in handles.items():
            try:
                handle.parent = handles[parents[handle_name]]
            except KeyError:
                pass

    def parse_enums(self, tree: ElementTree, known_enum_extensions: dict[str, list[CEnum.Case]]):    
        for e_enum in tree.findall('./enums[@type="enum"]'):
            enum_name = e_enum.attrib['name']

            # if self.should_ignore(e_enum, name=enum_name):
            #     continue

            cases = {}
            for e_case in e_enum.findall('./enum'):
                if 'alias' in e_case.attrib:
                    continue
                cases[e_case.attrib['name']] = parse_enum_value(e_case)

            # if extension.supported in ('vulkansc', 'disabled') or extension.platform:
            #     continue

            if enum_name in known_enum_extensions:
                ext_cases = known_enum_extensions[enum_name]
                for ext_case in ext_cases:
                    cases[ext_case.name] = ext_case.value                

            c_enum = CEnum(enum_name, [CEnum.Case(name, value)
                           for name, value in cases.items()], protect=self.find_protect(type_=enum_name))
            self.enums.append(c_enum)

    def parse_bitmasks(self, tree: ElementTree, known_enum_extensions: dict[str, list[CEnum.Case]]):
        for e_bitmask in tree.findall('./types/type[@category="bitmask"]'):
            if 'alias' in e_bitmask.attrib:
                continue

            bitmask_name: str = e_bitmask.find('./name').text

            # if self.should_ignore(e_bitmask):
            #     continue

            bitvalues = e_bitmask.get('bitvalues')
            c_bitmask = CBitmask(bitmask_name, is64=bitvalues is not None,
                                 protect=self.find_protect(type_=bitmask_name))

            name = e_bitmask.get('requires') or bitvalues
            if name:
                cases = {}
                e_enum: Element = tree.find(f'./enums[@name="{name}"]')
                for e_case in e_enum.findall('./enum'):
                    if 'alias' in e_case.attrib:
                        continue
                    cases[e_case.attrib['name']] = parse_enum_value(e_case)

                if name in known_enum_extensions:
                    ext_cases = known_enum_extensions[name]
                    for ext_case in ext_cases:
                        cases[ext_case.name] = ext_case.value                

                c_bitmask.enum = CEnum(name, [CEnum.Case(
                    name, value) for name, value in cases.items()])

            self.bitmasks.append(c_bitmask)

    def parse_structs(self, tree: ElementTree):
        for struct in tree.findall('./types/type[@category="struct"]'):
            if 'alias' in struct.attrib:
                continue
            
            name = struct.attrib['name']
            if self.should_ignore(struct, name=name):
                continue
            
            extends: list[str] = []
            if 'structextends' in struct.attrib:
                for ext_name in struct.attrib['structextends'].split(","):
                    if self.should_ignore(name=ext_name):  # wtf is this
                        continue
                    extends.append(ext_name)

            c_struct = CStruct(name, returned_only=struct.get(
                'returnedonly') == 'true', struct_extends=extends, protect=self.find_protect(type_=struct.attrib['name']))

            for member in struct.findall('./member'):
                if self.should_ignore(member):
                    continue
                member = parse_member(member, tree)
                c_struct.members.append(member)
                # TODO: checl pNext type, maybe
                if member.name == "pNext":
                    c_struct.is_chainable = True

            self.structs.append(c_struct)

    def parse_commands(self, tree: ElementTree):
        for e_command in tree.findall('./commands/command'):
            if 'alias' in e_command.attrib:
                continue

            proto = parse_member(e_command.find('./proto'), tree)

            if self.should_ignore(e_command, name=proto.name):
                continue

            c_command = CCommand(proto.name, proto.type,
                                 protect=self.find_protect(command=proto.name))
            for e_param in e_command.findall('./param'):
                if self.should_ignore(e_param):
                    continue
                c_command.params.append(parse_member(e_param, tree))

            self.commands.append(c_command)

    def find_extension(self, type_: str | None = None, command: str | None = None) -> CExtension | None:
        for extension in self.extensions:
            for require in extension.requires:
                if (type_ and type_ in require.types) or (command and command in require.commands):
                    return extension

    def find_protect(self, type_: str | None = None, command: str | None = None) -> str | None:
        extension = self.find_extension(type_, command)
        if extension:
            return extension.protect

    def should_ignore(self, node: Element | None = None, name: str | None = None) -> bool:
        if node and parse_api(node) == 'vulkansc':
            return True
            
        if name and name in self.ignored_names:
            # print(f'ignored: {name}')
            return True
        
        return False


def parse_enum_value(e_enum: Element, extension_number: int | None = None) -> str:
    if 'offset' in e_enum.attrib:
        if 'extnumber' in e_enum.attrib:
            extension_number = int(e_enum.attrib['extnumber'])
        value = 1000000000 + (extension_number - 1) * \
            1000 + int(e_enum.attrib['offset'])
        if e_enum.get('dir') == '-':
            value *= -1
        return str(value)
    elif 'bitpos' in e_enum.attrib:
        return str(2 ** int(e_enum.attrib['bitpos']))
    else:
        return e_enum.attrib['value']


def parse_member(member: Element, tree: ElementTree) -> CMember:
    e_type = member.find('./type')
    type_string = (member.text or '') + e_type.text + (e_type.tail or '')

    e_name = member.find('./name')
    name = e_name.text

    array_size: int | list[int] = None
    if e_name.tail and e_name.tail.startswith('['):
        match = re.findall(r'\[\s*(\d+)\s*\]', e_name.tail)
        if match:
            if len(match) == 1:
                array_size = int(match[0])
            else:
                array_size = [int(i) for i in match]
        else:
            e_enum = member.find('./enum')
            array_size = int(
                tree.find(f'./enums/enum[@name="{e_enum.text}"]').attrib['value'])

    type_strings = type_string.split('*')

    first_type = type_strings[0].split()
    is_const = False
    if 'const' in first_type:
        first_type.remove('const')
        is_const = True
    if 'struct' in first_type:
        first_type.remove('struct')
    c_type = CType(name=' '.join(first_type), const=is_const)

    pointers = type_strings[1:]
    lengths = member.attrib['len'].split(
        ',') if 'len' in member.attrib and member.attrib['len'] != '1' else []
    optionals = member.attrib['optional'].split(
        ',') if 'optional' in member.attrib else []

    if len(optionals) > len(pointers):
        c_type.optional = optionals.pop(-1) == 'true'

    lengths = reversed(lengths[:len(pointers)])
    optionals = reversed(optionals[:len(pointers)])

    for pointer, length, optional in zip_longest(pointers, lengths, optionals):
        c_type = CType(pointer_to=c_type, length=length, const='const' in pointer,
                       optional=optional == 'true')

    if array_size is not None:
        c_type = CType(array_of=c_type, length=array_size)

    values_string = member.get('values')
    values = values_string.split(',') if values_string else []
    noautovalidity = 'noautovalidity' in member.attrib and member.attrib[
        'noautovalidity'] == 'true'

    return CMember(name, c_type, values, noautovalidity)


def parse_api(element: Element) -> str | None:
    if 'api' in element.attrib:
        return element.attrib['api']
    return None

# api attribute can appear in a enum, type, member, command, param, feature, require, [remove, deprecate]
