-- Parte III
USE Control_de_libros_CG181933;
-- Creando tabla de autores_espana

create table autores_espana (
	Codigo varchar(4) primary key,
	Nombres varchar(200) not null,
	Apellidos varchar(200) not null	
);

-- Insertando datos en tabla
insert into autores_espana select Codigo, Nombres, Apellidos from Autor where Nacionalidad = 'Española';


-- usando view copia_libro (vista creada en Vista_copia_libro.sql)
USE library;
select * from copia_libro order by ISBN;
