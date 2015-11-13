-- Function: public.reset_stand_area_startdate()

--DROP TRIGGER trg_reset_stand_area_startdate ON public.stand_area;
 
--DROP FUNCTION public.reset_stand_area_startdate();

CREATE OR REPLACE FUNCTION public.reset_startdate()
  RETURNS trigger AS
$$
BEGIN
  NEW.start_date = now();
  RETURN NEW;
END;
$$
  LANGUAGE plpgsql;
  
ALTER FUNCTION public.reset_startdate()
  OWNER TO postgres;



CREATE TRIGGER trg_reset_stand_area_startdate
  BEFORE UPDATE
  ON public.stand_area
  FOR EACH ROW
  EXECUTE PROCEDURE public.reset_startdate();
