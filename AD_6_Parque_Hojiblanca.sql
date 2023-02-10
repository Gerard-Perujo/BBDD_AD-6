CREATE DATABASE IF NOT EXISTS Parque_Hojiblanca;
USE Parque_hojiblanca;

-- desactivamos las llaves para poder insertar los datos y no nos de error--

SET FOREIGN_KEY_CHECKS = 0;


-- creamos todas las tablas del DER --

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
		`CodAlojameiento` int(20)not null,
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
		`Nombre` varchar(20) not null,
        `Extension` int(20),
        `CodPN` int(20) not null
        );
        
CREATE TABLE `VEHICULO`(
		`Matricula` int(15) not null,
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
        `CodArea` int(15),
        `CantIndividuos` int(50)
        );
        
CREATE TABLE `I-P`(
		`CodProy` int(20) not null,
        `DNI` int(9) not null
        );
        
        

        