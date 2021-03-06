
-- Data for Name: activity_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

TRUNCATE TABLE activity_type;

INSERT INTO activity_type (acttype_id, acttype_dsc, acttype_cd) VALUES (1, 'Thinning', 'thn');
INSERT INTO activity_type (acttype_id, acttype_dsc, acttype_cd) VALUES (2, 'Planting', 'plt');
INSERT INTO activity_type (acttype_id, acttype_dsc, acttype_cd) VALUES (3, 'Crop Tree Release', 'ctr');
INSERT INTO activity_type (acttype_id, acttype_dsc, acttype_cd) VALUES (4, 'Complete Harvest', 'ch');
INSERT INTO activity_type (acttype_id, acttype_dsc, acttype_cd) VALUES (5, 'Controlled Burn', 'cb');
INSERT INTO activity_type (acttype_id, acttype_dsc, acttype_cd) VALUES (6, 'Stump Shoot Thinning', 'sst');
INSERT INTO activity_type (acttype_id, acttype_dsc, acttype_cd) VALUES (7, 'Pruning', 'prn');
INSERT INTO activity_type (acttype_id, acttype_dsc, acttype_cd) VALUES (8, 'Undefined', 'udf');
INSERT INTO activity_type (acttype_id, acttype_dsc, acttype_cd) VALUES (9, 'Habitat Enhancement', 'he');


--
-- Data for Name: cultural_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

TRUNCATE TABLE cultural_type;

INSERT INTO cultural_type (culttype_id, culttype_cd, culttype_dsc) VALUES (1, 'abw', 'Well');
INSERT INTO cultural_type (culttype_id, culttype_cd, culttype_dsc) VALUES (2, 'hms', 'Historic Structure');
INSERT INTO cultural_type (culttype_id, culttype_cd, culttype_dsc) VALUES (3, 'bdg', 'Existing Structure');
INSERT INTO cultural_type (culttype_id, culttype_cd, culttype_dsc) VALUES (4, 'hfr', 'Historic Feature');
INSERT INTO cultural_type (culttype_id, culttype_cd, culttype_dsc) VALUES (5, 'nts', 'Native Settlement');
INSERT INTO cultural_type (culttype_id, culttype_cd, culttype_dsc) VALUES (6, 'hts', 'Historic Site');

--
-- Data for Name: forest_age_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

TRUNCATE TABLE forest_age_type;

INSERT INTO forest_age_type (forestagetype_id, forestagetype_cd, forestagetype_dsc) VALUES (1, 'juv', 'Juvenile');
INSERT INTO forest_age_type (forestagetype_id, forestagetype_cd, forestagetype_dsc) VALUES (2, 'mix', 'Mixed');
INSERT INTO forest_age_type (forestagetype_id, forestagetype_cd, forestagetype_dsc) VALUES (3, 'med', 'Medium');
INSERT INTO forest_age_type (forestagetype_id, forestagetype_cd, forestagetype_dsc) VALUES (4, 'ema', 'Early Mature');
INSERT INTO forest_age_type (forestagetype_id, forestagetype_cd, forestagetype_dsc) VALUES (5, 'mat', 'Mature');


--
-- Data for Name: forest_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

TRUNCATE TABLE forest_type;

INSERT INTO forest_type (foresttype_id, foresttype_dsc, foresttype_cd) VALUES (1, 'Planted Pine', NULL);
INSERT INTO forest_type (foresttype_id, foresttype_dsc, foresttype_cd) VALUES (2, 'Natural Pine', NULL);
INSERT INTO forest_type (foresttype_id, foresttype_dsc, foresttype_cd) VALUES (3, 'Mixed-Oak Pine', NULL);
INSERT INTO forest_type (foresttype_id, foresttype_dsc, foresttype_cd) VALUES (4, 'Upland Hardwood', NULL);
INSERT INTO forest_type (foresttype_id, foresttype_dsc, foresttype_cd) VALUES (5, 'Lowland Hardwood', NULL);
INSERT INTO forest_type (foresttype_id, foresttype_dsc, foresttype_cd) VALUES (6, 'Non-Forested', NULL);

