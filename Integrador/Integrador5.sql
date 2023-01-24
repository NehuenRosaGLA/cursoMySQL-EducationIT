-- Etapa 5.1
-- 1
select * from productos_neptuno where PrecioUnidad > (select avg(PrecioUnidad) from productos_neptuno);
-- 2
select * from productos_neptuno where PrecioUnidad > (select max(PrecioUnidad) from productos_suspendidos) order by PrecioUnidad desc;

-- 3
select * from varones where semanas < (select min(semanas) from indeterminados);

-- 4
select * from productos_neptuno
 where NombreProducto like
	 (select concat(
		left(
			substring_index(NOMBRE_EMPLEADO, ' ',-1)
            ,1),
		'%') 
	 from empleados 
     where IdEmpleado = 8)
     order by NombreProducto;
	
    
    -- Etapa 5.2
SELECT IDCLIENTE, NOMBRECOMPANIA, CIUDAD, PAIS,
CASE
	when PAIS in ('argentina', 'brasil', 'venezuela') then 'america del sur'
	when PAIS in ('mexico', 'usa', 'canada') then 'america del norte'
else 'europa'
end AS Continente
FROM CLIENTES_NEPTUNO
ORDER BY Continente, PAIS;


SELECT IDPEDIDO, NOMBRECOMPANIA, FECHAPEDIDO, CARGO,
CASE
	WHEN CARGO > 700 THEN 'Excelente'
	WHEN CARGO > 500 THEN 'Muy bueno'
	WHEN CARGO > 250 THEN 'Bueno'
	WHEN CARGO > 50 THEN 'Regular'
ELSE 'Malo'
END AS 'Evaluacion'
FROM PEDIDOS_NEPTUNO
ORDER BY CARGO DESC;


SELECT IDPRODUCTO, NOMBREPRODUCTO, NOMBRECATEGORIA, PRECIOUNIDAD,
CASE
	WHEN PRECIOUNIDAD > 100 THEN 'Deluxe'
	WHEN PRECIOUNIDAD > 10 THEN 'Regula'
ELSE 'Economico'
END AS TIPO
FROM PRODUCTOS_NEPTUNO
ORDER BY PRECIOUNIDAD DESC;

-- Etapa 5.3

SELECT * FROM VARONES WHERE SEMANAS < 20
UNION
SELECT * FROM MUJERES WHERE SEMANAS < 20
UNION
SELECT * FROM INDETERMINADOS WHERE SEMANAS < 20;


SELECT * FROM VARONES WHERE FECHA LIKE '%/09/%' AND NACIONALIDAD =
'Chilena' AND ESTADO_CIVIL_MADRE = 'Casada' AND SEMANAS > 40
UNION
SELECT * FROM MUJERES WHERE FECHA LIKE '%/09/%' AND NACIONALIDAD =
'Chilena' AND ESTADO_CIVIL_MADRE = 'Casada' AND SEMANAS > 40
UNION
SELECT * FROM INDETERMINADOS WHERE FECHA LIKE '%/09/%' AND NACIONALIDAD =
'Chilena' AND ESTADO_CIVIL_MADRE = 'Casada' AND SEMANAS > 40;


SELECT *FROM PRODUCTOS_NEPTUNO
WHERE PRECIOUNIDAD > 80
UNION
SELECT * FROM PRODUCTOS_SUSPENDIDOS
WHERE PRECIOUNIDAD > 80
ORDER BY NOMBREPRODUCTO;

SELECT *, 'A la venta' AS CONDICION FROM PRODUCTOS_NEPTUNO
WHERE PRECIOUNIDAD > 80
UNION
SELECT *, 'Suspendido' AS CONDICION FROM PRODUCTOS_SUSPENDIDOS
WHERE PRECIOUNIDAD > 80
ORDER BY NOMBREPRODUCTO;


SELECT * FROM PRODUCTOS_NEPTUNO
WHERE NOMBRECATEGORIA = 'Bebidas'
UNION
SELECT * FROM PRODUCTOS_SUSPENDIDOS
WHERE NOMBRECATEGORIA = 'Bebidas'
ORDER BY NOMBREPRODUCTO;


INSERT INTO PRODUCTOS_SUSPENDIDOS
(IDPRODUCTO, NOMBREPRODUCTO, NOMBRECONTACTO, NOMBRECATEGORIA, PRECIOUNIDAD,
SUSPENDIDO, IDPROVEEDOR)
SELECT IDPRODUCTO, NOMBREPRODUCTO, NOMBRECONTACTO, NOMBRECATEGORIA,
PRECIOUNIDAD, SUSPENDIDO, IDPROVEEDOR
FROM PRODUCTOS_NEPTUNO
WHERE IDPRODUCTO = 43 ;

SELECT * FROM PRODUCTOS_NEPTUNO WHERE NOMBRECATEGORIA = 'Bebidas'
UNION
SELECT * FROM PRODUCTOS_SUSPENDIDOS WHERE NOMBRECATEGORIA = 'Bebidas'
ORDER BY NOMBREPRODUCTO;

SELECT * FROM PRODUCTOS_NEPTUNO WHERE NOMBRECATEGORIA = 'Bebidas'
UNION ALL
SELECT * FROM PRODUCTOS_SUSPENDIDOS WHERE NOMBRECATEGORIA = 'Bebidas'
ORDER BY NOMBREPRODUCTO;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM PRODUCTOS_SUSPENDIDOS WHERE IDPRODUCTO = 43;


-- Etapa 5.4

CREATE TABLE EQUIPOS (EQUIPO VARCHAR(20) PRIMARY KEY);

INSERT INTO EQUIPOS
VALUES ('ARGENTINA'), ('BRASIL'), ('CHILE'), ('PARAGUAY'), ('URUGUAY'),
('COLOMBIA'), ('ECUADOR'), ('PERÚ'), ('BOLIVIA'), ('VENEZUELA');


SELECT * FROM EQUIPOS L CROSS JOIN EQUIPOS V
WHERE L.EQUIPO <> V.EQUIPO
ORDER BY L.EQUIPO;

-- Etapa 5.5

-- 1
select pn.nombreContacto,idProducto,nombreProducto, precioUnidad from proveedores p join productos_neptuno pn
on p.idProveedor=pn.idProveedor order by pn.nombreContacto,nombreProducto;
-- 2
select pn.nombreContacto,idProducto,nombreProducto,precioUnidad from proveedores p,productos_neptuno pn
where p.idProveedor = pn.idProveedor order by pn.nombreContacto,nombreProducto;
-- 3
select empresa,numero_pedido,fecha_pedido,forma_pago from clientes c join pedidos p
on c.cod_cliente=p.codigo_cliente order by empresa;
-- 4
select empresa,numero_pedido,fecha_pedido,forma_pago
from clientes c left join pedido p 
on c.cod_cliente=p.codigo_cliente where p.numero_pedido is null 
order by empresa;
-- 5
select empresa from clientes c left join pedido p 
on c.cod_cliente=p.codigo_cliente where p.numero_pedido is null 
order by empresa;
-- 6
select * from proveedores p left join productos_neptuno pn 
on p.idProveedor = pn.idProveedor where pn.idProducto is null;
-- 7

select * from proveedores p right join productos_neptuno pn
on p.idProveedor = pn.idProveedor where p.idProveedor is null;




