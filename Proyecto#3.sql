CREATE DATABASE ERPPRUEBA12
GO

USE ERPPRUEBA12;
GO

CREATE TABLE Usuarios (
    IDUsuario INT IDENTITY(1,1) PRIMARY KEY,
    NombreUS VARCHAR(50) NOT NULL UNIQUE,
    ContrasenaUS VARCHAR(255) NOT NULL
);
INSERT INTO Usuarios(NombreUS, ContrasenaUS) values
('Prueba','Nashe'),
('Cartel','desanta'),
('rapapa','disco'),
('perros', 'gatos'),
('p1','pp'),
('Administrador','SOYadmin.');



CREATE TABLE Zona (
	Nombre VARCHAR(20) UNIQUE NOT NULL,
	TamanoKmCuadrado INT NOT NULL,
	Descripcion VARCHAR(200),
	PRIMARY KEY (Nombre)
);


INSERT INTO Zona (Nombre, TamanoKmCuadrado,Descripcion) VALUES
('Pacifico sur',100 ,'Muchas playas y vegetación'),
('Pacifico norte',300 ,'Mucho sol y climas calidos'),
('Pacifico central',250 ,'Muchas playas y esta llena de bosque y otros atractivos'),
('Caribe norte',100 ,'Mucha flora y fauna en exceso'),
('Caribe sur', 100,'Las mejores playas y lugar de mucha cultura'),
('Valle central', 400,'Donde hay más población y muchas oportunidades de crecimiento'),
('Zona norte',200 ,'Mucha tierra y muchos cultivos de caña y arroz');


CREATE TABLE Sector (
	Nombre VARCHAR(20) UNIQUE NOT NULL,
	Descripcion VARCHAR(200),
	PRIMARY KEY (Nombre)
);

INSERT INTO Sector (Nombre, Descripcion) VALUES
('Económico', 'Relaciono con la producción y venta de productos.'),
('Constructor', 'Sector dedicado a la construcción de edificios, infraestructuras y obras públicas.'),
('Tecnológico', 'En busca de desarrollo y uso de tecnología en diversos ámbitos.'),
('Salud', 'Sector que abarca servicios médicos, farmacéuticos y de bienestar.'),
('Educación', 'Sector que se ocupa de la enseñanza y formación en todos los niveles.'),
('Industrial', 'Sector que engloba la producción de bienes en fábricas.'),
('Transporte', 'Sector relacionado con el movimiento de personas y mercancías.'),
('Energía', 'Sector que abarca la producción y distribución de energía.'),
('Comercial', 'Sector dedicado a la venta de productos y servicios al por menor.'),
('Cultural', 'Sector que abarca actividades relacionadas con la cultura y el arte.'),
('Deportivo', 'Sector que se enfoca en la práctica de deportes.'),
('Automotriz', 'Sector dedicado a la fabricación y venta de vehículos.'),
('Telecomunicaciones', 'Sector que abarca servicios de comunicación a distancia.'),
('Alimentación', 'Sector que se ocupa de la producción y distribución de alimentos.');






CREATE TABLE Estado(
	TipoEstado VARCHAR(20) NOT NULL,
	Descripcion VARCHAR(200) NOT NULL,
	PRIMARY KEY (TipoEstado)
);

insert into Estado(TipoEstado,Descripcion) values
('Abierta', 'Todavia no se da un veredicto final'),
('Aprobado', 'Se aprueba la cotizacion yupiiii'),
('Rechazado', 'Se rechaza la cotizacion mecagoentodo');


CREATE TABLE Probabilidad (
	Porcentaje FLOAT,
	ProbabilidadEstimada VARCHAR(20),
	PRIMARY KEY (Porcentaje)
);


INSERT INTO Probabilidad (Porcentaje, ProbabilidadEstimada)
VALUES 
(0.75, 'Alta'),
(0.50, 'Media'),
(0.25, 'Baja');



CREATE TABLE Prioridad(
	TipoPrioridad VARCHAR(20) NOT NULL,
	Descripcion varchar(200) not null
	PRIMARY KEY (TipoPrioridad)
);

insert into Prioridad(TipoPrioridad, Descripcion) values
('Alta','Merece mucha atención'),
('Media','No se debe descuidar'),
('Baja','Para hacer después');


CREATE TABLE TipoCaso(
	Tipocaso VARCHAR(20) NOT NULL,
	Descripcion VARCHAR(200) NOT NULL,
	PRIMARY KEY (Tipocaso)
);

insert into TipoCaso(Tipocaso,Descripcion) values
('Reclamo','Se exige un reclamo por un error'),
('Devolucion','Se necesita abrir un caso para que devuelvan ciertos articulos'),
('Garantia','Un producto se daño antes de lo esperado');


CREATE TABLE Departamento (
	Codigo VARCHAR(15) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	PRIMARY KEY(Codigo)
);
INSERT INTO Departamento(Codigo, Nombre) values
('DEP1', 'Mantenimiento'),
('DEP2', 'Ingeniería'),
('DEP3', 'Logística'),
('DEP4', 'Administración'),
('DEP5', 'Atención al cliente'),
('DEP6', 'Ventas'),
('DEP7', 'Producción'),
('DEP8', 'Supervisión'),
('DEP9', 'Electricidad');



CREATE TABLE Modulos (
    IDModulo INT PRIMARY KEY,
    NombreModulo VARCHAR(50) UNIQUE NOT NULL,
    Descripcion VARCHAR(200)
);

INSERT INTO Modulos(IDModulo,NombreModulo,Descripcion) values
(1, 'Factura', 'Se le permite hacer cosas dentro de la factura'),
(2, 'Cotizacion', 'Se le permite hacer cosas dentro de la cotización'),
(3, 'Tarea', 'Se le permite hacer cosas dentro de la tarea'),
(4, 'Bodega', 'Se le permite hacer cosas dentro de la bodega'),
(5, 'Planilla', 'Se le permite hacer cosas dentro de la planilla'),
(6, 'Departamento', 'Se le permite hacer cosas del departamento'),
(7, 'Caso', 'Se le permite hacer cosas de un caso'),
(8, 'Usuario', 'Se le permite hacer cosas del usuario');

CREATE TABLE Acciones (
    IDAccion INT NOT NULL,
    tipoAccion VARCHAR(40) UNIQUE,
    descripcion VARCHAR(200),
    PRIMARY KEY (IDAccion)
);

INSERT INTO Acciones(IDAccion,tipoAccion,descripcion) values
(1, 'Visualizacion', 'Se le permite todo con respecto a visualizar'),
(2, 'Creacion', 'Se le permite todo con respecto a la creación'),
(3, 'Reporteria', 'Se le permite todo con respecto a reportes'),
(4, 'Edicion', 'Se le permite todo con respecto a editar');



CREATE TABLE ModulosXAcciones (
    NombreModulo varchar(50),
    tipoAccion varchar(40),
    PRIMARY KEY (NombreModulo, tipoAccion),
    FOREIGN KEY (NombreModulo) REFERENCES Modulos(NombreModulo),
    FOREIGN KEY (tipoAccion) REFERENCES Acciones(tipoAccion)
);
insert into ModulosXAcciones(NombreModulo,tipoAccion) values
('Cotizacion', 'Visualizacion'),
('Cotizacion', 'Creacion'),
('Cotizacion', 'Edicion');


CREATE TABLE Roles (
    IDRol INT IDENTITY(1,1) , --Preguntar si se puede autoIncrementar
    tipoRol VARCHAR(20) UNIQUE,
	Descripcion varchar(200),
    PRIMARY KEY (IDRol)
);
insert into Roles(tipoRol,Descripcion) values
('Encargado', 'Se encarga de que todo este bien'),
('Vendedor', 'Se encarga de vender productos'),
('Bodeguero', 'Se encarga de la bodega'),
('SuperUsuario','Es el admin'),
('Ayudante','Ayuda en todas las tareas al admin');


CREATE TABLE AccionesXrol (
    tipoRol VARCHAR(20),
    tipoAccion VARCHAR(40),
    PRIMARY KEY (tipoRol, tipoAccion),
    FOREIGN KEY (tipoRol) REFERENCES Roles(tipoRol),
    FOREIGN KEY (tipoAccion) REFERENCES Acciones(tipoAccion)
);


INSERT INTO AccionesXrol (tipoRol, tipoAccion) VALUES ('Ayudante', 'Visualizacion');
INSERT INTO AccionesXrol (tipoRol, tipoAccion) VALUES ('SuperUsuario', 'Edicion');
INSERT INTO AccionesXrol (tipoRol, tipoAccion) VALUES ('SuperUsuario', 'Reporteria');




CREATE TABLE Puesto(
	TipoPuesto VARCHAR(35) NOT NULL,
	Salario int NOT NULL,
	Descripcion VARCHAR(200) NOT NULL,
	PRIMARY KEY (TipoPuesto)
);

INSERT INTO Puesto(TipoPuesto, Salario, Descripcion) values
('Electricista', 500000, 'Se encarga de los cables y todo el fluido electrico'),
('Ingeniero', 700000, 'Se encarga de diseñar y elaborar planes para mejorar la eficiencia'),
('Control de Calidad', 480000, 'Garantiza que los productos cumplen con los estándares de calidad'),
('Encargado de Inventarios', 450000, 'Mantiene un registro actualizado del inventario'),
('Ayudante', 200000, 'Se encarga de todos los trabajos que le sean asignados'),
('Bodeguero', 350000, 'Tiene que realizar chequeos de bodega y mover mercancia'),
('MontaCargas', 400000, 'Tiene que mover mercancia pesada o de gran cantidad'),
('Recepcionista', 320000, 'Atiende a los clientes que lleguen al negocio'),
('Administrador', 450000, 'Se encarga de dirigir y ver como van los avances'),
('Operador', 370000, 'Usa maquinas y dirige de mejor forma las cargas de productos'),
('Auxiliar', 400000, 'Realiza de todo un poco de los trabajos que hay en la bodega'),
('Vendedor', 500000, 'Se encarga de buscar o atender clientes que quieran comprar productos'),
('Supervisor', 600000, 'Debe realizar chequeos constantes para ver que todo este en orden y nada falle'),
('Empacador', 350000, 'Da las ultimas ordenes de donde llevar la mercancia y guardarla'),
('Despachador', 320000, 'Busca a los vehiculos a los cuales va a cargar los productos de salida'),
('Coordinador', 320000, 'Coordina todas las entregas y posibles rutas a tomar'),
('Reparaciones', 420000, 'Tiene que hacer trabajos de reparamiento a las maquinas o bodegas'),
('Preparador', 250000, 'Va guardando y enlistando los productos a utilizar');



CREATE TABLE Empleado (
	Cedula VARCHAR(9) NOT NULL,
	Nombre varchar(30) not null,
	apellido1 varchar(30) Not null,
	apellido2 varchar(30) not null,
	genero char(1) not null,
	FechaNacimiento date not null,
	provincia varchar(30) not null,
	Direccion varchar(30) not null,
	Telefono varchar(9) not null,
	CodigoDepartamento VARCHAR(15) NOT NULL,
	FechaIngreso DATE NOT NULL,
	Puesto VARCHAR(35) NOT NULL,
	tipoRol varchar(20) not null,
	SalarioActual int not null
	PRIMARY KEY(Cedula),
	FOREIGN KEY (tipoRol) references Roles(tipoRol),
	FOREIGN KEY (CodigoDepartamento) REFERENCES Departamento(Codigo),
	FOREIGN KEY (Puesto) REFERENCES Puesto(TipoPuesto)
	);
insert into Empleado(Cedula,Nombre,apellido1,apellido2,genero,FechaNacimiento,provincia,Direccion,Telefono,CodigoDepartamento,FechaIngreso,Puesto,tipoRol,SalarioActual)
values
('123456789', 'Jose', 'Perez', 'Rodriguez', 'M', '1990-05-12', 'San José', 'San pedro 50 metros norte', '22223333', 'DEP1', '2015-03-10', 'Electricista', 'Encargado', 500000),
('987654321', 'Sofia', 'Lopez', 'Jimenez', 'F', '1985-09-15', 'Alajuela', 'Alajuelita underground', '22334455', 'DEP2', '2010-07-22', 'Ingeniero', 'Vendedor', 700000),
('112233445', 'Fabian', 'Martinez', 'Solis', 'M', '1995-12-05', 'Heredia', 'Guarari', '22445566', 'DEP3', '2018-01-19', 'Control de Calidad', 'Bodeguero', 480000),
('556677889', 'Valka', 'Gomez', 'Alvarado', 'F', '1992-03-28', 'Cartago', 'Lomas del sur', '22556677', 'DEP4', '2017-09-15', 'Administrador', 'Encargado', 450000),
('334455667', 'Andres', 'Vargas', 'Campos', 'M', '1998-11-23', 'Puntarenas', 'Del faro a 30 metros', '22667788', 'DEP5', '2019-11-25', 'Recepcionista', 'Vendedor', 320000),
('998877665', 'Clarisa', 'Castro', 'Mora', 'F', '1991-06-30', 'Guanacaste', 'Playa samara casa 50', '22778899', 'DEP6', '2016-04-13', 'Vendedor', 'Ayudante',500000),
--Nuevos empleados a los que puedo darles cotizaciones o facturas
('654321987', 'Mario', 'Guzmán', 'Perez', 'M', '1991-08-20', 'San José', 'Calle Blancos, 300 metros este', '22889922', 'DEP7', '2018-04-12', 'Operador', 'Ayudante', 370000),
('223344556', 'Elena', 'Hernández', 'Lee', 'F', '1986-11-17', 'Cartago', 'Los Ángeles, casa 14', '22880099', 'DEP8', '2014-09-25', 'Supervisor', 'SuperUsuario', 600000),
('887766554', 'Carlos', 'Morales', 'Smith', 'M', '1989-05-04', 'Heredia', 'San Rafael, 200 metros oeste', '22446655', 'DEP9', '2015-01-30', 'Electricista', 'Encargado', 500000),
('445566778', 'Jahsimar', 'Medina', 'Solis', 'F', '1992-06-10', 'Alajuela', 'Calle nueva, 50 metros sur', '22770055', 'DEP1', '2016-08-15', 'Encargado de Inventarios', 'Bodeguero', 450000),
('998877664', 'Liliana', 'Campos', 'Alvarado', 'F', '1995-09-14', 'Guanacaste', 'Playa Grande, casa 22', '22334422', 'DEP2', '2020-07-10', 'Ingeniero', 'Encargado', 700000),
('335577992', 'Diego', 'Ramírez', 'Ávila', 'M', '1987-12-12', 'San José', 'Barrio La Cruz', '22112233', 'DEP4', '2019-11-05', 'Administrador', 'SuperUsuario', 450000),
('112244335', 'Verónica', 'López', 'Cabrera', 'F', '1994-03-08', 'Heredia', 'Santo Domingo', '22221144', 'DEP5', '2021-02-01', 'Recepcionista', 'Vendedor', 320000),
('775566443', 'Oscar', 'González', 'Vargas', 'M', '1988-02-19', 'Alajuela', 'Barrio San Antonio', '22335577', 'DEP6', '2013-06-22', 'Vendedor', 'Vendedor', 500000),
('998877221', 'Gabriela', 'Sáenz', 'Marchena', 'F', '1993-12-21', 'Cartago', 'El Carmen, casa 15', '22446688', 'DEP7', '2019-04-25', 'Empacador', 'Ayudante', 350000),
('335566778', 'Santiago', 'Solano', 'Quiroz', 'M', '1985-05-27', 'San José', 'Calle 8, casa 30', '22331155', 'DEP8', '2012-01-18', 'Supervisor', 'Encargado', 600000),
('887788665', 'Natasha', 'Castro', 'Araya', 'F', '1991-10-14', 'Heredia', 'Barrio Fátima', '22445566', 'DEP9', '2018-08-12', 'Reparaciones', 'Bodeguero', 420000),
('119922334', 'Roberto', 'Monge', 'Álvarez', 'M', '1989-09-25', 'San José', 'La Uruca', '22557788', 'DEP1', '2015-07-30', 'Control de Calidad', 'Bodeguero', 480000),
('112233998', 'Patricia', 'Vargas', 'Méndez', 'F', '1992-11-11', 'Alajuela', 'San Antonio', '22229944', 'DEP3', '2016-05-23', 'Auxiliar', 'Ayudante', 400000),
('665544332', 'Emilio', 'Cordero', 'Solis', 'M', '1996-03-04', 'Puntarenas', 'Playa Hermosa', '22998866', 'DEP6', '2022-01-11', 'Despachador', 'Encargado', 320000);





CREATE TABLE HistoricoPuesto (
    IdHistoricoPuesto INT PRIMARY KEY IDENTITY(1,1), 
    CedulaEmpleado VARCHAR(9) not null, 
    FechaInicio DATE not null,  
    FechaFin DATE not null, 
    NombrePuesto VARCHAR(50) not null, 
    Departamento VARCHAR(50) not null,
    FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(Cedula)
);

CREATE TABLE HistoricoSalario (
    IdHistoricoSalario INT PRIMARY KEY IDENTITY(1,1), 
    CedulaEmpleado VARCHAR(9) not null,
    FechaInicio DATE not null,  
    FechaFin DATE not null, 
    Monto Decimal not null, 
    NombrePuesto VARCHAR(50) not null, 
    Departamento VARCHAR(50) not null,
    FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(Cedula)
);


--En este probablemente vamos a ocupar la función que habíamos creado pero con un cursor para que se hagan todos
CREATE TABLE Planilla (
	CodigoPlanilla VARCHAR(15) NOT NULL,
	FechaPlanilla date not null,   
	CedulaEmpleado varchar(9) not null,
	HorasRealizadas int not null,
	Salario int null, 
	foreign key (CedulaEmpleado) references Empleado(Cedula),
	Primary key (CodigoPlanilla, CedulaEmpleado)
);
--Creo que tenemos que cambiar la planilla pues de una se pueden pagar varios empleados
insert into Planilla (CodigoPlanilla, FechaPlanilla, CedulaEmpleado, HorasRealizadas, Salario) values
('PL001', '2024-11-01', '123456789', 180, NULL),
('PL002', '2024-11-01', '987654321', 200, NULL),
('PL003', '2024-11-01', '112233445', 150, NULL),
('PL004', '2024-11-01', '556677889', 220, NULL),
('PL005', '2024-11-01', '334455667', 170, NULL),
('PL006', '2024-11-01', '998877665', 130, NULL),
('PL007', '2024-11-01', '654321987', 250, NULL),
('PL008', '2024-11-01', '223344556', 180, NULL),
('PL009', '2024-11-01', '887766554', 210, NULL),
('PL010', '2024-11-01', '445566778', 160, NULL),
('PL011', '2024-11-01', '556677889', 240, NULL),
('PL012', '2024-11-01', '998877664', 220, NULL),
('PL013', '2024-11-01', '335577992', 180, NULL),
('PL014', '2024-11-01', '112244335', 190, NULL),
('PL015', '2024-11-01', '775566443', 210, NULL),
('PL016', '2024-11-01', '998877221', 150, NULL),
('PL017', '2024-11-01', '335566778', 280, NULL),
('PL018', '2024-11-01', '887788665', 160, NULL),
('PL019', '2024-11-01', '119922334', 230, NULL),
('PL020', '2024-11-01', '112233998', 200, NULL),
('PL021', '2024-11-01', '665544332', 270, NULL),

