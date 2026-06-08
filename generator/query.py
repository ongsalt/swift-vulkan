from genlib.parser import CContext
from genlib.importer import Importer, remove_vk_prefix, get_member_name
from genlib.generator import Generator

if __name__ == '__main__':
    c_context = CContext()
    c_context.parse('vk.xml')

    importer = Importer(c_context)
    swift_context = importer.import_all()

    swift_side = {}
    for clazz in swift_context.classes:
        for command in clazz.commands:
            for param in command.params:
                count = 0
                if 'info' in param.name.lower():
                    count += 1
                if count > 1:
                    print(f'{clazz.name}.{command.name}')