load("@gz//bazel/workspace:os.bzl", "determine_os")

def _impl(repository_ctx):
    os_result = determine_os(repository_ctx)

    if os_result.error != None:
        fail(os_result.error)

    if os_result.is_ubuntu or os_result.is_debian or os_result.is_manylinux:
        build_flavor = "ubuntu"
        hdrs = [
            "uuid/uuid.h",
        ]
        for hdr in hdrs:
            repository_ctx.symlink(
                "/usr/include/{}".format(hdr),
                "include/{}".format(hdr),
            )
    else:
        fail("Operating system is NOT supported {}".format(os_result))

    repository_ctx.symlink(
        Label(
            "@gz//bazel/workspace/uuid:package.BUILD.bazel",
        ),
        "BUILD.bazel",
    )

uuid_repository = repository_rule(
    local = True,
    configure = True,
    implementation = _impl,
)
