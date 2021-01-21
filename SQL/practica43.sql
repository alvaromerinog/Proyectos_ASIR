--Practica 43

--Ejercicio 1

select nombre
from personas p
where n_padre is null
  and n_madre is null;

--Ejercicio 2

--SQL92
select p.nombre, pad.nombre, mad.nombre
from personas p,
     personas pad,
     personas mad
where p.n_padre = pad.N_PERSONA
  and p.n_madre = mad.N_PERSONA;

--SQL99
select p.nombre, pad.nombre, mad.nombre
from personas p
         join personas pad on (p.n_padre = pad.n_persona)
         join personas mad on (p.n_madre = mad.n_persona);

--Ejercicio 3

select p.nombre, pad.nombre, mad.nombre
from personas p
         left outer join personas pad on (p.n_padre = pad.n_persona)
         left outer join personas mad on (p.n_madre = mad.n_persona);

/*
Otra solución (adelanto del tema siguiente)
Las personas que no tienen hijos
 */

select p.nombre, pad.nombre
from personas p
         right outer join personas pad on (p.n_padre = pad.n_persona)
where p.nombre is null
  and pad.sexo = 'H'
UNION
select p.nombre, mad.nombre
from personas p
         right outer join personas mad on (p.n_madre = mad.n_persona)
where p.nombre is null
  and mad.sexo = 'M';

--Ejercicio 4

select pad.nombre, mad.nombre, count(*) N_hijos
from personas p
         join personas pad on (p.n_padre = pad.n_persona)
         join personas mad on (p.n_madre = mad.n_persona)
group by pad.nombre, mad.nombre
order by 3 desc, 1, 2;

--Ejercicio 5

select mad.nombre, count(*) N_hijas
from personas p
         join personas mad on (p.n_madre = mad.n_persona)
where p.sexo = 'M'
group by mad.nombre
having count(*) = 2
order by 1;

--Ejercicio 6

select p.nombre, pad.nombre
from personas p
         join personas pad on (p.n_padre = pad.n_persona)
where substr(upper(p.nombre), 1, 1) = substr(upper(pad.nombre), 1, 1);

--Ejercicio 7

select madre, count(*) n_parejas
from (select mad.nombre madre
      from personas p
               join personas pad on (p.n_padre = pad.n_persona)
               join personas mad on (p.n_madre = mad.n_persona)
      group by mad.nombre, pad.nombre) mad1
group by madre
having count(*) > 1;

/*
 Otra solución
 */

select mad.nombre madre, count(distinct pad.nombre) N_Parejas
from personas p
         join personas pad on (p.n_padre = pad.n_persona)
         join personas mad on (p.n_madre = mad.n_persona)
group by mad.nombre
having count(distinct pad.nombre) > 1
order by 1, 2;

--Ejercicio 8

select distinct ab.nombre
from personas p
         join personas mad on (p.n_madre = mad.n_persona)
         join personas ab on (mad.n_madre = ab.N_PERSONA);

--Ejercicio 9

select pad.nombre
from personas p
         right outer join personas pad on (p.n_padre = pad.n_persona)
where p.nombre is null
  and pad.sexo = 'H'
order by 1;

--Ejercicio 10

select p.nombre, p2.nombre
from personas p
         join personas p2 using (n_padre)
where p.nombre < p2.nombre
order by n_padre, 1, 2;

--Ejercicio 11

select p.nombre, p2.nombre, pad.nombre Padre
from personas p
         join personas p2 on (p.n_padre = p2.n_padre)
         join personas pad on (p.n_padre = pad.n_persona)
where p.nombre < p2.nombre
order by 3, 1, 2;
