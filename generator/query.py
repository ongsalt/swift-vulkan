from genlib.parser import CContext
from genlib.importer import Importer, remove_vk_prefix, get_member_name
from genlib.generator import Generator

if __name__ == '__main__':
    c_context = CContext()
    c_context.parse('vk.xml')

    importer = Importer(c_context)
    swift_context = importer.import_all()

    for command in c_context.commands:
        count = 0
        for param in command.params:
            if param.type.pointer_to and not param.type.pointer_to.const and param.type.type_name in importer.c_structs:
                struct = importer.c_structs[param.type.type_name]
                if struct.is_chainable:
                    # print(f'{param.name}: &{param.type.pointer_to.name}')
                    count += 1
        
        if count > 1:
            print(command.name)
