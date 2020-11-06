package(default_visibility = ["//visibility:public"])

cc_library(
    name = "glib",
    hdrs = glob(["include/glib-2.0/**"]) + 
      ["lib/x86_64-linux-gnu/glib-2.0/include/glibconfig.h"],
    includes = [
      "include/glib-2.0/", 
      "lib/x86_64-linux-gnu/glib-2.0/include/"
    ],
    linkopts = [
        "-lglib-2.0",
        "-lgobject-2.0",
        "-lgio-2.0",
        "-lgthread-2.0",
    ],
)
