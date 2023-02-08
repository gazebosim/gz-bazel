# -*- python -*-

load("@gz//bazel/workspace:mirrors.bzl", "DEFAULT_MIRRORS")
load("@gz//bazel/workspace:os.bzl", "os_repository")
load("@gz//bazel/workspace/bazel_skylib:repository.bzl", "bazel_skylib_repository")  # noqa
load("@gz//bazel/workspace/buildifier:repository.bzl", "buildifier_repository")  # noqa
load("@gz//bazel/workspace/pycodestyle:repository.bzl", "pycodestyle_repository")  # noqa
load("@gz//bazel/workspace/rules_python:repository.bzl", "rules_python_repository")  # noqa

def add_default_repositories(excludes = [], mirrors = DEFAULT_MIRRORS):
    """Declares workspace repositories for all externals needed by drake (other
    than those built into Bazel, of course).  This is intended to be loaded and
    called from a WORKSPACE file.
    Args:
        excludes: list of string names of repositories to exclude; this can
          be useful if a WORKSPACE file has already supplied its own external
          of a given name.
    """
    if "bazel_skylib" not in excludes:
        bazel_skylib_repository(name = "bazel_skylib", mirrors = mirrors)
    if "buildifier" not in excludes:
        buildifier_repository(name = "buildifier", mirrors = mirrors)
    if "pycodestyle" not in excludes:
        pycodestyle_repository(name = "pycodestyle", mirrors = mirrors)
    if "rules_python" not in excludes:
        rules_python_repository(name = "rules_python", mirrors = mirrors)

def add_default_toolchains(excludes = []):
    """Register toolchains for each language (e.g., "py") not explicitly
    excluded and/or not using an automatically generated toolchain.
    Args:
        excludes: List of languages for which a toolchain should not be
            registered.
    """

    if "py" not in excludes:
        # The Python debug toolchain on Linux is not loaded automatically, but
        # may be used by specifying the command line option
        # --extra_toolchains=//tools/py_toolchain:linux_dbg_toolchain
        native.register_toolchains(
            "@gz//bazel/py_toolchain:linux_toolchain",
        )

def add_default_workspace(
        repository_excludes = [],
        toolchain_excludes = [],
        mirrors = DEFAULT_MIRRORS):
    """Declare repositories in this WORKSPACE for each dependency of @drake
    (e.g., "eigen") that is not explicitly excluded, and register toolchains
    for each language (e.g., "py") not explicitly excluded and/or not using an
    automatically generated toolchain.
    Args:
        repository_excludes: List of repositories that should not be declared
            in this WORKSPACE.
        toolchain_excludes: List of languages for which a toolchain should not
            be registered.
        mirrors: Dictionary of mirrors from which to download repository files.
            See mirrors.bzl file in this directory for the file format and
            default values.
    """

    add_default_repositories(excludes = repository_excludes, mirrors = mirrors)
    add_default_toolchains(excludes = toolchain_excludes)
