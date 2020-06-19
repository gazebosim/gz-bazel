#!/bin/sh

set -o errexit
set -o verbose

vcs pull
bazel build //...
bazel test //...
