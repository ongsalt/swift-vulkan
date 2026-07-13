from dataclasses import dataclass, field
from string import Template

IMPLICIT_TYPE_MAP = {
    'void': 'Void',
    'char': 'CChar',
    'float': 'Float',
    'double': 'Double',
    'uint8_t': 'UInt8',
    'uint16_t': 'UInt16',
    'uint32_t': 'UInt32',
    'uint64_t': 'UInt64',
    'int32_t': 'Int32',
    'int64_t': 'Int64',
    'size_t': 'Int',
    'int': 'Int32'
}

NUMERIC_TYPE = {
    'float',
    'double',
    'uint8_t',
    'uint16_t',
    'uint32_t',
    'uint64_t',
    'int32_t',
    'int64_t',
    'size_t',
    'int'
}


def _substitute(template: str, values: dict[str, str], safe: bool = False):
    if safe:
        return Template(template).safe_substitute(**values)
    else:
        return Template(template).substitute(**values)


@dataclass(eq=False, kw_only=True)
class Conversion:
    swift_value_template: str
    c_value_template: str
    c_closure_template: tuple[str, str] | None = None

    @property
    def requires_closure(self) -> bool:
        return self.c_closure_template is not None

    def get_c_value(self, name: str, values: dict[str, str] | None = None, safe: bool = False) -> str:
        value = values[name] if values is not None else name
        return _substitute(self.c_value_template, dict(name=name, value=value), safe=safe)

    def get_c_closure(self, name: str, values: dict[str, str] | None = None, safe: bool = False, throws: str | None = None) -> tuple[str, str]:
        value = values[name] if values is not None else name
        return (
            _substitute(self.c_closure_template[0], dict(
                name=name, value=value, throws=throws or ''), safe=safe),
            _substitute(self.c_closure_template[1], dict(
                name=name, value=value), safe=safe)
        )

    def get_swift_value(self, name: str, values: dict[str, str] | None = None, classes: dict[str, str] | None = None,
                        safe: bool = False) -> str:
        value = values[name] if values is not None else name
        values = dict(name=name, value=value)
        if classes:
            values.update({'cls_' + name: value for name,
                          value in classes.items()})
        return _substitute(self.swift_value_template, values, safe=safe)


@dataclass(eq=False, kw_only=True)
class ArrayConversion(Conversion):
    length: str
    c_length_template: str
    swift_element_template: str | None = None

    def get_c_length(self, name: str, values: dict[str, str] | None = None, safe: bool = False) -> str:
        value = values[name] if values is not None else name
        return _substitute(self.c_length_template, dict(name=name, value=value), safe=safe)

    def get_swift_value(self, name: str, values: dict[str, str] | None = None, classes: dict[str, str] | None = None,
                        safe: bool = False) -> str:
        value, length = (values[name], values[self.length]
                         ) if values is not None else (name, self.length)
        values = dict(name=name, value=value, length=length)
        if classes:
            values.update({'cls_' + name: value for name,
                          value in classes.items()})
        return _substitute(self.swift_value_template, values, safe=safe)

    def get_swift_element_value(self, name: str, values: dict[str, str] | None = None, classes: dict[str, str] | None = None,
                                safe: bool = False) -> str:
        value = values[name] if values is not None else name
        values = dict(name=name, value=value)
        if classes:
            values.update({'cls_' + name: value for name,
                          value in classes.items()})
        return _substitute(self.swift_element_template, values, safe=safe)


