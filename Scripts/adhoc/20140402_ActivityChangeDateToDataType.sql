alter table activity_area Add activity_date_new DATE;
update activity_area set activity_date_new = to_date(activity_date,'MM/DD/YYYY');
alter table activity_area drop column activity_date;
alter table activity_area rename column activity_date_new to activity_date;
