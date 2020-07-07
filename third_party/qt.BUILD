package(default_visibility = ["//visibility:public"])

cc_library(
    name = "qt_core",
    hdrs = glob(["QtCore/**"]),
    includes = [".", "QtCore"],
    linkopts = [
        "-lQt5Core",
    ],
)

cc_library(
    name = "qt_network",
    hdrs = glob(["QtNetwork/**"]),
    includes = [".", "QtNetwork"],
    linkopts = [
        "-lQt5Network",
    ],
)

cc_library(
    name = "qt_widgets",
    hdrs = glob(["QtWidgets/**"]),
    includes = [".", "QtWidgets"],
    linkopts = [
        "-lQt5Widgets",
    ],
    deps = [":qt_core", ":qt_gui"],
)

cc_library(
    name = "qt_quick_control",
    hdrs = glob(["QtQuickControls2/**"]),
    includes = [".", "QtQuickControls2"],
    linkopts = [
        "-lQt5Quick",
    ],
    deps = [
        ":qt_gui",
        ":qt_qml",
        ":qt_quick",
    ],
)

cc_library(
    name = "qt_quick",
    hdrs = glob(["QtQuick/**"]),
    includes = [".", "QtQuick"],
    linkopts = [
        "-lQt5Quick",
    ],
    deps = [
        ":qt_gui",
        ":qt_qml",
    ],
)

cc_library(
    name = "qt_qml",
    hdrs = glob(["QtQml/**"]),
    includes = [".", "QtQml"],
    linkopts = [
        "-lQt5Qml",
    ],
    deps = [
        ":qt_core",
        ":qt_network",
    ],
)

cc_library(
    name = "qt_gui",
    hdrs = glob(["QtGui/**"]),
    includes = [".", "QtGui"],
    linkopts = [
        "-lQt5Gui",
    ],
    deps = [":qt_core"],
)

cc_library(
    name = "qt_opengl",
    hdrs = glob(["QtOpenGL/**"]),
    includes = [".", "QtOpenGL"],
    linkopts = ["-lQt5OpenGL"],
)
