use libreria;
-- ejercicio 2:
-- 1
select concat(apellido,', ',nombre) as autor,provincia from autores order by autor; 
-- 2 
select concat_ws(', ',apellido,nombre)as autor,provincia from autores order by autor;
-- 3
select concat_ws(', ',apellido,upper(nombre))as autor,provincia from autores order by autor;
-- 4
select concat_ws(', ',UPPER(LEFT(nombre,1)),apellido)as autor,provincia from autores order by autor;
-- 5
select concat_ws(', ',apellido,nombre)as empleado, year(fecha_ingreso) as ingreso from empleados order by fecha_ingreso desc;
select concat_ws(', ',apellido,nombre)as empleado, year(fecha_ingreso) as ingreso from empleados order by fecha_ingreso asc;

-- ejercicio 3:
-- 1
select concat_ws(', ',apellido,nombre)as empleado, year(fecha_ingreso) as ingreso, timestampdiff(year,fecha_ingreso,curdate()) as antiguedad from empleados order by fecha_ingreso desc;
-- 2
select min(precio) as Menor_Precio from libros;
-- 3
select min(precio) as Menor_Precio,max(precio) as Mayor_Precio from libros;
-- 4
select min(precio) as Menor_Precio,max(precio) as Mayor_Precio,round(avg(precio),2) as Promedio from libros;
-- 5
select categoria,min(precio) as Menor_Precio,max(precio) as Mayor_Precio,round(avg(precio),2) as Promedio from libros group by categoria;
-- 6
select categoria,min(precio) as Menor_Precio,max(precio) as Mayor_Precio,round(avg(precio),2) as Promedio from libros where categoria!='Sin asignar' group by categoria;
