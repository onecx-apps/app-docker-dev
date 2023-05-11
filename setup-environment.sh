#!/bin/bash

echo 'Restarting all ms needed for setup';
docker-compose stop
echo Y | docker-compose rm
docker-compose up -d traefik postgresdb pgadmin
echo 'waiting for pods to start before starting next...';

docker-compose up -d tkit-portal-server
echo 'waiting for pods to start before starting next...';

time docker-compose up -d data-mgmt 
echo 'waiting for pods to start before starting next...';

echo 'setting up data-mgmt-ui ';
cat ./data-mgmt-init/data_mgmt_local.sql | docker exec -e PGPASSWORD=datamgmt -i app-docker-dev_postgresdb_1 psql -U datamgmt -d datamgmt
