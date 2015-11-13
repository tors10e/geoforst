
ALTER TABLE tree_status ADD COLUMN treestatus_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN tree_status.treestatus_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

-- Populate uuid of existing records.
update tree_status set treestatus_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE tree_status
  DROP CONSTRAINT pk_tree_status CASCADE;

ALTER TABLE tree_status
  ADD CONSTRAINT pk_tree_status PRIMARY KEY(treestatus_uuid);

-- Create a clustering key on the id field.
CREATE INDEX idx_tree_status_treestatus_id
  ON tree_status
  USING btree
  (treestatus_id);
  
CLUSTER tree_status USING idx_tree_status_treestatus_id;

ALTER TABLE tree_status
  ADD CONSTRAINT unq_tree_status_uuid UNIQUE(treestatus_uuid);


