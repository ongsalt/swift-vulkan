from __future__ import annotations
from contextlib import contextmanager
from typing import TextIO
from .importer import SwiftEnum, SwiftOptionSet, SwiftStruct, SwiftClass, SwiftCommand, SwiftAlias, DispatchTable
from . import typeconversion as tc


class BaseGenerator:
    def __init__(self, stream: TextIO):
        self.stream = stream
        self.indent_size = 0

    def write(self, text: str):
        indent = '    ' * self.indent_size
        for line in text.splitlines(keepends=True):
            self.stream.write(indent + line)
        self.linebreak()

    def linebreak(self, n: int = 1):
        self.stream.write('\n' * n)

    def __lshift__(self, text: str):
        self.write(text)

    @contextmanager
    def indent(self, prepend: str | None = None, append: str | None = None):
        if prepend is not None:
            self << prepend
        self.indent_size += 1
        yield
        self.indent_size -= 1
        if append is not None:
            self << append


class Generator(BaseGenerator):
    def generate_imports(self):
        # the C handles/function pointers are not Sendable-audited
        self << '@preconcurrency import CVulkan'
        self.linebreak()

    def generate_enum(self, enum: SwiftEnum):
        if enum.protect:
            self << f'#if {enum.protect}'
        # an enum with no cases cannot declare a raw type
        if len(enum.cases) == 0:
            self << f'public typealias {enum.name} = EmptyEnum<{enum.raw_type}>'
            # There are no error enum with 0 case, in fact there is only one error enum
            if enum.protect:
                self << '#endif'
            self.linebreak()
            return
        types = [enum.raw_type] if len(enum.cases) != 0 else []
        types.append('Sendable')
        if enum.error:
            types.append('Error')
        with self.indent(f'public enum {enum.name}: {", ".join(types)} {{', '}'):
            for case in enum.cases:
                self << f'case {safe_name(case.name)} = {case.value}'
        if enum.protect:
            self << '#endif'
        self.linebreak()

    def generate_option_set(self, option_set: SwiftOptionSet):
        if option_set.protect:
            self << f'#if {option_set.protect}'
        with self.indent(f'public struct {option_set.name}: OptionSet, StringConvertibleOptionSet, Sendable {{', '}'):
            self << f'public let rawValue: {option_set.raw_type}'
            self.linebreak()
            if option_set.cases:
                for case in option_set.cases:
                    # to silence compiler warning
                    if int(case.value, base=16 if 'x' in case.value else 10) == 0:
                        self << f'public static let {safe_name(case.name)}: {option_set.name}  = []'
                    else:
                        self << f'public static let {safe_name(case.name)} = {option_set.name}(rawValue: {case.value})'
                self.linebreak()
            with self.indent(f'public init(rawValue: {option_set.raw_type}) {{', '}'):
                self << 'self.rawValue = rawValue'
            self.linebreak()
            with self.indent('static let descriptions: [(Self, String)] = [', ']'):
                for case in option_set.cases:
                    self << f'(.{case.name}, "{case.name}"),'
        if option_set.protect:
            self << '#endif'
        self.linebreak()

    def generate_struct(self, struct: SwiftStruct):
        if struct.protect:
            self << f'#if {struct.protect}'

        protocols = [] 
        if struct.c_struct.is_chainable:
            # we need to walk the entire thing to generate correct ChainableBase/Chainable distinction
            protocols.append('ChainableBase')
        protocols += struct.protocols
        if len(protocols) == 0:
            protocols.append('CStructConvertible')

        with self.indent(f'public struct {struct.name}: {", ".join(protocols)} {{', '}'):
            self << f'public typealias CStruct = {struct.c_struct.name}'
            self.linebreak()
            for member in struct.members:
                static = ' static' if member.is_static else ''
                value = f' = {member.default_value}' if member.is_static and member.default_value else ''
                self << f'public{static} let {safe_name(member.name)}: {member.type}{value}'
            self.linebreak()
            if not struct.c_struct.returned_only:
                self.generate_struct_init(struct)
                self.linebreak()
            # TODO: update generate_struct_c_to_swift_method
            # fuck refcount semantics
            self.generate_struct_c_to_swift_method(struct)
            self.linebreak()
            self.generate_struct_swift_to_c_method(
                struct, is_chainable_base=struct.c_struct.is_chainable)
            if struct.c_struct.is_chainable:
                self.linebreak()
                self.generate_struct_chain_push_method(struct)
        if struct.protect:
            self << '#endif'
        if struct.c_struct.is_chainable:
            self.linebreak()
            self << f'public protocol {struct.extension_name}: Chainable {{}}'
        self.linebreak()
    
    def generate_struct_init(self, struct: SwiftStruct):
        params = []
        for member in struct.members:
            if member.is_static:
                continue
            escaping = '@escaping ' if member.is_closure else ''
            default_value = f' = {member.default_value}' if member.default_value else ''
            params.append(
                f'{member.name}: {escaping}{member.type}{default_value}')

        with self.indent(f'public init({", ".join(params)}) {{', '}'):
            for member in struct.members:
                if member.is_static:
                    continue
                self << f'self.{member.name} = {member.name}'

    def generate_struct_c_to_swift_method(self, struct: SwiftStruct):
        params = [f'cStruct: {struct.c_struct.name}']
        if struct.table_type:
            params.append(f'table: UnsafePointer<{struct.table_type}>')

        c_values = {
            member.name: f'cStruct.{member.name}' for member in struct.c_struct.members}

        classes = {'table': 'table'} if struct.table_type else {}
        swift_values = struct.member_conversions.get_swift_values(
            c_values, classes)
        swift_values['throws'] = ''

        with self.indent(f'public init({", ".join(params)}) {{', '}'):
            for member in struct.members:
                if not member.is_static:
                    self << f'self.{member.name} = {swift_values[member.name]}'

    def generate_struct_swift_to_c_method(self, struct: SwiftStruct, is_chainable_base=False):
        with self.indent('public func withCStruct<R, E: Error>(' +
                         ('pNext: UnsafeRawPointer?, ' if is_chainable_base else '') +
                         f'_ body: (UnsafePointer<{struct.c_struct.name}>) throws(E) -> R' +
                         ') throws(E) -> R {', '}'):

            swift_values = {
                member.name: f'self.{member.name}' if not member.is_static else f'Self.{member.name}' for member in struct.members}
            c_values = struct.member_conversions.get_c_values(swift_values)
            closures = struct.member_conversions.get_c_closures(swift_values, throws=' throws(E)')

            with self.closures(closures, throws=True):
                self << f'var cStruct = {struct.c_struct.name}()'
                for member in struct.c_struct.members:
                    self << f'cStruct.{member.name} = {c_values[member.name]}'
                self << 'return try body(&cStruct)'

    def generate_struct_chain_push_method(self, struct: SwiftStruct):
        with self.indent(f'public func push<Extension: {struct.extension_name}>(_ ext: Extension) -> Chain<Self, Extension> {{', '}'):
            self << 'Chain(base: base, next: ext)'


    def generate_class(self, cls: SwiftClass):
        if cls.protect:
            self << f'#if {cls.protect}'
        # OpaquePointer and UnsafePointer are not Sendable; a handle is just an address
        protocols = ['Handle'] if cls.c_handle else []
        protocols.append('@unchecked Sendable')
        with self.indent(f'public struct {cls.name}: {", ".join(protocols)} {{', '}'):
            if cls.obj_type:
                self << f'public static let objectType: ObjectType = .{cls.obj_type}'
            if cls.c_handle:
                self << f'public let handle: {cls.c_handle.name}'
            if cls.table:
                self << f'public let table: UnsafePointer<{cls.table.name}>'

            self.linebreak()
            self.generate_class_init(cls)

            # Entry has no vkDestroyEntry to hang the deallocation off
            if cls.owns_table and not cls.c_handle:
                self.linebreak()
                with self.indent('public func destroy() {', '}'):
                    self << 'UnsafeMutablePointer(mutating: self.table).deallocate()'

            for command in cls.commands:
                self.linebreak()
                self.generate_command(command, cls)

        if cls.protect:
            self << '#endif'
        self.linebreak()

    def generate_class_init(self, cls: SwiftClass):
        table = cls.table

        # Entry builds its own table straight from the loader; every other table is
        # built by the command that creates the handle (vkCreateInstance/vkCreateDevice)
        if table and table.owner:
            owner_name, owner_type = table.owner
            with self.indent(f'public init({owner_name}: {owner_type}) {{', '}'):
                self << f'let table = UnsafeMutablePointer<{table.name}>.allocate(capacity: 1)'
                self << f'table.initialize(to: {table.name}({owner_name}: {owner_name}))'
                self << 'self.table = UnsafePointer(table)'
            return

        params = []
        if cls.c_handle:
            params.append(f'handle: {cls.c_handle.name}!')
        if table:
            params.append(f'table: UnsafePointer<{table.name}>')

        with self.indent(f'public init({", ".join(params)}) {{', '}'):
            if cls.c_handle:
                self << 'self.handle = handle'
            if table:
                self << 'self.table = table'

    def generate_command(self, command: SwiftCommand, cls: SwiftClass):
        if command.protect:
            self << f'#if {command.protect}'
        swift_values = {param.name: param.name for param in command.params}
        # the receiver is the only handle parameter that is not a Swift parameter
        swift_values.update({param: 'self' for param in command.class_params})

        throws_string = ' throws(Result)' if command.throws else ''

        closures = command.param_conversions.get_c_closures(swift_values, throws=throws_string)
        c_values = command.param_conversions.get_c_values(swift_values)

        # a command can only produce handles dispatched by the table it was dispatched
        # through, so the receiver's table is always the right one to hand out
        classes = {'table': 'self.table'}
        if command.creates_table:
            classes['table'] = 'UnsafePointer(table)'

        params: list[tuple[str, str]] = []
        # make x{Info} first params
        for param in command.params:
            default_value = f' = {param.default_value}' if param.default_value and 'Chainable<' not in param.type and 'AnyChainableArray<' not in param.type else ''
            if param.name.lower().endswith("info") or param.name.lower().endswith("infos"):
                params.append(
                    (f'_ {param.name}', f'{param.type}{default_value}'))
            else:
                params.append((param.name, f'{param.type}{default_value}'))


        return_type = command.return_type
        generic_string = ''
        where_string = ''
        if command.chainable_out_parameters:
            where_string = f' where repeat each Ext: {return_type}Extension & OutStruct'
            return_type = f'({return_type}, repeat each Ext)'
            generic_string = '<each Ext>'
            params.append(('returning _', 'repeat (each Ext).Type'))

        params.sort(key=lambda x: 0 if 'info' in x[0].lower() else 1)
        param_string = ', '.join(f'{p[0]}: {p[1]}' for p in params)

        c_name = command.c_command.name
        # every entry is loaded as an IUO, except the loader itself, which the table
        # stores non-optionally
        unwrap = '' if cls.table and c_name == cls.table.loader[0] else '!'
        with self.indent(f'public func {command.name}{generic_string}({param_string})'
                         f'{throws_string} -> {return_type}{where_string} {{', '}'):
            # hoisted out of the closure nest below: one load, and it keeps the
            # type checker from choking on deeply nested generic closures
            self << f'let {c_name} = self.table.pointee.{c_name}{unwrap}'

            # the hoist makes the body multi-statement, so the outermost expression
            # no longer gets an implicit return
            pending_return = ['return ']

            def lead() -> str:
                return pending_return.pop() if pending_return else ''

            with self.closures(closures, throws=command.throws,
                               prefix=lead() if closures else ''):
                params = []
                for param in command.c_command.params:
                    if param.name == command.output_param:
                        if isinstance(command.return_conversion, tc.ArrayConversion):
                            params.append('out.baseAddress')
                        elif command.chainable_out_parameters:
                            params.append('out')
                        else:
                            params.append('&out')
                    elif param.name == command.enumeration_pointer_param:
                        params.append(command.enumeration_pointer_param)
                    elif param.name == command.enumeration_count_param:
                        params.append(command.enumeration_count_param)
                    else:
                        params.append(c_values[param.name])
                param_string = ', '.join(params)
                call_string = f'{c_name}({param_string})'

                if command.output_param:
                    if isinstance(command.return_conversion, tc.ArrayConversion):
                        conversion = command.return_conversion
                        if conversion.swift_element_template:
                            element_value = conversion.get_swift_element_value(
                                '$0', classes=classes)
                            map_string = f'.map {{ {element_value} }}'
                        else:
                            map_string = ''
                        length_path = conversion.length.split('->')
                        count_value = c_values[length_path[0]]
                        if len(length_path) > 1:
                            count_value = '.'.join(
                                [count_value, 'pointee'] + length_path[1:]
                            )
                        with self.closures([(
                                f'Array<{command.output_param_implicit_type}>'
                                f'(unsafeUninitializedCapacity: Int({count_value})) {{ '
                                f'out, initializedCount{throws_string} in',
                                f'}}{map_string}'
                        )], throws=command.throws, prefix=lead()):
                            if command.throws:
                                with self.indent('try checkResult(', ')'):
                                    self << call_string
                            else:
                                self << call_string
                            self << 'initializedCount = out.count'
                    elif command.chainable_out_parameters:
                        chain_string = f'withOutStructureChain(base: {command.return_type}.self, chaining: (repeat (each Ext).self)) {{ out{throws_string} in'
                        if command.throws:
                            with self.indent(f'{lead()}try {chain_string}', '}'):
                                with self.indent(f'try checkResult(', ')'):
                                    self << call_string
                        else:
                            with self.indent(lead() + chain_string, '}'):
                                self << call_string
                    else:
                        if command.unwrap_output_param:
                            self << f'var out: {command.output_param_implicit_type}!'
                        elif command.output_param_custom_initializer:
                            self << f'var out = {command.output_param_custom_initializer}'
                        else:
                            self << f'var out = {command.output_param_implicit_type}()'
                            if command.output_param_structure_type:
                                self << f'out.sType = {command.output_param_structure_type}'
                        if command.throws:
                            with self.indent('try checkResult(', ')'):
                                self << call_string
                        else:
                            self << call_string
                        if command.creates_table:
                            self.generate_table_allocation(command.creates_table)
                        self << f'return {command.return_conversion.get_swift_value("out", classes=classes)}'

                elif command.enumeration_pointer_param:
                    assert isinstance(
                        command.return_conversion, tc.ArrayConversion)
                    conversion = command.return_conversion
                    if conversion.swift_element_template:
                        element_value = conversion.get_swift_element_value(
                            '$0', classes=classes)
                        map_string = f'.map {{ {element_value} }}'
                    else:
                        map_string = ''
                    try_string = 'try ' if command.throws else ''
                    enumerateFn = 'enumerateBytes' if command.enumeration_is_bytes_array else 'enumerate'
                    with self.indent(f'{lead()}{try_string}{enumerateFn} {{ {command.enumeration_pointer_param}, '
                                     f'{command.enumeration_count_param} in', f'}}{map_string}'):
                        self << call_string
                else:
                    result_string = command.return_conversion.get_swift_value(
                        call_string)
                    # a Void body needs no return, and returning would strand the
                    # table deallocation below
                    ret = '' if command.return_type == 'Void' else lead()
                    if command.throws:
                        with self.indent(f'{ret}try checkResult(', ')'):
                            self << result_string
                    else:
                        self << ret + result_string
                    if command.destroys_table:
                        self << 'UnsafeMutablePointer(mutating: self.table).deallocate()'
        if command.protect:
            self << '#endif'

    def generate_table_allocation(self, table: DispatchTable):
        loader_name, _ = table.loader
        params = [f'{loader_name}: self.table.pointee.{loader_name}']
        if table.param:
            param_name, _ = table.param
            params.append(f'{param_name}: out')
        self << f'let table = UnsafeMutablePointer<{table.name}>.allocate(capacity: 1)'
        self << f'table.initialize(to: {table.name}({", ".join(params)}))'

    def generate_alias(self, alias: SwiftAlias):
        if alias.protect:
            self << f'#if {alias.protect}'
        self << f'public typealias {alias.name} = {alias.alias}'
        if alias.protect:
            self << '#endif'

    def generate_dispatch_table(self, dispatch_table: DispatchTable):
        loader_name, loader_type = dispatch_table.loader
        owner = dispatch_table.owner

        with self.indent(f'public struct {dispatch_table.name}: @unchecked Sendable {{', '}'):
            if owner:
                # keeps the dynamic library alive for as long as the function
                # pointers loaded out of it
                self << f'public let {owner[0]}: {owner[1]}'
            # stored so a child table can be loaded from it
            self << f'public let {loader_name}: {loader_type}'
            for command in dispatch_table.commands:
                if command.protect:
                    self << f'#if {command.protect}'
                self << f'public let {command.name}: PFN_{command.name}!'
                if command.protect:
                    self << '#endif'
            self.linebreak()

            if owner:
                args = [f'{owner[0]}: {owner[1]}']
            else:
                args = [f'{loader_name}: {loader_type}']
            if dispatch_table.param:
                param_name, param_type = dispatch_table.param
                args.append(f'{param_name}: {param_type}')
            else:
                param_name = 'nil'

            with self.indent(f'init({", ".join(args)}) {{', '}'):
                if owner:
                    self << f'let {loader_name} = {owner[0]}.{loader_name}'
                    self << f'self.{owner[0]} = {owner[0]}'
                self << f'self.{loader_name} = {loader_name}'
                for command in dispatch_table.commands:
                    if command.protect:
                        self << f'#if {command.protect}'
                    self << f'self.{command.name} = unsafeBitCast' \
                        f'({loader_name}({param_name}, "{command.name}"), to: PFN_{command.name}?.self)'
                    if command.protect:
                        self << '#endif'
        self.linebreak()

    def generate_chain_extension(self, struct: SwiftStruct):
        if struct.protect:
            self << f'#if {struct.protect}'
        with self.indent(f'extension Chain where Base == {struct.name} {{', '}'): 
            with self.indent(f'public func push<NewValue: {struct.extension_name}>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {{', '}'): 
                self << 'Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))'
        if struct.protect:
            self << '#endif'
        self.linebreak()

    @contextmanager
    def closures(self, closures: list[tuple[str, str]], throws: bool = False, prefix: str = ''):
        for i, closure in enumerate(closures):
            lead = prefix if i == 0 else ''
            if throws:
                self << lead + 'try ' + closure[0]
            else:
                self << lead + closure[0]
            self.indent_size += 1
        yield
        for closure in reversed(closures):
            self.indent_size -= 1
            self << closure[1]


def safe_name(name: str) -> str:
    if name in ('repeat', 'default', 'static', 'import'):
        return f'`{name}`'
    return name


