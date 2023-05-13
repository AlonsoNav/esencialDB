from flask import Flask
from api.routes import SP_Pool, SP_NoPool
#-----------------------------------------------------------------
# Función para registrar las rutas dentro del api
#-----------------------------------------------------------------
def registerBlueprints(app: Flask):
    app.register_blueprint(SP_Pool.bp)
    app.register_blueprint(SP_NoPool.bp)
