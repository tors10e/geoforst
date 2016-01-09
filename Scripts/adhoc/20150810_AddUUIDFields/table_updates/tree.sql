
ALTER TABLE tree ADD COLUMN tree_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN tree.tree_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

-- Populate uuid of existing records.
update tree set tree_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE tree
  DROP CONSTRAINT tree_pk CASCADE;

ALTER TABLE tree
  ADD CONSTRAINT pk_tree PRIMARY KEY (tree_uuid);

-- Create a clustering key on the id field.
--CREATE INDEX idx_tree_tree_id
--  ON tree
 -- USING btree
--  (tree_id);
  
CLUSTER tree USING idx_tree_tree_id;

ALTER TABLE tree
  ADD CONSTRAINT unq_tree_uuid UNIQUE(tree_uuid);

-- Update dependent objects.

ALTER TABLE tree_status ADD COLUMN tree_uuid uuid;

update tree_status t1
 set tree_uuid = t2.tree_uuid
 from tree t2
 where t2.tree_id = t1.tree_id;

ALTER TABLE tree_status
  ADD CONSTRAINT fk_tree_status_tree FOREIGN KEY (tree_uuid) REFERENCES tree(tree_uuid);

ALTER TABLE tree_status DROP COLUMN tree_id;

-- Forest Inventory Data
ALTER TABLE forest_inventory_data ADD COLUMN tree_uuid uuid;

update forest_inventory_data t1
 set tree_uuid = t2.tree_uuid
 from tree t2
 where t2.tree_id = t1.tree_id;

--ALTER TABLE forest_inventory_data DROP CONSTRAINT fk_tree_status_tree;
  
ALTER TABLE forest_inventory_data
  ADD CONSTRAINT fk_tree_status_tree FOREIGN KEY(tree_uuid) REFERENCES tree(tree_uuid);

ALTER TABLE forest_inventory_data DROP COLUMN tree_id;
