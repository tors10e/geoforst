-- Table: RoadType
DROP TABLE RoadType;

CREATE TABLE RoadType ( 
    RoadTypeID   INTEGER PRIMARY KEY,
    RoadTypeDesc TEXT 
);


INSERT INTO RoadType (RoadTypeID, RoadTypeDesc) VALUES (1, 'Primary');
INSERT INTO RoadType (RoadTypeID, RoadTypeDesc) VALUES (2, 'Secondary');
INSERT INTO RoadType (RoadTypeID, RoadTypeDesc) VALUES (3, 'Two Track');
INSERT INTO RoadType (RoadTypeID, RoadTypeDesc) VALUES (4, 'ATV Track');
INSERT INTO RoadType (RoadTypeID, RoadTypeDesc) VALUES (5, 'Abandoned');
INSERT INTO RoadType (RoadTypeID, RoadTypeDesc) VALUES (6, 'Obliterated');

-- Table: ActivityType
drop table ActivityType;

CREATE TABLE ActivityType ( 
    ActTypeID   INTEGER PRIMARY KEY,
    ActTypeDesc TEXT 
);

BEGIN;
INSERT INTO ActivityType (ActTypeID, ActTypeDesc) VALUES (1, 'Thinning');
INSERT INTO ActivityType (ActTypeID, ActTypeDesc) VALUES (2, 'Planting');
INSERT INTO ActivityType (ActTypeID, ActTypeDesc) VALUES (3, 'Crop Tree Release');
INSERT INTO ActivityType (ActTypeID, ActTypeDesc) VALUES (4, 'Complete Harvest');
INSERT INTO ActivityType (ActTypeID, ActTypeDesc) VALUES (5, 'Controlled Burn');
INSERT INTO ActivityType (ActTypeID, ActTypeDesc) VALUES (6, 'Stump Shoot Thinning');
INSERT INTO ActivityType (ActTypeID, ActTypeDesc) VALUES (7, 'Pruning');
COMMIT;


-- Table: HabitatEnhancementType
DROP TABLE HabitatEnhancementType;
CREATE TABLE HabitatEnhancementType ( 
    HabEnhTypeID   INTEGER PRIMARY KEY,
    HabEnhTypeDesc TEXT 
);

BEGIN;
INSERT INTO HabitatEnhancementType (HabEnhTypeID, HabEnhTypeDesc) VALUES (1, 'Brush Pile');
INSERT INTO HabitatEnhancementType (HabEnhTypeID, HabEnhTypeDesc) VALUES (2, 'Oak Early Successional');
INSERT INTO HabitatEnhancementType (HabEnhTypeID, HabEnhTypeDesc) VALUES (3, 'Planting');
INSERT INTO HabitatEnhancementType (HabEnhTypeID, HabEnhTypeDesc) VALUES (4, 'Soft Edge');
INSERT INTO HabitatEnhancementType (HabEnhTypeID, HabEnhTypeDesc) VALUES (5, 'Fallow Field');
INSERT INTO HabitatEnhancementType (HabEnhTypeID, HabEnhTypeDesc) VALUES (6, 'Shrub Thicket');
INSERT INTO HabitatEnhancementType (HabEnhTypeID, HabEnhTypeDesc) VALUES (7, 'Wood Duck Nest Box');
COMMIT;

-- Table: HarvestType
DROP TABLE HarvestType;
CREATE TABLE HarvestType ( 
    HarvestTypeID   int     PRIMARY KEY,
    HarvestTypeDesc TEXT
);

BEGIN;
INSERT INTO HarvestType (HarvestTypeID, HarvestTypeDesc) VALUES (1, 'Thinning');
INSERT INTO HarvestType (HarvestTypeID, HarvestTypeDesc) VALUES (2, 'Total Harvest');
INSERT INTO HarvestType (HarvestTypeID, HarvestTypeDesc) VALUES (3, 'Gap Cut');
COMMIT;


-- Table: RecreationType
DROP TABLE RecreationType;
CREATE TABLE RecreationType ( 
    RecTypeID   INTEGER PRIMARY KEY,
    RecTypeDesc TEXT 
);


INSERT INTO RecreationType (RecTypeID, RecTypeDesc) VALUES (1, 'Fire Ring');
INSERT INTO RecreationType (RecTypeID, RecTypeDesc) VALUES (2, 'Camp Site');


-- Table: StockingType
DROP TABLE StockingType;
CREATE TABLE StockingType ( 
    StockingTypeID   INTEGER     PRIMARY KEY,
    StockingTypeDesc TEXT 
);

BEGIN;
INSERT INTO StockingType (StockingTypeID, StockingTypeDesc) VALUES (1, 'Understocked');
INSERT INTO StockingType (StockingTypeID, StockingTypeDesc) VALUES (2, 'Fully Stocked');
INSERT INTO StockingType (StockingTypeID, StockingTypeDesc) VALUES (3, 'Mildly Overstocked');
INSERT INTO StockingType (StockingTypeID, StockingTypeDesc) VALUES (4, 'Overstocked');
COMMIT;

-- Table: WaterType
DROP TABLE WaterType;
CREATE TABLE WaterType ( 
    WaterTypeID   INTEGER PRIMARY KEY,
    WaterTypeDesc TEXT 
);

BEGIN;
INSERT INTO WaterType (WaterTypeID, WaterTypeDesc) VALUES (1, 'Spring');
INSERT INTO WaterType (WaterTypeID, WaterTypeDesc) VALUES (2, 'Seep');
COMMIT;








