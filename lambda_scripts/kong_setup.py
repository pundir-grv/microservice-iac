import psycopg2
from get_rds_creds import get_secret, get_dbDetails

def main():
    dbEndpoint, dbName = get_dbDetails()
    dbCreds = get_secret()
    print(dbEndpoint, dbName, dbCreds)

if __name__ == "main":
    main()