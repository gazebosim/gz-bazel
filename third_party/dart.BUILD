cc_library(
    name = "dart-dynamics",
    srcs = glob([
        "dart/dynamics/*.cpp",
        "dart/dynamics/detail/*.cpp",
    ]),
    hdrs = glob([
        "dart/dynamics/*.hpp",
        "dart/dynamics/detail/*.hpp",
    ]),
    copts = [
        "-Idart",
    ],
    deps = [
        "@eigen3",
        ":dart-common",
        ":dart-math",
        ":dart-external",
    ],
    visibility = ["//visibility:private"],
    alwayslink = 1,
)

cc_library(
    name = "dart-math",
    srcs = glob([
        "dart/math/*.cpp",
        "dart/math/detail/*.cpp",
    ]),
    hdrs = glob([
        "dart/math/*.hpp",
        "dart/math/detail/*.hpp",
    ]),
    copts = [
        "-Idart",
    ],
    deps = [
        "@eigen3",
        ":dart-common",
    ],
    visibility = ["//visibility:private"],
    alwayslink = 1,
)

cc_library(
    name = "dart-common",
    srcs = glob([
        "dart/common/*.cpp",
        "dart/common/detail/*.cpp",
    ]),
    hdrs = glob([
        "dart/common/*.hpp",
        "dart/common/detail/*.hpp",
    ]),
    deps = [
        "@eigen3",
    ],
    visibility = ["//visibility:private"],
    alwayslink = 1,
)

cc_library(
    name = "dart-collision-core",
    srcs = glob([
        "dart/collision/*.cpp",
        "dart/collision/detail/*.cpp",
    ]),
    hdrs = glob([
        "dart/collision/*.hpp",
        "dart/collision/detail/*.hpp",
    ]),
    copts = [
        "-Idart",
    ],
    deps = [
        "@eigen3",
        ":dart-dynamics",
        ":dart-math",
    ],
    visibility = ["//visibility:private"],
    alwayslink = 1,
)

cc_library(
    name = "dart-collision-ode",
    srcs = glob([
        "dart/collision/ode/*.cpp",
        "dart/collision/ode/detail/*.cpp",
    ]),
    hdrs = glob([
        "dart/collision/ode/*.hpp",
        "dart/collision/ode/detail/*.hpp",
    ]),
    copts = [
        "-Idart",
    ],
    deps = [
        "@eigen3",
        ":dart-dynamics",
        ":dart-math",
        ":dart-collision-core",
    ],
    visibility = ["//visibility:private"],
    alwayslink = 1,
)

cc_library(
    name = "dart-collision-fcl",
    srcs = glob([
        "dart/collision/fcl/*.cpp",
    ]),
    hdrs = glob([
        "dart/collision/fcl/*.hpp",
    ]),
    copts = [
        "-Idart",
    ],
    deps = [
        "@eigen3",
        ":dart-dynamics",
        ":dart-math",
        ":dart-collision-core",
    ],
    visibility = ["//visibility:private"],
    alwayslink = 1,
)

cc_library(
    name = "dart-collision-dart",
    srcs = glob([
        "dart/collision/dart/*.cpp",
    ]),
    hdrs = glob([
        "dart/collision/dart/*.hpp",
    ]),
    copts = [
        "-Idart",
    ],
    deps = [
        "@eigen3",
        ":dart-dynamics",
        ":dart-math",
        ":dart-collision-core",
    ],
    visibility = ["//visibility:private"],
    alwayslink = 1,
)

cc_library(
    name = "dart-collision",
    deps = [
        ":dart-collision-core",
        ":dart-collision-ode",
        ":dart-collision-fcl",
        ":dart-collision-dart",
    ],
    visibility = ["//visibility:private"],
    alwayslink = 1,
)

cc_library(
    name = "dart-external",
    srcs = glob([
        "dart/external/imgui/*.cpp",
        "dart/external/lodepng/*.cpp",
        "dart/external/odelcpsolver/*.cpp",
    ]),
    hdrs = glob([
        "dart/external/imgui/*.h",
        "dart/external/ikfast/*.h",
        "dart/external/lodepng/*.h",
        "dart/external/odelcpsolver/*.h",
    ]),
    copts = [
        "-Idart",
    ],
    visibility = ["//visibility:private"],
    alwayslink = 1,
)