@dataclass(eq=False)
class MemberConversions:
    conversions: list[tuple[str, str, Conversion]] = field(default_factory=list)
    static_values: list[tuple[str, str]] = field(default_factory=list)

    def add_conversion(self, c_member: str, swift_member: str, conversion: Conversion):
        self.conversions.append((c_member, swift_member, conversion))

    def add_static_value(self, c_member: str, value: str):
        self.static_values.append((c_member, value))

    def get_swift_values(self, c_values: dict[str, str], classes: dict[str, str] = None) -> dict[str, str]:
        result: dict[str, str] = {}
        for c_member, swift_member, conversion in self.conversions:
            result.setdefault(swift_member, conversion.get_swift_value(
                c_member, c_values, classes))
        return result

    def get_c_closures(self, swift_values: dict[str, str], throws: str | None = None) -> list[tuple[str, str]]:
        result: list[tuple[str, str]] = []
        for _, swift_member, conversion in self.conversions:
            if conversion.requires_closure:
                result.append(conversion.get_c_closure(
                    swift_member, swift_values, throws=throws))
        return result

    def get_c_values(self, swift_values: dict[str, str]) -> dict[str, str]:
        result: dict[str, str] = {}
        for c_member, swift_member, conversion in self.conversions:
            result.setdefault(c_member, conversion.get_c_value(
                swift_member, swift_values))
            if isinstance(conversion, ArrayConversion):
                result.setdefault(conversion.length, conversion.get_c_length(
                    swift_member, swift_values))
        for c_member, static_value in self.static_values:
            result.setdefault(c_member, static_value)
        return result


implicit_conversion = Conversion(
    swift_value_template='$value',
    c_value_template='$value'
)


bool_conversion = Conversion(
    swift_value_template='$value == VK_TRUE',
    c_value_template='VkBool32($value ? VK_TRUE : VK_FALSE)'
)


def enum_conversion(c_enum: str, swift_enum: str) -> Conversion:
    return Conversion(
        swift_value_template=f'{swift_enum}(rawValue: numericBitCast($value.rawValue))!',
        c_value_template=f'{c_enum}(rawValue: {c_enum}.RawValue($value.rawValue))'
    )


def option_set_conversion(option_set: str) -> Conversion:
    return Conversion(
        swift_value_template=f'{option_set}(rawValue: $value)',
        c_value_template='$value.rawValue'
    )


def option_set_bit_conversion(c_enum: str, option_set: str, is_u64: bool = False) -> Conversion:
    # ty = "UInt64" if is_u64 else "UInt32"
    return Conversion(
        swift_value_template=f'{option_set}(rawValue: numericBitCast($value.rawValue))',
        c_value_template=f'{c_enum}(rawValue: {c_enum}.RawValue($value.rawValue))'
    )


string_conversion = Conversion(
    swift_value_template='String(cString: $value)',
    c_closure_template=('$value._withCString { cString_$name$throws in', '}'),
    c_value_template='cString_$name'
)

optional_string_conversion = Conversion(
    swift_value_template='($value != nil) ? String(cString: $value) : nil',
    c_closure_template=('$value.withOptionalCString { cString_$name$throws in', '}'),
    c_value_template='cString_$name'
)


char_array_conversion = Conversion(
    swift_value_template='String(unsafeBytesOf: $value)',
    c_value_template='$value.unsafeBytesCopy()'
)


def _table_param(table_type: str | None) -> str:
    """Rebuilding a struct that holds a dispatchable handle needs that handle's table."""
    return ', table: $cls_table' if table_type else ''


def struct_conversion(swift_struct: str, table_type: str | None = None) -> Conversion:
    return Conversion(
        swift_value_template=f'{swift_struct}(cStruct: $value{_table_param(table_type)})',
        c_closure_template=('$value.withCStruct { ptr_$name$throws in', '}'),
        c_value_template='ptr_$name.pointee'
    )


def struct_pointer_conversion(swift_struct: str, table_type: str | None = None, chainable=False) -> Conversion:
    return Conversion(
        swift_value_template=f'{swift_struct}(cStruct: $value.pointee{_table_param(table_type)})',
        c_closure_template=('$value.withCStruct { ptr_$name$throws in', '}'),
        c_value_template='ptr_$name'
    )


def optional_struct_conversion(swift_struct: str, table_type: str | None = None, chainable=False) -> Conversion:
    return Conversion(
        swift_value_template=f'($value != nil) ? {swift_struct}(cStruct: $value.pointee{_table_param(table_type)}) : nil',
        c_closure_template=('$value.withOptionalCStruct { ptr_$name$throws in', '}'),
        c_value_template='ptr_$name'
    )


