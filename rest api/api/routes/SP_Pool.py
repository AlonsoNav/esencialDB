from flask import Blueprint, jsonify, request
from api.controllers import SP_controller

#-----------------------------------------------------------------
# Función para ejecutar el request sin conexion POOL
# Se define la ruta y además se adaptan los resultado a formato JSON
#-----------------------------------------------------------------

bp = Blueprint('Pool', __name__, url_prefix='/Pool') #Ruta

@bp.route('/', methods=['POST'])
def SPExecutePool():
    result = SP_controller.controllerExecuteSP(True)
    return jsonify(result)