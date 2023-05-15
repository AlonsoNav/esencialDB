from api.repositories.models import inspectores, inventarioMateriales, logProducciones
from api.repositories.SP_repository import NoPoolEngine
from sqlalchemy import select
from sqlalchemy.orm import sessionmaker

def executeSPbyORM():
    conexion = NoPoolEngine
    Session = sessionmaker(bind=conexion)
    session = Session()

    query = select(inspectores.nombre).select_from(inventarioMateriales).join(inspectores).join(logProducciones, logProducciones.produccionId == inventarioMateriales.produccionId).where(inspectores.inspectorId == logProducciones.inspectorId)

    res = session.execute(query)

    resfetched = res.fetchall()
    session.close()
    resJSON = []
    for i in resfetched:
        resJSON.append({"IdInspector": i[0]})
    return resJSON
