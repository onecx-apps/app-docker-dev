#!/bin/bash

export DOCKER_COMPOSE="docker-compose"

if ! which ${DOCKER_COMPOSE} &> /dev/null
then
    echo "docker-compose could not be found - try new docker compose command"
    DOCKER_COMPOSE="docker compose"
fi
	
echo 'Restarting all ms needed for setup';
${DOCKER_COMPOSE} stop
echo Y | ${DOCKER_COMPOSE} rm
${DOCKER_COMPOSE} up -d traefik postgresdb pgadmin
echo 'waiting for pods to start before starting next...';

time ${DOCKER_COMPOSE} up -d data-mgmt 
echo 'waiting for pods to start before starting next...';

sleep 15
echo 'setting up data-mgmt-ui ';
# WSL
cat ./data-mgmt-init/data_mgmt_local.sql | docker exec -e PGPASSWORD=datamgmt -i app-docker-dev_postgresdb_1 psql -U datamgmt -d datamgmt
# MacOS
cat ./data-mgmt-init/data_mgmt_local.sql | docker exec -e PGPASSWORD=datamgmt -i app-docker-dev-postgresdb-1 psql -U datamgmt -d datamgmt


#END