('PL022', '2024-12-01', '123456789', 120, NULL),
('PL023', '2024-12-01', '987654321', 110, NULL),
('PL024', '2024-12-01', '112233445', 130, NULL),
('PL025', '2024-12-01', '556677889', 230, NULL),
('PL025', '2024-12-01', '334455667', 120, NULL),
('PL026', '2024-12-01', '998877665', 160, NULL),
('PL027', '2024-12-01', '654321987', 240, NULL),
('PL028', '2024-12-01', '223344556', 260, NULL),
('PL029', '2024-12-01', '887766554', 110, NULL),
('PL030', '2024-12-01', '445566778', 50, NULL),
('PL031', '2024-12-01', '556677889', 280, NULL),
('PL032', '2024-12-01', '998877664', 115, NULL),
('PL033', '2024-12-01', '335577992', 200, NULL),
('PL034', '2024-12-01', '112244335', 123, NULL),
('PL035', '2024-12-01', '775566443', 125, NULL),
('PL036', '2024-12-01', '998877221', 215, NULL),
('PL037', '2024-12-01', '335566778', 70, NULL),
('PL038', '2024-12-01', '887788665', 210, NULL),
('PL039', '2024-12-01', '119922334', 250, NULL),
('PL040', '2024-12-01', '112233998', 280, NULL),
('PL041', '2024-12-01', '665544332', 110, NULL),



('PL042', '2025-01-01', '123456789', 174, NULL),
('PL043', '2025-01-01', '987654321', 225, NULL),
('PL044', '2025-01-01', '112233445', 190, NULL),
('PL045', '2025-01-01', '556677889', 210, NULL),
('PL046', '2025-01-01', '334455667', 150, NULL),
('PL047', '2025-01-01', '998877665', 270, NULL),
('PL048', '2025-01-01', '654321987', 230, NULL),
('PL049', '2025-01-01', '223344556', 160, NULL),
('PL050', '2025-01-01', '887766554', 195, NULL),
('PL051', '2025-01-01', '445566778', 185, NULL),
('PL052', '2025-01-01', '556677889', 255, NULL),
('PL053', '2025-01-01', '998877664', 220, NULL),
('PL054', '2025-01-01', '335577992', 230, NULL),
('PL055', '2025-01-01', '112244335', 200, NULL),
('PL056', '2025-01-01', '775566443', 260, NULL),
('PL057', '2025-01-01', '998877221', 180, NULL),
('PL058', '2025-01-01', '335566778', 240, NULL),
('PL059', '2025-01-01', '887788665', 150, NULL),
('PL060', '2025-01-01', '119922334', 210, NULL),
('PL061', '2025-01-01', '112233998', 230, NULL),
('PL062', '2025-01-01', '665544332', 280, NULL),

('PL063', '2025-02-01', '123456789', 174, NULL),
('PL064', '2025-02-01', '987654321', 225, NULL),
('PL065', '2025-02-01', '112233445', 185, NULL),
('PL066', '2025-02-01', '556677889', 210, NULL),
('PL067', '2025-02-01', '334455667', 160, NULL),
('PL068', '2025-02-01', '998877665', 270, NULL),
('PL069', '2025-02-01', '654321987', 230, NULL),
('PL070', '2025-02-01', '223344556', 156, NULL),
('PL071', '2025-02-01', '887766554', 190, NULL),
('PL072', '2025-02-01', '445566778', 183, NULL),
('PL073', '2025-02-01', '556677889', 248, NULL),
('PL074', '2025-02-01', '998877664', 207, NULL),
('PL075', '2025-02-01', '335577992', 233, NULL),
('PL076', '2025-02-01', '112244335', 198, NULL),
('PL077', '2025-02-01', '775566443', 265, NULL),
('PL078', '2025-02-01', '998877221', 182, NULL),
('PL079', '2025-02-01', '335566778', 245, NULL),
('PL080', '2025-02-01', '887788665', 157, NULL),
('PL081', '2025-02-01', '119922334', 217, NULL),
('PL082', '2025-02-01', '112233998', 235, NULL),
('PL083', '2025-02-01', '665544332', 275, NULL),

('PL084', '2025-03-01', '123456789', 178, NULL),
('PL085', '2025-03-01', '987654321', 222, NULL),
('PL086', '2025-03-01', '112233445', 169, NULL),
('PL087', '2025-03-01', '556677889', 212, NULL),
('PL088', '2025-03-01', '334455667', 168, NULL),
('PL089', '2025-03-01', '998877665', 144, NULL),
('PL090', '2025-03-01', '654321987', 265, NULL),
('PL091', '2025-03-01', '223344556', 198, NULL),
('PL092', '2025-03-01', '887766554', 221, NULL),
('PL093', '2025-03-01', '445566778', 175, NULL),
('PL094', '2025-03-01', '556677889', 230, NULL),
('PL095', '2025-03-01', '998877664', 213, NULL),
('PL096', '2025-03-01', '335577992', 185, NULL),
('PL097', '2025-03-01', '112244335', 210, NULL),
('PL099', '2025-03-01', '775566443', 225, NULL),
('PL100', '2025-03-01', '998877221', 153, NULL),
('PL101', '2025-03-01', '335566778', 250, NULL),
('PL102', '2025-03-01', '887788665', 173, NULL),
('PL103', '2025-03-01', '119922334', 234, NULL),
('PL104', '2025-03-01', '112233998', 209, NULL),
('PL105', '2025-03-01', '665544332', 276, NULL),

('PL106', '2025-04-01', '123456789', 182, NULL),
('PL107', '2025-04-01', '987654321', 215, NULL),
('PL108', '2025-04-01', '112233445', 155, NULL),
('PL109', '2025-04-01', '556677889', 225, NULL),
('PL110', '2025-04-01', '334455667', 165, NULL),
('PL111', '2025-04-01', '998877665', 140, NULL),
('PL112', '2025-04-01', '654321987', 260, NULL),
('PL113', '2025-04-01', '223344556', 185, NULL),
('PL114', '2025-04-01', '887766554', 208, NULL),
('PL115', '2025-04-01', '445566778', 170, NULL),
('PL116', '2025-04-01', '556677889', 235, NULL),
('PL117', '2025-04-01', '998877664', 212, NULL),
('PL118', '2025-04-01', '335577992', 178, NULL),
('PL119', '2025-04-01', '112244335', 202, NULL),
('PL120', '2025-04-01', '775566443', 220, NULL),
('PL121', '2025-04-01', '998877221', 157, NULL),
('PL122', '2025-04-01', '335566778', 267, NULL),
('PL123', '2025-04-01', '887788665', 162, NULL),
('PL124', '2025-04-01', '119922334', 233, NULL),
('PL125', '2025-04-01', '112233998', 195, NULL),
('PL126', '2025-04-01', '665544332', 273, NULL),


('PL127', '2025-05-01', '123456789', 182, NULL),
('PL128', '2025-05-01', '987654321', 215, NULL),
('PL129', '2025-05-01', '112233445', 155, NULL),
('PL130', '2025-05-01', '556677889', 228, NULL),
('PL131', '2025-05-01', '334455667', 168, NULL),
('PL132', '2025-05-01', '998877665', 138, NULL),
('PL133', '2025-05-01', '654321987', 260, NULL),
('PL134', '2025-05-01', '223344556', 185, NULL),
('PL135', '2025-05-01', '887766554', 211, NULL),
('PL136', '2025-05-01', '445566778', 165, NULL),
('PL137', '2025-05-01', '556677889', 232, NULL),
('PL138', '2025-05-01', '998877664', 218, NULL),
('PL139', '2025-05-01', '335577992', 176, NULL),
('PL140', '2025-05-01', '112244335', 203, NULL),
('PL141', '2025-05-01', '775566443', 222, NULL),
('PL142', '2025-05-01', '998877221', 158, NULL),
('PL143', '2025-05-01', '335566778', 275, NULL),
('PL144', '2025-05-01', '887788665', 164, NULL),
('PL145', '2025-05-01', '119922334', 237, NULL),
('PL146', '2025-05-01', '112233998', 193, NULL),
('PL147', '2025-05-01', '665544332', 268, NULL),

('PL148', '2025-06-01', '123456789', 185, NULL),
('PL149', '2025-06-01', '987654321', 210, NULL),
('PL150', '2025-06-01', '112233445', 145, NULL),
('PL151', '2025-06-01', '556677889', 235, NULL),
('PL152', '2025-06-01', '334455667', 160, NULL),
('PL153', '2025-06-01', '998877665', 125, NULL),
('PL154', '2025-06-01', '654321987', 260, NULL),
('PL155', '2025-06-01', '223344556', 190, NULL),
('PL156', '2025-06-01', '887766554', 220, NULL),
('PL157', '2025-06-01', '445566778', 150, NULL),
('PL158', '2025-06-01', '556677889', 245, NULL),
('PL159', '2025-06-01', '998877664', 225, NULL),
('PL160', '2025-06-01', '335577992', 175, NULL),
('PL161', '2025-06-01', '112244335', 195, NULL),
('PL162', '2025-06-01', '775566443', 215, NULL),
('PL163', '2025-06-01', '998877221', 155, NULL),
('PL164', '2025-06-01', '335566778', 270, NULL),
('PL165', '2025-06-01', '887788665', 165, NULL),
('PL166', '2025-06-01', '119922334', 240, NULL),
('PL167', '2025-06-01', '112233998', 210, NULL),
('PL168', '2025-06-01', '665544332', 275, NULL),

('PL169', '2025-07-01', '123456789', 180, NULL),
('PL170', '2025-07-01', '987654321', 200, NULL),
('PL171', '2025-07-01', '112233445', 150, NULL),
('PL172', '2025-07-01', '556677889', 220, NULL),
('PL173', '2025-07-01', '334455667', 170, NULL),
('PL174', '2025-07-01', '998877665', 130, NULL),
('PL175', '2025-07-01', '654321987', 250, NULL),
('PL176', '2025-07-01', '223344556', 180, NULL),
('PL177', '2025-07-01', '887766554', 210, NULL),
('PL178', '2025-07-01', '445566778', 160, NULL),
('PL179', '2025-07-01', '556677889', 240, NULL),
('PL180', '2025-07-01', '998877664', 220, NULL),
('PL181', '2025-07-01', '335577992', 180, NULL),
('PL182', '2025-07-01', '112244335', 190, NULL),
('PL183', '2025-07-01', '775566443', 210, NULL),
('PL184', '2025-07-01', '998877221', 150, NULL),
('PL185', '2025-07-01', '335566778', 280, NULL),
('PL186', '2025-07-01', '887788665', 160, NULL),
('PL187', '2025-07-01', '119922334', 230, NULL),
('PL188', '2025-07-01', '112233998', 200, NULL),
('PL189', '2025-07-01', '665544332', 270, NULL),


('PL190', '2025-08-01', '123456789', 170, NULL),
('PL191', '2025-08-01', '987654321', 180, NULL),
('PL192', '2025-08-01', '112233445', 145, NULL),
('PL193', '2025-08-01', '556677889', 215, NULL),
('PL194', '2025-08-01', '334455667', 160, NULL),
('PL195', '2025-08-01', '998877665', 120, NULL),
('PL196', '2025-08-01', '654321987', 235, NULL),
('PL197', '2025-08-01', '223344556', 175, NULL),
('PL198', '2025-08-01', '887766554', 200, NULL),
('PL199', '2025-08-01', '445566778', 140, NULL),
('PL200', '2025-08-01', '556677889', 230, NULL),
('PL201', '2025-08-01', '998877664', 215, NULL),
('PL202', '2025-08-01', '335577992', 165, NULL),
('PL203', '2025-08-01', '112244335', 180, NULL),
('PL204', '2025-08-01', '775566443', 195, NULL),
('PL205', '2025-08-01', '998877221', 140, NULL),
('PL206', '2025-08-01', '335566778', 260, NULL),
('PL207', '2025-08-01', '887788665', 155, NULL),
('PL208', '2025-08-01', '119922334', 225, NULL),
('PL209', '2025-08-01', '112233998', 210, NULL),
('PL210', '2025-08-01', '665544332', 255, NULL),

('PL211', '2025-09-01', '123456789', 160, NULL),
('PL212', '2025-09-01', '987654321', 190, NULL),
('PL213', '2025-09-01', '112233445', 140, NULL),
('PL214', '2025-09-01', '556677889', 225, NULL),
('PL215', '2025-09-01', '334455667', 165, NULL),
('PL216', '2025-09-01', '998877665', 120, NULL),
('PL217', '2025-09-01', '654321987', 240, NULL),
('PL218', '2025-09-01', '223344556', 170, NULL),
('PL219', '2025-09-01', '887766554', 205, NULL),
('PL220', '2025-09-01', '445566778', 150, NULL),
('PL221', '2025-09-01', '556677889', 235, NULL),
('PL222', '2025-09-01', '998877664', 210, NULL),
('PL223', '2025-09-01', '335577992', 175, NULL),
('PL224', '2025-09-01', '112244335', 185, NULL),
('PL225', '2025-09-01', '775566443', 200, NULL),
('PL226', '2025-09-01', '998877221', 145, NULL),
('PL227', '2025-09-01', '335566778', 270, NULL),
('PL228', '2025-09-01', '887788665', 155, NULL),
('PL229', '2025-09-01', '119922334', 220, NULL),
('PL230', '2025-09-01', '112233998', 195, NULL),
('PL231', '2025-09-01', '665544332', 265, NULL),

('PL232', '2025-10-01', '123456789', 170, NULL),
('PL233', '2025-10-01', '987654321', 190, NULL),
('PL234', '2025-10-01', '112233445', 140, NULL),
('PL235', '2025-10-01', '556677889', 225, NULL),
('PL236', '2025-10-01', '334455667', 160, NULL),
('PL237', '2025-10-01', '998877665', 120, NULL),
('PL238', '2025-10-01', '654321987', 240, NULL),
('PL239', '2025-10-01', '223344556', 175, NULL),
('PL240', '2025-10-01', '887766554', 205, NULL),
('PL241', '2025-10-01', '445566778', 150, NULL),
('PL242', '2025-10-01', '556677889', 235, NULL),
('PL243', '2025-10-01', '998877664', 210, NULL),
('PL244', '2025-10-01', '335577992', 175, NULL),
('PL245', '2025-10-01', '112244335', 185, NULL),
('PL246', '2025-10-01', '775566443', 200, NULL),
('PL247', '2025-10-01', '998877221', 145, NULL),
('PL248', '2025-10-01', '335566778', 265, NULL),
('PL249', '2025-10-01', '887788665', 155, NULL),
('PL250', '2025-10-01', '119922334', 220, NULL),
('PL251', '2025-10-01', '112233998', 195, NULL),
('PL252', '2025-10-01', '665544332', 255, NULL),

('PL253', '2025-11-01', '123456789', 170, NULL),
('PL254', '2025-11-01', '987654321', 190, NULL),
('PL255', '2025-11-01', '112233445', 140, NULL),
('PL256', '2025-11-01', '556677889', 225, NULL),
('PL257', '2025-11-01', '334455667', 160, NULL),
('PL258', '2025-11-01', '998877665', 120, NULL),
('PL259', '2025-11-01', '654321987', 240, NULL),
('PL260', '2025-11-01', '223344556', 175, NULL),
('PL261', '2025-11-01', '887766554', 205, NULL),
('PL262', '2025-11-01', '445566778', 150, NULL),
('PL263', '2025-11-01', '556677889', 235, NULL),
('PL264', '2025-11-01', '998877664', 210, NULL),
('PL265', '2025-11-01', '335577992', 175, NULL),
('PL266', '2025-11-01', '112244335', 185, NULL),
('PL267', '2025-11-01', '775566443', 200, NULL),
('PL268', '2025-11-01', '998877221', 145, NULL),
('PL269', '2025-11-01', '335566778', 265, NULL),
('PL270', '2025-11-01', '887788665', 155, NULL),
('PL271', '2025-11-01', '119922334', 220, NULL),
('PL272', '2025-11-01', '112233998', 195, NULL),
('PL273', '2025-11-01', '665544332', 255, NULL),

('PL274', '2025-12-01', '123456789', 170, NULL),
('PL275', '2025-12-01', '987654321', 190, NULL),
('PL276', '2025-12-01', '112233445', 140, NULL),
('PL277', '2025-12-01', '556677889', 225, NULL),
('PL278', '2025-12-01', '334455667', 160, NULL),
('PL279', '2025-12-01', '998877665', 120, NULL),
('PL280', '2025-12-01', '654321987', 240, NULL),
('PL281', '2025-12-01', '223344556', 175, NULL),
('PL282', '2025-12-01', '887766554', 205, NULL),
('PL283', '2025-12-01', '445566778', 150, NULL),
('PL284', '2025-12-01', '556677889', 235, NULL),
('PL285', '2025-12-01', '998877664', 210, NULL),
('PL286', '2025-12-01', '335577992', 175, NULL),
('PL287', '2025-12-01', '112244335', 185, NULL),
('PL288', '2025-12-01', '775566443', 200, NULL),
('PL289', '2025-12-01', '998877221', 145, NULL),
('PL290', '2025-12-01', '335566778', 265, NULL),
('PL291', '2025-12-01', '887788665', 155, NULL),
('PL292', '2025-12-01', '119922334', 220, NULL),
('PL293', '2025-12-01', '112233998', 195, NULL),
('PL294', '2025-12-01', '665544332', 255, NULL),

