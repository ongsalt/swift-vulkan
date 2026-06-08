from contextlib import contextmanager
from .importer import SwiftEnum, SwiftOptionSet, SwiftStruct, SwiftClass, SwiftCommand, SwiftAlias, DispatchTable
from typing import Literal, TextIO, List, Tuple, Dict
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
    def indent(self, prepend: str = None, append: str = None):
        if prepend is not None:
            self << prepend
        self.indent_size += 1
        yield
        self.indent_size -= 1
        if append is not None:
            self << append


class Generator(BaseGenerator):
    def generate_imports(self):
        self << 'import CVulkan'
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
        with self.indent(f'public struct {option_set.name}: OptionSet, StringConvertibleOptionSet {{', '}'):
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
                self << f'public let {safe_name(member.name)}: {member.type}'
            self.linebreak()
            if not struct.c_struct.returned_only:
                self.generate_struct_init(struct)
                self.linebreak()
            self.generate_struct_c_to_swift_method(struct)
            # TODO: update generate_struct_c_to_swift_method
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
            escaping = '@escaping ' if member.is_closure else ''
            default_value = f' = {member.default_value}' if member.default_value else ''
            params.append(
                f'{member.name}: {escaping}{member.type}{default_value}')

        with self.indent(f'public init({", ".join(params)}) {{', '}'):
            for member in struct.members:
                self << f'self.{member.name} = {member.name}'

    def generate_struct_c_to_swift_method(self, struct: SwiftStruct):
        params = [f'cStruct: {struct.c_struct.name}']
        parent_classes = struct.parent_classes

        for p in parent_classes:
            params.append(f'{p.reference_name}: {p.name}')

        c_values = {
            member.name: f'cStruct.{member.name}' for member in struct.c_struct.members}
        
        classes = {p.reference_name: p.reference_name for p in parent_classes}
        swift_values = struct.member_conversions.get_swift_values(
            c_values, classes)

        with self.indent(f'init({", ".join(params)}) {{', '}'):
            for member in struct.members:
                self << f'self.{member.name} = {swift_values[member.name]}'

    def generate_struct_swift_to_c_method(self, struct: SwiftStruct, is_chainable_base=False):
        with self.indent('public func withCStruct<R>(' +
                         ('pNext: UnsafeRawPointer?, ' if is_chainable_base else '') +
                         f'_ body: (UnsafePointer<{struct.c_struct.name}>) throws -> R' +
                         ') rethrows -> R {', '}'):

            swift_values = {
                member.name: f'self.{member.name}' for member in struct.members}
            c_values = struct.member_conversions.get_c_values(swift_values)
            closures = struct.member_conversions.get_c_closures(swift_values)

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
        protocol_string = ': _HandleContainer' if cls.c_handle else ''
        with self.indent(f'public class {cls.name}{protocol_string} {{', '}'):
            if cls.c_handle:
                self << f'let handle: {cls.c_handle.name}?'
            if cls.parent:
                self << f'public let {cls.parent.reference_name}: {cls.parent.name}'
            if cls.dispatch_table:
                self << f'public let dispatchTable: {cls.dispatch_table.name}'

            self.linebreak()
            self.generate_class_init(cls)

            for command in cls.commands:
                self.linebreak()
                self.generate_command(command, cls)

        if cls.protect:
            self << '#endif'
        self.linebreak()

    def generate_class_init(self, cls: SwiftClass):
        params = []
        if cls.c_handle:
            params.append(f'handle: {cls.c_handle.name}!')
        if cls.parent:
            params.append(f'{cls.parent.reference_name}: {cls.parent.name}')

        with self.indent(f'public init({", ".join(params)}) {{', '}'):
            if cls.c_handle:
                self << 'self.handle = handle'
            if cls.parent:
                self << f'self.{cls.parent.reference_name} = {cls.parent.reference_name}'
            if cls.dispatch_table:
                loader_name, _ = cls.dispatch_table.loader
                params = [
                    f'{loader_name}: {get_dispatch_table_path(cls, cls.dispatcher)}.{loader_name}']
                if cls.dispatch_table.param:
                    param_name, _ = cls.dispatch_table.param
                    params.append(f'{param_name}: handle')
                self << f'self.dispatchTable = {cls.dispatch_table.name}({", ".join(params)})'

    def generate_command(self, command: SwiftCommand, cls: SwiftClass):
        if command.protect:
            self << f'#if {command.protect}'
        swift_values = {param.name: param.name for param in command.params}
        swift_values.update(
            {param: get_class_chain(cls, target_class)
             for param, target_class in command.class_params.items()}
        )
        closures = command.param_conversions.get_c_closures(swift_values)
        c_values = command.param_conversions.get_c_values(swift_values)

        classes = get_all_class_chains(cls)
        if command.name == 'allocateCommandBuffers':
            classes['commandPool'] = 'allocateInfo.base.commandPool'
        elif command.name == 'allocateDescriptorSets':
            classes['descriptorPool'] = 'allocateInfo.base.descriptorPool'

        param_strings: list[str] = []
        for index, param in enumerate(command.params):
            default_value = f' = {param.default_value}' if param.default_value and 'Chainable<' not in param.type else ''
            if index == 0 and param.name.endswith("Info"):
                param_strings.append(
                    f'_ {param.name}: {param.type}{default_value}')
            else:
                param_strings.append(
                    f'{param.name}: {param.type}{default_value}')
        param_string = ', '.join(param_strings)

        throws_string = ' throws' if command.throws else ''

        with self.indent(f'public func {command.name}({param_string})'
                         f'{throws_string} -> {command.return_type} {{', '}'):
            with self.closures(closures, throws=command.throws):
                params = []
                for param in command.c_command.params:
                    if param.name == command.output_param:
                        if isinstance(command.return_conversion, tc.ArrayConversion):
                            params.append('out.baseAddress')
                        else:
                            params.append('&out')
                    elif param.name == command.enumeration_pointer_param:
                        params.append(command.enumeration_pointer_param)
                    elif param.name == command.enumeration_count_param:
                        params.append(command.enumeration_count_param)
                    else:
                        params.append(c_values[param.name])
                param_string = ', '.join(params)
                dispatch_path = get_dispatch_table_path(
                    cls, command.dispatcher)
                call_string = f'{dispatch_path}.{command.c_command.name}({param_string})'

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
                                f'out, initializedCount in',
                                f'}}{map_string}'
                        )], throws=command.throws):
                            if command.throws:
                                with self.indent('try checkResult(', ')'):
                                    self << call_string
                            else:
                                self << call_string
                            self << 'initializedCount = out.count'
                    else:
                        if command.unwrap_output_param:
                            self << f'var out: {command.output_param_implicit_type}!'
                        elif command.output_param_custom_initializer:
                            self << f'var out = {command.output_param_custom_initializer}'
                        else:
                            self << f'var out = {command.output_param_implicit_type}()'
                        if command.throws:
                            with self.indent('try checkResult(', ')'):
                                self << call_string
                        else:
                            self << call_string
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
                    with self.indent(f'{try_string}{enumerateFn} {{ {command.enumeration_pointer_param}, '
                                     f'{command.enumeration_count_param} in', f'}}{map_string}'):
                        self << call_string
                else:
                    result_string = command.return_conversion.get_swift_value(
                        call_string)
                    if command.throws:
                        with self.indent('try checkResult(', ')'):
                            self << result_string
                    else:
                        self << result_string
        if command.protect:
            self << '#endif'

    def generate_alias(self, alias: SwiftAlias):
        if alias.protect:
            self << f'#if {alias.protect}'
        self << f'public typealias {alias.name} = {alias.alias}'
        if alias.protect:
            self << '#endif'

    def generate_dispatch_table(self, dispatch_table: DispatchTable):
        with self.indent(f'public struct {dispatch_table.name} {{', '}'):
            for command in dispatch_table.commands:
                if command.protect:
                    self << f'#if {command.protect}'
                self << f'public let {command.name}: PFN_{command.name}!'
                if command.protect:
                    self << '#endif'
            self.linebreak()

            loader_name, loader_type = dispatch_table.loader
            args = [f'{loader_name}: {loader_type}']
            if dispatch_table.param:
                param_name, param_type = dispatch_table.param
                args.append(f'{param_name}: {param_type}')
            else:
                param_name = 'nil'

            with self.indent(f'init({", ".join(args)}) {{', '}'):
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
    def closures(self, closures: List[Tuple[str, str]], throws: bool = False):
        for closure in closures:
            if throws:
                self << 'try ' + closure[0]
            else:
                self << closure[0]
            self.indent_size += 1
        yield
        for closure in reversed(closures):
            self.indent_size -= 1
            self << closure[1]


def safe_name(name: str) -> str:
    if name in ('repeat', 'default', 'static', 'import'):
        return f'`{name}`'
    return name


def get_class_chain(current_class: SwiftClass, target_class: SwiftClass) -> str:
    chain = 'self'
    while current_class != target_class:
        current_class = current_class.parent
        chain += f'.{current_class.reference_name}'
    return chain


def get_all_class_chains(cls: SwiftClass) -> Dict[str, str]:
    chain = 'self'
    chains: Dict[str, str] = {cls.reference_name: chain}
    for ancestor in cls.ancestors:
        chain += f'.{ancestor.reference_name}'
        chains[ancestor.reference_name] = chain
    return chains


def get_dispatch_table_path(cls: SwiftClass, dispatcher: SwiftClass):
    path = get_class_chain(cls, dispatcher)
    if dispatcher.dispatch_table:
        path += '.dispatchTable'
    return path
