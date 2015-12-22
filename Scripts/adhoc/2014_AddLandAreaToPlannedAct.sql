ALTER TABLE public.planned_activity
   ADD COLUMN landarea_id integer;

update public.planned_activity set landarea_id = 1;

ALTER TABLE public.planned_activity
  ADD CONSTRAINT fk_planned_activity_land_area FOREIGN KEY (landarea_id) REFERENCES public.land_area (landarea_id)
   ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_planned_activity_land_area
  ON public.planned_activity(landarea_id);

