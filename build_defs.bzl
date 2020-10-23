"""
General variables and rules for facilitating builds of ignition.
"""

load(
    ":cmake_configure_file.bzl",
    _cmake_configure_file = "cmake_configure_file",
)
load(
    ":generate_include_header.bzl",
    _generate_include_header = "generate_include_header",
)
load(
    ":generate_file.bzl",
    _generate_file = "generate_file",
)
load(
    "ign_config_header.bzl",
    _ign_config_header = "ign_config_header",
)
load(
    "ign_export_header.bzl",
    _ign_export_header = "ign_export_header",
)
load(
    "generate_yaml.bzl",
    _generate_yaml = "generate_yaml",
)
load(
    "qt.bzl",
    _qt_cc_binary = "qt_cc_binary",
    _qt_cc_library = "qt_cc_library",
)

cmake_configure_file = _cmake_configure_file
generate_include_header = _generate_include_header
generate_file = _generate_file
ign_config_header = _ign_config_header
ign_export_header = _ign_export_header
generate_yaml = _generate_yaml
qt_cc_binary = _qt_cc_binary
qt_cc_library = _qt_cc_library

IGNITION_ROOT = "//"

IGNITION_VISIBILITY = [
    "//:__subpackages__",
    "//experimental:__subpackages__",
]

IGNITION_DESIGNATION = "dome"

FEATURES = [
    "-parse_headers",
    "-use_header_modules",
    "-layering_check",
]

DEFAULT_COPTS = [
    "-fexceptions",
]
