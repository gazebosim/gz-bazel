def glib_repository(
        name,
        mirrors = None):
    native.new_local_repository(
        name = name,
        path = "/usr",
        build_file = "@ignition//tools/workspace/glib:package.BUILD.bazel",
    )
