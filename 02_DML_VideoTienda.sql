USE VideoTiendaDB;
GO
-- ============================================
-- 1. INSERT
-- ============================================


INSERT INTO Cliente
(
    Nombre,
    Direccion,
    CorreoElectronico
)
VALUES
('Carlos Vargas', 'Calle 10 #20-30', 'carlos.vargas@gmail.com'),
('Ana Martinez', 'Carrera 20 #15-40', 'ana.martinez@gmail.com'),
('Luis Gomez', 'Calle 50 #12-22', 'luis.gomez@gmail.com'),
('Maria Rodriguez', 'Carrera 30 #40-10', 'maria.rodriguez@gmail.com'),
('Juan Perez', 'Calle 80 #10-15', 'juan.perez@gmail.com'),
('Sofia Torres', 'Carrera 70 #22-18', 'sofia.torres@gmail.com'),
('Andres Ramirez', 'Calle 45 #30-21', 'andres.ramirez@gmail.com'),
('Laura Castro', 'Carrera 12 #55-31', 'laura.castro@gmail.com'),
('Diego Herrera', 'Calle 22 #11-09', 'diego.herrera@gmail.com'),
('Valentina Ruiz', 'Carrera 18 #70-50', 'valentina.ruiz@gmail.com');



INSERT INTO Actor
(
    NombreActor
)
VALUES
('Leonardo DiCaprio'),
('Tom Hanks'),
('Keanu Reeves'),
('Samuel L. Jackson'),
('Johnny Depp'),
('Orlando Bloom'),
('Harrison Ford'),
('Matt Damon'),
('Natalie Portman'),
('Morgan Freeman');


INSERT INTO Genero
(
    NombreGenero
)
VALUES
('Accion'),
('Comedia'),
('Terror'),
('Drama'),
('Ciencia Ficcion'),
('Romance'),
('Aventura'),
('Suspenso'),
('Fantasia'),
('Animacion');


INSERT INTO Formato
(
    NombreFormato
)
VALUES
('VHS'),
('VCD'),
('DVD'),
('BlueRay');


INSERT INTO Director
(
    NombreDirector,
    Nacionalidad
)
VALUES
('Christopher Nolan', 'Britanica'),
('Steven Spielberg', 'Estadounidense'),
('James Cameron', 'Canadiense'),
('Quentin Tarantino', 'Estadounidense'),
('Tim Burton', 'Estadounidense'),
('Peter Jackson', 'Neozelandesa'),
('George Lucas', 'Estadounidense'),
('Ridley Scott', 'Britanica'),
('Guillermo del Toro', 'Mexicana'),
('Robert Zemeckis', 'Estadounidense');


INSERT INTO Video
(
    Titulo,
    Idioma,
    Duracion,
    IdFormato,
    IdDirector
)
VALUES
('Inception', 'Ingles', 148, 3, 1),
('Jurassic Park', 'Ingles', 127, 3, 2),
('Titanic', 'Ingles', 195, 4, 3),
('Pulp Fiction', 'Ingles', 154, 3, 4),
('Edward Scissorhands', 'Ingles', 105, 2, 5),
('The Lord of the Rings', 'Ingles', 178, 4, 6),
('Star Wars', 'Ingles', 121, 3, 7),
('Gladiator', 'Ingles', 155, 4, 8),
('Pan''s Labyrinth', 'Español', 118, 4, 9),
('Forrest Gump', 'Ingles', 142, 3, 10);


INSERT INTO Alquiler
(
    FechaAlquiler,
    FechaDevolucion,
    ValorAlquiler,
    DiasRetraso,
    IdCliente,
    IdVideo
)
VALUES
('2026-09-01', '2026-09-04', 8000.00, 0, 1, 1),
('2026-09-02', '2026-09-08', 8000.00, 2, 2, 2),
('2026-09-03', '2026-09-05', 12000.00, 0, 3, 3),
('2026-09-04', '2026-09-10', 8000.00, 3, 4, 4),
('2026-09-05', '2026-09-07', 6000.00, 0, 5, 5),
('2026-09-06', '2026-09-12', 12000.00, 2, 6, 6),
('2026-09-07', '2026-09-09', 8000.00, 0, 7, 7),
('2026-09-08', NULL,          12000.00, 0, 8, 8),
('2026-09-09', '2026-09-13', 12000.00, 1, 9, 9),
('2026-09-10', NULL,          8000.00, 0, 10, 10);


INSERT INTO VideoActor
(
    IdVideo,
    IdActor
)
VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 1),
(3, 9),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 10);


INSERT INTO VideoGenero
(
    IdVideo,
    IdGenero
)
VALUES
(1, 5),
(1, 8),
(2, 1),
(2, 7),
(3, 4),
(3, 6),
(4, 1),
(4, 8),
(5, 9),
(6, 7);

-- ============================================
-- UPDATE
-- ============================================

-- 1. Actualizar Cliente
UPDATE Cliente
SET Direccion = 'Carrera 50 #25-15'
WHERE IdCliente = 1;


-- 2. Actualizar Actor
UPDATE Actor
SET NombreActor = 'Leonardo DiCaprio'
WHERE IdActor = 1;


-- 3. Actualizar Genero
UPDATE Genero
SET NombreGenero = 'Ciencia Ficcion'
WHERE IdGenero = 5;


-- 4. Actualizar Formato
UPDATE Formato
SET NombreFormato = 'Blu-ray'
WHERE IdFormato = 4;


-- 5. Actualizar Director
UPDATE Director
SET Nacionalidad = 'Reino Unido'
WHERE IdDirector = 1;


