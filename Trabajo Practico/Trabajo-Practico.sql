CREATE SCHEMA `videoclub` ;
use videoclub;

CREATE TABLE `videoclub`.`pelicula` (
  `codigo_pelicula` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `año` INT NOT NULL,
  `duracion` INT NULL,
  PRIMARY KEY (`codigo_pelicula`));

CREATE TABLE `videoclub`.`amigo` (
  `codigo_amigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `telefono` INT NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo_amigo`));

insert into pelicula values(1,'Rapidos y Furiosos 1',2004,150);
insert into pelicula values(2,'Rapidos y Furiosos 2',2006,190);
insert into pelicula values(3,'Rapidos y Furiosos 3',2008,130);
insert into pelicula values(4,'Rapidos y Furiosos 4',20011,185);
insert into pelicula values(5,'Rapidos y Furiosos 5',2015,183);

insert into pelicula values(6,'Harry Potter 1',2001,150);
insert into pelicula values(7,'Harry Potter 2',2004,150);
insert into pelicula values(8,'Harry Potter 3',2006,142);
insert into pelicula values(9,'Harry Potter 4',2010,130);
insert into pelicula values(10,'Harry Potter 5',2012,160);

insert into amigo values(1,'Nahuel','Suarez',14578302,'Luis Guillon');
insert into amigo values(2,'Martin','Gomez',637401923,'Lomas de Zamora');
insert into amigo values(3,'Mateo','Martinez',9081237,'Lanus');
insert into amigo values(4,'Luisa','Rosa',89104367,'Avellaneda');
insert into amigo values(5,'Mariana','Villegas',19824662,'CABA');

insert into amigo values(6,'Rosana','Melchor',1278912,'Monte Grande');
insert into amigo values(7,'Walter','Enrique',14133342,'Parque Patricios');
insert into amigo values(8,'Marcos','Rosa',1035642,'Guernica');
insert into amigo values(9,'Julieta','Rojas',110002384,'Burzaco');
insert into amigo values(10,'Maxi','Navas',144788112,'Flores');

update pelicula set titulo='Duro de Matar' where codigo_pelicula=3;

delete from pelicula where codigo_pelicula=6;
delete from pelicula where codigo_pelicula=7;
delete from pelicula where codigo_pelicula=8;

CREATE TABLE `videoclub`.`prestamo` (
  `numero_alquiler` INT NOT NULL AUTO_INCREMENT,
  `fecha_fin` DATE NULL,
  `fecha_inicio` DATE NOT NULL,
  `codigo_pelicula` INT NOT NULL,
  `codigo_amigo` INT NOT NULL,
  PRIMARY KEY (`numero_alquiler`));

insert into prestamo values(1,'2023-04-20','2023-04-8',1,1);
insert into prestamo values(2,'2023-04-10','2023-03-28',2,2);
insert into prestamo values(3,'2023-04-20','2023-04-8',3,3);
insert into prestamo values(4,'2023-05-10','2023-04-28',4,4);
insert into prestamo values(5,'2023-01-20','2023-01-1',5,5);

insert into prestamo values(6,'2023-08-10','2023-08-1',6,6);
insert into prestamo values(7,'2023-07-18','2023-07-8',7,7);
insert into prestamo values(8,'2023-05-26','2023-05-8',8,8);
insert into prestamo values(9,'2023-05-13','2023-05-3',9,9);
insert into prestamo values(10,'2023-03-1','2023-02-14',10,10);

ALTER TABLE `videoclub`.`pelicula` 
RENAME TO  `videoclub`.`peliculas` ;

ALTER TABLE `videoclub`.`amigo` 
RENAME TO  `videoclub`.`amigos` ;

ALTER TABLE `videoclub`.`prestamo` 
RENAME TO  `videoclub`.`prestamos` ;

select * from prestamos;
select distinct nombre from amigos;
select titulo,duracion from peliculas;

-- PARTE 2

select * from prestamos where numero_alquiler between 3 and 6;

select * from amigos where codigo_amigo not between 2 and 5;

-- hago un update de alguna pelicula para poder hacer la consulta
update peliculas set titulo='Relatos Salvajes' where codigo_pelicula=1;
select * from peliculas where titulo like '%to%';

insert into amigos(codigo_amigo,nombre,apellido,telefono,direccion) values
(11,'.Marina','Fernandez', 45128956 , 'Parana 555'),  
(12,'.Lujan' ,'Tucci' , 1137589612 ,'Lavalle 1100'),
(13,'.Gabriel' , 'Dominguez' , 41109956 ,'Carlos Calvo 100' ),
(14,'.Raul' ,'Vazquez' ,45120014 ,'Peru 1120'),
(15,'.Martina', 'Perez' , 113202044 , 'Uruguay 220' );

update amigos set nombre='Lorena', apellido='Milone' where codigo_amigo=12;

create table `auxiliar` select * from amigos;
select * from auxiliar;
truncate table auxiliar;

drop table auxiliar;

SELECT * FROM peliculas, amigos;

select count(nombre) as cantidad_nombres from amigos;
select * from peliculas;

select max(año),min(año) from peliculas;

select * from peliculas order by año ;

