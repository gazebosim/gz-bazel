#!/bin/sh

set -o errexit
set -o verbose

vcs pull

apt-get update
apt-get install -y -qq --no-install-recommends \
  $(sort -u $(find . -iname 'packages.apt') | tr '\n' ' ')
apt-get clean -qq

bazel build //...
bazel test //...
