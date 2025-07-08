-- Por Josué Gilberto Jiménez Ajtún, Sebastian alejandro Molina Herrera, Rhandy Estuardo Cana Subuyj 
-- 2021647, 2021528, 2021639
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
    
    -- Proveedores 
Create table Proveedores(
	codigoProveedor int auto_increment,
    nombreProveedor varchar(100) not null,
    telefonoProveedor varchar(20) not null,
    correoProveedor varchar(200) not null,
    paisProveedor varchar(150),
    primary key PK_codigoProveedor (codigoProveedor)
);

Create table Categoria(
	codigoCategoria int auto_increment,
    nombreCategoria varchar(100) not null,
    descripcionCategoria varchar(200) not null,
    genero enum('Hombre', 'Mujer', 'Unisex') not null,
    rangoEdad enum('Infantil', 'Juvenil', 'Adultos') not null,
    primary key PK_codigoCategoria (codigoCategoria)
);
    
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

-- --------------------------- Entidad Proveedor --------------------------- 
-- Agregar Proveedor
Delimiter //
	Create procedure sp_AgregarProveedor(
    in nombreProveedor varchar(100), 
    in telefonoProveedor varchar(20), 
    in correoProveedor varchar(200), 
    in paisProveedor varchar(150))
		Begin
			Insert into Proveedores(nombreProveedor, telefonoProveedor, correoProveedor, paisProveedor)
				Values(nombreProveedor, telefonoProveedor, correoProveedor, paisProveedor);
        End //
Delimiter ;
call sp_AgregarProveedor('Textiles Centro', '+502 2456-7890', 'textiles.centro@gmail.com', 'Guatemala');
call sp_AgregarProveedor('Distribuidora El Faro', '+502 3345-1234', 'elfaro.proveedores@gmail.com', 'Guatemala');
call sp_AgregarProveedor('Moda Global', '+502 5566-7788', 'modaglobal@gmail.com', 'México');
call sp_AgregarProveedor('Colores y Telas', '+502 4789-0012', 'coloresytelas@gmail.com', 'El Salvador');
call sp_AgregarProveedor('Fashion Import', '+502 5123-4567', 'fashionimport@gmail.com', 'Estados Unidos');
call sp_AgregarProveedor('Ropa Latina', '+502 6034-5678', 'ropalatina@gmail.com', 'Honduras');
call sp_AgregarProveedor('Tejidos Maya', '+502 7234-1122', 'tejidosmaya@gmail.com', 'Guatemala');
call sp_AgregarProveedor('Estilo Urbano', '+502 3109-8765', 'estilourbano@gmail.com', 'Costa Rica');
call sp_AgregarProveedor('Boutique Express', '+502 4490-2233', 'boutique.express@gmail.com', 'Guatemala');
call sp_AgregarProveedor('Importadora del Sur', '+502 5678-3344', 'import.sur@gmail.com', 'Panamá');
call sp_AgregarProveedor('Distribuciones Vera', '+502 6012-4455', 'vera.distribuciones@gmail.com', 'Nicaragua');
call sp_AgregarProveedor('Telas del Norte', '+502 4343-5566', 'telasnorte@gmail.com', 'México');
call sp_AgregarProveedor('Universal Ropa', '+502 7201-6677', 'universalropa@gmail.com', 'Colombia');
call sp_AgregarProveedor('Ropa Moderna', '+502 8182-7788', 'ropamoderna@gmail.com', 'Guatemala');
call sp_AgregarProveedor('Estampados GT', '+502 9093-8899', 'estampados.gt@gmail.com', 'Guatemala');
call sp_AgregarProveedor('Tendencias del Istmo', '+502 4567-9900', 'tendenciasistmo@gmail.com', 'El Salvador');
call sp_AgregarProveedor('Comercial La Moda', '+502 2121-3344', 'comercialmoda@gmail.com', 'Honduras');
call sp_AgregarProveedor('Distribuciones América', '+502 3678-4455', 'america.dist@gmail.com', 'Costa Rica');
call sp_AgregarProveedor('Tiendas FashionMix', '+502 4532-6677', 'fashionmix.proveedor@gmail.com', 'Guatemala');
call sp_AgregarProveedor('Estilo Joven', '+502 2345-7788', 'estilojoven.gt@gmail.com', 'México');


