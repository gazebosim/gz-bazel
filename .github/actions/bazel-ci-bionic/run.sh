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
echo ::endgroup::

echo ::group::Install tools: pip
pip3 install -U pip vcstool colcon-common-extensions
echo ::endgroup::

echo ::group::Install tools: bazel 
curl https://bazel.build/bazel-release.pub.gpg | apt-key add -
echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list

apt update  2>&1
apt -y install bazel
echo ::endgroup::

mkdir -p /ignition/bazel
cd /ignition/bazel
vcs import . < /github/workspace/.github/ci/bazel.repos

cp -R /github/workspace ./ign_bazel

echo ::group::Install dependencies from binaries
EXCLUDE_APT="libignition|libsdformat|libogre|dart"
UBUNTU_VERSION=`lsb_release -cs`
ALL_PACKAGES=$( \
  sort -u $(find . -iname 'packages-'$UBUNTU_VERSION'.apt' -o -iname 'packages.apt') | grep -Ev $EXCLUDE_APT | tr '\n' ' ')
apt-get install --no-install-recommends --quiet --yes $ALL_PACKAGES
echo ::endgroup::

ln -sf ./ign_bazel/example/WORKSPACE.example ./WORKSPACE
ln -sf ./ign_bazel/example/BUILD.example ./BUILD.bazel
ln -sf ./ign_bazel/example/bazelrc.example ./.bazelrc

echo ::group::Bazel sync
bazel sync || {
  status=$?
  echo "Error during sync"
}
echo ::endgroup::

echo ::group::Bazel build
bazel build $BAZEL_ARGS
echo ::endgroup::

echo ::group::Bazel test
bazel test $BAZEL_ARGS
echo ::endgroup::

