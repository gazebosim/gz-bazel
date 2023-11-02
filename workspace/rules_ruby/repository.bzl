# -*- python -*-

load("@gz//bazel/workspace:github.bzl", "github_archive")

def rules_ruby_repository(
        name,
        mirrors = None):
    github_archive(
        name = name,
        repository = "bazelruby/rules_ruby",  # License: Apache-2.0
        commit = "v0.6.0",
        sha256 = "5035393cb5043d49ca9de78acb9e8c8622a193f6463a57ad02383a622b6dc663",  # noqa
        mirrors = mirrors,
    )
