-- --keycloak
CREATE USER keycloak WITH ENCRYPTED PASSWORD 'keycloak';
CREATE DATABASE keycloak with owner keycloak;
GRANT ALL PRIVILEGES ON DATABASE keycloak TO keycloak;
-- --tkit-portal-server
CREATE USER "tkit-portal-server" WITH ENCRYPTED PASSWORD 'tkit-portal-server';
CREATE DATABASE "tkit-portal-server" with owner "tkit-portal-server";
GRANT ALL PRIVILEGES ON DATABASE "tkit-portal-server" TO "tkit-portal-server";
-- --apm
CREATE USER apm WITH ENCRYPTED PASSWORD 'apm';
CREATE DATABASE apm with owner apm;
GRANT ALL PRIVILEGES ON DATABASE apm TO apm;
-- --document management
CREATE USER documentmanagement WITH ENCRYPTED PASSWORD 'documentmanagement';
CREATE DATABASE documentmanagement with owner documentmanagement;
GRANT ALL PRIVILEGES ON DATABASE documentmanagement TO documentmanagement;