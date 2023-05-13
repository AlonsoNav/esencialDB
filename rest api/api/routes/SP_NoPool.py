from flask import Blueprint, jsonify, request
from api.controllers import SP_controller

bp = Blueprint('NoPool', __name__, url_prefix='/NoPool') #Ruta

@bp.route('/', methods=['POST'])
def SPExecuteNoPool():
    result = SP_controller.controllerExecuteSP(False)
    return jsonify(result)