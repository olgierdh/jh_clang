FROM ubuntu:16.04

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y wget liblua5.1-dev && \
    apt-get install -y make git openssh-client && \
    apt-get install -y software-properties-common && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-6.0 main" && \
    apt-get update && \
    apt-get install -y clang-6.0 clang-tidy-6.0 clang-format-6.0 && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-6.0 1000 && \
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-6.0 1000 && \
    update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-6.0 1000 && \
    update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-6.0 1000 && \
    wget -qO- https://github.com/premake/premake-core/releases/download/v5.0.0-alpha12/premake-5.0.0-alpha12-linux.tar.gz | tar xvz -C /usr/bin/ && \
    rm -rf /var/lib/apt/lists/*

COPY bullet2 /var/opt/bullet2
COPY glslangValidator /usr/bin
ENV BULLET2_PATH=/var/opt/bullet2/

