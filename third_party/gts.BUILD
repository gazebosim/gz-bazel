package(default_visibility = ["//visibility:public"])

cc_library(
    name = "gts",
    hdrs = glob(["include/glib-2.0/**"]),
    includes = ["include", 
                "lib/x86_64-linux-gnu/glib-2.0/include"],
    linkopts = [
      "-lgts",
      "-lm"
    ],
    deps = [
      "@glib"
    ]
)
