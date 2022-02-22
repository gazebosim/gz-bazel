def ffmpeg_repository(
        name,
        mirrors = None):
    native.new_local_repository(
        name = name,
        path = "/usr/include/x86_64-linux-gnu",
        build_file = "@ignition//tools/workspace/ffmpeg:package.BUILD.bazel",
    )
