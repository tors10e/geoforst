--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.1
-- Dumped by pg_dump version 9.2.0
-- Started on 2013-03-12 23:25:07 AKDT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 1227 (class 1255 OID 19120)
-- Name: reset_startdate(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION reset_startdate() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.start_date = now();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.reset_startdate() OWNER TO postgres;

--
-- TOC entry 1221 (class 1255 OID 18938)
-- Name: update_stand_area_history(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION update_stand_area_history() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO stand_area_history 
	(   standareahist_id,
            standarea_id,
            geometry,
            stand_no,
            description,
            end_date,
            start_date,
	    foresttype_id
        )
        VALUES(
	    nextval('stand_area_history_standareahist_id_seq'),
            old.standarea_id,
            old.geometry,
            old.stand_no,
            old.description,
            current_timestamp,
            old.start_date,
	    old.foresttype_id
        );
    RETURN null;
END;
$$;


ALTER FUNCTION public.update_stand_area_history() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 201 (class 1259 OID 18638)
-- Name: activity_area; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE activity_area (
    activityarea_id integer NOT NULL,
    geometry geometry(MultiPolygon,26917),
    activity_date character varying(25),
    acttype_id integer,
    description character varying(255),
    revenue money,
    plannedact_id integer,
    standact_id integer
);


ALTER TABLE public.activity_area OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 18636)
-- Name: activity_area_activityarea_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE activity_area_activityarea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_area_activityarea_id_seq OWNER TO postgres;

--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 200
-- Name: activity_area_activityarea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE activity_area_activityarea_id_seq OWNED BY activity_area.activityarea_id;


--
-- TOC entry 188 (class 1259 OID 18566)
-- Name: activity_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE activity_type (
    acttype_id integer NOT NULL,
    acttype_dsc character varying(50)
);


ALTER TABLE public.activity_type OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 18573)
-- Name: control_point; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE control_point (
    controlpt_id integer NOT NULL,
    geometry geometry(Point,26917),
    description character varying,
    x double precision,
    y double precision,
    status character varying
);


ALTER TABLE public.control_point OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 18571)
-- Name: control_point_controlpt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE control_point_controlpt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.control_point_controlpt_id_seq OWNER TO postgres;

--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 189
-- Name: control_point_controlpt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE control_point_controlpt_id_seq OWNED BY control_point.controlpt_id;


--
-- TOC entry 192 (class 1259 OID 18585)
-- Name: cultural_point; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cultural_point (
    cultpt_id integer NOT NULL,
    geometry geometry(Point,26917),
    culttype_id integer,
    description character varying
);


ALTER TABLE public.cultural_point OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 18583)
-- Name: cultural_point_cultpt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cultural_point_cultpt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cultural_point_cultpt_id_seq OWNER TO postgres;

--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 191
-- Name: cultural_point_cultpt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cultural_point_cultpt_id_seq OWNED BY cultural_point.cultpt_id;


--
-- TOC entry 224 (class 1259 OID 18790)
-- Name: cultural_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cultural_type (
    culttype_id integer NOT NULL,
    culttype_cd character(3),
    culttype_dsc character varying(50)
);


ALTER TABLE public.cultural_type OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18788)
-- Name: cultural_type_culttype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cultural_type_culttype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cultural_type_culttype_id_seq OWNER TO postgres;

--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 223
-- Name: cultural_type_culttype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cultural_type_culttype_id_seq OWNED BY cultural_type.culttype_id;


--
-- TOC entry 234 (class 1259 OID 19151)
-- Name: dim_report_date; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dim_report_date (
    reportdate_id integer NOT NULL,
    report_year numeric(4,0),
    report_timestamp timestamp with time zone
);


ALTER TABLE public.dim_report_date OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 18597)
-- Name: firebreak_line; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE firebreak_line (
    fbkln_id integer NOT NULL,
    geometry geometry(LineString,26917),
    description character varying,
    length_meters double precision
);


ALTER TABLE public.firebreak_line OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 18595)
-- Name: firebreak_line_fbkln_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE firebreak_line_fbkln_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.firebreak_line_fbkln_id_seq OWNER TO postgres;

--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 193
-- Name: firebreak_line_fbkln_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE firebreak_line_fbkln_id_seq OWNED BY firebreak_line.fbkln_id;


--
-- TOC entry 232 (class 1259 OID 19055)
-- Name: forest_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE forest_type (
    foresttype_id integer NOT NULL,
    foresttype_dsc character varying(50)
);


ALTER TABLE public.forest_type OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 18609)
-- Name: habitat_enhancement_area; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE habitat_enhancement_area (
    habenharea_id integer NOT NULL,
    geometry geometry(Polygon,26917),
    habenhtype_id integer,
    description character varying
);


ALTER TABLE public.habitat_enhancement_area OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 18607)
-- Name: habitat_enhancement_area_habenharea_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE habitat_enhancement_area_habenharea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.habitat_enhancement_area_habenharea_id_seq OWNER TO postgres;

--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 195
-- Name: habitat_enhancement_area_habenharea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE habitat_enhancement_area_habenharea_id_seq OWNED BY habitat_enhancement_area.habenharea_id;


--
-- TOC entry 198 (class 1259 OID 18621)
-- Name: habitat_enhancement_point; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE habitat_enhancement_point (
    habenhpt_id integer NOT NULL,
    geometry geometry(Point,26917),
    habenhtype_id integer,
    description character varying
);


ALTER TABLE public.habitat_enhancement_point OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 18619)
-- Name: habitat_enhancement_point_habenhpt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE habitat_enhancement_point_habenhpt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.habitat_enhancement_point_habenhpt_id_seq OWNER TO postgres;

--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 197
-- Name: habitat_enhancement_point_habenhpt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE habitat_enhancement_point_habenhpt_id_seq OWNED BY habitat_enhancement_point.habenhpt_id;


--
-- TOC entry 199 (class 1259 OID 18631)
-- Name: habitat_enhancement_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE habitat_enhancement_type (
    habenhtype_id integer NOT NULL,
    habenhtype_dsc character varying(50)
);


ALTER TABLE public.habitat_enhancement_type OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 18648)
-- Name: harvest_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE harvest_type (
    harvesttype_id integer NOT NULL,
    harvesttype_dsc character varying(50)
);


ALTER TABLE public.harvest_type OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 18655)
-- Name: land_area; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE land_area (
    landarea_id integer NOT NULL,
    geometry geometry(Polygon,26917),
    description character varying(255)
);


ALTER TABLE public.land_area OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 18653)
-- Name: land_area_landarea_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE land_area_landarea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.land_area_landarea_id_seq OWNER TO postgres;

--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 203
-- Name: land_area_landarea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE land_area_landarea_id_seq OWNED BY land_area.landarea_id;


--
-- TOC entry 228 (class 1259 OID 18834)
-- Name: planned_activity; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE planned_activity (
    plannedact_id integer NOT NULL,
    standarea_id integer,
    acttype_id integer,
    planned_date numeric(4,0),
    completed_date character(25),
    description character varying(255),
    notes character varying(255),
    revenue double precision
);


ALTER TABLE public.planned_activity OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 18832)
-- Name: planned_activity_plannedact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE planned_activity_plannedact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planned_activity_plannedact_id_seq OWNER TO postgres;

--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 227
-- Name: planned_activity_plannedact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE planned_activity_plannedact_id_seq OWNED BY planned_activity.plannedact_id;


