# --- Koleksi Monitoring Script ApOgEE ---
# --- script untuk display haproxy csv dalam table ---
# Author: M. Fauzilkamil Zainuddin
# https://github.com/ApOgEE

import csv
import sys
from prettytable import PrettyTable

# Function to create and return a formatted table
def create_table(field_names):
    table = PrettyTable()
    table.field_names = field_names
    table.align = "l"
    return table

# Read CSV from stdin
reader = csv.DictReader(sys.stdin)

# Create tables for frontend and backend
frontend_table = create_table(["Frontend Name", "Current Sessions","Max Sessions", "Status"])
backend_table = create_table(["Backend Name/Node", "Current Sessions","Max Sessions", "Status"])

# Filter and add rows to the respective tables
for row in reader:
    if row['svname'] == 'FRONTEND' and row['# pxname'] != 'stats':
        frontend_table.add_row([row['# pxname'], row['scur'], row['smax'], row['status']])
    elif (row['svname'] == 'BACKEND' or row['svname'] != 'FRONTEND') and row['# pxname'] != 'stats':
        backend_table.add_row([row['# pxname'] + '/' + row['svname'], row['scur'], row['smax'],row['status']])

# Print the tables
print("Frontend Statistics:")
print(frontend_table)
print("\nBackend Statistics:")
print(backend_table)