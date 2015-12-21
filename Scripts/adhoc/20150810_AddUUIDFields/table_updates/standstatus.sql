
ALTER TABLE stand_status ADD COLUMN standstatus_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN stand_status.standstatus_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

-- Populate uuid of existing records.
update stand_status set standstatus_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE stand_status
  DROP CONSTRAINT pk_stand_status CASCADE;

ALTER TABLE stand_status
  ADD CONSTRAINT pk_stand_status PRIMARY KEY (standstatus_uuid);

-- Create a clustering key on the id field.
--CREATE INDEX idx_stand_status_standstatus_id
 -- ON stand_status
 -- USING btree
 -- (standstatus_id);
  
CLUSTER stand_status USING idx_stand_status_standstatus_id;

ALTER TABLE stand_status
  ADD CONSTRAINT unq_stand_status_uuid UNIQUE (standstatus_uuid);



