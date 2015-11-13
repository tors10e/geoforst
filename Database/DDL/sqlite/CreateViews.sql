CREATE VIEW "vwWaterPoints" AS
SELECT 
      "a"."ROWID" AS "ROWID"
    , "a"."WaterPtID" AS "WaterPtID"
    , "b"."WaterTypeDesc" AS "WaterTypeDesc"
    , "a"."WaterPtDesc" AS "WaterPtDesc"
    , "a"."Geometry" AS "Geometry"
FROM "WaterPoint" AS "a"
JOIN "WaterType" AS "b" USING ("WaterTypeID");

INSERT INTO views_geometry_columns ( "view_name", "view_geometry", "view_rowid", "f_table_name", "f_geometry_column")
VALUES("vwWaterPoints", "Geometry", "ROWID", "WaterPoint", "Geometry");