--
-- TOC entry 206 (class 1259 OID 18667)
-- Name: recreation_point; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE recreation_point (
    recpt_id integer NOT NULL,
    geometry geometry(Point,26917),
    rectype_id integer,
    description character varying(255)
);


ALTER TABLE public.recreation_point OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 18665)
-- Name: recreation_point_recpt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE recreation_point_recpt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recreation_point_recpt_id_seq OWNER TO postgres;

--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 205
-- Name: recreation_point_recpt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE recreation_point_recpt_id_seq OWNED BY recreation_point.recpt_id;


--
-- TOC entry 207 (class 1259 OID 18677)
-- Name: recreation_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE recreation_type (
    rectype_id integer NOT NULL,
    rectype_dsc character varying(50)
);


ALTER TABLE public.recreation_type OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 19154)
-- Name: report_dates_reportdate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE report_dates_reportdate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_dates_reportdate_id_seq OWNER TO postgres;

--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 235
-- Name: report_dates_reportdate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE report_dates_reportdate_id_seq OWNED BY dim_report_date.reportdate_id;


--
-- TOC entry 209 (class 1259 OID 18684)
-- Name: road_line; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE road_line (
    roadln_id integer NOT NULL,
    geometry geometry(MultiLineString,26917),
    roadtype_id integer,
    description character varying(255),
    access_status character varying(50),
    surface character varying(50),
    road_name character varying(25)
);


ALTER TABLE public.road_line OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 18682)
-- Name: road_line_roadln_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE road_line_roadln_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.road_line_roadln_id_seq OWNER TO postgres;

--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 208
-- Name: road_line_roadln_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE road_line_roadln_id_seq OWNED BY road_line.roadln_id;


--
-- TOC entry 210 (class 1259 OID 18694)
-- Name: road_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE road_type (
    roadtype_id integer NOT NULL,
    roadtype_dsc character varying(50)
);


ALTER TABLE public.road_type OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 18730)
-- Name: stand_area; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE stand_area (
    standarea_id integer NOT NULL,
    geometry geometry(Polygon,26917),
    stand_no integer,
    description character varying(255),
    start_date timestamp without time zone DEFAULT now(),
    foresttype_id integer
);


ALTER TABLE public.stand_area OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 18927)
-- Name: stand_area_history; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE stand_area_history (
    standareahist_id integer NOT NULL,
    standarea_id integer,
    geometry geometry(Polygon,26917),
    stand_no integer,
    description character varying(255),
    end_date timestamp with time zone,
    start_date timestamp with time zone DEFAULT now(),
    foresttype_id integer
);


ALTER TABLE public.stand_area_history OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 18925)
-- Name: stand_area_history_standareahist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE stand_area_history_standareahist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stand_area_history_standareahist_id_seq OWNER TO postgres;

--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 230
-- Name: stand_area_history_standareahist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE stand_area_history_standareahist_id_seq OWNED BY stand_area_history.standareahist_id;


--
-- TOC entry 213 (class 1259 OID 18728)
-- Name: stand_area_standarea_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE stand_area_standarea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stand_area_standarea_id_seq OWNER TO postgres;

--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 213
-- Name: stand_area_standarea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE stand_area_standarea_id_seq OWNED BY stand_area.standarea_id;


--
-- TOC entry 226 (class 1259 OID 18798)
-- Name: stand_status; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE stand_status (
    standstatus_id integer NOT NULL,
    standarea_id integer,
    year numeric(4,0),
    age character varying(25),
    stocking character varying(25),
    stockingtype_id integer,
    damaged character(3),
    recommended_treatment character varying(255),
    description character varying(255),
    notes character varying(255)
);


ALTER TABLE public.stand_status OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18796)
-- Name: stand_status_standstatus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE stand_status_standstatus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stand_status_standstatus_id_seq OWNER TO postgres;

--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 225
-- Name: stand_status_standstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE stand_status_standstatus_id_seq OWNED BY stand_status.standstatus_id;


--
-- TOC entry 215 (class 1259 OID 18742)
-- Name: stocking_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE stocking_type (
    stockingtype_id integer NOT NULL,
    stockingtype_dsc character varying(50)
);


ALTER TABLE public.stocking_type OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 18749)
-- Name: stream; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE stream (
    stream_id integer NOT NULL,
    geometry geometry(LineString,26917),
    shape_leng character varying(25),
    stream_type character varying(25),
    stream_name character varying(25)
);


ALTER TABLE public.stream OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 18747)
-- Name: stream_stream_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE stream_stream_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stream_stream_id_seq OWNER TO postgres;

--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 216
-- Name: stream_stream_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE stream_stream_id_seq OWNED BY stream.stream_id;


--
-- TOC entry 212 (class 1259 OID 18701)
-- Name: streamside_management_zone; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE streamside_management_zone (
    smz_id integer NOT NULL,
    geometry geometry(MultiPolygon,26917),
    id integer,
    shape_leng double precision,
    et_id character varying(255),
    shape_area double precision
);


ALTER TABLE public.streamside_management_zone OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 18699)
-- Name: streamside_management_zone_smz_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE streamside_management_zone_smz_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.streamside_management_zone_smz_id_seq OWNER TO postgres;

--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 211
-- Name: streamside_management_zone_smz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE streamside_management_zone_smz_id_seq OWNED BY streamside_management_zone.smz_id;


--
-- TOC entry 219 (class 1259 OID 18761)
-- Name: tree; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tree (
    tree_id integer NOT NULL,
    geometry geometry(Point,26917),
    specie character varying(50),
    start_year character(4)
);


ALTER TABLE public.tree OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 18759)
-- Name: tree_tree_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tree_tree_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tree_tree_id_seq OWNER TO postgres;

--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 218
-- Name: tree_tree_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tree_tree_id_seq OWNED BY tree.tree_id;


--
-- TOC entry 229 (class 1259 OID 18891)
-- Name: vw_stand_activity; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vw_stand_activity AS
    SELECT stand_area.geometry, stand_area.stand_no, stand_area.description, stand_area.standarea_id, stand_activity.planned_date, stand_activity.completed_date, stand_activity.description AS activity_description, stand_activity.notes, stand_activity.revenue, stand_activity.plannedact_id AS standact_id, activity_type.acttype_dsc FROM planned_activity stand_activity, stand_area, activity_type WHERE ((stand_activity.standarea_id = stand_area.standarea_id) AND (activity_type.acttype_id = stand_activity.acttype_id)) ORDER BY stand_area.stand_no;


ALTER TABLE public.vw_stand_activity OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 19115)
-- Name: vw_stand_area_all; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vw_stand_area_all WITH (security_barrier=true) AS
    SELECT stand_area.geometry, stand_area.stand_no, stand_area.description, stand_area.start_date, ('now'::text)::date AS end_date, stand_area.foresttype_id FROM stand_area UNION SELECT stand_area_history.geometry, stand_area_history.stand_no, stand_area_history.description, stand_area_history.start_date, stand_area_history.end_date, stand_area_history.foresttype_id FROM stand_area_history;


ALTER TABLE public.vw_stand_area_all OWNER TO postgres;

--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 233
-- Name: VIEW vw_stand_area_all; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON VIEW vw_stand_area_all IS 'Union of stand area and stand area history tables. Created for purposes of developing reports on stand composition changes over time.';


