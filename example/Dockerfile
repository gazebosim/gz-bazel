FROM ubuntu:bionic

RUN apt-get update -qq \
 && apt-get install -y -qq \
        build-essential \
        curl \
        git \
        sudo \
        wget \
        python3-pip \
        python-pip \
        lsb-release \
 && apt-get clean -qq

RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
RUN wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
RUN apt-get update

# Common tools
RUN apt-get update -qq \
 && apt-get install -y -qq \
        libprotoc-dev \
        libprotobuf-dev \
        protobuf-compiler \
        uuid-dev \
        libzmq3-dev \
        libsqlite3-dev \
        g++-8 \
        libzip-dev \
        libjsoncpp-dev \
        libglew-dev \
        libfreeimage-dev \
        freeglut3-dev \
        libxmu-dev \
        libxi-dev \
        libyaml-dev \
        libwebsockets-dev \
        libswscale-dev \
        libcurl4-openssl-dev \
        libode-dev \
        libassimp-dev \
        libnlopt-dev \
        libfcl-dev \
        libopenscenegraph-dev \
        libdart6-collision-ode-dev \
        libdart6-dev \
        libdart6-utils-urdf-dev \
        libfreetype6-dev \
        libgts-dev \
        libavcodec-dev \
        libavformat-dev \
        libavdevice-dev \
        libxaw7-dev \
        libxrandr-dev \
 && apt-get clean -qq

RUN pip3 install vcstool
RUN pip install psutil
RUN sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 \
    --slave /usr/bin/g++ g++ /usr/bin/g++-8 --slave /usr/bin/gcov gcov /usr/bin/gcov-8

# Add Bazel PPA
RUN /bin/sh -c 'echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" > /etc/apt/sources.list.d/bazel-stable.list \
 && curl https://bazel.build/bazel-release.pub.gpg | apt-key add -'

# Install Bazel
RUN apt-get update -qq \
 && apt-get install -y -qq \
        bazel \
 && apt-get clean -qq

RUN mkdir /ignition
WORKDIR /ignition

ADD WORKSPACE.example /ignition/WORKSPACE
ADD BUILD.example /ignition/BUILD.bazel
ADD bazelrc.example /ignition/.bazelrc

ADD bazel.repos /ignition/bazel.repos

ADD setup_workspace.sh /ignition/setup_workspace.sh
RUN /ignition/setup_workspace.sh

ADD build_workspace.sh /ignition/build_workspace.sh
CMD /ignition/build_workspace.sh