('PL295', '2026-01-01', '123456789', 170, NULL),
('PL296', '2026-01-01', '987654321', 190, NULL),
('PL297', '2026-01-01', '112233445', 140, NULL),
('PL298', '2026-01-01', '556677889', 225, NULL),
('PL299', '2026-01-01', '334455667', 160, NULL),
('PL300', '2026-01-01', '998877665', 120, NULL),
('PL301', '2026-01-01', '654321987', 240, NULL),
('PL302', '2026-01-01', '223344556', 175, NULL),
('PL303', '2026-01-01', '887766554', 205, NULL),
('PL304', '2026-01-01', '445566778', 150, NULL),
('PL305', '2026-01-01', '556677889', 235, NULL),
('PL306', '2026-01-01', '998877664', 210, NULL),
('PL307', '2026-01-01', '335577992', 175, NULL),
('PL308', '2026-01-01', '112244335', 185, NULL),
('PL309', '2026-01-01', '775566443', 200, NULL),
('PL310', '2026-01-01', '998877221', 145, NULL),
('PL311', '2026-01-01', '335566778', 265, NULL),
('PL312', '2026-01-01', '887788665', 155, NULL),
('PL313', '2026-01-01', '119922334', 220, NULL),
('PL314', '2026-01-01', '112233998', 195, NULL),
('PL315', '2026-01-01', '665544332', 255, NULL),

('PL316', '2026-02-01', '123456789', 170, NULL),
('PL317', '2026-02-01', '987654321', 190, NULL),
('PL318', '2026-02-01', '112233445', 140, NULL),
('PL319', '2026-02-01', '556677889', 225, NULL),
('PL320', '2026-02-01', '334455667', 160, NULL),
('PL321', '2026-02-01', '998877665', 120, NULL),
('PL322', '2026-02-01', '654321987', 240, NULL),
('PL323', '2026-02-01', '223344556', 175, NULL),
('PL324', '2026-02-01', '887766554', 205, NULL),
('PL325', '2026-02-01', '445566778', 150, NULL),
('PL326', '2026-02-01', '556677889', 235, NULL),
('PL327', '2026-02-01', '998877664', 210, NULL),
('PL328', '2026-02-01', '335577992', 175, NULL),
('PL329', '2026-02-01', '112244335', 185, NULL),
('PL330', '2026-02-01', '775566443', 200, NULL),
('PL331', '2026-02-01', '998877221', 145, NULL),
('PL332', '2026-02-01', '335566778', 265, NULL),
('PL333', '2026-02-01', '887788665', 155, NULL),
('PL334', '2026-02-01', '119922334', 220, NULL),
('PL335', '2026-02-01', '112233998', 195, NULL),
('PL336', '2026-02-01', '665544332', 255, NULL),


('PL337', '2026-03-01', '123456789', 170, NULL),
('PL338', '2026-03-01', '987654321', 190, NULL),
('PL339', '2026-03-01', '112233445', 140, NULL),
('PL340', '2026-03-01', '556677889', 225, NULL),
('PL341', '2026-03-01', '334455667', 160, NULL),
('PL342', '2026-03-01', '998877665', 120, NULL),
('PL343', '2026-03-01', '654321987', 240, NULL),
('PL344', '2026-03-01', '223344556', 175, NULL),
('PL345', '2026-03-01', '887766554', 205, NULL),
('PL346', '2026-03-01', '445566778', 150, NULL),
('PL347', '2026-03-01', '556677889', 235, NULL),
('PL348', '2026-03-01', '998877664', 210, NULL),
('PL349', '2026-03-01', '335577992', 175, NULL),
('PL350', '2026-03-01', '112244335', 185, NULL),
('PL351', '2026-03-01', '775566443', 200, NULL),
('PL352', '2026-03-01', '998877221', 145, NULL),
('PL353', '2026-03-01', '335566778', 265, NULL),
('PL354', '2026-03-01', '887788665', 155, NULL),
('PL355', '2026-03-01', '119922334', 220, NULL),
('PL356', '2026-03-01', '112233998', 195, NULL),
('PL357', '2026-03-01', '665544332', 255, NULL),

('PL358', '2026-04-01', '123456789', 170, NULL),
('PL359', '2026-04-01', '987654321', 190, NULL),
('PL360', '2026-04-01', '112233445', 140, NULL),
('PL361', '2026-04-01', '556677889', 225, NULL),
('PL362', '2026-04-01', '334455667', 160, NULL),
('PL363', '2026-04-01', '998877665', 120, NULL),
('PL364', '2026-04-01', '654321987', 240, NULL),
('PL365', '2026-04-01', '223344556', 175, NULL),
('PL366', '2026-04-01', '887766554', 205, NULL),
('PL367', '2026-04-01', '445566778', 150, NULL),
('PL368', '2026-04-01', '556677889', 235, NULL),
('PL369', '2026-04-01', '998877664', 210, NULL),
('PL370', '2026-04-01', '335577992', 175, NULL),
('PL371', '2026-04-01', '112244335', 185, NULL),
('PL372', '2026-04-01', '775566443', 200, NULL),
('PL373', '2026-04-01', '998877221', 145, NULL),
('PL374', '2026-04-01', '335566778', 265, NULL),
('PL375', '2026-04-01', '887788665', 155, NULL),
('PL376', '2026-04-01', '119922334', 220, NULL),
('PL377', '2026-04-01', '112233998', 195, NULL),
('PL378', '2026-04-01', '665544332', 255, NULL),

('PL379', '2026-05-01', '123456789', 170, NULL),
('PL380', '2026-05-01', '987654321', 190, NULL),
('PL381', '2026-05-01', '112233445', 140, NULL),
('PL382', '2026-05-01', '556677889', 225, NULL),
('PL383', '2026-05-01', '334455667', 160, NULL),
('PL384', '2026-05-01', '998877665', 120, NULL),
('PL385', '2026-05-01', '654321987', 240, NULL),
('PL386', '2026-05-01', '223344556', 175, NULL),
('PL387', '2026-05-01', '887766554', 205, NULL),
('PL388', '2026-05-01', '445566778', 150, NULL),
('PL389', '2026-05-01', '556677889', 235, NULL),
('PL390', '2026-05-01', '998877664', 210, NULL),
('PL391', '2026-05-01', '335577992', 175, NULL),
('PL392', '2026-05-01', '112244335', 185, NULL),
('PL393', '2026-05-01', '775566443', 200, NULL),
('PL394', '2026-05-01', '998877221', 145, NULL),
('PL395', '2026-05-01', '335566778', 265, NULL),
('PL396', '2026-05-01', '887788665', 155, NULL),
('PL397', '2026-05-01', '119922334', 220, NULL),
('PL398', '2026-05-01', '112233998', 195, NULL),
('PL399', '2026-05-01', '665544332', 255, NULL);





CREATE TABLE Familia (
	CodigoFamilia VARCHAR(15) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	activo varchar(20) not null,
	Descripcion VARCHAR(200) not null,
	PRIMARY KEY(CodigoFamilia)
);

INSERT INTO Familia(CodigoFamilia,Nombre,activo,Descripcion) values
('Fam1', 'Escolares', 'Si','Artículos como lapices o borradores'),
('Fam2', 'Farmacéuticos', 'Si','Medicamentos y productos de salud '),
('Fam3', 'Electrónica','Si', 'Componentes electrónicos como chips o tecnología implementada'),
('Fam4', 'Calzado','Si', 'Todo tipo de zapatos'),
('Fam5', 'Relojes y Joyas', 'No','Artículos que son solo de lujo'),
('Fam6', 'Juguetes', 'Si','Artículos para entretenimiento infantil'),
('Fam7', 'Alimentos', 'Si','Productos alimenticios enlatados, frescos, congelados'),
('Fam8', 'Bebidas', 'Si','Líquidos para consumo como refrescos, jugos, bebidas alcohólicas y agua embotellada'),
('Fam9', 'Cosméticos', 'No','Productos de cuidado personal'),
('Fam10', 'Electrodomésticos','Si', 'Aparatos eléctricos para uso doméstico'),
('Fam11', 'Limpieza', 'No','Productos hechos para limipiar'),
('Fam12', 'Herramientas', 'Si','Herramientas manuales y eléctricas'),
('Fam13', 'Jardinería', 'No','Herramientas y productos para el cuidado de jardines'),
('Fam14', 'Automotriz', 'Si','Accesorios y repuestos para vehículos'),
('Fam15', 'Construcción', 'Si','Materiales para la construcción '),
('Fam16', 'Deportes', 'No',' s deportivos hechos solo para deporte'),
('Fam17', 'Mascotas', 'Si','Productos para el cuidado de mascotas'),
('Fam18', 'Ropa', 'Si','Prendas de vestir'),
('Fam19', 'Muebles', 'Si','Artículos de mobiliario'),
('Fam20', 'Libros', 'No','Todo tipo de literatura'),
('Fam21', 'Tecnología', 'Si','Dispositivos electrónicos'),
('Fam22', 'Iluminación', 'No','Articulos hechos para iluminar la casa u oficinas'),
('Fam23', 'Material de Oficina', 'No','Artículos necesarios para el trabajo'),
('Fam24', 'Bebés', 'No','Productos para el cuidado de bebés'),
('Fam25', 'Accesorios de hogar', 'Si','Productos hechos para usar en el hogar');

CREATE TABLE Articulo (
	CodigoFamilia VARCHAR(15)  NOT NULL,
	Codigo VARCHAR(15) NOT NULL,
	Nombre VARCHAR(40) NOT NULL,
	Activo Varchar(20) not null,
	Peso FLOAT NOT NULL,
	Costo decimal not null,
	PrecioEstandar decimal not null,
	Descripcion VARCHAR(200) not null,
	PRIMARY KEY (Codigo),
	FOREIGN KEY (CodigoFamilia) references Familia(CodigoFamilia)
);




INSERT INTO Articulo (CodigoFamilia, Codigo, Nombre,Activo, Peso, Costo,PrecioEstandar,Descripcion) VALUES
('Fam1', 'ART1', 'Lápiz HB', 'Si', 0.02, 0.5, 100.0, 'Lápiz de grafito para escritura.'),
('Fam1', 'ART2', 'Cuaderno 100 hojas', 'No', 0.3, 1.5, 3000.0, 'Cuaderno de con 100 hojas rayadas.'),
('Fam1', 'ART3', 'Borrador blanco', 'Si', 0.01, 0.2, 100.4, 'Borrador de leche para lápiz.'),
('Fam1', 'ART4', 'Regla 30 cm', 'Si', 0.05, 0.7, 100.5, 'Regla plástica para medir.'),
('Fam1', 'ART5', 'Sacapuntas doble', 'No', 0.02, 0.3, 350.0, 'Sacapuntas para lápices grandes y pequeños.'),
  
('Fam2', 'ART6', 'Ibuprofeno 200mg', 'Si', 0.01, 0.8, 2000.0, 'Tabletas para alivio del dolor.'),
('Fam2', 'ART7', 'Jarabe para la tos', 'No', 0.25, 3.0, 5000.0, 'Medicamento para calmar la tos.'),
('Fam2', 'ART8', 'Espadrapo', 'Si', 0.55, 1.0, 2000.5, 'espadrapo para soporte y compresión.'),
('Fam2', 'ART9', 'Anticonceptivos', 'Si', 0.1, 4.0, 10000.0, 'Prevenir embarazos.'),
('Fam2', 'ART10', 'Curitas adhesivas', 'No', 0.02, 0.4, 100.0, 'Tiras adhesivas para pequeñas heridas.'),
  
('Fam3', 'ART11', 'GPU', 'No', 0.01, 200.0, 250000.0, 'Grafica para juegos.'),
('Fam3', 'ART12', 'Placa madre', 'Si', 3.5, 100.0, 120000.0, 'La que hace que una computadora funcione.'),
('Fam3', 'ART13', 'Pantalla LED', 'Si', 1.2, 80.0, 100000.0, 'Pantalla LED para dispositivos electrónicos.'),
('Fam3', 'ART14', 'Cable HDMI', 'No', 0.15, 5.0, 1000.0, 'Cable para conectar dispositivos a pantallas.'),
('Fam3', 'ART15', 'Teclado inalámbrico', 'No', 0.6, 20.0, 25000.0, 'Teclado sin cables para computadora.'),
  
('Fam4', 'ART16', 'tenis nike', 'Si', 0.8, 50.0, 75000.0, 'tenis para hacer deporte.'),
('Fam4', 'ART17', 'Botas de cuero', 'No', 1.2, 80.0, 100000.0, 'Botas resistentes de cuero.'),
('Fam4', 'ART18', 'Sandalias', 'No', 0.3, 25.0, 4000.0, 'Sandalias casuales.'),
('Fam4', 'ART19', 'Burros', 'Si', 6.7, 200.0, 25000.0, 'Para trabajar de verdad.'),
('Fam4', 'ART20', 'Zapatos formales', 'Si', 0.9, 70.0, 9000.0, 'Zapatos elegantes para eventos formales.'),
  
('Fam5', 'ART21', 'Reloj suizo', 'No', 0.15, 300.0, 3500000.0, 'Reloj analógico de lujo.'),
('Fam5', 'ART22', 'Collar de oro', 'Si', 0.02, 200.0, 250000.0, 'Collar hecho de oro de 18 quilates.'),
('Fam5', 'ART23', 'Anillo de diamantes', 'Si', 0.01, 500.0, 600000.0, 'Anillo con incrustaciones de diamantes.'),
('Fam5', 'ART24', 'Pulsera de Zafiro', 'No', 0.05, 150.0, 180000.0, 'Pulsera de Zafiro.'),
('Fam5', 'ART25', 'Aretes de perlas', 'Si', 0.01, 80.0, 100000.0, 'Aretes con perlas naturales.'),
  
('Fam6', 'ART26', 'Muñeca de Barbie', 'No', 0.2, 20.0, 25000.0, 'Muñeca transformable para jugar.'),
('Fam6', 'ART27', 'Terreneitor', 'Si', 0.1, 15.0, 200000.0, 'Carro para loquear.'),
('Fam6', 'ART28', 'Legos', 'Si', 0.3, 30.0, 35000.0, 'Muñequitos armables.'),
('Fam6', 'ART29', 'Pelota de futbol', 'No', 0.1, 10.0, 150000.0, 'Pelota de cuero.'),
('Fam6', 'ART30', 'Monopoly', 'Si', 0.7, 50.0, 60000.0, 'Juego de mesa familiar.'),
  
('Fam7', 'ART31', 'Bistek', 'Si', 0.25, 10.0, 1500.0, 'pedazo de carne.'),
('Fam7', 'ART32', 'Arroz 99', 'No', 1.0, 2.0, 3000.0, 'Bolsa de arroz al 99 porciento.'),
('Fam7', 'ART33', 'Johnys', 'Si', 0.5, 1.5, 2000.5, 'Polvo de cacao para bebidas.'),
('Fam7', 'ART34', 'Frootlops', 'No', 0.6, 3.0, 4000.0, 'Cereal para el desayuno.'),
('Fam7', 'ART35', 'Pollo congelado', 'Si', 1.5, 8.0, 1200.0, 'Pollo entero congelado.'),
  
('Fam8', 'ART36', 'Alpina 1L', 'No', 1.0, 1.0, 2.0, 'Botella de agua potable.'),
('Fam8', 'ART37', 'Refresco coca cola 500ml', 'Si', 0.5, 1.0, 1.5, 'Botella de coca cola fria.'),
('Fam8', 'ART38', 'Del valle 1L', 'Si', 1.1, 1.5, 2.0, 'Jugo de naranja natural.'),
('Fam8', 'ART39', 'Imperial 355ml', 'Si', 0.4, 1.0, 1.5, 'Lata de cerveza.'),
('Fam8', 'ART40', 'Villa maria', 'No', 1.2, 15.0, 20.0, 'Botella de vino tinto importado.'),
  
('Fam9', 'ART41', 'Shampoo 500ml', 'Si', 0.6, 2.0, 3000.0, 'Botella de shampoo para el cabello.'),
('Fam9', 'ART42', 'Crema hidratante 200ml', 'Si', 0.3, 1.5, 2000.5, 'Crema para hidratar la piel.'),
('Fam9', 'ART43', 'Perfume de vainilla', 'Si', 0.2, 10.0, 15000.0, 'Perfume con fragancia de vainilla.'),
('Fam9', 'ART44', 'Desodorante en barra', 'No', 0.1, 0.5, 1000.0, 'Desodorante duro para el cuidado personal.'),
('Fam9', 'ART45', 'Lápiz labial', 'Si', 0.05, 5.0, 7000.0, 'Lápiz labial de larga duración.'),



('Fam10', 'ART46', 'Microondas','No', 1.3, 7.0, 5000.00,  'Horno de microondas para calentar alimentos.'),
('Fam10', 'ART47', 'Batidora' ,'Si',  1.2, 2.5, 13000.00, 'Batidora de mano para cocina.'),
('Fam10', 'ART48', 'Aspiradora' ,'No', 1.5, 4.0, 25000.00, 'Aspiradora para limpieza del hogar.'),
('Fam10', 'ART49', 'Tostadora' ,'Si', 1.4, 1.8, 10000.00, 'Tostadora eléctrica para pan.'),
('Fam10', 'ART50', 'Cafetera' ,'Si',2.3, 2.0, 4000.00,  'Cafetera eléctrica para preparar café.'),
  
('Fam11', 'ART51', 'Limpiador multiusos' ,'Si', 0.5, 0.75, 1200.00, 'Limpiador para todo tipo de superficies.'),
('Fam11', 'ART52', 'Detergente líquido' ,'Si', 0.7, 1.0, 700.00, 'Detergente para lavar ropa.'),
('Fam11', 'ART53', 'Esponjas de limpieza' ,'No', 0.1, 0.05, 300.00, 'Esponjas para lavar platos y superficies.'),
  
('Fam12', 'ART54', 'Martillo' ,'Si', 7.2, 1.0, 5000.00, 'Martillo de acero y mango de madera para clavar.'),
('Fam12', 'ART55', 'Destornillador','Si', 2.2, 0.2, 2500.00, 'Destornillador plano y de cruz.'),
  
('Fam13', 'ART56', 'Tijeras de podar' ,'No', 4.4, 0.4, 7500.00, 'Tijeras para podar plantas.'),
('Fam13', 'ART57', 'Guantes de jardinería' ,'Si', 1.2, 0.2, 2000.00, 'Guantes para trabajar en el jardín.'),
  
('Fam14', 'ART58', 'Batería de carros' ,'No', 14.2, 20.0, 70000.00, 'Batería para carros.'),
('Fam14', 'ART59', 'Aceite de motor' ,'Si', 1.5, 1.0, 20000.00, 'Aceite lubricante para motores.'),
  
('Fam15', 'ART60', 'Cemento' ,'Si', 20.3, 25.0, 15000.00, 'Saco de cemento para construcción.'),
('Fam15', 'ART61', 'Ladrillos' ,'No', 15.0, 3.0, 1000.00, 'Ladrillos para construir muros.'),
  
('Fam16', 'ART62', 'Balón de fútbol' ,'No', 3.2, 0.5, 3500.00, 'Balón de fútbol de tamaño oficial.'),
('Fam16', 'ART63', 'Raqueta de tenis' ,'Si', 2.0, 0.3, 12500.00, 'Raqueta ligera para jugar al tenis.'),
  
