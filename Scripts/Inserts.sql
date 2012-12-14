INSERT INTO "StandArea" (StandAreaID, Geometry,  "Shape_Leng" , "Shape_Area" , "Description" , "Age" , "Stocking", "Beetle_Dam", "ForestryOperation" )
SELECT Stand_No, Geometry, Shape_length, Shape_area, Descriptio, age, stocking, beetle_dam, forestry_o from stand;

INSERT INTO PlannedActivity(StandID, ActTypeID, PlannedYear, ActDesc, ActDate, Revenue)
SELECT Stand_ID, ActivityType_ID, PlannedYear, ActivityDesc, ActivityDate, Revenue FROM Activity

INSERT INTO LandArea(LandAreaDesc, Geometry)
SELECT Location, Geometry FROM AdministrativeArea

INSERT INTO StandActivity(StandID, ActTypeID, PlannedDate, Description, CompletedDate)
SELECT StandID, ActTypeID, PlannedYear, ActDesc, ActDate FROM PlannedActivity;

INSERT INTO "StandStatus"(StandNo, Date, Age, Stocking, Damaged, Recommended_Treatment, Description)
select distinct Stand_No, '2009', Age, Stocking, Beetle_dam, Forestry_O, Descriptio from oldstand;

INSERT INTO StandActivity(StandAreaID, ActTypeID, PlannedDate, CompletedDate, Description, Notes, Revenue)
SELECT saa.StandAreaID, say.ActTypeID, say.PlannedDate, say.CompletedDate, say.Description, say.Notes, say.Revenue FROM old_standactivity_111027 as say
join standarea saa on saa.stand_no = say.standid;


INSERT INTO "StandStatus"(StandAreaID, Date, Age, Stocking, Damaged, Recomended_Treatment, Description)
select 1, '2009', os.Age, os.Stocking, os.Beetle_dam, os.Forestry_O, os. Descriptio
from standarea as sa 
left outer join old_stand as os on sa.stand_no= os.stand_no
where sa.stand_no = 1

INSERT INTO "geometry_columns" VALUES ("HarvestArea","Geometry","POLYGON","2","26917","0");

insert into standarea (standareaid, geometry, standno, description)
select standareaid, geometry, stand_no, standdesc from standarea_111026

insert into geometry_columns(f_table_name, f_geometry_column, type, coord_dimension, srid, spatial_index_enabled)
VALUES ('HarvestArea', 'Geometry','MULTIPOLYGON', '2', '26917', '0');

//Insert FSP plans.
