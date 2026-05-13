from genlib.parser import CContext
from genlib.importer import Importer
from genlib.generator import Generator

if __name__ == '__main__':
    c_context = CContext()
    c_context.parse('vk.xml')

    importer = Importer(c_context)
    swift_context = importer.import_all()

    # for c in swift_context.classes:
    #     for cmd in c.commands:
    #         if cmd.output_param and len(cmd.output_param) > 1:
    #             print(f"{c.name}.{cmd.name}() -> {cmd.output_param_implicit_type}")
    #             print(f"  > aka {c.c_handle.name if c.c_handle else None}.{cmd.c_command.name}")
