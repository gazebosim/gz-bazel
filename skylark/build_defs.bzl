load(
    ":cmake_configure_file.bzl",
    _cmake_configure_file = "cmake_configure_file",
)
load(
    ":gz_configure_file.bzl",
    _gz_configure_header = "gz_configure_file",
)
load(
    ":gz_export_header.bzl",
    _gz_export_header = "gz_export_header",
)
load(
    ":gz_include_header.bzl",
    _gz_include_header = "gz_include_header",
)
load(
    "@gz//bazel/lint:lint.bzl",
    _add_lint_tests = "add_lint_tests",
)
load(
    "@rules_python//python:defs.bzl",
    _py_binary = "py_binary",
    _py_library = "py_library",
    _py_test = "py_test",
)

GZ_ROOT = "@gz//"

GZ_VISIBILITY = [
    "//:__subpackages__",
    "//experimental:__subpackages__",
]

GZ_FEATURES = [
    "-parse_headers",
    "-use_header_modules",
    "-layering_check",
]

cmake_configure_file = _cmake_configure_file
gz_configure_header = _gz_configure_header
gz_configure_file = _gz_configure_header
gz_export_header = _gz_export_header
gz_include_header = _gz_include_header
add_lint_tests = _add_lint_tests

gz_py_binary = _py_binary
gz_py_library = _py_library
gz_py_test = _py_test
