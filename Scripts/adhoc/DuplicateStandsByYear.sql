select standareahist_id, standarea_id, geometry, stand_no,description, start_date, end_date, source from
(
select '999' AS standareahist_id, standarea_id, geometry, stand_no,description, start_date, now() as end_date, 'stand area' as source from stand_area 
union all
select standareahist_id, standarea_id, geometry, stand_no,description, start_date, end_date, 'stand area history' as source from stand_area_history 
) sub
where ('2013-01-01' between sub.start_date and sub.end_date)  
order by sub.end_date desc;

--select distinct(standarea_id) from stand_area_history;

-- update stand_area set start_date = '2012-04-01 00:00:01+00' where standarea_id=22;

--update stand_area_history set start_date = '2011-04-01 00:00:01+00' where standareahist_id = 104;
--update stand_area_history set end_date = '2012-12-01 00:00:00+00' where standareahist_id = 104;

-- delete from stand_area_history where standareahist_id in (119);
-- delete from stand_area where standarea_id = 20;
 select standarea_id, truncate from stand_area_history
 --group by standarea_id, truncate(event_time, 'YYYYMMDD HH24MI')