--
-- Data for Name: habitat_enhancement_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

TRUNCATE TABLE habitat_enhancement_type;

INSERT INTO habitat_enhancement_type (habenhtype_id, habenhtype_dsc, habenhtype_cd) VALUES (1, 'Brush Pile', 'bp');
INSERT INTO habitat_enhancement_type (habenhtype_id, habenhtype_dsc, habenhtype_cd) VALUES (2, 'Oak Early Successional', 'oes');
INSERT INTO habitat_enhancement_type (habenhtype_id, habenhtype_dsc, habenhtype_cd) VALUES (3, 'Planting', 'plt');
INSERT INTO habitat_enhancement_type (habenhtype_id, habenhtype_dsc, habenhtype_cd) VALUES (4, 'Soft Edge', 'se');
INSERT INTO habitat_enhancement_type (habenhtype_id, habenhtype_dsc, habenhtype_cd) VALUES (5, 'Fallow Field', 'ff');
INSERT INTO habitat_enhancement_type (habenhtype_id, habenhtype_dsc, habenhtype_cd) VALUES (6, 'Shrub Thicket', 'st');
INSERT INTO habitat_enhancement_type (habenhtype_id, habenhtype_dsc, habenhtype_cd) VALUES (7, 'Wood Duck Nest Box', 'nb');

--
-- Data for Name: harvest_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

TRUNCATE TABLE harvest_type; 

INSERT INTO harvest_type (harvesttype_id, harvesttype_dsc, harvesttype_cd) VALUES (1, 'Thinning', NULL);
INSERT INTO harvest_type (harvesttype_id, harvesttype_dsc, harvesttype_cd) VALUES (2, 'Total Harvest', NULL);
INSERT INTO harvest_type (harvesttype_id, harvesttype_dsc, harvesttype_cd) VALUES (3, 'Gap Cut', NULL);

--
-- Data for Name: ordinal_magnitude_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

TRUNCATE TABLE ordinal_magnitude_type;

INSERT INTO ordinal_magnitude_type (ordinalmag_id, ordinalmag_cd, ordinalmag_dsc) VALUES (1, 'low', 'Low');
INSERT INTO ordinal_magnitude_type (ordinalmag_id, ordinalmag_cd, ordinalmag_dsc) VALUES (2, 'med', 'Medium');
INSERT INTO ordinal_magnitude_type (ordinalmag_id, ordinalmag_cd, ordinalmag_dsc) VALUES (3, 'hi ', 'High');
INSERT INTO ordinal_magnitude_type (ordinalmag_id, ordinalmag_cd, ordinalmag_dsc) VALUES (4, 'vhi', 'Very High');

--
-- Data for Name: ordinal_sufficiency_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

TRUNCATE TABLE ordinal_sufficiency_type;

INSERT INTO ordinal_sufficiency_type (ordinalsuff_id, ordinalsuff_cd, ordinalsuff_dsc) VALUES (1, 'low', 'Low');
INSERT INTO ordinal_sufficiency_type (ordinalsuff_id, ordinalsuff_cd, ordinalsuff_dsc) VALUES (2, 'suf', 'Sufficient');
INSERT INTO ordinal_sufficiency_type (ordinalsuff_id, ordinalsuff_cd, ordinalsuff_dsc) VALUES (3, 'hi ', 'High');


--
-- Data for Name: recreation_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

TRUNCATE TABLE recreation_type;

INSERT INTO recreation_type (rectype_id, rectype_dsc, rectype_cd) VALUES (1, 'Fire Ring', 'fr');
INSERT INTO recreation_type (rectype_id, rectype_dsc, rectype_cd) VALUES (2, 'Camp Site', 'cs');
INSERT INTO recreation_type (rectype_id, rectype_dsc, rectype_cd) VALUES (3, 'Picnic Area', 'pa');
INSERT INTO recreation_type (rectype_id, rectype_dsc, rectype_cd) VALUES (4, 'Hunting Stand', 'hs');

--
-- Data for Name: road_access_status_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

