ALTER TABLE public.planned_activity
  ADD COLUMN standarea_id integer;


UPDATE planned_activity AS p
SET standarea_id = s.standarea_id
FROM stand_area AS s
WHERE p.stand_no = s.stand_no;

ALTER TABLE public.planned_activity
DROP COLUMN stand_no;

