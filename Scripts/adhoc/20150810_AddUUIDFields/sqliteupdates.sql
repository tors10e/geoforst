-- Activity_Area
ALTER TABLE activity_area ADD COLUMN activityarea_uuid text(32);
update activity_area set activityarea_uuid = lower(hex(randomblob(16)));

-- Burn Compartment
ALTER TABLE burn_compartment ADD COLUMN burncompartment_uuid text(32);
update burn_compartment set burncompartment_uuid = lower(hex(randomblob(16)));

-- Control Point
ALTER TABLE control_point ADD COLUMN controlpoint_uuid text(32);
update control_point set controlpoint_uuid = lower(hex(randomblob(16)));

-- cultural_point
ALTER TABLE cultural_point ADD COLUMN culturalpoint_uuid text(32);
update cultural_point set culturalpoint_uuid = lower(hex(randomblob(16)));

-- firebreakln
ALTER TABLE firebreak_line ADD COLUMN firebreakln_uuid text(32);
update firebreak_line set firebreakln_uuid = lower(hex(randomblob(16)));

-- forest_inventory_plot
ALTER TABLE forest_inventory_plot ADD COLUMN forestinventoryplot_uuid text(32);
update forest_inventory_plot set forestinventoryplot_uuid = lower(hex(randomblob(16)));

-- habitat_enhancement_area
ALTER TABLE habitat_enhancement_area ADD COLUMN habenharea_uuid text(32);
update habitat_enhancement_area set habenharea_uuid = lower(hex(randomblob(16)));

-- habitat_enhancement_point
ALTER TABLE habitat_enhancement_point ADD COLUMN habenhpt_uuid text(32);
update habitat_enhancement_point set habenhpt_uuid = lower(hex(randomblob(16)));

-- hazard
--ALTER TABLE hazard ADD COLUMN hazard_uuid text(32);
--update hazard set hazard_uuid = lower(hex(randomblob(16)));

-- land_area
ALTER TABLE land_area ADD COLUMN landarea_uuid text(32);
update land_area set landarea_uuid = lower(hex(randomblob(16)));

--recreation_point
ALTER TABLE recreation_point ADD COLUMN recreationpt_uuid text(32);
update recreation_point set recreationpt_uuid = lower(hex(randomblob(16)));

--road_line
ALTER TABLE road_line ADD COLUMN roadln_uuid text(32);
update road_line set roadln_uuid = lower(hex(randomblob(16)));

-- soil_test
ALTER TABLE soil_test ADD COLUMN soiltest_uuid text(32);
update soil_test set soiltest_uuid = lower(hex(randomblob(16)));

-- stand_area
ALTER TABLE stand_area ADD COLUMN standarea_uuid text(32);
update stand_area set standarea_uuid = lower(hex(randomblob(16)));

-- stream
ALTER TABLE stream ADD COLUMN stream_uuid text(32);
update stream set stream_uuid = lower(hex(randomblob(16)));

-- streamside_management_zone
ALTER TABLE streamside_management_zone ADD COLUMN smz_uuid text(32);
update streamside_management_zone set smz_uuid = lower(hex(randomblob(16)));

-- trail
ALTER TABLE trail ADD COLUMN trail_uuid text(32);
update trail set trail_uuid = lower(hex(randomblob(16)));

-- tree
ALTER TABLE tree ADD COLUMN tree_uuid text(32);
update tree set tree_uuid = lower(hex(randomblob(16)));

-- water_point
ALTER TABLE water_point ADD COLUMN waterpt_uuid text(32);
update water_point set waterpt_uuid = lower(hex(randomblob(16)));

-- planned_activity
ALTER TABLE planned_activity ADD COLUMN plannedact_uuid text(32);
update planned_activity set plannedact_uuid = lower(hex(randomblob(16)));

-- soil_test_recommendation
ALTER TABLE soil_test_recommendation ADD COLUMN soiltestrec_uuid text(32);
update soil_test_recommendation set soiltestrec_uuid = lower(hex(randomblob(16)));

-- stand_status
ALTER TABLE stand_status ADD COLUMN standstatus_uuid text(32);
update stand_status set standstatus_uuid = lower(hex(randomblob(16)));

-- tree_status
ALTER TABLE tree_status ADD COLUMN treestatus_uuid text(32);
update tree_status set treestatus_uuid = lower(hex(randomblob(16)));










