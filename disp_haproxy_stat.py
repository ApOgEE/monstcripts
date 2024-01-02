# --- Koleksi Monitoring Script ApOgEE ---
# --- script untuk display haproxy csv dalam table ---
# Author: M. Fauzilkamil Zainuddin
# https://github.com/ApOgEE

import csv
import sys
from prettytable import PrettyTable

# Function to filter the required data
def filter_data(row):
    return [row['# pxname'] + '/' + row['svname'], row['scur'], row['status']]

# Read CSV from stdin
reader = csv.DictReader(sys.stdin)

# Create a PrettyTable instance
table = PrettyTable()
table.field_names = ["Name", "Current Sessions", "Status"]
table.align = "l"

# Filter and add rows to the table for frontend and backend
for row in reader:
    if row['svname'] in ['FRONTEND', 'BACKEND']:
        table.add_row(filter_data(row))

# Print the table
print(table)
