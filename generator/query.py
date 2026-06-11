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
        lenghts: set[str] = set()
        for member in struct.members:
            if type(member.type.length) == str and member.noautovalidity and member.type.optional:
                print(f'{struct.name}::{member.name}: {member.type.type_name}[{member.type.length}]')

    # for command in c_context.commands:

