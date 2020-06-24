# ign-bazel

ignition-bazel provides a set of Bazel build rules that are used by the Ignition projects.

## Building Ignition with Bazel

Currently (for Ignition Dome), each Ignition package has a `bazel` branch to maintain the build rules necessary for that package.

To build, we make the assumption that all necessary libraries and dependencies are checked out in a single directory.
For compatilbility, we use underscores (`_`) to delimit the names, rather than the typical dashes.

The following instructions assume that you are using Ubuntu 18.04

### Installing Bazel

It is best to use the [Bazel Instructions](https://docs.bazel.build/versions/master/install-ubuntu.html) to install for your platform.

For Ubuntu 18.04:

```
sudo apt install curl gnupg
curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -
echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list

sudo apt update && sudo apt install bazel
```

### Setting up the workspace

To begin with, make a directory to contain all of the Ignition packages and dependencies:

```
mkdir ~/ignition/
cd ~/ignition/
```

Then clone each of the Ignition packages.
For convenience, we have provided a `.repos` file that can be used by [vcstool](https://github.com/dirk-thomas/vcstool)

```
wget https://raw.githubusercontent.com/ignitionrobotics/ign-bazel/master/example/bazel.repos
vcs import . < bazel.repos
```

You can then install all necessary `apt` dependencies with the following:

```
sudo apt-get update
sudo apt-get install -y -qq --no-install-recommends \
  $(sort -u $(find . -iname 'packages.apt') | tr '\n' ' ')
```

Finally, it is necessary to add a few files for `bazel`

```
cd ~/ignition
ln -sf ./ign_bazel/example/WORKSPACE.example ./WORKSPACE
ln -sf ./ign_bazel/example/BUILD.example ./BUILD.bazel
ln -sf ./ign_bazel/example/bazelrc.example ./.bazelrc
```

### Building with Bazel

Once the workspace is setup, building with `bazel` is straightforward.

```
cd ~/ignition
bazel build //...
```

To test:

```
bazel test //...
```
