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
('Pacifico sur',100 ,'Muchas playas y vegetaci�n'),
('Pacifico norte',300 ,'Mucho sol y climas calidos'),
('Pacifico central',250 ,'Muchas playas y esta llena de bosque y otros atractivos'),
('Caribe norte',100 ,'Mucha flora y fauna en exceso'),
('Caribe sur', 100,'Las mejores playas y lugar de mucha cultura'),
('Valle central', 400,'Donde hay m�s poblaci�n y muchas oportunidades de crecimiento'),
('Zona norte',200 ,'Mucha tierra y muchos cultivos de ca�a y arroz');


CREATE TABLE Sector (
	Nombre VARCHAR(20) UNIQUE NOT NULL,
	Descripcion VARCHAR(200),
	PRIMARY KEY (Nombre)
);

INSERT INTO Sector (Nombre, Descripcion) VALUES
('Econ�mico', 'Relaciono con la producci�n y venta de productos.'),
('Constructor', 'Sector dedicado a la construcci�n de edificios, infraestructuras y obras p�blicas.'),
('Tecnol�gico', 'En busca de desarrollo y uso de tecnolog�a en diversos �mbitos.'),
('Salud', 'Sector que abarca servicios m�dicos, farmac�uticos y de bienestar.'),
('Educaci�n', 'Sector que se ocupa de la ense�anza y formaci�n en todos los niveles.'),
('Industrial', 'Sector que engloba la producci�n de bienes en f�bricas.'),
('Transporte', 'Sector relacionado con el movimiento de personas y mercanc�as.'),
('Energ�a', 'Sector que abarca la producci�n y distribuci�n de energ�a.'),
('Comercial', 'Sector dedicado a la venta de productos y servicios al por menor.'),
('Cultural', 'Sector que abarca actividades relacionadas con la cultura y el arte.'),
('Deportivo', 'Sector que se enfoca en la pr�ctica de deportes.'),
('Automotriz', 'Sector dedicado a la fabricaci�n y venta de veh�culos.'),
('Telecomunicaciones', 'Sector que abarca servicios de comunicaci�n a distancia.'),
('Alimentaci�n', 'Sector que se ocupa de la producci�n y distribuci�n de alimentos.');






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
('Alta','Merece mucha atenci�n'),
('Media','No se debe descuidar'),
('Baja','Para hacer despu�s');


CREATE TABLE TipoCaso(
	Tipocaso VARCHAR(20) NOT NULL,
	Descripcion VARCHAR(200) NOT NULL,
	PRIMARY KEY (Tipocaso)
);

insert into TipoCaso(Tipocaso,Descripcion) values
('Reclamo','Se exige un reclamo por un error'),
('Devolucion','Se necesita abrir un caso para que devuelvan ciertos articulos'),
('Garantia','Un producto se da�o antes de lo esperado');


CREATE TABLE Departamento (
	Codigo VARCHAR(15) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	PRIMARY KEY(Codigo)
);
INSERT INTO Departamento(Codigo, Nombre) values
('DEP1', 'Mantenimiento'),
('DEP2', 'Ingenier�a'),
('DEP3', 'Log�stica'),
('DEP4', 'Administraci�n'),
('DEP5', 'Atenci�n al cliente'),
('DEP6', 'Ventas'),
('DEP7', 'Producci�n'),
('DEP8', 'Supervisi�n'),
('DEP9', 'Electricidad');



CREATE TABLE Modulos (
    IDModulo INT PRIMARY KEY,
    NombreModulo VARCHAR(50) UNIQUE NOT NULL,
    Descripcion VARCHAR(200)
);

INSERT INTO Modulos(IDModulo,NombreModulo,Descripcion) values
(1, 'Factura', 'Se le permite hacer cosas dentro de la factura'),
(2, 'Cotizacion', 'Se le permite hacer cosas dentro de la cotizaci�n'),
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
(2, 'Creacion', 'Se le permite todo con respecto a la creaci�n'),
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
('Ingeniero', 700000, 'Se encarga de dise�ar y elaborar planes para mejorar la eficiencia'),
('Control de Calidad', 480000, 'Garantiza que los productos cumplen con los est�ndares de calidad'),
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
	IDUsuario INT not null,
	SalarioActual int not null
	PRIMARY KEY(Cedula),
	FOREIGN KEY (tipoRol) references Roles(tipoRol),
	FOREIGN KEY (CodigoDepartamento) REFERENCES Departamento(Codigo),
	FOREIGN KEY (Puesto) REFERENCES Puesto(TipoPuesto),
	FOREIGN KEY (IDUsuario) REFERENCES Usuarios(IDUsuario) 
);
insert into Empleado(Cedula,Nombre,apellido1,apellido2,genero,FechaNacimiento,provincia,Direccion,Telefono,CodigoDepartamento,FechaIngreso,Puesto,tipoRol,IDUsuario,SalarioActual)
values
('123456789', 'Jose', 'Perez', 'Rodriguez', 'M', '1990-05-12', 'San Jos�', 'San pedro 50 metros norte', '22223333', 'DEP1', '2015-03-10', 'Electricista', 'Encargado', 1, 500000),
('987654321', 'Sofia', 'Lopez', 'Jimenez', 'F', '1985-09-15', 'Alajuela', 'Alajuelita underground', '22334455', 'DEP2', '2010-07-22', 'Ingeniero', 'Vendedor', 2, 700000),
('112233445', 'Fabian', 'Martinez', 'Solis', 'M', '1995-12-05', 'Heredia', 'Guarari', '22445566', 'DEP3', '2018-01-19', 'Control de Calidad', 'Bodeguero', 3, 480000),
('556677889', 'Valka', 'Gomez', 'Alvarado', 'F', '1992-03-28', 'Cartago', 'Lomas del sur', '22556677', 'DEP4', '2017-09-15', 'Administrador', 'Encargado', 4, 450000),
('334455667', 'Andres', 'Vargas', 'Campos', 'M', '1998-11-23', 'Puntarenas', 'Del faro a 30 metros', '22667788', 'DEP5', '2019-11-25', 'Recepcionista', 'Vendedor', 5, 320000),
('998877665', 'Clarisa', 'Castro', 'Mora', 'F', '1991-06-30', 'Guanacaste', 'Playa samara casa 50', '22778899', 'DEP6', '2016-04-13', 'Vendedor', 'Ayudante', 1, 500000);





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


