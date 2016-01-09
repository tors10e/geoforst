-- Activity Area

ALTER TABLE activity_area ADD COLUMN activityarea_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN activity_area.activityarea_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

-- Populate uuid of existing records.
update activity_area set activityarea_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE activity_area
  DROP CONSTRAINT harvest_area_pk CASCADE;
ALTER TABLE activity_area
  ADD CONSTRAINT pk_activity_area PRIMARY KEY (activityarea_uuid);


-- Create a clustering key on the id field.
CREATE INDEX idx_activity_area_activityarea_id
  ON activity_area
  USING btree
  (activityarea_id);
  
CLUSTER activity_area USING idx_activity_area_activityarea_id;

-- Cleanup
DROP INDEX fki_harvest_area_harvest_type;



