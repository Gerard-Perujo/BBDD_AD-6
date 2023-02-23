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
                    
/* Noelia insertara los valores en las tablas, personal, conservador, vigilante, investigador, gestor, proyecto */

INSERT INTO PERSONAL (DNI,NSS, Nombre, Direccion, TfnoDomicilio, TfnoMovil, Sueldo, CodPN) VALUES 
                     (123456789, 00000000000000000000, 'Marcos Valverde', 'Calle Falsa 11', 926871331, 652278461, 2000, 01),
                     (456123789, 11111111111111111111, 'Jose Manuel Prado', 'Plaza Mayor 22', 926871332, 652274862, 3000, 01),
                     (789123456, 22222222222222222222, 'Ana Villahermosa', 'Calle Nueva 33', 926871333, 652274863, 3500, 01),
					 (321654987, 33333333333333333333, 'Miguel Baos', 'Avenida Central 44', 926871334, 652274864, 4000, 01),
					 (987654321, 44444444444444444444, 'Lucia Blanco', 'Calle Principal 55', 926871335, 652274865, 4500, 01),
                     
					 (057287230, 55555555555555555555, 'Blanca Suarez', 'Plaza de la Libertad 66', 926871336, 652274866, 5000, 02),
					 (882516635, 66666666666666666666, 'Diego Ramirez', 'Calle del Sol 77', 926871337, 652274867 , 5500, 02),
					 (145366658, 77777777777777777777, 'Carla Díaz', 'Avenida Principal 88', 926871338, 652274868, 6000, 02),
					 (369854777, 88888888888888888888, 'David García', 'Calle de la Luna 99', 926871339, 652274869, 6500, 02),
					 (325441256, 99999999999999999999, 'Rosa Ortiz', 'Avenida del Mar 10', 926871330, 652274860, 7000, 02),
                     
                     (698755114, 01234567899876543210, 'Javier Sobrino', 'Plaza del Ayuntamiento 123', 926871300, 652274800, 7500, 03),
                     (369845558, 98765432100123456789, 'Elena De Toro', 'Calle de los Olivos 01', 926871311, 652274811, 8000, 03),
                     (102001522, 00112233445566778899, 'Mario Bros', 'Avenida de la Paz 73', 926871322, 652274822, 8500, 03),
                     (778778874, 99887766554433221100, 'Laura Castro', 'Calle del Cielo 19', 926871333, 652274833, 9000, 03),
                     (765214785, 10101010101010101010, 'Santiago Fernandez', 'Plaza de 28 Constitucion 45', 926871344, 652274844, 9500, 03),
                     
                     (057287233, 11223344556677889910, 'Lucia Cejudo', 'Calle la Huerta, 0', 900102801, 613841744, 10000, 04), 
                     (705924652, 12123434565678789090, 'Ana Cañizares', 'Calle del Pez, 8', 900102802, 613841745, 10500, 04), 
                     (223125514, 12312345645678978900, 'Aron Ortega', 'Calle Severo Ochoa, 6', 900102803, 613841746, 11000, 04), 
                     (447854456, 98987676545432322121, 'Maria Menchero', 'Calle Aulagueros, 4', 900102804, 613841747, 11500, 04), 
                     (010122548, 00100200300400500600, 'Alejandro Chacon', 'Calle Santísimo, 10', 900102805, 613841748, 12000, 04); 
                     

INSERT INTO CONSERVADOR (DNI, Tarea, NombreA) VALUES 
						(123456789, 'Mantenimiento de instalaciones', 'Sistema_Central'),
                        (456123789, 'Gestión de la fauna', 'Sistema_Central'), 
                        (789123456, 'Catalogacion de especies', 'Sistema_Central'), 
                        (321654987, 'Restauración del medio natural', 'Sistema_Central'), 
                        (987654321, 'Limpieza general', 'Sistema_Central'); 
                        
INSERT INTO VIGILANTE (DNI, NombreA) VALUES 
					  (057287230, 'Sistema_Central'),
                      (882516635, 'Sistema_Central'), 
                      (145366658, 'Sistema_Central'), 
                      (369854777, 'Sistema_Central'),
                      (325441256, 'Sistema_Central'); 
                      
INSERT INTO INVESTIGADOR (DNI, Titulacion) VALUES 
						 (698755114, 'Doctorado en Biología'),
                         (369845558, 'Máster en Ecología'), 
                         (102001522, 'Ingeniero Forestal'),
                         (778778874, 'Licenciado en Geología'),
                         (765214785, 'Máster en Biodiversidad y Gestión Ambiental'); 
                         
                         
INSERT INTO GESTOR (DNI, CodEntrada) VALUES
				   (057287233, 00000000000000000000),
                   (705924652, 11111111111111111111), 
                   (223125514, 22222222222222222222),
                   (447854456, 33333333333333333333), 
                   (010122548, 44444444444444444444); 

INSERT INTO PROYECTO (CodProy, Presupuesto, FechaInicio, FechaFin, CodEspecie) VALUES
					 (10, 200000, '02-15-2023', '12-15-2023', 1004),
                     (20, 210000, '03-16-2023', '06-06-2023', 1005),
                     (30, 220000, '05-17-2023', '11-22-2023', 2003),
                     (40, 250000, '07-22-2023', '12-20-2023', 2006),
                     (50, 760000, '09-26-2023', '11-15-2023', 3003);
                     
                     
/* Maria Isabel insertara valores en las tablas visitante, comunidad autonoma, parque natural, entrada, alojamientos y excursion */

INSERT INTO `PARQUE NATURAL` (CodPn, Nombre, FechaDeclaracion) values 
					(34259, 'Laguna Peñalara', '1990-06-15');
                    
INSERT INTO `COMUNIDAD AUTONOMA` (CodCA, Nombre, OrgResponsable) values
					(472925, 'CA Madrid', 'Gobierno de Madrid');
                    
INSERT INTO ENTRADA (CodEntrada, CodPN) values
					(235897, 34259);
                    
INSERT INTO VISITANTE (DNI, Nombre, Domicilio, Profesion) values
					(123456789, 'Juan', 'Calle del Pino, 30', 'Camarero'),
                    (456789123, 'Lola', 'Avenida del Abeto, 20', 'Arquitecto'),
                    (789123456, 'Sofia', 'Calle del Lagarto, 12', 'Traductora'),
                    (987654321, 'Antonio', 'Avenida de la Marmota, 2', 'Abogado'),
                    (654321987, 'Lorena', 'Calle del Arcoiris, 7', 'Profesora');
                    
INSERT INTO ALOJAMIENTO (CodAlojamiento, Categoria, Capacidad, CodPN) values
					(983456918, 'Deluxe resort', 1345, 34259),
                    (234589758, 'Camping', 293, 34259),
                    (213487009, 'Refugio', 67, 34259),
                    (098478975, 'Hotel Rural', 402, 34259), 
                    (875980032, 'Couchsurfing', 5, 34259);
                    
INSERT INTO EXCURSION (CodExcursion, Fecha, Hora, apie, CodAlojamiento) values
					(14987253, '2023-02-28', '2023-02-28 08:00:00', 'Caminata a pie', 983456918),
                    (78689090, '2023-03-01', '2023-03-01 11:15:00', 'Escalada vertical', 234589758),
                    (12400834, '2023-03-15', '2023-03-15 09:50:00', 'Trail running', 213487009),
                    (25080956, '2023-03-31', '2023-03-31 12:30:00', 'Paseo fotografico', 098478975),
                    (34701257, '2023-04-05', '2023-04-05 07:00:00', 'Ultramaraton', 875980032);