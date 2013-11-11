--DROP TABLE activity_area;

CREATE TABLE activity_area (
    activityarea_id integer PRIMARY KEY,
    activity_date character varying(25),
    acttype_id integer,
    description character varying(255),
    revenue money,
    plannedact_id integer,
    standact_id integer,
    FOREIGN KEY (standact_id) REFERENCES planned_activity(plannedact_id),
    FOREIGN KEY (acttype_id) REFERENCES activity_type(acttype_id)
);

SELECT AddGeometryColumn('activity_area', 'geometry', 2163, 'MULTIPOLYGON', 'XY', 0);

--DROP TABLE activity_type;

CREATE TABLE activity_type (
    acttype_id integer PRIMARY KEY,
    acttype_dsc character varying(50),
    acttype_cd character(3)
);

--DROP TABLE burn_compartment;

CREATE TABLE burn_compartment (
    burncompartment_id integer PRIMARY KEY,
    compartment_set integer
);

SELECT AddGeometryColumn('burn_compartment', 'geometry', 2163, 'POLYGON', 'XY', 0);


--DROP TABLE cultural_point;

CREATE TABLE cultural_point (
    cultpt_id integer PRIMARY KEY AUTOINCREMENT,
    culttype_id integer,
    description character varying,
     FOREIGN KEY (culttype_id) REFERENCES cultural_type(culttype_id)
);

SELECT AddGeometryColumn('cultural_point', 'geometry', 2163, 'POINT', 'XY', 0);

--DROP TABLE cultural_type;

CREATE TABLE cultural_type (
    culttype_id integer PRIMARY KEY,
    culttype_cd character(3),
    culttype_dsc character varying(50)
);


--DROP TABLE firebreak_line;

CREATE TABLE firebreak_line (
    fbkln_id integer PRIMARY KEY AUTOINCREMENT,
    description character varying,
    length_meters double precision
);

SELECT AddGeometryColumn('firebreak_line', 'geometry', 2163, 'LINE', 'XY', 0);

--DROP TABLE forest_age_type;

CREATE TABLE forest_age_type (
    forestagetype_id integer PRIMARY KEY,
    forestagetype_cd character varying(3),
    forestagetype_dsc character varying(30)
);

--DROP TABLE forest_type;

CREATE TABLE forest_type (
    foresttype_id integer PRIMARY KEY,
    foresttype_dsc character varying(50),
    foresttype_cd character(4)
);

--DROP TABLE habitat_enhancement_area;

CREATE TABLE habitat_enhancement_area (
    habenharea_id integer PRIMARY KEY AUTOINCREMENT,
    habenhtype_id integer,
    description character varying,
    FOREIGN KEY (habenhtype_id) REFERENCES habitat_enhancement_type(habenhtype_id)
);

SELECT AddGeometryColumn('habitat_enhancement_area', 'geometry', 2163, 'POLYGON', 'XY', 0);

--DROP TABLE habitat_enhancement_point;

CREATE TABLE habitat_enhancement_point (
    habenhpt_id integer PRIMARY KEY AUTOINCREMENT,
    geometry POINT,
    habenhtype_id integer,
    description character varying,
    FOREIGN KEY (habenhtype_id) REFERENCES habitat_enhancement_type(habenhtype_id)
);

SELECT AddGeometryColumn('habitat_enhancement_point', 'geometry', 2163, 'POLYGON', 'XY', 0);

--DROP TABLE habitat_enhancement_type;

CREATE TABLE habitat_enhancement_type (
    habenhtype_id integer PRIMARY KEY,
    habenhtype_dsc character varying(50),
    habenhtype_cd character(3)
);

--DROP TABLE harvest_type;

CREATE TABLE harvest_type (
    harvesttype_id integer PRIMARY KEY,
    harvesttype_dsc character varying(50),
    harvesttype_cd character(3)
);

--DROP TABLE land_area;

CREATE TABLE land_area (
    landarea_id integer PRIMARY KEY AUTOINCREMENT,
    description character varying(255)
);

SELECT AddGeometryColumn('land_area', 'geometry', 2163, 'POLYGON', 'XY', 0);

--DROP TABLE ordinal_magnitude_type;

