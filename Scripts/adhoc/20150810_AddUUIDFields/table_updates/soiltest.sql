
ALTER TABLE soil_test ADD COLUMN soiltest_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN soil_test.soiltest_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

-- Populate uuid of existing records.
update soil_test set soiltest_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE soil_test
  DROP CONSTRAINT pk_soil_test CASCADE;

ALTER TABLE soil_test
  ADD CONSTRAINT pk_soil_test PRIMARY KEY (soiltest_uuid);

-- Create a clustering key on the id field.
CREATE INDEX idx_soil_test_soiltest_id
  ON soil_test
  USING btree
  (soiltest_id);
  
CLUSTER soil_test USING idx_soil_test_soiltest_id;

ALTER TABLE soil_test
  ADD CONSTRAINT unq_soiltest_uuid UNIQUE (soiltest_uuid);


  -- Related Objects

ALTER TABLE soil_test_recommendation ADD COLUMN soiltest_uuid uuid;

update soil_test_recommendation t1
 set soiltest_uuid = t2.soiltest_uuid
 from soil_test t2
 where t2.soiltest_id = t1.soiltest_id;

--ALTER TABLE planned_activity DROP CONSTRAINT fk_land_area;
  
ALTER TABLE soil_test_recommendation
  ADD CONSTRAINT fk_soil_test FOREIGN KEY (soiltest_uuid) REFERENCES soil_test(soiltest_uuid);

ALTER TABLE soil_test_recommendation DROP COLUMN soiltest_id;