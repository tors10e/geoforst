
ALTER TABLE recreation_point ADD COLUMN recreationpoint_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN recreation_point.recreationpoint_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

-- Populate uuid of existing records.
update recreation_point set recreationpoint_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE recreation_point
  DROP CONSTRAINT recreation_point_pk CASCADE;

ALTER TABLE recreation_point
  ADD CONSTRAINT pk_recreation_point PRIMARY KEY (recreationpoint_uuid);

-- Create a clustering key on the id field.
CREATE INDEX idx_recreation_point_recpt_id
  ON recreation_point
  USING btree
  (recpt_id);
  
CLUSTER recreation_point USING idx_recreation_point_recpt_id;

ALTER TABLE recreation_point
  ADD CONSTRAINT unq_recreationpoint_uuid UNIQUE (recreationpoint_uuid);