load("@gz//bazel/workspace:os.bzl", "determine_os")

def _impl(repository_ctx):
    os_result = determine_os(repository_ctx)

    if os_result.error != None:
        fail(os_result.error)

    if os_result.is_ubuntu:
        libdir = "/usr/lib/x86_64-linux-gnu"
        repository_ctx.symlink("/usr/include/x86_64-linux-gnu/libavcodec", "include/libavcodec")
        repository_ctx.symlink("/usr/include/x86_64-linux-gnu/libavdevice", "include/libavdevice")
        repository_ctx.symlink("/usr/include/x86_64-linux-gnu/libavfilter", "include/libavfilter")
        repository_ctx.symlink("/usr/include/x86_64-linux-gnu/libavformat", "include/libavformat")
        repository_ctx.symlink("/usr/include/x86_64-linux-gnu/libswresample", "include/libswresample")
        repository_ctx.symlink("/usr/include/x86_64-linux-gnu/libavutil", "include/libavutil")
        repository_ctx.symlink("/usr/include/x86_64-linux-gnu/libswscale", "include/libswscale")

    # Declare the libdir
    repository_ctx.file(
        "vars.bzl",
        content = "LIBDIR = \"{}\"\n".format(libdir),
        executable = False,
    )

    # Add the BUILD file.
    repository_ctx.symlink(
        Label("@gz//bazel/workspace/ffmpeg:package.BUILD.bazel"),
        "BUILD.bazel",
    )

ffmpeg_repository = repository_rule(
    local = True,
    configure = True,
    implementation = _impl,
)