('Fam17', 'ART64', 'Comida para perros','No', 1.3, 1.5, 1500.00, 'Alimento seco para perros.'),
('Fam17', 'ART65', 'Arena para gatos' ,'Si', 1.5, 1.0, 1500.00, 'Arena absorbente para gatos.'),
  
('Fam18', 'ART66', 'Camisa de algodón' ,'No', 1.4, 0.2, 10000.00, 'Camisa cómoda para uso diario.'),
('Fam18', 'ART67', 'Pantalones jeans' ,'Si', 1.3, 0.5, 13000.00, 'Pantalones de mezclilla.'),
  
('Fam19', 'ART68', 'Escritorio' ,'Si', 10.3, 10.5, 55000.00, 'Escritorio grande para trabajo.'),
('Fam19', 'ART69', 'Ropero' ,'No', 30.2, 30.0, 150000.00, 'Ropero gigante para 1 persona.'),
  
('Fam20', 'ART70', 'Novela' ,'No', 1.0, 1.5, 7000.00, 'Libro hecho para generar drama.'),
('Fam20', 'ART71', 'Comic' ,'Si', 1.0, 1.5, 3500.00, 'Libro de acción.'),
  
('Fam21', 'ART72', 'Celular' ,'No', 1.0, 5.5, 130000.00, 'Dispositivo para comunicarse y entretenerse.'),
('Fam21', 'ART73', 'Laptop' ,'Si', 5.0, 10.5, 200000.00,'Dispositivo para trabajar y portar a todo lado.'),
  
('Fam22', 'ART74', 'Lampara de pared','No', 1.3, 3.5, 4000.00, 'Lampara para iluminar un cuarto.'),
('Fam22', 'ART75', 'Lampara de techo' ,'Si', 1.5, 5.5, 5000.00, 'Lampara led para iluminar un lugar.'),
  
('Fam23', 'ART76', 'Grapadora' ,'Si', 0.8, 4.5, 1200.00, 'Para grapar hojas o documentos.'),
('Fam23', 'ART77', 'Impresora' ,'No', 7.3, 15.5, 20000.00, 'Impresora para imprimir hojas o documentos.'),
  
('Fam24', 'ART78', 'Pañalito' ,'No', 1.8, 5.5, 3500.00, 'Por si el bebe está quemado.'),
('Fam24', 'ART79', 'Colonia' ,'Si', 1.9, 7.5, 2000.00, 'Para que huela bien.'),
  
('Fam25', 'ART80', 'Cuchillos' ,'No', 3.2, 6.5, 5000.00, 'Para cortar alimentos.'),
('Fam25', 'ART81', 'Cuadros decorativos' ,'Si', 2.3, 9.5, 6000.00, 'Para que se vea bonita la casa.');

CREATE TABLE Bodega (
	Codigo VARCHAR(15) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Ubicacion VARCHAR(20) NOT NULL,
	EspacioCubico int NOT NULL,
	CapacidadTon int NOT NULL,
	PRIMARY KEY (Codigo)
);
INSERT INTO Bodega(Codigo, Nombre,Ubicacion,EspacioCubico,CapacidadTon) values
('BO1','Castle Rock','Limon', 50,3 ),
('BO2','Del valle','Puntarenas', 40,2 ),
('BO3','El sol','Guanacaste', 30,5 ),
('BO4','La cava','Alajuela', 20,4 ),
('BO5','Montes','San jose', 30,3 ),
('BO6','Elites','Cartago', 40,2 ),
('BO7','Forca','Heredia', 50,3 ),
('BO8','Naciente','Limon', 20,4 ),
('BO9','Tovar','Guanacaste', 10,3 ),
('BO10','Escondida','San jose', 35,2 ),
('BO11','Shaft','Limon', 40, 1);
 




CREATE TABLE FamiliaBodega (
	CodigoBodega VARCHAR(15) NOT NULL,
	CodigoFamilia VARCHAR(15) NOT NULL,
	PRIMARY KEY (CodigoBodega,CodigoFamilia),
	FOREIGN KEY (CodigoBodega) references Bodega(Codigo),
	FOREIGN KEY (CodigoFamilia) references Familia(CodigoFamilia)
);


insert into FamiliaBodega(CodigoBodega,CodigoFamilia) values
('BO1','Fam1'),
('BO1','Fam5'),
('BO2','Fam2'),
('BO2','Fam9'),
('BO3','Fam3'),
('BO3','Fam4'),
('BO4','Fam6'),
('BO4','Fam7'),
('BO5','Fam8'),
('BO5','Fam9'),
('BO6','Fam10'),
('BO6','Fam11'),
('BO7','Fam14'),
('BO7','Fam15'),
('BO8','Fam12'),
('BO8','Fam13'),
('BO9','Fam19'),
('BO9','Fam20'),
('BO10','Fam21'),
('BO10','Fam23'),
('BO11','Fam25'),
('BO11','Fam17');





CREATE TABLE Cliente (
    Cedula VARCHAR(9) NOT NULL,
    Telefono VARCHAR(8) NOT NULL,
    Genero char(1) NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    CorreoElectronico VARCHAR(50) NOT NULL,
    Fax VARCHAR(20) not null,
    Sector varchar(20) not null,
    Zona varchar(20) not null,
	Celular VARCHAR(8) NOT NULL,
	PRIMARY KEY (Cedula)
);



INSERT INTO Cliente (Cedula, Telefono, Genero, Nombre, CorreoElectronico, Fax, Sector, Zona, Celular) VALUES
('123456789', '22223334', 'M', 'Juan Pérez', 'juaperezZeledon@mail.com', '22224444', 'Económico', 'Zona norte', '80839796'),
('325543227', '33334444', 'F', 'María López', 'marilopez@mail.com', '33335555', 'Tecnológico', 'Pacifico central', '70755432'),
('456789123', '44445555', 'M', 'Carlos Rodríguez', 'carlosrodriguezzzzz@mail.com', '44446666', 'Industrial', 'Caribe sur', '60876543'),
('321654987', '55556666', 'F', 'Ana Martínez', 'anadel@mail.com', '55557777', 'Salud', 'Caribe norte', '56647890'),
('754323489', '66667777', 'M', 'Luis Fernández', 'luisferna3421@mail.com', '66668888', 'Constructor', 'Valle central', '98763453'),
('432124368', '77778888', 'F', 'Laura Gómez', 'lauragoz@mail.com', '77779999', 'Comercial', 'Pacifico sur', '75623754'),
('153234558', '88889999', 'M', 'Pedro Jiménez', 'pedronez@mail.com', '88880000', 'Alimentación', 'Pacifico norte', '87357423'),
('533467853', '99990000', 'F', 'Carmen Díaz', 'carmenz@mail.com', '99991111', 'Educación', 'Zona norte', '93945412'),
('258932147', '11112222', 'M', 'Javier Morales', 'moralesjavier@mail.com', '11113333', 'Deportivo', 'Caribe sur', '45678976'),
('369253247', '22223334', 'F', 'Isabel Torres', 'isabel20torres@mail.com', '22224444', 'Cultural', 'Valle central', '23456843'),
('235754438', '54345765', 'M', 'Eladio Carrión', 'EladioC@mail.com', '22224444', 'Económico', 'Zona norte', '80839796'),
('754332564', '34535321', 'M', 'Mark Cuban', 'MarkCuban1@mail.com', '22223333', 'Energía', 'Pacifico central', '70755432'),
('432123478', '54357565', 'M', 'MYke Towers', 'TowersMyk35@mail.com', '44445544', 'Constructor', 'Caribe sur', '60876543'),
('564298645', '32476542', 'M', 'Rodrigo Chaves', 'Chavezzzz@mail.com', '55556643', 'Salud', 'Caribe norte', '56647890'),
('354215796', '86643354', 'F', 'Carolina Giraldo', 'GiradlCaro@mail.com', '66665432', 'Económico', 'Valle central', '98763453'),
('642342123', '97314784', 'F', 'Shakira Isabel', 'WakaWaka@mail.com', '77775436', 'Económico', 'Pacifico sur', '75623754'),
('653212356', '23462123', 'F', 'Katy Perry', 'Fireworks@mail.com', '88886543', 'Alimentación', 'Pacifico norte', '87357423'),
('257543123', '69504832', 'F', 'Taylor Swift', 'SwiftTayTay@mail.com', '99991012', 'Tecnológico', 'Zona norte', '93945412'),
('321234678', '43211257', 'F', 'Sofia Vergara', 'VerSofi@mail.com', '11112345', 'Deportivo', 'Caribe sur', '45678976');


CREATE TABLE ListaArticulos (
    CodigoBodega VARCHAR(15) NOT NULL,
    CodigoProducto VARCHAR(15) NOT NULL,
    CantidadProducto INT NOT NULL,
    PRIMARY KEY (CodigoBodega,CodigoProducto),
    FOREIGN KEY (CodigoBodega) REFERENCES Bodega(Codigo),
    FOREIGN KEY (CodigoProducto) REFERENCES Articulo(Codigo)
);


create table TipoTareaCotizacion (
	TipoTarea varchar(30),
	descripcion varchar(200)
	Primary key (TipoTarea)
)

insert into TipoTareaCotizacion(TipoTarea,descripcion) values
('Seguimiento','El empleado debe estar en constante vigilancia de la cotización para ver el progreso que esta tiene'),
('Archivacion','Guardar toda la información con respecto a una cotización en un documento especifico'),
('Orden','Generar una orden con la lista de productos de la cotizacion para revisar si estan disponibles'),
('Envio','Asegurarse de que el envio de los productos en caso de que se quieran se puedan enviar'),
('Documentación','Generar todo el listado de los productos y cantidad que se va a requerir en un documento formal'),
('Control de calidad','Revisar que todos los productos que se quieran en la cotizacion esten en buen estado'),
('Revisión de precios','Revisar que todos los precios que fueron dados en la cotización sean los correctos'),
('Negociación','Hablar con el cliente y persuadirlo para que realice la compra en el momento');




create table TipoTareaCaso (
	TipoTarea varchar(30) not null,
	descripcion varchar(200)not null,
	Primary key (TipoTarea)
)

insert into TipoTareaCaso(TipoTarea,descripcion) values
('Devolucion','Revisar el por qué es que se debe devolver el producto'),
('Reclamo','Atender al cliente y verificar la situación para aliviar el problema'),
('Garantia','Revisar la garantía del producto e informale al cliente si es posible');



create table TipoTareaEstado (
	tipoEstado varchar(30) not null,
	descripcion varchar(200)not null,
	Primary key (tipoEstado)
)


insert into TipoTareaEstado(tipoEstado,descripcion) values
('Iniciada','Es una tarea que recien se empieza'),
('En proceso', 'Es una tarea que sigue en marcha'),
('Terminada', 'Es una tarea que ya termuno');

 

CREATE TABLE Tarea (
    CodigoTarea VARCHAR(15) NOT NULL,
	tipoTareaCotizacion varchar(30) null,
	tipoTareaCaso varchar(30) null,
    Fecha DATE NOT NULL,
    Descripcion VARCHAR(200) NOT NULL,
    Estado VARCHAR(30) NOT NULL,
	PRIMARY KEY (CodigoTarea),
	FOREIGN KEY (Estado) REFERENCES TipoTareaEstado(tipoEstado),
	FOREIGN KEY (tipoTareaCotizacion) References TipoTareaCotizacion(TipoTarea),
	FOREIGN KEY (tipoTareaCaso) References TipoTareaCaso(TipoTarea)
);
INSERT INTO Tarea (CodigoTarea, tipoTareaCotizacion, tipoTareaCaso, Fecha, Descripcion, Estado) 
VALUES
('T1', 'Orden', NULL, '2023/03/15', 'Revisar el inventario y hacer orden de productos', 'En proceso'), --1
('T2', NULL, 'Reclamo', '2025/05/20', 'Resolver el reclamo de equipo defectuoso', 'Iniciada'), --2
('T3', 'Envio', NULL, '2023/02/12', 'Confirmar el envío del producto al cliente', 'Terminada'), 
('T4', NULL, 'Garantia', '2023/11/08', 'Verificar la validez de la garantía', 'Iniciada'), -- 3
('T5', 'Documentación', NULL, '2023/01/05', 'Preparar documentación para la cotización', 'En proceso'), --4
('T6', NULL, 'Devolucion', '2023/09/30', 'Verificar si se autoriza la devolución', 'Iniciada'), --5 
('T7', 'Control de calidad', NULL, '2022/12/25', 'Revisar calidad de productos en la cotización', 'En proceso'), --6
('T8', NULL, 'Reclamo', '2021/04/18', 'Atender el reclamo de cliente', 'Iniciada'), --7
('T9', 'Seguimiento', NULL, '2021/05/07', 'Dar seguimiento a la cotización', 'En proceso'), --8
('T10', NULL, 'Garantia', '2022/08/10', 'Verificar cobertura de garantía del producto', 'Terminada'),
('T11', 'Archivacion', NULL, '2023/07/04', 'Archivar documentación de la cotización', 'Iniciada'), --9
('T12', NULL, 'Devolucion', '2022/06/13', 'Autorizar devolución del artículo', 'En proceso'), --10
('T13', 'Revisión de precios', NULL, '2021/03/20', 'Asegurarse de que los precios sean correctos', 'En proceso'), --11
('T14', NULL, 'Reclamo', '2020/12/22', 'Resolver el reclamo de sobreprecio', 'Terminada'),
('T15', 'Negociación', NULL, '2020/08/12', 'Negociar términos de compra con el cliente', 'Iniciada'), --12
('T16', NULL, 'Garantia', '2021/10/05', 'Revisar si el producto aplica para garantía', 'Terminada'),
('T17', 'Orden', NULL, '2020/09/05', 'Generar orden para productos solicitados', 'En proceso'), --13
('T18', NULL, 'Devolucion', '2025/07/28', 'Validar devolución del producto por cliente', 'Iniciada'), --14
('T19', 'Documentación', NULL, '2025/05/13', 'Formalizar lista de productos en documento', 'En proceso'), --15
('T20', NULL, 'Reclamo', '2026/03/17', 'Atender queja por producto incompleto', 'Terminada'),
('T21', NULL, 'Garantia', '2021/11/14', 'Asegurarse de cobertura en garantía', 'Terminada'),
('T22', 'Control de calidad', NULL, '2020/09/02', 'Revisar calidad de productos antes de entrega', 'Terminada'),
('T23', NULL, 'Reclamo', '2019/07/21', 'Revisión del reclamo de cliente por daño', 'Iniciada'),--16
('T24', 'Seguimiento', NULL, '2019/03/25', 'Monitorear avance en cotización', 'Terminada'),
('T25', NULL, 'Devolucion', '2023/07/10', 'Validar el motivo de la devolución', 'Terminada'),
('T26', 'Negociación', NULL, '2020/04/14', 'Negociar condiciones de venta con el cliente', 'Iniciada'),--17
('T27', NULL, 'Garantia', '2023/09/22', 'Evaluar si se acepta la garantía', 'Terminada'),
('T28', 'Revisión de precios', NULL, '2021/01/11', 'Revisar y ajustar precios en cotización', 'Iniciada'), --18
('T29', NULL, 'Reclamo', '2021/06/02', 'Atender reclamo de cliente por entrega tardía', 'Terminada'), 
('T30', 'Archivacion', NULL, '2020/04/29', 'Guardar documentos de la cotización', 'Iniciada'),  --19 
('T31', 'Envio', NULL, '2023/08/20', 'Confirmar envío de productos solicitados', 'Terminada'),
('T32', NULL, 'Devolucion', '2024/02/12', 'Recoger producto defectuoso para devolución', 'Terminada'),
('T33', 'Orden', NULL, '2024/06/17', 'Generar orden de productos para la cotización', 'Terminada'),
('T34', NULL, 'Garantia', '2023/11/03', 'Verificar cobertura de garantía del equipo', 'Terminada'),
('T35', 'Documentación', NULL, '2024/03/10', 'Completar documentación de la cotización', 'Terminada'),
('T36', NULL, 'Reclamo', '2024/07/25', 'Atender reclamo por productos faltantes', 'Terminada'),
('T37', 'Seguimiento', NULL, '2023/09/14', 'Monitorear proceso de cotización', 'Terminada'),
('T38', NULL, 'Garantia', '2024/05/28', 'Confirmar términos de garantía con el cliente', 'Terminada'),
('T39', 'Control de calidad', NULL, '2023/10/04', 'Inspección de productos antes del envío', 'Terminada'),
('T40', NULL, 'Devolucion', '2024/01/18', 'Registrar detalles de la devolución solicitada', 'Terminada'), 
('T41', 'Negociación', NULL, '2024/04/05', 'Finalizar negociación con cliente', 'Terminada'),
('T42', 'Revisión de precios', NULL, '2023/12/07', 'Ajustar precios para cotización aprobada', 'Terminada'),
('T43', 'Control de calidad', NULL, '2024/08/21', 'Revisar condiciones del producto antes de entrega', 'En proceso'); --20






CREATE TABLE TipoCotizacion(
	Tipocotizacion varchar(50),
	Descripcion varchar(200),
	PRIMARY KEY (Tipocotizacion)
);

INSERT INTO TipoCotizacion(Tipocotizacion,Descripcion) values
('Cotizacion abierta','Es una cotizacion la cual su precio puede variar'),
('Cotizacion cerrada','Es una cotizacion fija en la cual se busca que se mantenga un precio'),
('Cotizacion preliminar','Es una cotizacion en la cual solo se busca saber el precio'),
('Cotizacion de servicios','Consta en que se va a generar por los servicios que le fueron prestados'),
('Cotizacion de articulos','Es una cotización por toda la cantidad de articulos que se van a pedir');





CREATE TABLE Cotizacion (
	Codigo int identity(1,1) NOT NULL,
	CedulaCliente VARCHAR(9)  NOT NULL, 
	CedulaEmpleado VARCHAR(9)  NOT NULL, 
	FechaCotizacion DATE NOT NULL,
	MesProyectadoCierre DATE NOT NULL,
	TipoCotizacion VARCHAR(50) NOT NULL,
	Estado VARCHAR(20) NOT NULL,
	Probabilidad FLOAT not null,
	Zona VARCHAR(20) not null,
	Sector VARCHAR(20) not null,
	PRIMARY KEY(Codigo), 
	FOREIGN KEY (CedulaCliente) REFERENCES Cliente(Cedula),
	FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(Cedula),
    FOREIGN KEY (TipoCotizacion) REFERENCES TipoCotizacion(Tipocotizacion),
	FOREIGN KEY (Probabilidad) REFERENCES Probabilidad(Porcentaje),
	FOREIGN KEY (Estado) REFERENCES  Estado(TipoEstado),
	FOREIGN KEY (Zona) REFERENCES Zona(Nombre),
    FOREIGN KEY (Sector) REFERENCES Sector(Nombre)
);




