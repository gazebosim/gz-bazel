# -*- python -*-

load("@ignition//tools/workspace:github.bzl", "github_archive")

def rules_proto_repository(
        name,
        mirrors = None):
    github_archive(
        name = name,
        repository = "bazelbuild/rules_proto",
        commit = "4.0.0",
        sha256 = "66bfdf8782796239d3875d37e7de19b1d94301e8972b3cbd2446b332429b4df1",  # noqa
        mirrors = mirrors,
    )
