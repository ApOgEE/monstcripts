#!/bin/bash
# https://github.com/ApOgEE
# Command untuk display postgres replica streaming
# cara guna:
# watch -n 1 ./show-streaming.sh
# pastikan password dah chmod 600 dalam ~/.pgpass
# contoh pgpass:
# *.*:postgres:pgpoolusr:passwordsaya
PGUSER=pgpoolusr
PGHOST=ha

psql -h $PGHOST -U $PGUSER postgres -c "select client_addr, state, TO_CHAR(backend_start, 'YYYY/MM/DD HH:MI:SS') backend_startf, write_lsn from pg_stat_replication;"
