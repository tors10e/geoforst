#ogrinfo /Users/torsten/Documents/GIS/FSP/FSP.sqlite

# Geo
#ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=geo host=geo.torstenernst.com port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco SCHEMA=FSP -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite TreePoint


# Localhost

ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=fsp host=localhost port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite TreePoint

 ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=fsp host=localhost port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite ControlPoint
  528  ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=fsp host=localhost port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite CulturalPoint
  529  ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=fsp host=localhost port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite HabitatEnhancementArea
  530  ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=fsp host=localhost port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite HabitatEnhancementPoint
  531  ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=fsp host=localhost port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite HarvestArea
  532  ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=fsp host=localhost port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite LandArea
  533  ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=fsp host=localhost port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite RecreationPoint
  534  ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=fsp host=localhost port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite RoadLine
  535  ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=fsp host=localhost port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite RecreationPoint
  536  ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=fsp host=localhost port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite RecreationPoint -overwrite
  537  ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=fsp host=localhost port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite SMZ
  538  ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=fsp host=localhost port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite StandArea
  539  ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=fsp host=localhost port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite Streams
  540  ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=fsp host=localhost port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite WaterPoint
  541  ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=fsp host=localhost port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite vwHabitatEnhancementArea
  542  ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=fsp host=localhost port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite vwHabitatEnhancementPt
  543  ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=fsp host=localhost port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite vwPlannedStandActivities
  544  ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=fsp host=localhost port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite vwRoad

ogr2ogr --config SQLITE_LIST_ALL_TABLES YES -f "PostgreSQL" PG:"dbname=fsp host=localhost port=5432 user=postgres password=postgres " -lco OVERWRITE=YES -lco GEOMETRY_NAME=Geometry -lco SPATIAL_INDEX=YES /Users/torsten/Documents/GIS/FSP/FSP.sqlite FireBreakLine