CREATE TABLE Planilla (
	CodigoPlanilla VARCHAR(15) NOT NULL,
	FechaPlanilla date not null,   
	CedulaEmpleado varchar(9) not null,
	HorasRealizadas int not null,
	Salario int, 
	foreign key (CedulaEmpleado) references Empleado(Cedula),
	Primary key (CodigoPlanilla, CedulaEmpleado)

);


CREATE TABLE Familia (
	CodigoFamilia VARCHAR(15) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	activo varchar(20) not null,
	Descripcion VARCHAR(200) not null,
	PRIMARY KEY(CodigoFamilia)
);

INSERT INTO Familia(CodigoFamilia,Nombre,activo,Descripcion) values
('Fam1', 'Escolares', 'Si','Art�culos como lapices o borradores'),
('Fam2', 'Farmac�uticos', 'Si','Medicamentos y productos de salud '),
('Fam3', 'Electr�nica','Si', 'Componentes electr�nicos como chips o tecnolog�a implementada'),
('Fam4', 'Calzado','Si', 'Todo tipo de zapatos'),
('Fam5', 'Relojes y Joyas', 'No','Art�culos que son solo de lujo'),
('Fam6', 'Juguetes', 'Si','Art�culos para entretenimiento infantil'),
('Fam7', 'Alimentos', 'Si','Productos alimenticios enlatados, frescos, congelados'),
('Fam8', 'Bebidas', 'Si','L�quidos para consumo como refrescos, jugos, bebidas alcoh�licas y agua embotellada'),
('Fam9', 'Cosm�ticos', 'No','Productos de cuidado personal'),
('Fam10', 'Electrodom�sticos','Si', 'Aparatos el�ctricos para uso dom�stico'),
('Fam11', 'Limpieza', 'No','Productos hechos para limipiar'),
('Fam12', 'Herramientas', 'Si','Herramientas manuales y el�ctricas'),
('Fam13', 'Jardiner�a', 'No','Herramientas y productos para el cuidado de jardines'),
('Fam14', 'Automotriz', 'Si','Accesorios y repuestos para veh�culos'),
('Fam15', 'Construcci�n', 'Si','Materiales para la construcci�n '),
('Fam16', 'Deportes', 'No',' s deportivos hechos solo para deporte'),
('Fam17', 'Mascotas', 'Si','Productos para el cuidado de mascotas'),
('Fam18', 'Ropa', 'Si','Prendas de vestir'),
('Fam19', 'Muebles', 'Si','Art�culos de mobiliario'),
('Fam20', 'Libros', 'No','Todo tipo de literatura'),
('Fam21', 'Tecnolog�a', 'Si','Dispositivos electr�nicos'),
('Fam22', 'Iluminaci�n', 'No','Articulos hechos para iluminar la casa u oficinas'),
('Fam23', 'Material de Oficina', 'No','Art�culos necesarios para el trabajo'),
('Fam24', 'Beb�s', 'No','Productos para el cuidado de beb�s'),
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
('Fam1', 'ART1', 'L�piz HB', 'Si', 0.02, 0.5, 100.0, 'L�piz de grafito para escritura.'),
('Fam1', 'ART2', 'Cuaderno 100 hojas', 'No', 0.3, 1.5, 3000.0, 'Cuaderno de con 100 hojas rayadas.'),
('Fam1', 'ART3', 'Borrador blanco', 'Si', 0.01, 0.2, 100.4, 'Borrador de leche para l�piz.'),
('Fam1', 'ART4', 'Regla 30 cm', 'Si', 0.05, 0.7, 100.5, 'Regla pl�stica para medir.'),
('Fam1', 'ART5', 'Sacapuntas doble', 'No', 0.02, 0.3, 350.0, 'Sacapuntas para l�pices grandes y peque�os.'),
  
('Fam2', 'ART6', 'Ibuprofeno 200mg', 'Si', 0.01, 0.8, 2000.0, 'Tabletas para alivio del dolor.'),
('Fam2', 'ART7', 'Jarabe para la tos', 'No', 0.25, 3.0, 5000.0, 'Medicamento para calmar la tos.'),
('Fam2', 'ART8', 'Espadrapo', 'Si', 0.55, 1.0, 2000.5, 'espadrapo para soporte y compresi�n.'),
('Fam2', 'ART9', 'Anticonceptivos', 'Si', 0.1, 4.0, 10000.0, 'Prevenir embarazos.'),
('Fam2', 'ART10', 'Curitas adhesivas', 'No', 0.02, 0.4, 100.0, 'Tiras adhesivas para peque�as heridas.'),
  