TRUNCATE TABLE road_access_status_type;

INSERT INTO road_access_status_type (accessstatus_id, accessstatus_cd, accessstatus_dsc) VALUES (1, 'cls', 'Closed');
INSERT INTO road_access_status_type (accessstatus_id, accessstatus_cd, accessstatus_dsc) VALUES (2, 'opn', 'Open');


--
-- Data for Name: road_surface_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

TRUNCATE TABLE road_surface_type;

INSERT INTO road_surface_type (roadsurface_id, roadsurface_cd, roadsurface_dsc) VALUES (1, 'unk', 'Unknown');
INSERT INTO road_surface_type (roadsurface_id, roadsurface_cd, roadsurface_dsc) VALUES (2, 'drt', 'Dirt');
INSERT INTO road_surface_type (roadsurface_id, roadsurface_cd, roadsurface_dsc) VALUES (4, 'pvd', 'Paved');
INSERT INTO road_surface_type (roadsurface_id, roadsurface_cd, roadsurface_dsc) VALUES (3, 'grv', 'Graveled');


--
-- Data for Name: road_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

TRUNCATE TABLE road_type;

INSERT INTO road_type (roadtype_id, roadtype_dsc, roadtype_cd) VALUES (1, 'Primary', 'pr');
INSERT INTO road_type (roadtype_id, roadtype_dsc, roadtype_cd) VALUES (2, 'Secondary', 'sc');
INSERT INTO road_type (roadtype_id, roadtype_dsc, roadtype_cd) VALUES (3, 'Two Track', 'tt');
INSERT INTO road_type (roadtype_id, roadtype_dsc, roadtype_cd) VALUES (4, 'ATV Track', 'at');
INSERT INTO road_type (roadtype_id, roadtype_dsc, roadtype_cd) VALUES (5, 'Abandoned', 'ab');
INSERT INTO road_type (roadtype_id, roadtype_dsc, roadtype_cd) VALUES (6, 'Obliterated', 'ob');


--
-- Data for Name: severity_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

TRUNCATE TABLE severity_type;

INSERT INTO severity_type (severity_id, severity_cd, severity_dsc) VALUES (1, 'non', 'None');
INSERT INTO severity_type (severity_id, severity_cd, severity_dsc) VALUES (2, 'low', 'Low');
INSERT INTO severity_type (severity_id, severity_cd, severity_dsc) VALUES (3, 'mod', 'Moderate');
INSERT INTO severity_type (severity_id, severity_cd, severity_dsc) VALUES (4, 'con', 'Considerable');
INSERT INTO severity_type (severity_id, severity_cd, severity_dsc) VALUES (5, 'hi', 'High');


--
-- Data for Name: stand_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

TRUNCATE TABLE stand_type;

INSERT INTO stand_type (standtype_id, standtype_cd, standtype_dsc) VALUES (1, NULL, 'Non-forested');
INSERT INTO stand_type (standtype_id, standtype_cd, standtype_dsc) VALUES (2, NULL, 'Residential area');
INSERT INTO stand_type (standtype_id, standtype_cd, standtype_dsc) VALUES (3, NULL, 'Forested wetland');
INSERT INTO stand_type (standtype_id, standtype_cd, standtype_dsc) VALUES (4, NULL, 'Upland hardwood/pine (beetle damage)');
INSERT INTO stand_type (standtype_id, standtype_cd, standtype_dsc) VALUES (5, NULL, 'Upland hardwood/pine, med. age, fully stocked');
INSERT INTO stand_type (standtype_id, standtype_cd, standtype_dsc) VALUES (6, NULL, 'Mesic hardwood, yng. age, overstocked');
INSERT INTO stand_type (standtype_id, standtype_cd, standtype_dsc) VALUES (7, NULL, 'Pine/Hardwood, mxd. age, (beetle damage)');
INSERT INTO stand_type (standtype_id, standtype_cd, standtype_dsc) VALUES (8, NULL, 'Pine/Hardwood, med. age, mildly overstocked');
INSERT INTO stand_type (standtype_id, standtype_cd, standtype_dsc) VALUES (9, NULL, 'Mixed yellow pine, early mature, overstocked');
INSERT INTO stand_type (standtype_id, standtype_cd, standtype_dsc) VALUES (10, NULL, 'Upland hardwood, young age.');


