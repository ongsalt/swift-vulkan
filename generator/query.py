from genlib.parser import CContext
from genlib.importer import Importer, remove_vk_prefix, get_member_name
from genlib.generator import Generator

if __name__ == '__main__':
    c_context = CContext()
    c_context.parse('vk.xml')

    importer = Importer(c_context)
    swift_context = importer.import_all()

    c_side = {}
    for struct in c_context.structs:
        for field in struct.members:
            if field.type.length and type(field.type.length) is str and 'latex' not in field.type.length and not field.type.type_name in ('char', 'void'):
                s = remove_vk_prefix(struct.name)
                f = get_member_name(field.name, field.type)
                # print(f'{s}.{f}: {field.type.type_name} [{field.type.length}]')
                c_side[f'{s}.{f}'] = field.type.type_name

    swift_side = {}
    for struct in swift_context.structs:
        for field in struct.members:
            if 'Array' in field.type:
                swift_side[f'{struct.name}.{field.name}'] = field.type
    
    print(c_side.keys() - swift_side.keys())
    print(len(c_side) - len(swift_side.keys()))
