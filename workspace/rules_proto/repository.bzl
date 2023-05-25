# -*- python -*-

load("@gz//bazel/workspace:github.bzl", "github_archive")

def rules_proto_repository(
        name,
        mirrors = None):
    github_archive(
        name = name,
        repository = "bazelbuild/rules_proto",  # License: Apache-2.0
        commit = "5.3.0-21.7",
        sha256 = "dc3fb206a2cb3441b485eb1e423165b231235a1ea9b031b4433cf7bc1fa460dd",  # noqa
        mirrors = mirrors,
    )
