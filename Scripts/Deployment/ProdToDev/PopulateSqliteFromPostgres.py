# Delete existing database and replace with a blank one with spatialite 
# and populate sqlite table with data from postgres.

import os
import getpass
import datetime
from datetime import date


host = "geo.torstenernst.com"
port = 5432
database = "fsp"
outputPath = "$GEOFORST_HOME/Data/"
outputFile = "geoforst.sqlite"

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


# Delete existing database and replace with a blank one with spatialite so that we 
# have all the spatial components needed when we load the new table structure.
print("Rebuilding %s%s") %(outputPath, outputFile)
try:
   commandString = "mv %s%s %s%s_" %(outputPath, outputFile, outputPath, outputFile) + date.today().__str__()
   os.system(commandString) 
except IOError: 
    # The source file may not have existed.
    print "%s%s does not exist, backup not completed" %(outputPath, outputFile)

# Create a new spatialite database ready for loading.
try:
    commandString = "spatialite %s%s '.database'" %(outputPath, outputFile)
    os.system(commandString) 
except (IOError, EnvironmentError, TypeError) as e:
    # Unsure of error, so let's just print it out.
    print e
    
# Use ogr2ogr to populate the sqlite tables from postgresql.
for table in spatialTables:
   connectString = "ogr2ogr -f SQLite -overwrite  %s%s  PG:\"host=%s user=%s dbname=%s password=%s port=%s\"" %(outputPath, outputFile, host, username, database, password, port)
   selectString = "-sql \"select * from %s;\"" %(table[0])
   nameString = "-nln %s" %(table[0])
   if table.__len__() > 1 :
       geomTypeString = "-nlt %s" %(table[1])
   else: geomTypeString = ""
   commandString = connectString + " " + selectString + " " + nameString + " " + geomTypeString
   print("Loading table " + table[0])
   try:
       #print(commandString)
       os.system(commandString)
   except (IOError, EnvironmentError, TypeError) as e:
      # Error could be that the geometery type is incorrect.
      # Unsure of error, so let's just print it out.
      print e
        
print ("Loading complete!")