insert into Cotizacion(CedulaCliente,CedulaEmpleado,FechaCotizacion,MesProyectadoCierre,TipoCotizacion,Estado,Probabilidad,Zona,Sector) values
('432124368','123456789','2020/10/15','2020/12/15','Cotizacion abierta','Abierta' ,0.25, 'Caribe norte','Alimentación'), --
('325543227','123456789','2024/11/05','2024/12/31','Cotizacion abierta','Abierta' ,0.50, 'Pacifico norte','Económico'),--
('456789123','123456789','2024/10/01','2025/10/12','Cotizacion abierta','Abierta' ,0.75, 'Zona norte','Energía'),--
('321654987','123456789','2024/09/10','2026/05/05','Cotizacion abierta','Abierta' ,0.75, 'Valle central','Educación'), --
('754323489','123456789','2024/08/24','2025/06/12','Cotizacion abierta','Abierta' ,0.25, 'Caribe sur','Transporte'), --
('564298645','123456789','2022/05/04','2025/12/13','Cotizacion abierta','Abierta' ,0.75, 'Pacifico sur','Educación'), --
('258932147','123456789','2023/01/09','2026/07/11','Cotizacion abierta','Abierta' ,0.50, 'Caribe norte','Telecomunicaciones'),--
('153234558','123456789','2023/10/19','2026/04/03','Cotizacion abierta','Abierta' ,0.25, 'Zona norte','Alimentación'),--


('153234558','987654321','2024/07/06','2025/04/20','Cotizacion cerrada','Aprobado' ,0.50, 'Caribe sur','Comercial'),--
('533467853','987654321','2024/06/14','2027/03/25','Cotizacion abierta','Abierta' ,0.50, 'Pacifico norte','Cultural'),--
('258932147','987654321','2024/05/17','2025/02/12','Cotizacion abierta','Abierta' ,0.75, 'Pacifico central','Deportivo'),--
('369253247','987654321','2024/04/20','2026/01/02','Cotizacion abierta','Abierta' ,0.25, 'Caribe norte','Alimentación'),--
('235754438','987654321','2024/03/22','2028/08/16','Cotizacion abierta','Abierta' ,0.25, 'Pacifico sur','Salud'),--
('321234678','987654321','2023/07/28','2028/05/11','Cotizacion abierta','Abierta' ,0.25, 'Valle central','Deportivo'),--
('564298645','987654321','2023/04/18','2027/01/12','Cotizacion abierta','Abierta' ,0.25, 'Pacifico norte','Industrial'),--
('354215796','987654321','2022/12/09','2026/10/22','Cotizacion abierta','Abierta' ,0.25, 'Pacifico sur','Automotriz'),--
('123456789','987654321','2022/11/27','2026/10/22','Cotizacion abierta','Abierta' ,0.25, 'Caribe sur','Cultural'),--


('432124368','112233445','2024/02/24','2024/12/24','Cotizacion de articulos','Rechazado' ,0.75, 'Pacifico central','Económico'),--
('754323489','112233445','2024/01/15','2027/05/24','Cotizacion abierta','Abierta' ,0.50, 'Valle central','Tecnológico'),--
('432123478','112233445','2024/12/07','2025/04/13','Cotizacion abierta','Abierta' ,0.75, 'Zona norte','Telecomunicaciones'),---
('564298645','112233445','2024/11/21','2026/03/12','Cotizacion abierta','Abierta' ,0.25, 'Caribe norte','Automotriz'),--
('354215796','112233445','2024/10/03','2028/02/06','Cotizacion abierta','Abierta' ,0.25, 'Caribe sur','Constructor'),--
('533467853','112233445','2022/09/03','2029/01/16','Cotizacion abierta','Abierta' ,0.25, 'Caribe norte','Salud'),--
('257543123','112233445','2022/08/03','2029/10/08','Cotizacion abierta','Abierta' ,0.25, 'Valle central','Energía'),--
('642342123','112233445','2022/07/03','2029/12/02','Cotizacion abierta','Abierta' ,0.25, 'Zona norte','Comercial'),--
('153234558','112233445','2022/06/03','2029/09/17','Cotizacion abierta','Abierta' ,0.25, 'Pacifico sur','Cultural'),--



('642342123','556677889','2024/09/13','2025/09/03','Cotizacion de servicios', 'Aprobado',0.50, 'Pacifico norte','Constructor'),--
('653212356','556677889','2024/08/25','2027/03/24','Cotizacion abierta','Abierta' ,0.50, 'Valle central','Tecnológico'),--
('257543123','556677889','2024/07/17','2025/05/17','Cotizacion abierta','Abierta' ,0.75, 'Zona norte','Telecomunicaciones'),--
('321234678','556677889','2024/06/14','2026/03/15','Cotizacion abierta','Abierta' ,0.25, 'Caribe norte','Automotriz'),--
('354215796','556677889','2024/05/21','2028/02/12','Cotizacion abierta','Abierta' ,0.25, 'Caribe sur','Constructor'),--
('258932147','556677889','2022/04/18','2028/04/04','Cotizacion abierta','Abierta' ,0.25, 'Caribe norte','Económico'),--
('533467853','556677889','2022/03/16','2028/07/06','Cotizacion abierta','Abierta' ,0.25, 'Pacifico central','Tecnológico'),--
('153234558','556677889','2022/02/27','2028/09/05','Cotizacion abierta','Abierta' ,0.25, 'Valle central','Salud'),--
('754332564','556677889','2022/01/09','2028/12/02','Cotizacion abierta','Abierta' ,0.25, 'Zona norte','Industrial'),--
('123456789','556677889','2022/12/01','2028/01/01','Cotizacion abierta','Abierta' ,0.25, 'Pacifico sur','Deportivo'),-- aq



('533467853','334455667','2023/02/02','2026/04/12','Cotizacion preliminar','Abierta' ,0.25, 'Zona norte','Económico'),--
('235754438','334455667','2023/08/25','2025/10/27','Cotizacion abierta','Abierta' ,0.50, 'Valle central','Salud'),--
('754332564','334455667','2023/07/17','2024/12/07','Cotizacion abierta','Abierta' ,0.75, 'Caribe sur','Industrial'),--
('153234558','334455667','2023/06/14','2026/07/25','Cotizacion abierta','Abierta' ,0.25, 'Pacifico norte','Transporte'),--
('257543123','334455667','2023/05/21','2025/04/05','Cotizacion abierta','Abierta' ,0.25, 'Caribe sur','Tecnológico'),--
('123456789','334455667','2023/05/21','2022/12/15','Cotizacion abierta','Abierta' ,0.25, 'Zona norte','Educación'),--
('258932147','334455667','2023/05/21','2023/05/08','Cotizacion abierta','Abierta' ,0.25, 'Caribe norte','Transporte'),--
('642342123','334455667','2023/05/21','2024/04/26','Cotizacion abierta','Abierta' ,0.25, 'Pacifico sur','Deportivo'),--
('754323489','334455667','2023/05/21','2021/11/28','Cotizacion abierta','Abierta' ,0.25, 'Pacifico norte','Alimentación'),--
('321234678','334455667','2023/05/21','2021/03/01','Cotizacion abierta','Abierta' ,0.25, 'Valle central','Tecnológico'),--


('754323489','998877665','2023/09/11','2024/05/15','Cotizacion de articulos', 'Rechazado',0.75,'Valle central','Deportivo'),--
('235754438','998877665','2023/02/23','2025/10/27','Cotizacion abierta','Abierta' ,0.50, 'Pacifico norte','Tecnológico'),--
('754332564','998877665','2023/01/13','2026/12/07','Cotizacion abierta','Abierta' ,0.75, 'Pacifico sur','Telecomunicaciones'),--
('153234558','998877665','2023/12/06','2028/07/25','Cotizacion abierta','Abierta' ,0.25, 'Zona norte','Automotriz'),--
('257543123','998877665','2023/07/15','2029/04/05','Cotizacion abierta','Abierta' ,0.25, 'Pacifico central','Deportivo'),--
('432123478','998877665','2022/09/25','2029/04/05','Cotizacion abierta','Abierta' ,0.25, 'Pacifico central','Comercial'),--
('564298645','998877665','2021/10/03','2029/04/05','Cotizacion abierta','Abierta' ,0.25, 'Pacifico central','Educación'),--
('153234558','998877665','2021/11/02','2029/04/05','Cotizacion abierta','Abierta' ,0.25, 'Pacifico central','Cultural'),--
('123456789','998877665','2021/12/09','2029/04/05','Cotizacion abierta','Abierta' ,0.25, 'Pacifico central','Económico');--

--Hay 55

create table estadoFactura(
	tipoFactura varchar(30) not null,
	descripcion varchar(200) not null,
	primary key (tipoFactura)

);

insert into estadoFactura(tipoFactura, descripcion) values 
('Emitida','Recien se creo la factura'),
('Pagada','El cliente ya pago toda la factura'),
('Cancelada','El cliente cancela la factura');



CREATE TABLE Factura (
    Codigo VARCHAR(15) NOT NULL, --
	CodigoCotizacion int  null,  --
	CedulaCliente varchar(9),
    CedulaEmpleado VARCHAR(9) NOT NULL, 
    CedulaJuridica VARCHAR(9) NOT NULL,
    TelefonoLocal VARCHAR(8) NOT NULL,
    NombreLocal VARCHAR(40) NOT NULL,
    FechaFactura DATE not null,
	NombreCliente varchar(20) not null,
	estado varchar(30) not null
	PRIMARY KEY (Codigo),
    FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(Cedula),
	FOREIGN KEY (CodigoCotizacion) REFERENCES Cotizacion(Codigo),
	foreign key (estado) references estadoFactura(tipoFactura)
);


INSERT INTO Factura (Codigo, CodigoCotizacion, CedulaCliente, CedulaEmpleado, CedulaJuridica, TelefonoLocal, NombreLocal, FechaFactura, NombreCliente, estado)
VALUES
('FAC1', null, '123456789', '123456789', '900123456', '22223334', 'Ferretería El Buen Precio', '2024-01-15', 'Juan Pérez', 'Emitida'),
('FAC2', null, '325543227', '987654321', '900654321', '33334444', 'Librería Central', '2024-01-18', 'María López', 'Pagada'),
('FAC3', null, '456789123', '112233445', '900789123', '44445555', 'Tecnología y Más', '2024-01-20', 'Carlos Rodríguez', 'Cancelada'),
('FAC4', null, '321654987', '556677889', '900987654', '55556666', 'Consultorio Médico', '2024-08-25', 'Ana Martínez', 'Emitida'),
('FAC5', null, '754323489', '334455667', '900345678', '66667777', 'Repuestos del Valle', '2025-08-30', 'Luis Fernández', 'Pagada'),
('FAC6', null, '432124368', '998877665', '900876543', '77778888', 'Mercado del Pueblo', '2026-02-03', 'Laura Gómez', 'Emitida'),
('FAC7', null, '153234558', '123456789', '900567890', '88889999', 'Tienda del Norte', '2028-09-07', 'Pedro Jiménez', 'Pagada'),
('FAC8', null, '533467853', '987654321', '900123789', '99990000', 'Electrónica Universal', '2025-02-12', 'Carmen Díaz', 'Cancelada'),
('FAC9', null, '258932147', '112233445', '900987321', '11112222', 'Supermercado Caribe', '2024-02-15', 'Javier Morales', 'Emitida'),
('FAC10', null, '369253247', '556677889', '900543216', '22223334', 'Moda Latina', '2023-02-19', 'Isabel Torres', 'Pagada'),
('FAC11', null, '235754438', '334455667', '900789654', '54345765', 'Comercial Guayacán', '2022-02-25', 'Eladio Carrión', 'Emitida'),
('FAC12', null, '754332564', '998877665', '900234567', '34535321', 'Distribuidora Central', '2022-02-28', 'Mark Cuban', 'Cancelada'),
('FAC13', null, '432123478', '123456789', '900654321', '54357565', 'Hogar y Construcción', '2022-03-05', 'MYke Towers', 'Emitida'),
('FAC14', null, '564298645', '987654321', '900876345', '32476542', 'Farmacia Amiga', '2022-01-10', 'Rodrigo Chaves', 'Pagada'),
('FAC15', null, '354215796', '112233445', '900234789', '86643354', 'Electrodomésticos Centro', '2022-03-15', 'Carolina Giraldo', 'Emitida'),
('FAC16', null, '642342123', '556677889', '900543789', '97314784', 'Moda y Estilo', '2024-01-20', 'Shakira Isabel', 'Cancelada'),
('FAC17', null, '653212356', '334455667', '900321654', '23462123', 'Abastecedor del Sur', '2023-07-25', 'Katy Perry', 'Pagada'),
('FAC18', null, '257543123', '998877665', '900567321', '69504832', 'Super del Norte', '2023-07-28', 'Taylor Swift', 'Emitida'),
('FAC19', null, '321234678', '123456789', '900654789', '43211257', 'Almacen del Pacífico', '2023-07-01', 'Sofia Vergara', 'Pagada'),
('FAC20', null, '642342123', '987654321', '900321987', '55557788', 'Bazar Oriental', '2023-04-04', 'Laura Gomez', 'Cancelada'),
('FAC21', null, '456789123', '987654321', '123456789', '23457899', 'Maderas del Caribe', '2024-11-04', 'Carlos Rodríguez', 'Emitida'),
('FAC22', null, '754323489', '556677889', '987654321', '55512345', 'Constructora Los Andes', '2024-11-10', 'Luis Fernández', 'Pagada'),
('FAC23', null, '321654987', '334455667', '456789123', '31254798', 'Tienda Futuro', '2024-01-15', 'Ana Martínez', 'Cancelada'),
('FAC24', null, '258932147', '112233445', '654321987', '34765213', 'Hotel Mirador', '2024-02-03', 'Javier Morales', 'Emitida'),
('FAC25', null, '369253247', '998877665', '678910111', '23876598', 'Ferretería Central', '2024-02-10', 'Isabel Torres', 'Pagada'),
('FAC26', null, '533467853', '123456789', '234567890', '54897265', 'Distribuidora Norte', '2024-12-12', 'Carmen Díaz', 'Cancelada'),
('FAC27', null, '754332564', '987654321', '876543219', '23984765', 'Constructora Sureña', '2024-12-20', 'Mark Cuban', 'Emitida'),
('FAC28', null, '257543123', '556677889', '234567899', '48572139', 'Tienda La Modernidad', '2024-12-27', 'Taylor Swift', 'Pagada'),
('FAC29', null, '321234678', '334455667', '123098456', '92384765', 'Café Aroma', '2024-03-05', 'Sofia Vergara', 'Emitida'),
('FAC30', null, '533467853', '112233445', '234876543', '89532476', 'Panadería Delicias', '2024-03-10', 'Eladio Carrión', 'Cancelada'),
('FAC31', null, '235754438', '998877665', '112233445', '32457893', 'Soda El Sabor', '2024-03-15', 'Pedro Jiménez', 'Pagada'),
('FAC32', null, '754332564', '987654321', '345678901', '12345987', 'Electrónica Mundial', '2024-03-22', 'Mark Cuban', 'Emitida'),
('FAC33', null, '564298645', '556677889', '987654321', '65982345', 'Supermercado Eco', '2024-03-28', 'Rodrigo Chaves', 'Pagada'),
('FAC34', null, '432124368', '334455667', '987654322', '35478965', 'Farmacia Salud', '2023-04-01', 'Laura Gómez', 'Emitida'),
('FAC35', null, '153234558', '112233445', '345098765', '82745693', 'Lavandería Express', '2024-06-05', 'Pedro Jiménez', 'Cancelada'),
('FAC36', null, '235754438', '998877665', '112233445', '63584729', 'Centro Veterinario', '2024-06-15', 'Pedro Jiménez', 'Emitida'),
('FAC37', null, '754332564', '987654321', '567890123', '38476521', 'Automotriz Sur', '2023-04-20', 'Mark Cuban', 'Pagada'),
('FAC38', null, '369253247', '556677889', '456789321', '56723984', 'Gimnasio Power', '2024-05-28', 'Isabel Torres', 'Cancelada'),
('FAC39', null, '432123478', '334455667', '789654321', '39284576', 'Construcción Heredia', '2024-05-01', 'MYke Towers', 'Emitida'),
('FAC40', null, '564298645', '112233445', '678543219', '92384756', 'Tienda El Progreso', '2023-05-08', 'Rodrigo Chaves', 'Pagada');

--Me falta hacer inserts
CREATE TABLE Caso (
    CodigoCaso VARCHAR(15) NOT NULL,
    PropietarioCaso VARCHAR(9) NOT NULL,
    OrigenCasoC INT ,
	OrigenCasoF varchar(15) ,
    NombreCuenta VARCHAR(40) NOT NULL,
    NombreContacto VARCHAR(40) NOT NULL,
    Asunto VARCHAR(200) NOT NULL,
    Direccion VARCHAR(150) NOT NULL,
    Descripcion VARCHAR(200) NOT NULL,
    EstadoCaso VARCHAR(20) NOT NULL,
    TipoCaso VARCHAR(20) NOT NULL,
    Prioridad VARCHAR(20) NOT NULL,
    PRIMARY KEY (CodigoCaso),
    FOREIGN KEY (TipoCaso) REFERENCES TipoCaso(TipoCaso),
    FOREIGN KEY (EstadoCaso) REFERENCES Estado(TipoEstado),
    FOREIGN KEY (OrigenCasoC) REFERENCES Cotizacion(Codigo),
	foreign key (OrigenCasoF) references Factura(Codigo),
    FOREIGN KEY (PropietarioCaso) REFERENCES Cliente(Cedula),
    FOREIGN KEY (Prioridad) REFERENCES Prioridad(TipoPrioridad)
);
 