--
-- TOC entry 236 (class 1259 OID 19162)
-- Name: vw_stand_area_by_year; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vw_stand_area_by_year AS
    SELECT s.standarea_id, s.geometry, s.stand_no, s.description, s.end_date, s.start_date, s.foresttype_id, d.reportdate_id, d.report_year, d.report_timestamp FROM (stand_area_history s CROSS JOIN dim_report_date d) WHERE ((d.report_timestamp >= s.start_date) AND (d.report_timestamp <= s.end_date)) UNION SELECT s.standarea_id, s.geometry, s.stand_no, s.description, now() AS end_date, s.start_date, s.foresttype_id, d.reportdate_id, d.report_year, d.report_timestamp FROM (stand_area s CROSS JOIN dim_report_date d) WHERE ((d.report_timestamp >= s.start_date) AND (d.report_timestamp <= now()));


ALTER TABLE public.vw_stand_area_by_year OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 18773)
-- Name: water_point; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE water_point (
    waterpoint_id integer NOT NULL,
    geometry geometry(Point,26917),
    watertype_id integer,
    description character varying(255)
);


ALTER TABLE public.water_point OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18771)
-- Name: water_point_waterpoint_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE water_point_waterpoint_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.water_point_waterpoint_id_seq OWNER TO postgres;

--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 220
-- Name: water_point_waterpoint_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE water_point_waterpoint_id_seq OWNED BY water_point.waterpoint_id;


--
-- TOC entry 222 (class 1259 OID 18783)
-- Name: water_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE water_type (
    watertype_id integer NOT NULL,
    watertype_dsc character varying(50)
);


ALTER TABLE public.water_type OWNER TO postgres;

--
-- TOC entry 3285 (class 2604 OID 18985)
-- Name: activityarea_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activity_area ALTER COLUMN activityarea_id SET DEFAULT nextval('activity_area_activityarea_id_seq'::regclass);


--
-- TOC entry 3280 (class 2604 OID 18576)
-- Name: controlpt_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY control_point ALTER COLUMN controlpt_id SET DEFAULT nextval('control_point_controlpt_id_seq'::regclass);


--
-- TOC entry 3281 (class 2604 OID 18588)
-- Name: cultpt_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cultural_point ALTER COLUMN cultpt_id SET DEFAULT nextval('cultural_point_cultpt_id_seq'::regclass);


--
-- TOC entry 3295 (class 2604 OID 18793)
-- Name: culttype_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cultural_type ALTER COLUMN culttype_id SET DEFAULT nextval('cultural_type_culttype_id_seq'::regclass);


--
-- TOC entry 3300 (class 2604 OID 19156)
-- Name: reportdate_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dim_report_date ALTER COLUMN reportdate_id SET DEFAULT nextval('report_dates_reportdate_id_seq'::regclass);


--
-- TOC entry 3282 (class 2604 OID 18600)
-- Name: fbkln_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY firebreak_line ALTER COLUMN fbkln_id SET DEFAULT nextval('firebreak_line_fbkln_id_seq'::regclass);


--
-- TOC entry 3283 (class 2604 OID 18612)
-- Name: habenharea_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY habitat_enhancement_area ALTER COLUMN habenharea_id SET DEFAULT nextval('habitat_enhancement_area_habenharea_id_seq'::regclass);


--
-- TOC entry 3284 (class 2604 OID 18624)
-- Name: habenhpt_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY habitat_enhancement_point ALTER COLUMN habenhpt_id SET DEFAULT nextval('habitat_enhancement_point_habenhpt_id_seq'::regclass);


--
-- TOC entry 3286 (class 2604 OID 18658)
-- Name: landarea_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY land_area ALTER COLUMN landarea_id SET DEFAULT nextval('land_area_landarea_id_seq'::regclass);


--
-- TOC entry 3297 (class 2604 OID 18978)
-- Name: plannedact_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY planned_activity ALTER COLUMN plannedact_id SET DEFAULT nextval('planned_activity_plannedact_id_seq'::regclass);


--
-- TOC entry 3287 (class 2604 OID 18670)
-- Name: recpt_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recreation_point ALTER COLUMN recpt_id SET DEFAULT nextval('recreation_point_recpt_id_seq'::regclass);


--
-- TOC entry 3288 (class 2604 OID 18687)
-- Name: roadln_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY road_line ALTER COLUMN roadln_id SET DEFAULT nextval('road_line_roadln_id_seq'::regclass);


--
-- TOC entry 3291 (class 2604 OID 18733)
-- Name: standarea_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stand_area ALTER COLUMN standarea_id SET DEFAULT nextval('stand_area_standarea_id_seq'::regclass);


--
-- TOC entry 3298 (class 2604 OID 18930)
-- Name: standareahist_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stand_area_history ALTER COLUMN standareahist_id SET DEFAULT nextval('stand_area_history_standareahist_id_seq'::regclass);


--
-- TOC entry 3296 (class 2604 OID 18801)
-- Name: standstatus_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stand_status ALTER COLUMN standstatus_id SET DEFAULT nextval('stand_status_standstatus_id_seq'::regclass);


--
-- TOC entry 3292 (class 2604 OID 18752)
-- Name: stream_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stream ALTER COLUMN stream_id SET DEFAULT nextval('stream_stream_id_seq'::regclass);


--
-- TOC entry 3289 (class 2604 OID 18704)
-- Name: smz_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY streamside_management_zone ALTER COLUMN smz_id SET DEFAULT nextval('streamside_management_zone_smz_id_seq'::regclass);


--
-- TOC entry 3293 (class 2604 OID 18764)
-- Name: tree_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tree ALTER COLUMN tree_id SET DEFAULT nextval('tree_tree_id_seq'::regclass);


--
-- TOC entry 3294 (class 2604 OID 18776)
-- Name: waterpoint_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY water_point ALTER COLUMN waterpoint_id SET DEFAULT nextval('water_point_waterpoint_id_seq'::regclass);


--
-- TOC entry 3302 (class 2606 OID 18570)
-- Name: activity_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY activity_type
    ADD CONSTRAINT activity_type_pkey PRIMARY KEY (acttype_id);


--
-- TOC entry 3305 (class 2606 OID 18581)
-- Name: control_point_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY control_point
    ADD CONSTRAINT control_point_pk PRIMARY KEY (controlpt_id);


--
-- TOC entry 3309 (class 2606 OID 18593)
-- Name: cultural_point_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cultural_point
    ADD CONSTRAINT cultural_point_pk PRIMARY KEY (cultpt_id);


--
-- TOC entry 3313 (class 2606 OID 18605)
-- Name: firebreak_line_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY firebreak_line
    ADD CONSTRAINT firebreak_line_pk PRIMARY KEY (fbkln_id);


--
-- TOC entry 3318 (class 2606 OID 18617)
-- Name: habitat_enhancement_area_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY habitat_enhancement_area
    ADD CONSTRAINT habitat_enhancement_area_pk PRIMARY KEY (habenharea_id);


--
-- TOC entry 3322 (class 2606 OID 18629)
-- Name: habitat_enhancement_point_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY habitat_enhancement_point
    ADD CONSTRAINT habitat_enhancement_point_pk PRIMARY KEY (habenhpt_id);


--
-- TOC entry 3325 (class 2606 OID 18635)
-- Name: habitat_enhancement_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY habitat_enhancement_type
    ADD CONSTRAINT habitat_enhancement_type_pkey PRIMARY KEY (habenhtype_id);


--
-- TOC entry 3329 (class 2606 OID 18646)
-- Name: harvest_area_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY activity_area
    ADD CONSTRAINT harvest_area_pk PRIMARY KEY (activityarea_id);