def class_conversion(swift_class: str, dispatchable: bool = False) -> Conversion:
    class_params = 'handle: $value, table: $cls_table' if dispatchable else 'handle: $value'
    return Conversion(
        swift_value_template=f'{swift_class}({class_params})',
        c_value_template='$value.handle'
    )


def optional_class_conversion(swift_class: str, dispatchable: bool = False) -> Conversion:
    class_params = 'handle: $value, table: $cls_table' if dispatchable else 'handle: $value'
    return Conversion(
        swift_value_template=f'($value != nil) ? {swift_class}({class_params}) : nil',
        c_value_template='$value?.handle'
    )


def array_conversion(length: str) -> ArrayConversion:
    return ArrayConversion(
        length=length,
        swift_value_template='Array(UnsafeBufferPointer(start: $value, count: Int($length)))',
        c_closure_template=(
            '$value.withUnsafeBufferPointer { ptr_$name$throws in', '}'),
        c_value_template='ptr_$name.baseAddress',
        c_length_template='UInt32(ptr_$name.count)'
    )


def optional_array_conversion(length: str) -> ArrayConversion:
    return ArrayConversion(
        length=length,
        swift_value_template='($value != nil) ? Array(UnsafeBufferPointer(start: $value, count: Int($length))) : nil',
        c_closure_template=(
            '$value.withOptionalUnsafeBufferPointer { ptr_$name$throws in', '}'),
        c_value_template='ptr_$name.baseAddress',
        c_length_template='UInt32(ptr_$name.count)'
    )


def byte_array_conversion(length: str) -> ArrayConversion:
    return ArrayConversion(
        length=length,
        swift_value_template='Array<UInt8>(UnsafeBufferPointer(start: $value, count: $length))',
        c_closure_template=(
            '$value.withUnsafeBufferPointer { ptr_$name$throws in', '}'),
        c_value_template='ptr_$name.baseAddress',
        c_length_template='ptr_$name.count'
    )



def string_array_conversion(length: str) -> ArrayConversion:
    return ArrayConversion(
        length=length,
        swift_value_template=f'UnsafeBufferPointer(start: $value, count: Int($length)).map{{ String(cString: $$0!) }}',
        swift_element_template='String(cString: $value!)',
        c_closure_template=(
            '$value.withCStringBufferPointer { ptr_$name$throws in', '}'),
        c_value_template='ptr_$name.baseAddress',
        c_length_template='UInt32(ptr_$name.count)'
    )


def struct_array_conversion(swift_struct: str, length: str, table_type: str | None = None) -> ArrayConversion:
    table = _table_param(table_type)
    return ArrayConversion(
        length=length,
        swift_value_template='UnsafeBufferPointer(start: $value, count: Int($length))'
                             f'.map{{ {swift_struct}(cStruct: $$0{table}) }}',
        swift_element_template=f'{swift_struct}(cStruct: $value{table})',
        c_closure_template=(
            '$value.withCStructBufferPointer { ptr_$name$throws in', '}'),
        c_value_template='ptr_$name.baseAddress',
        c_length_template='UInt32(ptr_$name.count)'
    )


def optional_struct_array_conversion(swift_struct: str, length: str, table_type: str | None = None) -> ArrayConversion:
    return ArrayConversion(
        length=length,
        swift_value_template='($value != nil) ? UnsafeBufferPointer(start: $value, count: Int($length))'
                             f'.map{{ {swift_struct}(cStruct: $$0{_table_param(table_type)}) }} : nil',
        c_closure_template=(
            '$value.withOptionalCStructBufferPointer { ptr_$name$throws in', '}'),
        c_value_template='ptr_$name.baseAddress',
        c_length_template='UInt32(ptr_$name.count)'
    )


