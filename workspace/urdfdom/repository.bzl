load("@gz//bazel/workspace:os.bzl", "determine_os")

def _impl(repository_ctx):
    os_result = determine_os(repository_ctx)

    if os_result.error != None:
        fail(os_result.error)

    if os_result.is_ubuntu:
        libdir = "/usr/lib"
        repository_ctx.symlink("/usr/include/urdf_parser", "include/urdf_parser")

        repository_ctx.symlink("/usr/include/urdf_exception", "include/urdf_exception")
        repository_ctx.symlink("/usr/include/urdf_model", "include/urdf_model")
        repository_ctx.symlink("/usr/include/urdf_model_state", "include/urdf_model_state")
        repository_ctx.symlink("/usr/include/urdf_sensor", "include/urdf_sensor")
        repository_ctx.symlink("/usr/include/urdf_world", "include/urdf_world")

    # Declare the libdir
    repository_ctx.file(
        "vars.bzl",
        content = "LIBDIR = \"{}\"\n".format(libdir),
        executable = False,
    )

    # Add the BUILD file.
    repository_ctx.symlink(
        Label("@gz//bazel/workspace/urdfdom:package.BUILD.bazel"),
        "BUILD.bazel",
    )

urdfdom_repository = repository_rule(
    local = True,
    configure = True,
    implementation = _impl,
)
