from api.repositories.models import inspectores, inventarioMateriales, logProducciones, productos,materiales
from api.repositories.SP_repository import NoPoolEngine, poolEngine
from sqlalchemy import select
from sqlalchemy.orm import sessionmaker

def executeSPbyORM():
    conexion = poolEngine
    Session = sessionmaker(bind=conexion)
    session = Session()

    query = select(productos.descripcion, materiales.nombre,
        inventarioMateriales.cantidad).select_from(productos).join(logProducciones).join(
        inventarioMateriales, inventarioMateriales.produccionId == logProducciones.produccionId).join(
        materiales,materiales.materialId == inventarioMateriales.materialId).where(
        logProducciones.produccionId < 100).order_by(logProducciones.produccionId)

    res = session.execute(query)

    resfetched = res.fetchall()
    session.close()
    resJSON = []
    for i in resfetched:
        resJSON.append({"Cantidad": i[2],
                        "DescripcionProducto":i[0],
                        "NombreMaterial":i[1]})
    return resJSON
