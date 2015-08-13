
ALTER TABLE control_point ADD COLUMN controlpoint_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN control_point.controlpoint_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

-- Populate uuid of existing records.
update control_point set controlpoint_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE control_point
  DROP CONSTRAINT control_point_pk CASCADE;
ALTER TABLE control_point
  ADD CONSTRAINT pk_control_point PRIMARY KEY (controlpoint_uuid);

-- Create a clustering key on the id field.
CREATE INDEX idx_control_point_controlpoint_id
  ON control_point
  USING btree
  (controlpt_id);
  
CLUSTER control_point USING idx_control_point_controlpoint_id;
