
ALTER TABLE stream ADD COLUMN stream_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN stream.stream_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

-- Populate uuid of existing records.
update stream set stream_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE stream
  DROP CONSTRAINT stream_pk CASCADE;

ALTER TABLE stream
  ADD CONSTRAINT pk_stream PRIMARY KEY (stream_uuid);

-- Create a clustering key on the id field.
--CREATE INDEX idx_stream_stream_id
  --ON stream
  --USING btree
  --(stream_id);
  
CLUSTER stream USING idx_stream_stream_id;

ALTER TABLE stream
  ADD CONSTRAINT unq_stream_uuid UNIQUE (stream_uuid);
