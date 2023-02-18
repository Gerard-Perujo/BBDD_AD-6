CREATE DATABASE IF NOT EXISTS Parque_Hojiblanca;
USE Parque_hojiblanca;

/* desactivamos las llaves para poder insertar los datos y no nos de error*/

SET FOREIGN_KEY_CHECKS = 0;


/* creamos todas las tablas del DER */

CREATE TABLE `PARQUE NATURAL` (
		`CodPn` int(10) not null,
        `Nombre` varchar(15),
        `FechaDeclaracion` date not null
        );
        
CREATE TABLE `VISITANTE`(
		`DNI` int(9) not null,
        `Nombre` varchar(15),
        `Domicilio` varchar(30),
        `Profesion` varchar(15)
        );
        
CREATE TABLE `COMUNIDAD AUTONOMA`(
		`CodCA`  int(9) not null,
        `Nombre` varchar(15),
        `OrgResponsable` varchar(50)
        );
        
CREATE TABLE `EXCURSION`(
		`CodExcursion` int(15) not null,
        `Fecha` date,
        `Hora`  datetime,
        `apie` varchar(20),
        `CodAlojamiento` int(20) not null
        );
        
CREATE TABLE `ALOJAMIENTO`(
		`CodAlojamiento` int(20)not null,
        `Categoria` varchar(20),
        `Capacidad` int(20),
        `CodPN` int(20) not null
        );
        
CREATE TABLE `ENTRADA`(
		`CodEntrada` int(20) not null,
        `CodPN` int(20) not null
        );
        
CREATE TABLE `PERSONAL`(
		`DNI` int(9) not null,
        `NSS` int(20),
        `Nombre` varchar(15),
        `Direccion` varchar(30),
        `TfnoDomicilio` int(20),
        `TfnoMovil` int(20),
        `Sueldo` int(50),
        `CodPN` int(20) not null
        );
        
        
CREATE TABLE `ESPECIE`(
		`CodEspecie` int(15) not null,
        `NombreCientifico` varchar(30),
        `NombreVulgar` varchar(30)
        );
        
CREATE TABLE `ANIMAL`(
		`CodEspecie` int(15) not null,
        `Alimentacion` varchar(30),
        `PeriodoCelo` varchar(30)
        );
        
CREATE TABLE `VEGETAL`(
		`CodEspecie` int(15) not null,
        `Floracion` varchar(30),
        `PeriodoFloracion` varchar(30)
        );
        
CREATE TABLE `MINERAL`(
		`CodEspecie` int(15) not null,
		`Tipo` varchar(20)
		);
    
CREATE TABLE `AREA`(
		`NombreA` varchar(20) not null,
        `Extension` int(20),
        `CodPN` int(20) not null
        );
        
CREATE TABLE `VEHICULO`(
		`Matricula` varchar(15) not null,
        `Tipo` varchar(15),
        `DNI` int(9)
        );
        
CREATE TABLE `PROYECTO`(
		`CodProy` int(20) not null,
        `Presupuesto` int(50),
        `FechaInicio` date,
        `FechaFin` date,
        `CodEspecie` int(15) not null
        );
        
CREATE TABLE `CONSERVADOR`(
		`DNI` int(9) not null,
        `Tarea` varchar(20),
        `NombreA` varchar(20) not null
        );
        
CREATE TABLE `VIGILANTE`(
		`DNI` int(9) not null,
        `NombreA` varchar(20) not null
        );
        
CREATE TABLE `INVESTIGADOR`(
		`DNI` int(9)  not null,
        `Titulacion` varchar(20)
        );
        
CREATE TABLE `GESTOR`(
		`DNI` int(9) not null,
        `CodEntrada` int(20) not null
        );
        
CREATE TABLE `E-V`(
		`CodExcursion` int(15) not null,
        `DNI`  int(9)
        );
        
CREATE TABLE `A-V`(
		`CodAlojamiento` int(20) not null,
        `DNI`  int(9),
        `FechaInicio` date,
        `FechaFin` date
        );
        
