alter table land_area add column start_date date DEFAULT ('now'::text)::date;
alter table land_area add column transaction_start_date date DEFAULT ('now'::text)::date;
insert into land_area (start_date) values ('2009-09-01');

CREATE TABLE public.person
(
  person_id serial,
  name_last character varying(30) NOT NULL,
  name_first character varying(30) NOT NULL,
  address character varying(50),
  address_ext character varying(50),
  city character varying(30),
  state character(2),
  zip_code numeric(5,0),
  phone character varying(12),
  CONSTRAINT pk_person PRIMARY KEY (person_id),
  CONSTRAINT unq_name UNIQUE (name_last, name_first)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.person
  OWNER TO postgres;

GRANT ALL ON TABLE public.person TO postgres;
GRANT SELECT ON TABLE public.person TO fsp_read;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE public.person TO fsp_edit;
GRANT ALL ON TABLE public.person TO fsp_admin;

GRANT ALL ON TABLE public.person_person_id_seq TO postgres;
GRANT ALL ON TABLE public.person_person_id_seq TO fsp_edit;
GRANT ALL ON TABLE public.person_person_id_seq TO fsp_admin;


CREATE TABLE public.land_owner
(
  landowner_id serial,
  landarea_id integer,
  person_id integer,
  CONSTRAINT pk_land_owner PRIMARY KEY (landowner_id),
  CONSTRAINT fk_land_owner_land_area FOREIGN KEY (landarea_id)
      REFERENCES public.land_area (landarea_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_land_owner_person FOREIGN KEY (person_id)
      REFERENCES public.person (person_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.land_owner
  OWNER TO postgres;
GRANT ALL ON TABLE public.land_owner TO postgres;
GRANT SELECT ON TABLE public.land_owner TO fsp_read;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE public.land_owner TO fsp_edit;
GRANT ALL ON TABLE public.land_owner TO fsp_admin;

CREATE TABLE public.land_area_history
(
  landareahist_id serial,
  landarea_id integer,
  geometry geometry(Polygon,26917),
  description character varying(255),
  start_date date,
  end_date date DEFAULT ('now'::text)::date,
  transaction_start_date date,
  transaction_end_date date DEFAULT ('now'::text)::date,
  CONSTRAINT land_area_hist_pk PRIMARY KEY (landareahist_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.land_area_history
  OWNER TO postgres;
GRANT ALL ON TABLE public.land_area_history TO postgres;
GRANT SELECT ON TABLE public.land_area_history TO fsp_read;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE public.land_area_history TO fsp_edit;
GRANT ALL ON TABLE public.land_area_history TO fsp_admin;


CREATE INDEX idx_land_area_hist_landarea_id
  ON public.land_area_history
  USING btree
  (landareahist_id);


CREATE INDEX sidx_land_area_hist_geometry
  ON public.land_area_history
  USING gist
  (geometry);


CREATE OR REPLACE FUNCTION public.update_land_area_history()
  RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO land_area_history 
	(   landareahist_id,
            landarea_id,
            geometry,
            description,
            end_date,
            start_date,
	    transaction_start_date,
	    transaction_end_date
        )
        VALUES(
	    nextval('land_area_history_landareahist_id_seq'),
            old.landarea_id,
            old.geometry,
            old.description,
            current_timestamp,
            old.start_date,
	    old.transaction_start_date,
	    current_timestamp
        );
    RETURN null;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.update_land_area_history()
  OWNER TO postgres;


CREATE TRIGGER trg_reset_land_area_startdate
  BEFORE UPDATE
  ON public.land_area
  FOR EACH ROW
  EXECUTE PROCEDURE public.reset_startdate();

CREATE TRIGGER trg_truncate_land_area_history
  BEFORE TRUNCATE
  ON public.land_area
  FOR EACH STATEMENT
  EXECUTE PROCEDURE public.update_land_area_history();

  CREATE TRIGGER trg_update_land_history
  AFTER UPDATE OR DELETE
  ON public.land_area
  FOR EACH ROW
  EXECUTE PROCEDURE public.update_land_area_history();

  



