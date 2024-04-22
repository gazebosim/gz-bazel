#!/bin/sh -l

set -x
set -e

BAZEL_ARGS=$1
WORKSPACE=~/gz
BAZEL_CACHE=$GITHUB_WORKSPACE/bazel_cache
BAZEL=$BAZEL_CACHE/bazelisk-linux-amd64

SYSTEM_VERSION=`lsb_release -cs`
SOURCE_DEPENDENCIES="`pwd`/.github/ci/dependencies.yaml"
SOURCE_DEPENDENCIES_VERSIONED="`pwd`/.github/ci-$SYSTEM_VERSION/dependencies.yaml"

cd "$GITHUB_WORKSPACE"
mkdir -p ${GITHUB_WORKSPACE}/bazel-testlogs

# Restore cache
if [ ! -d "$BAZEL_CACHE" ]; then
  mkdir -p ${BAZEL_CACHE}
fi
rm -rf ~/.cache
ln -sf ${BAZEL_CACHE} ~/.cache

# Install baselisk if it is not already installed
if [ ! -f ${BAZEL} ]; then
  wget https://github.com/bazelbuild/bazelisk/releases/download/v1.16.0/bazelisk-linux-amd64 -O ${BAZEL}
fi
chmod +x ${BAZEL}

# Import repos
mkdir -p ${WORKSPACE}/bazel

cd ${WORKSPACE}
shopt -s extglob
# Copy relevant bazel files into the build space
cp -R ${GITHUB_WORKSPACE}/!(gz|.git|bazel_cache) ${WORKSPACE}/bazel
cp -R ${GITHUB_WORKSPACE}/.github ${WORKSPACE}/bazel
vcs import . < ${WORKSPACE}/bazel/example/bazel.repos

echo ::group::Install dependencies from binaries
sudo apt update
EXCLUDE_APT="libignition|libgz|libsdformat|libogre|dart"
UBUNTU_VERSION=`lsb_release -cs`
ALL_PACKAGES=$( \
  sort -u $(find . -iname 'packages-'$UBUNTU_VERSION'.apt' -o -iname 'packages.apt') | grep -Ev $EXCLUDE_APT | tr '\n' ' ')
sudo apt update
sudo apt install --no-install-recommends --quiet --yes $ALL_PACKAGES
echo ::endgroup::

ln -sf ${WORKSPACE}/bazel/example/WORKSPACE.example ${WORKSPACE}/WORKSPACE
ln -sf ${WORKSPACE}/bazel/example/BUILD.bazel.example ${WORKSPACE}/BUILD.bazel
ln -sf ${WORKSPACE}/bazel/example/bazelrc.example ${WORKSPACE}/.bazelrc
ln -sf ${WORKSPACE}/bazel/example/bazelproject.example ${WORKSPACE}/.bazelproject
ln -sf ${WORKSPACE}/bazel/example/bazeliskrc.example ${WORKSPACE}/.bazeliskrc

echo ::group::Bazel query
${BAZEL} query $BAZEL_ARGS
echo ::endgroup::

echo ::group::Bazel build
${BAZEL} build $BAZEL_ARGS
echo ::endgroup::

echo ::group::Bazel test
EXIT_CODE=0
${BAZEL} test $BAZEL_ARGS || EXIT_CODE=$?
echo ::endgroup::

cp -RL ${WORKSPACE}/bazel-testlogs/* ${GITHUB_WORKSPACE}/bazel-testlogs/

exit $EXIT_CODE
