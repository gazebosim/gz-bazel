#!/bin/sh

set -o errexit
set -o verbose

vcs import . < bazel.repos

apt-get update
apt-get install -y -qq --no-install-recommends \
  $(sort -u $(find . -iname 'packages.apt') | tr '\n' ' ')
