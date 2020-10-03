use master;

create database db_region_mobility;

use db_region_mobility;

create table Dim_Region_Country (
	id uniqueidentifier primary key,
	country_region_code char(2),
	country_region varchar(100)
) ;

create table Dim_Region_Sub (
	id uniqueidentifier primary key,
	sub_region_1 varchar(100),
	sub_region_2 varchar(100),
	metro_area varchar(100),
	id_country uniqueidentifier foreign key references Dim_Region_Country(id)
);

create table Dim_Region (
	id uniqueidentifier primary key,
	iso_3166_2_code varchar(10),
	census_fips_code varchar(20),
	id_subregion uniqueidentifier foreign key references Dim_Region_Sub(id)
);

create table Dim_Date (
	id uniqueidentifier primary key,
	"day" int,
	"month" int,
	"year" int
);

create table Fact_Percentage (
	id uniqueidentifier primary key,
	id_region uniqueidentifier foreign key references Dim_Region(id),
	id_date uniqueidentifier foreign key references Dim_Date(id),
	retail_and_recreation_percent_change_from_baseline int,
	grocery_and_pharmacy_percent_change_from_baseline int,
	parks_percent_change_from_baseline int,
	transit_stations_percent_change_from_baseline int,
	workplaces_percent_change_from_baseline int,
	residential_percent_change_from_baseline int
);
-- Selects 
select * from Dim_Region_Sub;
select drc.country_region_code, drc.country_region, drs.sub_region_1, drs.sub_region_2, drs.metro_area,dr.iso_3166_2_code, dr.census_fips_code, dd.year, dd.month, dd.day, retail_and_recreation_percent_change_from_baseline, grocery_and_pharmacy_percent_change_from_baseline, parks_percent_change_from_baseline, transit_stations_percent_change_from_baseline, workplaces_percent_change_from_baseline, residential_percent_change_from_baseline from Fact_Percentage fp
join Dim_Date dd on fp.id_date = dd.id
join Dim_Region dr on fp.id_region = dr.id
join Dim_Region_Sub drs on dr.id_subregion = drs.id
join Dim_Region_Country drc on drs.id_country = drc.id
order by drs.sub_region_1, drs.sub_region_2, drs.metro_area,  dd.month,dd.day, dd.year
-- Delete all from tables
delete from Fact_Percentage;
delete from Dim_Region;
delete from Dim_Region_Sub;
delete from Dim_Region_Country;
delete from Dim_Date;
-- Drop tables
drop table Fact_Percentage;
drop table Dim_Region;
drop table Dim_Region_Sub;
drop table Dim_Region_Country;
drop table Dim_Date;