cc_library(
    name = "dart-constraint",
    srcs = glob([
        "dart/constraint/*.cpp",
    ]),
    hdrs = glob([
        "dart/constraint/*.hpp",
        "dart/constraint/detail/*.hpp",
    ]),
    copts = [
        "-Idart",
    ],
    deps = [
        "@eigen3",
        ":dart-dynamics",
        ":dart-common",
        ":dart-math",
        ":dart-collision",
        ":dart-external",
    ],
    visibility = ["//visibility:private"],
    alwayslink = 1,
)

cc_library(
    name = "dart-simulation",
    srcs = glob([
        "dart/simulation/*.cpp",
    ]),
    hdrs = glob([
        "dart/simulation/*.hpp",
        "dart/simulation/detail/*.hpp",
    ]),
    copts = [
        "-Idart",
    ],
    deps = [
        "@eigen3",
        ":dart-dynamics",
        ":dart-collision",
        ":dart-common",
        ":dart-integration",
    ],
    visibility = ["//visibility:private"],
    alwayslink = 1,
)

cc_library(
    name = "dart-integration",
    srcs = glob([
        "dart/integration/*.cpp",
    ]),
    hdrs = glob([
        "dart/integration/*.hpp",
    ]),
    copts = [
        "-Idart",
    ],
    deps = [
        "@eigen3",
    ],
    visibility = ["//visibility:private"],
    alwayslink = 1,
)

cc_library(
    name = "dart-utils",
    srcs = glob([
        "dart/utils/*.cpp",
        "dart/sdf/*.cpp",
        "dart/urdf/*.cpp",
    ]),
    hdrs = glob([
        "dart/utils/*.hpp",
        "dart/utils/sdf/*.hpp",
        "dart/utils/urdf/*.hpp",
    ]),
    copts = [
        "-Idart",
    ],
    deps = [
        "@eigen3",
        ":dart-dynamics",
        ":dart-math",
        ":dart-collision",
        ":dart-common",
        ":dart-simulation",
    ],
    visibility = ["//visibility:private"],
    alwayslink = 1,
)

cc_library(
    name = "dart-optimizer",
    srcs = glob([
        "dart/optimizer/*.cpp",
        # "dart/optimizer/ipopt/*.cpp",
        "dart/optimizer/nlopt/*.cpp",
        # "dart/optimizer/pagmo/*.cpp",
        # "dart/optimizer/snopt/*.cpp",
    ]),
    hdrs = glob([
        "dart/optimizer/*.hpp",
        # "dart/optimizer/ipopt/*.hpp",
        "dart/optimizer/nlopt/*.hpp",
        # "dart/optimizer/pagmo/*.hpp",
        # "dart/optimizer/snopt/*.hpp",
    ]),
    copts = [
        "-Idart",
    ],
    deps = [
        "@eigen3",
        ":dart-math",
        ":dart-common",
    ],
    visibility = ["//visibility:private"],
    alwayslink = 1,
)

cc_library(
    name = "dart-lcpsolver",
    srcs = glob([
        "dart/lcpsolver/*.cpp",
    ]),
    hdrs = glob([
        "dart/lcpsolver/*.hpp",
    ]),
    copts = [
        "-Idart",
    ],
    deps = [
        "@eigen3",
        ":dart-math",
        ":dart-common",
        ":dart-external",
    ],
    visibility = ["//visibility:private"],
    alwayslink = 1,
)

cc_library(
    name = "dart",
    deps = [
        ":dart-math",
        ":dart-common",
        ":dart-optimizer",
        ":dart-utils",
        ":dart-integration",
        ":dart-dynamics",
        ":dart-simulation",
        ":dart-lcpsolver",
        ":dart-constraint",
        ":dart-collision",
        ":dart-external",
    ],
    visibility = ["//visibility:public"],
    alwayslink = 1,
)
