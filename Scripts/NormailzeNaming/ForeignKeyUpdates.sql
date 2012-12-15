ALTER TABLE public.cultural_point
  ADD CONSTRAINT fk_cultural_point_cultural_type FOREIGN KEY (culttype_id) REFERENCES public.cultural_type (culttype_id)
   ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_cultural_point_cultural_type
  ON public.cultural_point(culttype_id);
