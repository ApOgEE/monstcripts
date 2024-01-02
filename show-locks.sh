#!/bin/bash

# https://github.com/ApOgEE
# Command untuk display postgres locking table
# cara guna:
# watch -n 5 ./show-locks.sh
PGUSER=pgpoolusr
PGHOST=ha

query="SELECT pga.datname, pg_locks.relation::regclass, pg_locks.mode,pg_locks.granted,pga.pid,age(clock_timestamp(), pga.query_start) AS \"age\", pga.usename,LEFT(pga.query, 20) AS truncated_query FROM pg_locks JOIN pg_stat_activity pga ON pg_locks.pid = pga.pid WHERE pg_locks.database IS NOT NULL AND pga.usename NOT IN ('${PGUSER}') ORDER BY pga.datname, pg_locks.relation, pg_locks.mode;"
psql -h $PGHOST -U $PGUSER postgres -c "$query"