CREATE TABLE `CA-PN`(
		`CodCA` int(9) not null,
        `CodPN` int(20) not null,
        `Superficie` int(30)
        );
        
CREATE TABLE `E-A`(
		`CodEspecie` int(15) not null,
        `CodArea` varchar(20),
        `CantIndividuos` int(50)
        );
        
CREATE TABLE `I-P`(
		`CodProy` int(20) not null,
        `DNI` int(9) not null
        );
        
	/* ahora que tenemos creadas todas las tablas crearemos los indices */
    
    ALTER TABLE `VISITANTE`
		add primary key (`DNI`);
        
	ALTER TABLE `E-V`
		add primary key (`CodExcursion`),
        add key (`CodExcursion`),
        add key (`DNI`);
        
	ALTER TABLE `EXCURSION`
		add primary key (`CodExcursion`),
        add key (`CodExcursion`),
        add key (`CodAlojamiento`);
        
	ALTER TABLE `ALOJAMIENTO`
		 add primary key (`CodAlojamiento`),
         add key (`CodAlojamiento`),
         add key (`CodPN`);
         
	ALTER TABLE `A-V`
		add primary key (`FechaInicio`),
        add key (`FechaInicio`),
        add key (`CodAlojamiento`),
        add key (`DNI`);
        
	ALTER TABLE `COMUNIDAD AUTONOMA`
		add primary key (`CodCA`);
        
	ALTER TABLE `CA-PN`
		add primary key (`CodCA`),
        add key (`CodCA`),
        add key (`CodPN`);
        
	ALTER TABLE `PARQUE NATURAL`
		add primary key (`CodPN`);
        
	ALTER TABLE `ENTRADA`
		add primary key (`CodEntrada`),
        add key (`CodEntrada`),
        add key (`CodPN`);
        
	ALTER TABLE `PERSONAL`
		add primary key (`DNI`),
        add key (`DNI`),
        add key (`CodPN`);
        
	ALTER TABLE `E-A`
		add primary key (`CodEspecie`),
        add key (`CodEspecie`),
        add key (`CodArea`);
        
	ALTER TABLE `ESPECIE`
		add primary key (`CodEspecie`);
        
	ALTER TABLE `ANIMAL`
		add primary key (`CodEspecie`),
        add key (`CodEspecie`);
        
	ALTER TABLE `AREA`
		add primary key (`NombreA`),
        add key (`NombreA`),
        add key (`CodPN`);
        
	ALTER TABLE `CONSERVADOR`
		add primary key (`DNI`),
        add key (`DNI`),
        add key (`NombreA`);
        
	ALTER TABLE `VIGILANTE`
		add primary key (`DNI`),
        add key (`DNI`),
        add key (`NombreA`);
        
	ALTER TABLE `VEHICULO`
		add primary key (`Matricula`),
        add key (`Matricula`),
        add key (`DNI`);
        
	ALTER TABLE `VEGETAL`
		add primary key (`CodEspecie`),
        add key (`CodEspecie`);
        
	ALTER TABLE `MINERAL`
		add primary key (`CodEspecie`),
        add key (`CodEspecie`);
        
	ALTER TABLE `I-P`
		add primary key (`CodProy`),
        add key (`CodProy`),
        add key (`DNI`);
        
	ALTER TABLE `INVESTIGADOR`
		add primary key (`DNI`),
        add key (`DNI`);
        
	ALTER TABLE `GESTOR`
		add primary key (`DNI`),
        add key (`DNI`),
        add key (`CodEntrada`);
        
	ALTER TABLE `PROYECTO`
		add primary key (`CodProy`),
        add key (`CodProy`),
        add key (`CodEspecie`);
        
        
/* implementamos las llaves y hacia donde hacen referencia*/

ALTER TABLE `CA-PN`
	add constraint `CA-PN_ibfk1` foreign key (`CodCA`) references `COMUNIDAD AUTONOMA` (`CodCA`) on delete no action on update no action,
    add constraint `CA-PN_ibfk2` foreign key (`CodPN`) references `PARQUE NATURAL` (`CodPN`) on delete no action on update no action;
    
