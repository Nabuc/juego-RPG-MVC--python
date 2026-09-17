from flask import Flask, request , redirect, render_template
from model.personaje import Personaje
from model.repositorio import RepositorioPersonajes
from service.personajes_service import validar_personajes
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
    nuevoPersonaje.nivel = int(nuevoPersonaje.nivel)
    nuevoPersonaje.vida = int(nuevoPersonaje.vida)
    try:
        validar_personajes(nuevoPersonaje)
    except ValueError as e:
        return render_template("personajes.html", error=str(e))
    RepositorioPersonajes.ListaPersonajes.append(nuevoPersonaje)
    return redirect('/personajes')
if __name__ == '__main__':
    app.run(debug=True, port=5000)
