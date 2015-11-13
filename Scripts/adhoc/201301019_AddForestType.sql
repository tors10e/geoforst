ALTER TABLE public.stand_area_history ADD COLUMN foresttype_id integer;
ALTER TABLE public.stand_area ADD COLUMN foresttype_id integer;

CREATE OR REPLACE FUNCTION public.update_stand_area_history() RETURNS trigger AS
$BODY$
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
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF
COST 100;


ALTER TABLE public.stand_area
  ADD CONSTRAINT fk_stand_area_forest_type FOREIGN KEY (foresttype_id) REFERENCES public.forest_type (foresttype_id)
   ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_stand_area_forest_type
  ON public.stand_area(foresttype_id);

-- Add missing fk constraint.
  ALTER TABLE public.stand_status
  ADD CONSTRAINT fk_stand_status_stocking_type FOREIGN KEY (stockingtype_id) REFERENCES public.stocking_type (stockingtype_id)
   ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_stand_status_stocking_type
  ON public.stand_status(stockingtype_id);

  ALTER TABLE public.activity_area
  ADD CONSTRAINT fk_activity_area_activity_type FOREIGN KEY (acttype_id) REFERENCES public.activity_type (acttype_id)
   ON UPDATE NO ACTION ON DELETE NO ACTION;



