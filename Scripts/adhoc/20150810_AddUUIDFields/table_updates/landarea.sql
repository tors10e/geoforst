-- Land Area

ALTER TABLE land_area ADD COLUMN landarea_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN land_area.landarea_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

-- Populate uuid of existing records.
update land_area set landarea_uuid = uuid_generate_v1();
select landarea_id, landarea_uuid from land_area;

-- Change primary key to the uuid field.
ALTER TABLE land_area
  DROP CONSTRAINT land_area_pk CASCADE;
ALTER TABLE land_area
  ADD CONSTRAINT pk_land_area PRIMARY KEY (landarea_uuid);

-- Create a clustering key on the id field.
CLUSTER land_area USING idx_land_area_landarea_id;

-- Alter dependent objects.
DROP TABLE land_owner;

-- Planned Activity

ALTER TABLE planned_activity ADD COLUMN landarea_uuid uuid;

update planned_activity t1
 set landarea_uuid = t2.landarea_uuid
 from land_area t2
 where t2.landarea_id = t1.landarea_id;

--ALTER TABLE planned_activity DROP CONSTRAINT fk_land_area;
  
ALTER TABLE planned_activity
  ADD CONSTRAINT fk_land_area FOREIGN KEY (landarea_uuid) REFERENCES land_area (landarea_uuid);

ALTER TABLE planned_activity DROP COLUMN landarea_id;

