alter table soil_test
add column created_by_id integer;

update soil_test
set created_by_id = 3;

alter table stream
add column created_by_id integer;

update stream
set created_by_id = 3;

alter table trail
add column created_by_id integer;

update trail
set created_by_id = 3;


alter table control_point
add column created_by_id integer;

update control_point
set created_by_id = 3;


alter table firebreak_line
add column created_by_id integer;

update firebreak_line
set created_by_id = 3;

alter table tree_status
add column created_by_id integer;

update tree_status
set created_by_id = 3;

alter table public.soil_test_recommendation
drop constraint fk_soil_test_recommendation_soil_test;

ALTER TABLE public.soil_test_recommendation
  ADD CONSTRAINT fk_soil_test_recommendation_soil_test FOREIGN KEY (soiltest_id)
      REFERENCES public.soil_test (soiltest_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE;

alter table public.forest_inventory_data
drop constraint forest_inventory_data_forestinventoryplot_id_fkey;

ALTER TABLE public.forest_inventory_data
  ADD CONSTRAINT fk_forest_inventory_data_forestinventoryplot FOREIGN KEY (forestinventoryplot_id)
      REFERENCES public.forest_inventory_plot (forestinventoryplot_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED;

CREATE ROLE staging LOGIN ENCRYPTED PASSWORD 'md52a23f81275c6fda860ddfe56d8087af4'
   VALID UNTIL '2015-05-07 00:00:00';
COMMENT ON ROLE staging
  IS 'User to load staging tables in the staging schema.';



