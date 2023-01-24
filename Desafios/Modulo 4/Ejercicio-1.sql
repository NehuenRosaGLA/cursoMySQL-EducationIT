use bonus_track;
-- Ejercicio 1:
-- 1
SET SQL_SAFE_UPDATES = 0;-- es para quitar el safeMode
update top_spotify set titulo=upper(titulo),artista=upper(artista);
select * from top_spotify;
-- 2
ALTER TABLE `bonus_track`.`top_spotify` 
ADD COLUMN `PERMANENCIA` INT NULL AFTER `ANO`;

update top_spotify set permanencia = year(curdate())-ano;
-- 3
create table ultimos_lanzamientos select * from top_spotify where permanencia<=3;
delete from top_spotify where permanencia<=3;
select * from ultimos_lanzamientos;
-- 4
insert into top_spotify values(610,'GOD CONTROL','MADONNA','Pop',2018,3);
-- 5
insert into ultimos_lanzamientos select * from top_spotify where permanencia<=3;
delete from top_spotify where permanencia<=3;