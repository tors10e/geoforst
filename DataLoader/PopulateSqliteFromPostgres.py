"""Delete existing file database and replace with  schema  and data
from postgres.
ex. python populatesqlitefrompostgres.py --destdb ~/temp/test.sqlite --user ernst --test or
    python populatesqlitefrompostgres.py to load all records for all users
        into the default location.
"""

import os
import getpass
from datetime import date
import argparse
import utilities

parser = argparse.ArgumentParser(description="Overwrite sqlite database with data and schema from postgres.")
parser.add_argument("--destdb", action="store", help="Specify a deployment database, default is geoforst.sqlite in the project directory.")
parser.add_argument("--user", action="store", help="Specify the user whose data will be loaded into the sqlite database." )
parser.add_argument("--test", action="store_true", help="Run in test mode which will write to the local database.")
args = parser.parse_args()

host="localhost"
if args.test=="True": host = "geo.torstenernst.com"
port = 5432
database = "fsp"
outputPath = "$GEOFORST_HOME/Data/"
outputFile = "geoforst.sqlite"

if args.destdb:
    destination_db = args.destdb
else:
    destination_db = outputPath + outputFile


# List of tables we want to replicate in sqlite.
spatialTables = [
    ["activity_area", "MULTIPOLYGON"],
    ["burn_compartment", "POLYGON"],
    ["control_point", "POINT"],
    ["cultural_point", "POINT"],
    ["cultural_type"],
    ["firebreak_line", "LINESTRING"],
    ["forest_inventory_plot", "POLYGON"],
    ["habitat_enhancement_area", "POLYGON"],
    ["habitat_enhancement_point", "POINT"],
    ["hazard", "POINT"],
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


username = raw_input("Please enter username for database %s on %s: " %(database, host))
password = getpass.getpass("Please enter password for user %s: " %(username))

#connectionString = " PG:\"host=%s user=%s dbname=%s password=%s port=%s\"" %(host, username, database, password, port)
connectionString = "host=%s user=%s dbname=%s password=%s port=%s" %(host, username, database, password, port)

# Delete existing database and replace with a blank one with spatialite so that we 
# have all the spatial components needed when we load the new table structure.
print("Backing up %s") %(destination_db)
try:
    commandString = "mv %s %s_" %(destination_db, destination_db) + date.today().__str__()
    os.system(commandString) 
except IOError: 
    # The source file may not have existed.
    print("%s does not exist, backup not completed" %(destination_db))

# Create a new spatialite database ready for loading.
try:
    commandString = "spatialite %s .database" %(destination_db)
    os.system(commandString) 
except (IOError, EnvironmentError, TypeError) as e:
    # Unsure of error, so let's just print it out.
    print(e)
    
# Use ogr2ogr to populate the sqlite tables from postgresql.
for table in spatialTables:
    # Change this to use utilities package.
    ogr_connect_string = "ogr2ogr -f SQLite -overwrite  %s  PG:\"host=%s user=%s dbname=%s password=%s port=%s\"" %(destination_db, host, username, database, password, port)
    
    selectString = "-sql \"select * from %s\"" %(table[0])
    if args.user and table[0].find("_type") < 0: # Don't filter records from lookup tables. -1 means the string was not found.
        user_id = utilities.get_user_id(connectionString, args.user)
        selectString = "-sql \"select * from %s" %(table[0]) +  " where created_by_id = %s\"" %(user_id)
          
    nameString = "-nln %s" %(table[0])
    
    if table.__len__() > 1:
        geomTypeString = "-nlt %s" %(table[1])
    else: geomTypeString = ""
    
    commandString = ogr_connect_string + " " + selectString + " " + nameString + " " + geomTypeString
    print("Loading table " + table[0])
    try:
        os.system(commandString)
    except (IOError, EnvironmentError, TypeError) as e:
    # Error could be that the geometry type is incorrect.
    # Unsure of error, so let's just print it out for now.
        print(e)
        
print ("Loading complete!")
