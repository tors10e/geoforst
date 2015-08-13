
ALTER TABLE firebreak_line ADD COLUMN firebreakline_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN firebreak_line.firebreakline_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';


-- Populate uuid of existing records.
update firebreak_line set firebreakline_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE firebreak_line
  DROP CONSTRAINT firebreak_line_pk CASCADE;
ALTER TABLE firebreak_line
  ADD CONSTRAINT pk_firebreak_line PRIMARY KEY (firebreakline_uuid);

-- Create a clustering key on the id field.
CREATE INDEX idx_firebreak_line_firebreakline_id
  ON firebreak_line
  USING btree
  (fbkln_id);
  
CLUSTER firebreak_line USING idx_firebreak_line_firebreakline_id;

ALTER TABLE firebreak_line
  ADD CONSTRAINT unq_firebreakline_uuid UNIQUE (firebreakline_uuid);