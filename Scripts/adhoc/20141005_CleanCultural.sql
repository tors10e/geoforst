/******************************************
*  Cleanup cultural point/types
******************************************/

UPDATE CULTURAL_POINT 
SET culttype_id = 6
WHERE culttype_id in (2, 4);

DELETE FROM cultural_type where culttype_id in (2, 4);

-- Create Table: public.hazard_type

CREATE TABLE public.hazard_type
(
  hazardtype_id SERIAL NOT NULL,
  hazardtype_cd character(3),
  hazardtype_dsc character varying(50),
  CONSTRAINT pk_hazard_type_id PRIMARY KEY (hazardtype_id),
  CONSTRAINT hazard_type_hazardtype_cd_key UNIQUE (hazardtype_cd),
  CONSTRAINT hazard_type_hazardtype_dsc_key UNIQUE (hazardtype_dsc)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.hazard_type
  OWNER TO postgres;
GRANT ALL ON TABLE public.hazard_type TO postgres;
GRANT SELECT ON TABLE public.hazard_type TO fsp_read;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE public.hazard_type TO fsp_edit;
GRANT ALL ON TABLE public.hazard_type TO fsp_admin;

CREATE INDEX idx_hazard_type_hazardtype_cd
  ON public.hazard_type
  USING btree
  (hazardtype_cd COLLATE pg_catalog."default");

CREATE INDEX idx_hazard_type_hazardtype_id
  ON public.hazard_type
  USING btree
  (hazardtype_id);

-- Create hazards table.

CREATE TABLE public.hazard
(
  hazard_id serial NOT NULl,
  geometry geometry(Point,2163),
  hazardtype_id integer,
  description character varying,
  created_by_id integer,
  create_date date,
  CONSTRAINT hazard_pk PRIMARY KEY (hazard_id),
  CONSTRAINT fk_hazard_hazard_type FOREIGN KEY (hazardtype_id)
      REFERENCES public.hazard_type (hazardtype_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.hazard
  OWNER TO postgres;
GRANT ALL ON TABLE public.hazard TO postgres;
GRANT SELECT ON TABLE public.hazard TO fsp_read;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE public.hazard TO fsp_edit;
GRANT ALL ON TABLE public.hazard TO fsp_admin;

CREATE INDEX idx_hazard_hazard_id
  ON public.hazard
  USING btree
  (hazard_id);

CREATE INDEX sidx_hazard_geometry
  ON public.hazard
  USING gist
  (geometry);


-- Create hazard types
INSERT INTO public.hazard_type VALUES(1, 'wl', 'Well');
INSERT INTO public.hazard_type VALUES(2, 'sng', 'Snag');

-- Move wells over to hazards table.
INSERT INTO public.hazard(geometry, hazardtype_id, description, created_by_id)
select geometry, 1, description, created_by_id 
FROM public.cultural_point  
WHERE culttype_id = 1 
	AND description NOT LIKE '%Stone%'; -- The mountain well is not a hazard but a historic feature.

-- Delete wells from cultural_point and type tables.
DELETE FROM public.cultural_point WHERE culttype_id =1;
DELETE FROM public.cultural_type WHERE culttype_id=1;




