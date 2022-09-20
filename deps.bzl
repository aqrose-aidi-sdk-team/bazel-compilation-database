# Copyright 2021 GRAIL, Inc.
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

load("@com_grail_bazel_compdb//:tools.bzl", "setup_tools")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def bazel_compdb_deps():
    setup_tools()

    maybe(
        name = "rules_cuda",
        repo_rule = http_archive,
        sha256 = "99914664a13dd441837fba8fceb07a125a945e4a750facbbfe85a8ec1fbd9c3c",
        urls = ["https://github.com/cloudhan/rules_cuda/archive/6f05e4d11b06ee542509e5ec65554118063351bf.tar.gz"],
    )
