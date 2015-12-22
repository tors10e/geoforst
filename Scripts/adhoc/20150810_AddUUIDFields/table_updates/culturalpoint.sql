
ALTER TABLE cultural_point ADD COLUMN culturalpoint_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN cultural_point.culturalpoint_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

-- Populate uuid of existing records.
update cultural_point set culturalpoint_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE cultural_point
  DROP CONSTRAINT cultural_point_pk CASCADE;
ALTER TABLE cultural_point
  ADD CONSTRAINT pk_cultural_point PRIMARY KEY (culturalpoint_uuid);

-- Create a clustering key on the id field.
CREATE INDEX idx_cultural_point_culturalpoint_id
  ON cultural_point
  USING btree
  (cultpt_id);
  
CLUSTER cultural_point USING idx_cultural_point_culturalpoint_id;
