
ALTER TABLE burn_compartment ADD COLUMN burncompartment_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN burn_compartment.burncompartment_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

-- Populate uuid of existing records.
update burn_compartment set burncompartment_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE burn_compartment
  DROP CONSTRAINT pk_burn_compartment CASCADE;
ALTER TABLE burn_compartment
  ADD CONSTRAINT pk_burn_compartment PRIMARY KEY (burncompartment_uuid);

-- Create a clustering key on the id field.
CREATE INDEX idx_burn_compartment_burncompartment_id
  ON burn_compartment
  USING btree
  (burncompartment_id);
  
CLUSTER burn_compartment USING idx_burn_compartment_burncompartment_id;
