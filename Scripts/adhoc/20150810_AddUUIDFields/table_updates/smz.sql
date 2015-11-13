
ALTER TABLE streamside_management_zone ADD COLUMN smz_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN streamside_management_zone.smz_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

-- Populate uuid of existing records.
update streamside_management_zone set smz_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE streamside_management_zone
  DROP CONSTRAINT streamside_mgt_zone_pk CASCADE;

ALTER TABLE streamside_management_zone
  ADD CONSTRAINT pk_streamside_management_zone PRIMARY KEY (smz_uuid);

-- Create a clustering key on the id field.
CREATE INDEX idx_smz_smz_id
  ON streamside_management_zone
  USING btree
  (smz_id);
  
CLUSTER streamside_management_zone USING idx_smz_smz_id;

ALTER TABLE streamside_management_zone
  ADD CONSTRAINT unq_smz_uuid UNIQUE(smz_uuid);
