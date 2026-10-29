-- =====================================================================
-- RPG MANAGER · Script Oficial de Creación y Poblado (MariaDB)
-- =====================================================================


DROP TABLE IF EXISTS personaje;
DROP TABLE IF EXISTS clase;

-- 1. Tabla CLASE
CREATE TABLE clase (
    id_clase INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    descripcion TEXT
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 2. Tabla PERSONAJE
CREATE TABLE personaje (
    id_personaje INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    id_clase INT NOT NULL,
    nivel INT CHECK (nivel BETWEEN 1 AND 100),
    vida INT CHECK (vida >= 0),
    ataque INT,
    oro DECIMAL(10,2) CHECK (oro >= 0),
    creado_en DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_clase) REFERENCES clase(id_clase)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 3. Tabla ITEM
CREATE TABLE item (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    tipo ENUM('arma','armadura','pocion','reliquia') NOT NULL,
    valor INT CHECK (valor >= 0),
    peso DECIMAL(5,2) CHECK (peso >= 0)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 4. Tabla INVENTARIO (Puente N:M Personaje <-> Item)
CREATE TABLE inventario (
    id_personaje INT,
    id_item INT,
    cantidad INT CHECK (cantidad > 0),
    PRIMARY KEY (id_personaje, id_item),
    FOREIGN KEY (id_personaje) REFERENCES personaje(id_personaje) ON DELETE CASCADE,
    FOREIGN KEY (id_item) REFERENCES item(id_item) ON DELETE CASCADE
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 5. Tabla MISION
CREATE TABLE mision (
    id_mision INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) UNIQUE NOT NULL,
    dificultad ENUM('facil','media','dificil','legendaria') NOT NULL,
    recompenza_oro INT CHECK (recompenza_oro >= 0),
    nivel_minimo INT CHECK (nivel_minimo BETWEEN 1 AND 100)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 6. Tabla PERSONAJE_MISION (Puente N:M Personaje <-> Mision)
CREATE TABLE personaje_mision (
    id_personaje INT,
    id_mision INT,
    estado ENUM('aceptada','completada','fallida') NOT NULL,
    PRIMARY KEY (id_personaje, id_mision),
    FOREIGN KEY (id_personaje) REFERENCES personaje(id_personaje) ON DELETE CASCADE,
    FOREIGN KEY (id_mision) REFERENCES mision(id_mision) ON DELETE CASCADE
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 7. Tabla COMBATE (Arena)
CREATE TABLE combate (
    id_combate INT AUTO_INCREMENT PRIMARY KEY,
    id_atacante INT NOT NULL,
    id_defensor INT NOT NULL,
    id_ganador INT NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_atacante) REFERENCES personaje(id_personaje),
    FOREIGN KEY (id_defensor) REFERENCES personaje(id_personaje),
    FOREIGN KEY (id_ganador) REFERENCES personaje(id_personaje)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


-- =====================================================================
-- INSERCIÓN DE DATOS DE PRUEBA (SEED)
-- =====================================================================

-- Clases
INSERT INTO clase (id_clase, nombre, descripcion) VALUES
(1, 'Guerrero', 'Especialista en combate cuerpo a cuerpo y alta resistencia.'),
(2, 'Mago', 'Dominador de las artes arcanas y hechizos de daño en área.'),
(3, 'Arquero', 'Maestro del arco y la agilidad a distancia.');

-- Personajes
INSERT INTO personaje (nombre, id_clase, nivel, vida, ataque, oro) VALUES
('Thorgar', 1, 15, 150, 45, 1200.50),
('Elara', 2, 18, 90, 60, 2500.00),
('Kael', 3, 12, 110, 40, 850.25),
('Brunhilda', 1, 20, 180, 55, 3100.00),
('Merlinda', 2, 5, 70, 30, 400.00),
('Sylvan', 3, 14, 115, 48, 1500.00),
('Draven', 1, 10, 130, 35, 600.00),
('Nyx', 2, 16, 95, 62, 2200.00);

-- Items
INSERT INTO item (nombre, tipo, valor, peso) VALUES
('Espada Bastarda', 'arma', 350, 6.50),
('Bastón Arcano', 'arma', 400, 4.00),
('Arco Largo', 'arma', 300, 3.50),
('Armadura de Placas', 'armadura', 800, 25.00),
('Túnica de Seda', 'armadura', 250, 2.00),
('Poción de Vida', 'pocion', 50, 0.50),
('Amuleto del dragón', 'reliquia', 1500, 1.00);

-- Inventario
INSERT INTO inventario (id_personaje, id_item, cantidad) VALUES
(1, 1, 1), (1, 4, 1), (1, 6, 3),
(2, 2, 1), (2, 5, 1), (2, 6, 5),
(3, 3, 1), (3, 6, 2),
(4, 1, 1), (4, 4, 1),
(5, 2, 1), (5, 6, 4);

-- Misiones
INSERT INTO mision (titulo, dificultad, recompenza_oro, nivel_minimo) VALUES
('Cazeria de Goblins', 'facil', 200, 1),
('Invasión Orca', 'media', 500, 10),
('El Despertar del Dragón', 'legendaria', 5000, 25),
('Robo en el Camino Real', 'facil', 150, 3),
('Misterio en la Cripta', 'dificil', 1200, 15),
('Escolta de Caravana', 'media', 600, 8);

-- Personaje_Mision
INSERT INTO personaje_mision (id_personaje, id_mision, estado) VALUES
(1, 1, 'completada'), (1, 2, 'aceptada'),
(2, 2, 'completada'), (2, 5, 'aceptada'),
(3, 1, 'completada'), (3, 4, 'completada'),
(4, 3, 'aceptada'),
(5, 1, 'completada');

-- Combates (Arena)
INSERT INTO combate (id_atacante, id_defensor, id_ganador) VALUES
(1, 4, 4), (2, 8, 2), (3, 6, 3),
(1, 7, 1), (4, 2, 4), (5, 3, 3),
(6, 1, 6), (7, 5, 7);
