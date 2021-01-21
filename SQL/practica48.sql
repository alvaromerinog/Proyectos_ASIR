--Práctica 48

--Ejercicio 1

/*
 El cod_día indica el número de día de la semana, 1 es lunes...
 La hora en las paradas solo indica la hora
 Para obtener el día y la hora habría que juntar ambas.
 */

select cod_dia, count(*) N_trenes
from dias d
         join trenes t using (cod_tren)
         join paradas p using (cod_tren)
         join estaciones e using (cod_est)
where lower(localidad) = 'palencia'
group by cod_dia
order by 2 desc;

--Ejercicio 2

select cod_tren
from paradas p
         join estaciones e using (cod_est)
where lower(localidad) = 'villalba de guadarrama'

intersect

select cod_tren
from paradas p
         join estaciones e using (cod_est)
where lower(localidad) = 'venta de baños';

--Ejercicio 3

select cod_tren
from dias d
where cod_dia = 1

minus

select cod_tren
from dias d
where cod_dia = 7;

--Ejercicio 4

select cod_tren,
       tp.nombre,
       decode(cod_dia, 1, 'Lunes', 2, 'Martes', 3, 'Miércoles', 4, 'Jueves', 5, 'Viernes', 6, 'Sábado', 7,
              'Domingo')        Día,
       to_char(hora, 'hh:mi') Hora
from trenes t
         join tipos_tren tp using (cod_tipo)
         join dias d using (cod_tren)
         join paradas p using (cod_tren)
         join estaciones e using (cod_est)
where lower(localidad) = 'miranda de ebro';

/*Otra solución
 */

select cod_tren,
       tp.nombre,
       decode(cod_dia, 1, 'Lunes', 2, 'Martes', 3, 'Miércoles', 4, 'Jueves', 5, 'Viernes', 6, 'Sábado', 7,
              'Domingo')          Día,
       to_char(hora, 'hh24:mi') Hora
from trenes t
         join tipos_tren tp using (cod_tipo)
         join dias d using (cod_tren)
         join paradas p using (cod_tren)
         join estaciones e using (cod_est)
where lower(localidad) = 'miranda de ebro';

--Ejercicio 5

select e.nombre, count(*) Total
from paradas p
         join estaciones e using (cod_est)
group by e.nombre
order by 2 desc;

--Ejercicio 6

select count(*) N_estaciones_una_palabra
from estaciones e
where nombre like '% %';

--Ejercicio 7

select decode(cod_dia, 1, 'Lunes', 2, 'Martes', 3, 'Miércoles', 4, 'Jueves', 5, 'Viernes', 6, 'Sábado', 7,
              'Domingo') Día,
       count(*)          N_trenes
from estaciones e
         join paradas p using (cod_est)
         join trenes t using (cod_tren)
         join dias d using (cod_tren)
where lower(localidad) = 'palencia'
group by cod_dia
having count(*) >= all (select count(*)
                        from dias d
                                 join trenes t using (cod_tren)
                                 join paradas p using (cod_tren)
                                 join estaciones e using (cod_est)
                        where lower(localidad) = 'palencia'
                        group by cod_dia);

/*Otra solución (Mejor)
 */

select decode(cod_dia, 1, 'Lunes', 2, 'Martes', 3, 'Miércoles', 4, 'Jueves', 5, 'Viernes', 6, 'Sábado', 7,
              'Domingo') Día,
       count(*)          N_trenes
from estaciones e
         join paradas p using (cod_est)
         join trenes t using (cod_tren)
         join dias d using (cod_tren)
where lower(localidad) = 'palencia'
group by cod_dia
having count(*) = (select max(count(*))
                   from dias d
                            join trenes t using (cod_tren)
                            join paradas p using (cod_tren)
                            join estaciones e using (cod_est)
                   where lower(localidad) = 'palencia'
                   group by cod_dia);

--Ejercicio 8

