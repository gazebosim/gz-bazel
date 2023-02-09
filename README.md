# gz-bazel

gz-bazel provides a set of Bazel build rules that are used by the Gazebo projects.

This branch is compatible with the Garden release of Gazebo.

## Initial Setup

To build, we make the assumption that all necessary libraries and dependencies are checked out in a single directory.

The following instructions assume that you are using Ubuntu 22.04

### Installing Bazel

To use your system package manager, follow the [Bazel Instructions](https://docs.bazel.build/versions/master/install-ubuntu.html) to install for your platform.

For Ubuntu 22.04
```
# Intall the bazel repos
sudo apt install apt-transport-https curl gnupg -y
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
sudo mv bazel-archive-keyring.gpg /usr/share/keyrings
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list

# Install latest stable bazel version
sudo apt update && sudo apt install bazel
```


Alternatively, if you intend to work with multiple bazel versions, you can use [Bazelisk](https://github.com/bazelbuild/bazelisk), which automatically picks a good version of bazel given your current working directory.

```
# Download bazelisk from Github releases
wget https:://github.com/bazelbuild/bazelisk/releases/download/v1.16.0/bazelisk-linux-amd64

# Place it somewhere in your USER path
mv bazelisk-linux-amd64 ~/.local/bin/bazel
chmod +x ~/.local/bin/bazel

# OR place it in your system path
/usr/local/bin/bazel
chmod +x /usr/local/bin/bazel
```

### Setting up the workspace

To begin with, make a directory to contain the workspace

```
mkdir ~/gz/
cd ~/gz/
```

Then clone each of the Gazebo packages.  For convenience, we have provided a `.repos` file containing the relevant branches for each package.

```
wget https://raw.githubusercontent.com/gazebosim/gz-bazel/garden/example/bazel.repos
vcs import . < bazel.repos
```

You can then install all necessary dependencies with the following:

```
sudo apt update
sudo apt install -y -qq --no-install-recommends \
  $(sort -u $(find . -iname 'packages-jammy.apt' -o -iname 'packages.apt') | grep -Ev "libignition|libsdformat|ogre|libgz" | tr '\n' ' ')
```

Finally, it is necessary to add a few files to the root of the workspace for bazel.

```
cd ~/gz/
ln -sf ./bazel/example/WORKSPACE.example ./WORKSPACE
ln -sf ./bazel/example/BUILD.bazel.example ./BUILD.bazel
ln -sf ./bazel/example/bazelrc.example ./.bazelrc
ln -sf ./bazel/example/bazelproject.example ./.bazelproject
```

## Building with Bazel

### Building the entire workspace

Once the workspace is setup, building is straightforward:

```
cd ~/gz
bazel build //...
```

To test:

```
bazel test //...
```

### Building a subset of the workspace

To build all targets in a subpackage, for example gz-common:

```
cd ~/gz
bazel build //common/...
```

Gazebo components are generally kept in subdirectories, to select those targets:

```
cd ~/gz
bazel build //common/graphics/...
```

To see a list of all available targets:

```
cd ~/gz
bazel query //...
```

## Writing Bazel rules

### Linting

Use [buildifer](https://github.com/bazelbuild/buildtools/blob/master/buildifier/README.md) to lint build files

```
cd ~/gz
bazel-bin/bazel/lint/buildifier --all         # Reformat all Bazel files.
bazel-bin/bazel/lint/buildifier //common/BUILD.bazel  # Only reformat one file.
```

If buildifier was not build with the workspace (unusual), but it via

```
cd ~/gz
bazel build //bazel/lint:buildifier
```


