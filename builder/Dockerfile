ARG DOCKER_ORGANIZATION
FROM ${DOCKER_ORGANIZATION}/codecompass-xenial-base:latest
MAINTAINER Zsolt Parragi <zsolt.parragi@cancellar.hu>

COPY codecompass /codecompass

RUN mkdir /workspace

ENV LD_LIBRARY_PATH="/deps/thrift/lib:/deps/clang/lib:/deps/odb/lib:${LD_LIBRARY_PATH}" PATH="${PATH}:/codecompass/bin" DB_HOST="dbserver" DB_PORT="5432" DB_NAME="codecompass" DB_USER="postgres" DB_PASSWORD="secret"

