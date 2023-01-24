CREATE SCHEMA `bonus_track` ;
use bonus_track;

show create table agenda;
CREATE TABLE `bonus_track`.`agenda` (
  `id_contacto` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `domicilio` varchar(45) DEFAULT NULL,
  `telefono` int(11) NOT NULL,
  `mail` varchar(50) NOT NULL,
  PRIMARY KEY (`id_contacto`)
);
insert into agenda values('1', 'Nehuen', 'Rosa', 'Luis Guillon', '1111111', 'nehuen_rosa@hotmail.com');
insert into agebda values('2', 'Walter', 'Lacoste', 'Lanus', '2222222', 'walterlacoste@hotmail.com');
insert into agenda values('3', 'Martin', 'Perez', 'Avellaneda', '333333333', 'martin@gmail.com');
insert into agenda values('4', 'Roxana', 'Martinez', 'Lomas de Zamora', '444', 'roxana@gmail.com');

select * from agenda;

