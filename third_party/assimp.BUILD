package(default_visibility = ["//visibility:public"])

cc_library(
    name = "assimp",
    hdrs = glob(["assimp/*.h", "assimp/*.hpp", "assimp/*.inl", "assimp/Compiler/*.h"]),
    includes = [".", "assimp"],
    linkopts = [
      "-lassimp",
    ],
)
