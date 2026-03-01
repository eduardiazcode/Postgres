-- SELECT
-- Puedo recibir constantes, expresiones, funciones, campos de tablas

-- Constantes
-- Puedes proyectar cualquier tipo de dato diferente, cadenas, numeros y booleanos
select 'Hola mundo';
select 8;

-- Expresiones
-- Puedes probar funciones, hacer cálculos rapidos o generar filas manualmente
select 2*2+2/2;

-- Cast
-- Sintaxis:  expresion:: tipo_de_dato
-- A veces postgres no sabe que tipo de datos es tu constante. Se lo dices con ::
select 8::numeric/32::numeric;

select
'100':: INTEGER + 50 as suma,
'2026-02-07' :: DATE as FECHA,
1 :: BOOLEAN as es_valido;

-- Cast no valido
-- Hola es una cadena y no lo podra convertir a un numero entero
select 'Hola'::int;

-- Cast valido
-- De string a date
select '2021-12-24'::date;



-- Funciones
select now(); -- now es la fecha actual del sistema
select upper('Hola mundo'); -- upper convierte las minusculas en mayusculas
select lower('Hola mundo'); -- lower convierte las mayusculas en minusculas


-- Campos de Tablas
-- FROM: nos indica de que tabla vamos a recibir la información
-- * : busca cada uno de los campos que estamos seleccionando con from
select * from students;

-- Tambien podemos darle el orden en el que queremos consultar
select first_name, is_active, id
from students;

-- Uniendo lo anterior
select id, upper(first_name), 2+5::numeric/3::numeric, 'Estudiante'
from students;

-- ALIAS
-- as: sirve para colocar el nombre a la columna o campo
select id, upper(first_name) as first_name,
2+5::numeric/3::numeric as expresion,
'Estudiante' as tipo_persona
from students;

-- Le llamamos proyeccion a todos los campos que queremos que devuelva una consulta SQL