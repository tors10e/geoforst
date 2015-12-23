
DROP TABLE season_type;

CREATE TABLE season_type
(
  seasontype_id integer NOT NULL,
  seasontype_dsc character(10),
  CONSTRAINT pk_season_type PRIMARY KEY (seasontype_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE season_type
  OWNER TO postgres;

ALTER TABLE planned_activity RENAME planned_month_id  TO monthtype_id;

ALTER TABLE planned_activity
  ADD COLUMN seasontype_id integer;

ALTER TABLE planned_activity
  DROP CONSTRAINT fk_planned_activity_month_type;
ALTER TABLE planned_activity
  ADD CONSTRAINT fk_planned_activity_month_type FOREIGN KEY (monthtype_id) REFERENCES month_type (monthtype_id) ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE planned_activity
  DROP CONSTRAINT fk_planned_activity_season_type ; 
ALTER TABLE planned_activity
  ADD CONSTRAINT fk_planned_activity_season_type FOREIGN KEY (seasontype_id) REFERENCES season_type (seasontype_id) ON UPDATE NO ACTION ON DELETE NO ACTION;


insert into month_type select 1,'january';
insert into month_type select 2, 'february';
insert into month_type select 3, 'march';
insert into month_type select 4, 'april';
insert into month_type select 5, 'may';
insert into month_type select 6, 'june';
insert into month_type select 7, 'july';
insert into month_type select 8, 'august';
insert into month_type select 9, 'september';
insert into month_type select 10, 'october';
insert into month_type select 11, 'november';
insert into month_type select 12, 'december';

insert into season_type select 1, 'spring';
insert into season_type select 2, 'summer';
insert into season_type select 3, 'fall';
insert into season_type select 4, 'winter';
