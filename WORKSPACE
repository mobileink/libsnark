workspace(name="libsnark")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")

http_archive(
    name = "bazel_skylib",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
    ],
    sha256 = "97e70364e9249702246c0e9444bccdc4b847bed1eb03c5a3ece4f83dfe6abc44",
)
load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
bazel_skylib_workspace()

all_content = """filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])"""

################################################################
http_archive(
    name = "rules_python",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.0.2/rules_python-0.0.2.tar.gz",
    strip_prefix = "rules_python-0.0.2",
    sha256 = "b5668cde8bb6e3515057ef465a35ad712214962f0b3a314e551204266c7be90c",
)

################################################################
http_archive(
   name = "rules_foreign_cc",
   strip_prefix = "rules_foreign_cc-master",
   url = "https://github.com/bazelbuild/rules_foreign_cc/archive/master.zip",
)

load("@rules_foreign_cc//:workspace_definitions.bzl", "rules_foreign_cc_dependencies")
rules_foreign_cc_dependencies()

################################################################
## FIXME: this fetches boost 1.71.0, libsnark uses 1.40
git_repository(
    name = "com_github_nelhage_rules_boost",
    commit = "9f9fb8b2f0213989247c9d5c0e814a8451d18d7f",
    remote = "https://github.com/nelhage/rules_boost",
    shallow_since = "1570056263 -0700",
)

load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")
boost_deps()

################################################################
# http_archive(
#     name="libprocps",
#     url="https://gitlab.com/procps-ng/procps/-/archive/v3.3.16/procps-v3.3.16.tar.gz",
#     sha256="7f09945e73beac5b12e163a7ee4cae98bcdd9a505163b6a060756f462907ebbc",
#     strip_prefix = "procps-v3.3.16",
#     build_file_content = all_content
#     # build_file = "@//bzl/external/libprocps.BUILD"
# )

################################################################
# https://bench.cr.yp.to/supercop.html
# http_archive(
#     name="supercop",
#     url="https://bench.cr.yp.to/supercop/supercop-20200510.tar.xz",
#     sha256="0b69c719f4ceeedb45b3f0f0eb415258ed6fa7b4166ad84f161a1c867c09aa1e",
#     strip_prefix = "supercop-20200510",
#     # build_file_content = all_content
#     build_file = "@//bzl/external/supercop:BUILD"
# )

## libsnark-specific extract:
new_git_repository(
    name = "supercop",
    commit = "b04a0ea2c7d7422d74a512ce848e762196f48149",
    remote = "https://github.com/mbbarbosa/libsnark-supercop",
    shallow_since = "1433349878 +0100",
    workspace_file = "//bzl/external/supercop:WORKSPACE",
    build_file = "//bzl/external/supercop:BUILD"
)

################################################################
http_archive(
    name = "libfqfft",
    urls = ["https://github.com/obazl/libfqfft/archive/bzl-1.0.zip"],
    # strip_prefix = "libfqfft-bzl-1.0",
    # sha256 = "000c51260df657dbdd028e80bfc453e28b99a3dfadfacf250f0d5c912230d24d"
)

## libfqfft dep: gtest
http_archive(
    name="gtest",
    url="https://github.com/google/googletest/archive/release-1.10.0.tar.gz",
    sha256="9dc9157a9a1551ec7a7e43daea9a694a0bb5fb8bec81235d8a1e6ef64c716dcb",
    strip_prefix = "googletest-release-1.10.0",
)

################################
http_archive(
    name = "libff",
    urls = ["https://github.com/obazl/libff/archive/bzl-1.1.tar.gz"],
    strip_prefix = "libff-bzl-1.1",
    sha256 = "d280e666aa08cc2a458c034ece16c87861240e3c5b3cc727e902bd9ee0b19831"
)

## libff deps: openmp, openssl, procps
## openmp: build rule //bzl/external/openmp, alias for @libff//bzl/external/openmp
http_archive(
    name="openmp",
    url="https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/openmp-10.0.0.src.tar.xz",
    sha256="3b9ff29a45d0509a1e9667a0feb43538ef402ea8cfc7df3758a01f20df08adfa",
    strip_prefix="openmp-10.0.0.src",
    build_file_content = all_content
)

http_archive(
    name="openssl",
    url="https://www.openssl.org/source/openssl-1.1.1g.tar.gz",
    sha256="ddb04774f1e32f0c49751e21b67216ac87852ceb056b75209af2443400636d46",
    strip_prefix="openssl-1.1.1g",
    build_file_content = all_content
)

http_archive(
    name = "ate_pairing",
    urls = ["https://github.com/obazl/ate-pairing/archive/bzl-1.0.tar.gz"],
    strip_prefix = "ate-pairing-bzl-1.0",
    sha256 = "f41ccbeaf38aa26d921953ae4ea2125cffe17051e9ccd3703bd0b7c7d3b05f29"
)

# libgmp is a dep of ate-pairing
http_archive(
    name="libgmp",
    url="https://gmplib.org/download/gmp/gmp-6.2.0.tar.xz",
    sha256="258e6cd51b3fbdfc185c716d55f82c08aff57df0c6fbd143cf6ed561267a1526",
    strip_prefix = "gmp-6.2.0",
    build_file_content = all_content
)

http_archive(
    name = "xbyak",
    urls = ["https://github.com/obazl/xbyak/archive/bzl-1.0.zip"],
    strip_prefix = "xbyak-bzl-1.0",
    sha256 = "5a24976ed246c0c2fcfd51a8b32c60760d85f339cebd75d074f9d0bbdd1a61e3"
)
