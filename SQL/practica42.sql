--Practica 42

--Ejercicio 1

--SQL92
select l.nombre, l.poblacion, p.nombre
from LOCALIDADES l,
     PROVINCIAS p
where l.N_PROVINCIA = p.N_PROVINCIA;

--SQL99
select l.nombre, l.poblacion, p.nombre
from LOCALIDADES l
         join PROVINCIAS p using (n_provincia);

--Ejercicio 2

--SQL92
select p.nombre, l.nombre
from LOCALIDADES l,
     PROVINCIAS p
where p.id_capital = l.ID_LOCALIDAD;

--SQL99
select p.nombre, l.nombre
from LOCALIDADES l
         join PROVINCIAS p on (l.ID_LOCALIDAD = p.ID_CAPITAL);

--Ejercicio 3

--SQL92
select l.nombre Localidad, p.nombre Provincia, c.nombre Comunidad
from LOCALIDADES l,
     PROVINCIAS p,
     COMUNIDADES c
where l.N_PROVINCIA = p.N_PROVINCIA
  and p.ID_COMUNIDAD = c.ID_COMUNIDAD;

--SQL99
select l.nombre Localidad, p.nombre Provincia, c.nombre Comunidad
from LOCALIDADES l
         join PROVINCIAS p using (n_provincia)
         join COMUNIDADES c using (id_comunidad);

--Ejercicio 4

--SQL92
select l.nombre Localidad, p.nombre Provincia, l2.nombre Capital_Provincia, c.nombre Comunidad
from LOCALIDADES l,
     PROVINCIAS p,
     COMUNIDADES c,
     LOCALIDADES l2
where l.N_PROVINCIA = p.N_PROVINCIA
  and p.ID_COMUNIDAD = c.ID_COMUNIDAD
  and l2.ID_LOCALIDAD = p.ID_CAPITAL;

--SQL99
select l.nombre Localidad, p.nombre Provincia, l2.nombre Capital_Provincia, c.nombre Comunidad
from LOCALIDADES l
         join PROVINCIAS p using (n_provincia)
         join COMUNIDADES c using (id_comunidad)
         join LOCALIDADES l2 on (l2.id_localidad = p.id_capital);

--Ejercicio 5

--SQL92
select l.nombre  Localidad,
       p.nombre  Provincia,
       l2.nombre Capital_Provincia,
       c.nombre  Comunidad,
       l3.nombre Capital_Comunidad
from LOCALIDADES l,
     PROVINCIAS p,
     COMUNIDADES c,
     LOCALIDADES l2,
     LOCALIDADES l3
where l.N_PROVINCIA = p.N_PROVINCIA
  and p.ID_COMUNIDAD = c.ID_COMUNIDAD
  and l2.ID_LOCALIDAD = p.ID_CAPITAL
  and l3.ID_LOCALIDAD = c.ID_CAPITAL;

--SQL99
select l.nombre  Localidad,
       p.nombre  Provincia,
       l2.nombre Capital_Provincia,
       c.nombre  Comunidad,
       l3.nombre Capital_Comunidad
from LOCALIDADES l
         join PROVINCIAS p using (n_provincia)
         join COMUNIDADES c using (id_comunidad)
         join LOCALIDADES l2 on (l2.id_localidad = p.id_capital)
         join LOCALIDADES l3 on (l3.id_localidad = c.id_capital);

--Ejercicio 6

select l.nombre Capitales, l.poblacion
from localidades l
         join provincias p on (l.ID_LOCALIDAD = p.ID_CAPITAL)
where poblacion > 200000;

--Ejercicio 7

select l.nombre Capitales, l.poblacion Población
from localidades l
         join comunidades c on (l.ID_LOCALIDAD = c.ID_CAPITAL)
where poblacion > 200000;

--Ejercicio 8

select l.nombre Localidad
from localidades l
         join provincias p using (n_provincia)
         join localidades cp on (cp.id_localidad = p.id_capital)
where l.poblacion > cp.poblacion;

--Ejercicio 9

select l.nombre Localidad
from localidades l
         left outer join provincias p on (l.ID_LOCALIDAD = p.ID_CAPITAL)
where p.nombre is null;

--Ejercicio 10

select p.nombre Provincia
from provincias p
         join localidades cp on (cp.ID_LOCALIDAD = p.ID_CAPITAL)
where cp.nombre != p.nombre;

--Ejercicio 11

select c.nombre Comunidad1, c2.nombre Comunidad2
from COMUNIDADES c
         cross join COMUNIDADES c2
where length(c.nombre) = length(c2.nombre)
  and c.nombre < c2.nombre
order by 1;

--Ejercicio 12

select c.nombre Comunidad, count(*) N_provincias
from PROVINCIAS p
         join COMUNIDADES c using (id_comunidad)