-- Listar Proveedor
Delimiter //
	Create procedure sp_ListarProveedor()
		Begin
			Select codigoProveedor, nombreProveedor, telefonoProveedor, correoProveedor, paisProveedor from Proveedores;
        End //
Delimiter ;
call sp_ListarProveedor();

-- Eliminar Proveedor
Delimiter //
	Create procedure sp_EliminarProveedor(
    in _codigoProveedor int)
		Begin
			set foreign_key_checks = 0;
				Delete from Proveedores
					where codigoProveedor = _codigoProveedor;
				Select row_count() as filasEliminadas;
			set foreign_key_checks = 1;
        End//
Delimiter ;
call sp_EliminarProveedor(15);

-- Buscar Proveedor
Delimiter //
	Create procedure sp_BuscarProveedor(
    in _codigoProveedor int)
		Begin
			Select codigoProveedor, nombreProveedor, telefonoProveedor, correoProveedor, paisProveedor from Proveedores
				where codigoProveedor = _codigoProveedor;
        End //
Delimiter ;
call sp_BuscarProveedor(1);

-- Editar Proveedor
Delimiter //
	Create procedure sp_EditarProveedor(
    in _codigoProveedor int,
    in _nombreProveedor varchar(100), 
    in _telefonoProveedor varchar(20), 
    in _correoProveedor varchar(200), 
    in _paisProveedor varchar(150))
		Begin
			Update Proveedores
				set nombreProveedor = _nombreProveedor,
					telefonoProveedor = _telefonoProveedor,
                    correoProveedor = _correoProveedor,
                    paisProveedor = _paisProveedor
					where codigoProveedor = _codigoProveedor;
        End //
Delimiter ;
call sp_EditarProveedor(16, 'Tendencias del Sur', '+502 4567-8899', 'tendenciassur@gmail.com', 'Costa Rica');
call sp_EditarProveedor(17, 'La Moda Express', '+502 2122-4455', 'lamodaexpress@gmail.com', 'Honduras');
call sp_EditarProveedor(18, 'Distribuciones Continental', '+502 3678-5566', 'dist.continental@gmail.com', 'Colombia');
call sp_EditarProveedor(19, 'FashionMix Proveedores', '+502 4533-6788', 'proveedor.fashionmix@gmail.com', 'Guatemala');
call sp_EditarProveedor(20, 'Estilo Joven Plus', '+502 2346-7899', 'estilojovenplus@gmail.com', 'México');

-- --------------------------- Entidad Categoria --------------------------- 
-- Agregar Categoria
Delimiter //
	Create procedure sp_AgregarCategoria(
    in nombreCategoria varchar(100), 
    in descripcionCategoria varchar(200), 
    in genero enum('Hombre','Mujer','Unisex'), 
    in rangoEdad enum('Infantil','Juvenil','Adultos'))
		Begin
			Insert into Categoria(nombreCategoria, descripcionCategoria, genero, rangoEdad)
				Values(nombreCategoria, descripcionCategoria, genero, rangoEdad);
        End //
