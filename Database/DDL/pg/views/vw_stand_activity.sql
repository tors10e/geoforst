-- View: public.vw_stand_activity

-- DROP VIEW public.vw_stand_activity;

CREATE OR REPLACE VIEW public.vw_stand_activity AS 
 SELECT stand_area.geometry, stand_area.stand_no, stand_area.description, 
    stand_area.standarea_id, stand_activity.planned_date, 
    stand_activity.completed_date, 
    stand_activity.description AS activity_description, stand_activity.notes, 
    stand_activity.revenue, stand_activity.standact_id, 
    activity_type.acttype_dsc
   FROM stand_activity, stand_area, activity_type
  WHERE stand_activity.standarea_id = stand_area.standarea_id AND activity_type.acttype_id = stand_activity.acttype_id
  ORDER BY stand_area.stand_no;

ALTER TABLE public.vw_stand_activity
  OWNER TO postgres;

