ALTER TABLE public.stand_area
  ADD COLUMN transaction_start_date timestamp with time zone DEFAULT now();


ALTER TABLE public.stand_area_history
  ADD COLUMN transaction_start_date timestamp with time zone;

  ALTER TABLE public.stand_area_history
  ADD COLUMN transaction_end_date timestamp with time zone DEFAULT now();

  -- Function: public.update_stand_area_history()

-- DROP FUNCTION public.update_stand_area_history();

CREATE OR REPLACE FUNCTION public.update_stand_area_history()
  RETURNS trigger AS
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
	    foresttype_id,
	    transaction_start_date,
	    transaction_end_date
        )
        VALUES(
	    nextval('stand_area_history_standareahist_id_seq'),
            old.standarea_id,
            old.geometry,
            old.stand_no,
            old.description,
            current_timestamp,
            old.start_date,
	    old.foresttype_id,
	    old.transaction_start_date,
	    current_timestamp
        );
    RETURN null;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.update_stand_area_history()
  OWNER TO postgres;

update stand_area_history set transaction_start_date = start_date, transaction_end_date =  end_date;
