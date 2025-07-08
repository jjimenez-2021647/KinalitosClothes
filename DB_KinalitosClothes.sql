-- Por Josué Gilberto Jiménez Ajtún, Sebastian alejandro Molina Herrera
-- 2021647, 2021528
-- IN5BM
-- 07/07/2025

-- Creación de la base de datos
Drop Database if exists DB_KinalitosClothes; 
Create Database DB_KinalitosClothes;
Use DB_KinalitosClothes;

-- ---------- Entidades ----------
-- Clientes
Create table Clientes(
	codigoCliente int auto_increment,
	nombreCliente varchar(100) not null,
	apellidoCliente varchar(100) not null,
	correoCliente varchar(150) not null,
	telefonoCliente varchar(20) not null,
	direccionCliente varchar(200) not null,
	primary key PK_codigoCliente (codigoCliente)  
);