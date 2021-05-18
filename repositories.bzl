load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def assimp():
    native.new_local_repository(
        name = "assimp",
        path = "/usr/include",
        build_file = "//ign_bazel/third_party:assimp.BUILD",
    )

def boost():
    native.new_local_repository(
        name = "boost",
        path = "/usr/include/boost",
        build_file = "//ign_bazel/third_party:boost.BUILD",
    )

def bullet():
    native.new_local_repository(
        name = "bullet",
        path = "/usr/include/bullet",
        build_file = "//ign_bazel/third_party:bullet.BUILD",
    )

def curl():
    native.new_local_repository(
        name = "curl",
        path = "/usr/include/x86_64-linux-gnu",
        build_file = "//ign_bazel/third_party:curl.BUILD",
    )

def fcl():
    native.new_local_repository(
        name = "fcl",
        path = "/usr/include",
        build_file = "//ign_bazel/third_party:fcl.BUILD",
    )

def ffmpeg():
    native.new_local_repository(
        name = "ffmpeg",
        path = "/usr/include/x86_64-linux-gnu",
        build_file = "//ign_bazel/third_party:ffmpeg.BUILD",
    )

def freetype():
    native.new_local_repository(
        name = "freetype2",
        path = "/usr/include/freetype2",
        build_file = "//ign_bazel/third_party:freetype2.BUILD",
    )

def freeimage():
    native.new_local_repository(
        name = "freeimage",
        path = "/usr/include",
        build_file = "//ign_bazel/third_party:freeimage.BUILD",
    )

def gl():
    native.new_local_repository(
        name = "gl",
        path = "/usr/include",
        build_file = "//ign_bazel/third_party:gl.BUILD",
    )

def glib():
    native.new_local_repository(
        name = "glib",
        path = "/usr",
        build_file = "//ign_bazel/third_party:glib.BUILD",
    )

def gts():
    native.new_local_repository(
        name = "gts",
        path = "/usr",
        build_file = "//ign_bazel/third_party:gts.BUILD",
    )

def json():
    native.new_local_repository(
        name = "json",
        path = "/usr/include/jsoncpp/",
        build_file = "//ign_bazel/third_party:json.BUILD",
    )

def nlopt():
    native.new_local_repository(
        name = "nlopt",
        path = "/usr/include",
        build_file = "//ign_bazel/third_party:nlopt.BUILD",
    )

def ode():
    native.new_local_repository(
        name = "ode",
        path = "/usr/include",
        build_file = "//ign_bazel/third_party:ode.BUILD",
    )

def osg():
    native.new_local_repository(
        name = "osg",
        path = "/usr/include",
        build_file = "//ign_bazel/third_party:osg.BUILD",
    )

def sqlite3():
    native.new_local_repository(
        name = "sqlite3",
        path = "/usr/include",
        build_file = "//ign_bazel/third_party:sqlite3.BUILD",
    )

def tinyxml2():
    _maybe(
        http_archive,
        name = "tinyxml2",
        build_file = "//ign_bazel/third_party:tinyxml2.BUILD",
        sha256 = "6ce574fbb46751842d23089485ae73d3db12c1b6639cda7721bf3a7ee862012c",
        strip_prefix = "tinyxml2-8.0.0",
        urls = [
            "https://github.com/leethomason/tinyxml2/archive/8.0.0.tar.gz",
        ],
    )

def uuid():
    native.new_local_repository(
        name = "uuid",
        path = "/usr/include",
        build_file = "//ign_bazel/third_party:uuid.BUILD",
    )

def X():
    native.new_local_repository(
        name = "X",
        path = "/usr/include",
        build_file = "//ign_bazel/third_party:X.BUILD",
    )

def yaml():
    native.new_local_repository(
        name = "yaml",
        path = "/usr/include",
        build_file = "//ign_bazel/third_party:yaml.BUILD",
    )

def libzip():
    native.new_local_repository(
        name = "zip",
        path = "/usr/include",
        build_file = "//ign_bazel/third_party:zip.BUILD",
    )

def zmq():
    native.new_local_repository(
        name = "zmq",
        path = "/usr/include",
        build_file = "//ign_bazel/third_party:zmq.BUILD",
    )

def eigen3():
    _maybe(
        http_archive,
        name = "eigen3",
        build_file = "//ign_bazel/third_party:eigen3.BUILD",
        sha256 = "ca7beac153d4059c02c8fc59816c82d54ea47fe58365e8aded4082ded0b820c4",
        strip_prefix = "eigen-eigen-f3a22f35b044",
        urls = [
            "http://mirror.bazel.build/bitbucket.org/eigen/eigen/get/f3a22f35b044.tar.gz",
            "https://bitbucket.org/eigen/eigen/get/f3a22f35b044.tar.gz",
        ],
    )

def dart_repositories():
    assimp()
    boost()
    bullet()
    fcl()
    gl()
    ode()
    osg()
    nlopt()

def ogre_repositories():
    freetype()

def ign_bazel_repositories():
    _maybe(
        http_archive,
        name = "rules_python",
        urls = ["https://github.com/bazelbuild/rules_python/releases/download/0.1.0/rules_python-0.1.0.tar.gz"],
        sha256 = "b6d46438523a3ec0f3cead544190ee13223a52f6a6765a29eae7b7cc24cc83a0",
    )

    _maybe(
        http_archive,
        name = "gtest",
        sha256 = "9dc9157a9a1551ec7a7e43daea9a694a0bb5fb8bec81235d8a1e6ef64c716dcb",
        strip_prefix = "googletest-release-1.10.0",
        urls = ["https://github.com/google/googletest/archive/release-1.10.0.tar.gz"],
    )

def ign_math_repositories():
    eigen3()

def ign_common_repositories():
    ffmpeg()
    freeimage()
    glib()
    gts()
    uuid()

def ign_msgs_repositories():
    _maybe(
        http_archive,
        name = "rules_proto",
        sha256 = "9fc210a34f0f9e7cc31598d109b5d069ef44911a82f507d5a88716db171615a8",
        strip_prefix = "rules_proto-f7a30f6f80006b591fa7c437fe5a951eb10bcbcf",
        urls = [
            "https://github.com/bazelbuild/rules_proto/archive/f7a30f6f80006b591fa7c437fe5a951eb10bcbcf.tar.gz"
        ],
    )

    tinyxml2()

def ign_physics_repositories():
    eigen3()

def ign_transport_repositories():
    sqlite3()
    zmq()

def ign_fuel_tools_repositories():
    curl()
    json()
    yaml()
    libzip()

def ign_rendering_repositories():
    native.new_local_repository(
        name = "X",
        build_file = "//ign_bazel/third_party:X.BUILD",
        path = "/usr/include/",
    )

def ign_gui_repositories():
    native.new_local_repository(
        name = "qt",
        build_file = "//ign_bazel/third_party:qt.BUILD",
        path = "/usr/include/x86_64-linux-gnu/qt5/",
    )

def ignition_repositories():
    dart_repositories()
    ogre_repositories()
    ign_bazel_repositories()
    ign_math_repositories()
    ign_common_repositories()
    ign_msgs_repositories()
    ign_rendering_repositories()
    ign_transport_repositories()
    ign_physics_repositories()
    ign_fuel_tools_repositories()
    ign_gui_repositories()

def _maybe(repo_rule, name, **kwargs):
    if name not in native.existing_rules():
        repo_rule(name = name, **kwargs)
