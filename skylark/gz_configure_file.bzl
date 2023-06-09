def _gz_configure_file_impl(ctx):
    # The list of arguments we pass to the script.
    # volatile status file: ctx.version_file
    # stable status file: ctx.info_file
    arguments = [
        "--input",
        ctx.file.src.path,
        "--output",
        ctx.outputs.out.path,
        "--package",
        ctx.attr.package,
        "--stable",
        ctx.info_file.path,
    ]

    for item in ctx.attr.defines:
        arguments += ["-D" + item]
    for item in ctx.attr.undefines:
        arguments += ["-U" + item]
    for item in ctx.files.cmakelists:
        arguments += ["--cmakelists", item.path]

    # Action to call the script.
    ctx.actions.run(
        inputs = [ctx.file.src, ctx.info_file] + ctx.files.cmakelists,
        outputs = [ctx.outputs.out],
        arguments = arguments,
        env = ctx.attr.env,
        executable = ctx.executable.gz_configure_file_py,
    )
    return []

_gz_configure_file_gen = rule(
    attrs = {
        "src": attr.label(
            allow_single_file = True,
            mandatory = True,
        ),
        "out": attr.output(mandatory = True),
        "package": attr.string(mandatory = True),
        "defines": attr.string_list(),
        "undefines": attr.string_list(),
        "cmakelists": attr.label_list(allow_files = True),
        "gz_configure_file_py": attr.label(
            cfg = "host",
            executable = True,
            default = Label("@gz//bazel/skylark:gz_configure_file"),
        ),
        "env": attr.string_dict(
            mandatory = True,
            allow_empty = True,
        ),
    },
    implementation = _gz_configure_file_impl,
)

def gz_configure_file(
        name,
        package = None,
        src = None,
        out = None,
        defines = None,
        undefines = None,
        cmakelists = None,
        **kwargs):
    if not out:
        out = src
        idx = out.find(".in")
        if (idx > 0):
            out = out[0:idx]

    _gz_configure_file_gen(
        name = name,
        package = package,
        src = src,
        out = out,
        defines = defines,
        undefines = undefines,
        cmakelists = cmakelists,
        env = {},
        **kwargs
    )
