#!/bin/bash
# turn on bash's job control
set -m
# Start the primary process and put it in the background
/opt/jboss/tools/docker-entrypoint.sh "$@" &
# Start the helper process
chmod +x /opt/jboss/keycloak/scripts/import-realms.sh
/opt/jboss/keycloak/scripts/import-realms.sh "$@" &
fg %1