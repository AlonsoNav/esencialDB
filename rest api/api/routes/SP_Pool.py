from flask import Blueprint, jsonify, request
from api.controllers import SP_controller

bp = Blueprint('Pool', __name__, url_prefix='/Pool') #Ruta

@bp.route('/', methods=['POST'])
def SPExecutePool():
    result = SP_controller.controllerExecuteSP(True)
    return jsonify(result)