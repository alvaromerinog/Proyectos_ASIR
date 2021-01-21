--Practica 45

--Ejercicio 1

select casa.nombre,
       goles_casa,
       decode(sign(goles_casa - goles_fuera), 1, 3, -1, 0, 1) punto_casa,
       fuera.nombre,
       goles_fuera,
       decode(sign(goles_fuera - goles_casa), 1, 3, -1, 0, 1) puntos_fuera
from partidos p
         join equipos casa on (casa.id_equipo = p.id_equipo_casa)
         join equipos fuera on (fuera.id_equipo = p.id_equipo_fuera);

--Ejercicio 2

select j.nombre, e.nombre, count(*) Goles
from jugadores j,
     equipos e,
     goles g
where j.id_equipo = e.id_equipo
  and j.id_jugador = g.id_jugador
group by j.nombre, e.nombre
order by 3 desc;

--Ejercicio 3

select g.descripcion, g.minuto, j.nombre
from goles g
         join jugadores j using (id_jugador)
         cross join jugadores j2
where regexp_like(g.descripcion, j2.nombre);

--Ejercicio 4

select j.nombre
from jugadores j
         join equipos e using (id_equipo)
         left join goles g using (id_jugador)
where e.nombre = 'Tornado F.C.'
  and g.minuto is null;

--Ejercicio 5

select count(*) Goles_prorroga
from goles g
where g.minuto > interval '90' minute;

--Ejercicio 6

select to_char(fecha_nac,'fmDAY'), count(*) N_jugadores
from jugadores j
join equipos e using(id_equipo)
where lower(e.ciudad) like '%vallestrecho%'
group by to_char(fecha_nac,'fmDAY')
order by 2 desc;
