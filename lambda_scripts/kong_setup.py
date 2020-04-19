import sys
sys.path.insert(0,"./psycopg2")
import psycopg2
from get_rds_creds import get_secret, get_dbDetails

def main(event, context):
    dbEndpoint, dbName = get_dbDetails()
    dbCreds = get_secret()
    conn = psycopg2.connect(
        host=dbEndpoint.split(":")[0],
        port=dbEndpoint.split(":")[1],
        database=dbName, 
        user=dbCreds["username"], 
        password=dbCreds["password"]
    )
    cur = conn.cursor()
    print('PostgreSQL database version:')
    cur.execute('SELECT version()')
    db_version = cur.fetchone()
    print(db_version)
    cur.close()
    
