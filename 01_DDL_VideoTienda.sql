CREATE DATABASE VideoTiendaDB;
GO

USE VideoTiendaDB;
GO

CREATE TABLE Cliente
(
	IdCliente INT IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(100) NOT NULL,
	Direccion VARCHAR(150) NOT NULL,
	CorreoElectronico VARCHAR(100) NOT NULL
);



CREATE TABLE Actor
(
	IdActor INT IDENTITY(1,1) PRIMARY KEY,
	NombreActor VARCHAR(100) NOT NULL
);



CREATE TABLE Genero
(
	IdGenero INT IDENTITY(1,1) PRIMARY KEY,
	NombreGenero VARCHAR(100) NOT NULL
);

CREATE TABLE Formato
(
	IdFormato INT IDENTITY(1,1) PRIMARY KEY,
	NombreFormato VARCHAR(100) NOT NULL
);

CREATE TABLE Director
(
	IdDirector INT IDENTITY(1,1) PRIMARY KEY,
	NombreDirector VARCHAR(100) NOT NULL,
	Nacionalidad VARCHAR(150) NOT NULL
);


CREATE TABLE Video
(
	IdVideo INT IDENTITY(1,1) PRIMARY KEY,
	Titulo VARCHAR(100) NOT NULL,
	Idioma VARCHAR(50) NOT NULL,
	Duracion INT NOT NULL,
	IdFormato INT NOT NULL,
	IdDirector INT NOT NULL,

	CONSTRAINT FK_Video_Formato
		FOREIGN KEY (IdFormato)
			REFERENCES Formato(IdFormato),
	
	CONSTRAINT FK_Video_Director
	    FOREIGN KEY (IdDirector)
			REFERENCES Director(IdDirector)
);


CREATE TABLE Alquiler
(
	IdAlquiler INT IDENTITY(1,1) PRIMARY KEY,
	FechaAlquiler DATE NOT NULL,
	FechaDevolucion DATE NULL,
	ValorAlquiler DECIMAL(10,2) NOT NULL,
	DiasRetraso INT NOT NULL,
	IdCliente INT NOT NULL,
	IdVideo INT NOT NULL,

	CONSTRAINT FK_Alquiler_Cliente
		FOREIGN KEY (IdCliente)
			REFERENCES Cliente(IdCliente),
	
	CONSTRAINT FK_Alquiler_Video
	    FOREIGN KEY (IdVideo)
			REFERENCES Video(IdVideo)
);

CREATE TABLE VideoActor
(
	IdVideo INT NOT NULL,
	IdActor INT NOT NULL,

	CONSTRAINT FK_VideoActor
		PRIMARY KEY(Idvideo,IdActor),

	CONSTRAINT FK_VideoActor_Video
		FOREIGN KEY(IdVideo)
			REFERENCES Video(IdVideo),

	CONSTRAINT FK_VideoActor_Actor
		FOREIGN KEY (IdActor)
			REFERENCES Actor(IdActor)

);

CREATE TABLE VideoGenero
(
    IdVideo INT NOT NULL,
    IdGenero INT NOT NULL,

    CONSTRAINT PK_VideoGenero
        PRIMARY KEY (IdVideo, IdGenero),

    CONSTRAINT FK_VideoGenero_Video
        FOREIGN KEY (IdVideo)
			REFERENCES Video(IdVideo),

    CONSTRAINT FK_VideoGenero_Genero
        FOREIGN KEY (IdGenero)
			REFERENCES Genero(IdGenero)
);

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
