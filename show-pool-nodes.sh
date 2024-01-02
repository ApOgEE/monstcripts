#!/bin/bash

# https://github.com/ApOgEE
# Command untuk display pgpool nodes
# cara guna:
# watch -n 1 ./show-pool-nodes.sh
# pastikan password dah chmod 600 dalam ~/.pgpass
# contoh pgpass:
# *.*:postgres:pgpoolusr:passwordsaya
PGUSER=pgpoolusr
PGHOST=ha

psql -h $PGHOST -U $PGUSER postgres -c "\x" -c "show pool_nodes;"
