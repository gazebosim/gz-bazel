load("@gz//bazel/workspace:os.bzl", "determine_os")

def _impl(repository_ctx):
    os_result = determine_os(repository_ctx)

    if os_result.error != None:
        fail(os_result.error)

    if os_result.is_ubuntu or os_result.is_manylinux:
        repository_ctx.symlink(
            "/usr/include/X11",
            "include/X11",
        )
        repository_ctx.symlink(
            Label("@gz//bazel/workspace/x11:package.BUILD.bazel"),
            "BUILD.bazel",
        )
    else:
        fail("Operating system is NOT supported {}".format(os_result))

x11_repository = repository_rule(
    local = True,
    implementation = _impl,
)
