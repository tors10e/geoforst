--alter user staging set search_path="$user",public;
--alter database fsp set search_path="$user",public;


CREATE SCHEMA IF NOT EXISTS staging AUTHORIZATION staging;

GRANT ALL ON SCHEMA staging TO staging_loader;

CREATE TABLE staging.activity_area
(
  activityarea_id integer NOT NULL,
  geometry geometry(MultiPolygon,2163),
  acttype_id integer,
  description character varying(255),
  revenue money,
  plannedact_id integer,
  standact_id integer,
  created_by_id integer,
  activity_date date,
  CONSTRAINT pk_activity_area PRIMARY KEY (activityarea_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.activity_area
  OWNER TO staging;
GRANT ALL ON TABLE staging.activity_area TO postgres;
GRANT ALL ON TABLE staging.activity_area TO staging_loader;


CREATE TABLE staging.burn_compartment
(
  burncompartment_id int NOT NULL,
  compartment_set integer,
  geometry geometry(Polygon,2163),
  created_by_id integer,
  CONSTRAINT pk_burn_compartment PRIMARY KEY (burncompartment_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.burn_compartment
  OWNER TO staging;
GRANT ALL ON TABLE staging.burn_compartment TO postgres;
GRANT ALL ON TABLE staging.burn_compartment TO fsp_admin;
GRANT ALL ON TABLE staging.burn_compartment TO staging_loader;

COMMENT ON TABLE burn_compartment
  IS 'Burn compartments areas and their associated compartment sets. Used to track burn rotations.';

 CREATE TABLE staging.control_point
(
  controlpt_id int NOT NULL,
  geometry geometry(Point,2163),
  description character varying,
  x double precision,
  y double precision,
  status character varying,
  created_by_id integer,
  CONSTRAINT control_point_pk PRIMARY KEY (controlpt_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.control_point
  OWNER TO staging;
GRANT ALL ON TABLE staging.control_point TO postgres;
GRANT ALL ON TABLE staging.control_point TO fsp_admin;
GRANT ALL ON TABLE  staging.control_point TO staging_loader;


CREATE TABLE staging.cultural_point
(
  cultpt_id int NOT NULL,
  geometry geometry(Point,2163),
  culttype_id integer,
  description character varying,
  created_by_id integer,
  CONSTRAINT cultural_point_pk PRIMARY KEY (cultpt_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.cultural_point
  OWNER TO staging;
GRANT ALL ON TABLE staging.cultural_point TO postgres;
GRANT ALL ON TABLE staging.cultural_point TO fsp_admin;
GRANT ALL ON TABLE  staging.cultural_point TO staging_loader;



CREATE TABLE staging.forest_inventory_data
(
  forestinventorydata_id int NOT NULL,
  forestinventoryplot_id integer,
  tree_id integer,
  collection_date date,
  speciestreetype_id integer NOT NULL,
  dbh numeric(4,1),
  dbh_unit_id integer,
  height integer,
  height_unit_id integer,
  age integer,
  created_by_id integer NOT NULL,
  constraint forestinventorydata_pk primary key(forestinventorydata_id)
);
ALTER TABLE staging.forest_inventory_data
  OWNER TO staging;

GRANT ALL ON TABLE staging.forest_inventory_data TO postgres;
GRANT ALL ON TABLE staging.forest_inventory_data TO fsp_admin;
GRANT ALL ON TABLE  staging.forest_inventory_data TO staging_loader;

CREATE TABLE staging.firebreak_line
(
  fbkln_id int NOT NULL,
  geometry geometry(LineString,2163),
  description character varying,
  length_meters double precision,
  created_by_id integer,
  CONSTRAINT firebreak_line_pk PRIMARY KEY (fbkln_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.firebreak_line
  OWNER TO staging;
GRANT ALL ON TABLE staging.firebreak_line TO postgres;
GRANT ALL ON TABLE staging.firebreak_line TO staging_loader;
GRANT ALL ON TABLE staging.firebreak_line TO fsp_admin;


CREATE TABLE staging.forest_inventory_plot
(
  forestinventoryplot_id int NOT NULL,
  plot_number integer NOT NULL,
  plot_geometry_id integer NOT NULL,
  plot_area numeric(5,1),
  plot_area_unit_id integer,
  plot_radius integer,
  plot_radius_unit_id integer,
  plot_xlength integer,
  plot_ylength integer,
  plot_length_unit_id integer,
  geometry geometry(Point,2163),
  longitude numeric(9,6) NOT NULL,
  latitude numeric(9,6) NOT NULL,
  elevation integer,
  elevation_unit_id integer,
  position_description character varying(255),
  plot_create_date date,
  created_by_id integer NOT NULL,
  constraint forestinventoryplot_pk primary key(forestinventoryplot_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.forest_inventory_plot
  OWNER TO staging;
GRANT ALL ON TABLE staging.forest_inventory_plot TO postgres;
GRANT SELECT ON TABLE staging.forest_inventory_plot TO fsp_admin;
GRANT ALL ON TABLE  staging.forest_inventory_plot TO staging_loader;




CREATE TABLE staging.habitat_enhancement_area
(
  habenharea_id int NOT NULL,
  geometry geometry(Polygon,2163),
  habenhtype_id integer,
  description character varying,
  created_by_id integer,
  constraint habenarea_pk primary key(habenharea_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.habitat_enhancement_area
  OWNER TO staging;
GRANT ALL ON TABLE staging.habitat_enhancement_area TO postgres;
GRANT SELECT ON TABLE staging.habitat_enhancement_area TO fsp_admin;
GRANT ALL ON TABLE  staging.habitat_enhancement_area TO staging_loader;


CREATE TABLE staging.habitat_enhancement_point
(
  habenhpt_id int NOT NULL,
  geometry geometry(Point,2163),
  habenhtype_id integer,
  description character varying,
  created_by_id integer,
    CONSTRAINT habitat_enh_pt_pk PRIMARY KEY (habenhpt_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.habitat_enhancement_point
  OWNER TO staging;
GRANT ALL ON TABLE staging.habitat_enhancement_point TO postgres;
GRANT SELECT ON TABLE staging.habitat_enhancement_point TO fsp_admin;
GRANT ALL ON TABLE  staging.habitat_enhancement_point TO staging_loader;


CREATE TABLE staging.hazard
(
  hazard_id int NOT NULL,
  geometry geometry(Point,2163),
  hazardtype_id integer,
  description character varying,
  created_by_id integer,
  create_date date,
  CONSTRAINT hazard_pk PRIMARY KEY (hazard_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.hazard
  OWNER TO staging;
GRANT ALL ON TABLE staging.hazard TO postgres;
GRANT SELECT ON TABLE staging.hazard TO fsp_admin;
GRANT ALL ON TABLE  staging.hazard TO staging_loader;


-- Table: land_area

-- DROP TABLE land_area;

CREATE TABLE staging.land_area
(
  landarea_id int NOT NULL,
  geometry geometry(Polygon,2163),
  description character varying(255),
  start_date date DEFAULT ('now'::text)::date,
  transaction_start_date date DEFAULT ('now'::text)::date,
  created_by_id integer,
  name character varying(30),
  CONSTRAINT land_area_pk PRIMARY KEY (landarea_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.land_area
  OWNER TO staging;
GRANT ALL ON TABLE staging.land_area TO postgres;
GRANT SELECT ON TABLE staging.land_area TO fsp_admin;
GRANT ALL ON TABLE  staging.land_area TO staging_loader;

-- Table: recreation_point

-- DROP TABLE recreation_point;

CREATE TABLE staging.recreation_point
(
  recpt_id int NOT NULL,
  geometry geometry(Point,2163),
  rectype_id integer,
  description character varying(255),
  created_by_id integer,
  CONSTRAINT recreation_point_pk PRIMARY KEY (recpt_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.recreation_point
  OWNER TO staging;
GRANT ALL ON TABLE staging.recreation_point TO postgres;
GRANT ALL ON TABLE staging.recreation_point TO fsp_admin;
GRANT ALL ON TABLE  staging.recreation_point TO staging_loader;




CREATE TABLE staging.road_line
(
  roadln_id int NOT NULL,
  geometry geometry(MultiLineString,2163),
  roadtype_id integer,
  description character varying(255),
  road_name character varying(25),
  accessstatus_id integer,
  roadsurface_id integer,
  created_by_id integer,
  CONSTRAINT road_line_pk PRIMARY KEY (roadln_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.road_line
  OWNER TO staging;
GRANT ALL ON TABLE staging.road_line TO postgres;
GRANT ALL ON TABLE staging.road_line TO fsp_admin;
GRANT ALL ON TABLE  staging.road_line TO staging_loader;



CREATE TABLE staging.soil_test
(
  soiltest_id int NOT NULL,
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
  geometry geometry(Point,2163),
  created_by_id integer,
  CONSTRAINT pk_soil_test PRIMARY KEY (soiltest_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.soil_test
  OWNER TO staging;
GRANT ALL ON TABLE staging.soil_test TO postgres;
GRANT ALL ON TABLE staging.soil_test TO fsp_admin;
GRANT ALL ON TABLE  staging.soil_test TO staging_loader;


-- Table: soil_test_recommendation

-- DROP TABLE soil_test_recommendation;

CREATE TABLE staging.soil_test_recommendation
(
  soiltestrec_id int NOT NULL,
  soiltest_id integer,
  crop character varying(50),
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
  created_by_id integer,
  CONSTRAINT pk_soil_test_recommendation PRIMARY KEY (soiltestrec_id)
  )
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.soil_test_recommendation
  OWNER TO staging;
GRANT ALL ON TABLE staging.soil_test_recommendation TO postgres;
GRANT ALL ON TABLE staging.soil_test_recommendation TO fsp_admin;
GRANT ALL ON TABLE  staging.soil_test_recommendation TO staging_loader;



CREATE TABLE staging.stand_status
(
  standstatus_id int NOT NULL,
  year numeric(4,0),
  recommended_treatment character varying(255),
  notes character varying(255),
  damage_severity integer,
  stand_id integer,
  created_by_id integer,
  CONSTRAINT pk_stand_status PRIMARY KEY (standstatus_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.stand_status
  OWNER TO staging;
GRANT ALL ON TABLE staging.stand_status TO postgres;
GRANT ALL ON TABLE staging.stand_status TO fsp_admin;
GRANT ALL ON TABLE  staging.stand_status TO staging_loader;

COMMENT ON TABLE staging.stand_status
  IS 'Stand Status contains general status of the stand  at a specific date. Therefore a stand may have multiple stand statuses for different periods of time.';



CREATE TABLE staging.stand_area
(
  standarea_id int NOT NULL,
  geometry geometry(Polygon,2163),
  stand_no integer,
  description character varying(255),
  start_date timestamp without time zone DEFAULT now(),
  foresttype_id integer,
  transaction_start_date timestamp with time zone DEFAULT now(),
  standdescription_id integer,
  created_by_id integer
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.stand_area
  OWNER TO staging;
GRANT ALL ON TABLE staging.stand_area TO postgres;
GRANT ALL ON TABLE staging.stand_area TO fsp_admin;
GRANT ALL ON TABLE  staging.stand_area TO staging_loader;

COMMENT ON TABLE staging.stand_area
  IS 'Stand area primarily contains the spatial representation of the stand. Since multiple stands areas can represent one stand, the Stand table contains the information that would be duplicated if that were not the case.';



-- Table: stream

-- DROP TABLE stream;

CREATE TABLE staging.stream
(
  stream_id int NOT NULL,
  geometry geometry(LineString,2163),
  shape_leng character varying(25),
  stream_type character varying(25),
  stream_name character varying(25),
  created_by_id integer,
  CONSTRAINT stream_pk PRIMARY KEY (stream_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.stream
  OWNER TO staging;
GRANT ALL ON TABLE staging.stream TO postgres;
GRANT ALL ON TABLE staging.stream TO fsp_admin;
GRANT ALL ON TABLE  staging.stream TO staging_loader;




-- Table: streamside_management_zone

-- DROP TABLE streamside_management_zone;

CREATE TABLE staging.streamside_management_zone
(
  smz_id int NOT NULL,
  geometry geometry(MultiPolygon,2163),
  id integer,
  shape_leng double precision,
  et_id character varying(255),
  shape_area double precision,
  created_by_id integer,
  CONSTRAINT streamside_mgt_zone_pk PRIMARY KEY (smz_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.streamside_management_zone OWNER TO staging;
GRANT ALL ON TABLE staging.streamside_management_zone TO postgres;
GRANT ALL ON TABLE staging.streamside_management_zone TO fsp_admin;
GRANT ALL ON TABLE  staging.streamside_management_zone TO staging_loader;


-- Table: trail

-- DROP TABLE trail;

CREATE TABLE staging.trail
(
  trail_id int NOT NULL,
  trail_name character varying NOT NULL,
  trailtype_id integer NOT NULL,
  trailstatus_id integer NOT NULL,
  geometry geometry(LineString,2163),
  description character varying(255),
  created_by_id integer,
  CONSTRAINT trail_pkey PRIMARY KEY (trail_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.trail
  OWNER TO staging;
GRANT ALL ON TABLE staging.trail TO postgres;
GRANT ALL ON TABLE staging.trail TO fsp_admin;
GRANT ALL ON TABLE  staging.trail TO staging_loader;



-- Table: tree

-- DROP TABLE tree;

CREATE TABLE staging.tree
(
  tree_id int NOT NULL,
  geometry geometry(Point,2163),
  start_year character(4),
  speciestreetype_id integer,
  created_by_id integer,
  CONSTRAINT tree_pk PRIMARY KEY (tree_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.tree
  OWNER TO staging;
GRANT ALL ON TABLE staging.tree TO postgres;
GRANT ALL ON TABLE staging.tree TO fsp_admin;
GRANT ALL ON TABLE  staging.tree TO staging_loader;


-- Table: water_point

-- DROP TABLE water_point;

CREATE TABLE staging.water_point
(
  waterpoint_id int NOT NULL,
  geometry geometry(Point,2163),
  watertype_id integer,
  description character varying(255),
  created_by_id integer,
  watertype_cd character varying(3),
  CONSTRAINT water_point_pk PRIMARY KEY (waterpoint_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.water_point
  OWNER TO staging;
GRANT ALL ON TABLE staging.water_point TO postgres;
GRANT ALL ON TABLE staging.water_point TO fsp_admin;
GRANT ALL ON TABLE  staging.water_point TO staging_loader;


-- Table: planned_activity

-- DROP TABLE planned_activity;

CREATE TABLE staging.planned_activity
(
  plannedact_id int NOT NULL,
  acttype_id integer,
  planned_date numeric(4,0),
  completed_date character(25),
  description character varying(255),
  notes character varying(255),
  revenue double precision,
  taskstatus_id integer DEFAULT 0,
  stand_no integer,
  created_by_id integer,
  landarea_id integer,
  CONSTRAINT stand_activity_pkey PRIMARY KEY (plannedact_id)
  )
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.planned_activity
  OWNER TO staging;
GRANT ALL ON TABLE staging.planned_activity TO postgres;
GRANT ALL ON TABLE staging.planned_activity TO fsp_admin;
GRANT ALL ON TABLE  staging.planned_activity TO staging_loader;


-- Table: stand_description

-- DROP TABLE stand_description;

CREATE TABLE staging.stand_description
(
  standdescription_id int NOT NULL,
  stockingtype_id integer,
  forestagetype_id integer,
  stand_description character varying(255),
  foresttype_id integer,
  created_by_id integer,
  CONSTRAINT pk_stand PRIMARY KEY (standdescription_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.stand_description
  OWNER TO staging;
GRANT ALL ON TABLE staging.stand_description TO postgres;
GRANT ALL ON TABLE staging.stand_description TO fsp_admin;
GRANT ALL ON TABLE  staging.stand_description TO staging_loader;

COMMENT ON TABLE stand_description
  IS 'Stand level data storage for persisting data common among stand areas, based on the stand number. Stands are made unique by the Stand Number and Land Area. ';

-- Table: tree_status

-- DROP TABLE tree_status;

CREATE TABLE staging.tree_status
(
  treestatus_id int NOT NULL,
  tree_id integer NOT NULL,
  status_date date,
  dbh_in numeric(4,2),
  height_ft numeric(4,2),
  status_notes character varying(255),
  age integer,
  created_by_id integer,
  CONSTRAINT pk_tree_status PRIMARY KEY (treestatus_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging.tree_status
  OWNER TO staging;
GRANT ALL ON TABLE staging.tree_status TO postgres;
GRANT ALL ON TABLE staging.tree_status TO fsp_admin;
GRANT ALL ON TABLE  staging.tree_status TO staging_loader;