--
-- Data for Name: stocking_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

TRUNCATE TABLE stocking_type;

INSERT INTO stocking_type (stockingtype_id, stockingtype_cd, stockingtype_dsc) VALUES (1, 'us', 'Understocked');
INSERT INTO stocking_type (stockingtype_id, stockingtype_cd, stockingtype_dsc) VALUES (2, 'fs', 'Fully Stocked');
INSERT INTO stocking_type (stockingtype_id, stockingtype_cd, stockingtype_dsc) VALUES (3, 'mo', 'Mildly Overstocked');
INSERT INTO stocking_type (stockingtype_id, stockingtype_cd, stockingtype_dsc) VALUES (4, 'os', 'Overstocked');


--
-- Data for Name: task_status_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

TRUNCATE TABLE task_status_type;

INSERT INTO task_status_type (taskstatus_id, status_code, status_dsc) VALUES (1, 'inc', 'incomplete');
INSERT INTO task_status_type (taskstatus_id, status_code, status_dsc) VALUES (2, 'cmp', 'complete');
INSERT INTO task_status_type (taskstatus_id, status_code, status_dsc) VALUES (3, 'ing', 'ignore');


--
-- Data for Name: trail_status_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

TRUNCATE TABLE trail_status_type;

INSERT INTO trail_status_type (trailstatus_id, trailstatus_cd, trailstatus_dsc) VALUES (1, 'opn ', 'Open');
INSERT INTO trail_status_type (trailstatus_id, trailstatus_cd, trailstatus_dsc) VALUES (2, 'cls ', 'Closed');
INSERT INTO trail_status_type (trailstatus_id, trailstatus_cd, trailstatus_dsc) VALUES (3, 'prp ', 'Proposed');
INSERT INTO trail_status_type (trailstatus_id, trailstatus_cd, trailstatus_dsc) VALUES (4, 'dev', 'In Development');

--
-- Data for Name: trail_type; Type: TABLE DATA; Schema: public; Owner: postgres
--
TRUNCATE TABLE trail_type;

INSERT INTO trail_type (trailtype_id, trailtype_cd, trailtype_dsc) VALUES (1, 'hk', 'Hiking');
INSERT INTO trail_type (trailtype_id, trailtype_cd, trailtype_dsc) VALUES (2, 'mb', 'Mountain Biking');

--
-- Data for Name: unit_type; Type: TABLE DATA; Schema: public; Owner: postgres
--
TRUNCATE TABLE unit_type;

INSERT INTO unit_type (unit_id, unit_cd, unit_dsc) VALUES (2, 'tonsa', 'tons/Acre');
INSERT INTO unit_type (unit_id, unit_cd, unit_dsc) VALUES (1, 'lbsac', 'lbs/Acre');


--
-- Data for Name: water_type; Type: TABLE DATA; Schema: public; Owner: postgres
--
TRUNCATE TABLE water_type;

INSERT INTO water_type (watertype_id, watertype_cd, watertype_dsc) VALUES (1, 'spr', 'Spring');
INSERT INTO water_type (watertype_id, watertype_cd, watertype_dsc) VALUES (2, 'sep', 'Seep');


--
-- Data for Name: plot_geometry_type; Type: TABLE DATA; Schema: public; Owner: postgres
--
TRUNCATE TABLE plot_geometry_type;

INSERT INTO plot_geometry_type (plotgeomtype_id, plotgeomtype_cd, plotgeomtype_dsc) VALUES (1, 'cir', 'Circular');
INSERT INTO plot_geometry_type (plotgeomtype_id, plotgeomtype_cd, plotgeomtype_dsc) VALUES (2, 'rec', 'Rectangular');	


--
-- Data for Name: unit_length_type; Type: TABLE DATA; Schema: public; Owner: postgres
--
TRUNCATE TABLE unit_area_type;

