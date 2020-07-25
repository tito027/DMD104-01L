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
use library;

-- Creando vista
DROP VIEW copia_libro
create view copia_libro as
select * from (select cp.isbn as ISBN, copy_no as 'Copia', case when on_loan = 'Y'  then 'Si' when on_loan = 'N' then 'No' else 'No' end as 'Prestado', title as 'Título', translation as 'Traducción', cover as 'Forro' from copy cp inner join title tt on cp.title_no = tt.title_no inner join item it on cp.isbn = it.isbn) as intermedium where ISBN = 1 or ISBN = 500 or ISBN = 1000;

select * from copia_libro
select * from (select cp.isbn as ISBN, copy_no as 'Copia', case when on_loan = 'Y'  then 'Si' when on_loan = 'N' then 'No' else 'No' end as 'Prestado', title as 'Título', translation as 'Traducción', cover as 'Forro' from copy cp inner join title tt on cp.title_no = tt.title_no inner join item it on cp.isbn = it.isbn) as intermedium where ISBN = 1 or ISBN = 500 or ISBN = 1000;

