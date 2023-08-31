# Copyright 2017-2022 GRAIL, Inc.
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

workspace(name = "com_grail_bazel_compdb")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@com_grail_bazel_compdb//:config.bzl", "config_compdb")

config_compdb(
    cuda_enable = True,
    global_filter_flags = [
        "-ccbin",
        "-gencode",
    ],
)

load("@com_grail_bazel_compdb//:deps.bzl", "bazel_compdb_deps")

bazel_compdb_deps()

http_archive(
    name = "rules_cuda",
    sha256 = "388e2459737ff6e8f4474fcbea63a407d9ce61f4cd035dbf12f6834a0c12c49d",
    strip_prefix = "rules_cuda-a1b57331ab081845a8696966b96c7f7de463eb99",
    urls = ["https://github.com/bazel-contrib/rules_cuda/archive/a1b57331ab081845a8696966b96c7f7de463eb99.zip"],
)
