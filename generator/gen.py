from genlib.parser import CContext
from genlib.importer import Importer
from genlib.generator import Generator

skip_list = set([
    # some struct/command `len` semantics are ass and should be pass in explicitly
])

if __name__ == '__main__':
    c_context = CContext()
    c_context.parse('vk.xml')

    importer = Importer(c_context)
    swift_context = importer.import_all()

    with open('../Sources/Vulkan/Enums.swift', 'w') as f:
        generator = Generator(f)
        for enum in swift_context.enums:
            generator.generate_enum(enum)

    with open('../Sources/Vulkan/OptionSets.swift', 'w') as f:
        generator = Generator(f)
        for option_set in swift_context.option_sets:
            generator.generate_option_set(option_set)

    with open('../Sources/Vulkan/Structs.swift', 'w') as f:
        generator = Generator(f)
        generator.generate_imports()
        for struct in swift_context.structs:
            if struct.name not in skip_list:
                generator.generate_struct(struct)

    classes = set(['Device', 'CommandBuffer'])
    with open('../Sources/Vulkan/Classes.swift', 'w') as f:
        generator = Generator(f)
        generator.generate_imports()
        for cls in swift_context.classes:
            if cls.name not in classes:
                generator.generate_class(cls)

    for cls_name in classes:
        with open(f'../Sources/Vulkan/{cls_name}.swift', 'w') as f:
            generator = Generator(f)
            generator.generate_imports()
            for cls in swift_context.classes:
                if cls.name == cls_name:
                    generator.generate_class(cls)
                    break

    with open('../Sources/Vulkan/Aliases.swift', 'w') as f:
        generator = Generator(f)
        for alias in swift_context.aliases:
            generator.generate_alias(alias)

    with open('../Sources/Vulkan/Dispatch.swift', 'w') as f:
        generator = Generator(f)
        generator.generate_imports()
        for dispatch_table in swift_context.dispatch_tables:
            generator.generate_dispatch_table(dispatch_table)

    with open('../Sources/Vulkan/Chain+Extensions.swift', 'w') as f:
        generator = Generator(f)
        for struct in swift_context.structs:
            if not struct.c_struct.is_chainable:
                continue
            generator.generate_chain_extension(struct)