Delimiter ;
call sp_AgregarCategoria('Camisas Casual', 'Camisas de uso diario y relajado', 'Hombre', 'Adultos');
call sp_AgregarCategoria('Blusas Elegantes', 'Blusas para eventos y trabajo', 'Mujer', 'Adultos');
call sp_AgregarCategoria('Ropa Deportiva', 'Prendas para hacer ejercicio', 'Unisex', 'Juvenil');
call sp_AgregarCategoria('Pijamas', 'Conjunto de dormir cómodo', 'Unisex', 'Infantil');
call sp_AgregarCategoria('Vestidos de Fiesta', 'Vestidos elegantes para eventos', 'Mujer', 'Juvenil');
call sp_AgregarCategoria('Camisas Formales', 'Camisas para oficina o reuniones', 'Hombre', 'Adultos');
call sp_AgregarCategoria('Pantalones Cargo', 'Pantalones con bolsillos utilitarios', 'Hombre', 'Juvenil');
call sp_AgregarCategoria('Faldas Casual', 'Faldas para el día a día', 'Mujer', 'Adultos');
call sp_AgregarCategoria('Shorts', 'Shorts para clima cálido', 'Unisex', 'Juvenil');
call sp_AgregarCategoria('Suéteres', 'Prendas abrigadoras para frío', 'Unisex', 'Adultos');
call sp_AgregarCategoria('Ropa Escolar', 'Uniformes y prendas escolares', 'Unisex', 'Infantil');
call sp_AgregarCategoria('Chaquetas', 'Prendas para el frío y estilo', 'Unisex', 'Juvenil');
call sp_AgregarCategoria('Ropa de Playa', 'Ropa ligera para el verano', 'Unisex', 'Adultos');
call sp_AgregarCategoria('Leggins', 'Ropa ajustada y cómoda', 'Mujer', 'Juvenil');
call sp_AgregarCategoria('Jeans', 'Pantalones de mezclilla', 'Unisex', 'Juvenil');
call sp_AgregarCategoria('Trajes', 'Ropa formal para eventos', 'Hombre', 'Adultos');
call sp_AgregarCategoria('Vestidos Casual', 'Vestidos para uso diario', 'Mujer', 'Adultos');
call sp_AgregarCategoria('Sudaderas', 'Ropa cómoda para clima fresco', 'Unisex', 'Juvenil');
call sp_AgregarCategoria('Conjuntos Infantiles', 'Ropa para niños pequeños', 'Unisex', 'Infantil');
call sp_AgregarCategoria('Camisas Polo', 'Camisas semiformales de algodón', 'Hombre', 'Juvenil');

-- Listar Categoria
Delimiter //
	Create procedure sp_ListarCategoria()
		Begin
			Select codigoCategoria, nombreCategoria, descripcionCategoria, genero, rangoEdad from Categoria;
        End //
Delimiter ;
call sp_ListarCategoria();

-- Eliminar Categoria
Delimiter //
	Create procedure sp_EliminarCategoria(
    in _codigoCategoria int)
		Begin
			set foreign_key_checks = 0;
				Delete from Categoria
					where codigoCategoria = _codigoCategoria;
				Select row_count() as filasEliminadas;
			set foreign_key_checks = 1;
        End//
Delimiter ;
call sp_EliminarCategoria(15);

-- Buscar Categoria
Delimiter //
	Create procedure sp_BuscarCategoria(
    in _codigoCategoria int)
		Begin
			Select codigoCategoria, nombreCategoria, descripcionCategoria, genero, rangoEdad from Categoria
				where codigoCategoria = _codigoCategoria;
        End //
Delimiter ;
call sp_BuscarCategoria(1);

-- Editar Categoria
Delimiter //
	Create procedure sp_EditarCategoria(
    in _codigoCategoria int,
    in _nombreCategoria varchar(100), 
    in _descripcionCategoria varchar(200), 
    in _genero enum('Hombre','Mujer','Unisex'), 
    in _rangoEdad enum('Infantil','Juvenil','Adultos'))
		Begin
			Update Categoria
				set nombreCategoria = _nombreCategoria,
                    descripcionCategoria = _descripcionCategoria,
                    genero = _genero,
                    rangoEdad = _rangoEdad
					where codigoCategoria = _codigoCategoria;
        End //
Delimiter ;
call sp_EditarCategoria(16, 'Trajes Ejecutivos', 'Ropa formal para oficina y eventos', 'Hombre', 'Adultos');
call sp_EditarCategoria(17, 'Vestidos de Verano', 'Vestidos frescos para clima cálido', 'Mujer', 'Adultos');
call sp_EditarCategoria(18, 'Sudaderas Estampadas', 'Prendas juveniles con diseño gráfico', 'Unisex', 'Juvenil');
call sp_EditarCategoria(19, 'Ropa Escolar Moderna', 'Conjuntos escolares actualizados', 'Unisex', 'Infantil');
call sp_EditarCategoria(20, 'Camisas Polo Juveniles', 'Polo juveniles para el día a día', 'Hombre', 'Juvenil');

