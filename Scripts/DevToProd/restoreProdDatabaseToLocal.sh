#!/bin/bash
pg_dump -h geo.torstenernst.com -U postgres  fsp | psql -h localhost -U postgres fsp
