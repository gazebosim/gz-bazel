# -*- python -*-

load("@gz//bazel/workspace:github.bzl", "github_archive")

def rules_qt_repository(
        name,
        mirrors = None):
    github_archive(
        name = name,
        repository = "mjcarroll/bazel_rules_qt",  # License: Apache-2.0
        commit = "709d4432748a1beae0d00a91d53b63b44d38092c",
        sha256 = "c2a6cd95e1737ca6b592cf9ad5a9f03478298707e5e5784e4e661531b1e5640e",  # noqa
        mirrors = mirrors,
    )
