
ALTER TABLE habitat_enhancement_point ADD COLUMN habenhpt_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN habitat_enhancement_point.habenhpt_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

-- Populate uuid of existing records.
update habitat_enhancement_point set habenhpt_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE habitat_enhancement_point
  DROP CONSTRAINT habitat_enhancement_point_pk CASCADE;
ALTER TABLE habitat_enhancement_point
  ADD CONSTRAINT pk_habitat_enhancement_point PRIMARY KEY (habenhpt_uuid);

-- Create a clustering key on the id field.
CREATE INDEX idx_habitat_enhancement_point_habenhpt_id
  ON habitat_enhancement_point
  USING btree
  (habenhpt_id);
  
CLUSTER habitat_enhancement_point USING idx_habitat_enhancement_point_habenhpt_id;

ALTER TABLE habitat_enhancement_point
  ADD CONSTRAINT unq_habenhpt_uuid UNIQUE (habenhpt_uuid);