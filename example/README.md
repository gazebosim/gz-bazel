# Build Ignition packages with Bazel (and Docker)


```
# Clone this repository somewhere on your computer:
git clone https://github.com/ignitionrobotics/ign-bazel.git
# Change to the example directory
cd ign-bazel/example
# Build the docker image
docker build -t ign-bazel:latest .
# Build ignition using bazel in Docker
docker run ign-bazel:latest
```
