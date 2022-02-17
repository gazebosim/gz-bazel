load(
    "@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive"
)

def tinyxml2_repository(
        name,
        mirrors = None):

    http_archive(
        name = name,
        build_file = "@ignition//tools/workspace/tinyxml2:package.BUILD.bazel",
        urls = [
          "https://github.com/leethomason/tinyxml2/archive/refs/tags/9.0.0.tar.gz"
        ],
        strip_prefix = "tinyxml2-9.0.0",
    )
