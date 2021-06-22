#
# Copyright 2020 Justin Buchanan
# Copyright 2016 Ben Breslauer
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

load("@rules_cc//cc:defs.bzl", "cc_library")

def qt_ui_library(name, ui, deps, **kwargs):
    """Compiles a QT UI file and makes a library for it.

    Args:
      name: A name for the rule.
      src: The ui file to compile.
      deps: cc_library dependencies for the library.
    """
    native.genrule(
        name = "%s_uic" % name,
        srcs = [ui],
        outs = ["ui_%s.h" % ui.split(".")[0]],
        cmd = "uic $(locations %s) -o $@" % ui,
    )
    cc_library(
        name = name,
        hdrs = [":%s_uic" % name],
        deps = deps,
        **kwargs
    )

def _qt_rcc(ctx):
    # Symlink QRC file
    qrc_file = (ctx.file.qrc, ctx.actions.declare_file(ctx.file.qrc.path))
    ctx.actions.symlink(
        output = qrc_file[1],
        target_file = qrc_file[0],
    )

    # Symlink resources
    resource_files = [(f, ctx.actions.declare_file(f.path)) for f in ctx.files.files]
    for target_file, output in resource_files:
        ctx.actions.symlink(
            output = output,
            target_file = target_file,
         )

    args = ["--name", ctx.attr.resource_name, "--output", ctx.outputs.cpp.path, qrc_file[1].path]
    ctx.actions.run(
        inputs = [resource for _, resource in resource_files] + [qrc_file[1]],
        outputs = [ctx.outputs.cpp],
        arguments = args,
        executable = "rcc",
     )
    return [OutputGroupInfo(cpp = depset([ctx.outputs.cpp]))]

qt_rcc = rule(
    implementation = _qt_rcc,
    attrs = {
        "resource_name": attr.string(),
        "files": attr.label_list(allow_files = True, mandatory = False),
        "qrc": attr.label(allow_single_file = True, mandatory = True),
        "cpp": attr.output(),
    },
)

def qt_resource(name, qrc_file, files, **kwargs):

    outfile = name + "_gen.cpp"

    qt_rcc(
        name = name + "_gen",
        resource_name = name,
        files = files,
        qrc = qrc_file,
        cpp = outfile,
    )

    cc_library(
        name = name,
        srcs = [outfile],
        alwayslink = 1,
        **kwargs
    )

def qt_cc_library(name, srcs, hdrs, normal_hdrs = [], deps = None, **kwargs):
    """Compiles a QT library and generates the MOC for it.

    Args:
      name: A name for the rule.
      srcs: The cpp files to compile.
      hdrs: The header files that the MOC compiles to src.
      normal_hdrs: Headers which are not sources for generated code.
      deps: cc_library dependencies for the library.
      kwargs: Any additional arguments are passed to the cc_library rule.
    """
    _moc_srcs = []
    for hdr in hdrs:
        header_path = "%s/%s" % (native.package_name(), hdr) if len(native.package_name()) > 0 else hdr
        moc_name = "%s_moc" % hdr.replace(".", "_")
        native.genrule(
            name = moc_name,
            srcs = [hdr],
            outs = [moc_name + ".cc"],
            cmd = "moc $(location %s) -o $@ -f'%s'" %
                  (hdr, header_path),
        )
        _moc_srcs.append(":" + moc_name)
    cc_library(
        name = name,
        srcs = srcs + _moc_srcs,
        hdrs = hdrs + normal_hdrs,
        deps = deps,
        **kwargs
    )