--
-- TOC entry 3332 (class 2606 OID 18652)
-- Name: harvest_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY harvest_type
    ADD CONSTRAINT harvest_type_pkey PRIMARY KEY (harvesttype_id);


--
-- TOC entry 3336 (class 2606 OID 18663)
-- Name: land_area_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY land_area
    ADD CONSTRAINT land_area_pk PRIMARY KEY (landarea_id);


--
-- TOC entry 3381 (class 2606 OID 18795)
-- Name: pk_cultural_type_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cultural_type
    ADD CONSTRAINT pk_cultural_type_id PRIMARY KEY (culttype_id);


--
-- TOC entry 3405 (class 2606 OID 19161)
-- Name: pk_dim_report_date; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dim_report_date
    ADD CONSTRAINT pk_dim_report_date PRIMARY KEY (reportdate_id);


--
-- TOC entry 3403 (class 2606 OID 19059)
-- Name: pk_forest_type; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY forest_type
    ADD CONSTRAINT pk_forest_type PRIMARY KEY (foresttype_id);


--
-- TOC entry 3386 (class 2606 OID 18811)
-- Name: pk_stand_status; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY stand_status
    ADD CONSTRAINT pk_stand_status PRIMARY KEY (standstatus_id);


--
-- TOC entry 3340 (class 2606 OID 18675)
-- Name: recreation_point_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY recreation_point
    ADD CONSTRAINT recreation_point_pk PRIMARY KEY (recpt_id);


--
-- TOC entry 3344 (class 2606 OID 18681)
-- Name: recreation_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY recreation_type
    ADD CONSTRAINT recreation_type_pkey PRIMARY KEY (rectype_id);


--
-- TOC entry 3347 (class 2606 OID 18692)
-- Name: road_line_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY road_line
    ADD CONSTRAINT road_line_pk PRIMARY KEY (roadln_id);


--
-- TOC entry 3351 (class 2606 OID 18698)
-- Name: road_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY road_type
    ADD CONSTRAINT road_type_pkey PRIMARY KEY (roadtype_id);


--
-- TOC entry 3392 (class 2606 OID 18842)
-- Name: stand_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY planned_activity
    ADD CONSTRAINT stand_activity_pkey PRIMARY KEY (plannedact_id);


--
-- TOC entry 3400 (class 2606 OID 18936)
-- Name: stand_area_hist_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY stand_area_history
    ADD CONSTRAINT stand_area_hist_pk PRIMARY KEY (standareahist_id);


--
-- TOC entry 3360 (class 2606 OID 18738)
-- Name: stand_area_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY stand_area
    ADD CONSTRAINT stand_area_pk PRIMARY KEY (standarea_id);


--
-- TOC entry 3363 (class 2606 OID 18746)
-- Name: stocking_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY stocking_type
    ADD CONSTRAINT stocking_type_pkey PRIMARY KEY (stockingtype_id);


--
-- TOC entry 3367 (class 2606 OID 18757)
-- Name: stream_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY stream
    ADD CONSTRAINT stream_pk PRIMARY KEY (stream_id);


--
-- TOC entry 3355 (class 2606 OID 18709)
-- Name: streamside_mgt_zone_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY streamside_management_zone
    ADD CONSTRAINT streamside_mgt_zone_pk PRIMARY KEY (smz_id);


--
-- TOC entry 3371 (class 2606 OID 18769)
-- Name: tree_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tree
    ADD CONSTRAINT tree_pk PRIMARY KEY (tree_id);


--
-- TOC entry 3375 (class 2606 OID 18781)
-- Name: water_point_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY water_point
    ADD CONSTRAINT water_point_pk PRIMARY KEY (waterpoint_id);


--
-- TOC entry 3378 (class 2606 OID 18787)
-- Name: water_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY water_type
    ADD CONSTRAINT water_type_pkey PRIMARY KEY (watertype_id);


--
-- TOC entry 3316 (class 1259 OID 18860)
-- Name: fki_hab_enh_area_hab_enh_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_hab_enh_area_hab_enh_type ON habitat_enhancement_area USING btree (habenhtype_id);


--
-- TOC entry 3320 (class 1259 OID 18866)
-- Name: fki_hab_enh_pt_hab_enh_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_hab_enh_pt_hab_enh_type ON habitat_enhancement_point USING btree (habenhtype_id);


--
-- TOC entry 3327 (class 1259 OID 18872)
-- Name: fki_harvest_area_harvest_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_harvest_area_harvest_type ON activity_area USING btree (acttype_id);


--
-- TOC entry 3338 (class 1259 OID 18878)
-- Name: fki_recreation_point_recreation_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_recreation_point_recreation_type ON recreation_point USING btree (rectype_id);


--
-- TOC entry 3345 (class 1259 OID 18960)
-- Name: fki_road_line_road_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_road_line_road_type ON road_line USING btree (roadtype_id);


--
-- TOC entry 3356 (class 1259 OID 19077)
-- Name: fki_stand_area_forest_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_stand_area_forest_type ON stand_area USING btree (foresttype_id);


--
-- TOC entry 3382 (class 1259 OID 19083)
-- Name: fki_stand_status_stocking_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_stand_status_stocking_type ON stand_status USING btree (stockingtype_id);


--
-- TOC entry 3303 (class 1259 OID 19036)
-- Name: idx_activity_type_acttype_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_activity_type_acttype_id ON activity_type USING btree (acttype_id);


--
-- TOC entry 3306 (class 1259 OID 19037)
-- Name: idx_control_point_controlpt_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_control_point_controlpt_id ON control_point USING btree (controlpt_id);


--
-- TOC entry 3310 (class 1259 OID 19038)
-- Name: idx_cultural_point_cultpt_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_cultural_point_cultpt_id ON cultural_point USING btree (cultpt_id);


--
-- TOC entry 3379 (class 1259 OID 19039)
-- Name: idx_cultural_type_culttype_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_cultural_type_culttype_id ON cultural_type USING btree (culttype_id);


--
-- TOC entry 3314 (class 1259 OID 19012)
-- Name: idx_firebreak_line_fbkln_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_firebreak_line_fbkln_id ON firebreak_line USING btree (fbkln_id);


--
-- TOC entry 3401 (class 1259 OID 19060)
-- Name: idx_forest_type_foresttype_dsc; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_forest_type_foresttype_dsc ON forest_type USING btree (foresttype_dsc);


--
-- TOC entry 3326 (class 1259 OID 19040)
-- Name: idx_habitat_enhancement_type_habenhtype_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_habitat_enhancement_type_habenhtype_id ON habitat_enhancement_type USING btree (habenhtype_id);


--
-- TOC entry 3333 (class 1259 OID 19041)
-- Name: idx_harvest_type_harvesttype_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_harvest_type_harvesttype_id ON harvest_type USING btree (harvesttype_id);


--
-- TOC entry 3334 (class 1259 OID 19016)
-- Name: idx_land_area_landarea_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_land_area_landarea_id ON land_area USING btree (landarea_id);


--
-- TOC entry 3387 (class 1259 OID 19044)
-- Name: idx_planned_activity_acttype_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_planned_activity_acttype_id ON planned_activity USING btree (acttype_id);


--
-- TOC entry 3388 (class 1259 OID 19045)
-- Name: idx_planned_activity_planned_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_planned_activity_planned_date ON planned_activity USING btree (planned_date);


--
-- TOC entry 3389 (class 1259 OID 19042)
-- Name: idx_planned_activity_plannedact_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_planned_activity_plannedact_id ON planned_activity USING btree (plannedact_id);


