load("@ignition//tools/workspace:mirrors.bzl", "DEFAULT_MIRRORS")
load("@ignition//tools/workspace/bazel_skylib:repository.bzl", "bazel_skylib_repository")  # noqa
load("@ignition//tools/workspace/buildifier:repository.bzl", "buildifier_repository")  # noqa
load("@ignition//tools/workspace/eigen:repository.bzl", "eigen_repository")  # noqa
load("@ignition//tools/workspace/gtest:repository.bzl", "gtest_repository")  # noqa
load("@ignition//tools/workspace/pycodestyle:repository.bzl", "pycodestyle_repository")  # noqa
load("@ignition//tools/workspace/rules_python:repository.bzl", "rules_python_repository")  # noqa
load("@ignition//tools/workspace/tinyxml2:repository.bzl", "tinyxml2_repository")  # noqa
load("@ignition//tools/workspace/uuid:repository.bzl", "uuid_repository")  # noqa


def add_default_repositories(excludes = [], mirrors = DEFAULT_MIRRORS):
    if "bazel_skylib" not in excludes:
        bazel_skylib_repository(name = "bazel_skylib", mirrors = mirrors)
    if "buildifier" not in excludes:
        buildifier_repository(name = "buildifier", mirrors = mirrors)
    if "gtest" not in excludes:
        gtest_repository(name = "gtest", mirrors = mirrors)
    if "eigen" not in excludes:
        eigen_repository(name = "eigen3", mirrors = mirrors)
    if "pycodestyle" not in excludes:
        pycodestyle_repository(name = "pycodestyle", mirrors = mirrors)
    if "rules_python" not in excludes:
        rules_python_repository(name = "rules_python", mirrors = mirrors)
    if "tinyxml2" not in excludes:
        tinyxml2_repository(name = "tinyxml2", mirrors = mirrors)
    if "uuid" not in excludes:
        uuid_repository(name = "uuid", mirrors = mirrors)

def add_default_workspace(
    repository_excludes = [],
    mirrors = DEFAULT_MIRRORS):

  add_default_repositories(excludes = repository_excludes, mirrors = mirrors)
