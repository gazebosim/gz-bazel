# -*- python -*-

load("@gz//bazel/workspace:github.bzl", "github_archive")

def glfw_repository(name, mirrors = None):
    github_archive(
        name = name,
        repository = "glfw/glfw",
        commit = "3.3.6",
        build_file = ":package.BUILD.bazel"
        mirrors = mirrors,
    )
