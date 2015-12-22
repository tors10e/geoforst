-- View: public.vw_land_area_centroid

-- DROP VIEW public.vw_land_area_centroid;

CREATE OR REPLACE VIEW public.vw_land_area_centroid AS 
 SELECT land_area.landarea_id, 
    st_centroid(land_area.geometry) AS st_centroid, 
    land_area.description
   FROM land_area;

ALTER TABLE public.vw_land_area_centroid
  OWNER TO postgres;
GRANT ALL ON TABLE public.vw_land_area_centroid TO postgres;
GRANT SELECT ON TABLE public.vw_land_area_centroid TO public;
GRANT ALL ON TABLE public.vw_land_area_centroid TO fsp_admin;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE public.vw_land_area_centroid TO fsp_edit;
GRANT SELECT ON TABLE public.vw_land_area_centroid TO fsp_read;
GRANT SELECT ON TABLE public.vw_land_area_centroid TO fsp_report;
