ARG BASE_IMAGE=dutow/codecompass-xenial-pgsql-parser:latest
FROM ${BASE_IMAGE}
MAINTAINER Zsolt Parragi <zsolt.parragi@cancellar.hu>

RUN  apt-get update && apt-get install -y build-essential git cmake ninja-build bison gdb \
            libncurses5-dev libssl-dev libaio-dev libreadline-dev libncurses5-dev systemtap-sdt-dev libmecab-dev \
            zlib1g-dev libpam-dev libnuma-dev libwrap0-dev libldap2-dev \
            libprotobuf-dev protobuf-compiler \
            curl subversion git xterm vim \
            eatmydata subunit python-mysqldb libjson-perl devscripts debconf debhelper fakeroot \
            lsb-release perl po-debconf psmisc dh-systemd

ADD config-and-parse.sh /codecompass/bin/config-and-parse.sh
