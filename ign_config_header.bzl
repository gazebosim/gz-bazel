load(
    ":cmake_configure_file.bzl",
    "cmake_configure_file",
)

def ign_config_header(name, src, cmakelists, project_name, project_version, **kwargs):
    out = src
    idx = out.find(".in")
    if (idx > 0):
        out = out[0:idx]

    PROJECT_NAME = project_name
    IGN_DESIGNATION = project_name.split("-")[1]
    PROJECT_MAJOR = project_version[0]
    PROJECT_MINOR = project_version[1]
    PROJECT_PATCH = project_version[2]


    defines = [
        "PROJECT_VERSION_MAJOR=%d" % PROJECT_MAJOR,
        "PROJECT_VERSION_MINOR=%d" % PROJECT_MINOR,
        "PROJECT_VERSION_PATCH=%d" % PROJECT_PATCH,
        "PROJECT_MAJOR_VERSION=%d" % PROJECT_MAJOR,
        "PROJECT_MINOR_VERSION=%d" % PROJECT_MINOR,
        "PROJECT_PATCH_VERSION=%d" % PROJECT_PATCH,
        "PROJECT_VERSION=%d.%d" % (PROJECT_MAJOR, PROJECT_MINOR),
        "PROJECT_VERSION_FULL=%d.%d.%d" % (PROJECT_MAJOR, PROJECT_MINOR, PROJECT_PATCH),  # noqa
        "PROJECT_NAME=%s" % PROJECT_NAME,
        "PROJECT_NAME_NO_VERSION=%s" % PROJECT_NAME,
        "PROJECT_NAME_UPPER=%s" % PROJECT_NAME.upper(),
        "PROJECT_NAME_LOWER=%s" % PROJECT_NAME.lower(),
        "IGN_DESIGNATION=%s" % IGN_DESIGNATION,
        "IGN_DESIGNATION_UPPER=%s" % IGN_DESIGNATION.upper(),
        "IGN_DESIGNATION_LOWER=%s" % IGN_DESIGNATION.lower(),
        "PROJECT_BINARY_DIR=",
        "PROJECT_SOURCE_DIR=",
        "CMAKE_INSTALL_PREFIX=",
        "IGN_DATA_INSTALL_DIR=",
        "IGN_LAUNCH_PLUGIN_INSTALL_PATH=",
    ] 

    if 'extra_defines' in kwargs:
        defines = defines + kwargs['extra_defines']

    cmake_configure_file(
        name = name,
        src = src,
        out = out,
        cmakelists = cmakelists,
        defines = defines,
        visibility = ["//visibility:private"],
    )
