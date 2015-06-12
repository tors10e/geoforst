pg_dump -U postgres -h geo.torstenernst.com -n public fsp --clean > ~/Downloads/fsp_backup.sql
psql -U postgres -h localhost -d fsp -f ~/Downloads/fsp_backup.sql
