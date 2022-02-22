def jsoncpp_repository(
        name,
        mirrors = None):
    native.new_local_repository(
        name = name,
        path = "/usr/include/jsoncpp",
        build_file = "@ignition//tools/workspace/jsoncpp:package.BUILD.bazel",
    )