('Fam3', 'ART11', 'GPU', 'No', 0.01, 200.0, 250000.0, 'Grafica para juegos.'),
('Fam3', 'ART12', 'Placa madre', 'Si', 3.5, 100.0, 120000.0, 'La que hace que una computadora funcione.'),
('Fam3', 'ART13', 'Pantalla LED', 'Si', 1.2, 80.0, 100000.0, 'Pantalla LED para dispositivos electr�nicos.'),
('Fam3', 'ART14', 'Cable HDMI', 'No', 0.15, 5.0, 1000.0, 'Cable para conectar dispositivos a pantallas.'),
('Fam3', 'ART15', 'Teclado inal�mbrico', 'No', 0.6, 20.0, 25000.0, 'Teclado sin cables para computadora.'),
  
('Fam4', 'ART16', 'tenis nike', 'Si', 0.8, 50.0, 75000.0, 'tenis para hacer deporte.'),
('Fam4', 'ART17', 'Botas de cuero', 'No', 1.2, 80.0, 100000.0, 'Botas resistentes de cuero.'),
('Fam4', 'ART18', 'Sandalias', 'No', 0.3, 25.0, 4000.0, 'Sandalias casuales.'),
('Fam4', 'ART19', 'Burros', 'Si', 6.7, 200.0, 25000.0, 'Para trabajar de verdad.'),
('Fam4', 'ART20', 'Zapatos formales', 'Si', 0.9, 70.0, 9000.0, 'Zapatos elegantes para eventos formales.'),
  
('Fam5', 'ART21', 'Reloj suizo', 'No', 0.15, 300.0, 3500000.0, 'Reloj anal�gico de lujo.'),
('Fam5', 'ART22', 'Collar de oro', 'Si', 0.02, 200.0, 250000.0, 'Collar hecho de oro de 18 quilates.'),
('Fam5', 'ART23', 'Anillo de diamantes', 'Si', 0.01, 500.0, 600000.0, 'Anillo con incrustaciones de diamantes.'),
('Fam5', 'ART24', 'Pulsera de Zafiro', 'No', 0.05, 150.0, 180000.0, 'Pulsera de Zafiro.'),
('Fam5', 'ART25', 'Aretes de perlas', 'Si', 0.01, 80.0, 100000.0, 'Aretes con perlas naturales.'),
  
('Fam6', 'ART26', 'Mu�eca de Barbie', 'No', 0.2, 20.0, 25000.0, 'Mu�eca transformable para jugar.'),
('Fam6', 'ART27', 'Terreneitor', 'Si', 0.1, 15.0, 200000.0, 'Carro para loquear.'),
('Fam6', 'ART28', 'Legos', 'Si', 0.3, 30.0, 35000.0, 'Mu�equitos armables.'),
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
('Fam9', 'ART45', 'L�piz labial', 'Si', 0.05, 5.0, 7000.0, 'L�piz labial de larga duraci�n.'),



('Fam10', 'ART46', 'Microondas','No', 1.3, 7.0, 5000.00,  'Horno de microondas para calentar alimentos.'),
('Fam10', 'ART47', 'Batidora' ,'Si',  1.2, 2.5, 13000.00, 'Batidora de mano para cocina.'),
('Fam10', 'ART48', 'Aspiradora' ,'No', 1.5, 4.0, 25000.00, 'Aspiradora para limpieza del hogar.'),
('Fam10', 'ART49', 'Tostadora' ,'Si', 1.4, 1.8, 10000.00, 'Tostadora el�ctrica para pan.'),
('Fam10', 'ART50', 'Cafetera' ,'Si',2.3, 2.0, 4000.00,  'Cafetera el�ctrica para preparar caf�.'),
  
('Fam11', 'ART51', 'Limpiador multiusos' ,'Si', 0.5, 0.75, 1200.00, 'Limpiador para todo tipo de superficies.'),
('Fam11', 'ART52', 'Detergente l�quido' ,'Si', 0.7, 1.0, 700.00, 'Detergente para lavar ropa.'),
('Fam11', 'ART53', 'Esponjas de limpieza' ,'No', 0.1, 0.05, 300.00, 'Esponjas para lavar platos y superficies.'),
  
('Fam12', 'ART54', 'Martillo' ,'Si', 7.2, 1.0, 5000.00, 'Martillo de acero y mango de madera para clavar.'),
('Fam12', 'ART55', 'Destornillador','Si', 2.2, 0.2, 2500.00, 'Destornillador plano y de cruz.'),
  
('Fam13', 'ART56', 'Tijeras de podar' ,'No', 4.4, 0.4, 7500.00, 'Tijeras para podar plantas.'),
('Fam13', 'ART57', 'Guantes de jardiner�a' ,'Si', 1.2, 0.2, 2000.00, 'Guantes para trabajar en el jard�n.'),
  
('Fam14', 'ART58', 'Bater�a de carros' ,'No', 14.2, 20.0, 70000.00, 'Bater�a para carros.'),
('Fam14', 'ART59', 'Aceite de motor' ,'Si', 1.5, 1.0, 20000.00, 'Aceite lubricante para motores.'),
  
('Fam15', 'ART60', 'Cemento' ,'Si', 20.3, 25.0, 15000.00, 'Saco de cemento para construcci�n.'),
('Fam15', 'ART61', 'Ladrillos' ,'No', 15.0, 3.0, 1000.00, 'Ladrillos para construir muros.'),
  
