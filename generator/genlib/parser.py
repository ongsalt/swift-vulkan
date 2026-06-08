import re
from xml.etree.ElementTree import ElementTree, parse
from itertools import zip_longest
from dataclasses import dataclass, field


@dataclass(eq=False)
class CEnum:
    @dataclass(eq=False)
    class Case:
        name: str
        value: str

    name: str
    cases: list[CEnum.Case] = field(default_factory=list)
    protect: str | None = None


@dataclass(eq=False)
class CBitmask:
    name: str
    enum: CEnum | None = None
    is64: bool = False
    protect: str | None = None


@dataclass(eq=False)
class CType:
    name: str | None = None
    pointer_to: CType | None = None
    array_of: CType | None = None
    const: bool = False
    length: str | int | list[int] | None = None
    optional: bool = False

    @property
    def type_name(self) -> str | None:
        if self.pointer_to:
            return self.pointer_to.type_name
        if self.array_of:
            return self.array_of.type_name
        return self.name


@dataclass(eq=False)
class CMember:
    name: str
    type: CType
    values: list[str] = field(default_factory=list)


@dataclass(eq=False)
class CStruct:
    name: str
    members: list[CMember] = field(default_factory=list)
    returned_only: bool = False
    struct_extends: list[str] = field(default_factory=list)
    is_chainable: bool = False
    protect: str | None = None


@dataclass(eq=False)
class CHandle:
    name: str
    parent: CHandle | None = None
    protect: str | None = None


@dataclass(eq=False)
class CCommand:
    name: str
    return_type: CType
    params: list[CMember] = field(default_factory=list)
    protect: str | None = None


@dataclass(eq=False)
class CExtension:
    name: str
    supported: str | None = None
    platform: str | None = None
    protect: str | None = None
    types: list[str] = field(default_factory=list)
    enums: list[CEnum] = field(default_factory=list)
    commands: list[str] = field(default_factory=list)
    supported_apis: list[str] = field(default_factory=list)
    ignored_names: list[str] = field(default_factory=list)


blacklisted_extensions = set()


@dataclass(eq=False)
class CFeature:
    name: str
    api: list[str]
    type_names: set[str]
    command_names: set[str]
    apitype: str | None = None

    def __post_init__(self):
        self.type_names = set(self.type_names)
        self.command_names = set(self.command_names)


@dataclass(eq=False)
class CAlias:
    name: str
    alias: str
    protect: str | None = None


