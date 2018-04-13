FROM ubuntu:16.04
MAINTAINER Zsolt Parragi <zsolt.parragi@cancellar.hu>

RUN DEBIAN_FRONTEND=noninteractive\
    apt-get update && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get -y dist-upgrade && \
    apt-get -y install curl && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y wget git cmake make g++ libboost-all-dev openjdk-8-jdk libssl-dev libsqlite3-dev libgraphviz-dev libmagic-dev libgit2-dev ctags libgtest-dev byacc flex postgresql-server-dev-9.5 gcc-5-plugin-dev libcutl-dev nodejs bzip2 xz-utils locales && \
    apt-get install -y software-properties-common wget && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add && \
    apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-6.0 main" && \
    apt-get update && \
    apt-get install -y \
            clang-6.0 clang-6.0-doc libclang-common-6.0-dev libclang-6.0-dev libclang1-6.0 libllvm6.0 llvm-6.0 llvm-6.0-dev clang-format-6.0 clang-tools-6.0 clang-tidy-6.0 && \
    ln -s /usr/share/llvm-6.0/cmake/ /usr/lib/llvm-6.0/lib/cmake/clang && \
    ln -s /usr/bin/clang-6.0 /usr/lib/llvm-6.0/bin/clang-6.0  && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /deps && \
    mkdir /codecompass && \
    locale-gen en_US.UTF-8

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# Build thrift
RUN wget http://xenia.sote.hu/ftp/mirrors/www.apache.org/thrift/0.10.0/thrift-0.10.0.tar.gz && \
    tar xvf ./thrift-0.10.0.tar.gz && \
    cd thrift-0.10.0 && \
    ./configure --prefix=/deps/thrift && \
    make install && \
    cd .. && \
    rm -rf thrift*

RUN DEBIAN_FRONTEND=noninteractive\
    apt-get update && \
    apt-get -yq install libodb-pgsql-dev libodb-sqlite-dev

# Compile gtest
RUN cd /usr/src/gtest && \
    cmake . && \
    make && \
    cp libgtest.a libgtest_main.a /usr/lib

