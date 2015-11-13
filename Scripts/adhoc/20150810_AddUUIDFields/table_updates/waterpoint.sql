
ALTER TABLE water_point ADD COLUMN waterpoint_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN water_point.waterpoint_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

-- Populate uuid of existing records.
update water_point set waterpoint_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE water_point
  DROP CONSTRAINT water_point_pk CASCADE;

ALTER TABLE water_point
  ADD CONSTRAINT pk_water_point PRIMARY KEY(waterpoint_uuid);

-- Create a clustering key on the id field.
--CREATE INDEX idx_water_point_waterpoint_id
--  ON water_point
--  USING btree
--  (waterpoint_id);
  
CLUSTER water_point USING idx_water_point_waterpoint_id;

ALTER TABLE water_point
  ADD CONSTRAINT unq_water_point_uuid UNIQUE(waterpoint_uuid);