('Fam16', 'ART62', 'Bal�n de f�tbol' ,'No', 3.2, 0.5, 3500.00, 'Bal�n de f�tbol de tama�o oficial.'),
('Fam16', 'ART63', 'Raqueta de tenis' ,'Si', 2.0, 0.3, 12500.00, 'Raqueta ligera para jugar al tenis.'),
  
('Fam17', 'ART64', 'Comida para perros','No', 1.3, 1.5, 1500.00, 'Alimento seco para perros.'),
('Fam17', 'ART65', 'Arena para gatos' ,'Si', 1.5, 1.0, 1500.00, 'Arena absorbente para gatos.'),
  
('Fam18', 'ART66', 'Camisa de algod�n' ,'No', 1.4, 0.2, 10000.00, 'Camisa c�moda para uso diario.'),
('Fam18', 'ART67', 'Pantalones jeans' ,'Si', 1.3, 0.5, 13000.00, 'Pantalones de mezclilla.'),
  
('Fam19', 'ART68', 'Escritorio' ,'Si', 10.3, 10.5, 55000.00, 'Escritorio grande para trabajo.'),
('Fam19', 'ART69', 'Ropero' ,'No', 30.2, 30.0, 150000.00, 'Ropero gigante para 1 persona.'),
  
('Fam20', 'ART70', 'Novela' ,'No', 1.0, 1.5, 7000.00, 'Libro hecho para generar drama.'),
('Fam20', 'ART71', 'Comic' ,'Si', 1.0, 1.5, 3500.00, 'Libro de acci�n.'),
  
('Fam21', 'ART72', 'Celular' ,'No', 1.0, 5.5, 130000.00, 'Dispositivo para comunicarse y entretenerse.'),
('Fam21', 'ART73', 'Laptop' ,'Si', 5.0, 10.5, 200000.00,'Dispositivo para trabajar y portar a todo lado.'),
  
('Fam22', 'ART74', 'Lampara de pared','No', 1.3, 3.5, 4000.00, 'Lampara para iluminar un cuarto.'),
('Fam22', 'ART75', 'Lampara de techo' ,'Si', 1.5, 5.5, 5000.00, 'Lampara led para iluminar un lugar.'),
  
('Fam23', 'ART76', 'Grapadora' ,'Si', 0.8, 4.5, 1200.00, 'Para grapar hojas o documentos.'),
('Fam23', 'ART77', 'Impresora' ,'No', 7.3, 15.5, 20000.00, 'Impresora para imprimir hojas o documentos.'),
  
('Fam24', 'ART78', 'Pa�alito' ,'No', 1.8, 5.5, 3500.00, 'Por si el bebe est� quemado.'),
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
('123456789', '22223334', 'M', 'Juan P�rez', 'juaperezZeledon@mail.com', '22224444', 'Econ�mico', 'Zona norte', '80839796'),
('325543227', '33334444', 'F', 'Mar�a L�pez', 'marilopez@mail.com', '33335555', 'Tecnol�gico', 'Pacifico central', '70755432'),
('456789123', '44445555', 'M', 'Carlos Rodr�guez', 'carlosrodriguezzzzz@mail.com', '44446666', 'Industrial', 'Caribe sur', '60876543'),
('321654987', '55556666', 'F', 'Ana Mart�nez', 'anadel@mail.com', '55557777', 'Salud', 'Caribe norte', '56647890'),
('754323489', '66667777', 'M', 'Luis Fern�ndez', 'luisferna3421@mail.com', '66668888', 'Construcci�n', 'Valle central', '98763453'),
('432124368', '77778888', 'F', 'Laura G�mez', 'lauragoz@mail.com', '77779999', 'Comercial', 'Pacifico sur', '75623754'),
('153234558', '88889999', 'M', 'Pedro Jim�nez', 'pedronez@mail.com', '88880000', 'Alimentacion', 'Pacifico norte', '87357423'),
('533467853', '99990000', 'F', 'Carmen D�az', 'carmenz@mail.com', '99991111', 'Educacion', 'Zona norte', '93945412'),
('258932147', '11112222', 'M', 'Javier Morales', 'moralesjavier@mail.com', '11113333', 'Deportivo', 'Caribe sur', '45678976'),
('369253247', '22223334', 'F', 'Isabel Torres', 'isabel20torres@mail.com', '22224444', 'Cultural', 'Valle central', '23456843'),
('235754438', '54345765', 'M', 'Eladio Carri�n', 'EladioC@mail.com', '22224444', 'Econ�mico', 'Zona norte', '80839796'),
('754332564', '34535321', 'M', 'Mark Cuban', 'MarkCuban1@mail.com', '22223333', 'Energ�a', 'Pacifico central', '70755432'),
('432123478', '54357565', 'M', 'MYke Towers', 'TowersMyk35@mail.com', '44445544', 'Construcci�n', 'Caribe sur', '60876543'),
('564298645', '32476542', 'M', 'Rodrigo Chaves', 'Chavezzzz@mail.com', '55556643', 'Salud', 'Caribe norte', '56647890'),
('354215796', '86643354', 'F', 'Carolina Giraldo', 'GiradlCaro@mail.com', '66665432', 'Econ�mico', 'Valle central', '98763453'),
('642342123', '97314784', 'F', 'Shakira Isabel', 'WakaWaka@mail.com', '77775436', 'Econ�mico', 'Pacifico sur', '75623754'),
('653212356', '23462123', 'F', 'Katy Perry', 'Fireworks@mail.com', '88886543', 'Alimentacion', 'Pacifico norte', '87357423'),
('257543123', '69504832', 'F', 'Taylor Swift', 'SwiftTayTay@mail.com', '99991012', 'Tecnol�gico', 'Zona norte', '93945412'),
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
('Seguimiento','El empleado debe estar en constante vigilancia de la cotizaci�n para ver el progreso que esta tiene'),
('Archivacion','Guardar toda la informaci�n con respecto a una cotizaci�n en un documento especifico'),
('Orden','Generar una orden con la lista de productos de la cotizacion para revisar si estan disponibles'),
('Envio','Asegurarse de que el envio de los productos en caso de que se quieran se puedan enviar'),
('Documentaci�n','Generar todo el listado de los productos y cantidad que se va a requerir en un documento formal'),
('Control de calidad','Revisar que todos los productos que se quieran en la cotizacion esten en buen estado'),
('Revisi�n de precios','Revisar que todos los precios que fueron dados en la cotizaci�n sean los correctos'),
('Negociaci�n','Hablar con el cliente y persuadirlo para que realice la compra en el momento');




