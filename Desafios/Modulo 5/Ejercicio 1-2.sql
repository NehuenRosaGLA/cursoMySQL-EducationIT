use bonus_track;
-- Ejercicio 1:
-- 1
select artista,titulo from ultimos_lanzamientos where ano= (select max(ano)from ultimos_lanzamientos) order by artista,titulo;
-- 2
select * from top_spotify where permanencia=(select max(permanencia) from top_spotify) and artista='Lady Gaga' order by titulo;
-- 3 
select artista, titulo,
case
when genero like'%pop%' then 'POP'
when  genero like '%electro%' or genero like '%house%' then 'Electronica'
else 'Otro'
end as Tipo
from top_spotify order by artista,titulo;

-- Ejercicio 2:
-- 1
select *,'Anterior' as Estado from top_spotify where titulo like '%break%'
union 
select *,'Ultimo' as Estado from ultimos_lanzamientos where titulo like '%break%' order by titulo;



