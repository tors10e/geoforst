-- Table: public.tree_status

-- DROP TABLE public.tree_status;

ALTER TABLE public.tree RENAME specie  TO species;

CREATE TABLE public.tree_status
(
  treestatus_id serial,
  tree_id integer,
  status_date date,
  dbh_in numeric(4,2),
  height_ft numeric(4,2),
  status_notes character varying(255),
  CONSTRAINT pk_tree_status PRIMARY KEY (treestatus_id),
  CONSTRAINT fk_tree_status_tree FOREIGN KEY (tree_id)
      REFERENCES public.tree (tree_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.tree_status
  OWNER TO postgres;
GRANT ALL ON TABLE public.tree_status TO postgres;
GRANT ALL ON TABLE public.tree_status TO fsp_admin;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE public.tree_status TO fsp_edit;
GRANT SELECT ON TABLE public.tree_status TO fsp_read;