class CContext:
    def __init__(self) -> None:
        self.platform_protects: dict[str, str] = {}
        self.extension_tags: list[str] = []
        self.extensions: list[CExtension] = []
        self.features: list[CFeature] = []
        self.handles: list[CHandle] = []
        self.enums: list[CEnum] = []
        self.bitmasks: list[CBitmask] = []
        self.structs: list[CStruct] = []
        self.commands: list[CCommand] = []
        self.aliases: list[CAlias] = []

    def parse(self, source):
        tree = parse(source)
        # TODO: parse feature block instead of doing this
        # self._filter_vulkansc(tree.getroot())
        self.parse_tree(tree)

    # def _filter_vulkansc(self, element: ElementTree.Element):
    #     for child in list(element):
    #         if 'api' in child.attrib:
    #             apis = child.attrib['api'].split(',')
    #             if 'vulkansc' in apis and 'vulkan' not in apis:
    #                 element.remove(child)
    #                 continue
    #         self._filter_vulkansc(child)

    def parse_tree(self, tree: ElementTree):
        self.parse_platforms(tree)
        self.parse_extension_tags(tree)
        self.parse_extensions(tree)

        self.parse_features(tree)
        # types
        # not seen here: include, define, funcpointer
        self.parse_handles(tree)
        self.parse_enums(tree)
        self.parse_bitmasks(tree)
        self.parse_structs(tree)
        self.parse_commands(tree)

    def parse_platforms(self, tree: ElementTree):
        for platform in tree.findall('./platforms/platform'):
            self.platform_protects[platform.attrib['name']
                                   ] = platform.attrib['protect']

    def parse_features(self, tree: ElementTree):
        for feature in tree.findall('./feature'):
            type_names: list[str] = []
            command_names: list[str] = []

            for type in feature.findall('./require/type'):
                name = type.attrib['name']
                type_names.append(name)

            for command in feature.findall('./require/command'):
                name = command.attrib['name']
                command_names.append(name)

            for e_enum in feature.findall('./require/enum[@extends]'):
                extension_number = None
                if 'extnumber' in e_enum.attrib:
                    extension_number = int(e_enum.attrib['extnumber'])
                if 'alias' in e_enum.attrib:
                    continue
                c_case = CEnum.Case(
                    e_enum.attrib['name'], parse_enum_value(e_enum, extension_number))
                for enum in self.enums:
                    if enum.name == e_enum.attrib['extends']:
                        enum.cases.append(c_case)
                        break

            apitype = None
            if apitype in feature.attrib:
                apitype = feature.attrib['apitype']

            c_feature = CFeature(
                name=feature.attrib['name'],
                api=feature.attrib['api'].split(","),
                type_names=type_names,
                command_names=command_names,
                apitype=apitype
            )
            self.features.append(c_feature)

    def parse_extensions(self, tree: ElementTree):
        for e_extension in tree.findall('./extensions/extension'):
            extension_number = int(e_extension.attrib['number'])

            name = e_extension.attrib['name']
            platform = e_extension.get('platform')

            enums: dict[str, list[CEnum.Case]] = {}
            types: list[str] = []
            commands: list[str] = []
            ignored_names: list[str] = []

            for e_require in e_extension.findall('./require'):
                if self.should_ignore(api=parse_api(e_require)):
                    ignored_names.extend(t.attrib['name']
                                         for t in e_require.findall('./type'))
                    ignored_names.extend(t.attrib['name']
                                         for t in e_require.findall('./command'))
                    ignored_names.extend(t.attrib['name']
                                         for t in e_require.findall('./enum'))

                types.extend(t.attrib['name']
                             for t in e_require.findall('./type'))
                commands.extend(t.attrib['name']
                                for t in e_require.findall('./command'))
                for e_enum in e_require.findall('./enum[@extends]'):
                    if 'alias' in e_enum.attrib:
                        continue
                    c_case = CEnum.Case(
                        e_enum.attrib['name'], parse_enum_value(e_enum, extension_number))
                    enums.setdefault(
                        e_enum.attrib['extends'], []).append(c_case)

                # supported_apis = e_require.attrib['supported'].split(",")

            c_extension = CExtension(
                name=name,
                supported=e_extension.attrib['supported'],
                platform=platform,
                protect=self.platform_protects[platform] if platform else None,
                types=types,
                enums=[CEnum(enum_name, cases)
                       for enum_name, cases in enums.items()],
                commands=commands,
                ignored_names=ignored_names,
                # supported_apis=supported_apis
            )
            self.extensions.append(c_extension)

    def parse_extension_tags(self, tree: ElementTree):
        for tag in tree.findall('./tags/tag'):
            self.extension_tags.append(tag.attrib['name'])

    def parse_handles(self, tree: ElementTree):
        handles: dict[str, CHandle] = {}
        parents: dict[str, str] = {}

        for e_handle in tree.findall('./types/type[@category="handle"]'):
            if 'alias' in e_handle.attrib:
                handle_name = e_handle.attrib['name']
                alias = handles[e_handle.attrib['alias']]
                protect = self.find_protect(type_=handle_name)
                self.aliases.append(CAlias(handle_name, alias.name, protect))
                if alias.protect and not protect:
                    alias.protect = None
                continue

            handle_name = e_handle.find('./name').text
            if self.should_ignore(type_=handle_name, api=parse_api(e_handle)):
                continue

            handle = CHandle(
                handle_name, protect=self.find_protect(type_=handle_name))
            self.handles.append(handle)
            handles[handle_name] = handle
            parents[handle_name] = e_handle.get('parent')

        for handle_name, handle in handles.items():
            try:
                handle.parent = handles[parents[handle_name]]
            except KeyError:
                pass

    def parse_enums(self, tree: ElementTree):
        for e_enum in tree.findall('./enums[@type="enum"]'):
            enum_name = e_enum.attrib['name']

            if self.should_ignore(type_=enum_name, api=parse_api(e_enum)):
                continue

            cases = {}
            for e_case in e_enum.findall('./enum'):
                if 'alias' in e_case.attrib:
                    continue
                cases[e_case.attrib['name']] = parse_enum_value(e_case)

            for extension in self.extensions:
                if extension.supported in ('vulkansc', 'disabled') or extension.platform:
                    continue
                for ext_enum in extension.enums:
                    if ext_enum.name == enum_name:
                        for ext_case in ext_enum.cases:
                            cases[ext_case.name] = ext_case.value

            c_enum = CEnum(enum_name, [CEnum.Case(name, value)
                           for name, value in cases.items()], protect=self.find_protect(type_=enum_name))
            self.enums.append(c_enum)

    def parse_bitmasks(self, tree: ElementTree):
        for e_bitmask in tree.findall('./types/type[@category="bitmask"]'):
            if 'alias' in e_bitmask.attrib:
                continue

            bitmask_name = e_bitmask.find('./name').text

            if self.should_ignore(type_=bitmask_name, api=parse_api(e_bitmask)):
                continue

            c_bitmask = CBitmask(bitmask_name, is64=e_bitmask.find('./type').text == "VkFlags64", protect=self.find_protect(type_=bitmask_name))


            requires = e_bitmask.get('requires')
            if requires:
                cases = {}
                e_enum = tree.find(f'./enums[@name="{requires}"]')
                for e_case in e_enum.findall('./enum'):
                    if 'alias' in e_case.attrib:
                        continue
                    cases[e_case.attrib['name']] = parse_enum_value(e_case)

                for extension in self.extensions:
                    if extension.supported in ('vulkansc', 'disabled') or extension.platform:
                        continue
                    for ext_enum in extension.enums:
                        if ext_enum.name == requires:
                            for ext_case in ext_enum.cases:
                                cases[ext_case.name] = ext_case.value

                c_bitmask.enum = CEnum(requires, [CEnum.Case(
                    name, value) for name, value in cases.items()])

            self.bitmasks.append(c_bitmask)

    def parse_structs(self, tree: ElementTree):
        bases: list[str] = []
        for struct in tree.findall('./types/type[@category="struct"]'):
            if 'alias' in struct.attrib:
                continue

            if self.should_ignore(type_=struct.attrib['name'], api=parse_api(struct)):
                continue

            extends: list[str] = []
            if 'structextends' in struct.attrib:
                for name in struct.attrib['structextends'].split(","):
                    if self.should_ignore(type_=name):  # wtf is this
                        continue
                    extends.append(name)

            c_struct = CStruct(struct.attrib['name'], returned_only=struct.get(
                'returnedonly') == 'true', struct_extends=extends, protect=self.find_protect(type_=struct.attrib['name']))

            for member in struct.findall('./member'):
                if self.should_ignore(api=parse_api(member)):
                    continue
                member = parse_member(member, tree)
                c_struct.members.append(member)
                # TODO: checl pNext type, maybe
                if member.name == "pNext":
                    c_struct.is_chainable = True

            self.structs.append(c_struct)

    def parse_commands(self, tree: ElementTree):
        for e_command in tree.findall('./commands/command'):
            if 'alias' in e_command.attrib:
                continue

            proto = parse_member(e_command.find('./proto'), tree)

            if self.should_ignore(command=proto.name, api=parse_api(e_command)):
                continue

            c_command = CCommand(proto.name, proto.type, protect=self.find_protect(command=proto.name))
            for e_param in e_command.findall('./param'):
                if self.should_ignore(api=parse_api(e_param)):
                    continue
                c_command.params.append(parse_member(e_param, tree))

            self.commands.append(c_command)

    def find_extension(self, type_: str = None, command: str = None) -> CExtension | None:
        for extension in self.extensions:
            if (type_ and type_ in extension.types) or (command and command in extension.commands):
                return extension

    def find_features(self, type_: str = None, command: str = None) -> list[CFeature]:
        features: list[CFeature] = []
        for feature in self.features:
            if (type_ and type_ in feature.type_names) or (command and command in feature.command_names):
                features.append(feature)
        return features

    def find_protect(self, type_: str = None, command: str = None) -> str | None:
        extension = self.find_extension(type_, command)
        if extension:
            return extension.protect

    def should_ignore(self, type_: str = None, command: str = None, api: str | None = None) -> bool:
        if api == 'vulkansc':
            return True
        extension = self.find_extension(type_, command)
        if extension and ((type_ or command) in extension.ignored_names or extension.name in blacklisted_extensions or extension.supported in ('disabled', 'vulkansc')):
            return True

        features = self.find_features(type_, command)
        if len(features) == 1 and len(features[0].api) == 1 and 'vulkansc' in features[0].api:
            return True
        return False    

