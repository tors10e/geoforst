BEGIN;

alter TABLE "activity_area" add "created_by_id" integer NULL;
#alter TABLE "activity_area" drop "standact_id";

alter TABLE "burn_compartment" add "created_by_id" integer NULL;

alter TABLE "cultural_point" add "created_by_id" integer NULL;

alter TABLE "forest_type" add "foresttype_cd" varchar(3) NOT NULL;

alter TABLE "habitat_enhancement_area" add "created_by_id" integer NULL;

alter TABLE "habitat_enhancement_point" add "created_by_id" integer NULL;

alter TABLE "land_area" add "created_by_id" integer NULL;

alter TABLE "land_area_history" add "created_by_id" integer NULL;

alter TABLE "land_owner" add "created_by_id" integer NULL;

alter TABLE "planned_activity" add "created_by_id" integer NULL;
alter TABLE "recreation_point" add "created_by_id" integer NULL;
alter TABLE "road_line" add "created_by_id" integer NULL;
alter TABLE "stand_area" add "created_by_id" integer NULL;
alter TABLE "stand_status" add "created_by_id" integer NULL;
alter TABLE "streamside_management_zone" add "created_by_id" integer NULL;
alter TABLE "tree" add "created_by_id" integer NULL;
alter TABLE "water_point" add "created_by_id" integer NULL;
alter TABLE "water_point" add "watertype_cd" varchar(3) NULL;
alter TABLE "stand_description" add "created_by_id" integer NULL;

