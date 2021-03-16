#!/bin/sh

set -o errexit
set -o verbose

vcs import . < bazel.repos

EXCLUDE_APT="libignition|libsdformat|libogre|dart"
UBUNTU_VERSION=`lsb_release -cs`
ALL_PACKAGES=$( \
  sort -u $(find . -iname 'packages-'$UBUNTU_VERSION'.apt' -o -iname 'packages.apt') | grep -Ev $EXCLUDE_APT | tr '\n' ' ')

DEBIAN_FRONTEND=noninteractive \
apt-get update && apt-get install --no-install-recommends --quiet --yes $ALL_PACKAGES
