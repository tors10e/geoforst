import sqlite3

qry = open('test.sql', 'r').read()
conn = sqlite3.connect('/Users/torsten/Documents/GIS/FSP/FSP.sqlite')
c = conn.cursor()
c.execute(qry)
conn.commit()
c.close()
conn.close()