CREATE TABLE ordinal_magnitude_type (
    ordinalmag_id integer PRIMARY KEY,
    ordinalmag_cd character(3),
    ordinalmag_dsc character varying(15)
);

--DROP TABLE ordinal_sufficiency_type;

CREATE TABLE ordinal_sufficiency_type (
    ordinalsuff_id integer PRIMARY KEY,
    ordinalsuff_cd character(3),
    ordinalsuff_dsc character varying(15)
);

--DROP TABLE planned_activity;

CREATE TABLE planned_activity (
    plannedact_id integer PRIMARY KEY AUTOINCREMENT,
    acttype_id integer,
    planned_date numeric(4,0),
    completed_date character(25),
    description character varying(255),
    notes character varying(255),
    revenue double precision,
    taskstatus_id integer DEFAULT 0,
    stand_no integer,
    FOREIGN KEY (taskstatus_id) REFERENCES task_status_type(taskstatus_id),
    FOREIGN KEY (acttype_id) REFERENCES activity_type(acttype_id)
);

--DROP TABLE recreation_point;

CREATE TABLE recreation_point (
    recpt_id integer PRIMARY KEY AUTOINCREMENT,
    rectype_id integer,
    description character varying(255),
    FOREIGN KEY (rectype_id) REFERENCES recreation_type(rectype_id)
);

SELECT AddGeometryColumn('recreation_point', 'geometry', 2163, 'POINT', 'XY', 0);

--DROP TABLE recreation_type;

CREATE TABLE recreation_type (
    rectype_id integer PRIMARY KEY,
    rectype_dsc character varying(50),
    rectype_cd character(3)
);

--DROP TABLE road_access_status_type;

CREATE TABLE road_access_status_type (
    accessstatus_id integer PRIMARY KEY,
    accessstatus_cd character varying(3),
    accessstatus_dsc character varying(30)
);

--DROP TABLE road_line;

CREATE TABLE road_line (
    roadln_id integer PRIMARY KEY AUTOINCREMENT,
    roadtype_id integer,
    description character varying(255),
    road_name character varying(25),
    accessstatus_id integer,
    roadsurface_id integer,
    FOREIGN KEY (roadtype_id) REFERENCES road_type(roadtype_id),
    FOREIGN KEY (roadsurface_id) REFERENCES road_surface_type(roadsurface_id),
    FOREIGN KEY (accessstatus_id) REFERENCES road_access_status_type(accessstatus_id)
);

SELECT AddGeometryColumn('road_line', 'geometry', 2163, 'MULTILINE', 'XY', 0);

--DROP TABLE road_surface_type;

CREATE TABLE road_surface_type (
    roadsurface_id integer PRIMARY KEY,
    roadsurface_cd character varying(3),
    roadsurface_dsc character varying(30)
);

--DROP TABLE road_type;

CREATE TABLE road_type (
    roadtype_id integer PRIMARY KEY,
    roadtype_dsc character varying(50),
    roadtype_cd character(3)
);

--DROP TABLE severity_type;

CREATE TABLE severity_type (
    severity_id integer PRIMARY KEY,
    severity_cd character varying(3),
    severity_dsc character varying(30)
);

--DROP TABLE soil_test;

CREATE TABLE soil_test (
    soiltest_id integer PRIMARY KEY AUTOINCREMENT,
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
    p_unit character varying(20) DEFAULT 'lbs/Acre',
    p_relative_amount character varying(15),
    k_value numeric(6,2),
    k_unit character varying(20) DEFAULT 'lbs/Acre',
    k_relative_amount character varying(15),
    ca_value numeric(6,2),
    ca_unit character varying(20) DEFAULT 'lbs/Acre',
    ca_relative_amount character varying(15),
    mg_value numeric(6,2),
    mg_unit character varying(20) DEFAULT 'lbs/Acre',
    mg_relative_amount character varying(15),
    zn_value numeric(6,2),
    zn_unit character varying(20) DEFAULT 'lbs/Acre',
    zn_relative_amount character varying(15),
    mn_value numeric(6,2),
    mn_unit character varying(20) DEFAULT 'lbs/Acre',
    mn_relative_amount character varying(15),
    ph_value numeric(6,2),
    ph_relative_amount character varying(15),
    lbc_value numeric(6,2),
    FOREIGN KEY (zn_relative_amount) REFERENCES ordinal_sufficiency_type(ordinalsuff_cd),
    FOREIGN KEY (ph_relative_amount) REFERENCES ordinal_sufficiency_type(ordinalsuff_cd),
    FOREIGN KEY (p_relative_amount) REFERENCES ordinal_magnitude_type(ordinalmag_cd),
    FOREIGN KEY (mn_relative_amount) REFERENCES ordinal_sufficiency_type(ordinalsuff_cd),
    FOREIGN KEY (mg_relative_amount) REFERENCES ordinal_magnitude_type(ordinalmag_cd),
    FOREIGN KEY (k_relative_amount) REFERENCES ordinal_magnitude_type(ordinalmag_cd),
    FOREIGN KEY (ca_relative_amount) REFERENCES ordinal_magnitude_type(ordinalmag_cd)
);