ALTER TABLE `ANIMAL`
	add constraint `ANIMAL_ibfk1` foreign key (`CodEspecie`) references `ESPECIE` (`CodEspecie`) on delete no action on update no action;
        
ALTER TABLE `VEGETAL`
	add constraint `VEGETAL_ibfk1` foreign key (`CodEspecie`) references `ESPECIE`(`CodEspecie`) on delete no action on update no action;
    
ALTER TABLE `MINERAL`
	add constraint `MINERAL_ibfk1` foreign key (`CodEspecie`) references `ESPECIE`(`CodEspecie`) on delete no action on update no action;
    
ALTER TABLE `E-V`
	add constraint `E-V_ibfk1` foreign key (`CodExcursion`) references `EXCURSION`(`CodExcursion`) on delete no action on update no action,
    add constraint `E-V_ibfk2` foreign key (`DNI`) references `VISITANTE`(`DNI`) on delete no action on update no action;
    
ALTER TABLE `A-V`
	add constraint `A-V_ibfk1` foreign key (`CodAlojamiento`) references `ALOJAMIENTO`(`CodAlojamiento`) on delete no action on update no action,
    add constraint `A-V_ibfk2` foreign key (`DNI`) references `VISITANTE`(`DNI`) on delete no action on update no action;
    
ALTER TABLE `E-A`
	add constraint `E-A_ibfk1` foreign key (`CodEspecie`) references `ESPECIE` (`CodEspecie`) on delete no action on update no action,
    add constraint `E-A_ibfk2` foreign key (`CodArea`) references `AREA`(`NombreA`) on delete no action on update no action;
    
ALTER TABLE `AREA`
	add constraint `AREA_ibfk1` foreign key (`CodPN`) references `PARQUE NATURAL`(`CodPN`) on delete no action on update no action;
    
ALTER TABLE `VEHICULO`
	add constraint `VEHICULO_ibfk1` foreign key(`DNI`) references `VIGILANTE`(`DNI`) on delete no action on update no action;
    
ALTER TABLE `I-P`
	add constraint `I-P_ibfk1` foreign key (`CodProy`) references `PROYECTO`(`CodProy`) on delete no action on update no action,
    add constraint `I-P_ibfk2` foreign key (`DNI`) references `INVESTIGADOR`(`DNI`) on delete no action on update no action;

ALTER TABLE `PROYECTO`
	add constraint `PROYECTO_ibfk1` foreign key (`CodEspecie`) references `ESPECIE`(`CodEspecie`) on delete no action on update no action;
    
ALTER TABLE `EXCURSION`
	add constraint `EXCURSION_ibfk1` foreign key(`CodAlojamiento`) references `ALOJAMIENTO`(`CodAlojamiento`) on delete no action on update no action;
    
ALTER TABLE `ALOJAMIENTO`
	add constraint `ALOJAMIENTO_ibfk1` foreign key (`CodPN`) references `PARQUE NATURAL`(`CodPN`) on delete no action on update no action;
    
ALTER TABLE `ENTRADA`
	add constraint `ENTRADA_ibfk1` foreign key (`CodPN`) references `PARQUE NATURAL`(`CodPN`) on delete no action on update no action;
    
ALTER TABLE `PERSONAL`
	add constraint `PERSONAL_ibfk1` foreign key (`CodPN`) references `PARQUE NATURAL`(`CodPN`) on delete no action on update no action;
    
ALTER TABLE `CONSERVADOR`
	add constraint `CONSERVADOR_ibfk1` foreign key (`DNI`) references `PERSONAL`(`DNI`) on delete no action on update no action,
    add constraint `CONSERVADOR_ibfk2` foreign key (`NombreA`) references `AREA` (`NombreA`) on delete no action on update no action;
    