INSERT INTO Caso (CodigoCaso, PropietarioCaso, OrigenCasoC, OrigenCasoF, NombreCuenta, NombreContacto, Asunto, Direccion, Descripcion, EstadoCaso, TipoCaso, Prioridad) VALUES
('CS1', '754323489', 1, 'FAC1', 'Salamar','Personal', 'Necesitamos una ayuda inmediata', 'San jose en el centro de la capital', 'Se tiene que verificar el tipo de ayuda que necesita', 'Abierta', 'Devolucion', 'Alta'),
('CS2', '369253247', 2, 'FAC2', 'Dospinos','Empresarial', 'Queremos hablar con un encargado', 'Alajuela a un costado del mercado', 'Se procedera a enviar la queja al encargado', 'Aprobado', 'Devolucion', 'Alta'),
('CS3', '432124368', 3, 'FAC3', 'Aurua','Personal', 'Tuvimos problemas', 'En San carlos debajo de una catarata', 'Se busca el tipo de problemas', 'Rechazado', 'Garantia', 'Baja'),
('CS4', '456789123', 4, 'FAC4', 'Dianeys','Personal', 'Hubo un problema', 'En la casa habitacion #58 en limon', 'Se habla para ver el problema', 'Aprobado', 'Garantia', 'Baja'),
('CS5', '533467853', 5, 'FAC5', 'Nike','Empresarial', 'Algo fallo en los pedidos', 'San jose a la par de amazon', 'Se indica el fallo que hubo', 'Abierta', 'Reclamo', 'Media'),
('CS6', '754323489', 6, 'FAC6', 'Adidas','Empresarial', 'Es un asunto de urgencia', 'San jose por el mall san pedro', 'Se habla con el administrador', 'Rechazado', 'Reclamo', 'Media');




CREATE TABLE TareaCaso (
    CodigoTarea VARCHAR(15) NOT NULL,
	CodigoCaso varchar(15) not null,
	PRIMARY KEY (CodigoTarea,CodigoCaso),
	foreign key (CodigoCaso) references Caso(CodigoCaso)
);
insert into TareaCaso(CodigoTarea,CodigoCaso) values
('T1', 'CS1'),
('T2', 'CS2'),
('T3', 'CS3'),
('T4', 'CS4'),
('T5', 'CS5'),
('T6', 'CS6');





CREATE TABLE TareaCotizacion (
    CodigoTarea VARCHAR(15) NOT NULL,
	Codigo int not null,
	PRIMARY KEY (CodigoTarea,Codigo),
    FOREIGN KEY (Codigo) REFERENCES Cotizacion(Codigo)
);




CREATE TABLE ListaFactura (
    Codigo varchar(15) not null,
	CantidadProducto int NOT NULL,
	CodigoF varchar(15) not null
    primary key (Codigo, CodigoF),
    foreign key (Codigo) references Articulo (Codigo), 
	foreign key (CodigoF) references Factura(Codigo), 
);
insert into ListaFactura(Codigo,CantidadProducto ,CodigoF) values
('ART14', 5, 'FAC1'),
('ART27', 2, 'FAC1'),
('ART54', 4, 'FAC1'),
('ART32', 3, 'FAC1'),
('ART37', 4, 'FAC1'),
('ART22', 1, 'FAC1'),

('ART52', 4, 'FAC2'),
('ART38', 3, 'FAC2'),
('ART19', 3, 'FAC2'),

('ART1', 3, 'FAC3'),
('ART3', 4, 'FAC3'),
('ART24', 2, 'FAC3'),
('ART70', 5, 'FAC3'),
('ART52', 1, 'FAC3'),
('ART61', 1, 'FAC3'),

('ART3', 3, 'FAC4'),
('ART39', 2, 'FAC4'),
('ART17', 3, 'FAC4'),
('ART59', 2, 'FAC4'),

('ART13', 6, 'FAC5'),
('ART49', 1, 'FAC5'),
('ART33', 5, 'FAC5'),
('ART19', 7, 'FAC5'),

('ART61', 3, 'FAC6'),
('ART8', 2, 'FAC6'),
('ART40', 6, 'FAC6'),
('ART54', 4, 'FAC6'),

('ART78', 5, 'FAC7'),
('ART6', 1, 'FAC7'),
('ART27', 2, 'FAC7'),
('ART34', 8, 'FAC7'),
('ART57', 3, 'FAC7'),
('ART30', 5, 'FAC7'),
('ART60', 2, 'FAC7'),

('ART73', 3, 'FAC8'),
('ART30', 3, 'FAC8'),
('ART57', 5, 'FAC8'),
('ART49', 4, 'FAC8'),
('ART25', 2, 'FAC8'),

('ART37', 6, 'FAC9'),
('ART53', 1, 'FAC9'),
('ART26', 2, 'FAC9'),
('ART68', 3, 'FAC9'),

('ART2', 3, 'FAC10'),
('ART66', 2, 'FAC10'),
('ART15', 5, 'FAC10'),
('ART43', 7, 'FAC10'),

('ART72', 4, 'FAC11'),
('ART25', 7, 'FAC11'),

('ART34', 3, 'FAC12'),
('ART65', 1, 'FAC12'),
('ART48', 3, 'FAC12'),

('ART48', 4, 'FAC13'),
('ART24', 6, 'FAC13'),
('ART69', 2, 'FAC13'),
('ART52', 3, 'FAC13'),

('ART40', 4, 'FAC14'),
('ART79', 7, 'FAC14'),
('ART32', 3, 'FAC14'),
('ART45', 1, 'FAC14'),

('ART74', 3, 'FAC15'),
('ART75', 7, 'FAC15'),
('ART17', 4, 'FAC15'),
('ART1', 2, 'FAC15'),

('ART63', 9, 'FAC16'),
('ART80', 8, 'FAC16'),
('ART18', 3, 'FAC16'),

('ART47', 5, 'FAC17'),
('ART70', 2, 'FAC17'),
('ART59', 3, 'FAC17'),

('ART74', 7, 'FAC18'),
('ART55', 1, 'FAC18'),
('ART35', 3, 'FAC18'),
('ART76', 4, 'FAC18'),

('ART51', 1, 'FAC19'),
('ART65', 2, 'FAC19'),
('ART56', 3, 'FAC19'),
('ART60', 7, 'FAC19'),

('ART31', 1, 'FAC20'),
('ART33', 2, 'FAC20'),
('ART12', 7, 'FAC20'),
('ART39', 3, 'FAC20'),
('ART46', 5, 'FAC20'),

('ART25', 1, 'FAC21'),
('ART51', 2, 'FAC21'),
('ART13', 3, 'FAC21'),

('ART17', 3, 'FAC22'),
('ART29', 6, 'FAC22'),
('ART40', 2, 'FAC22'),

('ART30', 5, 'FAC23'),
('ART22', 4, 'FAC23'),
('ART18', 2, 'FAC23'),
('ART48', 10, 'FAC23'),

('ART31', 9, 'FAC24'),
('ART20', 8, 'FAC24'),
('ART33', 5, 'FAC24'),

('ART15', 7, 'FAC25'),
('ART36', 5, 'FAC25'),
('ART28', 4, 'FAC25'),

('ART19', 2, 'FAC26'),
('ART45', 4, 'FAC26'),

('ART32', 3, 'FAC27'),
('ART54', 6, 'FAC27'),
('ART24', 2, 'FAC27'),

('ART9', 4, 'FAC28'),
('ART38', 2, 'FAC28'),
('ART11', 5, 'FAC28'),

('ART49', 3, 'FAC29'),
('ART41', 6, 'FAC29'),
('ART27', 8, 'FAC29'),
('ART34', 5, 'FAC29'),

('ART7', 3, 'FAC30'),
('ART50', 5, 'FAC30'),
('ART21', 3, 'FAC30'),

('ART60', 2, 'FAC31'),
('ART14', 3, 'FAC31'),
('ART3', 7, 'FAC31'),
('ART43', 4, 'FAC31'),

('ART53', 2, 'FAC32'),
('ART55', 5, 'FAC32'),
('ART26', 3, 'FAC32'),
('ART62', 4, 'FAC32'),

('ART39', 1, 'FAC33'),
('ART5', 8, 'FAC33'),
('ART10', 7, 'FAC33'),

('ART42', 5, 'FAC34'),
('ART16', 4, 'FAC34'),
('ART67', 2, 'FAC34'),

('ART2', 9, 'FAC35'),
('ART8', 8, 'FAC35'),
('ART37', 5, 'FAC35'),

('ART47', 5, 'FAC36'),
('ART52', 4, 'FAC36'),
('ART58', 7, 'FAC36'),

('ART44', 4, 'FAC37'),
('ART6', 3, 'FAC37'),
('ART66', 2, 'FAC37'),

('ART23', 8, 'FAC38'),
('ART64', 4, 'FAC38'),
('ART19', 1, 'FAC38'),

('ART4', 4, 'FAC39'),
('ART69', 5, 'FAC39'),
('ART57', 2, 'FAC39'),

('ART70', 3, 'FAC40'),
('ART71', 4, 'FAC40'),
('ART56', 2, 'FAC40');




CREATE TABLE Movimiento(
	IDMovimiento int IDENTITY(1,1) not null,
	Cedula VARCHAR(9) not null, 
	BodegaOrigen varchar(15) not null,
	BodegaDestino varchar(15) null,
	fecha date not null,
	hora time not null,
	PRIMARY KEY (IDMovimiento),
	FOREIGN KEY (Cedula) references Empleado(Cedula),
	FOREIGN KEY (BodegaOrigen) REFERENCES Bodega(Codigo),
    FOREIGN KEY (BodegaDestino) REFERENCES Bodega(Codigo)
);


CREATE TABLE ListaMovimiento (
	CodigoArticulo VARCHAR(15) NOT NULL,
	CantidadArticulo int not null,
	CodigoMovimiento int NOT NULL,
	PRIMARY KEY (CodigoArticulo, CodigoMovimiento),
	FOREIGN KEY (CodigoArticulo) REFERENCES Articulo(Codigo),
	FOREIGN KEY (CodigoMovimiento) REFERENCES Movimiento(IDMovimiento),
);

--Esto es para ingresar elementos a una bodega
CREATE TABLE IngresoInventario (
    IDIngreso INT IDENTITY(1,1) NOT NULL,
    CedulaEmpleado VARCHAR(9) NOT NULL,
    BodegaDestino VARCHAR(15) NOT NULL,
    Fecha DATETIME,
    PRIMARY KEY (IDIngreso, BodegaDestino),  
    FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(Cedula),
    FOREIGN KEY (BodegaDestino) REFERENCES Bodega(Codigo)
);

insert into IngresoInventario(CedulaEmpleado, BodegaDestino, Fecha) values 
('123456789', 'BO1', '2024-10-12 08:00:00'),
('987654321', 'BO2', '2024-09-12 09:00:00'),
('112233445', 'BO3', '2024-08-12 10:00:00'),
('556677889', 'BO4', '2024-07-12 11:00:00'),
('334455667', 'BO5', '2024-06-12 12:00:00'),
('998877665', 'BO6', '2024-05-12 13:00:00'),
('654321987', 'BO7', '2024-04-12 14:00:00'),
('223344556', 'BO8', '2024-03-12 15:00:00'),
('887766554', 'BO9', '2024-02-12 16:00:00'),
('445566778', 'BO10', '2024-01-12 17:00:00'),
('556677889', 'BO11', '2024-11-12 18:00:00'),


('334455667', 'BO1', '2023-12-12 08:00:00'), --12
('998877665', 'BO2', '2024-11-12 09:00:00'), --13
('654321987', 'BO3', '2024-10-12 10:00:00'), --14
('223344556', 'BO4', '2024-09-12 11:00:00'), --15
('887766554', 'BO5', '2024-08-12 12:00:00'), --16
('445566778', 'BO6', '2024-07-12 13:00:00'), --17
('556677889', 'BO7', '2024-06-12 14:00:00'), --18
('998877664', 'BO8', '2024-05-12 15:00:00'), --19
('335577992', 'BO9', '2024-04-12 16:00:00'), --20
('112244335', 'BO10', '2024-03-12 17:00:00'), --21
('775566443', 'BO11', '2024-02-12 18:00:00'); --22

CREATE TABLE ListaIngreso (
    IDIngreso INT NOT NULL,
    BodegaDestino VARCHAR(15) NOT NULL, 
    CodigoArticulo VARCHAR(15) NOT NULL,
    CantidadIngresada INT NOT NULL,
	fecha date not null,
    PRIMARY KEY (CodigoArticulo, IDIngreso, BodegaDestino),
    FOREIGN KEY (CodigoArticulo) REFERENCES Articulo(Codigo),
    FOREIGN KEY (IDIngreso, BodegaDestino) REFERENCES IngresoInventario(IDIngreso, BodegaDestino)
);


insert into ListaIngreso(IDIngreso, BodegaDestino, CodigoArticulo, CantidadIngresada, fecha) values
(1, 'BO1', 'ART1', 100, '2022-01-05'),  
(1, 'BO1', 'ART3', 50, '2022-01-10'),   
(1, 'BO1', 'ART4', 30, '2022-01-15'),
(1, 'BO1', 'ART32', 25, '2022-01-20'),   
(1, 'BO1', 'ART47', 15, '2022-01-25'),   

(2, 'BO2', 'ART6', 200, '2022-02-05'),    
(2, 'BO2', 'ART7', 150, '2022-02-10'),  
(2, 'BO2', 'ART8', 100, '2022-02-15'),
(2, 'BO2', 'ART74', 65, '2022-02-20'),  
(2, 'BO2', 'ART80', 23, '2022-02-25'), 

(3, 'BO3', 'ART11', 10, '2022-03-01'),  
(3, 'BO3', 'ART12', 15, '2022-03-05'),  
(3, 'BO3', 'ART13', 20, '2022-03-10'),
(3, 'BO3', 'ART19', 87, '2022-03-15'),  
(3, 'BO3', 'ART15', 70, '2022-03-20'), 

(4, 'BO4', 'ART16', 50, '2022-04-01'),
(4, 'BO4', 'ART17', 30, '2022-04-05'), 
(4, 'BO4', 'ART19', 10, '2022-04-10'),
(4, 'BO4', 'ART45', 55, '2022-04-15'), 
(4, 'BO4', 'ART9', 46, '2022-04-20'),

(5, 'BO5', 'ART22', 75, '2023-01-01'),  
(5, 'BO5', 'ART23', 50, '2023-01-05'),  
(5, 'BO5', 'ART25', 100, '2023-01-10'),
(5, 'BO5', 'ART29', 23, '2023-01-15'),  
(5, 'BO5', 'ART52', 42, '2023-01-20'),

(6, 'BO6', 'ART67', 35, '2023-02-01'),  
(6, 'BO6', 'ART73', 15, '2023-02-05'),  
(6, 'BO6', 'ART5', 70, '2023-02-10'),

(7, 'BO7', 'ART33', 100, '2023-02-15'),  
(7, 'BO7', 'ART78', 10, '2023-02-20'),  
(7, 'BO7', 'ART1', 69, '2023-02-25'),

(8, 'BO8', 'ART16', 95, '2023-03-01'),  
(8, 'BO8', 'ART4', 93, '2023-03-05'),  
(8, 'BO8', 'ART7', 14, '2023-03-10'),

(9, 'BO9', 'ART29', 25, '2023-03-15'),  
(9, 'BO9', 'ART13', 86, '2023-03-20'),  
(9, 'BO9', 'ART7', 18, '2023-03-25'),

(10, 'BO10', 'ART54', 34, '2023-04-01'),  
(10, 'BO10', 'ART58', 48, '2023-04-05'),  
(10, 'BO10', 'ART76', 97, '2023-04-10'),

(11, 'BO11', 'ART4', 43, '2023-04-15'),  
(11, 'BO11', 'ART31', 76, '2023-04-20'),  
(11, 'BO11', 'ART42', 93, '2023-04-25'),

(12, 'BO1', 'ART6', 45, '2024-01-01'),  
(12, 'BO1', 'ART21', 38, '2024-01-05'),  
(12, 'BO1', 'ART22', 86, '2024-01-10'),

(13, 'BO2', 'ART73', 32, '2024-01-15'),  
(13, 'BO2', 'ART68', 65, '2024-01-20'),  
(13, 'BO2', 'ART81', 96, '2024-01-25'),

(14, 'BO3', 'ART53', 43, '2024-02-01'),  
(14, 'BO3', 'ART66', 65, '2024-02-05'),  
(14, 'BO3', 'ART47', 86, '2024-02-10'),

(15, 'BO4', 'ART56', 21, '2024-02-15'),  
(15, 'BO4', 'ART43', 57, '2024-02-20'),  
(15, 'BO4', 'ART48', 23, '2024-02-25'),

(16, 'BO5', 'ART28', 12, '2024-03-01'),  
(16, 'BO5', 'ART45', 64, '2024-03-05'),  
(16, 'BO5', 'ART80', 37, '2024-03-10'),

(17, 'BO6', 'ART53', 53, '2024-03-15'),  
(17, 'BO6', 'ART28', 38, '2024-03-20'),  
(17, 'BO6', 'ART63', 86, '2024-03-25'),

(18, 'BO7', 'ART36', 53, '2024-04-01'),  
(18, 'BO7', 'ART53', 67, '2024-04-05'),  
(18, 'BO7', 'ART26', 86, '2024-04-10'),

(19, 'BO8', 'ART20', 26, '2024-04-15'),  
(19, 'BO8', 'ART30', 150, '2024-04-20'),  
(19, 'BO8', 'ART40', 32, '2024-04-25'),

(20, 'BO9', 'ART21', 34, '2024-05-01'),  
(20, 'BO9', 'ART54', 53, '2024-05-05'),  
(20, 'BO9', 'ART75', 29, '2024-05-10'),

(21, 'BO10', 'ART64', 47, '2024-05-15'),  
(21, 'BO10', 'ART32', 74, '2024-05-20'),  
(21, 'BO10', 'ART37', 94, '2024-05-25'),

(22, 'BO11', 'ART10', 27, '2024-06-01'),  
(22, 'BO11', 'ART18', 63, '2024-06-05'),  
(22, 'BO11', 'ART41', 74, '2024-06-10');

CREATE TABLE SalidaMovimiento(
	IDFactura VARCHAR(15) not null,
	CodigoProducto VARCHAR(15) not null,
	CodigoBodega VARCHAR(15) not null,
	Cantidad int not null,
	fecha date
	PRIMARY KEY(IDFactura, CodigoProducto,CodigoBodega),
	FOREIGN KEY (CodigoProducto) REFERENCES Articulo(Codigo),
	FOREIGN KEY (CodigoBodega) REFERENCES Bodega(Codigo),
	FOREIGN KEY (IDFactura) REFERENCES Factura(Codigo)
);




