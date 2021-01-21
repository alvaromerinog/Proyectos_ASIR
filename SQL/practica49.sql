--Practica 49

--Ejercicio 1

select nombre, sum(goles_favor), sum(goles_contra)
from v_goles_equipo_alvaromerino
group by nombre
order by 2 desc;

/*Vista original*/

create view v_goles_equipo_alvaromerino as
select ec.nombre, goles_casa Goles_favor, goles_fuera Goles_contra, 'si' Local
from partidos p
         join equipos ec on (p.ID_EQUIPO_CASA = ec.ID_EQUIPO)

union all

select ef.nombre, goles_casa Goles_favor, goles_fuera Goles_contra, 'no'
from partidos p
         join equipos ef on (p.id_equipo_fuera = ef.id_equipo)
order by 1;

--Ejercicio 2

select j.nombre, e.nombre
from goles g
         join jugadores j using (id_jugador)
         join equipos e using (id_equipo)
group by j.nombre, e.nombre
having count(*) = (select max(count(*))
                   from goles g
                   group by id_jugador);

--Ejercicio 3

select j.nombre
from jugadores j
         join equipos e using (id_equipo)
where e.nombre = (
    select nombre
    from v_goles_equipo_alvaromerino
    group by nombre
    having sum(goles_favor) =
           (select min(sum(goles_favor))
            from v_goles_equipo_alvaromerino
            group by nombre));

--Ejercicio 4

/*Vista cambiada*/

create or replace view v_goles_equipo_alvaromerino as
select ec.nombre,
       goles_casa                                            Goles_favor,
       goles_fuera                                           Goles_contra,
       decode(sign(goles_casa - goles_fuera), 0, 1, 1, 3, 0) Puntos,
       'si'                                                  Local
from partidos p
         join equipos ec on (p.ID_EQUIPO_CASA = ec.ID_EQUIPO)

union all

select ef.nombre,
       goles_fuera                                           Goles_favor,
       goles_casa                                            Goles_contra,
       decode(sign(goles_fuera - goles_casa), 0, 1, 1, 3, 0) Puntos,
       'no'
from partidos p
         join equipos ef on (p.id_equipo_fuera = ef.id_equipo)
order by 1;

/*Solución*/

select nombre,
       sum(goles_favor),
       sum(goles_contra),
       sum(puntos),
       sum(goles_favor) - sum(goles_contra) Diferencia_goles
from V_GOLES_EQUIPO_ALVAROMERINO
group by nombre
order by 4 desc;

--Ejercicio 5

select j.nombre, e1.nombre
from jugadores j
         join equipos e1 using (id_equipo)
where e1.nombre = (
    select nombre
    from V_GOLES_EQUIPO_ALVAROMERINO
    group by nombre
    having sum(puntos) = (
        select max(sum(puntos))
        from V_GOLES_EQUIPO_ALVAROMERINO
        group by nombre))
order by 2, 1;

--Ejercicio 6

select nombre,
       sum(goles_favor),
       sum(goles_contra),
       sum(puntos),
       (select max(sum(puntos))
        from V_GOLES_EQUIPO_ALVAROMERINO
        group by nombre) - sum(puntos) Diferencia_lider
from v_goles_equipo_alvaromerino
group by nombre
order by 4 desc;