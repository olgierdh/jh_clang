FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y --no-install-recommends install --fix-missing wget liblua5.1-dev make git software-properties-common apt-transport-https ca-certificates gpg-agent && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    apt-add-repository "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-11 main" && \
    apt-get update && \
    apt-get -y --no-install-recommends install --fix-missing  clang-11 && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-11 1000 && \
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-11 1000 && \
    wget -qO- https://github.com/premake/premake-core/releases/download/v5.0.0-beta1/premake-5.0.0-beta1-linux.tar.gz | tar xvz -C /usr/bin/ && \
    apt-get remove --purge -y wget software-properties-common && \
    apt-get autoremove -y && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/* && \
    apt-mark showauto

COPY bullet2 /var/opt/bullet2
COPY glslangValidator /usr/bin
ENV BULLET2_PATH=/var/opt/bullet2/

