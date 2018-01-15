ARG DOCKER_ORGANIZATION
ARG CODECOMPASS_IMAGE
FROM ${DOCKER_ORGANIZATION}/${CODECOMPASS_IMAGE}:latest
MAINTAINER Zsolt Parragi <zsolt.parragi@cancellar.hu>

ADD cc-parse /codecompass/bin/cc-parse

ENV PROJECTNAME="Untitled" COMPILATION_DB="/work/src/compile_commands.json"

CMD cc-parse
