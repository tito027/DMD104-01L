use [master]

create database parque_vehicular

use parque_vehicular

create table tipo_placa(
	id uniqueidentifier primary key,
	placa varchar(50)
)

create table auto_marca(
	id uniqueidentifier primary key,
	marca varchar(100)
)

create table auto_modelo(
	id uniqueidentifier primary key,
	id_marca uniqueidentifier,
	modelo varchar(100),
	foreign key (id_marca) references auto_marca(id)
)

create table combustible(
	id uniqueidentifier primary key,
	combustible varchar(100)
)

create table auto_data(
	id uniqueidentifier primary key,
	id_tipo_placa uniqueidentifier,
	anio_fabricacion int,
	cilindrada int,
	cantidad_cilindros int,
	cantidad_puertas int,
	color varchar(500),
	clase varchar(500),
	pertenencia varchar(500),
	id_auto_modelo uniqueidentifier,
	capacidad int,
	des_capacidad varchar(500),
	id_combustible uniqueidentifier,
	condicion_ingreso varchar(500),
	foreign key (id_tipo_placa) references tipo_placa(id),
	foreign key (id_auto_modelo) references auto_modelo(id),
	foreign key (id_combustible) references combustible(id)
)

create table [date](
	id uniqueidentifier primary key,
	fecha_importacion date,
	fecha_ingreso date,
)

create table departamento_propietario(
	id uniqueidentifier primary key,
	departamento varchar(100)
)

create table municipio_propietario(
	id uniqueidentifier primary key,
	id_departamento uniqueidentifier,
	municipio varchar(200),
	foreign key (id_departamento) references departamento_propietario(id)
)

create table aduana(
	id uniqueidentifier primary key,
	aduana varchar(200)
)

create table estado(
	id uniqueidentifier primary key,
	estado varchar(50)
)

create table fact(
	id uniqueidentifier primary key,
	id_auto_data uniqueidentifier,
	id_fechas uniqueidentifier,
	id_municipio_propietario uniqueidentifier,
	id_aduana uniqueidentifier,
	id_estado uniqueidentifier,
	valor_vehiculo money,
	importacion_valor_vehiculo money,
	foreign key (id_auto_data) references auto_data(id),
	foreign key (id_fechas) references [date](id),
	foreign key (id_municipio_propietario) references municipio_propietario(id),
	foreign key (id_aduana) references aduana(id),
	foreign key (id_estado) references estado(id)
)

select tp.placa, anio_fabricacion, cilindrada, cantidad_cilindros, cantidad_puertas, color, clase, pertenencia, ama.marca, am.modelo, capacidad, des_capacidad, combustible, condicion_ingreso from auto_data ad
join auto_modelo am
on ad.id_auto_modelo = am.id
join auto_marca ama
on am.id_marca = ama.id
join tipo_placa tp
on ad.id_tipo_placa = tp.id
join combustible c
on ad.id_combustible = c.id
where anio_fabricacion = 1990 and cilindrada = 1800

select tp.placa, ad.anio_fabricacion, ad.cilindrada, ad.cantidad_cilindros, ad.cantidad_puertas, valor_vehiculo, ad.color, d.fecha_importacion, importacion_valor_vehiculo, d.fecha_ingreso, ad.clase, ad.pertenencia, ama.marca, am.modelo, ad.capacidad, ad.des_capacidad, c.combustible, a.aduana, ad.condicion_ingreso, dp.departamento, mp.municipio, e.estado from fact f
join auto_data ad
on f.id_auto_data = ad.id
join auto_modelo am
on ad.id_auto_modelo = am.id
join auto_marca ama
on am.id_marca = ama.id
join tipo_placa tp
on ad.id_tipo_placa = tp.id
join combustible c
on ad.id_combustible = c.id
join municipio_propietario mp
on f.id_municipio_propietario = mp.id
join departamento_propietario dp
on mp.id_departamento = dp.id
join aduana a
on f.id_aduana = a.id
join estado e
on f.id_estado = e.id
join [date] d
on f.id_fechas = d.id
where valor_vehiculo = 4094.56 and importacion_valor_vehiculo = 4094.56