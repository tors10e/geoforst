#!/usr/bin/env python
# -*- coding: utf-8 -*-
 
 
# Standard imports
import sys
import os
from optparse import OptionParser
 
# psycopg2 import
try:
    import psycopg2 
except ImportError, e:
    print 'You must install the python module named "psycopg2" in order to use this module.'
    sys.exit(os.EX_SOFTWARE)
 
class PgRepairman:
    def __init__(self, options, parser):
        self.options = options
        try:
            dsn = "host=geo.torstenernst.com port=5432 dbname=fsp user=postgres password=post28#Inca"
          #  dsn = "dbname=%s host=%s user=%s" % (options.db, options.host, options.user)
           # dsn += ("" != options.passwd) and ("password=%s" % options.password) or ""
            self.conn = psycopg2.connect(dsn)
            self.curs = self.conn.cursor()
        except Exception, e:
            print "ERROR - %s" % e
            sys.exit(1)
 
 
    # Returns a dict for a psycopg2 row object
    def _to_dict(self, desc, res):
        return dict(zip([x[0] for x in desc], res))
 
 
    # Attempt to locate all custom sequences
    def findSequences(self):
        seq_query = """
        SELECT pc1.relname AS seq, pc2.relname AS table, c.attname AS field 
        FROM pg_depend, pg_class pc1, pg_class pc2, pg_attribute c 
        WHERE pc1.oid = pg_depend.objid 
            AND pc2.oid = pg_depend.refobjid 
            AND c.attnum = pg_depend.refobjsubid 
            AND c.attrelid = pc2.oid 
            AND pc1.relkind = 'S' 
            AND pc1.relname NOT LIKE 'pg_toast%%'
        """
 
        try:
            self.print_verbose(seq_query)
            self.curs.execute(seq_query)
        except Exception, e:
            print "[ERROR] - %s" % e
            sys.exit(1)
 
        desc = self.curs.description
        for row in self.curs.fetchall():
            yield self._to_dict(desc, row)
 
 
    # Increment the key value to the value of the sequence + 1
    def fixSequences(self):
        for seq in self.findSequences():
            print "Fixing sequence %s in table %s" % (seq['seq'], seq['table'])
            fix_query = "SELECT setval('%s', COALESCE((SELECT %s FROM %s ORDER BY %s DESC LIMIT 1), 0)+1)" % (seq['seq'], seq['field'], seq['table'], seq['field'])
            try:
                self.print_verbose(fix_query)
                self.curs.execute(fix_query)
            except Exception, e:
                print "[WARNING] - %s" % e
                pass
 
    def print_verbose(self, msg):
        if (True == self.options.verbose):
            print "[DEBUG] - %s" % msg
 
if __name__=='__main__':
    usage       = "Usage: %prog <options> [-v --verbose] [-u --username | -p --password \ -o --host | -d --database]"
    version     = "%prog v1.0\nDistributed under the LGPL2 License"
    description = "Increments all sequences in a PostgreSQL database"
    parser = OptionParser(usage=usage, version=version, description=description)
    parser.add_option("-v", "--verbose", action="store_true", dest="verbose", default=False, help="Enable extra output")
    parser.add_option("-o", "--host", action="store", dest="host", default="127.0.0.1", help="Database hostname/IP")
    parser.add_option("-u", "--username", action="store", dest="user", default="postgres", help="Database Username")
    parser.add_option("-p", "--password", action="store", dest="passwd", default="", help="Database Password")
    parser.add_option("-d", "--database", action="store", dest="db", default="template1", help="Database Name")
 
 
    try:
        (options, args) = parser.parse_args()
        obj = PgRepairman(options, parser)
        obj.fixSequences()
    except KeyboardInterrupt, e:
        sys.exit(1)
