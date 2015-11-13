
BEGIN;
ALTER TABLE forest_inventory_plot ADD COLUMN forestinventoryplot_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN forest_inventory_plot.forestinventoryplot_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';
COMMIT;

BEGIN;
-- Populate uuid of existing records.
update forest_inventory_plot set forestinventoryplot_uuid = uuid_generate_v1();


-- Change primary key to the uuid field.
ALTER TABLE forest_inventory_plot
  DROP CONSTRAINT forest_inventory_plot_pkey CASCADE;
ALTER TABLE forest_inventory_plot
  ADD CONSTRAINT pk_forest_inventory_plot PRIMARY KEY (forestinventoryplot_uuid);


-- Create a clustering key on the id field.
CREATE INDEX idx_forest_inventory_plot_forestinventoryplot_id
  ON forest_inventory_plot
  USING btree
  (forestinventoryplot_id);
  
CLUSTER forest_inventory_plot USING idx_forest_inventory_plot_forestinventoryplot_id;

ALTER TABLE forest_inventory_plot
  ADD CONSTRAINT unq_forestinventoryplot_uuid UNIQUE (forestinventoryplot_uuid);
COMMIT;

  -- Alter dependent objects.
BEGIN;
ALTER TABLE forest_inventory_data ADD COLUMN forestinventoryplot_uuid uuid;
COMMIT;

update forest_inventory_data t1
 set forestinventoryplot_uuid = t2.forestinventoryplot_uuid
 from forest_inventory_plot t2
 where t2.forestinventoryplot_id = t1.forestinventoryplot_id;



--ALTER TABLE forest_inventory_data DROP CONSTRAINT fk_land_area;
  
ALTER TABLE forest_inventory_data
  ADD CONSTRAINT fk_forest_inventory_plot FOREIGN KEY(forestinventoryplot_uuid) REFERENCES forest_inventory_plot (forestinventoryplot_uuid);

ALTER TABLE forest_inventory_data DROP COLUMN forestinventoryplot_id;




