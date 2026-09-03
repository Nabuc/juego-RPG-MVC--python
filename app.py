from flask import Flask, jsonify
from modelo.repositorio import RepositorioPersonajes
app = Flask(__name__)

@app.route('/personajes', methods=['GET'])
def obtener_personajes():
    return jsonify(RepositorioPersonajes.personajes)

if __name__ == '__main__':
    app.run(debug=True, port=5000)