--
-- TOC entry 3390 (class 1259 OID 19043)
-- Name: idx_planned_activity_standarea_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_planned_activity_standarea_id ON planned_activity USING btree (standarea_id);


--
-- TOC entry 3342 (class 1259 OID 19018)
-- Name: idx_recreation_type_rectype_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_recreation_type_rectype_id ON recreation_type USING btree (rectype_id);


--
-- TOC entry 3349 (class 1259 OID 19046)
-- Name: idx_road_type_roadtype_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_road_type_roadtype_id ON road_type USING btree (roadtype_id);


--
-- TOC entry 3393 (class 1259 OID 19127)
-- Name: idx_stand_area_history_end_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_stand_area_history_end_date ON stand_area_history USING btree (end_date);


--
-- TOC entry 3394 (class 1259 OID 19026)
-- Name: idx_stand_area_history_stand_no; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_stand_area_history_stand_no ON stand_area_history USING btree (stand_no);


--
-- TOC entry 3395 (class 1259 OID 19025)
-- Name: idx_stand_area_history_standarea_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_stand_area_history_standarea_id ON stand_area_history USING btree (standarea_id);


--
-- TOC entry 3396 (class 1259 OID 19024)
-- Name: idx_stand_area_history_standareahist_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_stand_area_history_standareahist_id ON stand_area_history USING btree (standareahist_id);


--
-- TOC entry 3397 (class 1259 OID 19126)
-- Name: idx_stand_area_history_start_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_stand_area_history_start_date ON stand_area_history USING btree (start_date);


--
-- TOC entry 3357 (class 1259 OID 19021)
-- Name: idx_stand_area_standarea_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_stand_area_standarea_id ON stand_area USING btree (standarea_id);


--
-- TOC entry 3383 (class 1259 OID 19049)
-- Name: idx_stand_status_standarea_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_stand_status_standarea_id ON stand_status USING btree (standarea_id);


--
-- TOC entry 3384 (class 1259 OID 19048)
-- Name: idx_stand_status_standstatus_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_stand_status_standstatus_id ON stand_status USING btree (standstatus_id);


--
-- TOC entry 3361 (class 1259 OID 19047)
-- Name: idx_stocking_type_stockingtype_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_stocking_type_stockingtype_id ON stocking_type USING btree (stockingtype_id);


--
-- TOC entry 3364 (class 1259 OID 19028)
-- Name: idx_stream_stream_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_stream_stream_id ON stream USING btree (stream_id);


--
-- TOC entry 3352 (class 1259 OID 19030)
-- Name: idx_streamside_management_zone_smz_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_streamside_management_zone_smz_id ON streamside_management_zone USING btree (smz_id);


--
-- TOC entry 3368 (class 1259 OID 19032)
-- Name: idx_tree_tree_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_tree_tree_id ON tree USING btree (tree_id);


--
-- TOC entry 3372 (class 1259 OID 19034)
-- Name: idx_water_point_waterpoint_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_water_point_waterpoint_id ON water_point USING btree (waterpoint_id);


--
-- TOC entry 3376 (class 1259 OID 19035)
-- Name: idx_water_type_watertype_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_water_type_watertype_id ON water_type USING btree (watertype_id);


--
-- TOC entry 3330 (class 1259 OID 18999)
-- Name: sidx_activity_area_geometry; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sidx_activity_area_geometry ON activity_area USING gist (geometry);


--
-- TOC entry 3307 (class 1259 OID 19009)
-- Name: sidx_control_point_geometry; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sidx_control_point_geometry ON control_point USING gist (geometry);


--
-- TOC entry 3311 (class 1259 OID 19010)
-- Name: sidx_cultural_point_geometry; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sidx_cultural_point_geometry ON cultural_point USING gist (geometry);


--
-- TOC entry 3315 (class 1259 OID 19011)
-- Name: sidx_firebreak_line_geometry; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sidx_firebreak_line_geometry ON firebreak_line USING gist (geometry);


--
-- TOC entry 3319 (class 1259 OID 19013)
-- Name: sidx_habitat_enhancement_area_geometry; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sidx_habitat_enhancement_area_geometry ON habitat_enhancement_area USING gist (geometry);


--
-- TOC entry 3323 (class 1259 OID 19014)
-- Name: sidx_habitat_enhancement_point_geometry; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sidx_habitat_enhancement_point_geometry ON habitat_enhancement_point USING gist (geometry);


--
-- TOC entry 3337 (class 1259 OID 19015)
-- Name: sidx_land_area_geometry; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sidx_land_area_geometry ON land_area USING gist (geometry);


--
-- TOC entry 3341 (class 1259 OID 19017)
-- Name: sidx_recreation_point_geometry; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sidx_recreation_point_geometry ON recreation_point USING gist (geometry);


--
-- TOC entry 3348 (class 1259 OID 19019)
-- Name: sidx_road_line_geometry; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sidx_road_line_geometry ON road_line USING gist (geometry);


--
-- TOC entry 3358 (class 1259 OID 19020)
-- Name: sidx_stand_area_geometry; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sidx_stand_area_geometry ON stand_area USING gist (geometry);


--
-- TOC entry 3398 (class 1259 OID 19023)
-- Name: sidx_stand_area_history_geometry; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sidx_stand_area_history_geometry ON stand_area_history USING gist (geometry);


--
-- TOC entry 3365 (class 1259 OID 19027)
-- Name: sidx_stream_geometry; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sidx_stream_geometry ON stream USING gist (geometry);


--
-- TOC entry 3353 (class 1259 OID 19029)
-- Name: sidx_streamside_management_zone_geometry; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sidx_streamside_management_zone_geometry ON streamside_management_zone USING gist (geometry);


--
-- TOC entry 3369 (class 1259 OID 19031)
-- Name: sidx_tree_geometry; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sidx_tree_geometry ON tree USING gist (geometry);


--
-- TOC entry 3373 (class 1259 OID 19033)
-- Name: sidx_water_point_geometry; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sidx_water_point_geometry ON water_point USING gist (geometry);


--
-- TOC entry 3273 (class 2618 OID 17136)
-- Name: geometry_columns_delete; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE geometry_columns_delete AS ON DELETE TO geometry_columns DO INSTEAD NOTHING;


--
-- TOC entry 3271 (class 2618 OID 17134)
-- Name: geometry_columns_insert; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE geometry_columns_insert AS ON INSERT TO geometry_columns DO INSTEAD NOTHING;


--
-- TOC entry 3272 (class 2618 OID 17135)
-- Name: geometry_columns_update; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE geometry_columns_update AS ON UPDATE TO geometry_columns DO INSTEAD NOTHING;


--
-- TOC entry 3421 (class 2620 OID 19121)
-- Name: trg_reset_stand_area_startdate; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_reset_stand_area_startdate BEFORE UPDATE ON stand_area FOR EACH ROW EXECUTE PROCEDURE reset_startdate();

ALTER TABLE stand_area DISABLE TRIGGER trg_reset_stand_area_startdate;


--
-- TOC entry 3419 (class 2620 OID 18940)
-- Name: trg_truncate_stand_area_history; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_truncate_stand_area_history BEFORE TRUNCATE ON stand_area FOR EACH STATEMENT EXECUTE PROCEDURE update_stand_area_history();

ALTER TABLE stand_area DISABLE TRIGGER trg_truncate_stand_area_history;


