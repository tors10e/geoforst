drop view public.vw_qc_land_area_by_year; 
drop view public.vw_stand_area_by_year;

CREATE VIEW public.vw_stand_area_by_year AS 
         SELECT (s.standareahist_id * 2^32) + d.report_year +2^31 as view_id, s.standarea_id, s.geometry, s.stand_no, s.description, 
            s.end_date, s.start_date, s.foresttype_id, d.reportdate_id, 
            d.report_year, d.report_timestamp, 'historic' as status
           FROM stand_area_history s
     CROSS JOIN dim_report_date d
     WHERE d.report_timestamp >= s.start_date AND d.report_timestamp <= s.end_date
UNION 
         SELECT (s.standarea_id * 2^32) + d.report_year as view_id, s.standarea_id, s.geometry, s.stand_no, s.description, 
            now() AS end_date, s.start_date, s.foresttype_id, d.reportdate_id, 
            d.report_year, d.report_timestamp, 'current' as status
           FROM stand_area s
     CROSS JOIN dim_report_date d
     WHERE d.report_timestamp >= s.start_date AND d.report_timestamp <= now();

ALTER TABLE public.vw_stand_area_by_year
  OWNER TO postgres;
GRANT ALL ON TABLE public.vw_stand_area_by_year TO postgres;
GRANT ALL ON TABLE public.vw_stand_area_by_year TO fsp_admin;

-- View: public.vw_qc_land_area_by_year

-- DROP VIEW public.vw_qc_land_area_by_year;

CREATE OR REPLACE VIEW public.vw_qc_land_area_by_year AS 
 SELECT v.report_year, sum(st_area(v.geometry)) AS period_area, 
    st_area(l.geometry) AS true_area, 
    sum(st_area(v.geometry)) - st_area(l.geometry) AS area_diff, 
    sum(st_area(v.geometry)) / st_area(l.geometry) * 100::double precision AS pct_diff
   FROM vw_stand_area_by_year v
  CROSS JOIN land_area l
  WHERE l.landarea_id = 1
  GROUP BY v.report_year, l.landarea_id
  ORDER BY v.report_year;

ALTER TABLE public.vw_qc_land_area_by_year
  OWNER TO postgres;
  GRANT ALL ON TABLE public.vw_qc_land_area_by_year TO postgres;
GRANT ALL ON TABLE public.vw_qc_land_area_by_year TO fsp_admin;
