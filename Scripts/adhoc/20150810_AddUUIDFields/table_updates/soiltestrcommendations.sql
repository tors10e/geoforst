
ALTER TABLE soil_test_recommendation ADD COLUMN soiltestrec_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN soil_test_recommendation.soiltestrec_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

-- Populate uuid of existing records.
update soil_test_recommendation set soiltestrec_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE soil_test_recommendation
  DROP CONSTRAINT pk_soil_test_recommendation CASCADE;

ALTER TABLE soil_test_recommendation
  ADD CONSTRAINT pk_soil_test_recommendation PRIMARY KEY (soiltestrec_uuid);

-- Create a clustering key on the id field.
CREATE INDEX idx_soil_test_recommendation_soiltestrec_id
  ON soil_test_recommendation
  USING btree
  (soiltestrec_id);
  
CLUSTER soil_test_recommendation USING idx_soil_test_recommendation_soiltestrec_id;

ALTER TABLE soil_test_recommendation
  ADD CONSTRAINT unq_soiltestrec_uuid UNIQUE (soiltestrec_uuid);


