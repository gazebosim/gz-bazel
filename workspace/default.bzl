# -*- python -*-

load("@gz//bazel/workspace:mirrors.bzl", "DEFAULT_MIRRORS")
load("@gz//bazel/workspace:os.bzl", "os_repository")
load("@gz//bazel/workspace/assimp:repository.bzl", "assimp_repository")  # noqa
load("@gz//bazel/workspace/bazel_skylib:repository.bzl", "bazel_skylib_repository")  # noqa
load("@gz//bazel/workspace/buildifier:repository.bzl", "buildifier_repository")  # noqa
load("@gz//bazel/workspace/cli11:repository.bzl", "cli11_repository")  # noqa
load("@gz//bazel/workspace/console_bridge:repository.bzl", "console_bridge_repository")  # noqa
load("@gz//bazel/workspace/curl:repository.bzl", "curl_repository")  # noqa
load("@gz//bazel/workspace/egl:repository.bzl", "egl_repository")  # noqa
load("@gz//bazel/workspace/eigen:repository.bzl", "eigen_repository")  # noqa
load("@gz//bazel/workspace/fcl:repository.bzl", "fcl_repository")  # noqa
load("@gz//bazel/workspace/ffmpeg:repository.bzl", "ffmpeg_repository")  # noqa
load("@gz//bazel/workspace/freeimage:repository.bzl", "freeimage_repository")  # noqa
load("@gz//bazel/workspace/freetype2:repository.bzl", "freetype2_repository")  # noqa
load("@gz//bazel/workspace/gdal:repository.bzl", "gdal_repository")  # noqa
load("@gz//bazel/workspace/glib:repository.bzl", "glib_repository")  # noqa
load("@gz//bazel/workspace/glslang:repository.bzl", "glslang_repository")  # noqa
load("@gz//bazel/workspace/glx:repository.bzl", "glx_repository")  # noqa
load("@gz//bazel/workspace/gtest:repository.bzl", "gtest_repository")  # noqa
load("@gz//bazel/workspace/gts:repository.bzl", "gts_repository")  # noqa
load("@gz//bazel/workspace/json:repository.bzl", "json_repository")  # noqa
load("@gz//bazel/workspace/ode:repository.bzl", "ode_repository")  # noqa
load("@gz//bazel/workspace/opengl:repository.bzl", "opengl_repository")  # noqa
load("@gz//bazel/workspace/osg:repository.bzl", "osg_repository")  # noqa
load("@gz//bazel/workspace/pycodestyle:repository.bzl", "pycodestyle_repository")  # noqa
load("@gz//bazel/workspace/nlopt:repository.bzl", "nlopt_repository")  # noqa
load("@gz//bazel/workspace/rules_proto:repository.bzl", "rules_proto_repository")  # noqa
load("@gz//bazel/workspace/rules_python:repository.bzl", "rules_python_repository")  # noqa
load("@gz//bazel/workspace/sdl2:repository.bzl", "sdl2_repository")  # noqa
load("@gz//bazel/workspace/sqlite3:repository.bzl", "sqlite3_repository")  # noqa
load("@gz//bazel/workspace/tinyxml2:repository.bzl", "tinyxml2_repository")  # noqa
load("@gz//bazel/workspace/urdfdom:repository.bzl", "urdfdom_repository")  # noqa
load("@gz//bazel/workspace/uuid:repository.bzl", "uuid_repository")  # noqa
load("@gz//bazel/workspace/vulkan:repository.bzl", "vulkan_repository")  # noqa
load("@gz//bazel/workspace/x11:repository.bzl", "x11_repository")  # noqa
load("@gz//bazel/workspace/xcb:repository.bzl", "xcb_repository")  # noqa
load("@gz//bazel/workspace/yaml:repository.bzl", "yaml_repository")  # noqa
load("@gz//bazel/workspace/zip:repository.bzl", "zip_repository")  # noqa
load("@gz//bazel/workspace/zmq:repository.bzl", "zmq_repository")  # noqa
load("@gz//bazel/workspace/zzip:repository.bzl", "zzip_repository")  # noqa

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
    if "cli11" not in excludes:
        cli11_repository(name = "cli11", mirrors = mirrors)
    if "gtest" not in excludes:
        gtest_repository(name = "gtest", mirrors = mirrors)
    if "rules_proto" not in excludes:
        rules_proto_repository(name = "rules_proto", mirrors = mirrors)
    if "rules_python" not in excludes:
        rules_python_repository(name = "rules_python", mirrors = mirrors)

    if "assimp" not in excludes:
        assimp_repository(name = "assimp")
    if "console_bridge" not in excludes:
        console_bridge_repository(name = "console_bridge")
    if "curl" not in excludes:
        curl_repository(name = "curl")
    if "egl" not in excludes:
        egl_repository(name = "egl")
    if "eigen" not in excludes:
        eigen_repository(name = "eigen")
    if "fcl" not in excludes:
        fcl_repository(name = "fcl")
    if "ffmpeg" not in excludes:
        ffmpeg_repository(name = "ffmpeg")
    if "freeimage" not in excludes:
        freeimage_repository(name = "freeimage")
    if "freetype2" not in excludes:
        freetype2_repository(name = "freetype2")
    if "gdal" not in excludes:
        gdal_repository(name = "gdal")
    if "glslang" not in excludes:
        glslang_repository(name = "glslang")
    if "glib" not in excludes:
        glib_repository(name = "glib")
    if "glx" not in excludes:
        glx_repository(name = "glx")
    if "gts" not in excludes:
        gts_repository(name = "gts")
    if "json" not in excludes:
        json_repository(name = "json")
    if "nlopt" not in excludes:
        nlopt_repository(name = "nlopt")
    if "ode" not in excludes:
        ode_repository(name = "ode")
    if "opengl" not in excludes:
        opengl_repository(name = "opengl")
    if "osg" not in excludes:
        osg_repository(name = "osg")
    if "pycodestyle" not in excludes:
        pycodestyle_repository(name = "pycodestyle", mirrors = mirrors)
    if "sdl2" not in excludes:
        sdl2_repository(name = "sdl2")
    if "sqlite3" not in excludes:
        sqlite3_repository(name = "sqlite3")
    if "tinyxml2" not in excludes:
        tinyxml2_repository(name = "tinyxml2")
    if "urdfdom" not in excludes:
        urdfdom_repository(name = "urdfdom")
    if "uuid" not in excludes:
        uuid_repository(name = "uuid")
    if "vulkan" not in excludes:
        vulkan_repository(name = "vulkan")
    if "x11" not in excludes:
        x11_repository(name = "x11")
    if "xcb" not in excludes:
        xcb_repository(name = "xcb")
    if "yaml" not in excludes:
        yaml_repository(name = "yaml")
    if "zip" not in excludes:
        zip_repository(name = "zip")
    if "zmq" not in excludes:
        zmq_repository(name = "zmq")
    if "zzip" not in excludes:
        zzip_repository(name = "zzip")

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
