load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive",
)

def eigen_repository(
        name,
        mirrors = None):
    http_archive(
        name = name,
        build_file = "@ignition//tools/workspace/eigen:package.BUILD.bazel",
        sha256 = "43590254674cf4d47745c405e434175d11762456cd5f7518899c87d507df9f4a",  # noqa
        urls = [
            "https://gitlab.com/libeigen/eigen/-/archive/3.3/eigen-3.3.tar.gz",
        ],
        strip_prefix = "eigen-3.3",
    )
