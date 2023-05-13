from flask import Flask
from api.routes import registerBlueprints

#-----------------------------------------------------------------
# Función para crear la api con el microframework flask
#-----------------------------------------------------------------
def createApi():
    api = Flask(__name__)
    registerBlueprints(api) #registro de rutas
    return api