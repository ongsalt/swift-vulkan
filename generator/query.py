from __future__ import annotations
from genlib.parser import CContext, CStruct
from genlib.importer import Importer, remove_vk_prefix, get_member_name
from genlib.generator import Generator

if __name__ == '__main__':
    c_context = CContext()
    c_context.parse('vk.xml')

    importer = Importer(c_context)
    swift_context = importer.import_all()


    struct_by_name: dict[str, CStruct] = {}
    for struct in c_context.structs:
        struct_by_name[struct.name] = struct
    
    # for command in c_context.commands:
    #     c = []
    #     for param in command.params:
    #         # if its 1.out param, 2. chainable
    #         ty = param.type.type_name
    #         if param.type.pointer_to and not param.type.pointer_to.const:
    #             if ty in struct_by_name and struct_by_name[ty].is_chainable:
    #                 c.append(param)                    
    #     if (len(c) == 1):
    #         print(f'{command.name} {len(command.params)} ')
    #         print(f'  {[(p.name, p.type.type_name) for p in command.params]}')

    # for c in swift_context.classes:
    #     for command in c.commands:
    #         if command.chainable_out_parameters and command.params:
    #             print(c.name, command.name)
    #             print(command.params)
    #             print()

    for struct in c_context.bitmasks:
        if 'PipelineColorBlendStateCreateFlags' in struct.name:
            print(struct.name)
                
# vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR
# vkGetDeviceFaultInfoEXT
# vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM
