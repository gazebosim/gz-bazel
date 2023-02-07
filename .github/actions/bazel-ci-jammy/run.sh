#!/bin/sh -l

set -x
set -e

BAZEL_ARGS=$1

echo ::group::Install tools: apt
apt update 2>&1
apt -y install \
  build-essential \
  cppcheck \
  curl \
  git \
  gnupg \
  lsb-release \
  python3-pip \
  wget

cd "$GITHUB_WORKSPACE"
SYSTEM_VERSION=`lsb_release -cs`
SOURCE_DEPENDENCIES="`pwd`/.github/ci/dependencies.yaml"
SOURCE_DEPENDENCIES_VERSIONED="`pwd`/.github/ci-$SYSTEM_VERSION/dependencies.yaml"
echo ::endgroup::

echo ::group::Install tools: pip
pip3 install -U pip vcstool colcon-common-extensions
echo ::endgroup::

mkdir -p /gz/bazel
cd /gz/bazel
vcs import . < /github/workspace/example/bazel.repos

cp -R /github/workspace ./bazel
echo ::group::Install dependencies from binaries
EXCLUDE_APT="libignition|libgz|libsdformat|libogre|dart"
UBUNTU_VERSION=`lsb_release -cs`
ALL_PACKAGES=$( \
  sort -u $(find . -iname 'packages-'$UBUNTU_VERSION'.apt' -o -iname 'packages.apt') | grep -Ev $EXCLUDE_APT | tr '\n' ' ')
apt-get install --no-install-recommends --quiet --yes $ALL_PACKAGES
echo ::endgroup::

ln -sf ./bazel/example/WORKSPACE.bazel.example ./WORKSPACE.bazel
ln -sf ./bazel/example/BUILD.example ./BUILD.bazel
ln -sf ./bazel/example/bazelrc.example ./.bazelrc
ln -sf ./bazel/example/bazelproject.example ./.bazelproject

wget https://github.com/bazelbuild/bazelisk/releases/download/v1.16.0/bazelisk-linux-amd64
mv ./bazelisk-linux-amd64 ./bazel

echo ::group::Bazel sync
./bazel sync || {
  status=$?
  echo "Error during sync"
}
echo ::endgroup::

echo ::group::Bazel build
./bazel build $BAZEL_ARGS
echo ::endgroup::

echo ::group::Bazel test
./bazel test $BAZEL_ARGS
echo ::endgroup::
