import os
import getpass

host = "geo.torstenernst.com"
port = 5432
username = "ternst"
password = ""
database = "fsp"
outputPath = "~/temp/"
outputFile = "geoforst.sqlite"
spatialTables = [
    ["activity_area", "POLYGON"],
    ["burn_compartment", "POLYGON"],
    ["control_point", "POINT"],
    ["cultural_point", "POINT"],
    ["firebreak_line", "LINESTRING"],
    ["forest_inventory_plot", "POLYGON"],
    ["habitat_enhancement_area", "POLYGON"],
    ["habitat_enhancement_point", "POINT"],
    ["land_area", "POLYGON"],
    ["recreation_point", "POINT"],
    ["road_line", "LINESTRING"],
    ["soil_test", "POINT"],
    ["stand_area", "POLYGON"],
    ["stream", "LINESTRING"],
    ["streamside_management_zone", "POLYGON"],
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
print("Loading...")
for table in spatialTables:
   connectString = "ogr2ogr -f SQLite -overwrite  %s%s  PG:\"host=%s user=%s dbname=%s password=%s port=%s\"" %(outputPath, outputFile, host, username, database, password, port)
   selectString = "-sql \"select * from %s;\"" %(table[0])
   nameString = "-nln %s" %(table[0])
   if table.__len__() > 1 :
       geomTypeString = "-nlt %s" %(table[1])
   else: geomTypeString = ""
   commandString = connectString + " " + selectString + " " + nameString + " " + geomTypeString
   print("Loading table " + table[0])
   #print(commandString)
   os.system(commandString)

print ("Loading complete!")
