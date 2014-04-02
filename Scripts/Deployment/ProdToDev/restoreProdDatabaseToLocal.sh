#!/bin/bash
dropdb -h localhost fsp
pg_dump -C -h geo.torstenernst.com -U postgres -c fsp | psql -h localhost -U postgres 
