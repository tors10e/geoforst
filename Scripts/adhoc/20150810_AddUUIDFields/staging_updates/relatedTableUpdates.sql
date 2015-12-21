

update soil_test_recommendation  s
set soiltest_uuid = p.soiltest_uuid
from soil_test p
where s.soiltest_id = p.soiltest_id;


update activity_area  t1
set plannedact_uuid = t2.plannedact_uuid
from planned_activity t2
where t1.plannedact_id = t2.plannedact_id;

alter table planned_activity
add column standarea_uuid
char(32);

update planned_activity t1
set standarea_uuid = t2.standarea_uuid
from stand_area t2
where t1.stand_no = t2.stand_no;