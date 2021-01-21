--Practica 46

--Ejercicio 1

select el.ciudad || ' ' || el.nombre Local,
       p.puntos_local,
       ev.ciudad || ' ' || ev.nombre Visitante,
       p.puntos_visita,
       to_char(p.fecha, 'fmDy,DD-Mon-YYYY')
from partidos p
         join equipos el on (el.id_equipo = p.id_equipo_local)
         join equipos ev on (ev.id_equipo = p.id_equipo_visita)
where el.ciudad || ' ' || el.nombre in ('Los Angeles Lakers', 'Boston Celtics')
  and ev.ciudad || ' ' || ev.nombre in ('Los Angeles Lakers', 'Boston Celtics')
  and abs(p.puntos_local - p.puntos_visita) > 15
order by fecha desc;

/*
 Otra solución
 */

select el.ciudad || ' ' || el.nombre Local,
       puntos_local,
       ev.ciudad || ' ' || ev.nombre Visitante,
       puntos_visita,
       to_char(p.fecha, 'fmDy,DD-Mon-YYYY')
from partidos p
         join equipos el on (el.id_equipo = p.id_equipo_local)
         join equipos ev on (ev.id_equipo = p.id_equipo_visita)
where (el.nombre in ('Lakers', 'Celtics')
    and ev.nombre in ('Lakers', 'Celtics'))
  and abs(puntos_local - puntos_visita) > 15
order by fecha desc;

/*
Otra solución
 */

select el.ciudad || ' ' || el.nombre Local,
       puntos_local,
       ev.ciudad || ' ' || ev.nombre Visitante,
       puntos_visita,
       to_char(p.fecha, 'fmDy,DD-Mon-YYYY')
from partidos p
         join equipos el on (el.id_equipo = p.id_equipo_local)
         join equipos ev on (ev.id_equipo = p.id_equipo_visita)
where ((el.nombre = 'Lakers' or el.nombre = 'Celtics')
    and (ev.nombre = 'Lakers' or ev.nombre = 'Celtics'))
  and abs(puntos_local - puntos_visita) > 15
order by fecha desc;


--Ejercicio 2

select inicio_temp || '_' || substr(fin_temp, 3, 2)                 temporada,
       count(prorrogas)                                             Partidos_con_prórrogas,
       count(*) - count(prorrogas)                                  Partidos_sin_prórroga,
       to_char((count(prorrogas) / count(*)) * 100, '90D00') || '%' Porcentaje
from partidos p
group by inicio_temp || '_' || substr(fin_temp, 3, 2)
order by 1;

/*
 Otra solución
 */

select inicio_temp || '-' || substr(fin_temp, -2)                   temporada,
       count(prorrogas)                                             Partidos_con_prórrogas,
       count(*) - count(prorrogas)                                  Partidos_sin_prórroga,
       to_char((count(prorrogas) / count(*)) * 100, '90D00') || '%' Porcentaje
from partidos p
group by inicio_temp, fin_temp
order by 1;

/*
 Solución menos eficiente (No usar)
 */

select temporada,
       Partidos_con_prórrogas,
       Partidos_sin_prórroga,
       to_char((Partidos_con_prórrogas / Partidos_sin_prórroga) * 100, '90D00') || '%' Porcentaje
from (select inicio_temp || '_' || substr(fin_temp, 3, 2) temporada, count(*) Partidos_con_prórrogas
      from partidos p
      where prorrogas is not null
      group by inicio_temp || '_' || substr(fin_temp, 3, 2)) pc
         join (select inicio_temp || '_' || substr(fin_temp, 3, 2) temporada, count(*) Partidos_sin_prórroga
               from partidos p
               where prorrogas is null
               group by inicio_temp || '_' || substr(fin_temp, 3, 2)) ps using (temporada)
order by 1;

--Ejercicio 3

select e.id_franquicia, e.nombre, e.ciudad, e2.nombre, e2.ciudad
from equipos e
         cross join equipos e2
where e.id_franquicia = e2.id_franquicia
  and e.id_equipo > e2.id_equipo
order by 1, 2, 3;

select id_franquicia, e.nombre, e.ciudad, e2.nombre, e2.ciudad
from equipos e
         join equipos e2 using(id_franquicia)
where e.id_equipo > e2.id_equipo
order by 1, 2, 3;

--Ejercicio 4

select ciudad,
       e.nombre,
       decode(d.nombre, 'Western', 'Oeste', 'Eastern', 'Este', 'Atlantic', 'Atlántica', 'Pacific', 'Pacífica',
              'Northwest', 'Noroeste', 'Midwest', 'Oeste medio', d.nombre) Division,
       decode(c.nombre, 'West', 'Oeste', 'East', 'Este', c.nombre)         Conferencia
from equipos e
         left outer join partidos p on (id_equipo = id_equipo_local)
         join divisiones d using (id_division)
         join conferencias c using (id_conferencia)
where id_equipo_local is null
order by 1, 2;

/*
 Otra solución
 */

select ciudad,
       e.nombre,
       d.nombre_esp Division,
       c.nombre_esp Conferencia
from equipos e
         left outer join partidos p on (id_equipo = id_equipo_local)
         join divisiones d using (id_division)
         join conferencias c using (id_conferencia)
where id_equipo_local is null
order by 1, 2;

--Ejercicio 5

select ciudad, nombre
from equipos
group by ciudad, nombre
having count(*) > 1;

--Ejercicio 6

select ciudad, nombre, count(*) Partidos_perdidos
from equipos e
         join partidos p on (e.id_equipo = p.id_equipo_local)
where sign(puntos_local - puntos_visita) = -1
  and inicio_temp || '_' || substr(fin_temp, 3, 2) = '2017_18'
group by ciudad, nombre
having count(*) > 25;

/*
 Otra solución
 */

select ciudad, nombre, count(*) Partidos_perdidos
from equipos e
         join partidos p on (e.id_equipo = p.id_equipo_local)
where puntos_local < puntos_visita
  and inicio_temp = 2017
  and fin_temp = 2018
group by ciudad, nombre
having count(*) > 25;