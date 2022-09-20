# Copyright 2022 Aqrose Technology, Ltd.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def _config_compdb_repository_impl(rctx):
    if rctx.attr.cuda_enable:
        maybe(
            name = rules_cuda,
            repo_rule = http_archive,
            sha256 = "99914664a13dd441837fba8fceb07a125a945e4a750facbbfe85a8ec1fbd9c3c",
            urls = ["https://github.com/cloudhan/rules_cuda/archive/6f05e4d11b06ee542509e5ec65554118063351bf.tar.gz"],
        )

        load("@rules_cuda//cuda:deps.bzl", "register_detected_cuda_toolchains", "rules_cuda_deps")

        rules_cuda_deps()
        register_detected_cuda_toolchains()

    rctx.file("BUILD.bazel", "")
    rctx.file("config.bzl", "global_filter_flags = %s" % rctx.attr.global_filter_flags)
    rctx.file("config.bzl", "cuda_enable = %s" % rctx.attr.cuda_enable)

    return

config_compdb_repository = repository_rule(
    implementation = _config_compdb_repository_impl,
    local = True,
    attrs = {
        "global_filter_flags": attr.string_list(
            default = [
                "-isysroot __BAZEL_XCODE_SDKROOT__",
            ],
            doc = "Filter the flags in the compilation command that clang does not support.",
        ),
        "cuda_enable": attr.bool(
            default = False,
            doc = "Enable the cuda compiler.",
        ),
    },
    doc = "To config compdb.",
)

def config_compdb(**kwargs):
    config_compdb_repository(name = "com_grail_bazel_config_compdb", **kwargs)
