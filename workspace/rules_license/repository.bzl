# -*- python -*-

load("@gz//bazel/workspace:github.bzl", "github_archive")

def rules_license_repository(
        name,
        mirrors = None):
    github_archive(
        name = name,
        repository = "bazelbuild/rules_license",  # License: Apache-2.0
        commit = "0.0.7",
        sha256 = "7626bea5473d3b11d44269c5b510a210f11a78bca1ed639b0f846af955b0fe31",  # noqa
        mirrors = mirrors,
    )
