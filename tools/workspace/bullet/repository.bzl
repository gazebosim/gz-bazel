def bullet_repository(
        name,
        mirrors = None):
    native.new_local_repository(
        name = name,
        path = "/usr/include",
        build_file = "@ignition//tools/workspace/bullet:package.BUILD.bazel",
    )
