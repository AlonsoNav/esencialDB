from flask import Blueprint, jsonify, request
from api.controllers import ORM_controller

#-----------------------------------------------------------------
# Función para ejecutar el endpoint utilizando ORM
#-----------------------------------------------------------------

bp = Blueprint('ORM', __name__, url_prefix="/ORM")#RUTA

@bp.route("/", methods=["POST"])
def ORMexecute():
    result = ORM_controller.controllerExecuteSPbyORM()
    return jsonify(result) # Adapta a resultado JSON