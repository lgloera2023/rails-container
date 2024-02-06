#!/bin/bash

service postgresql start

PSQL_QUERY="psql -c \"create role $DATABASE_USER with createdb login password '$DATABASE_PASSWORD';\""
runuser -l postgres -c "$PSQL_QUERY"

./bin/bash
