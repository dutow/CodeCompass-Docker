FROM dutow/codecompass-pgsql:latest
MAINTAINER Zsolt Parragi <zsolt.parragi@cancellar.hu>

ENV CC_PORT="6251"

ENTRYPOINT /codecompass/bin/keepalive \
           /codecompass/bin/CodeCompass_webserver \
           -w \
           /workspace \
           -d "pgsql:host=${DB_HOST};port=${DB_PORT};database=${DB_NAME};user=${DB_USER};password=${DB_PASSWORD}" \
           -p ${CC_PORT}
