
ALTER TABLE trail ADD COLUMN trail_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN trail.trail_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

-- Populate uuid of existing records.
update trail set trail_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE trail
  DROP CONSTRAINT trail_pkey CASCADE;

ALTER TABLE trail
  ADD CONSTRAINT pk_trail PRIMARY KEY (trail_uuid);

-- Create a clustering key on the id field.
CREATE INDEX idx_trail_trail_id
  ON trail
  USING btree
  (trail_id);
  
CLUSTER trail USING idx_trail_trail_id;

ALTER TABLE trail
  ADD CONSTRAINT unq_trail_uuid UNIQUE(trail_uuid);
