# -*- python -*-

load("@gz//bazel/workspace:github.bzl", "github_archive")

def rules_qt_repository(
        name,
        mirrors = None):
    github_archive(
        name = name,
        repository = "mjcarroll/bazel_rules_qt",  # License: Apache-2.0
        commit = "056d0558f6d31a0183aba62ea471b95646058899",
        sha256 = "35136d56cadbee7b7c1b4f6bac758b209355022da2e493f7ccde38a86a790168",  # noqa
        mirrors = mirrors,
    )