create table TipoTareaCaso (
	TipoTarea varchar(30) not null,
	descripcion varchar(200)not null,
	Primary key (TipoTarea)
)

insert into TipoTareaCaso(TipoTarea,descripcion) values
('Devolucion','Revisar el por qu� es que se debe devolver el producto'),
('Reclamo','Atender al cliente y verificar la situaci�n para aliviar el problema'),
('Garantia','Revisar la garant�a del producto e informale al cliente si es posible');



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
('T1', NULL,'Devolucion','2024/10/22','Tiene que mover la mercancia hasta el camion','Terminada'),
('T2', NULL, 'Reclamo', '2024/05/15', 'descargar equipo', 'Iniciada'),
('T3', NULL, 'Garantia', '2022/10/24', 'Saber como comunicarse con el cliente', 'En proceso'),
('T4', NULL, 'Devolucion', '2023/07/03', 'Tiene que verificar el tipo de producto a devolver', 'En proceso'),
('T5', NULL, 'Reclamo', '2024/06/28', 'debe revisar si el reclamo es valido', 'Iniciada'),
('T6', NULL, 'Garantia', '2022/12/31', 'Revisar si todav�a es valida y ver el producto', 'Terminada');





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
('Cotizacion de articulos','Es una cotizaci�n por toda la cantidad de articulos que se van a pedir');





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
('432124368','123456789','2020/10/15','2020/12/15','Cotizacion abierta','Abierta' ,0.25, 'Caribe norte','Alimentaci�n'),
('325543227','123456789','2024/11/05','2024/12/31','Cotizacion abierta','Abierta' ,0.50, 'Pacifico norte','Econ�mico'),
('456789123','123456789','2024/10/01','2025/10/12','Cotizacion abierta','Abierta' ,0.75, 'Zona norte','Energ�a'),
('321654987','123456789','2024/09/10','2026/05/05','Cotizacion abierta','Abierta' ,0.75, 'Valle central','Educaci�n'),
('754323489','123456789','2024/08/24','2025/06/12','Cotizacion abierta','Abierta' ,0.25, 'Caribe sur','Transporte'),
('564298645','123456789','2022/05/04','2025/12/13','Cotizacion abierta','Abierta' ,0.75, 'Pacifico sur','Educacion'),
('258932147','123456789','2023/01/09','2026/07/11','Cotizacion abierta','Abierta' ,0.50, 'Caribe norte','Telecomunicaciones'),
('153234558','123456789','2023/10/19','2026/04/03','Cotizacion abierta','Abierta' ,0.25, 'Zona norte','Alimentaci�n'),


('153234558','987654321','2024/07/06','2025/04/20','Cotizacion cerrada','Aprobado' ,0.50, 'Caribe sur','Comercial'),
('533467853','987654321','2024/06/14','2027/03/25','Cotizacion abierta','Abierta' ,0.50, 'Pacifico norte','Cultural'),
('258932147','987654321','2024/05/17','2025/02/12','Cotizacion abierta','Abierta' ,0.75, 'Pacifico central norte','Deportivo'),
('369253247','987654321','2024/04/20','2026/01/02','Cotizacion abierta','Abierta' ,0.25, 'Caribe norte','Alimentaci�n'),
('235754438','987654321','2024/03/22','2028/08/16','Cotizacion abierta','Abierta' ,0.25, 'Pacifico sur','Salud'),
('321234678','987654321','2023/07/28','2028/05/11','Cotizacion abierta','Abierta' ,0.25, 'Valle central','Deportivo'),
('564298645','987654321','2023/04/18','2027/01/12','Cotizacion abierta','Abierta' ,0.25, 'Pacifico norte','Industrial'),
('354215796','987654321','2022/12/09','2026/10/22','Cotizacion abierta','Abierta' ,0.25, 'Pacifico sur','Automotriz'),
('123456789','987654321','2022/11/27','2026/10/22','Cotizacion abierta','Abierta' ,0.25, 'Caribe sur','Cultural'),


