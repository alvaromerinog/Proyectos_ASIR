-- Practica 36

--Ejercicio 1

select FECHA_PRESTAMO,
       trunc(sysdate - FECHA_PRESTAMO) DiferenciaDias
from prestamos
order by 1 desc;

--Ejercicio 2

select FECHA_PRESTAMO,
       N_COPIA,
       fecha_tope
from prestamos
where fecha_entrega is null;

--Ejercicio 3

select ID_PRESTAMO,DNI
from PRESTAMOS
where extract(month from FECHA_PRESTAMO) = extract (month from sysdate);

--Ejercicio 4

select dni,to_char(FECHA_PRESTAMO,'fmdd/month/yyyy'),to_char(FECHA_TOPE,'fmdd/month/yyyy'),to_char(FECHA_ENTREGA,'fmdd/month/yyyy'),N_COPIA
from PRESTAMOS;

--Ejercicio 5

select TITULO
from PELICULAS
where not TITULO like '% %';

--Ejercicio 6

select TITULO
from PELICULAS
where TITULO like '% %' and (not TITULO like '%' or not TITULO like '% % %');

--Ejercicio 7

select TITULO
from PELICULAS
where length(TITULO)>length(CRITICA);

--Ejercicio 8

select translate(upper(TITULO),'ÁÉÍÓÚÜ','AEIOUU')
from PELICULAS;

--Ejercicio 9

select TITULO,AÑO
from PELICULAS
where (substr(año,1,1) + substr(año,2,1) + substr(año,3,1) + substr(año,4,1)) < 10;

--Ejercicio 10

select titulo, nvl(substr(titulo,1,instr(TITULO,' ',1,3)),titulo)
from PELICULAS;

--Ejercicio 11

select NOMBRE
from CLIENTES
where instr(nombre,'a') in (1,3,5) or instr(nombre,'e') in (1,3,5);

--Ejercicio 12

select TITULO
from PELICULAS
    where titulo not like '% %' and instr(translate(lower(TITULO),'aeiouáéíóúü','***********'),'*',1,2) = 0;

select TITULO
from PELICULAS
where not titulo like '% %' and regexp_count(TITULO,'[a,e,i,o,u,á,é,í,ó,ú,ü]',1,'i') = 1;

--Ejercicio 13

select nombre || ' ' || apellido1 || ' ' || apellido2 || nvl2(email,' ' || '(' || email || ')',', sin email') "Nombre / email"
from clientes order by apellido1,apellido2,nombre;

--Ejercicio 14

select n_copia,decode(DETERIORADA,0,'No',1,'Sí') Deteriorada,
       decode(FORMATO,1,'DVD',2,'BlueRay') Formato
from copias;

--Ejercicio 15

select N_COPIA
from COPIAS
where substr(n_copia,1,1) = substr(N_COPIA,8);

--Ejercicio 16

/*
 No saca el titulo si la palabra contiene más de una vez una misma vocal, y en la segunda o tercera vez o etc... se juntan dos vocales
 */

select TITULO
from PELICULAS
    where translate(lower(TITULO),'aeiouáéíóúü','***********') like '%**%';

select TITULO
from PELICULAS
where regexp_like(TITULO,'[aeiouáéíóúü]{2}','i');

--Ejercicio 17

select TITULO
from PELICULAS
    where (length(replace(translate(TITULO,',.:''',' '),' '))-length(replace(translate(lower(TITULO),'aeiouáéíóúü,.:''',' '),' ')))
              > length(replace(translate(lower(TITULO),'aeiouáéíóúü,.:''',' '),' '));

/*
select replace(translate(lower(TITULO),'aeiouáéíóúü,.:''',' '),' ')
from PELICULAS;

select replace(translate(TITULO,',.:''',' '),' ')
from peliculas;
*/

select TITULO
from PELICULAS
where regexp_count(TITULO,'[a,e,i,o,u,á,é,í,ó,ú,ü]',1,'i') > regexp_count(TITULO,'[b-d,f-h,j-ñ,p-t,v-z]',1,'i');

--Ejercicio 18

select replace(translate(lower(TITULO),'aeiouáéíóúü','***********'),'*')
from PELICULAS;