load("@gz//bazel/workspace:os.bzl", "determine_os")

def _impl(repository_ctx):
    os_result = determine_os(repository_ctx)

    if os_result.error != None:
        fail(os_result.error)

    if os_result.is_ubuntu or os_result.is_manylinux:
        hdrs = [
            "GL/gl.h",
            "GL/glcorearb.h",
            "GL/glext.h",
            "KHR/khrplatform.h",
        ]
        for hdr in hdrs:
            repository_ctx.symlink(
                "/usr/include/{}".format(hdr),
                "include/{}".format(hdr),
            )
        repository_ctx.symlink(
            Label("@gz//bazel/workspace/opengl:package.BUILD.bazel"),
            "BUILD.bazel",
        )
    else:
        fail("Operating system is NOT supported {}".format(os_result))

opengl_repository = repository_rule(
    local = True,
    implementation = _impl,
)
