#!/bin/bash

# https://github.com/ApOgEE
# Command untuk display pgpool wait
# cara guna:
# watch -n 5 ./show-pool-wait.sh
# pastikan password dah chmod 600 dalam ~/.pgpass
# contoh pgpass:
# *.*:postgres:pgpoolusr:passwordsaya
PGUSER=pgpoolusr
PGHOST=ha

psql -h $PGHOST -U $PGUSER postgres -c "SHOW pool_processes;" | grep -v "rows\|row\|^$" | grep Wait | wc -l
