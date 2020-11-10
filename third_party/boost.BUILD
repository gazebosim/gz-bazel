package(default_visibility = ["//visibility:public"])

cc_library(
    name = "system",
    hdrs = glob(["system/*.hpp", "system/**/*.hpp"]), 
    includes = ["."],
    linkopts = [
      "-lboost_system",
    ],
)

cc_library(
    name = "filesystem",
    hdrs = ["filesystem.hpp"] + 
      glob(["filesystem/*.hpp", "filesystem/**/*.hpp"]), 
    includes = ["."],
    linkopts = [
      "-lboost_filesystem",
    ],
    deps = [
      ":system",
    ],
)

cc_library(
    name = "regex",
    hdrs = ["regex.hpp"] + 
      glob(["regex/*.hpp", "regex/**/*.hpp"]), 
    includes = ["."],
    linkopts = [
      "-lboost_regex",
    ],
)

