import psycopg2
import json
from get_rds_creds import get_secret, get_dbDetails

def main(event, context):
    dbEndpoint, dbName = get_dbDetails()
    dbCreds = json.loads(get_secret())
    print("step1")
    conn = psycopg2.connect(
        host=dbEndpoint.split(":")[0],
        port=dbEndpoint.split(":")[1],
        database=dbName, 
        user=dbCreds["username"], 
        password=dbCreds["password"]
    )
    print("step2")
    cur = conn.cursor()
    print('PostgreSQL database version:')
    cur.execute('SELECT version()')
    db_version = cur.fetchone()
    print(db_version)
    cur.close()
    
