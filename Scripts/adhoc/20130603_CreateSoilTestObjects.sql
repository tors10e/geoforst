-- Table: public.ordinal_magnitude_type

-- DROP TABLE public.ordinal_magnitude_type;

CREATE TABLE public.ordinal_magnitude_type
(
  ordinalmag_id integer NOT NULL,
  ordinalmag_cd character(3),
  ordinalmag_dsc character varying(15),
  CONSTRAINT pk_ordinal_magnitude_type PRIMARY KEY (ordinalmag_id),
  CONSTRAINT unq_ordinal_magnitude_type_cd UNIQUE (ordinalmag_cd),
  CONSTRAINT unq_ordinal_magnitude_type_dsc UNIQUE (ordinalmag_dsc)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.ordinal_magnitude_type
  OWNER TO postgres;
  GRANT ALL ON TABLE public.ordinal_magnitude_type TO postgres;
GRANT ALL ON TABLE public.ordinal_magnitude_type TO fsp_admin;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE public.ordinal_magnitude_type TO fsp_edit;


INSERT INTO ordinal_magnitude_type VALUES (1, 'low', 'Low');
INSERT INTO ordinal_magnitude_type VALUES (2, 'med', 'Medium');
INSERT INTO ordinal_magnitude_type VALUES (3, 'hi ', 'High');
INSERT INTO ordinal_magnitude_type VALUES (4, 'vhi', 'Very High');



-- Table: public.ordinal_sufficiency_type

-- DROP TABLE public.ordinal_sufficiency_type;

CREATE TABLE public.ordinal_sufficiency_type
(
  ordinalsuff_id integer NOT NULL,
  ordinalsuff_cd character(3),
  ordinalsuff_dsc character varying(15),
  CONSTRAINT pk_ordinal_suffiency_type PRIMARY KEY (ordinalsuff_id),
  CONSTRAINT unq_ordinal_suffiency_type_cd UNIQUE (ordinalsuff_cd),
  CONSTRAINT unq_ordinal_suffiency_type_dsc UNIQUE (ordinalsuff_dsc)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.ordinal_sufficiency_type
  OWNER TO postgres;
GRANT ALL ON TABLE public.ordinal_sufficiency_type TO postgres;
GRANT ALL ON TABLE public.ordinal_sufficiency_type TO fsp_admin;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE public.ordinal_sufficiency_type TO fsp_edit;

INSERT INTO ordinal_sufficiency_type VALUES (1, 'low', 'Low');
INSERT INTO ordinal_sufficiency_type VALUES (2, 'suf', 'Sufficient');
INSERT INTO ordinal_sufficiency_type VALUES (3, 'hi ', 'High');


-- Table: public.soil_test

-- DROP TABLE public.soil_test;

CREATE TABLE public.soil_test
(
  soiltest_id serial,
  sample_name character varying(30),
  sample_id integer,
  sample_collection_date date,
  sample_desc character varying(255),
  client_last_name character varying(30),
  client_first_name character varying(30),
  client_address_1 character varying(50),
  client_address_2 character varying(50),
  client_city character varying(30),
  client_state character(2),
  client_zip integer,
  lab_id integer,
  completed_date date,
  lab_name character varying(50),
  lab_address_1 character varying(50),
  lab_address_2 character varying(50),
  lab_city character varying(30),
  lab_state character(2),
  lab_zip integer,
  lab_phone character varying(15),
  lab_email character varying(50),
  extractant character varying(50),
  lime_buffer_capacity_method character varying(50),
  p_value numeric(6,2),
  p_unit character varying(20) DEFAULT 'lbs/Acre'::character varying,
  p_relative_amount character varying(15),
  k_value numeric(6,2),
  k_unit character varying(20) DEFAULT 'lbs/Acre'::character varying,
  k_relative_amount character varying(15),
  ca_value numeric(6,2),
  ca_unit character varying(20) DEFAULT 'lbs/Acre'::character varying,
  ca_relative_amount character varying(15),
  mg_value numeric(6,2),
  mg_unit character varying(20) DEFAULT 'lbs/Acre'::character varying,
  mg_relative_amount character varying(15),
  zn_value numeric(6,2),
  zn_unit character varying(20) DEFAULT 'lbs/Acre'::character varying,
  zn_relative_amount character varying(15),
  mn_value numeric(6,2),
  mn_unit character varying(20) DEFAULT 'lbs/Acre'::character varying,
  mn_relative_amount character varying(15),
  ph_value numeric(6,2),
  ph_relative_amount character varying(15),
  lbc_value numeric(6,2),
  geometry geometry(Point,26917),
  CONSTRAINT pk_soil_test PRIMARY KEY (soiltest_id),
  CONSTRAINT fk_soil_test_ca FOREIGN KEY (ca_relative_amount)
      REFERENCES public.ordinal_magnitude_type (ordinalmag_cd) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_soil_test_k FOREIGN KEY (k_relative_amount)
      REFERENCES public.ordinal_magnitude_type (ordinalmag_cd) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_soil_test_mg FOREIGN KEY (mg_relative_amount)
      REFERENCES public.ordinal_magnitude_type (ordinalmag_cd) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_soil_test_mn FOREIGN KEY (mn_relative_amount)
      REFERENCES public.ordinal_sufficiency_type (ordinalsuff_cd) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_soil_test_p FOREIGN KEY (p_relative_amount)
      REFERENCES public.ordinal_magnitude_type (ordinalmag_cd) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_soil_test_ph FOREIGN KEY (ph_relative_amount)
      REFERENCES public.ordinal_sufficiency_type (ordinalsuff_cd) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_soil_test_zn FOREIGN KEY (zn_relative_amount)
      REFERENCES public.ordinal_sufficiency_type (ordinalsuff_cd) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT unq_soil_test_sample_name UNIQUE (sample_name)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.soil_test
  OWNER TO postgres;
GRANT ALL ON TABLE public.soil_test TO postgres;
GRANT ALL ON TABLE public.soil_test TO fsp_admin;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE public.soil_test TO fsp_edit;

INSERT INTO soil_test VALUES (4, 'Ridge Opening Oct 2011', 1, NULL, 'Location is incorrect', 'Ernt', 'Christopher', '453 Ivy Hills Dr.', NULL, 'Cleveland', 'GA', NULL, 10524, '2011-10-17', 'Soil, plant, and water laboratory', NULL, NULL, 'Athens', 'GA', NULL, NULL, NULL, 'Mehlic 1', 'UGA Lime Buffer Capacity Method', 38.00, 'lbs/Acre', 'vhi', 354.00, 'lbs/Acre', 'hi', 1530.00, 'lbs/Acre', 'hi', 257.00, 'lbs/Acre', 'hi', 6.00, 'lbs/Acre', 'suf', 129.00, 'lbs/Acre', 'suf', 6.10, 'suf', 441.00, '0101000020256900005AE3242972510F41136F53177E1E4D41');



-- Table: public.soil_test_recommendation

-- DROP TABLE public.soil_test_recommendation;

CREATE TABLE public.soil_test_recommendation
(
  soiltestrec_id serial,
  soiltest_id integer,
  crop character varying(30),
  limestone_value numeric(6,2),
  limestone_unit character varying(20) DEFAULT 'tons/Acre'::character varying,
  n_value numeric(6,2),
  n_unit character varying(20) DEFAULT 'lbs/Acre'::character varying,
  phosphate_value numeric(6,2),
  phosphate_unit character varying(20) DEFAULT 'lbs/Acre'::character varying,
  potash_value numeric(6,2),
  potash_unit character varying(20) DEFAULT 'lbs/Acre'::character varying,
  s_value numeric(6,2),
  s_unit character varying(20) DEFAULT 'lbs/Acre'::character varying,
  b_value numeric(6,2),
  b_unit character varying(20) DEFAULT 'lbs/Acre'::character varying,
  mn_value numeric(6,2),
  mn_unit character varying(20) DEFAULT 'lbs/Acre'::character varying,
  zn_value numeric(6,2),
  zn_unit character varying(20) DEFAULT 'lbs/Acre'::character varying,
  ph_min numeric(6,2),
  ph_max numeric(6,2),
  CONSTRAINT pk_soil_test_recommendation PRIMARY KEY (soiltestrec_id),
  CONSTRAINT fk_soil_test_recommendation_soil_test FOREIGN KEY (soiltest_id)
      REFERENCES public.soil_test (soiltest_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT unk_soil_test_recommendation UNIQUE (soiltest_id, crop)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.soil_test_recommendation
  OWNER TO postgres;
GRANT ALL ON TABLE public.soil_test_recommendation TO postgres;
GRANT ALL ON TABLE public.soil_test_recommendation TO fsp_admin;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE public.soil_test_recommendation TO fsp_edit;
GRANT SELECT ON TABLE public.soil_test_recommendation TO fsp_read;
COMMENT ON TABLE public.soil_test_recommendation
  IS 'Recommendations from soil test.';

INSERT INTO soil_test_recommendation VALUES (1, 4, 'Cool Season Grass with Clover', 0.00, 'tons/Acre', 50.00, 'lbs/Acre', 30.00, 'lbs/Acre', 0.00, 'lbs/Acre', 0.00, 'lbs/Acre', 0.00, 'lbs/Acre', 0.00, 'lbs/Acre', 0.00, 'lbs/Acre', 6.00, 6.50);
INSERT INTO soil_test_recommendation VALUES (2, 4, 'Legumes and Grass', 30.00, 'tons/Acre', 30.00, 'lbs/Acre', 0.00, 'lbs/Acre', 0.00, 'lbs/Acre', 0.00, 'lbs/Acre', 0.00, 'lbs/Acre', 0.00, 'lbs/Acre', 0.00, 'lbs/Acre', 6.00, 6.00);
INSERT INTO soil_test_recommendation VALUES (3, 4, 'Millet, Proso, Sesame, buckwht', 60.00, 'lbs/Acre', 30.00, 'lbs/Acre', 0.00, 'lbs/Acre', 0.00, 'lbs/Acre', 0.00, 'lbs/Acre', 0.00, 'lbs/Acre', 0.00, 'lbs/Acre', 0.00, 'lbs/Acre', 6.00, 6.00);



-- Table: public.unit_type

-- DROP TABLE public.unit_type;

CREATE TABLE public.unit_type
(
  unit_id integer NOT NULL,
  unit_cd character(5),
  unit_dsc character varying(30),
  CONSTRAINT pk_unit_type PRIMARY KEY (unit_id),
  CONSTRAINT unq_unit_type_cd UNIQUE (unit_cd),
  CONSTRAINT unq_unit_type_dsc UNIQUE (unit_dsc)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.unit_type
  OWNER TO postgres;
GRANT ALL ON TABLE public.unit_type TO postgres;
GRANT ALL ON TABLE public.unit_type TO fsp_admin;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE public.unit_type TO fsp_edit;
GRANT SELECT ON TABLE public.unit_type TO fsp_read;

INSERT INTO unit_type VALUES (2, 'tonsa', 'tons/Acre');
INSERT INTO unit_type VALUES (1, 'lbsac', 'lbs/Acre');