SELECT AddGeometryColumn('soil_est', 'geometry', 2163, 'POINT', 'XY', 0);

--DROP TABLE soil_test_recommendation;

CREATE TABLE soil_test_recommendation (
    soiltestrec_id integer PRIMARY KEY AUTOINCREMENT,
    soiltest_id integer,
    crop character varying(50),
    limestone_value numeric(6,2),
    limestone_unit character varying(20) DEFAULT 'tons/Acre',
    n_value numeric(6,2),
    n_unit character varying(20) DEFAULT 'lbs/Acre',
    phosphate_value numeric(6,2),
    phosphate_unit character varying(20) DEFAULT 'lbs/Acre',
    potash_value numeric(6,2),
    potash_unit character varying(20) DEFAULT 'lbs/Acre',
    s_value numeric(6,2),
    s_unit character varying(20) DEFAULT 'lbs/Acre',
    b_value numeric(6,2),
    b_unit character varying(20) DEFAULT 'lbs/Acre',
    mn_value numeric(6,2),
    mn_unit character varying(20) DEFAULT 'lbs/Acre',
    zn_value numeric(6,2),
    zn_unit character varying(20) DEFAULT 'lbs/Acre',
    ph_min numeric(6,2),
    ph_max numeric(6,2),
    FOREIGN KEY (soiltest_id) REFERENCES soil_test(soiltest_id)
);

--DROP TABLE stand_area;

CREATE TABLE stand_area (
    standarea_id integer PRIMARY KEY AUTOINCREMENT,
    stand_no integer,
    description character varying(255),
    start_date timestamp,
    foresttype_id integer,
    transaction_start_date,
    standdescription_id integer,
    FOREIGN KEY (standdescription_id) REFERENCES stand_description(standdescription_id),
    FOREIGN KEY (foresttype_id) REFERENCES forest_type(foresttype_id)
);

SELECT AddGeometryColumn('stand_area', 'geometry', 2163, 'POLYGON', 'XY', 0);

--DROP TABLE stand_description;

CREATE TABLE stand_description (
    standdescription_id integer PRIMARY KEY AUTOINCREMENT,
    stockingtype_id integer,
    forestagetype_id integer,
    stand_description character varying(255),
    foresttype_id integer,
    FOREIGN KEY (stockingtype_id) REFERENCES stocking_type(stockingtype_id),
    FOREIGN KEY (foresttype_id) REFERENCES forest_type(foresttype_id),
    FOREIGN KEY (forestagetype_id) REFERENCES forest_age_type(forestagetype_id)
);

--DROP TABLE stand_status;

CREATE TABLE stand_status (
    standstatus_id integer PRIMARY KEY AUTOINCREMENT,
    year numeric(4,0),
    recommended_treatment character varying(255),
    notes character varying(255),
    damage_severity integer,
    stand_id integer,
    FOREIGN KEY (damage_severity) REFERENCES severity_type(severity_id)
);

--DROP TABLE stand_type;

CREATE TABLE stand_type (
    standtype_id integer PRIMARY KEY,
    standtype_cd character(3),
    standtype_dsc character varying(50)
);

--DROP TABLE stocking_type;

CREATE TABLE stocking_type (
    stockingtype_id integer PRIMARY KEY,
    stockingtype_cd character(3),
    stockingtype_dsc character varying(50)
);

--DROP TABLE stream;

