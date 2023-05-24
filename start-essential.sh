#!/bin/bash
echo 'Starting only essential containers';

docker-compose up -d traefik postgresdb pgadmin keycloak-app wiremock