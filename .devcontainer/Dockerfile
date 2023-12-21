# ubuntu:focal
FROM ubuntu@sha256:bac6081102aae54ba4bcc714695b8f637e42768c7f376f374c428bab043ddc0f

ARG USERNAME=developer
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt update && apt install -y --no-install-recommends \
    ca-certificates \
    gnupg2 \
    gpg-agent \ 
    locales \
    git \
    curl \
    patch \
    file \
    sudo \
    libtinfo5

RUN BAZELISK="bazelisk-linux-amd64"; \
    BUILDIFIER="buildifier-linux-amd64"; \
    curl -o /usr/local/bin/bazel -L https://github.com/bazelbuild/bazelisk/releases/download/v1.19.0/$BAZELISK && \
    chmod +x /usr/local/bin/bazel && \
    curl -o /usr/local/bin/buildifier -L https://github.com/bazelbuild/buildtools/releases/download/v6.4.0/$BUILDIFIER && \
    chmod +x /usr/local/bin/buildifier

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -G dialout -ms /bin/bash $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER developer
