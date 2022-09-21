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
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def bazel_compdb_deps():
    setup_tools()

    maybe(
        name = "bazel_skylib",
        repo_rule = http_archive,
        sha256 = "d847b08d6702d2779e9eb399b54ff8920fa7521dc45e3e53572d1d8907767de7",
        strip_prefix = "bazel-skylib-2a87d4a62af886fb320883aba102255aba87275e",
        urls = ["https://github.com/bazelbuild/bazel-skylib/archive/2a87d4a62af886fb320883aba102255aba87275e.tar.gz"],
    )

    maybe(
        name = "rules_cuda",
        repo_rule = http_archive,
        sha256 = "a10a7efbf886a42f5c849dd515c22b72a58d37fdd8ee1436327c47f525e70f26",
        strip_prefix = "rules_cuda-19f91525682511a2825037e3ac568cba22329733",
        urls = ["https://github.com/cloudhan/rules_cuda/archive/19f91525682511a2825037e3ac568cba22329733.zip"],
    )
