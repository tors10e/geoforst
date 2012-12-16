ALTER TABLE public.cultural_point
  ADD CONSTRAINT fk_cultural_point_cultural_type FOREIGN KEY (culttype_id) REFERENCES public.cultural_type (culttype_id)
   ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_cultural_point_cultural_type
  ON public.cultural_point(culttype_id);


ALTER TABLE public.habitat_enhancement_area
  ADD CONSTRAINT fk_hab_enh_area_hab_enh_type FOREIGN KEY (habenhtype_id) REFERENCES public.habitat_enhancement_type (habenhtype_id)
   ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_hab_enh_area_hab_enh_type
  ON public.habitat_enhancement_area(habenhtype_id);

ALTER TABLE public.habitat_enhancement_point
  ADD CONSTRAINT fk_hab_enh_pt_hab_enh_type FOREIGN KEY (habenhtype_id) REFERENCES public.habitat_enhancement_type (habenhtype_id)
   ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_hab_enh_pt_hab_enh_type
  ON public.habitat_enhancement_point(habenhtype_id);


ALTER TABLE public.harvest_area
  ADD CONSTRAINT fk_harvest_area_harvest_type FOREIGN KEY (harvesttype_id) REFERENCES public.harvest_type (harvesttype_id)
   ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_harvest_area_harvest_type
  ON public.harvest_area(harvesttype_id);

ALTER TABLE public.recreation_point
  ADD CONSTRAINT fk_recreation_point_recreation_type FOREIGN KEY (rectype_id) REFERENCES public.recreation_type (rectype_id)
   ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_recreation_point_recreation_type
  ON public.recreation_point(rectype_id);


ALTER TABLE public.road_line
  ADD CONSTRAINT fk_road_line_road_type FOREIGN KEY (roadtype_id) REFERENCES public.road_type (roadtype_id)
   ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_road_line_road_type
  ON public.road_line(roadtype_id);

ALTER TABLE public.water_point
  ADD CONSTRAINT fk_water_point_water_type FOREIGN KEY (watertype_id) REFERENCES public.water_type (watertype_id)
   ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_water_point_water_type
  ON public.water_point(watertype_id);


