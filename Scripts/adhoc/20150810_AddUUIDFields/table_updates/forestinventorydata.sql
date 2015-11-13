BEGIN;

ALTER TABLE forest_inventory_data ADD COLUMN forestinventorydata_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN forest_inventory_data.forestinventorydata_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

COMMIT;

-- Populate uuid of existing records.
update forest_inventory_data set forestinventorydata_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE forest_inventory_data
  DROP CONSTRAINT forest_inventory_data_pkey CASCADE;
ALTER TABLE forest_inventory_data
  ADD CONSTRAINT pk_forest_inventory_data PRIMARY KEY (forestinventorydata_uuid);


-- Create a clustering key on the id field.
CREATE INDEX idx_forest_inventory_data_forestinventorydata_id
  ON forest_inventory_data
  USING btree
  (forestinventorydata_id);
  
CLUSTER forest_inventory_data USING idx_forest_inventory_data_forestinventorydata_id;

ALTER TABLE forest_inventory_data
  ADD CONSTRAINT unq_forestinventorydata_uuid UNIQUE (forestinventorydata_uuid);




