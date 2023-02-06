load("@gz//bazel/workspace:os.bzl", "determine_os")

def _impl(repository_ctx):
    os_result = determine_os(repository_ctx)

    if os_result.error != None:
        fail(os_result.error)

    if os_result.is_ubuntu:
        libdir = "/usr/lib/x86_64-linux-gnu/"
        repository_ctx.symlink("/usr/include/osg", "include/osg")
        repository_ctx.symlink("/usr/include/osgAnimation", "include/osgAnimation")
        repository_ctx.symlink("/usr/include/osgDB", "include/osgDB")
        repository_ctx.symlink("/usr/include/osgFX", "include/osgFX")
        repository_ctx.symlink("/usr/include/osgGA", "include/osgGA")
        repository_ctx.symlink("/usr/include/osgManipulator", "include/osgManipulator")
        repository_ctx.symlink("/usr/include/osgParticle", "include/osgParticle")
        repository_ctx.symlink("/usr/include/osgPresentation", "include/osgPresentation")
        repository_ctx.symlink("/usr/include/osgShadow", "include/osgShadow")
        repository_ctx.symlink("/usr/include/osgSim", "include/osgSim")
        repository_ctx.symlink("/usr/include/osgTerrain", "include/osgTerrain")
        repository_ctx.symlink("/usr/include/osgText", "include/osgText")
        repository_ctx.symlink("/usr/include/osgUI", "include/osgUI")
        repository_ctx.symlink("/usr/include/osgUtil", "include/osgUtil")
        repository_ctx.symlink("/usr/include/osgViewer", "include/osgViewer")
        repository_ctx.symlink("/usr/include/osgVolume", "include/osgVolume")
        repository_ctx.symlink("/usr/include/osgWidget", "include/osgWidget")

    # Declare the libdir
    repository_ctx.file(
        "vars.bzl",
        content = "LIBDIR = \"{}\"\n".format(libdir),
        executable = False,
    )

    # Add the BUILD file.
    repository_ctx.symlink(
        Label("@gz//bazel/workspace/osg:package.BUILD.bazel"),
        "BUILD.bazel",
    )

osg_repository = repository_rule(
    local = True,
    configure = True,
    implementation = _impl,
)