CREATE TABLE stream (
    stream_id integer PRIMARY KEY AUTOINCREMENT,
    shape_leng character varying(25),
    stream_type character varying(25),
    stream_name character varying(25)
);

SELECT AddGeometryColumn('stream', 'geometry', 2163, 'LINESTRING', 'XY', 0);

--DROP TABLE streamside_management_zone;

CREATE TABLE streamside_management_zone (
    smz_id integer PRIMARY KEY AUTOINCREMENT,
    id integer,
    shape_leng double precision,
    et_id character varying(255),
    shape_area double precision
);

SELECT AddGeometryColumn('streamside_management_zone', 'geometry', 2163, 'MULTIPOLYGON', 'XY', 0);

--DROP TABLE task_status_type;

CREATE TABLE task_status_type (
    taskstatus_id integer PRIMARY KEY,
    status_code character varying(3),
    status_dsc character varying(30)
);

--DROP TABLE trail;

CREATE TABLE [trail] ([trail_id] integer PRIMARY KEY AUTOINCREMENT, 
	[trail_name] character varying NOT NULL, 
	[trailtype_id] integer NOT NULL, 
	[trailstatus_id] integer NOT NULL, 
	[trail_description] VARCHAR (255)),
	FOREIGN KEY (trailtype_id) REFERENCES trail_type(trailtype_id),
	FOREIGN KEY (trailstatus_id) REFERENCES trail_status(trailstatus_id),

SELECT AddGeometryColumn('trail', 'geometry', 2163, 'LINESTRING', 'XY', 0);

--DROP TABLE trail_status_type;

CREATE TABLE trail_status_type (
    trailstatus_id integer PRIMARY KEY,
    trailstatus_cd character(4) NOT NULL,
    trailstatus_dsc character varying(30) NOT NULL
);

--DROP TABLE trail_type;

CREATE TABLE trail_type (
    trailtype_id integer PRIMARY KEY,
    trailtype_cd character(3) NOT NULL,
    trailtype_dsc character varying(30) NOT NULL
);

--DROP TABLE tree;

CREATE TABLE tree (
    tree_id integer PRIMARY KEY AUTOINCREMENT,
    species character varying(50),
    start_year character(4)
);

SELECT AddGeometryColumn('tree', 'geometry', 2163, 'POINT', 'XY', 0);

--DROP TABLE tree_status;

CREATE TABLE tree_status (
    treestatus_id integer PRIMARY KEY AUTOINCREMENT,
    tree_id integer NOT NULL,
    status_date date,
    dbh_in numeric(4,2),
    height_ft numeric(4,2),
    status_notes character varying(255),
    age integer,
    FOREIGN KEY (tree_id) REFERENCES tree(tree_id)
);

--DROP TABLE unit_type;

CREATE TABLE unit_type (
    unit_id integer PRIMARY KEY,
    unit_cd character(5),
    unit_dsc character varying(30)
);

--DROP TABLE water_point;

CREATE TABLE water_point (
    waterpoint_id integer PRIMARY KEY AUTOINCREMENT,
    watertype_id integer,
    description character varying(255),
    FOREIGN KEY (watertype_id) REFERENCES water_type(watertype_id)
);

SELECT AddGeometryColumn('water_point', 'geometry', 2163, 'POINT', 'XY', 0);

--DROP TABLE water_type;

CREATE TABLE water_type (
    watertype_id integer NOT NULL,
    watertype_cd character varying(3),
    watertype_dsc character varying(50)
);

CREATE INDEX fki_hab_enh_area_hab_enh_type ON habitat_enhancement_area USING btree (habenhtype_id);

CREATE INDEX fki_hab_enh_pt_hab_enh_type ON habitat_enhancement_point USING btree (habenhtype_id);

CREATE INDEX fki_harvest_area_harvest_type ON activity_area USING btree (acttype_id);

CREATE INDEX fki_recreation_point_recreation_type ON recreation_point USING btree (rectype_id);

CREATE INDEX fki_road_line_road_type ON road_line USING btree (roadtype_id);

CREATE INDEX fki_stand_area_forest_type ON stand_area USING btree (foresttype_id);

CREATE INDEX idx_activity_type_acttype_id ON activity_type USING btree (acttype_id);

CREATE INDEX idx_burn_compartment_compartment_set ON burn_compartment USING btree (compartment_set);