('432124368','112233445','2024/02/24','2024/12/24','Cotizacion de articulos','Rechazado' ,0.75, 'Pacifico central','Econ�mico'),
('754332564','112233445','2024/01/15','2027/05/24','Cotizacion abierta','Abierta' ,0.50, 'Valle central','Tecnol�gico'),
('432123478','112233445','2024/12/07','2025/04/13','Cotizacion abierta','Abierta' ,0.75, 'Zona norte','Telecomunicaciones'),
('564298645','112233445','2024/11/21','2026/03/12','Cotizacion abierta','Abierta' ,0.25, 'Caribe norte','Automotriz'),
('354215796','112233445','2024/10/03','2028/02/06','Cotizacion abierta','Abierta' ,0.25, 'Caribe sur','Constructor'),
('533467853','112233445','2022/09/03','2029/01/16','Cotizacion abierta','Abierta' ,0.25, 'Caribe norte','Salud'),
('257543123','112233445','2022/08/03','2029/10/08','Cotizacion abierta','Abierta' ,0.25, 'Valle central','Energ�a'),
('642342123','112233445','2022/07/03','2029/12/02','Cotizacion abierta','Abierta' ,0.25, 'Zona norte','Comercial'),
('153234558','112233445','2022/06/03','2029/09/17','Cotizacion abierta','Abierta' ,0.25, 'Pacifico sur','Cultural'),



('642342123','556677889','2024/09/13','2025/09/03','Cotizacion de servicios', 'Aprobado',0.50, 'Pacifico norte','Constructor'),
('653212356','556677889','2024/08/25','2027/03/24','Cotizacion abierta','Abierta' ,0.50, 'Valle central','Tecnol�gico'),
('257543123','556677889','2024/07/17','2025/05/17','Cotizacion abierta','Abierta' ,0.75, 'Zona norte','Telecomunicaciones'),
('321232678','556677889','2024/06/14','2026/03/15','Cotizacion abierta','Abierta' ,0.25, 'Caribe norte','Automotriz'),
('354215796','556677889','2024/05/21','2028/02/12','Cotizacion abierta','Abierta' ,0.25, 'Caribe sur','Constructor'),
('258932147','556677889','2022/04/18','2028/04/04','Cotizacion abierta','Abierta' ,0.25, 'Caribe norte','Econ�mico'),
('533467853','556677889','2022/03/16','2028/07/06','Cotizacion abierta','Abierta' ,0.25, 'Pacifico central','Tecnol�gico'),
('153234558','556677889','2022/02/27','2028/09/05','Cotizacion abierta','Abierta' ,0.25, 'Valle central','Salud'),
('754332564','556677889','2022/01/09','2028/12/02','Cotizacion abierta','Abierta' ,0.25, 'Zona norte','Industrial'),
('123456789','556677889','2022/12/01','2028/01/01','Cotizacion abierta','Abierta' ,0.25, 'Pacifico sur','Deportivo'),




('533467853','334455667','2023/02/02','2026/04/12','Cotizacion preliminar','Abierta' ,0.25, 'Zona norte','Econ�mico'),
('235754438','334455667','2023/08/25','2025/10/27','Cotizacion abierta','Abierta' ,0.50, 'Valle central','Salud'),
('754332564','334455667','2023/07/17','2024/12/07','Cotizacion abierta','Abierta' ,0.75, 'Caribe sur','Industrial'),
('153234558','334455667','2023/06/14','2026/07/25','Cotizacion abierta','Abierta' ,0.25, 'Pacifico norte','Transporte'),
('257543123','334455667','2023/05/21','2025/04/05','Cotizacion abierta','Abierta' ,0.25, 'Caribe sur','Tecnl�gico'),
('123456789','334455667','2023/05/21','2022/12/15','Cotizacion abierta','Abierta' ,0.25, 'Zona norte','Educaci�n'),
('258932147','334455667','2023/05/21','2023/05/08','Cotizacion abierta','Abierta' ,0.25, 'Caribe norte','Transporte'),
('642342123','334455667','2023/05/21','2024/04/26','Cotizacion abierta','Abierta' ,0.25, 'Pacifico sur','Deportivo'),
('754323489','334455667','2023/05/21','2021/11/28','Cotizacion abierta','Abierta' ,0.25, 'Pacifico norte','Alimentaci�n'),
('321234678','334455667','2023/05/21','2021/03/01','Cotizacion abierta','Abierta' ,0.25, 'Valle central','Tecnol�gico'),



('754323489','998877665','2023/09/11','2024/05/15','Cotizacion de articulos', 'Rechazado',0.75,'Valle central','Deportivo'),
('235754438','998877665','2023/02/23','2025/10/27','Cotizacion abierta','Abierta' ,0.50, 'Pacifico norte','Tecnol�gico'),
('754332564','998877665','2023/01/13','2026/12/07','Cotizacion abierta','Abierta' ,0.75, 'Pacifico sur','Telecomunicaciones'),
('153234558','998877665','2023/12/06','2028/07/25','Cotizacion abierta','Abierta' ,0.25, 'Zona norte','Automotriz'),
('257543123','998877665','2023/07/15','2029/04/05','Cotizacion abierta','Abierta' ,0.25, 'Pacifico central','Deportivo'),
('432123478','998877665','2022/09/25','2029/04/05','Cotizacion abierta','Abierta' ,0.25, 'Pacifico central','Comercial'),
('564298645','998877665','2021/10/03','2029/04/05','Cotizacion abierta','Abierta' ,0.25, 'Pacifico central','Educaci�n'),
('153234558','998877665','2021/11/02','2029/04/05','Cotizacion abierta','Abierta' ,0.25, 'Pacifico central','Cultural'),
('123456789','998877665','2021/12/09','2029/04/05','Cotizacion abierta','Abierta' ,0.25, 'Pacifico central','Econ�mico');

