""" This script synchronizes data from the sqlite database to the master postgresql database.
 It uses uses the ogr2ogr update and append commands to update the postgres staging database.
ex. python sychronizedatasqlitetopg.py ~./temp/test.sqlite ternst --test --mock
"""

import os
import getpass
import argparse
import utilities

parser = argparse.ArgumentParser(description="Update postgresql with data from sqlite.")
parser.add_argument("sqlitedb", help="Sqlite database file and location. i.e. '/temp/db.sqlite'.")
parser.add_argument("dataowner",help="User who owns the data stored in the auth_user table in the database. i.e. 'ternst'.")
parser.add_argument("--test", action="store_true", help="Run in test mode which will write to the local database.")
parser.add_argument("--create", action="store_true", help="Creates the tables in the database. Use for initial run to setup staging.")
parser.add_argument("--mock", action="store_true", help="Perform a mock run to print out what the execution would look like.")
args = parser.parse_args()

# Set initial variables.
if args.test=="True":
    host = "geo.torstenernst.com"
else:
    host = "localhost"
    
port = 5432
dest_database = "fsp"
source_database = args.sqlitedb
#source_path = "$GEOFORST_HOME/Data/"
#source_file = "geoforst.sqlite"
schema = "staging"
inputFile = args.sqlitedb
data_owner = args.dataowner

tables = [
    ["activity_area", "MULTIPOLYGON"],
    ["burn_compartment", "POLYGON"],
    ["control_point", "POINT"],
    ["cultural_point", "POINT"],
    ["forest_inventory_data"],
    ["firebreak_line", "LINESTRING"],
    ["forest_inventory_plot", "POLYGON"],
    ["habitat_enhancement_area", "POLYGON"],
    ["habitat_enhancement_point", "POINT"],
    ["hazard", "POINT"],
    ["land_area", "POLYGON"],
    ["recreation_point", "POINT"],
    ["road_line", "MULTILINESTRING"],
    ["soil_test", "POINT"],
    ["soil_test_recommendation"],
    ["stand_status"],
    ["stand_area", "POLYGON"],
    ["stream", "LINESTRING"],
    ["streamside_management_zone", "MULTIPOLYGON"],
    ["trail", "LINESTRING"],
    ["tree" , "POINT"],
    ["water_point", "POINT"],
    ["planned_activity"],
    ["stand_description"],
    ["tree_status"]
]

username = "staging" #= raw_input("Please enter user name for database %s on %s: " %(database, host))
password = getpass.getpass("Please enter password for user %s: " %(username))
conn_string = "dbname=%s user=%s host=%s password=%s port=%s" %(dest_database, username, host, password, port)
user_id = utilities.get_user_id(conn_string, data_owner)

print("Deleting staging tables...")
for table in tables:
    print("Deleting records from %s" %(table[0])) 
    if not args.mock == True:
        utilities.delete_features(conn_string, table[0])

print("Updating staging database...")
for table in tables:
    commandString = "ogr2ogr -f \"PostgreSQL\"" 
    connectionString = " PG:\"host=%s user=%s dbname=%s password=%s port=%s\"" %(host, username, dest_database, password, port)
    if args.create == False:
        commandString = utilities.create_ogr_command(host, port, username, password, source_database, dest_database, table, schema)
    else:
        selectString = " -overwrite %s %s -nln %s.%s" %(inputFile, table[0], table[0])
    commandString = commandString
    
    try:
        if args.mock == True:
            print(commandString)
        else:
            os.system(commandString)
            # Update staging records to user_id;
            utilities.update_user(conn_string, table, user_id)
            
    except (IOError, EnvironmentError, TypeError) as e:
        print(e)
        wait = input("PRESS ENTER TO CONTINUE.")

print("Loading complete.")      


