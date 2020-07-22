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
	Descripcion VARCHAR(500),
	Resumen VARCHAR(100),
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
	Ubicacion VARCHAR(100) NOT NULL,
	Estado VARCHAR(50) NOT NULL,
	FOREIGN KEY (Cod_libro) REFERENCES Libro (Codigo)
);

-- Insertando los datos

-- Seleccionando la BD a trabajar
USE Control_de_libros_CG181933;

-- Insertando datos a la tabla Editorial
INSERT INTO Editorial (Codigo, Nombre, Pais) VALUES
	('ED01', 'Thomson internacional', 'España'),
	('ED02', 'Omega', 'Mexico'),
	('ED03', 'La fuente de la sabiduría', 'Colombia'),
	('ED04', 'Siglo XV', 'España');

-- Insertando datos a la tabla Autor
INSERT INTO Autor (Codigo, Nombres, Apellidos, Nacionalidad) VALUES
	('AU01', 'JOSE PEDRO', 'ALVARADO', 'ESPAÑOLA'),
	('AU02', 'MARIA TERESA', 'RIVAS', 'MEXICANO'),
	('AU03', 'JULIO CARLOS', 'FERNANDEZ', 'COLOMBIANO'),
	('AU04', 'ALEXANDER', 'RODRIGUEZ', 'MEXICANO'),
	('AU05', 'JUAN MANUEL', 'ARTIGA', 'COLOMBIANO');

--  Insetando datos a la tabla Libro
INSERT INTO Libro (Codigo, Titulo, ISBN, Descripcion, Resumen, Año_edicion, Cod_editorial) VALUES
	('LB01', 'Metodología de la programación', '123-334-456', 'Sintaxis básicas de la programación', '204 paginas', 2000, 'ED02'),
	('LB02', 'SQL Server 2005', '345-678-076', 'Explicación de las consultas SQL', '798 paginas', 2005, 'ED03'),
	('LB03', 'Como programar en C/C++', '153-567-345', 'Diferencias entre C y C++', '156 paginas', 1997, 'ED02'),
	('LB04', 'Aprender PHP en 30 días', '234-345-987', 'Sintaxis PHP para crear páginas web dinámicas', '200 paginas', 2005, 'ED01'),
	('LB05', 'SQL Server 2008', '789-255-487', 'Administración de Base de datos', '150 paginas', 2008, 'ED03'),
	('LB06', 'CSS y HTML', '652-414-111', 'Creación de páginas Web y hojas de estilo', '350 paginas', 2007, 'ED01');

-- Insertando datos a la tabla Autor_Libro
INSERT INTO Autor_Libro (Cod_libro, Cod_Autor) VALUES
	('LB01','AU02'),
	('LB01','AU04'),
	('LB02','AU01'),
	('LB03','AU05'),
	('LB03','AU03'),
	('LB04','AU02'),
	('LB04','AU04');

-- Insertando datos a la tabla Ejemplar
INSERT INTO Ejemplar (Cod_libro, Ubicacion, Estado) VALUES
	('LB01', 'Estante 1', 'Prestado'),
	('LB02', 'Estante 2', 'Disponible'),
	('LB02', 'Estante 2', 'Reservado'),
	('LB03', 'Estante 3', 'Prestado'),
	('LB04', 'Estante 4', 'Disponible'),
	('LB02', 'Estante 2', 'Reservado'),
	('LB04', 'Estante 4', 'Prestado'),
	('LB01', 'Estante 1', 'Disponible'),
	('LB02', 'Estante 2', 'Reservado'),
	('LB03', 'Estante 3', 'Prestado'),
	('LB01', 'Estante 1', 'Disponible'),
	('LB05', 'Estante 5', 'Disponible'),
	('LB06', 'Estante 5', 'Prestado'),
	('LB06', 'Estante 5', 'Disponible');