CREATE INDEX idx_control_point_controlpt_id ON control_point USING btree (controlpt_id);


--
-- TOC entry 3473 (class 1259 OID 19038)
-- Name: idx_cultural_point_cultpt_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cultural_point_cultpt_id ON cultural_point USING btree (cultpt_id);


--
-- TOC entry 3567 (class 1259 OID 60393)
-- Name: idx_cultural_type_culttype_cd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cultural_type_culttype_cd ON cultural_type USING btree (culttype_cd);


--
-- TOC entry 3568 (class 1259 OID 19039)
-- Name: idx_cultural_type_culttype_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cultural_type_culttype_id ON cultural_type USING btree (culttype_id);


--
-- TOC entry 3477 (class 1259 OID 19012)
-- Name: idx_firebreak_line_fbkln_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_firebreak_line_fbkln_id ON firebreak_line USING btree (fbkln_id);


--
-- TOC entry 3641 (class 1259 OID 60399)
-- Name: idx_forest_age_type_forestagetype_cd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_forest_age_type_forestagetype_cd ON forest_age_type USING btree (forestagetype_cd);


--
-- TOC entry 3642 (class 1259 OID 60398)
-- Name: idx_forest_age_type_forestagetype_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_forest_age_type_forestagetype_id ON forest_age_type USING btree (forestagetype_id);


--
-- TOC entry 3591 (class 1259 OID 60404)
-- Name: idx_forest_type_foresttype_cd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_forest_type_foresttype_cd ON forest_type USING btree (foresttype_cd);


--
-- TOC entry 3592 (class 1259 OID 19060)
-- Name: idx_forest_type_foresttype_dsc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_forest_type_foresttype_dsc ON forest_type USING btree (foresttype_dsc);


--
-- TOC entry 3493 (class 1259 OID 60409)
-- Name: idx_habitat_enhancement_type_habenhtype_cd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_habitat_enhancement_type_habenhtype_cd ON habitat_enhancement_type USING btree (habenhtype_cd);


--
-- TOC entry 3494 (class 1259 OID 19040)
-- Name: idx_habitat_enhancement_type_habenhtype_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_habitat_enhancement_type_habenhtype_id ON habitat_enhancement_type USING btree (habenhtype_id);


--
-- TOC entry 3505 (class 1259 OID 60414)
-- Name: idx_harvest_type_harvesttype_cd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_harvest_type_harvesttype_cd ON harvest_type USING btree (harvesttype_cd);


--
-- TOC entry 3506 (class 1259 OID 19041)
-- Name: idx_harvest_type_harvesttype_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_harvest_type_harvesttype_id ON harvest_type USING btree (harvesttype_id);


--
-- TOC entry 3611 (class 1259 OID 27410)
-- Name: idx_land_area_hist_landarea_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_land_area_hist_landarea_id ON land_area_history USING btree (landareahist_id);


--
-- TOC entry 3507 (class 1259 OID 19016)
-- Name: idx_land_area_landarea_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_land_area_landarea_id ON land_area USING btree (landarea_id);


--
-- TOC entry 3606 (class 1259 OID 60416)
-- Name: idx_land_owner_landarea_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_land_owner_landarea_id ON land_owner USING btree (landarea_id);


--
-- TOC entry 3607 (class 1259 OID 60417)
-- Name: idx_land_owner_landowner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_land_owner_landowner_id ON land_owner USING btree (landowner_id);


--
-- TOC entry 3608 (class 1259 OID 60415)
-- Name: idx_land_owner_person_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_land_owner_person_id ON land_owner USING btree (person_id);


--
-- TOC entry 3599 (class 1259 OID 60419)
-- Name: idx_person_name_first; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_person_name_first ON person USING btree (name_first);


--
-- TOC entry 3600 (class 1259 OID 60420)
-- Name: idx_person_name_last; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_person_name_last ON person USING btree (name_last);


--
-- TOC entry 3601 (class 1259 OID 60418)
-- Name: idx_person_person_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_person_person_id ON person USING btree (person_id);


--
-- TOC entry 3574 (class 1259 OID 19044)
-- Name: idx_planned_activity_acttype_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_planned_activity_acttype_id ON planned_activity USING btree (acttype_id);


