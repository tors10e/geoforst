import os

host = "geo.torstenernst.com"
port = 5432
username = "ternst"
password = "Black1ce!"
database = "fsp"
outputPath = "~/temp/"
outputFile = "geoforst.sqlite"
tables = ["public.cultural_type",
          "public.unit_concentration_type",
          "public.forest_age_type",
          "public.harvest_type",
          "public.ordinal_magnitude_type",
          "public.plot_geometry_type",
          "public.ordinal_sufficiency_type",
          "public.species_tree_type",
          "public.unit_length_type",
          "public.activity_type",
          "public.unit_area_type",
          "public.recreation_type",
          "public.habitat_enhancement_type",
          "public.road_access_status_type",
          "public.forest_type",
          "public.road_surface_type",
          "public.road_type",
          "public.severity_type",
          "public.stand_type",
          "public.stocking_type",
          "public.task_status_type",
          "public.unit_type",
          "public.water_type",
          "public.trail_status_type",
          "public.trail_type",
          "public.activity_area", 
          "public.burn_compartment", 
          "public.control_point", 
          "public.cultural_point", 
          "public.firebreak_line", 
          "forest_inventory_plot", 
          "public.habitat_enhancement_area", 
          "public.habitat_enhancement_point", 
          "public.land_area",
          "public.recreation_point", 
          "public.road_line", 
          "public.soil_test", 
          "public.stand_area", 
          "public.stream",
          "public.streamside_management_zone", 
          "public.trail", 
          "public.tree" ,
          "public.water_point",
          "public.planned_activity",
          "public.soil_test_recommendation",
          "public.stand_description",
          "public.stand_status",
          "public.tree_status"]

#password = input("Please enter password for user %s") %(username)
print("Loading...")
for table in tables:
   commandString = "ogr2ogr -f SQLite -overwrite  %s%s  PG:\"host=%s user=%s dbname=%s password=%s port=%s\" %s" %(outputPath, outputFile, host, username, database, password, port, table)
   print("Loading table " + table)
   os.system(commandString)

print ("Loading complete!")