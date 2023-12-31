# buildifier: disable=module-docstring
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_additional_deps():
    # This sysroot is used by github.com/vsco/bazel-toolchains.
    http_archive(
        name = "org_chromium_sysroot_linux_x64",
        build_file_content = """
filegroup(
    name = "sysroot",
    srcs = glob(["*/**"]),
    visibility = ["//visibility:public"],
)
    """,
        sha256 = "84656a6df544ecef62169cfe3ab6e41bb4346a62d3ba2a045dc5a0a2ecea94a3",
        urls = ["https://commondatastorage.googleapis.com/chrome-linux-sysroot/toolchain/2202c161310ffde63729f29d27fe7bb24a0bc540/debian_stretch_amd64_sysroot.tar.xz"],
    )

additional_deps = module_extension(
    implementation = lambda ctx: load_additional_deps(),
)
