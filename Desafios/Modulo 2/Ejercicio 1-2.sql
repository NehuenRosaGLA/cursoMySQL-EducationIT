-- EJERCICIO 1:
use bonus_track;
-- muestro toda la tabla
select * from top_spotify;

-- muestro solamente artitsta,titulo y genero
select artista,titulo, genero from top_spotify;
-- ordeno alfabeticamente los generos
select * from top_spotify order by genero;

select * from top_spotify order by genero,artista;

-- EJERCICIO 2:
select artista,titulo,genero from top_spotify order by artista,titulo limit 10;

select artista,titulo,genero from top_spotify order by artista,titulo limit 5 offset 10;-- offset el registro que no me muestra es el que marco pero si el siguiente

select * from top_spotify where artista='Madonna';-- no hay ninguna cancion de madonna

select * from top_spotify where genero='pop' order by titulo;

select * from top_spotify where genero='pop' and ano=2015 order by artista,titulo;-- no exitse ninguna de 2015

select * from top_spotify where genero='Dance Pop' and ano<2011 order by titulo;

