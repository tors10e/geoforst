
CREATE TABLE "StandArea" (StandAreaID INTEGER PRIMARY KEY AUTOINCREMENT
, Geometry MULTIPOLYGON
, "StandNo" INTEGER(3)
, "Description" TEXT(100) 
 );

CREATE TABLE "StandActivity"(
StandActID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
StandAreaID INTEGER(3),
ActTypeID INTEGER(2),
PlannedDate DATE,
CompletedDate DATE, 
Description TEXT(100),
Notes TEXT(100),
Revenue NUMBER(8,2),
CONSTRAINT fk_StandActivity_ActivityType
	FOREIGN KEY (ActTypeID)
	REFERENCES ActivityType (ActTypeID),
CONSTRAINT fk_StandActivity_Stand
	FOREIGN KEY (StandAreaID)
	REFERENCES StandArea (StandAreaID)
);

CREATE TABLE "StandStatus"(
StandStatusID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
StandNo INTEGER(3),
Date DATE,
Age TEXT(25),
Stocking TEXT(25),
Damaged TEXT(3),
Recommended_Treatment TEXT(100),
Description TEXT(100),
Notes TEXT(100),
CONSTRAINT fk_StandStatus_StandArea
	FOREIGN KEY (StandNo)
	REFERENCES StandArea (StandNo)
);

CREATE TABLE "LandArea" (
"LandAreaID" INTEGER PRIMARY KEY AUTOINCREMENT,
"LandAreaDesc" TEXT(25),
"Geometry" POLYGON);

CREATE TABLE "TreePoint" (
"TreePtID" INTEGER PRIMARY KEY AUTOINCREMENT,
"Species" TEXT(25), 
"StartYear" DATE,
"Geometry" POINT);

CREATE TABLE "ActivityArea" ("ActAreaID" INTEGER PRIMARY KEY AUTOINCREMENT,
"ActTypeID" INTEGER(2),
"ActDesc" TEXT(100),
"ActAge" TEXT(25),
"Revenue" REAL,
"Geometry" POLYGON,
CONSTRAINT fk_ActivityArea_ActivityType
	FOREIGN KEY (ActTypeID)
	REFERENCES ActivityType(ActTypeID)
);

CREATE TABLE "ActivityType" ("ActTypeID" INTEGER PRIMARY KEY AUTOINCREMENT,
"ActTypeDesc" TEXT);
	
	
CREATE TABLE "CulturalType" ("CultTypeID" INTEGER PRIMARY KEY AUTOINCREMENT,
"CultTypeDesc" TEXT);

CREATE TABLE "CulturalPoint" ("CultPtID" INTEGER PRIMARY KEY AUTOINCREMENT,
"CultTypeID" INTEGER,
"CultPtDesc" TEXT,
"Geometry" POINT,
CONSTRAINT fk_CulturalPoint_CulturalType
	FOREIGN KEY (CultTypeID)
	REFERENCES CulturalType(CultTypeID)
);

	
CREATE TABLE "HabitatEnhancementType" ("HabEnhTypeID" INTEGER PRIMARY KEY AUTOINCREMENT,
"HabEnhTypeDesc" TEXT);

CREATE TABLE "HabitatEnhancementPoint" ("HabEnhPtID" INTEGER PRIMARY KEY AUTOINCREMENT,
"HabEnhTypeID" INTEGER,
"HabEnhPtDesc" TEXT,
"Geometry" POINT,
CONSTRAINT fk_HabitatEnhancementPoint_HabitatEnhancementType
	FOREIGN KEY (HabEnhTypeID)
	REFERENCES HabitatEnhancementType(HabEnhTypeID)
);
	
CREATE TABLE "HabitatEnhancementArea" ("HabEnhAreaID" INTEGER PRIMARY KEY AUTOINCREMENT,
"HabEnhTypeID" INTEGER,
"HabEnhAreaDesc" TEXT,
"Geometry" POLYGON,
CONSTRAINT fk_HabitatEnhancementArea_HabitatEnhancementType
	FOREIGN KEY (HabEnhTypeID)
	REFERENCES HabitatEnhancementType(HabEnhTypeID)
);
	
CREATE TABLE "RecreationType" ("RecTypeID" INTEGER PRIMARY KEY AUTOINCREMENT,
"RecTypeDesc" TEXT);

CREATE TABLE "RecreationPoint" ("RecPtID" INTEGER PRIMARY KEY AUTOINCREMENT,
"RecTypeID" INTEGER,
"RecPtDesc" TEXT,
"Geometry" POINT,
CONSTRAINT fk_RecreationPoint_RecreationType
	FOREIGN KEY (RecTypeID)
	REFERENCES RecreationType(RecTypeID)
);
	
CREATE TABLE "RoadType" ("RoadTypeID" INTEGER PRIMARY KEY AUTOINCREMENT,
"RoadTypeDesc" TEXT);

CREATE TABLE "RoadLine" ("RoadLnID" INTEGER PRIMARY KEY AUTOINCREMENT,
"RoadTypeID" INTEGER,
"RoadLnDesc" TEXT,
"Geometry" LINESTRING,
"Name" TEXT,
"AccessStatus" TEXT,
"Surface" TEXT
CONSTRAINT fk_RoadLine_RoadType
	FOREIGN KEY (RoadTypeID)
	REFERENCES RoadType(RoadTypeID)
);
	
CREATE TABLE "WaterType" ("WaterTypeID" INTEGER PRIMARY KEY AUTOINCREMENT,
"WaterTypeDesc" TEXT);

CREATE TABLE "WaterPoint" ("WaterPtID" INTEGER PRIMARY KEY AUTOINCREMENT,
"WaterTypeID" INTEGER(2),
"WaterPtDesc" TEXT(100),
"Geometry" POINT,
CONSTRAINT fk_WaterPoint_WaterType
	FOREIGN KEY (WaterTypeID)
	REFERENCES WaterType(WaterTypeID)
);

CREATE TABLE "FireBreakLine"("FireBreakLnID" INTEGER PRIMARY KEY AUTOINCREMENT,
"FireBreakTypeDesc" TEXT, "Geometry" LINESTRING);

CREATE TABLE "ActivityType" ("ActTypeID" INTEGER PRIMARY KEY AUTOINCREMENT ,
"ActTypeDesc" TEXT(25)
);

CREATE TABLE "StockingType" (
"StockingTypeID" INTEGER PRIMARY KEY AUTOINCREMENT,
"StockingTypeDesc" TEXT(25)
);

CREATE TABLE "AgeType" (
"AgeTypeID" INTEGER PRIMARY KEY AUTOINCREMENT,
"AgeTypeDesc" TEXT(25)
);

CREATE TABLE "HarvestArea" (HarvestAreaID INTEGER PRIMARY KEY AUTOINCREMENT
, Geometry MULTIPOLYGON
, "Activity_Date" DATE
, "ActTypeID" INTEGER(2)
, "Description" TEXT(100) 
, CONSTRAINT fk_Harvest_ActivityType
	   FOREIGN KEY (ActTypeID)
	   REFERENCES ActivityType (ActTypeID)
 );

CREATE TABLE "HarvestType"(
"HarvestTypeID" INTEGER PRIMARY KEY AUTOINCREMENT
,"HarvestTypeDesc" TEXT(25)
);
