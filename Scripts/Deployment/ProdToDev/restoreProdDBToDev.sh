pg_dump -U postgres -h geodb.c2h2tdeag68s.us-west-2.rds.amazonaws.com -n public fsp --clean > ~/Downloads/fsp_backup.sql
psql -U postgres -h localhost -d geoforst -f ~/Downloads/fsp_backup.sql
