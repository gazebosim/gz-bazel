load("@ignition//tools/workspace:mirrors.bzl", "DEFAULT_MIRRORS")
load("@ignition//tools/workspace/assimp:repository.bzl", "assimp_repository")  # noqa
load("@ignition//tools/workspace/bazel_skylib:repository.bzl", "bazel_skylib_repository")  # noqa
load("@ignition//tools/workspace/boost:repository.bzl", "boost_repository")  # noqa
load("@ignition//tools/workspace/buildifier:repository.bzl", "buildifier_repository")  # noqa
load("@ignition//tools/workspace/bullet:repository.bzl", "bullet_repository")  # noqa
load("@ignition//tools/workspace/curl:repository.bzl", "curl_repository")  # noqa
load("@ignition//tools/workspace/eigen:repository.bzl", "eigen_repository")  # noqa
load("@ignition//tools/workspace/fcl:repository.bzl", "fcl_repository")  # noqa
load("@ignition//tools/workspace/ffmpeg:repository.bzl", "ffmpeg_repository")  # noqa
load("@ignition//tools/workspace/freeimage:repository.bzl", "freeimage_repository")  # noqa
load("@ignition//tools/workspace/freetype:repository.bzl", "freetype_repository")  # noqa
load("@ignition//tools/workspace/gl:repository.bzl", "gl_repository")  # noqa
load("@ignition//tools/workspace/glib:repository.bzl", "glib_repository")  # noqa
load("@ignition//tools/workspace/gtest:repository.bzl", "gtest_repository")  # noqa
load("@ignition//tools/workspace/gts:repository.bzl", "gts_repository")  # noqa
load("@ignition//tools/workspace/jsoncpp:repository.bzl", "jsoncpp_repository")  # noqa
load("@ignition//tools/workspace/ode:repository.bzl", "ode_repository")  # noqa
load("@ignition//tools/workspace/nlopt:repository.bzl", "nlopt_repository")  # noqa
load("@ignition//tools/workspace/pycodestyle:repository.bzl", "pycodestyle_repository")  # noqa
load("@ignition//tools/workspace/rules_proto:repository.bzl", "rules_proto_repository")  # noqa
load("@ignition//tools/workspace/rules_python:repository.bzl", "rules_python_repository")  # noqa
load("@ignition//tools/workspace/tinyxml2:repository.bzl", "tinyxml2_repository")  # noqa
load("@ignition//tools/workspace/uuid:repository.bzl", "uuid_repository")  # noqa
load("@ignition//tools/workspace/X:repository.bzl", "X_repository")  # noqa
load("@ignition//tools/workspace/yaml:repository.bzl", "yaml_repository")  # noqa
load("@ignition//tools/workspace/zip:repository.bzl", "zip_repository")  # noqa
load("@ignition//tools/workspace/zmq:repository.bzl", "zmq_repository")  # noqa


def add_default_repositories(excludes = [], mirrors = DEFAULT_MIRRORS):
    if "assimp" not in excludes:
        assimp_repository(name = "assimp", mirrors = mirrors)
    if "bazel_skylib" not in excludes:
        bazel_skylib_repository(name = "bazel_skylib", mirrors = mirrors)
    if "boost" not in excludes:
        boost_repository(name = "boost", mirrors = mirrors)
    if "buildifier" not in excludes:
        buildifier_repository(name = "buildifier", mirrors = mirrors)
    if "bullet" not in excludes:
        bullet_repository(name = "bullet", mirrors = mirrors)
    if "curl" not in excludes:
        curl_repository(name = "curl", mirrors = mirrors)
    if "fcl" not in excludes:
        fcl_repository(name = "fcl", mirrors = mirrors)
    if "gl" not in excludes:
        gl_repository(name = "gl", mirrors = mirrors)
    if "glib" not in excludes:
        glib_repository(name = "glib", mirrors = mirrors)
    if "gtest" not in excludes:
        gtest_repository(name = "gtest", mirrors = mirrors)
    if "gts" not in excludes:
        gts_repository(name = "gts", mirrors = mirrors)
    if "eigen" not in excludes:
        eigen_repository(name = "eigen3", mirrors = mirrors)
    if "ffmpeg" not in excludes:
        ffmpeg_repository(name = "ffmpeg", mirrors = mirrors)
    if "freeimage" not in excludes:
        freeimage_repository(name = "freeimage", mirrors = mirrors)
    if "freetype" not in excludes:
        freetype_repository(name = "freetype", mirrors = mirrors)
    if "jsoncpp" not in excludes:
        jsoncpp_repository(name = "jsoncpp", mirrors = mirrors)
    if "nlopt" not in excludes:
        nlopt_repository(name = "nlopt", mirrors = mirrors)
    if "ode" not in excludes:
        ode_repository(name = "ode", mirrors = mirrors)
    if "pycodestyle" not in excludes:
        pycodestyle_repository(name = "pycodestyle", mirrors = mirrors)
    if "rules_proto" not in excludes:
        rules_proto_repository(name = "rules_proto", mirrors = mirrors)
    if "rules_python" not in excludes:
        rules_python_repository(name = "rules_python", mirrors = mirrors)
    if "tinyxml2" not in excludes:
        tinyxml2_repository(name = "tinyxml2", mirrors = mirrors)
    if "uuid" not in excludes:
        uuid_repository(name = "uuid", mirrors = mirrors)
    if "X" not in excludes:
        X_repository(name = "X", mirrors = mirrors)
    if "yaml" not in excludes:
        yaml_repository(name = "yaml", mirrors = mirrors)
    if "zip" not in excludes:
        zip_repository(name = "zip", mirrors = mirrors)
    if "zmq" not in excludes:
        zmq_repository(name = "zmq", mirrors = mirrors)

def add_default_workspace(
    repository_excludes = [],
    mirrors = DEFAULT_MIRRORS):

  add_default_repositories(excludes = repository_excludes, mirrors = mirrors)
