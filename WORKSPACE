load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//ign_bazel:repositories.bzl", "ignition_repositories")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
ignition_repositories()
load(
    "@rules_proto//proto:repositories.bzl",
    "rules_proto_dependencies",
    "rules_proto_toolchains"
)
rules_proto_dependencies()
rules_proto_toolchains()

git_repository(
    name = "bazelruby_rules_ruby",
    remote = "https://github.com/bazelruby/rules_ruby.git",
    branch = "develop"
)

load(
    "@bazelruby_rules_ruby//ruby:deps.bzl",
    "rules_ruby_dependencies",
    "rules_ruby_select_sdk",
)

rules_ruby_dependencies()

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
bazel_skylib_workspace()

rules_ruby_select_sdk(version = "2.7.0")

load(
    "@bazelruby_rules_ruby//ruby:defs.bzl",
    "ruby_bundle",
)

ruby_bundle(
    name = "bundle",
    excludes = {
        "mini_portile": ["test/**/*"],
    },
    gemfile = "//:Gemfile",
    gemfile_lock = "//:Gemfile.lock",
)

# You can specify more than one bundle in the WORKSPACE file
ruby_bundle(
    name = "bundle_app_shopping",
    gemfile = "//apps/shopping:Gemfile",
    gemfile_lock = "//apps/shopping:Gemfile.lock",
)

new_local_repository(
        name = "json",
        path = "/usr/include/jsoncpp",
        build_file_content = """
package(default_visibility = ["//visibility:public"])
cc_library(
    name = "headers",
    hdrs = glob(["**/*.h"])
)
"""
)