INSERT INTO unit_length_type (unitlengthtype_id, unitlengthtype_cd, unitlengthtype_dsc) VALUES (1, 'ft', 'Feet');
INSERT INTO unit_length_type (unitlengthtype_id, unitlengthtype_cd, unitlengthtype_dsc) VALUES (2, 'm', 'Meters');
INSERT INTO unit_length_type (unitlengthtype_id, unitlengthtype_cd, unitlengthtype_dsc) VALUES (3, 'in', 'Inches');
INSERT INTO unit_length_type (unitlengthtype_id, unitlengthtype_cd, unitlengthtype_dsc) VALUES (4, 'cm', 'Centimeters');


--
-- Data for Name: unit_area_type; Type: TABLE DATA; Schema: public; Owner: postgres
--
TRUNCATE TABLE unit_area_type;

INSERT INTO unit_area_type (unitareatype_id, unitareatype_cd, unitareatype_dsc) VALUES (1, 'ft2', 'Square Feet');
INSERT INTO unit_area_type (unitareatype_id, unitareatype_cd, unitareatype_dsc) VALUES (2, 'in2', 'Square Inches');
INSERT INTO unit_area_type (unitareatype_id, unitareatype_cd, unitareatype_dsc) VALUES (3, 'm2', 'Square Meters');
INSERT INTO unit_area_type (unitareatype_id, unitareatype_cd, unitareatype_dsc) VALUES (4, 'cm2', 'Square Centimeters');

--
-- Data for Name: unit_concentration_type
--
TRUNCATE TABLE unit_concentration_type;

INSERT INTO unit_concentration_type (unitconctype_id, unitconctype_cd, unitconctype_dsc) VALUES (1, 'mg/l', 'Milligrams/Liter');
INSERT INTO unit_concentration_type (unitconctype_id, unitconctype_cd, unitconctype_dsc) VALUES (2, 'mg/kg', 'Milligrams/Kilogram');
INSERT INTO unit_concentration_type (unitconctype_id, unitconctype_cd, unitconctype_dsc) VALUES (3, 'ppm', 'Parts Per Million');
INSERT INTO unit_concentration_type (unitconctype_id, unitconctype_cd, unitconctype_dsc) VALUES (4, 'ppb', 'Parts Per Billon');
INSERT INTO unit_concentration_type (unitconctype_id, unitconctype_cd, unitconctype_dsc) VALUES (5, 'g/kg', 'Grams/Kilogram');
INSERT INTO unit_concentration_type (unitconctype_id, unitconctype_cd, unitconctype_dsc) VALUES (6, 'lbs/a', 'Pounds/Acre');

--
-- Data for Name: species_tree_type; Type: TABLE DATA; Schema: public; Owner: postgres
--
TRUNCATE TABLE species_tree_type;

