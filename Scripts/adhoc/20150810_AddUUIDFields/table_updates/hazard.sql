
ALTER TABLE hazard ADD COLUMN hazard_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN hazard.hazard_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

-- Populate uuid of existing records.
update hazard set hazard_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE hazard
  DROP CONSTRAINT hazard_pk CASCADE;
ALTER TABLE hazard
  ADD CONSTRAINT pk_hazard PRIMARY KEY (hazard_uuid);

-- Create a clustering key on the id field.
--CREATE INDEX idx_hazard_hazard_id
--  ON hazard
--  USING btree
--  (hazard_id);
  
CLUSTER hazard USING idx_hazard_hazard_id;

ALTER TABLE hazard
  ADD CONSTRAINT unq_hazard_uuid UNIQUE (hazard_uuid);