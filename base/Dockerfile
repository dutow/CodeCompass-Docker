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

# Build clang
RUN wget http://releases.llvm.org/3.8.0/llvm-3.8.0.src.tar.xz && \
    tar -xvf llvm-3.8.0.src.tar.xz && \
    cd llvm-3.8.0.src/tools && \
    wget http://releases.llvm.org/3.8.0/cfe-3.8.0.src.tar.xz && \
    tar -xvf cfe-3.8.0.src.tar.xz && \
    mv cfe-3.8.0.src clang && \
    rm cfe-3.8.0.src.tar.xz && \
    cd ../.. && \
    mkdir build && \
    cd build && \
    export REQUIRES_RTTI=1 && \
    cmake -G "Unix Makefiles" -DLLVM_ENABLE_RTTI=ON ../llvm-3.8.0.src -DCMAKE_INSTALL_PREFIX=/deps/clang && \
    make install && \
    cd .. &&\
    rm -rf llvm* && \
    rm -rf clang* && \
    rm -rf build

# Recompile ODB w PostgreSQL and sqlite
RUN wget http://www.codesynthesis.com/download/odb/2.4/libodb-2.4.0.tar.gz && \
    tar -xvf libodb-2.4.0.tar.gz && \
    cd libodb-2.4.0 && \
    ./configure --prefix=/deps/odb && \
    make install && \
    cd .. && \
    wget http://www.codesynthesis.com/download/odb/2.4/libodb-pgsql-2.4.0.tar.gz && \
    tar -xvf libodb-pgsql-2.4.0.tar.gz && \
    cd libodb-pgsql-2.4.0 && \
    ./configure --prefix=/deps/odb CXXFLAGS=-I/deps/odb/include LDFLAGS=-L/deps/odb/lib && \
    make install && \
    cd .. && \
    wget http://www.codesynthesis.com/download/odb/2.4/libodb-sqlite-2.4.0.tar.gz && \
    tar -xvf libodb-sqlite-2.4.0.tar.gz && \
    cd libodb-sqlite-2.4.0 && \
    ./configure --prefix=/deps/odb CXXFLAGS=-I/deps/odb/include LDFLAGS=-L/deps/odb/lib && \ 
    make install && \
    cd .. && \
    wget http://www.codesynthesis.com/download/odb/2.4/odb-2.4.0.tar.gz && \
    tar -xvf odb-2.4.0.tar.gz && \
    cd odb-2.4.0 && \
    ./configure --prefix=/deps/odb CXXFLAGS=-I/deps/odb/include LDFLAGS=-L/deps/odb/lib && \
    make install && \
    cd .. && \
    rm -rf odb* && \
    rm -rf libodb*

# Compile gtest
RUN cd /usr/src/gtest && \
    cmake . && \
    make && \
    cp libgtest.a libgtest_main.a /usr/lib

