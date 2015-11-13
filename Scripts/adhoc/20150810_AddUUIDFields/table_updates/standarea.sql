BEGIN;
ALTER TABLE stand_area ADD COLUMN standarea_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN stand_area.standarea_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';
COMMIT;

-- Populate uuid of existing records.
update stand_area set standarea_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE stand_area
  DROP CONSTRAINT stand_area_pk CASCADE;

ALTER TABLE stand_area
  ADD CONSTRAINT pk_stand_area PRIMARY KEY (standarea_uuid);

-- Create a clustering key on the id field.
--CREATE INDEX idx_stand_area_standarea_id
  --ON stand_area
  --USING btree
  --(standarea_id);
  
CLUSTER stand_area USING idx_stand_area_standarea_id;

ALTER TABLE stand_area
  ADD CONSTRAINT unq_standarea_uuid UNIQUE (standarea_uuid);

BEGIN;
alter table stand_area add column stockingtype_id integer;
alter table stand_area add column forestagetype_id integer;
alter table stand_area drop constraint fk_stand_area_stand_description;
COMMIT;


update stand_area t1
set foresttype_id = t2.foresttype_id
from stand_description t2
where t1.standdescription_id = t2.standdescription_id;

update stand_area t1
set stockingtype_id = t2.stockingtype_id
from stand_description t2
where t1.standdescription_id = t2.standdescription_id;

update stand_area t1
set forestagetype_id = t2.forestagetype_id
from stand_description t2
where t1.standdescription_id = t2.standdescription_id;

DROP VIEW vw_stand_area;

CREATE OR REPLACE VIEW vw_stand_area AS 
 SELECT stand_area.standarea_id, 
    st_transform(stand_area.geometry, 3857) AS geometry, 
    stand_area.stand_no, 
    stand_area.description, 
    stand_area.start_date, 
    stand_area.forestagetype_id, 
    stand_area.foresttype_id,
    stand_area.stockingtype_id,
    stand_area.transaction_start_date
   FROM stand_area;

ALTER TABLE vw_stand_area
  OWNER TO postgres;
GRANT ALL ON TABLE vw_stand_area TO postgres;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE vw_stand_area TO fsp_edit;
GRANT SELECT ON TABLE vw_stand_area TO public;
GRANT SELECT ON TABLE vw_stand_area TO staging_loader;

alter table stand_area drop column standdescription_id;

drop table stand_description cascade;


--Stand Status

ALTER TABLE stand_status ADD COLUMN standarea_uuid uuid;

update stand_status t1
 set standarea_uuid = t2.standarea_uuid
 from stand_area t2
 where t2.stand_no = t1.stand_id;


ALTER TABLE stand_status
  ADD CONSTRAINT fk_stand_status_stand_area FOREIGN KEY(standarea_uuid) REFERENCES  stand_area(standarea_uuid);

ALTER TABLE stand_status DROP COLUMN stand_id;
