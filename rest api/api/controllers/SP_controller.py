from api.repositories.SP_repository import executeSP

#-----------------------------------------------------------------
# Controlador de logica de datos
# Llama a funcion repository que es la que tiene
#-----------------------------------------------------------------
def controllerExecuteSP(pool):
    return executeSP(pool)