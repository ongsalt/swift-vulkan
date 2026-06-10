from __future__ import annotations
from genlib.parser import CContext
from genlib.importer import Importer, remove_vk_prefix, get_member_name
from genlib.generator import Generator

if __name__ == '__main__':
    c_context = CContext()
    c_context.parse('vk.xml')

    importer = Importer(c_context)
    swift_context = importer.import_all()

    for struct in c_context.structs:
        count: dict[str, int] = {}
        for member in struct.members:
            if type(member.type.length) == str and member.noautovalidity:
                name = member.type.length
                count[name] = count.setdefault(name, 0) + 1

        for key, value in count.items():
            if value > 1:
                print(struct.name, key)

    for command in c_context.commands:
        count: dict[str, int] = {}
        for member in command.params:
            if type(member.type.length) == str and member.noautovalidity:
                name = member.type.length
                count[name] = count.setdefault(name, 0) + 1

        for key, value in count.items():
            if value > 1:
                print(command.name, key)

