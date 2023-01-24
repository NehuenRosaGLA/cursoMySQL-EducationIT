use bonus_track;
-- 1
select concat(artista,'-',titulo) as cancion,genero from top_spotify order by cancion; 
-- 2 
select concat_ws('-',artista,titulo) as cancion,genero from top_spotify order by cancion;
-- 3
select concat_ws('-',artista,titulo) as cancion,upper(genero) as genero  from top_spotify order by cancion;
-- 4
select concat_ws('-',artista,titulo) as cancion,upper(genero) as genero,year(now())-ano as años  from top_spotify order by cancion;
-- 5
select count(id) as canciones from top_spotify;
-- 6
select count(id) as cantidad,ano from top_spotify group by ano; 
-- 7
select count(id) as cantidad,ano from top_spotify  group by ano having cantidad>=50;
