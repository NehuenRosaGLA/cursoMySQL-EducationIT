-- Etapa 1.1
drop database if exists LABORATORIO;

CREATE SCHEMA LABORATORIO ;

USE laboratorio;

CREATE TABLE facturas (
  `letra` CHAR NOT NULL,
  `numero` INT NOT NULL,
  `ClienteID` INT NULL,
  `ArticuloID` INT NULL,
  `fecha` DATE NULL,
  `monto` DOUBLE NULL,
  PRIMARY KEY (`letra`, `numero`));

CREATE TABLE articulos (
  `ArticuloId` INT NOT NULL,
  `Nombre` VARCHAR(50) NULL,
  `precio` DOUBLE NULL,
  `stock` INT NULL,
  PRIMARY KEY (`ArticuloId`));


CREATE TABLE clientes (
  `ClienteID` INT NOT NULL,
  `nombre` VARCHAR(25) NULL,
  `apellido` VARCHAR(25) NULL,
  `cuit` VARCHAR(16) NULL,
  `direccion` VARCHAR(50) NULL,
  `comentarios` VARCHAR(50) NULL,
  PRIMARY KEY (`ClienteID`));
  
  
-- Etapa 1.2
ALTER TABLE facturas RENAME COLUMN ClienteID TO IDCliente;
ALTER TABLE FACTURAS RENAME COLUMN ArticuloID TO IDArticulo;
ALTER TABLE FACTURAS MODIFY monto int unsigned;
  
ALTER TABLE articulos RENAME COLUMN ArticuloID TO IDArticulo;
ALTER TABLE articulos MODIFY nombre varchar(75) ;
ALTER TABLE articulos MODIFY precio double unsigned not null;
ALTER TABLE articulos MODIFY stock int unsigned not null;

ALTER TABLE clientes RENAME COLUMN ClienteID to IDCliente;
ALTER TABLE clientes MODIFY nombre varchar(30) not null;
ALTER TABLE clientes MODIFY apellido varchar(35) not null;
ALTER TABLE clientes RENAME COLUMN comentarios to Observaciones;
ALTER TABLE clientes MODIFY Observaciones varchar(255);



