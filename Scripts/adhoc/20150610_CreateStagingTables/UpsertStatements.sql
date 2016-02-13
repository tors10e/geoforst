LOCK TABLE p.land_area IN EXCLUSIVE MODE;

-- s for staging p for public.

-- Update existing records
UPDATE public.land_area p
SET
	geometry = s.geometry, 
	description = s.description, 
	start_date= s.start_date, 
	transaction_start_date = s.transaction_start_date
FROM staging.land_area s
WHERE s.name = p.name
	and s.created_by_id = p.created_by_id;

-- Insert new records
INSERT INTO public.land_area(geometry, description, start_date, transaction_start_date, 
       created_by_id, name)
SELECT s.geometry, s.description, s.start_date, s.transaction_start_date, 
       s.created_by_id, s.name
FROM staging.land_area s
  LEFT OUTER JOIN public.land_area p 
	on s.name = p.name
	and s.created_by_id = p.created_by_id
WHERE p.name IS NULL
 AND s.name IS NOT NULL
 AND s.created_by_id IS NOT NULL;

-- Delete deleted records.
DELETE
FROM public.land_area p
WHERE (name, created_by_id) not in (select name, created_by_id from staging.land_area where name is not null)
	AND created_by_id in (select distinct(created_by_id) from staging.land_area); 

commit;