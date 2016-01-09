
ALTER TABLE public.stand_activity RENAME standact_id  TO plannedact_id;
ALTER TABLE public.stand_activity
  RENAME TO planned_activity;
ALTER TABLE public.planned_activity
  DROP CONSTRAINT fk_standactivity_activity_type;
ALTER TABLE public.planned_activity
  ADD CONSTRAINT fk_standactivity_activity_type FOREIGN KEY (acttype_id)
      REFERENCES public.activity_type (acttype_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE public.harvest_area RENAME harvestarea_id  TO activityarea_id;
ALTER TABLE public.harvest_area RENAME harvesttype_id  TO acttype_id;
ALTER TABLE public.harvest_area
  ADD COLUMN revenue money;
ALTER TABLE public.harvest_area
  ADD COLUMN plannedact_id integer;
ALTER TABLE public.harvest_area
  ADD COLUMN standact_id integer;
ALTER TABLE public.harvest_area
  RENAME TO activity_area;
  
ALTER TABLE public.activity_area
  DROP CONSTRAINT fk_harvest_area_harvest_type;
ALTER TABLE public.activity_area
  ADD CONSTRAINT fk_stand_area FOREIGN KEY (standact_id) REFERENCES public.stand_activity (standact_id) ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER SEQUENCE public.stand_activity_standact_id_seq
  RENAME TO planned_activity_plannedact_id_seq;

ALTER SEQUENCE public.harvest_area_harvestarea_id_seq
  RENAME TO activity_area_activityarea_id_seq;

  ALTER TABLE public.planned_activity
   ALTER COLUMN plannedact_id SET DEFAULT nextval('planned_activity_plannedact_id_seq'::regclass);
ALTER TABLE public.planned_activity
  DROP CONSTRAINT fk_standactivity_activity_type;
ALTER TABLE public.planned_activity
  ADD CONSTRAINT fk_standactivity_activity_type FOREIGN KEY (acttype_id)
      REFERENCES public.activity_type (acttype_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE public.activity_area
   ALTER COLUMN activityarea_id SET DEFAULT nextval('activity_area_activityarea_id_seq'::regclass);
ALTER TABLE public.activity_area
  DROP CONSTRAINT fk_stand_area;
ALTER TABLE public.activity_area
  ADD CONSTRAINT fk_stand_area FOREIGN KEY (standact_id)
      REFERENCES public.planned_activity (plannedact_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

  


