from sqlalchemy import create_engine, text
from sqlalchemy.pool import NullPool

#-----------------------------------------------------------------
# Iniciar la conexion a la base de datos
#-----------------------------------------------------------------
username = "sa"
password = "123"
server = "localhost"
port = "1433"
database = "esencialDB"
driver = "ODBC Driver 17 for SQL Server"

poolEngine = create_engine(f"mssql+pyodbc://{username}:{password}@{server}:{port}/{database}?driver={driver}", pool_size=5, max_overflow=10)
NoPoolEngine = create_engine(f"mssql+pyodbc://{username}:{password}@{server}:{port}/{database}?driver={driver}", poolclass=NullPool)

#-----------------------------------------------------------------
# Funcion para ejecutar el stored procedure
# True: Utilizar conexiones pool || False Sin conexiones
#-----------------------------------------------------------------
def executeSP(pool):
    if pool:
            conexion = poolEngine
    else:
        conexion = NoPoolEngine

    query = text("EXEC SP_apitest") #Ejecucion del SP en formato sql
    with conexion.connect() as cursor:
        res = cursor.execute(query)
        keys = res.keys()
        # Mete los resultados en diccionarios para el formato json posteriormente
        resJSON = [dict(zip(keys, row)) for row in res.fetchall()]
        cursor.close()
        return resJSON