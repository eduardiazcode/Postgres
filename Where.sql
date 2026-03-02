-- FILTROS
-- WHERE campo operador valor, ejemplo WHERE first name = 'Alexys'
select * from persons;

insert into persons(id, first_name, last_name, birthday, create_at, updated_at)
values 
(gen_random_uuid(), 'Ricardo', 'Perez', '1996-04-18', now(), null),
(gen_random_uuid(), 'Alonso', 'Dominguez', '2001-07-02', now(), null),
(gen_random_uuid(), 'Ricardo', 'Arjona', '1970-09-15', now(), null),
(gen_random_uuid(), 'Ricardo', 'Fernandez', '1992-03-24', now(), null),
(gen_random_uuid(), 'Ricardo', 'Altamirano', '2001-12-14', now(), null);

select * from persons where first_name = 'Ricardo';
select * from persons where first_name = 'Eduardo';

-- Funciones
select * from persons where first_name = 'EDUARDO';
select * from persons where upper(first_name) = 'EDUARDO';

-- OPeradores de comparacion
-- =
-- >
-- <
-- >=
-- <=
-- <>
select * from persons where upper(first_name) > 'EDUARDO';
select * from persons where upper(first_name) < 'EDUARDO';
select * from persons where upper(first_name) >= 'EDUARDO';
select * from persons where upper(first_name) <= 'EDUARDO';
select * from persons where upper(first_name) <>'EDUARDO';

-- AND & OR
select * from persons where upper(first_name) = 'EDUARDO' and last_name = 'Diaz';
select * from persons where upper(first_name) = 'Gabriel' or upper(first_name) = 'ALONSO';

-- LIKE: filtra caracteres cuando no cono0ces todo el valor del caracter (NORMAL)
select * from persons where upper(first_name) like  'EDUARDO';

-- LIKE: UN SOLO CARACTER '_'
select * from persons where upper(first_name) like  'E_U___O';

update persons
set first_name = 'Alejandro' where id = '379af6d2-aad2-4f79-acc1-ae0bb4fe03f8';

-- LIKE: varios caracteres '%'
select * from persons where upper(first_name) LIKE 'AL%';

-- ILIKE: filtra la informacion asi este en minuscula o mayuscula
select * from persons where first_name ILIKE 'edu%';