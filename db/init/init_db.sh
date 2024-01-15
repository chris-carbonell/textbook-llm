#!/usr/bin/env bash

# constants
TODAY=$(date +"%Y-%m-%d")

# set up
set -e

# Funcs

# execute psql
# $1 = sql string
function execute {
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    $1 
EOSQL
}

# enable extension
execute "CREATE EXTENSION vector;"

# create super user
# this is handled by the .env
# execute "
#     CREATE ROLE ${POSTGRES_USER} WITH LOGIN PASSWORD '${POSTGRES_PASSWORD}';
#     ALTER ROLE ${POSTGRES_USER} SUPERUSER;
# "