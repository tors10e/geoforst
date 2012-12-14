-- Table: RoadType
CREATE TABLE "FSP".RoadType ( 
    RoadTypeID   SERIAL PRIMARY KEY,
    RoadTypeDesc TEXT 
);

-- Table: ActivityType
CREATE TABLE "FSP".ActivityType ( 
    ActTypeID   SERIAL PRIMARY KEY,
    ActTypeDesc TEXT 
);

-- Table: COGO
CREATE TABLE "FSP".COGO ( 
    PK_UID     SERIAL PRIMARY KEY,
    Shape_Leng DOUBLE PRECISION,
    Direction  TEXT,
    Distance   TEXT,
    Delta      TEXT,
    Radius     TEXT,
    Tangent    TEXT,
    ArcLength  TEXT,
    Side       TEXT,
    Geometry   GEOMETRY
);




-- Table: Contours
CREATE TABLE "FSP".Contours ( 
    PK_UID     SERIAL PRIMARY KEY,
    CONTOUR    DOUBLE PRECISION,
    Shape_Leng DOUBLE PRECISION,
    ID         DOUBLE PRECISION,
    Geometry   geometry
);




-- Table: ControlGEOMETRYs
CREATE TABLE "FSP".ControlGEOMETRYs ( 
    PK_UID     SERIAL PRIMARY KEY,
    Descriptio TEXT,
    X          DOUBLE PRECISION,
    Y          DOUBLE PRECISION,
    Status     TEXT,
    Geometry   Geometry 
);




-- Table: Corners
CREATE TABLE "FSP".Corners ( 
    PK_UID    SERIAL PRIMARY KEY,
    ID        DOUBLE PRECISION,
    LATITUDE  DOUBLE PRECISION,
    LONGITUDE DOUBLE PRECISION,
    Geometry  Geometry 
);

-- Table: SMZs
CREATE TABLE "FSP".SMZs ( 
    PK_UID     SERIAL      PRIMARY KEY,
    Id         INTEGER,
    Shape_Leng DOUBLE PRECISION,
    ET_ID      TEXT,
    Shape_Area DOUBLE PRECISION,
    Geometry   Geometry 
);

-- Table: stand_ops
CREATE TABLE "FSP".stand_ops ( 
    stand_op_id  SERIAL PRIMARY KEY,
    stand_id     INTEGER,
    operation_id INTEGER,
    FOREIGN KEY ( stand_id ) REFERENCES Stands ( stand_id ) 
);




-- Table: Streams
CREATE TABLE "FSP".Streams ( 
    PK_UID     SERIAL    PRIMARY KEY ,
    Shape_Leng DOUBLE PRECISION,
    Type       TEXT,
    Name       TEXT,
    Geometry   Geometry 
);



-- Table: LandArea
CREATE TABLE "FSP".LandArea ( 
    LandAreaID   INTEGER      PRIMARY KEY,
    LandAreaDesc TEXT,
    Geometry     Geometry,
    Area_Acres   NUMERIC(6,2) 
);




-- Table: TreeGEOMETRY
CREATE TABLE "FSP".TreeGEOMETRY ( 
    TreePtID  SERIAL PRIMARY KEY,
    Species   TEXT,
    StartYear TEXT,
    Geometry  GEOMETRY 
);




-- Table: StandArea
CREATE TABLE "FSP".StandArea ( 
    StandAreaID SERIAL PRIMARY KEY,
    Stand_No    INTEGER,
    StandDesc   TEXT,
    Age         TEXT,
    Geometry    GEOMETRY 
);




-- Table: ActivityArea
CREATE TABLE "FSP".ActivityArea ( 
    ActAreaID  INTEGER     PRIMARY KEY,
    ActTypeID  INTEGER,
    ActDesc    TEXT,
    ActAge     TEXT,
    Revenue    REAL,
    Geometry   GEOMETRY,
    ActDate    TEXT,
    Area_Acres NUMERIC(6,2),
    CONSTRAINT fk_ActivityArea_ActivityType FOREIGN KEY ( ActTypeID ) REFERENCES ActivityType ( ActTypeID ) 
);




-- Table: CulturalType
CREATE TABLE "FSP".CulturalType ( 
    CultTypeID   INTEGER PRIMARY KEY,
    CultTypeDesc TEXT 
);




-- Table: CulturalGEOMETRY
CREATE TABLE "FSP".CulturalGEOMETRY ( 
    CultPtID   SERIAL PRIMARY KEY,
    CultTypeID INTEGER,
    CultPtDesc TEXT,
    Geometry   GEOMETRY,
    CONSTRAINT fk_CulturalGEOMETRY_CulturalType FOREIGN KEY ( CultTypeID ) REFERENCES CulturalType ( CultTypeID ) 
);




-- Table: HabitatEnhancementType
CREATE TABLE "FSP".HabitatEnhancementType ( 
    HabEnhTypeID   SERIAL PRIMARY KEY,
    HabEnhTypeDesc TEXT 
);




