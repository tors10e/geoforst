# Ogr2Ogr commands.
import psycopg2

def create_ogr_command(host, port, user, password, source_database, dest_database, table, lc_options):
    try:
        command = "ogr2ogr -update -append -preserve_fid "
        format_name = "-f PostgreSQL"
        dst_datasource = "PG:\"host={host} port={port} user={user} password={pwd} dbname={dest_database}\"".format(host=host, port=port, user=user, pwd=password, dest_database=dest_database)
        src_datasource = "{src_database}".format(src_database=source_database)
        table =  "{table[0]}".format(table=table)
        layer_creation_options = "-lco SCHEMA={schema}".format(schema=lc_options)
        command = " ".join([command, layer_creation_options, format_name, dst_datasource, src_datasource, table])
        
        return command
    except:
        print("Unable to create ogr2ogr command.")
        
def delete_features(conn_string, table, user_id=None,):
    """ Deletes features from the database for a user ID is given, 
    if no user_id is given it deletes all records"""
    try:
        conn = create_connection(conn_string) 
        if user_id == None:
            execute_sql(conn,"delete from %s;" %(table))
            execute_sql(conn,"commit;")
        else:
            execute_sql(conn,"delete from %s where created_by_id = %s;" %(table[0], user_id))
        
    except:
        print("Unable to delete old features.")

def update_user(conn_string, table, user_id=None,):
    """ Updates created_by fields for a table to the passed user ID"""
    try:
        conn = create_connection(conn_string) 
        if user_id == None:
            print("User ID not provided.")
        else:
            print("Updating user ID for table %s" %(table[0]))
            execute_sql(conn,"update %s set created_by_id = %s;" %(table[0], user_id))
            execute_sql(conn,"commit;")
        
    except:
        print("Unable to user ID for table %s." %(table[0]))
                
def get_user_id(conn_string, user_name):
    try:
        conn = create_connection(conn_string)
        sql = "select id from auth_user where username = \'%s\';" %(user_name)
        scalar = execute_sql_scalar(conn, sql)
        if scalar:
            return scalar[0]
        else:
            print("No user id returned for user %s" %(user_name))
    except:
        print("Unable to get user_id.")

def create_connection(conn_string):
    try:
        conn = psycopg2.connect(conn_string)
        return conn
    except :
        print("Cannot connect to database.")
        
def execute_sql(connection, sql_statement):
    try:
        conn=connection
        cur = conn.cursor()
        cur.execute(sql_statement)
        cur.close()
    except :
        print("Unable to execute {0}".format(sql_statement))
    
def execute_sql_scalar(connection, sql_statement):
    try:
        conn=connection
        cur = conn.cursor()
        cur.execute(sql_statement)
        scalar = cur.fetchone()
        cur.close()    
        return scalar
    except:
        print("Unable to execute {0}".format(sql_statement))