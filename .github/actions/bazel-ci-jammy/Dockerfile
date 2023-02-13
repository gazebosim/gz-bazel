FROM ghcr.io/gazebo-tooling/gz-ubuntu:garden-jammy
ARG UID=1000

# Add a runner user and group to match github actions
# Additionally, use passwordless sudo
RUN groupadd -g 121 runner \
 && useradd -mr -d /home/runner -u 1001 -g 121 runner \
 && usermod -aG sudo runner \
 && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY ["run.sh", "/run.sh"]
COPY ["entrypoint.sh", "/entrypoint.sh"]

USER runner

ENTRYPOINT ["/entrypoint.sh"]