--
-- TOC entry 3420 (class 2620 OID 18939)
-- Name: trg_update_stand_history; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_update_stand_history AFTER DELETE OR UPDATE ON stand_area FOR EACH ROW EXECUTE PROCEDURE update_stand_area_history();

ALTER TABLE stand_area DISABLE TRIGGER trg_update_stand_history;


--
-- TOC entry 3409 (class 2606 OID 19084)
-- Name: fk_activity_area_activity_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activity_area
    ADD CONSTRAINT fk_activity_area_activity_type FOREIGN KEY (acttype_id) REFERENCES activity_type(acttype_id);


--
-- TOC entry 3406 (class 2606 OID 18849)
-- Name: fk_cultural_point_cultural_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cultural_point
    ADD CONSTRAINT fk_cultural_point_cultural_type FOREIGN KEY (culttype_id) REFERENCES cultural_type(culttype_id);


--
-- TOC entry 3407 (class 2606 OID 18855)
-- Name: fk_hab_enh_area_hab_enh_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY habitat_enhancement_area
    ADD CONSTRAINT fk_hab_enh_area_hab_enh_type FOREIGN KEY (habenhtype_id) REFERENCES habitat_enhancement_type(habenhtype_id);


--
-- TOC entry 3408 (class 2606 OID 18861)
-- Name: fk_hab_enh_pt_hab_enh_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY habitat_enhancement_point
    ADD CONSTRAINT fk_hab_enh_pt_hab_enh_type FOREIGN KEY (habenhtype_id) REFERENCES habitat_enhancement_type(habenhtype_id);


--
-- TOC entry 3411 (class 2606 OID 18873)
-- Name: fk_recreation_point_recreation_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recreation_point
    ADD CONSTRAINT fk_recreation_point_recreation_type FOREIGN KEY (rectype_id) REFERENCES recreation_type(rectype_id);


--
-- TOC entry 3412 (class 2606 OID 18955)
-- Name: fk_road_line_road_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY road_line
    ADD CONSTRAINT fk_road_line_road_type FOREIGN KEY (roadtype_id) REFERENCES road_type(roadtype_id);


--
-- TOC entry 3410 (class 2606 OID 18986)
-- Name: fk_stand_area; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activity_area
    ADD CONSTRAINT fk_stand_area FOREIGN KEY (standact_id) REFERENCES planned_activity(plannedact_id);


--
-- TOC entry 3413 (class 2606 OID 19072)
-- Name: fk_stand_area_forest_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stand_area
    ADD CONSTRAINT fk_stand_area_forest_type FOREIGN KEY (foresttype_id) REFERENCES forest_type(foresttype_id);


--
-- TOC entry 3418 (class 2606 OID 19106)
-- Name: fk_stand_area_forest_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY forest_type
    ADD CONSTRAINT fk_stand_area_forest_type FOREIGN KEY (foresttype_id) REFERENCES forest_type(foresttype_id);


--
-- TOC entry 3416 (class 2606 OID 18805)
-- Name: fk_stand_status_stand_area; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stand_status
    ADD CONSTRAINT fk_stand_status_stand_area FOREIGN KEY (standarea_id) REFERENCES stand_area(standarea_id);


--
-- TOC entry 3415 (class 2606 OID 19078)
-- Name: fk_stand_status_stocking_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stand_status
    ADD CONSTRAINT fk_stand_status_stocking_type FOREIGN KEY (stockingtype_id) REFERENCES stocking_type(stockingtype_id);


--
-- TOC entry 3417 (class 2606 OID 18979)
-- Name: fk_standactivity_activity_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY planned_activity
    ADD CONSTRAINT fk_standactivity_activity_type FOREIGN KEY (acttype_id) REFERENCES activity_type(acttype_id);


--
-- TOC entry 3414 (class 2606 OID 18885)
-- Name: fk_water_point_water_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY water_point
    ADD CONSTRAINT fk_water_point_water_type FOREIGN KEY (watertype_id) REFERENCES water_type(watertype_id);


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 201
-- Name: activity_area; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE activity_area FROM PUBLIC;
REVOKE ALL ON TABLE activity_area FROM postgres;
GRANT ALL ON TABLE activity_area TO postgres;
GRANT SELECT ON TABLE activity_area TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE activity_area TO fsp_edit;
GRANT ALL ON TABLE activity_area TO fsp_admin;


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 200
-- Name: activity_area_activityarea_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE activity_area_activityarea_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE activity_area_activityarea_id_seq FROM postgres;
GRANT ALL ON SEQUENCE activity_area_activityarea_id_seq TO postgres;
GRANT ALL ON SEQUENCE activity_area_activityarea_id_seq TO fsp_edit;
GRANT ALL ON SEQUENCE activity_area_activityarea_id_seq TO fsp_admin;


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 188
-- Name: activity_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE activity_type FROM PUBLIC;
REVOKE ALL ON TABLE activity_type FROM postgres;
GRANT ALL ON TABLE activity_type TO postgres;
GRANT SELECT ON TABLE activity_type TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE activity_type TO fsp_edit;
GRANT ALL ON TABLE activity_type TO fsp_admin;


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 190
-- Name: control_point; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE control_point FROM PUBLIC;
REVOKE ALL ON TABLE control_point FROM postgres;
GRANT ALL ON TABLE control_point TO postgres;
GRANT SELECT ON TABLE control_point TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE control_point TO fsp_edit;
GRANT ALL ON TABLE control_point TO fsp_admin;


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 189
-- Name: control_point_controlpt_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE control_point_controlpt_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE control_point_controlpt_id_seq FROM postgres;
GRANT ALL ON SEQUENCE control_point_controlpt_id_seq TO postgres;
GRANT ALL ON SEQUENCE control_point_controlpt_id_seq TO fsp_edit;
GRANT ALL ON SEQUENCE control_point_controlpt_id_seq TO fsp_admin;


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 192
-- Name: cultural_point; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cultural_point FROM PUBLIC;
REVOKE ALL ON TABLE cultural_point FROM postgres;
GRANT ALL ON TABLE cultural_point TO postgres;
GRANT SELECT ON TABLE cultural_point TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE cultural_point TO fsp_edit;
GRANT ALL ON TABLE cultural_point TO fsp_admin;


--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 191
-- Name: cultural_point_cultpt_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE cultural_point_cultpt_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE cultural_point_cultpt_id_seq FROM postgres;
GRANT ALL ON SEQUENCE cultural_point_cultpt_id_seq TO postgres;
GRANT ALL ON SEQUENCE cultural_point_cultpt_id_seq TO fsp_edit;
GRANT ALL ON SEQUENCE cultural_point_cultpt_id_seq TO fsp_admin;


--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 224
-- Name: cultural_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cultural_type FROM PUBLIC;
REVOKE ALL ON TABLE cultural_type FROM postgres;
GRANT ALL ON TABLE cultural_type TO postgres;
GRANT SELECT ON TABLE cultural_type TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE cultural_type TO fsp_edit;
GRANT ALL ON TABLE cultural_type TO fsp_admin;


--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 223
-- Name: cultural_type_culttype_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE cultural_type_culttype_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE cultural_type_culttype_id_seq FROM postgres;
GRANT ALL ON SEQUENCE cultural_type_culttype_id_seq TO postgres;
GRANT ALL ON SEQUENCE cultural_type_culttype_id_seq TO fsp_edit;
GRANT ALL ON SEQUENCE cultural_type_culttype_id_seq TO fsp_admin;