--
-- TOC entry 3575 (class 1259 OID 19045)
-- Name: idx_planned_activity_planned_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_planned_activity_planned_date ON planned_activity USING btree (planned_date);


--
-- TOC entry 3576 (class 1259 OID 19042)
-- Name: idx_planned_activity_plannedact_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_planned_activity_plannedact_id ON planned_activity USING btree (plannedact_id);


--
-- TOC entry 3515 (class 1259 OID 60425)
-- Name: idx_recreation_type_rectype_cd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_recreation_type_rectype_cd ON recreation_type USING btree (rectype_cd);


--
-- TOC entry 3516 (class 1259 OID 19018)
-- Name: idx_recreation_type_rectype_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_recreation_type_rectype_id ON recreation_type USING btree (rectype_id);


--
-- TOC entry 3617 (class 1259 OID 60431)
-- Name: idx_road_access_status_type_accessstatus_cd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_road_access_status_type_accessstatus_cd ON road_access_status_type USING btree (accessstatus_cd);


--
-- TOC entry 3618 (class 1259 OID 60430)
-- Name: idx_road_access_status_type_accessstatus_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_road_access_status_type_accessstatus_id ON road_access_status_type USING btree (accessstatus_id);


--
-- TOC entry 3524 (class 1259 OID 60434)
-- Name: idx_road_line_road_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_road_line_road_name ON road_line USING btree (road_name);


--
-- TOC entry 3625 (class 1259 OID 60440)
-- Name: idx_road_surface_type_roadsurface_cd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_road_surface_type_roadsurface_cd ON road_surface_type USING btree (roadsurface_cd);


--
-- TOC entry 3626 (class 1259 OID 60439)
-- Name: idx_road_surface_type_roadsurface_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_road_surface_type_roadsurface_id ON road_surface_type USING btree (roadsurface_id);


--
-- TOC entry 3528 (class 1259 OID 60445)
-- Name: idx_road_type_roadtype_cd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_road_type_roadtype_cd ON road_type USING btree (roadtype_cd);


--
-- TOC entry 3529 (class 1259 OID 19046)
-- Name: idx_road_type_roadtype_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_road_type_roadtype_id ON road_type USING btree (roadtype_id);


--
-- TOC entry 3579 (class 1259 OID 19127)
-- Name: idx_stand_area_history_end_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_stand_area_history_end_date ON stand_area_history USING btree (end_date);


--
-- TOC entry 3580 (class 1259 OID 19026)
-- Name: idx_stand_area_history_stand_no; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_stand_area_history_stand_no ON stand_area_history USING btree (stand_no);


--
-- TOC entry 3581 (class 1259 OID 19025)
-- Name: idx_stand_area_history_standarea_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_stand_area_history_standarea_id ON stand_area_history USING btree (standarea_id);


--
-- TOC entry 3582 (class 1259 OID 19024)
-- Name: idx_stand_area_history_standareahist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_stand_area_history_standareahist_id ON stand_area_history USING btree (standareahist_id);


--
-- TOC entry 3583 (class 1259 OID 19126)
-- Name: idx_stand_area_history_start_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_stand_area_history_start_date ON stand_area_history USING btree (start_date);


--
-- TOC entry 3541 (class 1259 OID 19021)
-- Name: idx_stand_area_standarea_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_stand_area_standarea_id ON stand_area USING btree (standarea_id);


--
-- TOC entry 3571 (class 1259 OID 19048)
-- Name: idx_stand_status_standstatus_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_stand_status_standstatus_id ON stand_status USING btree (standstatus_id);


--
-- TOC entry 3545 (class 1259 OID 19047)
-- Name: idx_stocking_type_stockingtype_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_stocking_type_stockingtype_id ON stocking_type USING btree (stockingtype_id);


--
-- TOC entry 3548 (class 1259 OID 19028)
-- Name: idx_stream_stream_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_stream_stream_id ON stream USING btree (stream_id);


--
-- TOC entry 3536 (class 1259 OID 19030)
-- Name: idx_streamside_management_zone_smz_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_streamside_management_zone_smz_id ON streamside_management_zone USING btree (smz_id);


