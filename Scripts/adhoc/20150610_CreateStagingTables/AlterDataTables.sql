 drop constraint unq_land_area;
ALTER TABLE public.land_area
   ALTER COLUMN created_by_id SET NOT NULL;
ALTER TABLE public.land_area
   ALTER COLUMN name SET NOT NULL;
ALTER TABLE public.land_area
  ADD CONSTRAINT unq_land_area UNIQUE (name, created_by_id);

