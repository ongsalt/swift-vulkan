from __future__ import annotations
from genlib.parser import CContext
from genlib.importer import Importer, remove_vk_prefix, get_member_name
from genlib.generator import Generator

if __name__ == '__main__':
    c_context = CContext()
    c_context.parse('vk.xml')

    importer = Importer(c_context)
    swift_context = importer.import_all()

    
    for struct in swift_context.structs:
        if 'PhysicalDeviceDeviceGeneratedCommandsComputeFeaturesNV' in struct.name:
            print(struct.name) 

    # PhysicalDeviceDeviceGeneratedCommandsComputeFeaturesNV

