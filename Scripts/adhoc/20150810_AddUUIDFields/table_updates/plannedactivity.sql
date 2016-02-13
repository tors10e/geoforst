
ALTER TABLE planned_activity ADD COLUMN plannedact_uuid uuid DEFAULT uuid_generate_v1();
COMMENT ON COLUMN planned_activity.plannedact_uuid IS 'This field is used to maintain the uniqueness of records since the system is distributed.';

-- Populate uuid of existing records.
update planned_activity set plannedact_uuid = uuid_generate_v1();

-- Change primary key to the uuid field.
ALTER TABLE planned_activity
  DROP CONSTRAINT stand_activity_pkey CASCADE;

ALTER TABLE planned_activity
  ADD CONSTRAINT pk_planned_activity PRIMARY KEY (plannedact_uuid);

-- Create a clustering key on the id field.
--CREATE INDEX idx_planned_activity_plannedact_id
  --ON planned_activity
  --USING btree
  --(plannedact_id);
  
CLUSTER planned_activity USING idx_planned_activity_plannedact_id;

ALTER TABLE planned_activity
  ADD CONSTRAINT unq_plannedact_uuid UNIQUE (plannedact_uuid);


-- Alter dependent objects

ALTER TABLE activity_area ADD COLUMN plannedact_uuid uuid;

update activity_area t1
 set plannedact_uuid = t2.plannedact_uuid
 from planned_activity t2
 where t2.plannedact_id = t1.plannedact_id;

--ALTER TABLE planned_activity DROP CONSTRAINT fk_land_area;
  
ALTER TABLE activity_area
  ADD CONSTRAINT fk_planned_activity FOREIGN KEY(plannedact_uuid) REFERENCES planned_activity(plannedact_uuid);

DROP VIEW vw_activity_area;

CREATE VIEW vw_activity_area AS 
 SELECT activity_area.activityarea_id, 
    activity_area.acttype_id, 
    activity_area.description, 
    activity_area.revenue, 
    activity_area.plannedact_uuid, 
    activity_area.standact_id, 
    activity_area.created_by_id, 
    activity_area.activity_date, 
    st_transform(activity_area.geometry, 3857) AS geometry
   FROM activity_area;

ALTER TABLE vw_activity_area
  OWNER TO postgres;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE vw_activity_area TO fsp_edit;
GRANT ALL ON TABLE vw_activity_area TO postgres;
GRANT SELECT ON TABLE vw_activity_area TO public;
GRANT SELECT ON TABLE vw_activity_area TO staging_loader;


ALTER TABLE activity_area DROP COLUMN plannedact_id;
