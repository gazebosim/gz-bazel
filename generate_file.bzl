# -*- python -*-

# Copied from the Drake project
# https://github.com/RobotLocomotion/drake/blob/17423f8fb6f292b4af0b4cf3c6c0f157273af501/tools/workspace/generate_file.bzl

def _generate_file_impl(ctx):
    out = ctx.actions.declare_file(ctx.label.name)
    ctx.actions.write(out, ctx.attr.content, ctx.attr.is_executable)
    return [DefaultInfo(
        files = depset([out]),
        data_runfiles = ctx.runfiles(files = [out]),
    )]

generate_file = rule(
    attrs = {
        "content": attr.string(mandatory = True),
        "is_executable": attr.bool(default = False),
    },
    output_to_genfiles = True,
    implementation = _generate_file_impl,
)

"""Generate a file with specified content.
This creates a rule to generate a file with specified content (which is either
static or has been previously computed).
Args:
    content (:obj:`str`): Desired content of the generated file.
"""
