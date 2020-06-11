load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//ign_bazel:repositories.bzl", "ignition_repositories")
ignition_repositories()
load(
    "@rules_proto//proto:repositories.bzl",
    "rules_proto_dependencies",
    "rules_proto_toolchains"
)
rules_proto_dependencies()
rules_proto_toolchains()

new_local_repository(
    name = "freetype2",
    path = "/usr/include/freetype2",
    build_file_content = """
package(default_visibility = ["//visibility:public"])
cc_library(
    name = "headers",
    hdrs = glob(["**/*.h"])
)
"""
)

new_local_repository(
    name = "glib",
    path = "/usr/include/glib-2.0",
    build_file_content = """
package(default_visibility = ["//visibility:public"])
cc_library(
    name = "headers",
    hdrs = glob(["**/*.h"])
)
"""
)

new_local_repository(
    name = "glibconfig",
    path = "/usr/lib/x86_64-linux-gnu/glib-2.0/include",
    build_file_content = """
package(default_visibility = ["//visibility:public"])
cc_library(
    name = "headers",
    hdrs = glob(["**/*.h"])
)
"""
)