insert into SalidaMovimiento(IDFactura, CodigoProducto, CodigoBodega, Cantidad,fecha) values
('FAC1', 'ART15', 'BO1', 15, '2022-01-10'),
('FAC2', 'ART20', 'BO2', 10, '2022-02-15'),
('FAC3', 'ART25', 'BO5', 5, '2022-03-20'),
('FAC4', 'ART10', 'BO3', 20, '2022-04-25'),
('FAC5', 'ART30', 'BO6', 12, '2022-05-30'),
('FAC6', 'ART35', 'BO8', 8, '2022-06-05'),
('FAC7', 'ART12', 'BO4', 18, '2022-07-10'),
('FAC8', 'ART18', 'BO7', 30, '2022-08-15'),
('FAC9', 'ART22', 'BO9', 7, '2022-09-20'),
('FAC10', 'ART27', 'BO10', 25, '2022-10-25'),
('FAC11', 'ART15', 'BO11', 11, '2022-11-30'),
('FAC12', 'ART31', 'BO3', 14, '2022-12-05'),
('FAC13', 'ART40', 'BO2', 6, '2023-01-10'),
('FAC14', 'ART36', 'BO1', 17, '2023-02-15'),
('FAC15', 'ART23', 'BO4', 9, '2023-03-20'),
('FAC16', 'ART19', 'BO5', 28, '2023-04-25'),
('FAC17', 'ART17', 'BO7', 22, '2023-05-30'),
('FAC18', 'ART29', 'BO8', 10, '2023-06-05'),
('FAC19', 'ART21', 'BO9', 16, '2023-07-10'),
('FAC20', 'ART28', 'BO3', 13, '2023-08-15'),
('FAC21', 'ART16', 'BO11', 20, '2023-09-20'),
('FAC22', 'ART24', 'BO2', 15, '2023-10-25'),
('FAC23', 'ART32', 'BO3', 9, '2023-11-30'),
('FAC24', 'ART37', 'BO9', 7, '2023-12-05'),
('FAC25', 'ART11', 'BO9', 18, '2024-01-10'),
('FAC26', 'ART33', 'BO5', 23, '2024-02-15'),
('FAC27', 'ART38', 'BO5', 11, '2024-03-20'),
('FAC28', 'ART26', 'BO11', 21, '2024-04-25'),
('FAC29', 'ART34', 'BO2', 16, '2024-05-30'),
('FAC30', 'ART13', 'BO4', 8, '2024-06-05'),
('FAC31', 'ART14', 'BO3', 12, '2024-07-10'),
('FAC32', 'ART39', 'BO10', 14, '2024-08-15'),
('FAC33', 'ART10', 'BO4', 26, '2024-09-20'),
('FAC34', 'ART35', 'BO7', 19, '2024-10-25'),
('FAC35', 'ART29', 'BO8', 6, '2024-11-30'),
('FAC36', 'ART25', 'BO9', 5, '2024-12-05'),
('FAC37', 'ART22', 'BO2', 17, '2022-01-15'),
('FAC38', 'ART30', 'BO3', 13, '2022-02-20'),
('FAC39', 'ART18', 'BO1', 27, '2022-03-25'),
('FAC40', 'ART16', 'BO2', 24, '2022-04-30');





CREATE TABLE ListaSalida (
    CodigoMovimiento INT NOT NULL,
    CodigoArticulo VARCHAR(15) NOT NULL,
    CantidadIngresada INT not null,
    PRIMARY KEY (CodigoArticulo, CodigoMovimiento),
    FOREIGN KEY (CodigoMovimiento) REFERENCES Movimiento(IDMovimiento),
    FOREIGN KEY (CodigoArticulo) REFERENCES Articulo(Codigo)
);







CREATE TABLE ListaCotizacion (
	CodigoProducto VARCHAR(15) NOT NULL,
	CantidadProducto INT NOT NULL,
	CodigoCotizacion int NOT NULL,
	PRIMARY KEY (CodigoProducto,CodigoCotizacion),
	FOREIGN KEY (CodigoProducto) REFERENCES Articulo(Codigo),
	FOREIGN KEY (CodigoCotizacion) REFERENCES Cotizacion(Codigo)
);

insert into ListaCotizacion(CodigoProducto,CantidadProducto,CodigoCotizacion) values
('ART10', 5, 1),
('ART23', 2, 1),
('ART5', 7, 1),
('ART17', 3, 1),
('ART81', 4, 1),
('ART42', 1, 1),

('ART12', 6, 2),
('ART48', 8, 2),
('ART9', 3, 2),

('ART27', 4, 3),
('ART33', 6, 3),
('ART14', 2, 3),
('ART7', 5, 3),
('ART50', 1, 3),
('ART21', 7, 3),

('ART3', 9, 4),
('ART39', 2, 4),
('ART16', 3, 4),
('ART58', 4, 4),

('ART13', 6, 5),
('ART29', 1, 5),
('ART36', 5, 5),
('ART19', 7, 5),

('ART61', 3, 6),
('ART8', 2, 6),
('ART40', 9, 6),
('ART54', 4, 6),

('ART78', 5, 7),
('ART6', 1, 7),
('ART20', 2, 7),
('ART11', 7, 7),
('ART44', 3, 7),
('ART31', 8, 7),
('ART62', 4, 7),

('ART73', 6, 8),
('ART30', 3, 8),
('ART57', 5, 8),
('ART49', 9, 8),
('ART25', 2, 8),

('ART37', 7, 9),
('ART53', 1, 9),
('ART26', 8, 9),
('ART68', 4, 9),

('ART2', 3, 10),
('ART66', 6, 10),
('ART15', 9, 10),
('ART43', 5, 10),

('ART72', 2, 11),
('ART22', 4, 11),

('ART38', 3, 12),
('ART60', 7, 12),
('ART41', 5, 12),

('ART28', 9, 13),
('ART24', 2, 13),
('ART69', 6, 13),
('ART52', 3, 13),

('ART4', 8, 14),
('ART79', 4, 14),
('ART32', 1, 14),
('ART45', 7, 14),

('ART34', 6, 15),
('ART75', 5, 15),
('ART67', 3, 15),
('ART1', 9, 15),

('ART63', 2, 16),
('ART80', 8, 16),
('ART18', 5, 16),

('ART47', 6, 17),
('ART70', 3, 17),
('ART59', 1, 17),

('ART74', 8, 18),
('ART55', 2, 18),
('ART35', 5, 18),
('ART76', 7, 18),

('ART51', 4, 19),
('ART65', 9, 19),
('ART56', 6, 19),
('ART60', 3, 19),

('ART31', 7, 20),
('ART39', 2, 20),
('ART12', 5, 20),
('ART35', 3, 20),
('ART46', 4, 20),

('ART25', 2, 21),
('ART51', 7, 21),
('ART13', 6, 21),

('ART17', 5, 22),
('ART29', 4, 22),
('ART40', 3, 22),

('ART30', 6, 23),
('ART22', 2, 23),
('ART18', 8, 23),
('ART48', 5, 23),

('ART31', 7, 24),
('ART20', 1, 24),
('ART33', 4, 24),

('ART15', 9, 25),
('ART36', 2, 25),
('ART28', 6, 25),

('ART19', 8, 26),
('ART45', 3, 26),

('ART32', 7, 27),
('ART54', 4, 27),
('ART24', 5, 27),

('ART9', 2, 28),
('ART38', 8, 28),
('ART11', 3, 28),

('ART49', 1, 29),
('ART41', 5, 29),
('ART27', 3, 29),
('ART34', 7, 29),

('ART7', 6, 30),
('ART50', 2, 30),
('ART21', 9, 30),

('ART60', 8, 31),
('ART14', 4, 31),
('ART3', 5, 31),
('ART43', 3, 31),

('ART53', 6, 32),
('ART55', 1, 32),
('ART26', 2, 32),
('ART62', 7, 32),

('ART39', 3, 33),
('ART5', 6, 33),
('ART10', 4, 33),

('ART42', 8, 34),
('ART16', 3, 34),
('ART67', 5, 34),

('ART2', 7, 35),
('ART8', 4, 35),
('ART37', 6, 35),

('ART47', 9, 36),
('ART52', 3, 36),
('ART58', 2, 36),

('ART44', 6, 37),
('ART6', 8, 37),
('ART66', 1, 37),

('ART23', 7, 38),
('ART64', 4, 38),
('ART19', 5, 38),

('ART4', 9, 39),
('ART69', 2, 39),
('ART57', 3, 39),

('ART70', 5, 40),
('ART71', 1, 40),
('ART56', 7, 40),

('ART63', 6, 41),
('ART12', 4, 41),
('ART68', 3, 41),

('ART1', 8, 42),
('ART14', 2, 42),
('ART61', 5, 42),
('ART13', 6, 42),

('ART75', 9, 43),
('ART33', 3, 43),
('ART65', 4, 43),

('ART72', 7, 44),
('ART50', 2, 44),
('ART18', 6, 44),

('ART32', 8, 45),
('ART40', 1, 45),
('ART45', 3, 45),

('ART36', 4, 46),
('ART11', 9, 46),
('ART24', 5, 46),

('ART59', 2, 47),
('ART29', 8, 47),
('ART20', 3, 47),

('ART27', 5, 48),
('ART52', 1, 48),

('ART76', 4, 49),
('ART38', 6, 49),

('ART17', 3, 50),
('ART42', 7, 50),

('ART74', 9, 51),
('ART26', 2, 51),

('ART46', 5, 52),
('ART22', 1, 52),
('ART34', 8, 52),

('ART78', 7, 53),
('ART28', 3, 53),
('ART15', 6, 53),

('ART9', 4, 54),
('ART30', 5, 54),

('ART79', 8, 55),
('ART25', 3, 55);







--exec CalcularPago;


--Procedimiento almacenado para calcular todos los salarios o el pago en general de una planilla

GO

create procedure CalcularPago 
as 
begin 

    declare @CodigoPlanilla varchar(15);
    declare @HorasRealizadas int;
    declare @Cedula varchar(9);
    declare @SalarioActual int;
    declare @NuevoSalario int;
    declare @Excedente int;

    declare CursorPlanilla cursor for
    select CodigoPlanilla, HorasRealizadas, CedulaEmpleado
    from Planilla
    where Salario is null;

    open CursorPlanilla;

    fetch next from CursorPlanilla into @CodigoPlanilla, @HorasRealizadas, @Cedula;

    while @@FETCH_STATUS = 0
    begin
        select @SalarioActual = SalarioActual
        from Empleado
        where Cedula = @Cedula;

        if @HorasRealizadas > 200
        begin
            set @Excedente = @HorasRealizadas - 200;  
            set @NuevoSalario = (@SalarioActual / 200) * @Excedente * 1.5 + @SalarioActual;
        end
        else
        begin
            set @NuevoSalario = @SalarioActual; -- Si no se exceden las 200 horas, el salario es el mismo
        end

        update Planilla
        set Salario = @NuevoSalario
        where CodigoPlanilla = @CodigoPlanilla;

        fetch next from CursorPlanilla into @CodigoPlanilla, @HorasRealizadas, @Cedula;

    end;

    close CursorPlanilla;
    deallocate CursorPlanilla;

    print 'Salarios calculados y actualizados correctamente para todas las planillas.';
end;


--TODO ESTO ES PARA MOSTRAR EL PAGO DE PLANILLA
go
create view verPago as
select 
    p.CodigoPlanilla as Planilla, 
    p.FechaPlanilla, 
    SUM(p.Salario) as MontoPagado
from 
    Planilla as p
group by 
    p.CodigoPlanilla, 
    p.FechaPlanilla;



go
create function pagosplanilla(
    @fecha date, 
    @tipo varchar(20),
    @fechaFin date null     
)
returns table
as
return
(
    select 
        Planilla, 
        FechaPlanilla, 
        MontoPagado
    from 
        verPago
    where 
        (
            (@tipo = 'mes-año' 
                and (
                    (month(FechaPlanilla) >= month(@fecha) and year(FechaPlanilla) = year(@fecha))
                    or (year(FechaPlanilla) > year(@fecha))
                )
            )
            or (@tipo = 'año-mes' 
                and (
                    (month(FechaPlanilla) = month(@fecha) and year(FechaPlanilla) >= year(@fecha))
                )
            )
            or (@tipo = 'mes(año)' 
                and (month(FechaPlanilla) = month(@fecha) and year(FechaPlanilla) = year(@fecha))
            )
            or (@tipo = 'RangoFecha' 
                and FechaPlanilla between @fecha and isnull(@fechaFin, @fecha))
        )
);

--TODO ESTO ES PARA MOSTRAR EL PAGO DE PLANILLA
--SELECT * 
--FROM pagosplanilla('2024-11-01', 'mes(año)',null);




--TODO ESTO ES PARA PLANILLA DEPARTAMENTO
go
create view depPlanilla as 
    select 
        d.Nombre as nombredepar, 
		p.FechaPlanilla ,
        sum(p.salario) as montopagado
    from 
        planilla as p
    join 
        empleado as e on p.cedulaempleado = e.cedula
    join 
        departamento as d on e.codigodepartamento = d.codigo
	group by
	d.Nombre, 
	p.FechaPlanilla 

--select * from depPlanilla
--drop function pagosplanilladep
go
create function pagosplanilladep(
    @mes date, 
    @tipo varchar(20), 
    @fechafin date null
)
returns table
as
return (
    select 
        dp.nombredepar, 
        dp.montopagado
    from 
        depPlanilla dp
    where 
        (
            (@tipo = 'mes' and month(@mes) = month(dp.FechaPlanilla) and year(@mes) = year(dp.FechaPlanilla)) 
            OR 
            (@tipo = 'mes(año)' and format(dp.FechaPlanilla, 'MM/yyyy') = format(@mes, 'MM/yyyy')) 
            OR
            (@tipo = 'rangofecha' and dp.FechaPlanilla between @mes and @fechafin)
        )
);



--select * from pagosPlanillaDep('11/1/2024','mes(año)',null)
--TODO ESTO ES PARA PLANILLA DEPARTAMENTO



--------------------------------------------------------------------------------------
--TODO ESTO ES PARA LAS VENTAS POR ZONA Y LA FUNCION EL COMO LA USE

go
create view VentasZonas as 

    select 
        s.Nombre as Sector,
        s.Descripcion as descripcionsector,
		f.FechaFactura,
        sum(a.PrecioEstandar * lf.CantidadProducto) as monto
    from 
        ListaFactura as lf
    join 
        Factura as f on lf.CodigoF = f.Codigo
    join 
        Cliente as c on f.CedulaCliente = c.Cedula
    join 
        Articulo as a on lf.Codigo = a.Codigo
    join 
        Sector as s on c.Sector = s.Nombre
	group by
	s.Nombre,
	s.Descripcion,
	f.FechaFactura
	
go
create function VentaSector (
    @tipo varchar(20), 
    @fecha date, 
    @fechafin date null
)
returns table
as
return
(
    select 
        v.Sector,
        v.DescripcionSector,
        SUM(v.monto) as Monto
    from 
        VentasZonas as v
    where 
        (
            -- Filtro por mes y año
            (@tipo = 'mes(año)' and year(v.FechaFactura) = year(@fecha) and month(v.FechaFactura) = month(@fecha))
            or 
            -- Filtro por rango de fechas
            (@tipo = 'RangoFecha' and v.FechaFactura between @fecha and isnull(@fechafin, @fecha))
        )
    group by 
        v.Sector, v.DescripcionSector
);

--SELECT * 
--FROM dbo.VentaSector('mes(año)', '2024-05-01', NULL);

--SELECT * 
--FROM dbo.VentaSector('RangoFecha', '2024-01-01', '2024-03-31');
--TODO ESTO ES PARA LAS VENTAS POR ZONA Y LA FUNCION EL COMO LA USE


--------------------------------------------------------------------------------------












--------------------------------------------------------------------------------------
--select * from VentaSector
go
create view ZonaVenta as 
 select 
        z.nombre as zona,
        z.descripcion as descripcionzona,
		f.FechaFactura,
        sum(a.precioestandar * lf.cantidadproducto) as monto
    from 
        listafactura as lf
    join 
        factura as f on lf.codigof = f.codigo
    join 
        cliente as c on f.cedulacliente = c.cedula
    join 
        articulo as a on lf.codigo = a.codigo
    join 
        zona as z on c.zona = z.nombre
	group by
	z.Nombre,
	z.descripcion,
	f.FechaFactura


go
create function ventazona2 (
    @tipo varchar(20), 
    @fecha date, 
    @fechafin date null
)
returns table
as
return
(
    select 
        z.zona,
        z.descripcionzona,
        sum(z.monto) as monto
    from 
        ZonaVenta as z
    where 
        (
            -- Filtro por mes y año
            (@tipo = 'mes(año)' and year(z.FechaFactura) = year(@fecha) and month(z.FechaFactura) = month(@fecha))
            OR 
            -- Filtro por rango de fechas
            (@tipo = 'rangofecha' and z.FechaFactura between @fecha and isnull(@fechafin, @fecha))
        )
    group by 
        z.zona, z.descripcionzona
);

--SELECT * 
--FROM dbo.ventazona2('mes(año)', '2024-05-01', NULL);
--Forma nueva de ver las ventas por zona 

--------------------------------------------------------------------------------------


--drop view topclientes
  --Todo esto es para ver cliente top 10
go
create view topclientes as
select top 10 
    c.nombre as cliente,
    sum(lf.cantidadproducto * a.precioestandar) as monto,
	f.FechaFactura
from listafactura as lf
join factura as f on lf.codigof = f.codigo
join cliente as c on f.cedulacliente = c.cedula
join articulo as a on lf.codigo = a.codigo
group by c.nombre, 
f.FechaFactura

--select * from topclientes
--drop function top10ClientesAscendente
go
create function top10ClientesAscendente(@tipo varchar(20) = null, @fecha date = null, @fin date = null)
returns table
as
return (
    select top 10
        t.cliente,
        t.monto,
        t.FechaFactura
    from topclientes t
    -- Filtrado de fechas según el tipo
    where 
        (
            -- Si el tipo es 'mes(año)', se filtra por el mes y año de @fecha
            (@tipo = 'mes(año)' and format(t.FechaFactura, 'MM/yyyy') = format(@fecha, 'MM/yyyy')) 
            
            -- Si el tipo es 'rangofecha', se filtra entre las fechas @fecha y @fin
            or (@tipo = 'rangofecha' and t.FechaFactura between @fecha and @fin)
            
            -- Si el tipo es 'cualquier' o es nulo, no se filtra por fecha
            or (@tipo is null or @tipo = 'cualquier') 
        )
    -- Ordenar Ascendentemente
    order by t.monto ASC  -- Orden ascendente
);


--select * from dbo.top10ClientesAscendente(null, null, null);

go
create function top10ClientesDescendente(@tipo varchar(20) null, @fecha date null, @fin date null)
returns table
as
return (
    select top 10
        t.cliente,
        t.monto,
        t.FechaFactura
    from topclientes t
    -- Filtrado de fechas según el tipo
    where 
        (
            (@tipo = 'mes(año)' and format(t.FechaFactura, 'MM/yyyy') = format(@fecha, 'MM/yyyy')) 
            or
            (@tipo = 'rangofecha' and t.FechaFactura between @fecha and @fin)
            or
            (@tipo is null or @tipo = 'cualquier') -- Si @tipo es nulo o 'cualquier', no se filtra por fecha
        )
    -- Ordenar Descendentemente
    order by t.monto DESC  -- Orden descendente
);