CREATE TABLE "sawmill" (
    "sawmill_id" serial NOT NULL PRIMARY KEY,
    "sawmill_name" varchar(30) NOT NULL,
    "sawmill_address" varchar(100) NOT NULL,
    "sawmill_city" varchar(30) NOT NULL,
    "sawmill_state" varchar(2) NOT NULL,
    "sawmill_zip" numeric(5, 0),
    "sawmill_phone" varchar(20) NOT NULL,
    "sawmill_email" varchar(100) NOT NULL,
    "sawmill_website" varchar(255) NOT NULL,
    "created_by_id" integer NOT NULL
)
;
CREATE TABLE "scaling_ticket" (
    "scalingticket_id" serial NOT NULL PRIMARY KEY,
    "sawmill_id" integer REFERENCES "sawmill" ("sawmill_id") DEFERRABLE INITIALLY DEFERRED,
    "date" date,
    "weight" numeric(12, 2),
    "ticket_date" date NOT NULL,
    "created_by_id" integer NOT NULL
)
;
CREATE TABLE "lumber_load" (
    "lumberload_id" serial NOT NULL PRIMARY KEY,
    "scalingticket_id" integer REFERENCES "scaling_ticket" ("scalingticket_id") DEFERRABLE INITIALLY DEFERRED,
    "load_date" date NOT NULL,
    "load_comments" varchar(255) NOT NULL,
    "created_by_id" integer NOT NULL
)
;
CREATE TABLE "log_data" (
    "logdata_id" serial NOT NULL PRIMARY KEY,
    "lumberload_id" integer REFERENCES "lumber_load" ("lumberload_id") DEFERRABLE INITIALLY DEFERRED,
    "butt_diameter" numeric(4, 1),
    "diameter_unit_id" integer,
    "log_length" numeric(3, 1),
    "length_unit_id" integer,
    "speciestreetype_id" integer,
    "recorded_date" date,
    "created_by_id" integer NOT NULL
)
;
CREATE TABLE "forest_inventory_plot" (
    "forestinventoryplot_id" serial NOT NULL PRIMARY KEY,
    "plot_number" integer NOT NULL UNIQUE,
    "plot_geometry_id" integer NOT NULL,
    "plot_area" numeric(5, 1),
    "plot_area_unit_id" integer,
    "plot_radius" integer,
    "plot_radius_unit_id" integer,
    "plot_xlength" integer,
    "plot_ylength" integer,
    "plot_length_unit_id" integer,
    "geometry" geometry(POINT,2163),
    "longitude" numeric(9, 6) NOT NULL,
    "latitude" numeric(9, 6) NOT NULL,
    "elevation" integer,
    "elevation_unit_id" integer,
    "position_description" varchar(255),
    "plot_create_date" date,
    "created_by_id" integer NOT NULL
)
;
CREATE TABLE "forest_inventory_data" (
    "forestinventorydata_id" serial NOT NULL PRIMARY KEY,
    "forestinventoryplot_id" integer REFERENCES "forest_inventory_plot" ("forestinventoryplot_id") DEFERRABLE INITIALLY DEFERRED,
    "tree_id" integer REFERENCES "tree" ("tree_id") DEFERRABLE INITIALLY DEFERRED,
    "collection_date" date,
    "speciestreetype_id" integer NOT NULL,
    "dbh" numeric(4, 1),
    "dbh_unit_id" integer,
    "height" integer,
    "height_unit_id" integer,
    "age" integer NOT NULL,
    "created_by_id" integer NOT NULL
)
;
CREATE TABLE "plot_geometry_type" (
    "plotgeomtype_id" integer NOT NULL PRIMARY KEY,
    "plotgeomtype_cd" varchar(3) NOT NULL,
    "plotgeomtype_dsc" varchar(50) NOT NULL
)
;
ALTER TABLE "forest_inventory_plot" ADD CONSTRAINT "plot_geometry_id_refs_plotgeomtype_id_a4d7e94a" FOREIGN KEY ("plot_geometry_id") REFERENCES "plot_geometry_type" ("plotgeomtype_id") DEFERRABLE INITIALLY DEFERRED;
CREATE TABLE "unit_length_type" (
    "unitlengthtype_id" integer NOT NULL PRIMARY KEY,
    "unitlengthtype_cd" varchar(3) NOT NULL,
    "unitlengthtype_dsc" varchar(50) NOT NULL
)
;
ALTER TABLE "log_data" ADD CONSTRAINT "diameter_unit_id_refs_unitlengthtype_id_16cec0ee" FOREIGN KEY ("diameter_unit_id") REFERENCES "unit_length_type" ("unitlengthtype_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "log_data" ADD CONSTRAINT "length_unit_id_refs_unitlengthtype_id_16cec0ee" FOREIGN KEY ("length_unit_id") REFERENCES "unit_length_type" ("unitlengthtype_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "forest_inventory_plot" ADD CONSTRAINT "plot_radius_unit_id_refs_unitlengthtype_id_aae3e5ae" FOREIGN KEY ("plot_radius_unit_id") REFERENCES "unit_length_type" ("unitlengthtype_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "forest_inventory_plot" ADD CONSTRAINT "plot_length_unit_id_refs_unitlengthtype_id_aae3e5ae" FOREIGN KEY ("plot_length_unit_id") REFERENCES "unit_length_type" ("unitlengthtype_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "forest_inventory_plot" ADD CONSTRAINT "elevation_unit_id_refs_unitlengthtype_id_aae3e5ae" FOREIGN KEY ("elevation_unit_id") REFERENCES "unit_length_type" ("unitlengthtype_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "forest_inventory_data" ADD CONSTRAINT "dbh_unit_id_refs_unitlengthtype_id_33d3e3e4" FOREIGN KEY ("dbh_unit_id") REFERENCES "unit_length_type" ("unitlengthtype_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "forest_inventory_data" ADD CONSTRAINT "height_unit_id_refs_unitlengthtype_id_33d3e3e4" FOREIGN KEY ("height_unit_id") REFERENCES "unit_length_type" ("unitlengthtype_id") DEFERRABLE INITIALLY DEFERRED;
CREATE TABLE "unit_area_type" (
    "unitareatype_id" integer NOT NULL PRIMARY KEY,
    "unitareatype_cd" varchar(3) NOT NULL,
    "unitareatype_dsc" varchar(50) NOT NULL
)
;
ALTER TABLE "forest_inventory_plot" ADD CONSTRAINT "plot_area_unit_id_refs_unitareatype_id_ecc4ecb4" FOREIGN KEY ("plot_area_unit_id") REFERENCES "unit_area_type" ("unitareatype_id") DEFERRABLE INITIALLY DEFERRED;
CREATE TABLE "species_tree_type" (
    "speciestreetype_id" integer NOT NULL PRIMARY KEY,
    "speciestreetype_cd" varchar(3) NOT NULL,
    "speciestreetype_dsc" varchar(50) NOT NULL,
    "speciestreetype_bn" varchar(50) NOT NULL
)
;
ALTER TABLE "tree" ADD CONSTRAINT "speciestreetype_id_refs_speciestreetype_id_4f5ca382" FOREIGN KEY ("speciestreetype_id") REFERENCES "species_tree_type" ("speciestreetype_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "log_data" ADD CONSTRAINT "speciestreetype_id_refs_speciestreetype_id_89af42b6" FOREIGN KEY ("speciestreetype_id") REFERENCES "species_tree_type" ("speciestreetype_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "forest_inventory_data" ADD CONSTRAINT "speciestreetype_id_refs_speciestreetype_id_067acb20" FOREIGN KEY ("speciestreetype_id") REFERENCES "species_tree_type" ("speciestreetype_id") DEFERRABLE INITIALLY DEFERRED;
OMMIT;
