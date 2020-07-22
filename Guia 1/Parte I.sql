USE master;

-- Creación de la BD
CREATE DATABASE Control_de_libros_CG181933;

-- Seleccionando la BD a trabajar
USE Control_de_libros_CG181933;

-- Creación de las tablas con sus llaves y relaciones

-- Tabla Autor
CREATE TABLE Autor (
	Codigo VARCHAR(4) PRIMARY KEY,
	Nombres VARCHAR(50) NOT NULL,
	Apellidos VARCHAR(50) NOT NULL,
	Nacionalidad VARCHAR(100) NOT NULL
);

-- Tabla Editorial
CREATE TABLE Editorial (
	Codigo VARCHAR(4) PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL,
	Pais VARCHAR(100) NOT NULL
);


-- Tabla Libro
CREATE TABLE Libro (
	Codigo VARCHAR(4) PRIMARY KEY,
	Titulo VARCHAR(100) NOT NULL,
	ISBN VARCHAR(11) NOT NULL,
	Descripcion TEXT,
	Resumen TEXT,
	Año_edicion INT NOT NULL,
	Cod_editorial VARCHAR(4) NOT NULL,
	FOREIGN KEY (Cod_editorial) REFERENCES Editorial (Codigo)
);

-- Tabla Autor_Libro
CREATE TABLE Autor_Libro (
	Cod_libro VARCHAR(4) NOT NULL,
	Cod_Autor VARCHAR(4) NOT NULL,
	FOREIGN KEY (Cod_libro) REFERENCES Libro (Codigo),
	FOREIGN KEY (Cod_Autor) REFERENCES Autor (Codigo)
);

-- Tabla Ejemplar
CREATE TABLE Ejemplar (
	Cod_libro VARCHAR(4) NOT NULL,
	Ubicacion TEXT NOT NULL,
	Estado VARCHAR(50) NOT NULL,
	FOREIGN KEY (Cod_libro) REFERENCES Libro (Codigo)
);
