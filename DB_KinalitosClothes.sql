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
	primary key PK_codigoCliente (codigoCliente));
    
-- --------------------------- Procedimientos almacenados ---------------------------
-- --------------------------- Entidad Cliente --------------------------- 
-- Agregar Cliente
Delimiter //
	Create procedure sp_AgregarCliente(
    in nombreCliente varchar(100),
    in apellidoCliente varchar(100), 
    in correoCliente varchar(150), 
    in telefonoCliente varchar(20), 
    in direccionCliente varchar(200))
		Begin
			Insert into Clientes(nombreCliente, apellidoCliente, correoCliente, telefonoCliente, direccionCliente)
				Values(nombreCliente, apellidoCliente, correoCliente, telefonoCliente, direccionCliente);
        End //
Delimiter ;
call sp_AgregarCliente('Carlos', 'Ramírez', 'carlos.ramirez@gmail.com', '+502 5123-4567', 'Zona 1, Ciudad de Guatemala');
call sp_AgregarCliente('Ana', 'Gómez', 'ana.gomez@gmail.com', '+502 4785-1234', 'Zona 10, Guatemala');
call sp_AgregarCliente('Luis', 'Martínez', 'luis.martinez@gmail.com', '+502 2234-5678', 'Zona 7, Mixco');
call sp_AgregarCliente('María', 'Fernández', 'maria.fernandez@gmail.com', '+502 5566-7788', 'San Cristóbal, Mixco');
call sp_AgregarCliente('Jorge', 'Lopez', 'jorge.lopez@gmail.com', '+502 4356-7890', 'Villa Nueva, zona 4');
call sp_AgregarCliente('Andrea', 'Soto', 'andrea.soto@gmail.com', '+502 3278-9012', 'Zona 15, Vista Hermosa');
call sp_AgregarCliente('Fernando', 'Ortega', 'fernando.ortega@gmail.com', '+502 4123-6543', 'Zona 5, Guatemala');
call sp_AgregarCliente('Lucía', 'Pérez', 'lucia.perez@gmail.com', '+502 5456-7789', 'Amatitlán, Guatemala');
call sp_AgregarCliente('Diego', 'Alvarado', 'diego.alvarado@gmail.com', '+502 6345-1230', 'Zona 16, Cayalá');
call sp_AgregarCliente('Camila', 'Hernández', 'camila.hernandez@gmail.com', '+502 7543-2109', 'Zona 12, La Reformita');
call sp_AgregarCliente('Esteban', 'Chávez', 'esteban.chavez@gmail.com', '+502 6123-9876', 'Villa Canales, Guatemala');
call sp_AgregarCliente('Gabriela', 'Ramos', 'gabriela.ramos@gmail.com', '+502 4231-1020', 'San Miguel Petapa');
call sp_AgregarCliente('Pablo', 'Cruz', 'pablo.cruz@gmail.com', '+502 3345-7654', 'Zona 3, Guatemala');
call sp_AgregarCliente('Daniela', 'Mejía', 'daniela.mejia@gmail.com', '+502 4567-8901', 'Zona 11, Mariscal');
call sp_AgregarCliente('Mario', 'Escobar', 'mario.escobar@gmail.com', '+502 5432-1209', 'Santa Catarina Pinula');
call sp_AgregarCliente('Rebeca', 'Salazar', 'rebeca.salazar@gmail.com', '+502 6677-8902', 'Zona 6, Guatemala');
call sp_AgregarCliente('Óscar', 'Córdova', 'oscar.cordova@gmail.com', '+502 7098-3456', 'Zona 18, El Paraíso');
call sp_AgregarCliente('Isabel', 'Ruiz', 'isabel.ruiz@gmail.com', '+502 3210-7654', 'Mixco, zona 8');
call sp_AgregarCliente('Ricardo', 'García', 'ricardo.garcia@gmail.com', '+502 4890-3211', 'Zona 2, Jocotenango');
call sp_AgregarCliente('Valeria', 'Morales', 'valeria.morales@gmail.com', '+502 6201-2345', 'Zona 19, Guatemala');



-- Listar Clientes
Delimiter //
	Create procedure sp_ListarClientes()
		Begin
			Select codigoCliente, nombreCliente, apellidoCliente, correoCliente, telefonoCliente, direccionCliente from Clientes;
        End //
Delimiter ;
call sp_ListarClientes();

-- Eliminar Cliente
Delimiter //
	Create procedure sp_EliminarCliente(
    in _codigoCliente int)
		Begin
			set foreign_key_checks = 0;
				Delete from Clientes
					where codigoCliente = _codigoCliente;
				Select row_count() as filasEliminadas;
			set foreign_key_checks = 1;
        End//
Delimiter ;
call sp_EliminarCliente(15);


-- Buscar Cliente
Delimiter //
	Create procedure sp_BuscarCliente(
    in _codigoCliente int)
		Begin
			Select codigoCliente, nombreCliente, apellidoCliente, correoCliente, telefonoCliente, direccionCliente from Clientes
				where codigoCliente = _codigoCliente;
        End //
Delimiter ;
call sp_BuscarCliente(15);

-- Editar Cliente
Delimiter //
	Create procedure sp_EditarCliente(
    in _codigoCliente int,
    in _nombreCliente varchar(100),
    in _apellidoCliente varchar(100), 
    in _correoCliente varchar(150), 
    in _telefonoCliente varchar(20), 
    in _direccionCliente varchar(200))
		Begin
			Update Clientes
				set nombreCliente = _nombreCliente,
				apellidoCliente = _apellidoCliente,
				correoCliente = _correoCliente,
				telefonoCliente = _telefonoCliente,
                direccionCliente = _direccionCliente
					where codigoCliente = _codigoCliente;
        End //
Delimiter ;
call sp_EditarCliente(16, 'Rebeca', 'Hernández', 'rebeca.hernandez@gmail.com', '+502 7689-1234', 'Zona 6, El Gallito');
call sp_EditarCliente(17, 'Óscar', 'Ramírez', 'oscar.ramirez@gmail.com', '+502 8090-3456', 'Zona 18, Las Ilusiones');
call sp_EditarCliente(18, 'Isabel', 'López', 'isabel.lopez@gmail.com', '+502 3902-8765', 'Mixco, zona 1');
call sp_EditarCliente(19, 'Ricardo', 'Estrada', 'ricardo.estrada@gmail.com', '+502 4791-2345', 'Zona 2, El Sauce');
call sp_EditarCliente(20, 'Valeria', 'Guzmán', 'valeria.guzman@gmail.com', '+502 6012-9876', 'Zona 19, Santa Faz');