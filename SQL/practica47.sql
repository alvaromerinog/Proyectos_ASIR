--Práctica 47

--Ejercicio 1

select tipo, modelo, precio_venta
from PIEZAS
where precio_venta > (select avg(precio_venta)
                      from piezas);

--Ejercicio 2

select tipo, modelo
from SUMINISTROS s
         join EMPRESAS e using (cif)
where upper(provincia) = 'BARCELONA'

intersect

select tipo, modelo
from SUMINISTROS s
         join EMPRESAS e using (cif)
where upper(provincia) = 'MADRID';

/*Otra solución
 */

select distinct tipo, modelo
from SUMINISTROS s
         join EMPRESAS e using (cif)
where upper(provincia) = 'BARCELONA'
  and (tipo, modelo) in (select distinct tipo, modelo
                         from SUMINISTROS s
                                  join EMPRESAS e using (cif)
                         where upper(provincia) = 'MADRID');

--Ejercicio 3

select tipo, modelo
from existencias
group by tipo, modelo
having count(*) = 1

intersect

select tipo, modelo
from existencias
where upper(tipo) = 'AR'
  and n_almacen = 3;

/*Otra solución
 */

select tipo, modelo
from existencias
where upper(tipo) = 'AR'
  and n_almacen = 3

minus

select tipo, modelo
from existencias
where upper(tipo) = 'AR'
  and n_almacen != 3;

--Ejercicio 4

select a1.n_almacen
from ALMACENES a1
         cross join almacenes a2
where a1.direccion = a2.direccion
  and a1.n_almacen != a2.n_almacen;

/* Otra solución
   (Solo sirve para Oracle)
 */

select n_almacen, direccion
from almacenes al1
where direccion in (
    select direccion
    from almacenes al2
    where al1.N_ALMACEN != al2.N_ALMACEN
);

/* Otra solución
   (Sirve para todas las bases de datos)
   */

select n_almacen, direccion
from almacenes al1
where exists(
              select direccion
              from almacenes al2
              where al1.N_ALMACEN != al2.N_ALMACEN
                and al1.direccion = al2.direccion
          );

--Ejercicio 5

select tipo, modelo
from piezas p
         left outer join suministros s using (tipo, modelo)
where cif is null
order by 1, 2;

/*
 Otra solución
 (Es menos eficiente)
 */

select tipo, modelo
from piezas p
where (tipo, modelo) not in (
    select tipo, modelo
    from suministros
);

/*
 Otra solución
 */

select tipo, modelo
from piezas p

minus

select tipo, modelo
from suministros s;

--Ejercicio 6

select tipo, modelo, provincia
from SUMINISTROS s
         join empresas em using (cif)
where upper(tipo) = 'PU'
  and upper(provincia) = 'VALLADOLID'
  and modelo not in (select modelo
                     from SUMINISTROS s
                              join empresas em using (cif)
                     where upper(tipo) = 'PU'
                       and upper(provincia) != 'VALLADOLID');

/* Otra solución */

select tipo, modelo
from SUMINISTROS s
         join empresas em using (cif)
where upper(tipo) = 'PU'
  and upper(provincia) = 'VALLADOLID'

minus

select tipo, modelo
from SUMINISTROS s
         join empresas em using (cif)
where upper(tipo) = 'PU'
  and upper(provincia) != 'VALLADOLID';

--Ejercicio 7

--Consulta de duplicados se llama a este tipo de consultas.
select tipo, modelo, count(*) N_almacenes
from existencias ex
group by tipo, modelo
having count(*) >= 2;

--Ejercicio 8

(
    select tipo, modelo
    from existencias ex
    where n_almacen = 1

    intersect

    select tipo, modelo
    from existencias ex
    where n_almacen = 2
)
minus

select tipo, modelo
from existencias ex
where n_almacen = 3;

--Ejercicio 9

select nombre
from suministros s
         join empresas em using (cif)
         join piezas p using (tipo, modelo)
         left outer join existencias using (tipo, modelo)
where n_almacen is null;

--Ejercicio 10

select nombre, count(*) Piezas_que_suministra
from empresas em
         join suministros s using (cif)
group by nombre
having count(*) = (select max(count(*))
                   from empresas em
                            join suministros s using (cif)
                   group by nombre);

/* Otra solución
   (Es mejor para bases de datos que no pueden anidar consultas de totales.
   Oracle puede hacerlo, por lo que es mejor la primera solución*/

select nombre, count(*) Piezas_que_suministra
from empresas em
         join suministros s using (cif)
group by nombre
having count(*) >= all (select count(*)
                        from empresas em
                                 join suministros s using (cif)
                        group by nombre);

--Ejercicio 11

select e1.nombre, e1.Piezas_que_suministra
from (select nombre, count(*) Piezas_que_suministra
      from empresas em
               join suministros s using (cif)
      group by nombre) e1
         cross join (select nombre, count(*) Piezas_que_suministra
                     from empresas em
                              join suministros s using (cif)
                     group by nombre) e2
where e1.Piezas_que_suministra = e2.Piezas_que_suministra
  and e1.nombre != e2.nombre;

--Ejercicio 12

select n_pedido, fecha, to_char(sum(precio * cantidad), '990D00L') Importe_total
from LINEAS_PEDIDO lp
         join pedidos p using (n_pedido)
group by n_pedido, fecha
having sum(precio * cantidad) = (select max(sum(precio * cantidad)) Importe_total
                                 from LINEAS_PEDIDO lp
                                          join pedidos p using (n_pedido)
                                 group by n_pedido);

/* Otra solución (Sin anidar totales) */

select n_pedido, fecha, to_char(sum(precio * cantidad), '990D00L') Importe_total
from LINEAS_PEDIDO lp
         join pedidos p using (n_pedido)
group by n_pedido, fecha
having sum(precio * cantidad) >= all (select sum(precio * cantidad) Importe_total
                                      from LINEAS_PEDIDO lp
                                               join pedidos p using (n_pedido)
                                      group by n_pedido);

--Ejercicio 13

select n_pedido, fecha, nombre, to_char(sum(precio * cantidad), '990D00L') Importe_total
from LINEAS_PEDIDO lp
         join pedidos p using (n_pedido)
         join empresas em using (cif)
group by n_pedido, fecha, nombre
having sum(precio) = (select max(sum(precio)) Importe_total
                      from LINEAS_PEDIDO lp
                               join pedidos p using (n_pedido)
                      group by n_pedido)

union

select n_pedido, fecha, nombre, to_char(sum(precio * cantidad), '990D00L') Importe_total
from LINEAS_PEDIDO lp
         join pedidos p using (n_pedido)
         join empresas em using (cif)
group by n_pedido, fecha, nombre
having sum(precio) = (select min(sum(precio)) Importe_total
                      from LINEAS_PEDIDO lp
                               join pedidos p using (n_pedido)
                      group by n_pedido);