use rpg_manager;

db.personajes.insertMany([
  {
    nombre: "Thorgar",
    clase: "Guerrero",
    nivel: 15,
    vida: 150,
    ataque: 45,
    oro: 1200.50,
    inventario: [
      { nombre: "Espada Bastarda", tipo: "arma", valor: 350, cantidad: 1 },
      { nombre: "Armadura de Placas", tipo: "armadura", valor: 800, cantidad: 1 }
    ],
    misiones: [
      { titulo: "Cazería de Goblins", dificultad: "facil", recompensa: 100, estado: "completada" },
      { titulo: "Invasión Orca", dificultad: "media", recompensa: 300, estado: "aceptada" }
    ]
  },
  {
    nombre: "Elara",
    clase: "Mago",
    nivel: 18,
    vida: 90,
    mana: 200,
    ataque: 60,
    oro: 850.00,
    inventario: [
      { nombre: "Báculo de Arcanos", tipo: "arma", valor: 500, cantidad: 1 },
      { nombre: "Poción de Maná", tipo: "pocion", valor: 40, cantidad: 5 }
    ],
    misiones: [
      { titulo: "Estudio de Runas", dificultad: "media", recompensa: 250, estado: "completada" }
    ]
  },
  {
    nombre: "Kael",
    clase: "Mago",
    nivel: 14,
    vida: 85,
    mana: 180,
    ataque: 55,
    oro: 620.00,
    inventario: [
      { nombre: "Túnica de Seda", tipo: "armadura", valor: 200, cantidad: 1 }
    ],
    misiones: []
  },
  {
    nombre: "Brunhilda",
    clase: "Guerrero",
    nivel: 20,
    vida: 200,
    ataque: 50,
    oro: 2100.00,
    inventario: [
      { nombre: "Hacha de Batalla", tipo: "arma", valor: 600, cantidad: 1 }
    ],
    misiones: [
      { titulo: "Invasión Orca", dificultad: "media", recompensa: 300, estado: "completada" }
    ]
  },
  {
    nombre: "Merlinda",
    clase: "Mago",
    nivel: 22,
    vida: 100,
    mana: 250,
    ataque: 70,
    oro: 3400.00,
    inventario: [],
    misiones: []
  },
  {
    nombre: "Sylvan",
    clase: "Arquero",
    nivel: 16,
    vida: 105,
    precision: 92,
    ataque: 42,
    oro: 930.00,
    inventario: [
      { nombre: "Arco Largo", tipo: "arma", valor: 400, cantidad: 1 }
    ],
    misiones: []
  },
  {
    nombre: "Draven",
    clase: "Arquero",
    nivel: 12,
    precision: 95,
    vida: 110,
    ataque: 38,
    oro: 450.00,
    inventario: [],
    misiones: []
  },
  {
    nombre: "Nyx",
    clase: "Mago",
    nivel: 19,
    vida: 95,
    mana: 210,
    ataque: 65,
    oro: 1500.00,
    inventario: [],
    misiones: []
  }
]);

db.misiones.insertMany([
  { titulo: "Cazería de Goblins", dificultad: "facil", recompensa: 100, nivel_minimo: 1 },
  { titulo: "Invasión Orca", dificultad: "media", recompensa: 300, nivel_minimo: 10 },
  { titulo: "Estudio de Runas", dificultad: "media", recompensa: 250, nivel_minimo: 15 },
  { titulo: "Escolta de Caravana", dificultad: "facil", recompensa: 150, nivel_minimo: 5 },
  { titulo: "Caza de Dragón", dificultad: "legendaria", recompensa: 5000, nivel_minimo: 50 },
  { titulo: "Catacumbas Oscuras", dificultad: "dificil", recompensa: 1200, nivel_minimo: 25 }
]);

db.combates.insertMany([
  { atacante: "Thorgar", defensor: "Draven", ganador: "Thorgar", fecha: new Date() },
  { atacante: "Elara", defensor: "Kael", ganador: "Elara", fecha: new Date() },
  { atacante: "Brunhilda", defensor: "Thorgar", ganador: "Brunhilda", fecha: new Date() },
  { atacante: "Sylvan", defensor: "Draven", ganador: "Sylvan", fecha: new Date() },
  { atacante: "Merlinda", defensor: "Nyx", ganador: "Merlinda", fecha: new Date() },
  { atacante: "Thorgar", defensor: "Kael", ganador: "Thorgar", fecha: new Date() },
  { atacante: "Brunhilda", defensor: "Merlinda", ganador: "Brunhilda", fecha: new Date() },
  { atacante: "Elara", defensor: "Sylvan", ganador: "Elara", fecha: new Date() }
]);