select cod_tren, count(*) N_paradas
from paradas p
group by cod_tren
having count(*) >= all (select count(*) N_paradas
                        from paradas p
                        group by cod_tren);

/* Otra solución (Mejor) */

select cod_tren, count(*) N_paradas
from paradas p
group by cod_tren
having count(*) = (select max(count(*)) N_paradas
                   from paradas p
                   group by cod_tren);

/*Otra solución*/

select cod_tren, count(*) N_paradas
from paradas p
group by cod_tren
having count(*) >= all (select max(n_parada) N_paradas
                        from paradas p
                        group by cod_tren);

--Ejercicio 9

select n_parada, nombre, to_char(hora, 'hh24:mi') Hora
from paradas p1
         join estaciones e using (cod_est)
where cod_tren = (select cod_tren
                  from paradas p2
                  group by cod_tren
                  having count(*) >= all (select count(*) N_paradas
                                          from paradas p
                                          group by cod_tren))
order by 1;

/* Otra solución (Mejor) */

select n_parada, nombre, to_char(hora, 'hh24:mi') Hora
from paradas p1
         join estaciones e using (cod_est)
where cod_tren = (select cod_tren
                  from paradas p2
                  group by cod_tren
                  having count(*) = (select max(count(*)) N_paradas
                                     from paradas p
                                     group by cod_tren))
order by 1;

--Ejercicio 10

select cod_tren, to_char(hora, 'hh24:mi:ss') Hora_parada, localidad
from paradas p1
         join estaciones e using (cod_est)
where lower(localidad) = 'venta de baños'
  and to_char(hora, 'hh24:mi:ss') between '03:00' and '07:59:59'
  and (cod_tren) in (select cod_tren
                     from paradas p2
                              join estaciones e using (cod_est)
                     where lower(localidad) = 'madrid'
                       and p1.n_parada < p2.n_parada);

/* Otra solución*/

select cod_tren, to_char(hora, 'hh24:mi:ss') Hora_parada, localidad
from paradas p1
         join estaciones e using (cod_est)
where lower(localidad) = 'venta de baños'
  and extract(hour from hora) between 3 and 7
  and (cod_tren) in (select cod_tren
                     from paradas p2
                              join estaciones e using (cod_est)
                     where lower(localidad) = 'madrid'
                       and p1.n_parada < p2.n_parada);

--Ejercicio 11

select cod_tren
from trenes t
         join dias d using (cod_tren)
         join paradas p using (cod_tren)
         join estaciones e using (cod_est)
where lower(localidad) = 'valladolid'
  and to_char(hora, 'hh24') < 12
  and cod_dia = 1

intersect

select cod_tren
from trenes t
         join dias d using (cod_tren)
         join paradas p using (cod_tren)
         join estaciones e using (cod_est)
where lower(localidad) = 'valladolid'
  and to_char(hora, 'hh24') < 12
  and cod_dia = 2

intersect

select cod_tren
from trenes t
         join dias d using (cod_tren)
         join paradas p using (cod_tren)
         join estaciones e using (cod_est)
where lower(localidad) = 'valladolid'
  and to_char(hora, 'hh24') < 12
  and cod_dia = 3;

/*Otra solucion*/

select distinct cod_tren
from trenes t
         join dias d using (cod_tren)
         join paradas p using (cod_tren)
         join estaciones e using (cod_est)
where lower(localidad) = 'valladolid'
  and to_char(hora, 'hh24') < 12
  and cod_dia in (1, 2, 3)
group by cod_tren, nombre
having count(*) = 3;

--Ejercicio 12

select cod_tren
from trenes t
         join paradas p using (cod_tren)
         join estaciones e using (cod_est)
where lower(localidad) = 'madrid'
  and (cod_tren, n_parada + 1) in (select cod_tren, n_parada
                                   from trenes t
                                            join dias d using (cod_tren)
                                            join paradas p using (cod_tren)
                                            join estaciones e using (cod_est)
                                   where lower(localidad) = 'valladolid');