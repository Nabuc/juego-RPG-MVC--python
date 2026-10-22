-- 1. Seleccionar la base de datos de trabajo
USE rpg_manager;

-- 2. Crear la tabla independiente 'clase' (con restricción de unicidad en su nombre)
CREATE TABLE clase (
    id_clase INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

-- 3. Poblar las clases iniciales del juego
INSERT INTO clase (nombre) VALUES ('Guerrero');
INSERT INTO clase (nombre) VALUES ('Arquero');
INSERT INTO clase (nombre) VALUES ('Mago');

-- 4. Crear la tabla dependiente 'personaje' (con restricciones de nivel, vida y llave foránea)
CREATE TABLE personaje (
    id_personaje INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    id_clase INT,
    nivel INT CHECK (nivel BETWEEN 1 AND 100),
    vida INT CHECK (vida > 0),
    FOREIGN KEY (id_clase) REFERENCES clase(id_clase)
);

-- 5. Registrar tu primer personaje (ejemplo con Sova como Arquero)
INSERT INTO personaje (nombre, id_clase, nivel, vida) 
VALUES ('Sova', 4, 10, 100);

-- 6. Comandos de diagnóstico y verificación que hemos usado
SHOW DATABASES;
SHOW TABLES;
DESCRIBE clase;
DESCRIBE personaje;
SELECT * FROM clase;
SELECT * FROM personaje;