--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 194
-- Name: firebreak_line; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE firebreak_line FROM PUBLIC;
REVOKE ALL ON TABLE firebreak_line FROM postgres;
GRANT ALL ON TABLE firebreak_line TO postgres;
GRANT SELECT ON TABLE firebreak_line TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE firebreak_line TO fsp_edit;
GRANT ALL ON TABLE firebreak_line TO fsp_admin;


--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 193
-- Name: firebreak_line_fbkln_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE firebreak_line_fbkln_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE firebreak_line_fbkln_id_seq FROM postgres;
GRANT ALL ON SEQUENCE firebreak_line_fbkln_id_seq TO postgres;
GRANT ALL ON SEQUENCE firebreak_line_fbkln_id_seq TO fsp_edit;
GRANT ALL ON SEQUENCE firebreak_line_fbkln_id_seq TO fsp_admin;


--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 232
-- Name: forest_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE forest_type FROM PUBLIC;
REVOKE ALL ON TABLE forest_type FROM postgres;
GRANT ALL ON TABLE forest_type TO postgres;
GRANT SELECT ON TABLE forest_type TO fsp_read;
GRANT ALL ON TABLE forest_type TO fsp_admin;


--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 196
-- Name: habitat_enhancement_area; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE habitat_enhancement_area FROM PUBLIC;
REVOKE ALL ON TABLE habitat_enhancement_area FROM postgres;
GRANT ALL ON TABLE habitat_enhancement_area TO postgres;
GRANT SELECT ON TABLE habitat_enhancement_area TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE habitat_enhancement_area TO fsp_edit;
GRANT ALL ON TABLE habitat_enhancement_area TO fsp_admin;


--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 195
-- Name: habitat_enhancement_area_habenharea_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE habitat_enhancement_area_habenharea_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE habitat_enhancement_area_habenharea_id_seq FROM postgres;
GRANT ALL ON SEQUENCE habitat_enhancement_area_habenharea_id_seq TO postgres;
GRANT ALL ON SEQUENCE habitat_enhancement_area_habenharea_id_seq TO fsp_edit;
GRANT ALL ON SEQUENCE habitat_enhancement_area_habenharea_id_seq TO fsp_admin;


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 198
-- Name: habitat_enhancement_point; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE habitat_enhancement_point FROM PUBLIC;
REVOKE ALL ON TABLE habitat_enhancement_point FROM postgres;
GRANT ALL ON TABLE habitat_enhancement_point TO postgres;
GRANT SELECT ON TABLE habitat_enhancement_point TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE habitat_enhancement_point TO fsp_edit;
GRANT ALL ON TABLE habitat_enhancement_point TO fsp_admin;


--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 197
-- Name: habitat_enhancement_point_habenhpt_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE habitat_enhancement_point_habenhpt_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE habitat_enhancement_point_habenhpt_id_seq FROM postgres;
GRANT ALL ON SEQUENCE habitat_enhancement_point_habenhpt_id_seq TO postgres;
GRANT ALL ON SEQUENCE habitat_enhancement_point_habenhpt_id_seq TO fsp_edit;
GRANT ALL ON SEQUENCE habitat_enhancement_point_habenhpt_id_seq TO fsp_admin;


--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 199
-- Name: habitat_enhancement_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE habitat_enhancement_type FROM PUBLIC;
REVOKE ALL ON TABLE habitat_enhancement_type FROM postgres;
GRANT ALL ON TABLE habitat_enhancement_type TO postgres;
GRANT SELECT ON TABLE habitat_enhancement_type TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE habitat_enhancement_type TO fsp_edit;
GRANT ALL ON TABLE habitat_enhancement_type TO fsp_admin;


--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 202
-- Name: harvest_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE harvest_type FROM PUBLIC;
REVOKE ALL ON TABLE harvest_type FROM postgres;
GRANT ALL ON TABLE harvest_type TO postgres;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE harvest_type TO fsp_edit;
GRANT ALL ON TABLE harvest_type TO fsp_admin;
GRANT SELECT,REFERENCES ON TABLE harvest_type TO fsp_read;


--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 204
-- Name: land_area; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE land_area FROM PUBLIC;
REVOKE ALL ON TABLE land_area FROM postgres;
GRANT ALL ON TABLE land_area TO postgres;
GRANT SELECT ON TABLE land_area TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE land_area TO fsp_edit;
GRANT ALL ON TABLE land_area TO fsp_admin;


--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 203
-- Name: land_area_landarea_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE land_area_landarea_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE land_area_landarea_id_seq FROM postgres;
GRANT ALL ON SEQUENCE land_area_landarea_id_seq TO postgres;
GRANT ALL ON SEQUENCE land_area_landarea_id_seq TO fsp_edit;
GRANT ALL ON SEQUENCE land_area_landarea_id_seq TO fsp_admin;


--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 228
-- Name: planned_activity; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE planned_activity FROM PUBLIC;
REVOKE ALL ON TABLE planned_activity FROM postgres;
GRANT ALL ON TABLE planned_activity TO postgres;
GRANT SELECT ON TABLE planned_activity TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE planned_activity TO fsp_edit;
GRANT ALL ON TABLE planned_activity TO fsp_admin;


--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 227
-- Name: planned_activity_plannedact_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE planned_activity_plannedact_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE planned_activity_plannedact_id_seq FROM postgres;
GRANT ALL ON SEQUENCE planned_activity_plannedact_id_seq TO postgres;
GRANT ALL ON SEQUENCE planned_activity_plannedact_id_seq TO fsp_edit;
GRANT ALL ON SEQUENCE planned_activity_plannedact_id_seq TO fsp_admin;


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 206
-- Name: recreation_point; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE recreation_point FROM PUBLIC;
REVOKE ALL ON TABLE recreation_point FROM postgres;
GRANT ALL ON TABLE recreation_point TO postgres;
GRANT SELECT ON TABLE recreation_point TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE recreation_point TO fsp_edit;
GRANT ALL ON TABLE recreation_point TO fsp_admin;


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 205
-- Name: recreation_point_recpt_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE recreation_point_recpt_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE recreation_point_recpt_id_seq FROM postgres;
GRANT ALL ON SEQUENCE recreation_point_recpt_id_seq TO postgres;
GRANT ALL ON SEQUENCE recreation_point_recpt_id_seq TO fsp_edit;
GRANT ALL ON SEQUENCE recreation_point_recpt_id_seq TO fsp_admin;


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 207
-- Name: recreation_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE recreation_type FROM PUBLIC;
REVOKE ALL ON TABLE recreation_type FROM postgres;
GRANT ALL ON TABLE recreation_type TO postgres;
GRANT SELECT ON TABLE recreation_type TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE recreation_type TO fsp_edit;
GRANT ALL ON TABLE recreation_type TO fsp_admin;


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 209
-- Name: road_line; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE road_line FROM PUBLIC;
REVOKE ALL ON TABLE road_line FROM postgres;
GRANT ALL ON TABLE road_line TO postgres;
GRANT SELECT ON TABLE road_line TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE road_line TO fsp_edit;
GRANT ALL ON TABLE road_line TO fsp_admin;


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 208
-- Name: road_line_roadln_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE road_line_roadln_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE road_line_roadln_id_seq FROM postgres;
GRANT ALL ON SEQUENCE road_line_roadln_id_seq TO postgres;
GRANT ALL ON SEQUENCE road_line_roadln_id_seq TO fsp_edit;
GRANT ALL ON SEQUENCE road_line_roadln_id_seq TO fsp_admin;


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 210
-- Name: road_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE road_type FROM PUBLIC;
REVOKE ALL ON TABLE road_type FROM postgres;
GRANT ALL ON TABLE road_type TO postgres;
GRANT SELECT ON TABLE road_type TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE road_type TO fsp_edit;
GRANT ALL ON TABLE road_type TO fsp_admin;


