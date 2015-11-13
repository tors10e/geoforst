-- select * from spatial_ref_sys where srid = 2163;

-- Previous value for 2163 = '"PROJCS["unnamed",GEOGCS["unnamed ellipse",DATUM["unknown",SPHEROID["unnamed",6370997,0]],PRIMEM["Greenwich",0],UNIT["degree",0.0174532925199433]],PROJECTION["Lambert_Azimuthal_Equal_Area"],PARAMETER["latitude_of_center",45],PARAMETER["longitude_of_center", (...)"'
--update spatial_ref_sys 
--	SET srtext = 'PROJCS["US National Atlas Equal Area",GEOGCS["Unspecified datum based upon the Clarke 1866 Authalic Sphere",DATUM["Not_specified_based_on_Clarke_1866_Authalic_Sphere",SPHEROID["Clarke 1866 Authalic Sphere",6370997,0]],PRIMEM["Greenwich",0],UNIT["degree",0.01745329251994328]],UNIT["metre",1],PROJECTION["Lambert_Azimuthal_Equal_Area"],PARAMETER["latitude_of_center",45],PARAMETER["longitude_of_center",-100],PARAMETER["false_easting",0],PARAMETER["false_northing",0],AXIS["X",EAST],AXIS["Y",NORTH]]'
--	WHERE srid = 2163;

DROP VIEW IF EXISTS vw_qc_land_area_by_year;
DROP VIEW IF EXISTS vw_land_area_centroid;
DROP VIEW IF EXISTS vw_qc_land_area_by_year;
DROP VIEW IF EXISTS vw_stand_area_by_year;
DROP VIEW IF EXISTS vw_stand_area_all;

ALTER TABLE land_area
 ALTER COLUMN geometry TYPE geometry(Polygon,2163) 
  USING ST_Transform(geometry,2163);

ALTER TABLE land_area_history
 ALTER COLUMN geometry TYPE geometry(Polygon,2163) 
  USING ST_Transform(geometry,2163);

 ALTER TABLE activity_area
 ALTER COLUMN geometry TYPE geometry(MultiPolygon,2163) 
  USING ST_Transform(geometry,2163);

 ALTER TABLE burn_compartment
 ALTER COLUMN geometry TYPE geometry(Polygon,2163) 
  USING ST_Transform(geometry,2163);

 ALTER TABLE control_point
 ALTER COLUMN geometry TYPE geometry(Point,2163) 
  USING ST_Transform(geometry,2163);
  
 ALTER TABLE cultural_point
 ALTER COLUMN geometry TYPE geometry(Point,2163) 
  USING ST_Transform(geometry,2163);

 ALTER TABLE firebreak_line
 ALTER COLUMN geometry TYPE geometry(LineString,2163) 
  USING ST_Transform(geometry,2163);

 ALTER TABLE habitat_enhancement_area
 ALTER COLUMN geometry TYPE geometry(Polygon,2163) 
  USING ST_Transform(geometry,2163);

 ALTER TABLE habitat_enhancement_point
 ALTER COLUMN geometry TYPE geometry(Point,2163) 
  USING ST_Transform(geometry,2163);  

 ALTER TABLE recreation_point
 ALTER COLUMN geometry TYPE geometry(Point,2163) 
  USING ST_Transform(geometry,2163);

 ALTER TABLE road_line
 ALTER COLUMN geometry TYPE geometry(MultiLineString,2163) 
  USING ST_Transform(geometry,2163);

 ALTER TABLE soil_test
 ALTER COLUMN geometry TYPE geometry(Point,2163) 
  USING ST_Transform(geometry,2163);

 ALTER TABLE stand_area
 ALTER COLUMN geometry TYPE geometry(Polygon,2163) 
  USING ST_Transform(geometry,2163);

 ALTER TABLE stand_area_history
 ALTER COLUMN geometry TYPE geometry(Polygon,2163) 
  USING ST_Transform(geometry,2163);

 ALTER TABLE stream
 ALTER COLUMN geometry TYPE geometry(LineString,2163) 
  USING ST_Transform(geometry,2163);

 ALTER TABLE streamside_management_zone
 ALTER COLUMN geometry TYPE geometry(MultiPolygon,2163) 
  USING ST_Transform(geometry,2163);

 ALTER TABLE trail
 ALTER COLUMN geometry TYPE geometry(LineString,2163) 
  USING ST_Transform(geometry,2163);

 ALTER TABLE tree
 ALTER COLUMN geometry TYPE geometry(Point,2163) 
  USING ST_Transform(geometry,2163);

 ALTER TABLE water_point
 ALTER COLUMN geometry TYPE geometry(Point,2163) 
  USING ST_Transform(geometry,2163);