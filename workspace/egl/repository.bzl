load("@gz//bazel/workspace:os.bzl", "determine_os")
load("@gz//bazel/workspace:pkg_config.bzl", "setup_pkg_config_repository")

def _impl(repository_ctx):
    os_result = determine_os(repository_ctx)
    if os_result.error != None:
        fail(os_result.error)

    if os_result.is_ubuntu:
        error = setup_pkg_config_repository(repository_ctx).error
        if error != None:
            fail(error)

egl_repository = repository_rule(
    attrs = {
        "modname": attr.string(default = "egl"),
        "licenses": attr.string_list(default = ["notice"]),  # X11/MIT
    },
    local = True,
    configure = True,
    implementation = _impl,
)
