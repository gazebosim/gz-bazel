# -*- python -*-

load("@gz//bazel/workspace:github.bzl", "github_archive")

def cli11_repository(name, mirrors = None):
    github_archive(
        name = name,
        repository = "CLIUtils/CLI11",
        commit = "2.2.0",
        sha256 = "d60440dc4d43255f872d174e416705f56ba40589f6eb07727f76376fb8378fd6",  # noqa
        build_file = ":package.BUILD.bazel",
        mirrors = mirrors,
    )