ALTER TABLE `VIGILANTE`
	add constraint `VIGILANTE_ibfk1` foreign key(`DNI`) references `PERSONAL`(`DNI`) on delete no action on update no action,
    add constraint `VIGILANTE_ibfk2` foreign key (`NombreA`) references `AREA`(`NombreA`) on delete no action on update no action;
    
ALTER TABLE `INVESTIGADOR`
	add constraint `INVESTIGADOR_ibfk1` foreign key (`DNI`) references `PERSONAL`(`DNI`) on delete no action on update no action;
    
ALTER TABLE `GESTOR`
	add constraint `GESTOR_ibfk1` foreign key (`DNI`) references `PERSONAL`(`DNI`) on delete no action on update no action,
    add constraint `GESTOR_ibfk2` foreign key (`CodEntrada`) references `ENTRADA`(`CodEntrada`) on delete no action on update no action;
    
    
/* Gerard insertara los valores en las tablas, area, vehiculo, Especie, Animal, Vegetal, Mineral */
  
INSERT INTO AREA ( NombreA, Extension, CodPN) VALUES
					('Sistema_Central', 600,  null );
                    
INSERT INTO VEHICULO (Matricula, Tipo, DNI) VALUES 
					('2654TDF', 'Toyota', null),
                    ('7852LDF', 'Nissan', null),
                    ('6547PDT', 'Suzuky', null),
                    ('1546RQF', 'LandCruiser', null),
                    ('8521MCT', 'Ford', null);
                   
INSERT INTO ESPECIE (CodEspecie, NombreCientifico, NombreVulgar) VALUES
					(1003, 'Cervus_Elaphus', 'Ciervo'),
                    (1004, 'Capra_Pyrenaica', 'Cabra_Montesa'),
                    (1005, 'Sus_Scrofa', 'Jabali'),
                    (1006, 'Capreolus_Capreolus', 'Corzos'),
                    (1007, 'Dama_Dama', 'Gamos'),
                    (2003, 'Pinus_Sylvestris', 'Pino_Silvestre'),
                    (2004, 'Pinus_pinea', 'Pino_Piñonero'),
                    (2005, 'Pinus_Pinaster', 'Pino_Rodeno'),
                    (2006, 'Quercus_Robur', 'Roble'),
                    (2007, 'Quercus_ilex', 'Encina'),
                    (3003, 'Nitruro_de_Boro_Cubico', 'Diamante'),
                    (3004, 'Sphalerite', 'Esfalerita'),
                    (3005, 'Zincite', 'Cincita'),
                    (3006, 'Garnet_Gemstone', 'Granate'),
                    (3007, 'Calaita', 'Turquesa');
                    
INSERT INTO ANIMAL (CodEspecie, Alimentacion, PeriodoCelo) VALUES
				   (1003, 'Plantas_leñosas', 'Septiembre_a_Octubre'),
                   (1004, 'Herbacias', 'Noviembre_a_Enero'),
                   (1005, 'Fruta_y_Semillas', 'Noviembre_a_Diciembre'),
                   (1006, 'Brotes_y_pasto', 'Julio_a_Agosto'),
                   (1007, 'Hierbas_y_Hojas', 'Septiembre_a_Octubre');
                   
INSERT INTO VEGETAL (CodEspecie, Floracion, PeriodoFloracion) VALUES
				    (2003, 'Piñas_Alargadas', 'Abril_a_Mayo'),
                    (2004, 'Piñas_Redondas', 'Marzo_a_Junio'),
                    (2005, 'Piñas_grandes_y_conicas', 'Marzo_a_Mayo'),
                    (2006, 'Bellotas', 'Abril_a_Mayo'),
                    (2007, 'Bellota_Redonda', 'Marzo_a_Mayo');
                    
INSERT INTO MINERAL (CodEspecie, Tipo) VALUES
					(3003, 'Elementos_Nativos'),
                    (3004, 'Sulfuros'),
                    (3005, 'Oxidos'),
                    (3006, 'Silicatos'),
                    (3007, 'Fosfatos');
                    

        
        
        

        