def zmq_repository(
        name,
        mirrors = None):
    native.new_local_repository(
        name = name,
        path = "/usr/include",
        build_file = "@ignition//tools/workspace/zmq:package.BUILD.bazel",
    )
