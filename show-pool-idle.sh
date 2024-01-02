#!/bin/bash

# https://github.com/ApOgEE
# Command untuk display pgpool idle
# cara guna:
# watch -n 5 ./show-pool-idle.sh
# pastikan password dah chmod 600 dalam ~/.pgpass
# contoh pgpass:
# *.*:postgres:pgpoolusr:passwordsaya
PGUSER=pgpoolusr
PGHOST=ha

psql -h $PGHOST -U $PGUSER postgres -c "SHOW pool_processes;" | grep -v "rows\|row\|^$" | grep Idle | wc -l
