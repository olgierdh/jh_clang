FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    #apt-get -y upgrade && \
    apt-get install -y wget liblua5.1-dev && \
    apt-get install -y make git software-properties-common && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-7 main" && \
    apt-get update && \
    apt-get install -y clang-7 && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-7 1000 && \
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-7 1000 && \
#    update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-7 1000 && \
    wget -qO- https://github.com/premake/premake-core/releases/download/v5.0.0-alpha12/premake-5.0.0-alpha12-linux.tar.gz | tar xvz -C /usr/bin/ && \
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

