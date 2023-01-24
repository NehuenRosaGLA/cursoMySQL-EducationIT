-- Etapa 4

-- 4.1
create table varones
select * from nacimientos where sexo = 'Masculino';

create table mujeres
select * from nacimientos where sexo = 'Femenino';

create table indeterminados
select * from nacimientos where sexo = 'Indeterminado';

drop table nacimientos;

-- 4.2

SET SQL_SAFE_UPDATES = 0;
update clientes_neptuno set PAIS = 'USA' where PAIS = 'Estados unidos';
select * from clientes_neptuno;

update clientes_neptuno set NombreCompania = UPPER(NombreCompania);

update clientes_neptuno set pais = upper(pais), ciudad = upper(ciudad);

alter table empleados
add column NOMBRE_EMPLEADO varchar(30) after idEmpleado;

update empleados set NOMBRE_EMPLEADO = concat(nombre,', ', apellidos);
select * from empleados;
alter table empleados
drop column nombre,
drop column Apellidos;

alter table clientes
add column TIPO varchar(3);

update clientes set TIPO = 'VIP' where CIUDAD = 'MADRID';
select * from clientes;

alter table clientes modify telefono varchar(18);
update clientes set telefono = concat('+34-', telefono);

alter table productos
add column fecha date;

update productos set fecha = DATE_ADD(DATE_ADD(MAKEDATE(ANO, 1), INTERVAL (MES)-1 MONTH), INTERVAL (DIA)-1 DAY);
select * from productos;

ALTER TABLE PRODUCTOS DROP DIA, DROP MES, DROP ANO;
UPDATE PRODUCTOS SET ORIGEN = 'ESPAÑA'
WHERE ORIGEN = 'ESPANA';
SELECT * FROM PRODUCTOS;

alter table productos_neptuno 
modify Suspendido varchar(3);

update productos_neptuno set suspendido =
case 
	when SUSPENDIDO=  '0' then 'NO' 
	ELSE 'SI'
END;

select * from productos_neptuno;

update productos_neptuno 
set precioUnidad = round(precioUnidad * 1.1, 2);

select * from proveedores;

update proveedores set region = null where Region ='';
select * from proveedores;

select * from clientes;
select * from proveedores;
update clientes
set ciudad = concat(left(ciudad, 1), lower(substring(ciudad,2, length(ciudad))));

create table PRODUCTOS_SUSPENDIDOS
select * from productos_neptuno
where Suspendido = 'SI';

select * from productos_suspendidos;

-- 4.3

update productos_neptuno
set suspendido = 'SI' where idProveedor = 1;

select * from productos_neptuno;

insert into productos_suspendidos
(select * from productos_neptuno where Suspendido = 'SI' and 
IdProducto not in(select idProducto from productos_suspendidos));


select * from productos_suspendidos;

delete from productos_neptuno where Suspendido = 'SI';