-- Table: HabitatEnhancementGEOMETRY
CREATE TABLE "FSP".HabitatEnhancementGEOMETRY ( 
    HabEnhPtID   SERIAL PRIMARY KEY,
    HabEnhTypeID INTEGER,
    HabEnhPtDesc TEXT,
    Geometry     GEOMETRY,
    CONSTRAINT fk_HabitatEnhancementGEOMETRY_HabitatEnhancementType FOREIGN KEY ( HabEnhTypeID ) REFERENCES HabitatEnhancementType ( HabEnhTypeID ) 
);




-- Table: HabitatEnhancementArea
CREATE TABLE "FSP".HabitatEnhancementArea ( 
    HabEnhAreaID   SERIAL PRIMARY KEY,
    HabEnhTypeID   INTEGER,
    HabEnhAreaDesc TEXT,
    Geometry       GEOMETRY,
    CONSTRAINT fk_HabitatEnhancementArea_HabitatEnhancementType FOREIGN KEY ( HabEnhTypeID ) REFERENCES HabitatEnhancementType ( HabEnhTypeID ) 
);




-- Table: RecreationType
CREATE TABLE "FSP".RecreationType ( 
    RecTypeID   INTEGER PRIMARY KEY,
    RecTypeDesc TEXT 
);




-- Table: RecreationPoint
CREATE TABLE "FSP".RecreationPoint ( 
    RecPtID   SERIAL PRIMARY KEY,
    RecTypeID INTEGER,
    RecPtDesc TEXT,
    Geometry  GEOMETRY,
    CONSTRAINT fk_RecreationPoint_RecreationType FOREIGN KEY ( RecTypeID ) REFERENCES "FSP".RecreationType ( RecTypeID ) 
);




-- Table: RoadLine
CREATE TABLE "FSP".RoadLine ( 
    RoadLnID     SERIAL PRIMARY KEY,
    RoadTypeID   INTEGER,
    RoadLnDesc   TEXT,
    Geometry     Geometry,
    AccessStatus TEXT,
    Surface      TEXT,
    Name         TEXT,
    CONSTRAINT fk_RoadLine_RoadType FOREIGN KEY ( RoadTypeID ) REFERENCES "FSP".RoadType ( RoadTypeID ) 
);




-- Table: WaterType
CREATE TABLE "FSP".WaterType ( 
    WaterTypeID   INTEGER PRIMARY KEY,
    WaterTypeDesc TEXT 
);




-- Table: WaterPoint
CREATE TABLE WaterGEOMETRY ( 
    WaterPtID   SERIAL PRIMARY KEY,
    WaterTypeID INTEGER,
    WaterPtDesc TEXT,
    Geometry    GEOMETRY,
    CONSTRAINT fk_WaterPoint_WaterType FOREIGN KEY ( WaterTypeID ) REFERENCES "FSP".WaterType ( WaterTypeID ) 
);




-- Table: FireBreakLine
CREATE TABLE "FSP".FireBreakLine ( 
    FireBreakLnID     INTEGER      PRIMARY KEY,
    FireBreakTypeDesc TEXT,
    Geometry          GEOMETRY,
    Length_M          NUMERIC(6,2) 
);



-- Table: HabitatEnhancementActivity
CREATE TABLE "FSP".HabitatEnhancementActivity ( 
    HabEnhActID  SERIAL NOT NULL
                         PRIMARY KEY,
    HabEnhAreaID INTEGER,
    ActTypeID    INTEGER,
    PlannedYear  TEXT,
    ActDesc      TEXT,
    ActDate      DATE,
    Revenue      NUMERIC(7,2),
    Complete     TEXT,
    CONSTRAINT fk_HabEnhActivity_ActivityType FOREIGN KEY ( ActTypeID ) REFERENCES "FSP".ActivityType ( ActTypeID ),
    CONSTRAINT fk_HEActivity_HEArea FOREIGN KEY ( HabEnhActID ) REFERENCES "FSP".HabitatEnhancementArea ( HabEnhAreaID ) 
);






-- Table: StandStatus
CREATE TABLE "FSP".StandStatus ( 
    StandStatusID        SERIAL      NOT NULL
                                      PRIMARY KEY,
    StandAreaID          INTEGER,
    Date                 DATE,
    Age                  VARCHAR( 25 ),
    Stocking             VARCHAR( 25 ),
    Damaged              VARCHAR( 3 ),
    Recomended_Treatment VARCHAR( 100 ),
    Description          VARCHAR(250),
    Notes                VARCHAR(250),
    CONSTRAINT fk_StandStatus_StandArea FOREIGN KEY ( StandAreaID ) REFERENCES "FSP".StandArea ( StandAreaID ) 
);




-- Table: AgeType
CREATE TABLE "FSP".AgeType ( 
    AgeTypeID   INTEGER    PRIMARY KEY,
    AgeTypeDesc VARCHAR( 25 ) 
);



-- Table: StockingType
CREATE TABLE "FSP".StockingType ( 
    StockingTypeID   INTEGER     PRIMARY KEY,
    StockingTypeDesc VARCHAR( 25 ) 
);


-- Table: HarvestType
CREATE TABLE "FSP".HarvestType ( 
    HarvestTypeID   INTEGER     PRIMARY KEY,
    HarvestTypeDesc VARCHAR( 25 ) 
);