def handle_array_conversion(swift_class: str, length: str, dispatchable: bool = False) -> ArrayConversion:
    element = class_conversion(swift_class, dispatchable)
    return ArrayConversion(
        length=length,
        swift_value_template='UnsafeBufferPointer(start: $value, count: Int($length))'
                             f'.map{{ {element.get_swift_value("$$0", safe=True)} }}',
        swift_element_template=element.get_swift_value('$value', safe=True),
        c_closure_template=(
            f'$value.map{{ {element.get_c_value("$$0", safe=True)} }}'
            '.withUnsafeBufferPointer { ptr_$name$throws in', '}'),
        # C wants UnsafePointer<VkX?>; a handle and its Optional have the same layout
        c_value_template='ptr_$name.baseAddress?.cast()',
        c_length_template='UInt32(ptr_$name.count)'
    )


def optional_handle_array_conversion(swift_class: str, length: str, dispatchable: bool = False) -> ArrayConversion:
    element = class_conversion(swift_class, dispatchable)
    return ArrayConversion(
        length=length,
        swift_value_template='($value != nil) ? UnsafeBufferPointer(start: $value, count: Int($length))'
                             f'.map{{ {element.get_swift_value("$$0", safe=True)} }} : nil',
        swift_element_template=element.get_swift_value('$value', safe=True),
        c_closure_template=(
            f'($value?.map{{ {element.get_c_value("$$0", safe=True)} }})'
            '.withOptionalUnsafeBufferPointer { ptr_$name$throws in', '}'),
        c_value_template='ptr_$name.baseAddress?.cast()',
        c_length_template='UInt32(ptr_$name.count)'
    )


def array_mapped_conversion(element_conversion: Conversion, length: str) -> ArrayConversion:
    assert not element_conversion.requires_closure
    swift_element = element_conversion.get_swift_value('$$0', safe=True)
    c_element = element_conversion.get_c_value('$$0', safe=True)
    swift_element_template = element_conversion.get_swift_value(
        '$value', safe=True)
    return ArrayConversion(
        length=length,
        swift_value_template=f'UnsafeBufferPointer(start: $value, count: Int($length)).map{{ {swift_element} }}',
        swift_element_template=swift_element_template,
        c_closure_template=(
            f'$value.map{{ {c_element} }}.withUnsafeBufferPointer {{ ptr_$name$throws in', '}'),
        c_value_template='ptr_$name.baseAddress',
        c_length_template='UInt32(ptr_$name.count)'
    )


def optional_array_mapped_conversion(element_conversion: Conversion, length: str) -> ArrayConversion:
    assert not element_conversion.requires_closure
    swift_element = element_conversion.get_swift_value('$$0', safe=True)
    c_element = element_conversion.get_c_value('$$0', safe=True)
    return ArrayConversion(
        length=length,
        swift_value_template='($value != nil) ? UnsafeBufferPointer(start: $value, count: Int($length))'
                             f'.map{{ {swift_element} }} : nil',
        c_closure_template=(
            f'($value?.map{{ {c_element} }}).withOptionalUnsafeBufferPointer {{ ptr_$name$throws in', '}'),
        c_value_template='ptr_$name.baseAddress',
        c_length_template='UInt32(ptr_$name.count)'
    )


def tuple_pointer_conversion(element_type: str) -> Conversion:
    return Conversion(
        swift_value_template='',
        c_closure_template=('withUnsafeBytes(of: $value) { ptr_$name$throws in', '}'),
        c_value_template=f'ptr_$name.bindMemory(to: {element_type}.self).baseAddress'
    )


version_conversion = Conversion(
    swift_value_template='Version(rawValue: $value)',
    c_value_template='$value.rawValue'
)


def tuple_array_conversion(conversion: ArrayConversion, c_type: str, capacity: int) -> ArrayConversion:
    swift_element = conversion.get_swift_element_value('$$0', safe=True)
    return ArrayConversion(
        length=conversion.length,
        swift_value_template=f'withUnsafeBytes(of: $value) {{ $$0.bindMemory(to: {c_type}.self).prefix(Int($length))'
        f'.map{{ {swift_element} }} }}',
        c_closure_template=conversion.c_closure_template,
        c_value_template='ptr_$name.unsafeBytesCopy()',
        c_length_template=f'min({conversion.c_length_template}, {capacity})'
    )
