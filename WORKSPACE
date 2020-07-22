load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")

# required tools (from readme):
#  $ sudo apt-get install build-essential cmake git libgmp3-dev libprocps4-dev python-markdown libboost-all-dev libssl-dev
# libs: libgmp3-dev, libprocps4-dev, libboost, libssl
# uses ccache if found

# load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")

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
## libssl, libcrypto
http_archive(
    name="openssl",
    url="https://www.openssl.org/source/openssl-1.1.1g.tar.gz",
    sha256="ddb04774f1e32f0c49751e21b67216ac87852ceb056b75209af2443400636d46",
    strip_prefix="openssl-1.1.1g",
    build_file_content = all_content
)

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
http_archive(
    name="gtest",
    url="https://github.com/google/googletest/archive/release-1.10.0.tar.gz",
    sha256="9dc9157a9a1551ec7a7e43daea9a694a0bb5fb8bec81235d8a1e6ef64c716dcb",
    strip_prefix = "googletest-release-1.10.0",
)

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
# new_git_repository(
#     name = "supercop",
#     commit = "b04a0ea2c7d7422d74a512ce848e762196f48149",
#     remote = "https://github.com/mbbarbosa/libsnark-supercop",
#     shallow_since = "1433349878 +0100",
#     # build_file = "@//:BUILD.bazel"
#     build_file = "@//bzl/external/supercop:BUILD"
# )



################################################################
# the following deps are actually dependencies of libff, but
# until Bazel supports transitive externals we have to define them here.
http_archive(
    name="libgmp",
    url="https://gmplib.org/download/gmp/gmp-6.2.0.tar.xz",
    sha256="258e6cd51b3fbdfc185c716d55f82c08aff57df0c6fbd143cf6ed561267a1526",
    strip_prefix = "gmp-6.2.0",
    build_file_content = all_content
    # build_file = "@//external:libgmp.BUILD"
)

http_archive(
    name = "libfqfft",
    urls = ["https://github.com/obazl/libfqfft/archive/bzl-1.0.zip"],
    strip_prefix = "libfqfft-bzl-1.0",
    sha256 = "9bf3cd1b190825d0c1cf5aa7f91f70c320132d71cb968dadcf7c6476a6aa3511"
)

http_archive(
    name = "libff",
    urls = ["https://github.com/obazl/libff/archive/bzl-1.1.zip"],
    strip_prefix = "libff-bzl-1.0",
    sha256 = "977e9530c876f284b3186e1c4dbf3311a49d0f0eed5cdce7e9a22c2763d619cc"
)

http_archive(
    name = "ate_pairing",
    urls = ["https://github.com/obazl/ate-pairing/archive/bzl-1.0.zip"],
    strip_prefix = "ate-pairing-bzl-1.0",
    sha256 = "08a6bc65e22e8f05e7f16fe984830653e5411aa4a03a9f2838531b0c453ba7fe"
)

# http_archive(
#     name = "xbyak",
#     urls = ["https://github.com/obazl/xbyak/archive/bzl-1.0.zip"],
#     strip_prefix = "xbyak-bzl-1.0",
#     sha256 = "5a24976ed246c0c2fcfd51a8b32c60760d85f339cebd75d074f9d0bbdd1a61e3"
# )


