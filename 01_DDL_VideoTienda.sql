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

