def _generate_yaml_impl(ctx):
    ctx.actions.run_shell(
        inputs = [ctx.file.ruby_target],
        outputs = [ctx.outputs.source_file],
        command = "\n".join([
            "echo format: 1.0.0>> %s" % (ctx.outputs.source_file.path),
            "echo library_name: \"%s\">> %s" % (ctx.attr.library_name, ctx.outputs.source_file.path),
            "echo library_version: \"%s\">> %s" % (ctx.attr.library_version, ctx.outputs.source_file.path),
            "echo library_path: $(realpath \"%s\") >> %s" % (ctx.file.ruby_target.path, ctx.outputs.source_file.path),
            "echo commands:>> %s" % (ctx.outputs.source_file.path),
            "echo \"%s\">> %s" % (ctx.attr.commands, ctx.outputs.source_file.path),
        ]),
    )

generate_yaml = rule(
    implementation = _generate_yaml_impl,
    attrs = {
        "library_name": attr.string(mandatory = True),
        "library_version": attr.string(mandatory = True),
        "commands": attr.string(mandatory = True),
        "ruby_target": attr.label(allow_single_file = True),
    },
    outputs = {"source_file": "%{name}.yaml"},
)
