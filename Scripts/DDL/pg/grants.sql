create user cernst login inherit;
ALTER ROLE cernst ENCRYPTED PASSWORD 'md50c0718d13edf4bb454f99c6d45c97754'
   VALID UNTIL '2013-12-31 00:00:00';
   
create user ternst login inherit;
ALTER ROLE ternst ENCRYPTED PASSWORD 'md5f5f1f55bac05126a41f6d3e9d371fd5b'
   VALID UNTIL '2013-12-31 00:00:00';

create role fsp_read;
create role fsp_edit;
create role fsp_admin;

grant fsp_edit to cernst;
grant fsp_admin to ternst;

GRANT CONNECT, TEMPORARY ON DATABASE fsp TO public;
GRANT ALL ON DATABASE fsp TO postgres;
GRANT CONNECT ON DATABASE fsp TO fsp_read;
GRANT CONNECT, TEMPORARY ON DATABASE fsp TO fsp_edit;
GRANT ALL ON DATABASE fsp TO fsp_admin;

grant select on all tables in schema public to fsp_read;
grant select, update, insert, delete on all tables in schema public to fsp_edit;
grant usage, select, update on all sequences in schema public to fsp_edit;
grant all on all tables in schema public to fsp_admin;
grant usage, select, update on all sequences in schema public to fsp_admin;