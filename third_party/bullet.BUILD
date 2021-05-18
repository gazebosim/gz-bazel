package(default_visibility = ["//visibility:public"])

cc_library(
    name = "bullet",
    hdrs = glob(["*.h", "**/*.h"]),
    includes = ["."],
    linkopts = [
      "-lBulletSoftBody",
      "-lBulletCollision",
      "-lBulletDynamics",
      "-lLinearMath",
    ]
)
