-- Etapa 2.1
use laboratorio;

-- carga de datos csv clientes_neptuno.csv a nueva tabla clientes_neptuno

-- 2
ALTER TABLE clientes_neptuno 
MODIFY COLUMN IDCliente VARCHAR(5) NOT NULL,
MODIFY COLUMN NombreCompania VARCHAR(100) NOT NULL,
MODIFY COLUMN Pais VARCHAR(15) NOT NULL,
ADD PRIMARY KEY (IDCliente);

-- 3
RENAME TABLE clientes to contactos;

-- 4 carga de datos csv clientes.csv a nueva tabla clientes

-- 5
ALTER TABLE clientes 
MODIFY COLUMN COD_CLIENTE VARCHAR(7) NOT NULL ,
ADD PRIMARY KEY (COD_CLIENTE);

ALTER TABLE clientes 
MODIFY COLUMN EMPRESA VARCHAR(100) NOT NULL,
MODIFY COLUMN CIUDAD VARCHAR(25) NOT NULL,
MODIFY COLUMN TELEFONO INT UNSIGNED,
MODIFY COLUMN RESPONSABLE VARCHAR(30);

-- 6 importar PEDIDOS csv

-- 7 

ALTER TABLE pedidos 
MODIFY NUMERO_PEDIDO INT NOT NULL,
MODIFY CODIGO_CLIENTE VARCHAR(7) NOT NULL,
MODIFY FECHA_PEDIDO DATE NOT NULL,
MODIFY FORMA_PAGO ENUM('CONTADO', 'APLAZADO', 'TARJETA'),
MODIFY COLUMN ENVIADO ENUM('SI', 'NO'),
ADD PRIMARY KEY (NUMERO_PEDIDO)
;
 
 -- 8 importar PRODUCTOS csv
 
ALTER TABLE productos
MODIFY COD_PRODUCTO INT NOT NULL,
MODIFY SECCION VARCHAR(20) NOT NULL,
MODIFY NOMBRE VARCHAR(40) NOT NULL,
MODIFY IMPORTADO ENUM('VERDADERO', 'FALSO'),
MODIFY ORIGEN VARCHAR(25) NOT NULL,
MODIFY DIA INT NOT NULL,
MODIFY MES INT NOT NULL,
MODIFY ANO INT NOT NULL,
ADD PRIMARY KEY (COD_PRODUCTO);
 
 -- Etapa 2.2 Ejecutar scripts sql nacimientos, clientes_neptuno y tablas extra;
 
 -- Etapa 2.3
 
select * from clientes_neptuno;
 
select NombreCompania, Ciudad, Pais from clientes_neptuno;
 
select NombreCompania, Ciudad, Pais from clientes_neptuno order by pais;
  
select NombreCompania, Ciudad, Pais from clientes_neptuno order by pais, ciudad;

select NombreCompania, Ciudad, Pais from clientes_neptuno order by pais limit 10;

select NombreCompania, Ciudad, Pais from clientes_neptuno order by pais limit 10,5;

-- Etapa 2.4

select * from nacimientos;
-- 1
select * from nacimientos where NACIONALIDAD = 'Extranjera';
-- 2
select * from nacimientos where EDAD_MADRE < 18;
-- 3
select * from nacimientos where EDAD_MADRE = EDAD_PADRE;
-- 4
select * from nacimientos where EDAD_PADRE >= EDAD_MADRE+40;
-- 5
select * from clientes_neptuno where pais = 'Argentina';
-- 6
select * from clientes_neptuno where pais != 'Argentina' order by pais;
-- 7
select * from nacimientos where SEMANAS < 20 order by SEMANAS desc;
-- 8
select * from nacimientos where SEXO = 'Femenino' and NACIONALIDAD = 'Extranjera' and EDAD_MADRE >= 40;
-- 9
select * from clientes_neptuno where pais in ('Argentina', 'Brasil','Venezuela') order by pais, ciudad;
-- 10
select * from nacimientos where SEMANAS between 20 and 25 order by SEMANAS asc;
-- 11 
select * from nacimientos where COMUNA in (1101, 3201, 5605, 8108,9204,13120,15202) order by COMUNA asc;
-- 12
select * from clientes_neptuno where IDCliente like 'C%';
-- 13 
select * from clientes_neptuno where Ciudad like 'B____';
-- 14
select * from nacimientos where HIJOS_TOTAL > 10 ;




















 
 
 








