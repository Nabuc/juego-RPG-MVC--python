from flask import Flask, request , redirect, render_template
from modelo.personaje import Personaje
from modelo.repositorio import RepositorioPersonajes
app = Flask(__name__)

@app.route('/personajes', methods=['GET'])
def obtener_personajes():
    return render_template("personajes.html", personajesRPG = RepositorioPersonajes.obtenerTodos())
@app.route('/personajes', methods=['POST'])
def crear_personaje():
    nombre = request.form['nombre']
    claseRPG = request.form['claseRPG']
    nivel = request.form['nivel']
    vida = request.form['vida']
    nuevoPersonaje = Personaje(nombre,claseRPG,nivel,vida)
    RepositorioPersonajes.ListaPersonajes.append(nuevoPersonaje)
    return redirect('/personajes')
if __name__ == '__main__':
    app.run(debug=True, port=5000)