-- Table: HarvestArea
CREATE TABLE "FSP".HarvestArea ( 
    HarvestAreaID SERIAL   PRIMARY KEY,
    Geometry      GEOMETRY,
    Activity_Date DATE,
    HarvestTypeID INTEGER,
    Description   VARCHAR( 100 ),
    ActTypeID     INTEGER,
    CONSTRAINT fk_Harvest_HarvestType FOREIGN KEY ( HarvestTypeID ) REFERENCES "FSP".HarvestType ( HarvestTypeID ) 
);




-- Table: StandActivity
CREATE TABLE "FSP".StandActivity ( 
    StandActID    SERIAL         NOT NULL
                                  PRIMARY KEY ,
    StandAreaID   INTEGER,
    ActTypeID     INTEGER,
    PlannedDate   DATE,
    CompletedDate DATE,
    Description   VARCHAR( 100 ),
    Notes         VARCHAR( 100 ),
    Revenue       NUMERIC( 8, 2 ),
    CONSTRAINT fk_StandActivity_ActivityType FOREIGN KEY ( ActTypeID ) REFERENCES "FSP".ActivityType ( ActTypeID ),
    CONSTRAINT fk_StandActivity_Stand FOREIGN KEY ( StandAreaID ) REFERENCES "FSP".StandArea ( StandAreaID ) 
);


-- Table stand activity
CREATE TABLE StandActivity ( 
    StandActID    SERIAL PRIMARY KEY 
                                  NOT NULL,
    StandAreaID   INTEGER,
    ActTypeID     INTEGER,
    PlannedDate   DATE,
    CompletedDate DATE,
    Description   TEXT,
    Notes         TEXT,
    Revenue       DOUBLE PRECISION,
    CONSTRAINT fk_StandActivity_ActivityType FOREIGN KEY ( ActTypeID ) REFERENCES ActivityType ( ActTypeID ) 
);


-- View: vwHabitatEnhancementPt
CREATE VIEW "FSP".vwHabitatEnhancementPt AS
       SELECT a.ROWID AS ROWID,
              a.Geometry AS Geometry,
              b.HabEnhTypeDesc AS HabEnhTypeDesc
         FROM "FSP".HabitatEnhancementGEOMETRY AS a
              JOIN HabitatEnhancementType AS b
                   USING ( HabEnhTypeID );


-- View: vwPlannedStandActivities
CREATE VIEW vwPlannedStandActivities AS
       SELECT a.ROWID AS ROWID,
              a.Stand_No AS Stand_No,
              a.StandDesc AS StandDesc,
              a.Age AS Age,
              a.Geometry AS Geometry,
              b.PlannedYear AS PlannedYear,
              b.ActDesc AS ActDesc,
              b.ActDate AS ActDate,
              b.Revenue AS Revenue
         FROM StandArea AS a
              JOIN PlannedActivity AS b
                ON ( a.Stand_No = b.StandID );


-- View: vwHabitatEnhancementArea
CREATE VIEW vwHabitatEnhancementArea AS
       SELECT a.ROWID AS ROWID,
              a.HabEnhAreaDesc AS HabEnhAreaDesc,
              a.Geometry AS Geometry,
              b.HabEnhTypeDesc AS HabEnhTypeDesc
         FROM HabitatEnhancementArea AS a
              JOIN HabitatEnhancementType AS b
                   USING ( HabEnhTypeID );


-- View: vwRoads
CREATE VIEW vwRoads AS
       SELECT a.ROWID AS ROWID,
              a.RoadLnDesc AS RoadLnDesc,
              a.Geometry AS Geometry,
              a.AccessStatus AS AccessStatus,
              a.Surface AS Surface,
              a.Name AS Name,
              b.RoadTypeDesc AS RoadTypeDesc
         FROM RoadLine AS a
              JOIN RoadType AS b
                ON ( a.RoadTypeID = b.RoadTypeDesc );


-- View: vwCulturalPts
CREATE VIEW vwCulturalPts AS
       SELECT a.ROWID AS ROWID,
              a.CultPtDesc AS CultPtDesc,
              a.Geometry AS Geometry,
              b.CultTypeDesc AS CultTypeDesc
         FROM CulturalGEOMETRY AS a
              JOIN CulturalType AS b
                   USING ( CultTypeID );


-- View: vwRecreationPts
CREATE VIEW vwRecreationPts AS
       SELECT a.ROWID AS ROWID,
              a.RecPtDesc AS RecPtDesc,
              a.Geometry AS Geometry,
              b.RecTypeDesc AS RecTypeDesc
         FROM RecreationGEOMETRY AS a
              JOIN RecreationType AS b
                   USING ( RecTypeID );


-- View: vwWaterGEOMETRYs
CREATE VIEW vwWaterGEOMETRYs AS
       SELECT a.ROWID AS ROWID,
              a.WaterPtID AS WaterPtID,
              b.WaterTypeDesc AS WaterTypeDesc,
              a.WaterPtDesc AS WaterPtDesc,
              a.Geometry AS Geometry
         FROM WaterGEOMETRY AS a
              JOIN WaterType AS b
                   USING ( WaterTypeID );





