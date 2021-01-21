--Practica 44

--Ejercicio 1

select p.nombre, a2.nombre
from usuarios p
         join amigos a1 using (id_usu)
         join usuarios a2 on (a2.id_usu = a1.id_amigo)
order by 1, 2;

--Ejercicio 2

select nombre, count(*) N_amigos
from usuarios
         join amigos a using (id_usu)
group by nombre
order by 2 desc;

--Ejercicio 3

select count(*) N_usuarios
from usuarios;

--Ejercicio 4

select p.nombre
from usuarios p
         left outer join amigos a1 using (id_usu)
where a1.ID_AMIGO is null;

--Ejercicio 5

select nombre, count(*) N_amigos
from usuarios
         join amigos a using (id_usu)
group by nombre
having count(*) > (
    select count(*)
    from usuarios p
             join amigos a1 using (id_usu)
    where p.nombre = 'Andrea')
order by 2 desc;

--Ejercicio 6

select u2.nombre "Amigos de Andrea", u3.nombre "Amigos de amigos"
from usuarios u1
         join amigos a1 on (u1.id_usu = a1.id_usu)
         join usuarios u2 on (u2.id_usu = a1.id_amigo)
         join amigos a3 on (u2.id_usu = a3.id_usu)
         join usuarios u3 on (u3.id_usu = a3.id_amigo)
where u1.nombre = 'Andrea'
order by 1, 2;

--Ejercicio 7

select nombre, round(avg(N_amigos_de_amigos),2) "Media amigos de amigos"
from (
         select u1.nombre nombre, count(*) N_amigos_de_amigos
         from usuarios u1
                  join amigos a1 on (u1.id_usu = a1.id_usu)
                  join usuarios u2 on (u2.id_usu = a1.id_amigo)
                  join amigos a3 on (u2.id_usu = a3.id_usu)
         group by u1.nombre, a3.ID_USU)
group by nombre
order by 1;

/*
 Otra solución
 */

 create view cuenta_amigos_amigos as (
 select u1.nombre nombre usuario, u2.nombre amigo,count(*) Cuenta
         from usuarios u1
                  join amigos a1 on (u1.id_usu = a1.id_usu)
                  join usuarios u2 on (u2.id_usu = a1.id_amigo)
                  join amigos a3 on (u2.id_usu = a3.id_usu)
         group by u1.nombre, a3.ID_USU
                                        );

select usuario,to_char(avg(cuenta),'990D00')
from CUENTA_AMIGOS_AMIGOS
    group by USUARIO
order by usuario;

select * from user_views;

--Ejercicio 8

select nombre, contra
from usuarios
where regexp_like(contra, '^[[:digit:]]+$');

--Ejercicio 9

select u1.nombre, u2.nombre, u2.contra
from usuarios u1
         join amigos a1 on (u1.id_usu = a1.id_usu)
         join usuarios u2 on (u2.id_usu = a1.id_amigo)
where regexp_like(u2.contra, '^[[:digit:]]+$');

/*
 Otra solución
 */

select u.nombre, u2.nombre
from usuarios u
join amigos a using(id_usu)
join(
    select id_usu, nombre, contra
    from USUARIOS
    where regexp_like(contra,'^[0-9]+$')
    ) u2 on (a.id_amigo=u2.id_usu);

--Ejercicio 10

select nombre, contra
from usuarios
where not (regexp_like(contra, '[[:upper:]]+')
    and regexp_like(contra, '[[:lower:]]+')
    and regexp_like(contra, '[[:digit:]]+')
    and length(contra) >= 8
    and lower(contra) not like '%' || lower(usuario) || '%');

/*
 Otra solución
 */

 select nombre, contra
from usuarios
where not (regexp_like(contra, '[[:upper:]]+')
    and regexp_like(contra, '[[:lower:]]+')
    and regexp_like(contra, '[[:digit:]]+')
    and length(contra) >= 8
    and not regexp_like(contra,usuario));