--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 214
-- Name: stand_area; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE stand_area FROM PUBLIC;
REVOKE ALL ON TABLE stand_area FROM postgres;
GRANT ALL ON TABLE stand_area TO postgres;
GRANT SELECT ON TABLE stand_area TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE stand_area TO fsp_edit;
GRANT ALL ON TABLE stand_area TO fsp_admin;


--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 231
-- Name: stand_area_history; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE stand_area_history FROM PUBLIC;
REVOKE ALL ON TABLE stand_area_history FROM postgres;
GRANT ALL ON TABLE stand_area_history TO postgres;
GRANT SELECT ON TABLE stand_area_history TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE stand_area_history TO fsp_edit;
GRANT ALL ON TABLE stand_area_history TO fsp_admin;


--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 230
-- Name: stand_area_history_standareahist_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE stand_area_history_standareahist_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE stand_area_history_standareahist_id_seq FROM postgres;
GRANT ALL ON SEQUENCE stand_area_history_standareahist_id_seq TO postgres;
GRANT SELECT,UPDATE ON SEQUENCE stand_area_history_standareahist_id_seq TO fsp_admin;
GRANT SELECT,UPDATE ON SEQUENCE stand_area_history_standareahist_id_seq TO fsp_edit;


--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 213
-- Name: stand_area_standarea_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE stand_area_standarea_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE stand_area_standarea_id_seq FROM postgres;
GRANT ALL ON SEQUENCE stand_area_standarea_id_seq TO postgres;
GRANT ALL ON SEQUENCE stand_area_standarea_id_seq TO fsp_edit;
GRANT ALL ON SEQUENCE stand_area_standarea_id_seq TO fsp_admin;


--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 226
-- Name: stand_status; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE stand_status FROM PUBLIC;
REVOKE ALL ON TABLE stand_status FROM postgres;
GRANT ALL ON TABLE stand_status TO postgres;
GRANT SELECT ON TABLE stand_status TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE stand_status TO fsp_edit;
GRANT ALL ON TABLE stand_status TO fsp_admin;


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 225
-- Name: stand_status_standstatus_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE stand_status_standstatus_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE stand_status_standstatus_id_seq FROM postgres;
GRANT ALL ON SEQUENCE stand_status_standstatus_id_seq TO postgres;
GRANT ALL ON SEQUENCE stand_status_standstatus_id_seq TO fsp_edit;
GRANT ALL ON SEQUENCE stand_status_standstatus_id_seq TO fsp_admin;


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 215
-- Name: stocking_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE stocking_type FROM PUBLIC;
REVOKE ALL ON TABLE stocking_type FROM postgres;
GRANT ALL ON TABLE stocking_type TO postgres;
GRANT SELECT ON TABLE stocking_type TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE stocking_type TO fsp_edit;
GRANT ALL ON TABLE stocking_type TO fsp_admin;


--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 217
-- Name: stream; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE stream FROM PUBLIC;
REVOKE ALL ON TABLE stream FROM postgres;
GRANT ALL ON TABLE stream TO postgres;
GRANT SELECT ON TABLE stream TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE stream TO fsp_edit;
GRANT ALL ON TABLE stream TO fsp_admin;


--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 216
-- Name: stream_stream_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE stream_stream_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE stream_stream_id_seq FROM postgres;
GRANT ALL ON SEQUENCE stream_stream_id_seq TO postgres;
GRANT ALL ON SEQUENCE stream_stream_id_seq TO fsp_edit;
GRANT ALL ON SEQUENCE stream_stream_id_seq TO fsp_admin;


--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 212
-- Name: streamside_management_zone; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE streamside_management_zone FROM PUBLIC;
REVOKE ALL ON TABLE streamside_management_zone FROM postgres;
GRANT ALL ON TABLE streamside_management_zone TO postgres;
GRANT SELECT ON TABLE streamside_management_zone TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE streamside_management_zone TO fsp_edit;
GRANT ALL ON TABLE streamside_management_zone TO fsp_admin;


--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 211
-- Name: streamside_management_zone_smz_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE streamside_management_zone_smz_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE streamside_management_zone_smz_id_seq FROM postgres;
GRANT ALL ON SEQUENCE streamside_management_zone_smz_id_seq TO postgres;
GRANT ALL ON SEQUENCE streamside_management_zone_smz_id_seq TO fsp_edit;
GRANT ALL ON SEQUENCE streamside_management_zone_smz_id_seq TO fsp_admin;


--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 219
-- Name: tree; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE tree FROM PUBLIC;
REVOKE ALL ON TABLE tree FROM postgres;
GRANT ALL ON TABLE tree TO postgres;
GRANT SELECT ON TABLE tree TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE tree TO fsp_edit;
GRANT ALL ON TABLE tree TO fsp_admin;


--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 218
-- Name: tree_tree_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE tree_tree_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE tree_tree_id_seq FROM postgres;
GRANT ALL ON SEQUENCE tree_tree_id_seq TO postgres;
GRANT ALL ON SEQUENCE tree_tree_id_seq TO fsp_edit;
GRANT ALL ON SEQUENCE tree_tree_id_seq TO fsp_admin;


--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 229
-- Name: vw_stand_activity; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vw_stand_activity FROM PUBLIC;
REVOKE ALL ON TABLE vw_stand_activity FROM postgres;
GRANT ALL ON TABLE vw_stand_activity TO postgres;
GRANT SELECT ON TABLE vw_stand_activity TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE vw_stand_activity TO fsp_edit;
GRANT ALL ON TABLE vw_stand_activity TO fsp_admin;


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 233
-- Name: vw_stand_area_all; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vw_stand_area_all FROM PUBLIC;
REVOKE ALL ON TABLE vw_stand_area_all FROM postgres;
GRANT ALL ON TABLE vw_stand_area_all TO postgres;
GRANT SELECT ON TABLE vw_stand_area_all TO fsp_read;
GRANT ALL ON TABLE vw_stand_area_all TO fsp_admin;


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 221
-- Name: water_point; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE water_point FROM PUBLIC;
REVOKE ALL ON TABLE water_point FROM postgres;
GRANT ALL ON TABLE water_point TO postgres;
GRANT SELECT ON TABLE water_point TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE water_point TO fsp_edit;
GRANT ALL ON TABLE water_point TO fsp_admin;


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 220
-- Name: water_point_waterpoint_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE water_point_waterpoint_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE water_point_waterpoint_id_seq FROM postgres;
GRANT ALL ON SEQUENCE water_point_waterpoint_id_seq TO postgres;
GRANT ALL ON SEQUENCE water_point_waterpoint_id_seq TO fsp_edit;
GRANT ALL ON SEQUENCE water_point_waterpoint_id_seq TO fsp_admin;


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 222
-- Name: water_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE water_type FROM PUBLIC;
REVOKE ALL ON TABLE water_type FROM postgres;
GRANT ALL ON TABLE water_type TO postgres;
GRANT SELECT ON TABLE water_type TO fsp_read;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE water_type TO fsp_edit;
GRANT ALL ON TABLE water_type TO fsp_admin;


-- Completed on 2013-03-12 23:25:22 AKDT

--
-- PostgreSQL database dump complete
--

