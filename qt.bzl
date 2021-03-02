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

# Copied from
# https://github.com/justbuchanan/bazel_rules_qt

load("@rules_cc//cc:defs.bzl", "cc_binary")

def qt_moc(hdrs):
    _moc_srcs = []
    for hdr in hdrs:
        header_path = "%s" % (hdr.replace("//", "").replace(":", "/")) if len(native.package_name()) > 0 else hdr
        moc_name = "%s_moc" % hdr.replace(".", "_").replace("//", "").replace("/", "_").replace(":", "_")
        native.genrule(
            name = moc_name,
            srcs = [hdr],
            outs = [moc_name + ".cc"],
            cmd = "qtchooser -qt=5 -run-tool=moc $(location %s) -o $@ -f'%s'" %
                  (hdr, header_path),
        )
        _moc_srcs.append(moc_name)
    return _moc_srcs

def qt_cc_binary(name, srcs, hdrs, linkopts, normal_hdrs = [], deps = None, **kwargs):
    """Compiles a QT library and generates the MOC for it.
    If a UI file is provided, then it is also compiled with UIC.
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
        header_path = "%s" % (hdr.replace("//", "").replace(":", "/")) if len(native.package_name()) > 0 else hdr
        moc_name = "%s_moc" % hdr.replace(".", "_").replace("//", "").replace("/", "_").replace(":", "_")
        native.genrule(
            name = moc_name,
            srcs = [hdr],
            outs = [moc_name + ".cc"],
            cmd = "qtchooser -qt=5 -run-tool=moc $(location %s) -o $@ -f'%s'" %
                  (hdr, header_path),
        )
        _moc_srcs.append(":" + moc_name)
    cc_binary(
        name = name,
        srcs = srcs + _moc_srcs + hdrs + normal_hdrs,
        linkopts = linkopts,
        deps = deps,
        **kwargs
    )

def qt_cc_library(name, srcs, hdrs, linkopts, normal_hdrs = [], deps = None, **kwargs):
    """Compiles a QT library and generates the MOC for it.
    If a UI file is provided, then it is also compiled with UIC.
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
        header_path = "%s" % (hdr.replace("//", "").replace(":", "/")) if len(native.package_name()) > 0 else hdr
        moc_name = "%s_moc" % hdr.replace(".", "_").replace("//", "").replace("/", "_").replace(":", "_")
        header_path = "/".join(header_path.split("/")[1:])

        native.genrule(
            name = moc_name,
            srcs = [hdr],
            outs = [moc_name + ".cc"],
            cmd = "qtchooser -qt=5 -run-tool=moc $(location %s) -o $@ -f'%s'" %
                  (hdr, header_path),
        )
        _moc_srcs.append(":" + moc_name)
    native.cc_library(
        name = name,
        srcs = srcs + _moc_srcs + hdrs + normal_hdrs,
        linkopts = linkopts,
        deps = deps,
        **kwargs
    )
