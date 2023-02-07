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

# Install bazelisk
wget https://github.com/bazelbuild/bazelisk/releases/download/v1.16.0/bazelisk-linux-amd64
mv ./bazelisk-linux-amd64 /usr/bin/bazel
chmod +x /usr/bin/bazel

# Import repos
mkdir -p /gz
cd /gz
cp -R /github/workspace /gz/bazel
vcs import . < /github/workspace/example/bazel.repos

echo ::group::Install dependencies from binaries
EXCLUDE_APT="libignition|libgz|libsdformat|libogre|dart"
UBUNTU_VERSION=`lsb_release -cs`
ALL_PACKAGES=$( \
  sort -u $(find . -iname 'packages-'$UBUNTU_VERSION'.apt' -o -iname 'packages.apt') | grep -Ev $EXCLUDE_APT | tr '\n' ' ')
apt-get install --no-install-recommends --quiet --yes $ALL_PACKAGES
echo ::endgroup::

ln -sf /gz/bazel/example/WORKSPACE.bazel.example /gz/WORKSPACE
ln -sf /gz/bazel/example/BUILD.bazel.example /gz/BUILD.bazel
ln -sf /gz/bazel/example/bazelrc.example /gz/.bazelrc
ln -sf /gz/bazel/example/bazelproject.example /gz/.bazelproject

echo ::group::Bazel query
bazel query $BAZEL_ARGS
echo ::endgroup::

echo ::group::Bazel build
bazel build $BAZEL_ARGS
echo ::endgroup::

echo ::group::Bazel test
bazel test $BAZEL_ARGS
echo ::endgroup::
