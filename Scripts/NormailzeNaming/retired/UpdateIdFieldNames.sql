-- Update Cultural point.
ALTER SEQUENCE public.culturalpoint_ogc_fid_seq
  RENAME TO culturalpoint_cultptid_seq;
ALTER TABLE public.culturalpoint RENAME ogc_fid  TO "CultPtID";
ALTER TABLE public.culturalpoint
   ALTER COLUMN "CultPtID" SET DEFAULT nextval('culturalpoint_cultptid_seq'::regclass);

-- Update firebreakline point.
ALTER SEQUENCE public.firebreakline_ogc_fid_seq
  RENAME TO firebreakline_firebreaklineid_seq;
ALTER TABLE public.firebreakline RENAME ogc_fid  TO "FireBreakLineID";
ALTER TABLE public.firebreakline
   ALTER COLUMN "FireBreakLineID" SET DEFAULT nextval('firebreakline_firebreaklineid_seq'::regclass);

-- Update habitatenhancementarea .
ALTER SEQUENCE public.habitatenhancementarea_ogc_fid_seq
  RENAME TO habitatenhancementarea_HabEnhAreaID_seq;
ALTER TABLE public.habitatenhancementarea RENAME ogc_fid  TO "HabEnhAreaID";
ALTER TABLE public.habitatenhancementarea
   ALTER COLUMN "HabEnhAreaID" SET DEFAULT nextval('habitatenhancementarea_HabEnhAreaID_seq'::regclass);

-- Update habitatenhancementpoint.
ALTER SEQUENCE public.habitatenhancementpoint_ogc_fid_seq
  RENAME TO habitatenhancementpoint_HabEnhPointID_seq;
ALTER TABLE public.habitatenhancementpoint RENAME ogc_fid  TO "HabEnhPtID";
ALTER TABLE public.habitatenhancementpoint
   ALTER COLUMN "HabEnhPtID" SET DEFAULT nextval('habitatenhancementpoint_HabEnhPointID_seq'::regclass);

-- Update harvestarea.
ALTER SEQUENCE public.harvestarea_ogc_fid_seq
  RENAME TO harvestarea_HarvestAreaID_seq;
ALTER TABLE public.harvestarea RENAME ogc_fid  TO "HarvestAreaID";
ALTER TABLE public.harvestarea
   ALTER COLUMN "HarvestAreaID" SET DEFAULT nextval('harvestarea_HarvestAreaID_seq'::regclass);

-- Update landarea.
ALTER SEQUENCE public.landarea_ogc_fid_seq
  RENAME TO landarea_LandAreaID_seq;
ALTER TABLE public.landarea RENAME ogc_fid  TO "LandAreaID";
ALTER TABLE public.landarea
   ALTER COLUMN "LandAreaID" SET DEFAULT nextval('landarea_LandAreaID_seq'::regclass);

-- Update RecreationPoint.
ALTER SEQUENCE public.RecreationPoint_ogc_fid_seq
  RENAME TO RecreationPoint_RecPtID_seq;
ALTER TABLE public.RecreationPoint RENAME ogc_fid  TO "RecPtID";
ALTER TABLE public.RecreationPoint
   ALTER COLUMN "RecPtID" SET DEFAULT nextval('RecreationPoint_RecPtID_seq'::regclass);

-- Update RoadLine.
ALTER SEQUENCE public.roadline_ogc_fid_seq
  RENAME TO RoadLine_RoadLnID_seq;
ALTER TABLE public.RoadLine RENAME ogc_fid  TO "RoadLnID";
ALTER TABLE public.RoadLine
   ALTER COLUMN "RoadLnID" SET DEFAULT nextval('RoadLine_RoadLnID_seq'::regclass);

-- Update StandArea.
ALTER SEQUENCE public.standarea_ogc_fid_seq
  RENAME TO standarea_StandAreaID_seq;
ALTER TABLE public.standarea RENAME ogc_fid  TO "StandAreaID";
ALTER TABLE public.standarea
   ALTER COLUMN "StandAreaID" SET DEFAULT nextval('standarea_StandAreaID_seq'::regclass);

-- Update TreePoint.
ALTER SEQUENCE public.TreePoint_ogc_fid_seq
  RENAME TO TreePoint_TreePtID_seq;
ALTER TABLE public.TreePoint RENAME ogc_fid  TO "TreePtID";
ALTER TABLE public.TreePoint
   ALTER COLUMN "TreePtID" SET DEFAULT nextval('TreePoint_TreePtID_seq'::regclass);

-- Update WaterPoint.
ALTER SEQUENCE public.WaterPoint_ogc_fid_seq
  RENAME TO WaterPoint_WaterPtID_seq;
ALTER TABLE public.WaterPoint RENAME ogc_fid  TO "WaterPtID";
ALTER TABLE public.WaterPoint
   ALTER COLUMN "WaterPtID" SET DEFAULT nextval('WaterPoint_WaterPtID_seq'::regclass);






