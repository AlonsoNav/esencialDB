from api.repositories import ORM_repository

#-----------------------------------------------------------------
# Controlador de logica de datos
#-----------------------------------------------------------------
def controllerExecuteSPbyORM():
    return ORM_repository.executeSPbyORM()