
ALTER TABLE road_line ADD COLUMN roadline_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN road_line.roadline_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

-- Populate uuid of existing records.
update road_line set roadline_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE road_line
  DROP CONSTRAINT road_line_pk CASCADE;

ALTER TABLE road_line
  ADD CONSTRAINT pk_road_line PRIMARY KEY (roadline_uuid);

-- Create a clustering key on the id field.
CREATE INDEX idx_road_line_roadln_id
  ON road_line
  USING btree
  (roadln_id);
  
CLUSTER road_line USING idx_road_line_roadln_id;

ALTER TABLE road_line
  ADD CONSTRAINT unq_roadline_uuid UNIQUE (roadline_uuid);