def parse_enum_value(e_enum: ElementTree, extension_number: int = None) -> str:
    if 'offset' in e_enum.attrib:
        if 'extnumber' in e_enum.attrib:
            extension_number = int(e_enum.attrib['extnumber'])
        value = 1000000000 + (extension_number - 1) * \
            1000 + int(e_enum.attrib['offset'])
        if e_enum.get('dir') == '-':
            value *= -1
        return str(value)
    elif 'bitpos' in e_enum.attrib:
        return str(2 ** int(e_enum.attrib['bitpos']))
    else:
        return e_enum.attrib['value']


def parse_member(member: ElementTree, tree: ElementTree) -> CMember:
    e_type = member.find('./type')
    type_string = (member.text or '') + e_type.text + (e_type.tail or '')

    e_name = member.find('./name')
    name = e_name.text

    array_size: int | list[int] = None
    if e_name.tail and e_name.tail.startswith('['):
        match = re.findall(r'\[\s*(\d+)\s*\]', e_name.tail)
        if match:
            if len(match) == 1:
                array_size = int(match[0])
            else:
                array_size = [int(i) for i in match]
        else:
            e_enum = member.find('./enum')
            array_size = int(
                tree.find(f'./enums/enum[@name="{e_enum.text}"]').attrib['value'])

    type_strings = type_string.split('*')

    first_type = type_strings[0].split()
    is_const = False
    if 'const' in first_type:
        first_type.remove('const')
        is_const = True
    if 'struct' in first_type:
        first_type.remove('struct')
    c_type = CType(name=' '.join(first_type), const=is_const)

    pointers = type_strings[1:]
    lengths = member.attrib['len'].split(
        ',') if 'len' in member.attrib and member.attrib['len'] != '1' else []
    optionals = member.attrib['optional'].split(
        ',') if 'optional' in member.attrib else []

    if len(optionals) > len(pointers):
        c_type.optional = optionals.pop(-1) == 'true'

    lengths = reversed(lengths[:len(pointers)])
    optionals = reversed(optionals[:len(pointers)])

    for pointer, length, optional in zip_longest(pointers, lengths, optionals):
        c_type = CType(pointer_to=c_type, length=length, const='const' in pointer,
                       optional=optional == 'true')

    # if name == "pPipelineBinaries":
    if name == "resolveAttachments":
        print(f"{name}: {list(lengths)} : {type_strings}")

    if array_size is not None:
        c_type = CType(array_of=c_type, length=array_size)

    values_string = member.get('values')
    values = values_string.split(',') if values_string else []

    return CMember(name, c_type, values)


def parse_api(element: ElementTree) -> str | None:
    if 'api' in element.attrib:
        return element.attrib['api']
    return None