--Hay 55

CREATE TABLE Caso (
    CodigoCaso VARCHAR(15) NOT NULL,
    PropietarioCaso VARCHAR(9) NOT NULL,
    OrigenCaso INT NOT NULL,
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
    FOREIGN KEY (OrigenCaso) REFERENCES Cotizacion(Codigo),
    FOREIGN KEY (PropietarioCaso) REFERENCES Cliente(Cedula),
    FOREIGN KEY (Prioridad) REFERENCES Prioridad(TipoPrioridad)
);

INSERT INTO Caso (CodigoCaso, PropietarioCaso, OrigenCaso, NombreCuenta, NombreContacto, Asunto, Direccion, Descripcion, EstadoCaso, TipoCaso, Prioridad) VALUES
('CS1', '754323489', 1, 'Personal', 'Salamar', 'Necesitamos una ayuda inmediata', 'San jose en el centro de la capital', 'Se tiene que verificar el tipo de ayuda que necesita', 'Abierta', 'Devolucion', 'Alta'),
('CS2', '369253247', 2, 'Empresarial', 'Dospinos', 'Queremos hablar con un encargado', 'Alajuela a un costado del mercado', 'Se procedera a enviar la queja al encargado', 'Aprobado', 'Devolucion', 'Alta'),
('CS3', '432124368', 3, 'Personal', 'Aurua', 'Tuvimos problemas', 'En San carlos debajo de una catarata', 'Se busca el tipo de problemas', 'Rechazado', 'Garantia', 'Baja'),
('CS4', '456789123', 4, 'Personal', 'Dianeys', 'Hubo un problema', 'En la casa habitacion #58 en limon', 'Se habla para ver el problema', 'Aprobado', 'Garantia', 'Baja'),
('CS5', '533467853', 5, 'Empresarial', 'Nike', 'Algo fallo en los pedidos', 'San jose a la par de amazon', 'Se indica el fallo que hubo', 'Abierta', 'Reclamo', 'Media'),
('CS6', '754323489', 6, 'Empresarial', 'Adidas', 'Es un asunto de urgencia', 'San jose por el mall san pedro', 'Se habla con el administrador', 'Rechazado', 'Reclamo', 'Media');




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
('FAC1', null, '123456789', '123456789', '900123456', '22223334', 'Ferreter�a El Buen Precio', '2024-01-15', 'Juan P�rez', 'Emitida'),
('FAC2', null, '325543227', '987654321', '900654321', '33334444', 'Librer�a Central', '2024-01-18', 'Mar�a L�pez', 'Pagada'),
('FAC3', null, '456789123', '112233445', '900789123', '44445555', 'Tecnolog�a y M�s', '2024-01-20', 'Carlos Rodr�guez', 'Cancelada'),
('FAC4', null, '321654987', '556677889', '900987654', '55556666', 'Consultorio M�dico', '2024-08-25', 'Ana Mart�nez', 'Emitida'),
('FAC5', null, '754323489', '334455667', '900345678', '66667777', 'Repuestos del Valle', '2025-08-30', 'Luis Fern�ndez', 'Pagada'),
('FAC6', null, '432124368', '998877665', '900876543', '77778888', 'Mercado del Pueblo', '2026-02-03', 'Laura G�mez', 'Emitida'),
('FAC7', null, '153234558', '123456789', '900567890', '88889999', 'Tienda del Norte', '2028-09-07', 'Pedro Jim�nez', 'Pagada'),
('FAC8', null, '533467853', '987654321', '900123789', '99990000', 'Electr�nica Universal', '2025-02-12', 'Carmen D�az', 'Cancelada'),
('FAC9', null, '258932147', '112233445', '900987321', '11112222', 'Supermercado Caribe', '2024-02-15', 'Javier Morales', 'Emitida'),
('FAC10', null, '369253247', '556677889', '900543216', '22223334', 'Moda Latina', '2023-02-19', 'Isabel Torres', 'Pagada'),
('FAC11', null, '235754438', '334455667', '900789654', '54345765', 'Comercial Guayac�n', '2022-02-25', 'Eladio Carri�n', 'Emitida'),
('FAC12', null, '754332564', '998877665', '900234567', '34535321', 'Distribuidora Central', '2022-02-28', 'Mark Cuban', 'Cancelada'),
('FAC13', null, '432123478', '123456789', '900654321', '54357565', 'Hogar y Construcci�n', '2022-03-05', 'MYke Towers', 'Emitida'),
('FAC14', null, '564298645', '987654321', '900876345', '32476542', 'Farmacia Amiga', '2022-01-10', 'Rodrigo Chaves', 'Pagada'),
('FAC15', null, '354215796', '112233445', '900234789', '86643354', 'Electrodom�sticos Centro', '2022-03-15', 'Carolina Giraldo', 'Emitida'),
('FAC16', null, '642342123', '556677889', '900543789', '97314784', 'Moda y Estilo', '2024-01-20', 'Shakira Isabel', 'Cancelada'),
('FAC17', null, '653212356', '334455667', '900321654', '23462123', 'Abastecedor del Sur', '2023-07-25', 'Katy Perry', 'Pagada'),
('FAC18', null, '257543123', '998877665', '900567321', '69504832', 'Super del Norte', '2023-07-28', 'Taylor Swift', 'Emitida'),
('FAC19', null, '321234678', '123456789', '900654789', '43211257', 'Almacen del Pac�fico', '2023-07-01', 'Sofia Vergara', 'Pagada'),
('FAC20', null, '642342123', '987654321', '900321987', '55557788', 'Bazar Oriental', '2023-04-04', 'Laura Gomez', 'Cancelada'),
('FAC21', null, '456789123', '987654321', '123456789', '23457899', 'Maderas del Caribe', '2024-11-04', 'Carlos Rodr�guez', 'Emitida'),
('FAC22', null, '754323489', '556677889', '987654321', '55512345', 'Constructora Los Andes', '2024-11-10', 'Luis Fern�ndez', 'Pagada'),
('FAC23', null, '321654987', '334455667', '456789123', '31254798', 'Tienda Futuro', '2024-01-15', 'Ana Mart�nez', 'Cancelada'),
('FAC24', null, '258932147', '112233445', '654321987', '34765213', 'Hotel Mirador', '2024-02-03', 'Javier Morales', 'Emitida'),
('FAC25', null, '369253247', '998877665', '678910111', '23876598', 'Ferreter�a Central', '2024-02-10', 'Isabel Torres', 'Pagada'),
('FAC26', null, '533467853', '123456789', '234567890', '54897265', 'Distribuidora Norte', '2024-12-12', 'Carmen D�az', 'Cancelada'),
('FAC27', null, '754332564', '987654321', '876543219', '23984765', 'Constructora Sure�a', '2024-12-20', 'Mark Cuban', 'Emitida'),
('FAC28', null, '257543123', '556677889', '234567899', '48572139', 'Tienda La Modernidad', '2024-12-27', 'Taylor Swift', 'Pagada'),
('FAC29', null, '321234678', '334455667', '123098456', '92384765', 'Caf� Aroma', '2024-03-05', 'Sofia Vergara', 'Emitida'),
('FAC30', null, '533467853', '112233445', '234876543', '89532476', 'Panader�a Delicias', '2024-03-10', 'Eladio Carri�n', 'Cancelada'),
('FAC31', null, '235754438', '998877665', '112233445', '32457893', 'Soda El Sabor', '2024-03-15', 'Pedro Jim�nez', 'Pagada'),
('FAC32', null, '754332564', '987654321', '345678901', '12345987', 'Electr�nica Mundial', '2024-03-22', 'Mark Cuban', 'Emitida'),
('FAC33', null, '564298645', '556677889', '987654321', '65982345', 'Supermercado Eco', '2024-03-28', 'Rodrigo Chaves', 'Pagada'),
('FAC34', null, '432124368', '334455667', '987654322', '35478965', 'Farmacia Salud', '2023-04-01', 'Laura G�mez', 'Emitida'),
('FAC35', null, '153234558', '112233445', '345098765', '82745693', 'Lavander�a Express', '2024-06-05', 'Pedro Jim�nez', 'Cancelada'),
('FAC36', null, '235754438', '998877665', '112233445', '63584729', 'Centro Veterinario', '2024-06-15', 'Pedro Jim�nez', 'Emitida'),
('FAC37', null, '754332564', '987654321', '567890123', '38476521', 'Automotriz Sur', '2023-04-20', 'Mark Cuban', 'Pagada'),
('FAC38', null, '369253247', '556677889', '456789321', '56723984', 'Gimnasio Power', '2024-05-28', 'Isabel Torres', 'Cancelada'),
('FAC39', null, '432123478', '334455667', '789654321', '39284576', 'Construcci�n Heredia', '2024-05-01', 'MYke Towers', 'Emitida'),
('FAC40', null, '564298645', '112233445', '678543219', '92384756', 'Tienda El Progreso', '2023-05-08', 'Rodrigo Chaves', 'Pagada');




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
('ART31', 3, 'FAC20'),
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


