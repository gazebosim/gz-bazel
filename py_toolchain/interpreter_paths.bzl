# -*- python -*-

# Default value of interpreter_path used by the py_runtime in the default
# Python toolchain registered on the @platforms//os:linux platform.
LINUX_INTERPRETER_PATH = "/usr/bin/python3"

# Default value of interpreter_path used by the py_runtime in the Python debug
# toolchain registered on the @platforms//os:linux platform when the
# --extra_toolchains=//tools/py_toolchain:linux_dbg_toolchain command line
# option is given.
LINUX_DBG_INTERPRETER_PATH = "/usr/bin/python3-dbg"
