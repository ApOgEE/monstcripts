# --- Koleksi Monitoring Script ApOgEE ---
# --- script untuk display haproxy csv ke json ---
# install jq untuk display cantik
# apt install jq
# curl $haproxyurl | csv2json.py | jq
# Author: M. Fauzilkamil Zainuddin
# https://github.com/ApOgEE

import csv
import json
import sys

# Read CSV from stdin and convert it to a JSON
reader = csv.DictReader(sys.stdin) 
print(json.dumps(list(reader)))
