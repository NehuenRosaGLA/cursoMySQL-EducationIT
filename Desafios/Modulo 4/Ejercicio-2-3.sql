use libreria;
-- Ejercicio 2:
-- 1
select * from autores where apellido='Echeverria';
update autores set nombre='Esteban' where apellido='Echeverria';
-- 2
ALTER TABLE `libreria`.`empleados` 
ADD COLUMN `permanencia` INT NULL AFTER `fecha_ingreso`;

update empleados set permanencia=timestampdiff(year,fecha_ingreso,curdate());
select * from empleados;

-- 3
ALTER TABLE `libreria`.`libros` 
ADD COLUMN `precio_publico` DOUBLE NULL AFTER `fecha_publicacion`;

update libros set precio_publico=round(precio*1.21,2);
select * from libros;

-- ejercicio:3
-- 1
create table empleados_anteriores like empleados;

insert into empleados_anteriores select * from empleados where apellido in ('Thomas','Pereira','Devo');

delete from empleados  where apellido in ('Thomas','Pereira','Devo');
select * from empleados_anteriores;
select* from empleados;

-- 2
insert into empleados_anteriores select * from empleados where apellido='Cruz';
delete from empleados where apellido='Cruz';
select * from empleados_anteriores;
select* from empleados;