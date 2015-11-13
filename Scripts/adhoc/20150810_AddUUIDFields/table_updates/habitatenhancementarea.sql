
ALTER TABLE habitat_enhancement_area ADD COLUMN habenharea_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN habitat_enhancement_area.habenharea_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

-- Populate uuid of existing records.
update habitat_enhancement_area set habenharea_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE habitat_enhancement_area
  DROP CONSTRAINT habitat_enhancement_area_pk CASCADE;
ALTER TABLE habitat_enhancement_area
  ADD CONSTRAINT pk_habitat_enhancement_area PRIMARY KEY (habenharea_uuid);

-- Create a clustering key on the id field.
CREATE INDEX idx_habitat_enhancement_area_habenharea_id
  ON habitat_enhancement_area
  USING btree
  (habenharea_id);
  
CLUSTER habitat_enhancement_area USING idx_habitat_enhancement_area_habenharea_id;

ALTER TABLE habitat_enhancement_area
  ADD CONSTRAINT unq_habenharea_uuid UNIQUE (habenharea_uuid);