load("@gz//bazel/workspace:os.bzl", "determine_os")

def _impl(repository_ctx):
    os_result = determine_os(repository_ctx)

    if os_result.error != None:
        fail(os_result.error)

    if os_result.is_ubuntu or os_result.is_debian:
        libdir = "/usr/lib/x86_64-linux-gnu"
        repository_ctx.symlink("/usr/include/xcb", "include/xcb")

    # Declare the libdir
    repository_ctx.file(
        "vars.bzl",
        content = "LIBDIR = \"{}\"\n".format(libdir),
        executable = False,
    )

    # Add the BUILD file.
    repository_ctx.symlink(
        Label("@gz//bazel/workspace/xcb:package.BUILD.bazel"),
        "BUILD.bazel",
    )

xcb_repository = repository_rule(
    local = True,
    configure = True,
    implementation = _impl,
)