INSERT INTO species_tree_type (speciestreetype_id, speciestreetype_cd, speciestreetype_dsc, speciestreetype_bn) VALUES (1, 'ps', 'White Pine', 'Pinus strobus');
INSERT INTO species_tree_type (speciestreetype_id, speciestreetype_cd, speciestreetype_dsc, speciestreetype_bn) VALUES (2, 'pe', 'Shortleaf Pine', 'Pinus echinata');
INSERT INTO species_tree_type (speciestreetype_id, speciestreetype_cd, speciestreetype_dsc, speciestreetype_bn) VALUES (3, 'pv', 'Virginia Pine', 'Pinus virginiana');
INSERT INTO species_tree_type (speciestreetype_id, speciestreetype_cd, speciestreetype_dsc, speciestreetype_bn) VALUES (4, 'pv', 'Loblolly Pine', 'Pinus taeda');
INSERT INTO species_tree_type (speciestreetype_id, speciestreetype_cd, speciestreetype_dsc, speciestreetype_bn) VALUES (5, 'qa', 'White Oak', 'Quercus alaba');
INSERT INTO species_tree_type (speciestreetype_id, speciestreetype_cd, speciestreetype_dsc, speciestreetype_bn) VALUES (6, 'qc', 'Scarlett Oak', 'Quercus coccinea');
INSERT INTO species_tree_type (speciestreetype_id, speciestreetype_cd, speciestreetype_dsc, speciestreetype_bn) VALUES (7, 'po', 'Post Oak', 'Quercus stellata');
INSERT INTO species_tree_type (speciestreetype_id, speciestreetype_cd, speciestreetype_dsc, speciestreetype_bn) VALUES (8, 'nro', 'Northern Red Oak', 'Quercus rubra');
INSERT INTO species_tree_type (speciestreetype_id, speciestreetype_cd, speciestreetype_dsc, speciestreetype_bn) VALUES (9, 'qf', 'Southern Red Oak', 'Quercus falcata');
INSERT INTO species_tree_type (speciestreetype_id, speciestreetype_cd, speciestreetype_dsc, speciestreetype_bn) VALUES (10, 'qv', 'Black Oak', 'Quercus velutina');
INSERT INTO species_tree_type (speciestreetype_id, speciestreetype_cd, speciestreetype_dsc, speciestreetype_bn) VALUES (11, 'ns', 'Black Gum', 'Nyssa sylvatica');
INSERT INTO species_tree_type (speciestreetype_id, speciestreetype_cd, speciestreetype_dsc, speciestreetype_bn) VALUES (12, 'lt', 'Yellow Poplar', 'Liriodendron tulipifera');

--
-- Data for Name: stand_description; Type: TABLE DATA; Schema: public; Owner: postgres
--
TRUNCATE TABLE stand_description;
INSERT INTO stand_description (standdescription_id, stockingtype_id, forestagetype_id, stand_description, foresttype_id, created_by_id) VALUES (5, 2, 3, 'Upland Hardwood/Pine, Intermediate aged, fully stocked –', 3, NULL);
INSERT INTO stand_description (standdescription_id, stockingtype_id, forestagetype_id, stand_description, foresttype_id, created_by_id) VALUES (3, 2, 1, 'Forested Wetland', 5, NULL);
INSERT INTO stand_description (standdescription_id, stockingtype_id, forestagetype_id, stand_description, foresttype_id, created_by_id) VALUES (1, 2, 1, 'Improved grassland.', 6, NULL);
INSERT INTO stand_description (standdescription_id, stockingtype_id, forestagetype_id, stand_description, foresttype_id, created_by_id) VALUES (8, 3, 3, 'Pine/Hardwood, Intermediate Aged, mildly overstocked', 5, NULL);
INSERT INTO stand_description (standdescription_id, stockingtype_id, forestagetype_id, stand_description, foresttype_id, created_by_id) VALUES (9, 4, 5, 'Mixed yellow pine, early mature, over stocked.', 2, NULL);
INSERT INTO stand_description (standdescription_id, stockingtype_id, forestagetype_id, stand_description, foresttype_id, created_by_id) VALUES (4, 2, 2, 'Upland hardwood/pine mixed age.', 4, NULL);
INSERT INTO stand_description (standdescription_id, stockingtype_id, forestagetype_id, stand_description, foresttype_id, created_by_id) VALUES (2, 2, 3, 'Residential area.', 3, NULL);
INSERT INTO stand_description (standdescription_id, stockingtype_id, forestagetype_id, stand_description, foresttype_id, created_by_id) VALUES (6, 2, 1, 'Mesic Hardwood/Pine, juvenile aged, overstocked', 4, NULL);
INSERT INTO stand_description (standdescription_id, stockingtype_id, forestagetype_id, stand_description, foresttype_id, created_by_id) VALUES (7, 2, 2, 'Pine/Hardwood, mixed age (beetle damage)', 5, NULL);
INSERT INTO stand_description (standdescription_id, stockingtype_id, forestagetype_id, stand_description, foresttype_id, created_by_id) VALUES (10, 4, 1, 'Immature pine, overstocked.', 2, NULL);
INSERT INTO stand_description (standdescription_id, stockingtype_id, forestagetype_id, stand_description, foresttype_id, created_by_id) VALUES (11, 3, 4, 'Young pure yellow poplar.', 4, NULL);
