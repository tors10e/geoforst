# This script synchronizes data from the sqlite database to the master postgresql database.
# It uses uses the ogr2ogr update and append commands to update the postgres database.

import os
import getpass
import datetime
from datetime import date
import argparse

parser = argparse.ArgumentParser(description="Update postgresql with data from sqlite.")
parser.add_argument("sqlitedb", help="Sqlite database file and location. i.e. '/temp/db.sqlite'")
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
database = "fsp"
schema = "staging"

inputFile = args.sqlitedb

tables = [
    ["activity_area", "MULTIPOLYGON"],
    ["burn_compartment", "POLYGON"],
    ["control_point", "POINT"],
    ["cultural_point", "POINT"],
    ["cultural_type"],
    ["firebreak_line", "LINESTRING"],
    ["forest_inventory_plot", "POLYGON"],
    ["habitat_enhancement_area", "POLYGON"],
    ["habitat_enhancement_point", "POINT"],
    ["land_area", "POLYGON"],
    ["recreation_point", "POINT"],
    ["road_line", "MULTILINESTRING"],
    ["soil_test", "POINT"],
    ["stand_area", "POLYGON"],
    ["stream", "LINESTRING"],
    ["streamside_management_zone", "MULTIPOLYGON"],
    ["trail", "LINESTRING"],
    ["tree" , "POINT"],
    ["water_point", "POINT"],
    ["unit_concentration_type"],
    ["forest_age_type"],
    ["harvest_type"],
    ["ordinal_magnitude_type"],
    ["plot_geometry_type"],
    ["ordinal_sufficiency_type"],
    ["species_tree_type"],
    ["unit_length_type"],
    ["activity_type"],
    ["unit_area_type"],
    ["recreation_type"],
    ["habitat_enhancement_type"],
    ["road_access_status_type"],
    ["forest_type"],
    ["road_surface_type"],
    ["road_type"],
    ["severity_type"],
    ["stand_type"],
    ["stocking_type"],
    ["task_status_type"],
    ["unit_type"],
    ["water_type"],
    ["trail_status_type"],
    ["trail_type"],
    ["planned_activity"],
    ["soil_test_recommendation"],
    ["stand_description"],
    ["stand_status"],
    ["tree_status"]
]

user = raw_input("Please enter user name for database %s on %s: " %(database, host))
password = getpass.getpass("Please enter password for user %s: " %(user))

print("Updating staging database...")
for table in tables:
    commandString = "ogr2ogr -f \"PostgreSQL\"" 
    connectionString = " PG:\"host=%s user=%s dbname=%s password=%s port=%s\"" %(host, user, database, password, port)
    if args.create == False:
        selectString = " -update -append  %s staging.%s" %(inputFile, table[0])
    else:
        selectString = " -overwrite %s %s -nln %s.%s" %(inputFile, table[0], schema, table[0])
    commandString = commandString + connectionString + selectString
    
    try:
        if args.mock == True:
            print(commandString)
        else:
            os.system(commandString)
    
    except (IOError, EnvironmentError, TypeError) as e:
        print(e)
        wait = input("PRESS ENTER TO CONTINUE.")

print("Loading complete.")      