--
-- TOC entry 3681 (class 1259 OID 60371)
-- Name: idx_trail_status_type_trailstatus_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trail_status_type_trailstatus_id ON trail_status_type USING btree (trailstatus_id);


--
-- TOC entry 3688 (class 1259 OID 60386)
-- Name: idx_trail_type_trailtype_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trail_type_trailtype_id ON trail_type USING btree (trailtype_id);


--
-- TOC entry 3552 (class 1259 OID 19032)
-- Name: idx_tree_tree_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tree_tree_id ON tree USING btree (tree_id);


--
-- TOC entry 3556 (class 1259 OID 19034)
-- Name: idx_water_point_waterpoint_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_water_point_waterpoint_id ON water_point USING btree (waterpoint_id);


--
-- TOC entry 3560 (class 1259 OID 19035)
-- Name: idx_water_type_watertype_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_water_type_watertype_id ON water_type USING btree (watertype_id);


--
-- TOC entry 3498 (class 1259 OID 18999)
-- Name: sidx_activity_area_geometry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_activity_area_geometry ON activity_area USING gist (geometry);


--
-- TOC entry 3648 (class 1259 OID 60450)
-- Name: sidx_burn_compartment_geometry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_burn_compartment_geometry ON burn_compartment USING gist (geometry);


--
-- TOC entry 3470 (class 1259 OID 19009)
-- Name: sidx_control_point_geometry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_control_point_geometry ON control_point USING gist (geometry);


--
-- TOC entry 3474 (class 1259 OID 19010)
-- Name: sidx_cultural_point_geometry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_cultural_point_geometry ON cultural_point USING gist (geometry);


--
-- TOC entry 3478 (class 1259 OID 19011)
-- Name: sidx_firebreak_line_geometry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_firebreak_line_geometry ON firebreak_line USING gist (geometry);


--
-- TOC entry 3482 (class 1259 OID 19013)
-- Name: sidx_habitat_enhancement_area_geometry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_habitat_enhancement_area_geometry ON habitat_enhancement_area USING gist (geometry);


--
-- TOC entry 3486 (class 1259 OID 19014)
-- Name: sidx_habitat_enhancement_point_geometry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_habitat_enhancement_point_geometry ON habitat_enhancement_point USING gist (geometry);


--
-- TOC entry 3510 (class 1259 OID 19015)
-- Name: sidx_land_area_geometry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_land_area_geometry ON land_area USING gist (geometry);


--
-- TOC entry 3614 (class 1259 OID 27411)
-- Name: sidx_land_area_hist_geometry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_land_area_hist_geometry ON land_area_history USING gist (geometry);


--
-- TOC entry 3514 (class 1259 OID 19017)
-- Name: sidx_recreation_point_geometry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_recreation_point_geometry ON recreation_point USING gist (geometry);


--
-- TOC entry 3527 (class 1259 OID 19019)
-- Name: sidx_road_line_geometry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_road_line_geometry ON road_line USING gist (geometry);


--
-- TOC entry 3663 (class 1259 OID 60349)
-- Name: sidx_soil_test_geometry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_soil_test_geometry ON soil_test USING gist (geometry);


--
-- TOC entry 3542 (class 1259 OID 19020)
-- Name: sidx_stand_area_geometry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_stand_area_geometry ON stand_area USING gist (geometry);


--
-- TOC entry 3584 (class 1259 OID 19023)
-- Name: sidx_stand_area_history_geometry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_stand_area_history_geometry ON stand_area_history USING gist (geometry);


--
-- TOC entry 3549 (class 1259 OID 19027)
-- Name: sidx_stream_geometry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_stream_geometry ON stream USING gist (geometry);


--
-- TOC entry 3537 (class 1259 OID 19029)
-- Name: sidx_streamside_management_zone_geometry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_streamside_management_zone_geometry ON streamside_management_zone USING gist (geometry);


--
-- TOC entry 3678 (class 1259 OID 60361)
-- Name: sidx_trail_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_trail_geom ON trail USING gist (geom);


--
-- TOC entry 3553 (class 1259 OID 19031)
-- Name: sidx_tree_geometry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tree_geometry ON tree USING gist (geometry);


--
-- TOC entry 3557 (class 1259 OID 19033)
-- Name: sidx_water_point_geometry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_water_point_geometry ON water_point USING gist (geometry);



