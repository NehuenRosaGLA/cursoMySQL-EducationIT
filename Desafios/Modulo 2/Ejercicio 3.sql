-- EJERCICIO 3:
use libreria;
select * from autores;
-- 1
select * from autores where ciudad='Buenos Aires';
-- 2
select * from libros where precio>30 order by precio asc;
-- 3
select * from autores where provincia!='BA' order by provincia;
-- 4
select * from libros where categoria='cuentos' and precio<20 order by titulo;
-- 5
select * from libros where categoria='novelas' or categoria='ensayos' order by titulo;
-- 6
select * from libros where precio>20 and precio<=35 order by precio asc;
-- 7
select * from autores where nombre='Jorge Luis' or nombre='Victoria' or nombre='Ernesto' or nombre='Adolfo' order by nombre;
-- 8
select * from libros where titulo like'%mundo%' order by titulo;
-- 9
select * from libros where titulo like '% de %' order by titulo;
-- 10
select * from libros where precio is null order by titulo;