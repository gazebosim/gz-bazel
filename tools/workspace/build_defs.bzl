load(
    ":ign_export_header.bzl",
    _ign_export_header = "ign_export_header"
)

load(
    ":ign_configure_file.bzl",
    _ign_configure_header = "ign_configure_file"
)

load(
    ":ign_include_header.bzl",
    _ign_include_header = "ign_include_header"
)

load(
    ":cmake_configure_file.bzl",
    _cmake_configure_file = "cmake_configure_file"
)

IGNITION_ROOT = "@ignition//"

IGNITION_VISIBILITY = [
    "//:__subpackages__",
    "//experimental:__subpackages__",
]

IGNITION_FEATURES = [
    "-parse_headers",
    "-use_header_modules",
    "-layering_check",
]

cmake_configure_file= _cmake_configure_file
ign_configure_header = _ign_configure_header
ign_export_header = _ign_export_header
ign_include_header = _ign_include_header