--select * from dbo.top10ClientesDescendente(null, null, null);




  --Todo esto es para ver cliente top 10


  --Esto es para la cantidad de clientes por zona y sus ventas
go

create view ClientesZona as
  select count(distinct f.Codigo) as CantidadClientes, z.Nombre as Zona, sum(lf.cantidadproducto * a.precioestandar) as Ventas  from ListaFactura as lf
  join Factura as f on lf.CodigoF = f.Codigo
  join Cliente as c on f.CedulaCliente = c.Cedula
  join Articulo as a on lf.Codigo = a.Codigo
  join Zona as z on c.Zona = z.Nombre
  group by z.Nombre

go
  select * from ClientesZona

go

  go
  create view familiaA as
    select 
        fm.Nombre as NombreFamilia, 
		f.FechaFactura,
        sum(lf.CantidadProducto * a.PrecioEstandar) as MontoVendido
    from 
        ListaFactura as lf
    join 
        Factura as f on lf.CodigoF = f.Codigo 
    join 
        Articulo as a on lf.Codigo = a.Codigo
    join 
        Familia as fm on a.CodigoFamilia = fm.CodigoFamilia
	group by 
	fm.Nombre,
	F.FechaFactura
go

  --drop function FamiliaArt
--Ver familia de productos más vendidos
--Asi pueden ser las demás jejeje
go
CREATE FUNCTION FamiliaArt (
    @tipo varchar(20), 
    @fecha date, 
    @fechafin date null
)
returns table
as
return
(
    select 
        fa.NombreFamilia,
        sum(fa.MontoVendido) as TotalVendido
    from 
        familiaA as fa
    where 
        (
            (@tipo = 'mes(año)' and year(fa.FechaFactura) = year(@fecha) and month(fa.FechaFactura) = month(@fecha))
            OR 
            (@tipo = 'rangofecha' and fa.FechaFactura between @fecha and isnull(@fechafin, @fecha))
        )
    group by 
        fa.NombreFamilia
);




--select * from FamiliaArt



--Lo que es el movimiento todavia no lo hare
--Este es para la cantidad de movimientos de entrada
go
create view SacarIngreso as
select b.Nombre as Bodega,count(li.IDIngreso) CantidadEntrada from ListaIngreso as li 
join Bodega as b on li.BodegaDestino = b.Codigo
group by b.Nombre;



--select * from SacarIngreso

go
create view SacarSalida as
select b.Nombre as Bodega,count(sl.IDFactura) CantidadEntrada from SalidaMovimiento as sl
join Bodega as b on sl.CodigoBodega = b.Codigo
group by b.Nombre;



GO
CREATE FUNCTION tipoMovimientoS(
    @tipo varchar(20) null, 
    @fecha date null, 
    @fin date null
)
returns table
as
return
(
    select 
        Bodega, 
        CantidadEntrada
    from 
        SacarSalida
    where
        (
            @tipo = 'mes(año)' and year(@fecha) = year(getdate()) and month(@fecha) = month(getdate())
        )
        OR 
        (
            @tipo = 'RangoFecha' and @fecha between @fecha and @fin
        )
        OR 
        (
            @tipo is null
        )
);

--select * from tipoMovimientoM(null,null,null)




GO
create function tipoMovimientoM(
    @tipo varchar(20) null, 
    @fecha date null, 
    @fin date null
)
returns table
as
return
(
    select 
        Bodega, 
        CantidadEntrada
    from 
        SacarIngreso
    where
        (
            @tipo = 'mes(año)' and year(@fecha) = year(getdate()) and month(@fecha) = month(getdate())
        )
        or 
        (
            @tipo = 'RangoFecha' and @fecha between @fecha and @fin
        )
        or 
        (
            @tipo is null
        )

);





--Funcion por si el usuario prefiere si es de entrada o salida

--Este no funciona hay que cambiarlo


--Este no funciona hay que cambiarlo







--TODO ESTO ES PARA LAS COTIZACIONES POR DEPARTAMENTO

--Esto es para ver las cotizaciones por departamento
go 
create view comparacionDepartamentoC as
select d.Nombre as Departamento, sum(lc.CantidadProducto * a.PrecioEstandar) as MontoxDeparmento, C.FechaCotizacion from ListaCotizacion as lc 
join Cotizacion as c on lc.CodigoCotizacion = c.Codigo
join Empleado as e on c.CedulaEmpleado = e.Cedula
join Articulo as a on lc.CodigoProducto = a.Codigo
join Departamento as d on e.CodigoDepartamento = d.Codigo
group by 
	d.Nombre,
	C.FechaCotizacion

	--select * from comparacionDepartamentoC
go
CREATE FUNCTION cotizacionespordepartamento (
    @tipo varchar(20), 
    @fecha date, 
    @fechafin date null
)
returns table
as
return
(
    select 
        Departamento,
        sum(MontoxDeparmento) as MontoCotizaciones
    from 
        comparacionDepartamentoC
    where 
        (@tipo = 'mes(año)' 
         and year(FechaCotizacion) = year(@fecha) 
         and month(FechaCotizacion) = month(@fecha))
        or 
        (@tipo = 'rangofecha' 
         and FechaCotizacion between @fecha and isnull(@fechafin, @fecha))
    group by 
        Departamento
);


--TODO ESTO ES PARA LAS COTIZACIONES POR DEPARTAMENTO



--TODO ESTO ES PARA LAS COTIZACIONES POR FACTURA

	--Este es es el de Ventas por departamento
go 
create view comparacionDepartamento as
select d.Nombre as Departamento, sum(lf.CantidadProducto * a.PrecioEstandar) as MontoxDeparmento, f.FechaFactura as Fecha from ListaFactura as lf  
join Factura as f on lf.CodigoF = f.Codigo
join Empleado as e on f.CedulaEmpleado = e.Cedula
join Articulo as a on lf.Codigo = a.Codigo
join Departamento as d on e.CodigoDepartamento = d.Codigo
group by 
	d.Nombre,
	f.FechaFactura

--Este es el nuevo de ventas por departamento 
go
create function ventaspordepartamento (
    @tipo varchar(20), 
    @fecha date, 
    @fechafin date null
)
returns table
as
return
(
    select 
        Departamento as Departamento,
        sum(MontoxDeparmento) as MontoVentas
    from 
        comparacionDepartamento
    where 
        (@tipo = 'mes(año)' 
         and year(Fecha) = year(@fecha) 
         and month(Fecha) = month(@fecha))
        or 
        (@tipo = 'rangofecha' 
         and Fecha between @fecha and isnull(@fechafin, @fecha))
    group by 
        Departamento
);
--TODO ESTO ES PARA LAS  VENTAS POR FACTURA




--ASI ES COMO DEBE DE FUNCIONAR LAS FUNCIONES s
go
create function ventaspordepartamento2(
    @tipo varchar(20),
    @fecha date,
    @fechafin date null
)
returns table
as
return
(
    select 
        cd.Departamento,
        cd.MontoxDeparmento as montoventas
    from comparacionDepartamento as cd
    where 
        (@tipo = 'mes(año)' and year(cd.Fecha) = year(@fecha) and month(cd.Fecha) = month(@fecha))
        or 
        (@tipo = 'rangofecha' and cd.Fecha between @fecha and isnull(@fechafin, @fecha))
);

-- Probar la función para un mes específico del año
--select * 
--from dbo.ventaspordepartamento('mes(año)', '2024-11-01', null);








--Este es para ver el top 10 productos cotizados
go
create procedure productoscot
    @tipo varchar(20)
as
begin
    if @tipo = 'ascendente'
    begin
        select top 10 
            a.descripcion as descripcion, 
            sum(lc.cantidadproducto) as cantidadtotal
        from listacotizacion as lc
        join articulo as a on lc.codigoproducto = a.codigo
        group by a.descripcion
        order by sum(lc.cantidadproducto) asc;
    end
    else
    begin
        select top 10 
            a.descripcion as descripcion, 
            sum(lc.cantidadproducto) as cantidadtotal
        from listacotizacion as lc
        join articulo as a on lc.codigoproducto = a.codigo
        group by a.descripcion
        order by sum(lc.cantidadproducto) desc;
    end
end;


--exec ProductosCot 'Ascendente'





--Ventas y cotizaciones por mes, por año
--drop view cotizacionesMes
go
create view  cotizacionesMes as
select month(c.FechaCotizacion) as mesCotizacion, year(c.FechaCotizacion) as añoCotizacion ,  sum(lc.CantidadProducto * a.PrecioEstandar) as total, 'Cotizacion' as tipo from ListaCotizacion as lc
join Cotizacion as c on lc.CodigoCotizacion = c.Codigo
join Articulo as a on lc.CodigoProducto = a.Codigo
group by month(c.FechaCotizacion), year(c.FechaCotizacion)

go
select * from cotizacionesMes

--drop view VentasMes
go
create view VentasMes as 
select month(f.FechaFactura) as mesFactura,  year(f.FechaFactura) as añoFactura,  sum(lf.CantidadProducto *  a.PrecioEstandar) as total, 'Venta' as tipo
 from ListaFactura as lf
join Factura as f on lf.CodigoF = f.Codigo
join Articulo as a on lf.Codigo = a.Codigo
group by month(f.FechaFactura), year(f.FechaFactura)

--select * from VentasMes

go
create function Combinado()
returns table
as
return
(
    select 
        mesCotizacion as mes, 
        añoCotizacion as año, 
        total, 
        tipo
    from 
        cotizacionesMes
    union all
    select 
        mesFactura as mes, 
        añoFactura as año, 
        total, 
        tipo
    from 
        VentasMes
)

--select * from Combinado()



--Todo esto es Cantidad de clientes por zona y monto ventas por zona. 

--drop view ClientesZonaVentas
go
create view ClientesZonaVentas as
select 
    z.Nombre as Zona, 
    count(distinct c.Cedula) as ClientesZona, 
    sum(lf.CantidadProducto * a.PrecioEstandar) as TotalVenta,  
	f.FechaFactura
from 
    ListaFactura as lf
join 
    Factura as f on lf.CodigoF = f.Codigo
join 
    Cliente as c on f.CedulaCliente = c.Cedula
join 
    Articulo as a on lf.Codigo = a.Codigo
join 
    Zona as z on c.Zona = z.Nombre
group by 
    z.Nombre,
	f.FechaFactura

	--select * from ClientesZonaVentas


go	
create function verClientesZonasAscendente(@tipo varchar(20) null, @fecha date null, @fin date null)
returns table
as
return
(
    select top 100 
        Zona,
        ClientesZona,
        TotalVenta,
        FechaFactura
    from 
        ClientesZonaVentas
    where 
        (
            @tipo = 'mes(año)' and year(FechaFactura) = year(@fecha) and month(FechaFactura) = month(@fecha)
        )
        or 
        (
            @tipo = 'RangoFecha' and FechaFactura between @fecha and @fin
        )
        or 
        (
            @tipo is null
        )
    order by ClientesZona asc  -- Orden ascendente
);




go
create function verClientesZonasDescendente(@tipo varchar(20) null, @fecha date null, @fin date null)
returns table
as
return
(
    select top 100 
        Zona,
        ClientesZona,
        TotalVenta,
        FechaFactura
    from 
        ClientesZonaVentas
    where 
        (
            @tipo = 'mes(año)' and year(FechaFactura) = year(@fecha) and month(FechaFactura) = month(@fecha)
        )
        or 
        (
            @tipo = 'RangoFecha' and FechaFactura between @fecha and @fin
        )
        or 
        (
            @tipo is null
        )
    order by ClientesZona desc  
);


--drop view verTop15Tareas
go
create view verTop15TareasASC as
select top 15 CodigoTarea, Fecha, Descripcion, Estado 
from Tarea 
where Estado = 'En proceso' or Estado = 'Iniciada'
order by Fecha ASC



go
create view verTop15TareasDESC as
select top 15 CodigoTarea, Fecha, Descripcion, Estado 
from Tarea 
where Estado = 'En proceso' or Estado = 'Iniciada'
order by Fecha desc

--select * from verTop15Tareas


--drop function verTareasAsc
-- Crear la función que devuelve tareas filtradas según tipo y rango de fechas
go
create function verTareasDesc(
    @tipo varchar(20) null, 
    @fecha date null, 
    @fin date null
)
returns table
as
return
(
    select 
        CodigoTarea, 
        Fecha, 
        Descripcion, 
        Estado
    from 
        verTop15TareasDESC  
    where 
        (
            @tipo = 'mes(año)' and year(Fecha) = year(@fecha) and month(Fecha) = month(@fecha)
        )
        or 
        (
            @tipo = 'RangoFecha' and Fecha between @fecha and @fin
        )
        or 
        (
            @tipo is null
        )
);
GO



--select * from verTareasAsc(null,null,null)

go
create function verTareasAsc(
    @tipo varchar(20) null, 
    @fecha date null, 
    @fin date null
)
returns table
as
return
(
    select 
        CodigoTarea, 
        Fecha, 
        Descripcion, 
        Estado
    from 
        verTop15TareasASC 
    where 
        (
            @tipo = 'mes(año)' and year(Fecha) = year(@fecha) AND month(Fecha) = month(@fecha)
        )
        or 
        (
            @tipo = 'RangoFecha' AND Fecha BETWEEN @fecha AND @fin
        )
        or 
        (
            @tipo is null
        )
);
GO


--drop view
--Revisar si borrar
select b.Nombre as Bodega, sum(lf.CantidadProducto) as TotalTransados
from ListaFactura as lf
join Factura as f on lf.CodigoF = f.Codigo
join Articulo as a on lf.Codigo = a.Codigo
join FamiliaBodega as fb on a.CodigoFamilia = fb.CodigoFamilia
join Bodega as b on fb.CodigoBodega = b.Codigo
group by b.Nombre


--drop view transadosentrada
go

create view transadosentrada as
select 
    b.Nombre as Bodega, 
    sum(lf.CantidadProducto) as TotalTransados, 
    f.FechaFactura
from 
    ListaFactura as lf
join 
    Factura f on lf.CodigoF = f.Codigo
join 
    Articulo a on lf.Codigo = a.Codigo
join 
    FamiliaBodega fb on a.CodigoFamilia = fb.CodigoFamilia
join 
    Bodega b on fb.CodigoBodega = b.Codigo
group by 
    b.Nombre, f.FechaFactura;

go

create view transadosSalida as
SELECT 
    b.Nombre as Bodega, 
    sum(sm.Cantidad) as TotalTransados, 
    sm.Fecha
from 
    SalidaMovimiento as sm
join 
    Bodega as b on sm.CodigoBodega = b.Codigo
join 
    Articulo as a on sm.CodigoProducto = a.Codigo
group by 
    b.Nombre, sm.Fecha;

go
--	select * from transadosentrada
	--drop view transadosTotales

create view transadosTotales as
select 
    te.Bodega,
    isnull(te.TotalTransados, 0) + isnull(ts.TotalTransados, 0) as TotalTransados,
    te.FechaFactura as FechaEntrada,
    ts.Fecha as FechaSalida
from 
    transadosentrada as te
left join 
    transadosSalida as ts ON te.Bodega = ts.Bodega;


	--select * from transadosTotales
go


	--select * from transadosSalida


	--drop function BodegasTransadosf

create function BodegasTransadosf (
    @tipo varchar(20) NULL, 
    @fecha date NULL, 
    @fin date NULL
)
returns table
as
return
(
    select 
        te.Bodega,
        isnull(sum(te.TotalTransados), 0) + isnull(sum(ts.TotalTransados), 0) as TotalTransados,
        te.FechaFactura 
    from 
        transadosentrada as te
    left join 
        transadosSalida as ts on te.Bodega = ts.Bodega
    where
        (
            (@tipo is null) or

            (@tipo = 'mes(año)' and 
                year(te.FechaFactura) = year(@fecha) and 
                month(te.FechaFactura) = month(@fecha)
            ) or

            (@tipo = 'rangoFecha' and 
                te.FechaFactura between @fecha and isnull(@fin, @fecha)
            )
        )
    group by
        te.Bodega, te.FechaFactura  -- Agrupar por Bodega y FechaFactura
);




--select * from dbo.BodegasTransadosf(null,null,null)












go
create function BodegasTransados (
    @tipo varchar(20) NULL, 
    @fecha date NULL, 
    @fin date NULL
)
returns table
as
return
(
    select 
        te.Bodega,
        isnull(sum(te.TotalTransados), 0) + isnull(sum(ts.TotalTransados), 0) as TotalTransados
    from 
        transadosentrada as te
    left join 
        transadosSalida as ts on te.Bodega = ts.Bodega
    where
        (
            (@tipo is null) or

            (@tipo = 'mes(año)' and 
                year(te.FechaFactura) = year(@fecha) AND 
                month(te.FechaFactura) = month(@fecha)
            ) or

            (@tipo = 'rangoFecha' and 
                te.FechaFactura between @fecha and isnull(@fin, @fecha)
            )
        )
    group by
        te.Bodega  
);

--select *



--select * from dbo.BodegasTransados(null,null,null)





--Estos son sin filtro

--drop view transadosentradaNOF
go
create view transadosentradaNOF as
select 
    b.Nombre as Bodega, 
    sum(lf.CantidadProducto) as TotalTransados
from 
    ListaFactura as lf
join 
    Factura as f on lf.CodigoF = f.Codigo
join 
    Articulo as a on lf.Codigo = a.Codigo
join 
    FamiliaBodega as fb on a.CodigoFamilia = fb.CodigoFamilia
join 
    Bodega as b on fb.CodigoBodega = b.Codigo
group by 
    b.Nombre;


	--select * from transadosentradaNOF

	--drop view transadosTotalesNOF
go
create view transadosTotalesNOF as
select 
    te.Bodega,
    isnull(sum(te.TotalTransados), 0) + isnull(sum(ts.TotalTransados), 0) as TotalTransados
from 
    transadosentrada te
left join 
    transadosSalida ts on te.Bodega = ts.Bodega
group by 
    te.Bodega;

go
	--select * from transadosTotalesNOF


--	select * from transadosTotalesNOF

create view transadosSalidaNOF as
select 
    b.Nombre as Bodega, 
    sum(sm.Cantidad) as TotalTransados
from 
    SalidaMovimiento as sm
join 
    Bodega as b on sm.CodigoBodega = b.Codigo
join 
    Articulo as a on sm.CodigoProducto = a.Codigo
group by 
    b.Nombre;

	--select * from transadosSalidaNOF






--SELECT * FROM dbo.BodegasTransados(null,null,null) ORDER BY TotalTransados desc