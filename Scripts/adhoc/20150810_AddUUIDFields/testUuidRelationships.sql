select a.*, p.* from activity_area a
inner join planned_activity p
on a.plannedact_uuid = p.plannedact_uuid;

select  p.*, l.* from planned_activity p 
join land_area l 
on p.landarea_id = l.landarea_id;

select * from planned_activity;

select  p.*, s.* from planned_activity p 
join stand_area s
on p.standarea_uuid = s.standarea_uuid;

alter table stand_status add column stand_no  integer;

update public.stand_status  p set stand_no = s.stand_id
from staging.stand_status s
where p.standstatus_id = s.standstatus_id;

update public.stand_status p set standarea_uuid = s.standarea_uuid
from public.stand_area s
where p.stand_no = s.stand_no;


select * from public.stand_area a
left outer join stand_status s
on a.standarea_uuid = s.standarea_uuid;

select * from public.stand_status;
select * from staging.stand_status;

select t2.* 
into stand_status_temp
from public.stand_area t1
inner join public.stand_status t2
on t1.stand_no  = t2.stand_no;

delete  from public.stand_status;

insert into public.stand_status
select * from stand_status_temp;

INSERT INTO public.stand_status(
            standstatus_id, year, recommended_treatment, notes, damage_severity, 
            created_by_id, standarea_uuid)
select standstatus_id, year, recommended_treatment, notes, damage_severity, 
            created_by_id, standarea_uuid from stand_status_temp;

drop table stand_status_temp;