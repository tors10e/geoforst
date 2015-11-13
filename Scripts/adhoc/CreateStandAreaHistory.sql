ALTER TABLE public.stand_area
  ADD COLUMN start_date timestamp default current_timestamp;


CREATE TABLE stand_area_history
(
  standareahist_id serial,
  standarea_id integer,
  geometry geometry(Polygon,26917),
  stand_no integer,
  description character varying(255),
  end_date timestamp with time zone,
  start_date timestamp with time zone DEFAULT now(),
  CONSTRAINT stand_area_hist_pk PRIMARY KEY (standareahist_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE stand_area_history
  OWNER TO postgres;
GRANT ALL ON TABLE stand_area_history TO postgres;
GRANT SELECT ON TABLE stand_area_history TO fsp_read;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE stand_area_history TO fsp_edit;
GRANT ALL ON TABLE stand_area_history TO fsp_admin;

-- Index: stand_area_history_history_geom_idx

-- DROP INDEX stand_area_history_history_geom_idx;

CREATE INDEX stand_area_hist_geom_idx
  ON stand_area_history
  USING gist
  (geometry);


CREATE OR REPLACE FUNCTION update_stand_area_history() RETURNS trigger AS
$$
BEGIN
    INSERT INTO stand_area_history 
        VALUES(
	    nextval('stand_area_history_standareahist_id_seq'),
            old.standarea_id,
            old.geometry,
            old.stand_no,
            old.description,
            current_timestamp,
            old.start_date
        );
    RETURN null;
END;
$$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS trg_update_stand_history on stand_area;

CREATE TRIGGER trg_update_stand_history
    AFTER UPDATE OR DELETE ON stand_area
    FOR EACH ROW
    EXECUTE PROCEDURE update_stand_area_history();


drop trigger if exists trg_truncate_stand_area_history on stand_area;

CREATE TRIGGER trg_truncate_stand_area_history
    BEFORE TRUNCATE ON stand_area
    FOR EACH STATEMENT
    EXECUTE PROCEDURE update_stand_area_history();

GRANT SELECT, UPDATE ON TABLE public.stand_area_history_standareahist_id_seq TO GROUP fsp_admin;
GRANT SELECT, UPDATE ON TABLE public.stand_area_history_standareahist_id_seq TO GROUP fsp_edit;

