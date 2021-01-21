create table alumnos(
   dni char(9) constraint alumnos_pk primary key,
   nombre varchar(50) constraint alumnos_nn1 not null,
   apellido1 varchar(50) constraint alumnos_nn2 not null,
   apellido2 varchar(50) constraint alumnos_nn3 not null,
   direccion varchar(50),
   telefono char(9),
   edad number(2),
   cif char(9)
);

INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12030430 ', 'Vanesa', 'Megino', 'Sánchez', 'c Abril 1', null, 20, '13000000J');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12049558 ', 'Luis', 'Abadía', 'Castrourdiales', 'c Mayor 45', '979721215', 35, '18000000Z');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12080980 ', 'Luisa', 'Calvo', 'Calvo', 'Avda Cardenal Cisneros 25', '979100011', 63, '20000000L');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12162777 ', 'Mercedes', 'Aragón', 'Cantor', 'c Clavel 3', '979700123', 54, '18000000Z');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12178979 ', 'Laura', 'Albero', 'Siniestra', 'Avda República Argentina 6', null, 45, '19000000H');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12213987 ', 'Matías', 'Hierro', 'Amo', 'c menéndez Pidal 7', '979700231', 38, '12000000H');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12239347 ', 'Esperanza', 'Castro', 'González', 'Carretera del Monte s/n', '979711635', 33, '12000000H');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12312908 ', 'Clarisa', 'Matachel', 'Garrido', 'C Tello Téllez 4', '639272777', 38, '19000000H');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12323844 ', 'Jaime', 'López', 'Herrero', 'Avda Cardenal cisneros 15', '979725454', 46, '13000000J');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12324372 ', 'Marisol', 'Triana', 'Crespo', 'Paseo del Otero 2', '979741716', 22, '09000000A');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12341222 ', 'Pura', 'Abadía', 'Sánchez', 'C Valentín Calderón 12', null, 24, '12000000H');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12343647 ', 'Rául', 'Baños', 'Del Mesón', 'C Mayor 26', null, 48, '12000000H');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12345678 ', 'Jaime', 'Seco', 'Maestro', 'C Mayor 55', '979723451', 24, '17000000K');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12347847 ', 'Marisa', 'Sánchez', 'Gonzalez', 'Paseo de San José 2', '979703918', 35, '18000000Z');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12354488 ', 'Antonio', 'Vallejo', 'Giner', 'Avda Valladolid 18', '979741625', 27, '18000000Z');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12354545 ', 'Ana María', 'Abadía', 'Castrourdiales', 'c Ferrocarril 2', '979725438', 46, '19000000H');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12364646 ', 'Antonio', 'Sánchez', 'Fernández', 'Avda Castilla 15', '979730916', 62, '12000000H');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12377474 ', 'Jana', 'Hernandez', 'Viejo', 'Avda Vacceos 13', '979722722', 33, '09000000A');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12384767 ', 'Maite', 'Bermejo', 'Sonsalve', 'C mayor 12', '731878787', 26, '21200000U');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12387475 ', 'Luis', 'Pérez', 'Cristo', 'c Mayor Antigua 11', '979731725', 24, '11000000G');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12434355 ', 'Mari Carmen', 'Sánchez', 'Sánchez', 'C La Cestilla 12', null, 24, '11000000G');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12434754 ', 'María Teresa', 'Alonso', 'Hierro', 'Plaza Rabi Sem Top 1', '979741625', 46, '19000000H');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12564722 ', 'Marcos', 'Asensio', 'Castro', 'Plaza Mayor 11', '979712221', 32, '19000000H');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12567733 ', 'Carla', 'Edberg', 'MacGregorg', 'plaza de León 7', '979732101', 33, '12000000H');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12654424 ', 'Pablo', 'Varilla', 'Sánchez', 'Avda Santander 11', '979712222', 61, '18000000Z');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12776767 ', 'Pedro', 'Pérez', 'Sánchez', 'Avda Asturias 11', '979723456', 43, '17000000K');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('12890374 ', 'Miguel', 'Díez', 'Hueso', 'Avda Madrid 12', '979878882', 55, '21200000U');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('21254545 ', 'Eloisa', 'Caballero', 'Jiménez', 'Avda Modesto Lafuente 11', '979712543', 35, '18000000Z');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('21394854 ', 'Lucía', 'Sánchez', 'Bueno', 'C Clavel 13', '979733637', 57, '19000000H');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('21721897 ', 'Pedro', 'Juárez', 'Mencía', 'paseo Frailes 1', '979701234', 19, '21200000U');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('22383278 ', 'Jorge Luis', 'Andérez', 'Sánchez', 'C Mayor 17', '979728889', 62, '17000000K');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('23436478 ', 'Alfredo', 'Sebastián', 'Hernández', 'Avda Castilla 11', '979738748', 35, '11000000G');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('23438789 ', 'Marte', 'Bentura', 'Arístide', 'Paseo del Otero 4', '979723788', 25, '18000000Z');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('23462378 ', 'Johann', 'Mazukelle', 'Nburu', 'Avda Santander 36', '978932399', 61, '18000000Z');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('23687236 ', 'Venus', 'Bentura', 'Arístide', 'Paseo del Otero 4', '979723788', 23, '18000000Z');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('24734484 ', 'Javier', 'Rodríguez', 'López', 'Avda Santander 12', '979702950', 68, '17000000K');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('26343287 ', 'Arancha', 'Luanco', 'De Cea', 'C Tello Téllez 12', '645488458', 57, null);
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('32623782 ', 'Matilde', 'Sánchez', 'Herrero', 'Avda Asturias 3', '654874578', 42, '17000000K');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('34263248 ', 'Alicia', 'Martín', 'Mondragón', 'C Eras del Bosque 3', '979718188', 21, '12000000H');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('34436778 ', 'Agapito', 'Bentura', 'Fontecha', 'Paseo del Otero 4', '979723788', 52, '18000000Z');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('34543545 ', 'Mario', 'Castrejón', 'Hernández', 'c padilla 11', '979754544', 44, '19000000H');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('43267437 ', 'Victoria', 'Laguardia', 'Cabello', 'Avda Castilla 11', '979738748', 32, '18000000Z');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('43643785 ', 'Mercurio', 'Bentura', 'Arístide', 'Paseo del Otero 4', '979723788', 22, '18000000Z');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('43734348 ', 'Pedro', 'García', 'García', 'C La Iglesia 3', '979777727', 32, '11000000G');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('43763478 ', 'Clara', 'Crespo', 'Luzón', 'Avda Asturias 3', null, 45, '18000000Z');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('45678091 ', 'Ricardo', 'Ansón', 'Pérez', 'c Mayor 13', '979771234', 21, '09000000A');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('54234111 ', 'Luisa', 'Abadía', 'Sánchez', 'c Mayor 13', '979751230', 62, '12000000H');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('54675477 ', 'Ivan', 'Nefedov', 'Raminski', 'Avda Modesto Lafuente 11', '979666666', 40, '13000000J');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('71327389 ', 'Alberto', 'Guerra', 'Sinés', 'c Balmes 13', '659871872', 21, null);
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('71763276 ', 'Carola', 'Lombardi', 'Sewiss', 'Avda República Argentina 27', '759672666', 23, null);
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('73628362 ', 'Jaime', 'Vega', 'Saldaña', 'c Mayor 25', '727672666', 32, '19000000H');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, EDAD, CIF) VALUES ('76782637 ', 'Maia', 'Jaúregi', 'Mendizábal', 'C Juan Bravo 7', '733451987', 39, '18000000Z');

