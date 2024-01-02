#!/bin/bash

# https://github.com/ApOgEE
# Command untuk display haproxy stat di terminal
# cara guna:
# watch -n 5 ./show-haproxy.sh
STAT_USER=user
STAT_PASS=pass

curl -fs -u ${STAT_USER}:${STAT_PASS} 'http://ha:8080/stat;csv' | python3 disp_haproxy_stat.py
