-- EJercicio 3:
use libreria;
-- 1
select * from libros where precio > (select avg(precio) from libros) order by titulo;
-- 2
select * from libros where categoria='Novelas' and precio > (select max(precio) from libros where categoria='Ensayos') order by precio desc;
-- 3
select * from empleados where permanencia= (select max(permanencia) from empleados);
-- 4
select * from empleados where puesto_id= (select max(puesto_id) from empleados);
-- 5
select libro_id,titulo,categoria,precio_publico,
case
when precio_publico< 15 then 'Economico'
when precio_publico>15 and precio_publico<30 then 'Regular'
else 'Deluxe'
end as Tipo
from libros
where precio_publico IS NOT NULL order by titulo;

-- 6
select concat(apellido,', ',nombre) Empleado from empleados where puesto_id=9
union
select concat(apellido,', ',nombre) from empleados_anteriores where puesto_id=9
order by Empleado;
-- 7
select v.libro_id,titulo,precio_publico,local_id,factura_nro,cantidad from ventas v,libros l
where v.libro_id=l.libro_id
order by l.titulo;
-- 8
select v.libro_id,titulo,precio_publico,local_id,factura_nro,cantidad, round(precio_publico *cantidad,2) as total from ventas v,libros l
where v.libro_id=l.libro_id
order by l.titulo;
-- 9
select l.titulo from libros l left join ventas v
on l.libro_id=v.libro_id
where v.factura_nro is null
order by titulo;