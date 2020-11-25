package(default_visibility = ["//visibility:public"])

cc_library(
    name = "core",
    hdrs = glob(["osg/*"]), 
    includes = ["."],
    linkopts = [
      "-losg"
    ],
)

modules = ["Animation", "DB", "FX", "GA", "Manipulator", "Particle", "Presentation", "Shadow", "Sim", "Terrain", "Text", "UI", "Util", "Viewer", "Widget"]


[
    cc_library(
        name = "osg" + module,
        hdrs = glob(["osg" + module + "*"]),
        includes = ["."],
        linkopts = [
          "-losg" + module,
        ],
        deps = [ ":core" ],
    )
    for module in modules
]

cc_library(
    name = "osg",
    deps = [":osg" + module for module in modules]
)
