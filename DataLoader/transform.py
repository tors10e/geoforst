# Delete records for specified user and update tables with latest data from 
# sqlite database.

import os
import getpass
import utilities

host = "localhost"
port = 5432
dest_database = "fsp"
source_path = "$GEOFORST_HOME/Data/"
source_file = "geoforst.sqlite"
schema = "staging"

# List of tables we want to update.
spatial_tables = [
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


username="postgres"
password="post28#Inca"
data_owner_name="ernst"
#username = raw_input("Please enter username for database %s on %s: " %(dest_database, host))
#password = getpass.getpass("Please enter password for user %s: " %(username))
conn_string = "dbname=%s user=%s host=%s password=%s port=%s" %(dest_database, username, host, password, port)

#data_owner_name = raw_input("Enter the data owner's user name: ")
user_id = utilities.get_user_id(conn_string, data_owner_name)
if (user_id):
    source_database = os.path.join(source_path, source_file)
    for table in spatial_tables:
        utilities.delete_features(conn_string, table, user_id)
        print("Deleting table %s for user %s" %(table[0], data_owner_name)) 
    for table in spatial_tables:
        os_command = utilities.create_ogr_command(host, port, username, password, source_database, dest_database, table, schema)
        print(os_command)
        #os.system(os_command)
        #raw_input("Press enter to continue...")
else:
    print("User not found.")   
        