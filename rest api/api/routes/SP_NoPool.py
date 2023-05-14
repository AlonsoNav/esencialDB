from flask import Blueprint, jsonify, request
from api.controllers import SP_controller

#-----------------------------------------------------------------
# Función para ejecutar el request sin conexion POOL
# Se define la ruta y además se adaptan los resultado a formato JSON
#-----------------------------------------------------------------

bp = Blueprint('NoPool', __name__, url_prefix='/NoPool') #Ruta

@bp.route('/', methods=['POST'])
def SPExecuteNoPool():
    result = SP_controller.controllerExecuteSP(False)
    return jsonify(result) # Adapta a resultado JSON