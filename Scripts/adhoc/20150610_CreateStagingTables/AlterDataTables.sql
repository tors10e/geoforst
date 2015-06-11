ALTER TABLE land_area  
  ADD CONSTRAINT unq_land_area UNIQUE (name, created_by_id);
