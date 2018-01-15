FROM dutow/codecompass-pgsql:latest
MAINTAINER Zsolt Parragi <zsolt.parragi@cancellar.hu>

ENV PROJECTNAME="Untitled" COMPILATION_DB="/work/src/compile_commands.json"

ENTRYPOINT keepalive \
  /codecompass/bin/CodeCompass_parser \
  -w /workspace \
  -d "pgsql:host=${DB_HOST};port=${DB_PORT};database=${DB_NAME};user=${DB_USER};password=${DB_PASSWORD}" \
  -n "${PROJECTNAME}" \
  -i "${COMPILATION_DB}" --loglevel debug \
  -f -j1

