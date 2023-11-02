load("@gz//bazel/workspace:os.bzl", "determine_os")

def _impl(repository_ctx):
    os_result = determine_os(repository_ctx)

    if os_result.error != None:
        fail(os_result.error)

    if os_result.is_ubuntu or os_result.is_debian:
        repository_ctx.symlink("/usr/include/eigen3/Eigen", "include/eigen3/Eigen")  # noqa
        repository_ctx.symlink("/usr/include/eigen3/unsupported", "include/eigen3/unsupported")  # noqa

    # Add the BUILD file.
    repository_ctx.symlink(
        Label("@gz//bazel/workspace/eigen3:package.BUILD.bazel"),
        "BUILD.bazel",
    )

eigen3_repository = repository_rule(
    local = True,
    configure = True,
    implementation = _impl,
)