commit;

--Ejercicio 1
select nombre,apellido1 from alumnos where edad>=25;

--Ejercicio 2
select apellido1||' '||apellido2||', '||nombre "Nombre Completo" from alumnos order by apellido1,apellido2,nombre;

--Ejercicio 3
select nombre,apellido1,apellido2 from alumnos where telefono is null;

--Ejercicio 4
select nombre,apellido1,apellido2 from alumnos where apellido1 like 'S_nchez' and apellido2 like 'S_nchez';

--Ejercicio 5
select nombre,apellido1,apellido2 from alumnos where apellido1=apellido2;

--Ejercicio 6
select nombre,apellido1,apellido2 from alumnos where telefono like '6%' or telefono like '7%';

--Ejercicio 7
select nombre,apellido1,apellido2,telefono from alumnos where telefono like '%5%5%';

--Ejercicio 8
select nombre,apellido1,apellido2 from alumnos where telefono like '%5%5%' and edad > 50;

--Ejercicio 9
select nombre,apellido1,apellido2,direccion from alumnos where direccion like '_ _ayor%';

--Ejercicio 10
select nombre,apellido1,apellido2 from alumnos where edad in(20,35,45);

--Ejercicio 11
select nombre,apellido1,apellido2 from alumnos where apellido1 like 'C%' or apellido1 like 'H%' or apellido1 like 'S%';

--Ejercicio 12
select nombre,apellido1,apellido2,edad,edad+10 "Edad dentro de 10 años" from alumnos;

--Ejercicio 13
delete from alumnos where telefono is null;
rollback;

--Ejercicio 14
alter table alumnos add email varchar2(50);
update alumnos set email=nombre||apellido1||'@academiabosco.es';
select * from alumnos;

--Ejercicio 15
--alter table alumnos add constraint alumnos_ck check(telefono in ('9%','6%','7%'));
alter table alumnos add constraint alumnos_ck check(telefono like '9%' or telefono like '6%' or telefono like '7%');
--alter table alumnos drop constraint alumnos_ck;