FROM dutow/codecompass-base:latest
MAINTAINER Zsolt Parragi <zsolt.parragi@cancellar.hu>

# FixUID
RUN addgroup --gid 1000 docker && \
    adduser --uid 1000 --ingroup docker --home /home/docker --shell /bin/sh --disabled-password --gecos "" docker

RUN USER=docker && \
    GROUP=docker && \
    curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.2/fixuid-0.2-linux-amd64.tar.gz | tar -C /usr/local/bin -xzf - && \
    chown root:root /usr/local/bin/fixuid && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid && \
    printf "user: $USER\ngroup: $GROUP\n" > /etc/fixuid/config.yml

RUN \
    mkdir /work && \
    chown -R docker:docker /work

USER docker:docker

ENV CMAKE_PREFIX_PATH=/deps/thrift:/deps/clang/share/llvm/cmake:/deps/odb:${CMAKE_PREFIX_PATH}
ENV PATH=${PATH}:/deps/thrift/bin:/deps/odb/bin

