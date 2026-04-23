-- db/init.sql

-- Crear y usar la base de datos
CREATE DATABASE IF NOT EXISTS movies_db;
USE movies_db;

-- Crear la tabla de películas
CREATE TABLE IF NOT EXISTS movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    year INT,
    UNIQUE(title)
);

-- Insertar datos de ejemplo
INSERT IGNORE INTO movies (title, year) VALUES
('Inception', 2010),
('The Matrix', 1999),
('Pulp Fiction', 1994),
('The Dark Knight', 2008),
('Eternal Sunshine of the Spotless Mind', 2004),
('Forrest Gump', 1994),
('Fight Club', 1999),
('The Godfather', 1972),
('Interstellar', 2014),
('Parasite', 2019);