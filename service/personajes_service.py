import model.personaje
def validar_personajes(personaje):
    errores = []
    if personaje.nombre == "" or personaje.claseRPG == "" or personaje.nivel == "" or personaje.vida == "":
        errores.append("Todos los campos son obligatorios")
    if personaje.nivel < 1 or personaje.nivel > 100:
        errores.append("El nivel debe estar entre 1 y 100")
    if personaje.claseRPG not in ["Guerrero", "Mago", "Arquero"]:
        errores.append("Clase no válida")
    if personaje.vida < 0:
        errores.append("La vida debe ser un valor positivo")
    if errores:
        raise ValueError(" ".join(errores))
    return personaje