create or replace function test_cursor() returns text as $$
DECLARE
   col_cursor CURSOR for  
      	select table_name
      ,column_name
      , trim(trailing '::regclass)' from substring(column_default from 10 for 100)) as sequence_name
    from information_schema.columns
    where column_default like 'nextval%';

    v_table_name varchar(50);
    v_column_name varchar(50);
    v_sequence_name varchar(50);
    
begin
--fetch col_cursor into v_table_name, v_column_name, v_sequence_name;
for recordvar in col_cursor loop
end loop;
  return 'hello';
end;
$$ LANGUAGE plpgsql;
