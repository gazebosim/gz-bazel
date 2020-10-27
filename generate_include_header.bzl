# -*- python -*-

# Copied from the drake project
# https://github.com/RobotLocomotion/drake/blob/17423f8fb6f292b4af0b4cf3c6c0f157273af501/tools/workspace/generate_include_header.bzl

load("//ign_bazel:pathutils.bzl", "output_path")

# Generate a header that includes a set of other headers
def _generate_include_header_impl(ctx):
    # Collect list of headers
    hdrs = []
    for h in ctx.attr.hdrs:
        for f in h.files.to_list():
            hdrs.append(output_path(ctx, f, ctx.attr.strip_prefix))

    # Generate include header
    content = "#pragma once\n"
    content = content + "\n".join(["#include \"%s\"" % h for h in hdrs])
    ctx.actions.write(output = ctx.outputs.out, content = content)

generate_include_header = rule(
    attrs = {
        "hdrs": attr.label_list(allow_files = True),
        "strip_prefix": attr.string_list(default = ["**/include/"]),
        "out": attr.output(mandatory = True),
    },
    output_to_genfiles = True,
    implementation = _generate_include_header_impl,
)

"""Generate a header that includes a set of other headers.
This creates a rule to generate a header that includes a list of other headers.
The generated file will be of the form::
    #include "hdr"
    #include "hdr"
Args:
    hdrs (:obj:`str`): List of files or file labels of headers that the
        generated header will include.
    strip_prefix (:obj:`list` of :obj:`str`): List of prefixes to strip from
        the header names when forming the ``#include`` directives.
"""