CREATE TABLE IngresoInventario (
    IDIngreso INT IDENTITY(1,1) NOT NULL,
    CedulaEmpleado VARCHAR(9) NOT NULL,
    BodegaDestino VARCHAR(15) NOT NULL,
    Fecha DATETIME,
    PRIMARY KEY (IDIngreso, BodegaDestino),  
    FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(Cedula),
    FOREIGN KEY (BodegaDestino) REFERENCES Bodega(Codigo)
);

CREATE TABLE ListaIngreso (
    IDIngreso INT NOT NULL,
    BodegaDestino VARCHAR(15) NOT NULL, 
    CodigoArticulo VARCHAR(15) NOT NULL,
    CantidadIngresada INT NOT NULL,
    PRIMARY KEY (CodigoArticulo, IDIngreso, BodegaDestino),
    FOREIGN KEY (CodigoArticulo) REFERENCES Articulo(Codigo),
    FOREIGN KEY (IDIngreso, BodegaDestino) REFERENCES IngresoInventario(IDIngreso, BodegaDestino)
);




--Esto iria despues de la creacion de la factura
CREATE TABLE SalidaMovimiento(
	IDFactura VARCHAR(15) not null,
	CodigoProducto VARCHAR(15) not null,
	CodigoBodega VARCHAR(15) not null,
	Cantidad int not null,
	PRIMARY KEY(IDFactura, CodigoProducto,CodigoBodega),
	FOREIGN KEY (CodigoProducto) REFERENCES Articulo(Codigo),
	FOREIGN KEY (CodigoBodega) REFERENCES Bodega(Codigo),
	FOREIGN KEY (IDFactura) REFERENCES Factura(Codigo)
);





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