-- 6. Actualizar Video
UPDATE Video
SET Duracion = 150
WHERE IdVideo = 1;


-- 7. Actualizar Alquiler
UPDATE Alquiler
SET DiasRetraso = 1
WHERE IdAlquiler = 1;


-- 8. Actualizar VideoActor
UPDATE VideoActor
SET IdActor = 10
WHERE IdVideo = 1
  AND IdActor = 3;


-- 9. Actualizar VideoGenero
UPDATE VideoGenero
SET IdGenero = 9
WHERE IdVideo = 1
  AND IdGenero = 5;


-- ============================================
-- DELETE
-- ============================================

-- 1. Eliminar una relación Video-Actor
DELETE FROM VideoActor
WHERE IdVideo = 1
  AND IdActor = 3;


-- 2. Eliminar una relación Video-Genero
DELETE FROM VideoGenero
WHERE IdVideo = 1
  AND IdGenero = 5;


-- 3. Eliminar un alquiler
DELETE FROM Alquiler
WHERE IdAlquiler = 10;


-- 4. Eliminar un video
DELETE FROM Video
WHERE IdVideo = 10;


-- 5. Eliminar un cliente
DELETE FROM Cliente
WHERE IdCliente = 10;


-- 6. Eliminar un actor
DELETE FROM Actor
WHERE IdActor = 10;


-- 7. Eliminar un genero
DELETE FROM Genero
WHERE IdGenero = 10;


-- 8. Eliminar un director
DELETE FROM Director
WHERE IdDirector = 10;


-- 9. Eliminar un formato
DELETE FROM Formato
WHERE IdFormato = 2;

-- No se puede eliminar porque existen registros en Video
-- que hacen referencia a IdFormato = 2.


-- Inner Join
SELECT
    C.Nombre AS Cliente,
    A.FechaAlquiler,
    A.FechaDevolucion
FROM Cliente C
INNER JOIN Alquiler A
    ON C.IdCliente = A.IdCliente;


SELECT
    C.Nombre AS Cliente,
    V.Titulo AS Video,
    A.FechaAlquiler,
    A.FechaDevolucion
FROM Alquiler A
INNER JOIN Cliente C
    ON A.IdCliente = C.IdCliente
INNER JOIN Video V
    ON A.IdVideo = V.IdVideo;



SELECT
    V.Titulo AS Video,
    F.NombreFormato AS Formato
FROM Video V
INNER JOIN Formato F
    ON V.IdFormato = F.IdFormato;


SELECT
    V.Titulo AS Video,
    D.NombreDirector AS Director,
    D.Nacionalidad
FROM Video V
INNER JOIN Director D
    ON V.IdDirector = D.IdDirector;

SELECT
    V.Titulo AS Video,
    A.NombreActor AS Actor
FROM Video V
INNER JOIN VideoActor VA
    ON V.IdVideo = VA.IdVideo
INNER JOIN Actor A
    ON VA.IdActor = A.IdActor;


SELECT
    V.Titulo AS Video,
    G.NombreGenero AS Genero
FROM Video V
INNER JOIN VideoGenero VG
    ON V.IdVideo = VG.IdVideo
INNER JOIN Genero G
    ON VG.IdGenero = G.IdGenero;




-- ============================================
-- INNER JOIN - REPORTE COMPLETO DE ALQUILERES
-- ============================================

SELECT
    A.IdAlquiler,
    C.Nombre AS Cliente,
    V.Titulo AS Video,
    F.NombreFormato AS Formato,
    D.NombreDirector AS Director,
    D.Nacionalidad,
    A.FechaAlquiler,
    A.FechaDevolucion,
    A.ValorAlquiler,
    A.DiasRetraso
FROM Alquiler A

INNER JOIN Cliente C
    ON A.IdCliente = C.IdCliente

INNER JOIN Video V
    ON A.IdVideo = V.IdVideo

INNER JOIN Formato F
    ON V.IdFormato = F.IdFormato

INNER JOIN Director D
    ON V.IdDirector = D.IdDirector

ORDER BY A.FechaAlquiler DESC;

-- ============================================
-- CONSULTA CON WHERE
-- ============================================

-- Mostrar los alquileres que tuvieron días de retraso
SELECT
    C.Nombre AS Cliente,
    V.Titulo AS Video,
    A.DiasRetraso
FROM Alquiler A
INNER JOIN Cliente C
    ON A.IdCliente = C.IdCliente
INNER JOIN Video V
    ON A.IdVideo = V.IdVideo
WHERE A.DiasRetraso > 0;

-- ============================================
-- CONSULTAS CON LIKE
-- ============================================

-- 1. Buscar videos cuyo título contenga la palabra "Star"
SELECT
    IdVideo,
    Titulo,
    Idioma,
    Duracion
FROM Video
WHERE Titulo LIKE '%Star%';


-- 2. Buscar clientes cuyo nombre comience por la letra "A"
SELECT
    IdCliente,
    Nombre,
    Direccion,
    CorreoElectronico
FROM Cliente
WHERE Nombre LIKE 'A%';


-- ============================================
-- CONSULTAS CON BETWEEN
-- ============================================

-- 1. Videos cuya duración está entre 120 y 160 minutos
SELECT
    IdVideo,
    Titulo,
    Duracion
FROM Video
WHERE Duracion BETWEEN 120 AND 160;


-- 2. Alquileres realizados entre el 1 y el 7 de septiembre de 2026
SELECT
    IdAlquiler,
    FechaAlquiler,
    IdCliente,
    IdVideo,
    ValorAlquiler
FROM Alquiler
WHERE FechaAlquiler BETWEEN '2026-09-01' AND '2026-09-07';