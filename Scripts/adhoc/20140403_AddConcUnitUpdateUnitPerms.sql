{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf190
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww11760\viewh11860\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural

\f0\fs24 \cf0 CREATE TABLE public.unit_concentration_type\
(\
  unitconctype_id integer NOT NULL,\
  unitconctype_cd character varying(5) NOT NULL,\
  unitconctype_dsc character varying(50) NOT NULL,\
  CONSTRAINT unit_conc_type_pkey PRIMARY KEY (unitconctype_id)\
)\
WITH (\
  OIDS=FALSE\
);\
\
\
ALTER TABLE public.unit_concentration_type\
  OWNER TO postgres;\
GRANT ALL ON TABLE public.unit_concentration_type TO postgres;\
GRANT SELECT ON TABLE public.unit_concentration_type TO fsp_read;\
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE public.unit_concentration_type TO fsp_edit;\
GRANT ALL ON TABLE public.unit_concentration_type TO fsp_admin;\
GRANT SELECT ON TABLE public.unit_concentration_type TO fsp_report;\
\
GRANT ALL ON TABLE public.unit_length_type TO postgres;\
GRANT SELECT ON TABLE public.unit_length_type TO fsp_read;\
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE public.unit_length_type TO fsp_edit;\
GRANT ALL ON TABLE public.unit_length_type TO fsp_admin;\
GRANT SELECT ON TABLE public.unit_length_type TO fsp_report;\
\
GRANT ALL ON TABLE public.unit_area_type TO postgres;\
GRANT SELECT ON TABLE public.unit_area_type TO fsp_read;\
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE public.unit_area_type TO fsp_edit;\
GRANT ALL ON TABLE public.unit_area_type TO fsp_admin;\
GRANT SELECT ON TABLE public.unit_area_type TO fsp_report;\
\
}