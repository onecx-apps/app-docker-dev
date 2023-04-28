#!/bin/bash
echo "@@ starting Import"
chmod +x /opt/jboss/keycloak/scripts/wait-for.sh
/opt/jboss/keycloak/scripts/wait-for.sh "curl --fail --silent http://localhost:8080/realms/master"
/opt/jboss/keycloak/bin/kcadm.sh config credentials --realm master --user ${KEYCLOAK_ADMIN} --password ${KEYCLOAK_ADMIN_PASSWORD} --server http://localhost:8080
/opt/jboss/keycloak/bin/kcadm.sh create realms -f /opt/jboss/keycloak/imports/realm-export.json --server http://localhost:8080 -s enabled=true
echo "@@ import done"
