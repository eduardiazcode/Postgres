-- SELECT
-- Puede recibir constantes, expresiones, funciones, campos de tablas

-- 1. CONSTANTES
SELECT 'Hola mundo', 'Hola mundo';
SELECT 8, 8 , 8, 8;
SELECT 'Eduardo', 'Michael', 'Nestor', 'Alexander';

-- 2. EXPRESIONES
SELECT 2*2+2/2;

-- 3. CASTING: es convertir un valor de un tipo de dato a otro. Por ejemplo, convertir un número a texto
SELECT 8::NUMERIC/42::NUMERIC;
SELECT '42'::INTEGER;
SELECT '24/11/2005'::DATE;

-- Cast no validos
SELECT 'Hola mundo'::INT; -- no se puede convertir caracteres a numeros

-- Sumar tiempo a una fecha
SELECT '2005-11-18'::DATE + 2; --suma directa
SELECT '2007-05-10'::DATE + INTERVAL'2 days'; -- Usando sintaxis estandar

-- 4. FUNCIONES
SELECT now(); -- now es la fecha actual del sistema
SELECT length('Hola mundo');
SELECT upper('Como estas');
SELECT lower('MUNDO POSTGRESQL');

-- 5. CAMPOS DE TABLAS
SELECT * FROM students;
SELECT id, first_name, is_active
FROM students;

-- Uniendo lo anterior con ALIAS
SELECT id, 
upper(first_name) AS first_name, 
length(first_name) AS tamaño_name, 
(2*3/2) AS aritmetica,
(8::NUMERIC/100::NUMERIC) AS casting,
'Estudiante' as constante
FROM students;