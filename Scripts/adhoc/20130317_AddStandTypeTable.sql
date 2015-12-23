CREATE TABLE public.stand_type
(
  standtype_id integer NOT NULL DEFAULT nextval('cultural_type_culttype_id_seq'::regclass),
  standtype_cd character(3),
  standtype_dsc character varying(50),
  CONSTRAINT pk_stand_type_id PRIMARY KEY (standtype_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.stand_type
  OWNER TO postgres;
GRANT ALL ON TABLE public.stand_type TO postgres;
GRANT SELECT ON TABLE public.stand_type TO fsp_read;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE public.stand_type TO fsp_edit;
GRANT ALL ON TABLE public.stand_type TO fsp_admin;

insert into stand_type (standtype_id, standtype_dsc) 
select stand_no, description from stand_area group by stand_no, description order by stand_no;


ALTER TABLE public.stand_area
  ADD CONSTRAINT fk_stand_area_stand_type FOREIGN KEY (stand_no) REFERENCES public.stand_type (standtype_id) ON UPDATE NO ACTION ON DELETE NO ACTION;