group by c.nombre;

--Ejercicio 13

/*
 En este caso es mejor poner la condición en el where cuando sea posible,
 ya que es más eficiente que having
 */
select p.nombre Provincia, count(*) N_Localidades
from localidades l
         join provincias p using (n_provincia)
where p.nombre = 'Palencia'
group by p.NOMBRE;

--Ejercicio 14

select c.nombre Comunidad, count(*) N_Localidades
from localidades l
         join provincias p using (n_provincia)
         join comunidades c using (id_comunidad)
group by c.nombre
order by 2 desc;

--Ejercicio 15

select p.nombre Provincia, count(*) "N Localidades + 10000"
from provincias p
         join localidades l using (n_provincia)
where l.poblacion > 10000
group by p.nombre
order by 2;

--Ejercicio 16

select max(count(*)) N_Loc_MAX
from localidades l
         join provincias p using (n_provincia)
group by p.nombre;

/*
 Para sacar el nombre de la provincia
 */

select p.nombre Provincia, count(*) N_Loc_MAX
from localidades l
         join provincias p using (n_provincia)
group by p.nombre
having count(*) = (select max(count(*)) N_Loc_MAX
                   from localidades l
                            join provincias p using (n_provincia)
                   group by p.nombre);

--Ejercicio 17

select p.nombre Provincia, sum(l.poblacion) Poblacion_Total
from provincias p
         join localidades l using (n_provincia)
group by p.nombre
order by 2 desc;

--Ejercicio 18

select l.nombre Localidad, p.nombre Provincia
from localidades l
         join provincias p using (n_provincia)
         join comunidades c using (id_comunidad)
where c.nombre = 'Castilla y León'
order by l.poblacion desc;

--Ejercicio 19

select l.nombre Localidad, p.nombre Provincia
from localidades l
         join provincias p using (n_provincia)
         join comunidades c using (id_comunidad)
         join localidades cp on (cp.ID_LOCALIDAD = p.ID_CAPITAL)
where c.nombre = 'Castilla y León'
  and cp.nombre != l.nombre
order by l.poblacion desc;

--Ejercicio 20

select p.nombre Provincia
from provincias p
         join localidades l using (n_provincia)
group by p.nombre
having count(*) > 200;

--Ejercicio 21

select p.nombre                                         Provincia,
       to_char(p.superficie, '999G999G990') || ' km2'   Superficie,
       to_char(sum(l.poblacion), '999G999G990') || ' h' Poblacion
from PROVINCIAS p
         join LOCALIDADES l using (n_provincia)
group by p.nombre, p.SUPERFICIE
order by p.nombre;

--Ejercicio 22

select p.nombre                                                                Provincia,
       to_char(p.superficie, '999G999G990') || ' km2'                          Superficie,
       to_char(sum(l.poblacion), '999G999G990') || ' h'                        Poblacion,
       to_char(sum(l.poblacion) / p.superficie, '999G999G990D000') || ' h/km2' Densidad
from PROVINCIAS p
         join LOCALIDADES l using (n_provincia)
group by p.nombre, p.SUPERFICIE
order by p.nombre;

--Ejercicio 23

select c.nombre, to_char(sum(l.poblacion), '999G999G990') || ' h' Poblacion_comunidad
from comunidades c
         join provincias p using (id_comunidad)
         join localidades l using (n_provincia)
group by c.nombre
order by c.nombre;

--Ejercicio 24

select l.nombre, l.poblacion
from localidades l
         cross join localidades l2
where l2.nombre = 'Palencia'
  and l.poblacion > l2.poblacion
order by 2;

/*
 Otra solución
 */

select l.nombre, l.poblacion
from localidades l
where l.poblacion > (select poblacion from localidades where nombre = 'Palencia')
order by 2;

--Ejercicio 25

select p.nombre, sum(l.poblacion) Poblacion_Provincia
from provincias p
         join localidades l using (n_provincia)
group by p.nombre
having sum(l.poblacion) > (select sum(l.poblacion) Poblacion_Provincia
                           from provincias p
                                    join localidades l using (n_provincia)
                           where p.nombre = 'Guipuzcoa'
                           group by p.nombre)
order by 2;

/*
 Otra solución (Es un poco más rápida)
 */

 select p1.nombre, p1.poblacion, p2.nombre, p2.poblacion
from (select p.nombre, sum(l.poblacion) Poblacion
from provincias p
         join localidades l using (n_provincia)
group by p.nombre) p1
cross join (select p.nombre, sum(l.poblacion) Poblacion
                           from provincias p
                                    join localidades l using (n_provincia)
                           where p.nombre = 'Guipuzcoa'
                           group by p.nombre) p2
where p1.poblacion > p2.poblacion;