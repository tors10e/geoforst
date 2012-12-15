-- Table: public.activitytype
CREATE TABLE public.activity_type
(
  acttype_id integer NOT NULL,
  description text,
  CONSTRAINT activity_type_pkey PRIMARY KEY (acttype_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.activity_type
  OWNER TO postgres;


INSERT INTO public.activity_type (select * from public.activitytype); 
select count(*) from public.activity_type;
select count(*) from public.activitytype;

-- Table: public.control_point
CREATE TABLE public.control_point
(
  controlpt_id serial,
  geometry geometry(Point,26917),
  description character varying,
  x double precision,
  y double precision,
  status character varying,
  CONSTRAINT control_point_pk PRIMARY KEY (controlpt_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.control_point
  OWNER TO postgres;

CREATE INDEX control_point_geom_idx
  ON public.control_point
  USING gist
  (geometry);

insert into control_point (select * from controlpoint);
select count(*) from controlpoint;
select count(*) from control_point;

-- Table: public.cultural_point
CREATE TABLE public.cultural_point
(
  cultpt_id serial,
  geometry geometry(Point,26917),
  culttype_id integer,
  description character varying,
  CONSTRAINT cultural_point_pk PRIMARY KEY (cultpt_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.cultural_point
  OWNER TO postgres;

CREATE INDEX cultural_point_geom_idx
  ON public.cultural_point
  USING gist
  (geometry);

insert into public.cultural_point (select * from culturalpoint);
 select count(*) from public.culturalpoint;
 select count(*) from public.cultural_point;

-- Table: public.firebreak_line
CREATE TABLE public.firebreak_line
(
  fbkln_id serial,
  geometry geometry(LineString,26917),
  description character varying,
  length_meters double precision,
  CONSTRAINT firebreak_line_pk PRIMARY KEY (fbkln_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.firebreak_line
  OWNER TO postgres;


CREATE INDEX firebreak_line_geom_idx
  ON public.firebreak_line
  USING gist
  (geometry);

insert into public.firebreak_line (select * from public.firebreakline);
select count(*) from public.firebreakline;
select count(*) from public.firebreak_line;

-- Table: public.habitatenhancementarea
CREATE TABLE public.habitat_enhancement_area
(
  habenharea_id serial,
  geometry geometry(Polygon,26917),
  habenhtype_id integer,
  description character varying,
  CONSTRAINT habitat_enhancement_area_pk PRIMARY KEY (habenharea_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.habitat_enhancement_area
  OWNER TO postgres;

CREATE INDEX habitat_enhancement_area_geom_idx
  ON public.habitat_enhancement_area
  USING gist
  (geometry);

insert into public.habitat_enhancement_area (select * from public.habitatenhancementarea);
select count(*) from public.habitatenhancementarea;
select count(*) from public.habitat_enhancement_area;

-- Table: public.habitatenhancementpoint
CREATE TABLE public.habitat_enhancement_point
(
  habenhpt_id serial,
  geometry geometry(Point,26917),
  habenhtype_id integer,
  descripition character varying,
  CONSTRAINT habitat_enhancement_point_pk PRIMARY KEY (habenhpt_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.habitat_enhancement_point
  OWNER TO postgres;

CREATE INDEX habitat_enhancement_point_geom_idx
  ON public.habitat_enhancement_point
  USING gist
  (geometry);

insert into public.habitat_enhancement_point (select * from public.habitatenhancementpoint);
select count(*) from public.habitatenhancementpoint;
select count(*) from public.habitat_enhancement_point;

-- Table: public.habitat_enhancement_type
CREATE TABLE public.habitat_enhancement_type
(
  habenhtype_id integer NOT NULL,
  description varchar(255) NULL,
  CONSTRAINT habitat_enhancement_type_pkey PRIMARY KEY (habenhtype_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.habitat_enhancement_type
  OWNER TO postgres;

insert into public.habitat_enhancement_type (select * from public.habitatenhancementtype);
select count(*) from public.habitatenhancementtype;
select count(*) from public.habitat_enhancement_type;

-- Table: public.harvestarea
CREATE TABLE public.harvest_area
(
  harvestarea_id serial,
  geometry geometry(MultiPolygon,26917),
  activity_date varchar(25),
  harvesttype_id integer,
  description varchar(255),
  CONSTRAINT harvest_area_pk PRIMARY KEY (harvestarea_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.harvest_area
  OWNER TO postgres;

CREATE INDEX harvest_area_geom_idx
  ON public.harvest_area
  USING gist
  (geometry);

insert into public.harvest_area (select * from public.harvestarea);
select count(*) from public.harvestarea;
select count(*) from public.harvest_area;

-- Table: public.harvest_type
CREATE TABLE public.harvest_type
(
  harvesttype_id integer NOT NULL,
  description varchar(255), 
  CONSTRAINT harvest_type_pkey PRIMARY KEY (harvesttype_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.harvest_type
  OWNER TO postgres;

insert into public.harvest_type (select * from public.harvesttype);
select count(*) from public.harvesttype;
select count(*) from public.harvest_type;

-- Table: public.land_area
CREATE TABLE public.land_area
(
  landarea_id serial,
  geometry geometry(Polygon,26917),
  description varchar(255),
  CONSTRAINT land_area_pk PRIMARY KEY (landarea_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.land_area
  OWNER TO postgres;

CREATE INDEX land_area_geom_idx
  ON public.land_area
  USING gist
  (geometry);

insert into public.land_area (select * from public.landarea);
select count(*) from public.landarea;
select count(*) from public.land_area;

-- Table: public.recreation_point
CREATE TABLE public.recreation_point
(
  recpt_id serial,
  geometry geometry(Point,26917),
  rectype_id integer,
  description varchar(255),
  CONSTRAINT recreation_point_pk PRIMARY KEY (recpt_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.recreation_point
  OWNER TO postgres;

CREATE INDEX recreation_point_geom_idx
  ON public.recreation_point
  USING gist
  (geometry);

insert into public.recreation_point (select * from public.recreationpoint);
select count(*) from public.recreationpoint;
select count(*) from public.recreation_point;

-- Table: public.recreation_type
CREATE TABLE public.recreation_type
(
  rectype_id integer NOT NULL,
  description varchar(255) NULL,
  CONSTRAINT recreation_type_pkey PRIMARY KEY (rectype_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.recreation_type
  OWNER TO postgres;

insert into public.recreation_type (select * from public.recreationtype);
select count(*) from public.recreationtype;
select count(*) from public.recreation_type;

-- Table: public.road_line
CREATE TABLE public.road_line
(
  roadln_id serial,
  geometry geometry(MultiLineString,26917),
  roadtype_id integer,
  description varchar(255),
  access_status varchar(50),
  surface varchar(50),
  road_name varchar(25),
  CONSTRAINT road_line_pk PRIMARY KEY (roadln_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.road_line
  OWNER TO postgres;

CREATE INDEX road_line_geom_idx
  ON public.road_line
  USING gist
  (geometry);

insert into public.road_line(select * from public.roadline);
select count(*) from public.roadline;
select count(*) from public.road_line;

-- Table: public.roadtype
CREATE TABLE public.road_type
(
  roadtype_id integer NOT NULL,
  description varchar(255) NULL,
  CONSTRAINT road_type_pkey PRIMARY KEY (roadtype_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.road_type
  OWNER TO postgres;

insert into public.road_type (select * from public.roadtype);
select count(*) from public.roadtype;
select count(*) from public.road_type;

-- Table: public.streamside_management_zone
CREATE TABLE public.streamside_management_zone
(
  smz_id serial,
  geometry geometry(MultiPolygon,26917),
  id integer,
  shape_leng double precision,
  et_id varchar(255),
  shape_area double precision,
  CONSTRAINT streamside_mgt_zone_pk PRIMARY KEY (smz_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.streamside_management_zone
  OWNER TO postgres;

CREATE INDEX streamside_mgt_zone_geom_idx
  ON public.streamside_management_zone
  USING gist
  (geometry);

insert into public.streamside_management_zone(select * from public.smz);
select count(*) from public.smz;
select count(*) from public.streamside_management_zone;

-- Table: public.stand_activity

-- DROP TABLE public.stand_activity;

CREATE TABLE public.stand_activity
(
  standact_id serial,
  standarea_id integer,
  acttype_id integer,
  planned_date date,
  completed_date date,
  description varchar(255),
  notes varchar(255),
  revenue double precision,
  CONSTRAINT stand_activity_pkey PRIMARY KEY (standact_id),
  CONSTRAINT fk_standactivity_activity_type FOREIGN KEY (acttype_id)
      REFERENCES public.activity_type (acttype_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.stand_activity
  OWNER TO postgres;

insert into public.stand_activity(select * from public.standactivity);
select count(*) from public.standactivity;
select count(*) from public.stand_activity;

-- Table: public.stand_area

CREATE TABLE public.stand_area
(
  standarea_id serial,
  geometry geometry(Polygon,26917),
  stand_no integer,
  description varchar(255),
  CONSTRAINT stand_area_pk PRIMARY KEY (standarea_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.stand_area
  OWNER TO postgres;

CREATE INDEX stand_area_geom_idx
  ON public.stand_area
  USING gist
  (geometry);

insert into public.stand_area(select * from public.standarea);
select count(*) from public.standarea;
select count(*) from public.stand_area;

-- Table: public.stockingtype
CREATE TABLE public.stocking_type
(
  stockingtype_id integer NOT NULL,
  description varchar(255),
  CONSTRAINT stocking_type_pkey PRIMARY KEY (stockingtype_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.stocking_type
  OWNER TO postgres;

insert into public.stocking_type(select * from public.stockingtype);
select count(*) from public.stockingtype;
select count(*) from public.stocking_type;

-- Table: public.stream
CREATE TABLE public.stream
(
  stream_id serial,
  geometry geometry(LineString,26917),
  shape_leng varchar(25),
  stream_type varchar(25),
  stream_name varchar(25),
  CONSTRAINT stream_pk PRIMARY KEY (stream_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.stream
  OWNER TO postgres;

CREATE INDEX stream_geom_idx
  ON public.stream
  USING gist
  (geometry);

insert into public.stream(select * from public.streams);
select count(*) from public.streams;
select count(*) from public.stream;

-- Table: public.treepoint
CREATE TABLE public.tree
(
  tree_id serial,
  geometry geometry(Point,26917),
  specie varchar(50),
  start_year char(4),
  CONSTRAINT tree_pk PRIMARY KEY (tree_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.tree
  OWNER TO postgres;

CREATE INDEX tree_geom_idx
  ON public.tree
  USING gist
  (geometry);

insert into public.tree(select * from public.treepoint);
select count(*) from public.treepoint;
select count(*) from public.tree;

-- Table: public.waterpoint
CREATE TABLE public.water_point
(
  waterpoint_id serial,
  geometry geometry(Point,26917),
  watertype_id integer,
  description varchar(255),
  CONSTRAINT water_point_pk PRIMARY KEY (waterpoint_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.water_point
  OWNER TO postgres;

CREATE INDEX water_point_geom_idx
  ON public.water_point
  USING gist
  (geometry);

insert into public.water_point(select * from public.waterpoint);
select count(*) from public.waterpoint;
select count(*) from public.water_point;

-- Table: public.water_type
CREATE TABLE public.water_type
(
  watertype_id integer NOT NULL,
  description varchar(255),
  CONSTRAINT water_type_pkey PRIMARY KEY (watertype_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.water_type
  OWNER TO postgres;

insert into public.water_type(select * from public.watertype);
select count(*) from public.watertype;
select count(*) from public.water_type;

-- Table: CulturalType
CREATE TABLE cultural_type ( 
   culttype_id serial,
   culttype_cd char(3),
   description varchar(50) 
);
ALTER TABLE public.cultural_type
  ADD CONSTRAINT pk_cultural_type_id PRIMARY KEY (culttype_id);


INSERT INTO cultural_type (culttype_id, culttype_cd, description) VALUES (1, 'abw', 'Abandoned Well');
INSERT INTO cultural_type (culttype_id, culttype_cd, description) VALUES (2,'hms', 'Historic Homesite (Abandoned)');
INSERT INTO cultural_type (culttype_id, culttype_cd, description) VALUES (3, 'bdg','Building');





-- Drop old tables
/*
DROP TABLE public.controlpoint;
DROP TABLE public.culturalpoint;
DROP TABLE public.firebreakline;
DROP TABLE public.habitatenhancementarea;
DROP TABLE public.habitatenhancementpoint;
DROP TABLE public.harvestarea;
DROP TABLE public.landarea;
DROP TABLE public.recreationpoint;
DROP TABLE public.roadline;
DROP TABLE public.smz;
DROP TABLE public.standactivity;
DROP TABLE public.standarea;
DROP TABLE public.streams;
DROP TABLE public.treepoint;
DROP TABLE public.waterpoint;
DROP TABLE public.watertype;
DROP TABLE public.activitytype;
DROP TABLE public.stockingtype;
DROP TABLE public.roadtype;
DROP TABLE public.harvesttype;
DROP TABLE public.recreationtype;
DROP TABLE public.habitatenhancementtype;
*/



