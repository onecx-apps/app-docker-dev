#!/bin/bash
echo 'Starting only essential containers';

export DOCKER_COMPOSE="docker-compose"

if ! which ${DOCKER_COMPOSE} &> /dev/null
then
    DOCKER_COMPOSE="docker compose"
fi
	

${DOCKER_COMPOSE} up -d traefik postgresdb pgadmin keycloak-app


#end
