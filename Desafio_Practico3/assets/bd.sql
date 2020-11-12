USE [master]
GO
/****** Object:  Database [parque_vehicular]    Script Date: 8/11/2020 16:08:19 ******/
CREATE DATABASE [parque_vehicular]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'parque_vehicular', FILENAME = N'D:\Aplicaciones\Microsoft SQL SERVER\MSSQL15.MSSQLSERVER\MSSQL\DATA\parque_vehicular.mdf' , SIZE = 401408KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'parque_vehicular_log', FILENAME = N'D:\Aplicaciones\Microsoft SQL SERVER\MSSQL15.MSSQLSERVER\MSSQL\DATA\parque_vehicular_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [parque_vehicular] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [parque_vehicular].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [parque_vehicular] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [parque_vehicular] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [parque_vehicular] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [parque_vehicular] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [parque_vehicular] SET ARITHABORT OFF 
GO
ALTER DATABASE [parque_vehicular] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [parque_vehicular] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [parque_vehicular] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [parque_vehicular] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [parque_vehicular] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [parque_vehicular] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [parque_vehicular] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [parque_vehicular] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [parque_vehicular] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [parque_vehicular] SET  ENABLE_BROKER 
GO
ALTER DATABASE [parque_vehicular] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [parque_vehicular] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [parque_vehicular] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [parque_vehicular] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [parque_vehicular] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [parque_vehicular] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [parque_vehicular] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [parque_vehicular] SET RECOVERY FULL 
GO
ALTER DATABASE [parque_vehicular] SET  MULTI_USER 
GO
ALTER DATABASE [parque_vehicular] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [parque_vehicular] SET DB_CHAINING OFF 
GO
ALTER DATABASE [parque_vehicular] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [parque_vehicular] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [parque_vehicular] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'parque_vehicular', N'ON'
GO
ALTER DATABASE [parque_vehicular] SET QUERY_STORE = OFF
GO
USE [parque_vehicular]
GO
/****** Object:  Table [dbo].[data]    Script Date: 8/11/2020 16:08:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TIPO_PLACA] [varchar](50) NULL,
	[ANIO_DE_FABRICACION] [int] NULL,
	[CILINDRADA] [int] NULL,
	[CANTIDAD_DE_CILINDROS] [int] NULL,
	[CANTIDAD_DE_PUERTAS] [int] NULL,
	[VALOR_DEL_VEHICULO] [money] NULL,
	[COLORES] [varchar](100) NULL,
	[FECHA_DE_IMPORTACION] [date] NULL,
	[IMP_VALOR_DEL_VEHICULO] [money] NULL,
	[FECHA_DE_INGRESO] [date] NULL,
	[ANIO_INGRESO] [int] NULL,
	[MES_INGRESO] [int] NULL,
	[CLASE] [varchar](100) NULL,
	[PERTENENCIA] [varchar](100) NULL,
	[MARCA] [varchar](100) NULL,
	[MODELO] [varchar](100) NULL,
	[CAPACIDAD] [int] NULL,
	[DES_CAPACIDAD] [varchar](100) NULL,
	[COMBUSTIBLE] [varchar](100) NULL,
	[ADUANA] [varchar](100) NULL,
	[CONDICION_INGRESO] [varchar](100) NULL,
	[PROPIETARIO_DEPARTAMENTO] [varchar](100) NULL,
	[PROPIETARIO_MUNICIPIO] [varchar](100) NULL,
	[ESTADO] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [parque_vehicular] SET  READ_WRITE 
GO

use master
create database db_parking_car
use db_parking_car
CREATE TABLE [data](
	[TIPO_PLACA] [varchar](50) NULL,
	[ANIO_DE_FABRICACION] [int] NULL,
	[CILINDRADA] [int] NULL,
	[CANTIDAD_DE_CILINDROS] [int] NULL,
	[CANTIDAD_DE_PUERTAS] [int] NULL,
	[VALOR_DEL_VEHICULO] [money] NULL,
	[COLORES] [varchar](100) NULL,
	[FECHA_DE_IMPORTACION] [date] NULL,
	[IMP_VALOR_DEL_VEHICULO] [money] NULL,
	[FECHA_DE_INGRESO] [date] NULL,
	[ANIO_INGRESO] [int] NULL,
	[MES_INGRESO] [int] NULL,
	[CLASE] [varchar](100) NULL,
	[PERTENENCIA] [varchar](100) NULL,
	[MARCA] [varchar](100) NULL,
	[MODELO] [varchar](100) NULL,
	[CAPACIDAD] [int] NULL,
	[DES_CAPACIDAD] [varchar](100) NULL,
	[COMBUSTIBLE] [varchar](100) NULL,
	[ADUANA] [varchar](100) NULL,
	[CONDICION_INGRESO] [varchar](100) NULL,
	[PROPIETARIO_DEPARTAMENTO] [varchar](100) NULL,
	[PROPIETARIO_MUNICIPIO] [varchar](100) NULL,
	[ESTADO] [varchar](100) NULL,
)


drop table data


create table datetest(
fecha date null)


insert into datetest values('-')

select * from datetest
	delete from data