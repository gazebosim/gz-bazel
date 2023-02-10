load("@gz//bazel/workspace:os.bzl", "determine_os")

def _impl(repository_ctx):
    os_result = determine_os(repository_ctx)

    if os_result.error != None:
        fail(os_result.error)

    if os_result.is_ubuntu:
        libdir = "/usr/lib"
        repository_ctx.symlink("/usr/include/fcl", "include/fcl")

    # Declare the libdir
    repository_ctx.file(
        "vars.bzl",
        content = "LIBDIR = \"{}\"\n".format(libdir),
        executable = False,
    )

    # Add the BUILD file.
    repository_ctx.symlink(
        Label("@gz//bazel/workspace/fcl:package.BUILD.bazel"),
        "BUILD.bazel",
    )

fcl_repository = repository_rule(
    local = True,
    configure = True,
    implementation = _impl,
)
