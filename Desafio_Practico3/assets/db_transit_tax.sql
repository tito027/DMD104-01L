use master;

create database db_transit_taxes;

use db_transit_taxes;

-- create tables
CREATE TABLE "Dim_Foul" (
    "id" uniqueidentifier primary key,
    "type" varchar(100),
    "descripcion" varchar(350)
);

CREATE TABLE "Dim_Status" (
    "id" uniqueidentifier primary key,
    "status" varchar(50),
    "descripcion" varchar(350),
);

CREATE TABLE "Dim_Location" (
    "id" uniqueidentifier primary key,
    "department" varchar(100)
);

CREATE TABLE "Dim_Date" (
    "id" uniqueidentifier primary key,
    "date" date,
);

CREATE TABLE "Fact_Tax" (
	"id" uniqueidentifier primary key,
    "num_tax" varchar(10),
    "id_foul" uniqueidentifier foreign key references Dim_Foul(id),
    "id_status" uniqueidentifier foreign key references Dim_Status(id),
    "id_department" uniqueidentifier foreign key references Dim_Location(id),
    "id_date" uniqueidentifier foreign key references Dim_Date(id),
    "value" float,
    "interest" float
);
-- selects 
select * from Dim_Foul;
select * from Dim_Date;
select * from Dim_Location;
select * from Dim_Status;
select * from Fact_Tax;

-- views
create view Data_Transit_Taxes as 
select ft.num_tax, dd.date, df.type, df.descripcion as 'Descripción de Falta', ds.status, ds.descripcion as 'Descripción de Estado', dl.department, ft.value, ft.interest from Fact_Tax ft
join Dim_Date dd on ft.id_date = dd.id
join Dim_Foul df on ft.id_foul = df.id
join Dim_Location dl on ft.id_department = dl.id
join Dim_Status ds on ft.id_status = ds.id


use db_transit_taxes

-- Delete data
delete from Dim_Date;
delete from Dim_Location;
delete from Dim_Foul;
delete from Dim_Status;
delete from Fact_Tax

-- Drop table
drop table Dim_Foul;
drop table Dim_Status;
drop table Dim_Date;
drop table Dim_Location;
drop table Fact_Tax;