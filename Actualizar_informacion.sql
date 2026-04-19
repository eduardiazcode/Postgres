-- 1. Actualizar información


-- UDPATE TABLA
-- SET campo1 = valor1 campo2 = valor2, ..., campoN = valorN
-- WHERE campoM = valorM;

UPDATE persons
SET
id = gen_random_uuid(),
last_name = 'Sanchez',
birth_date = '2004-12-02'
WHERE id IS NULL;

UPDATE persons
SET
first_name = 'Alejandro',
last_name = 'Rodriguez'
WHERE id = 'dc5c2d7a-4360-405b-a0c2-8d21d65966bd';

UPDATE persons
SET
available_for_work = FALSE;
-- No olvidar colocar el WHERE a menos que se quiera hacer el cambio en toda la tabla


-- 2. Borrar información
-- DELETE FROM table WHERE campoM = valorM
INSERT INTO persons
VALUES
(gen_random_uuid(), NULL, 'Sanchez', NULL, NULL, NULL),
(gen_random_uuid(), 'America y Europa', 'Maldonado', DEFAULT, DEFAULT,  DEFAULT);
-- Eliminaremos estos datos que tiene valores que no deseamos

-- OR SE EJECUTARA CUANDO QUIERA ELIMINAR DOS REGISTROS O
DELETE FROM persons WHERE
first_name IS NULL OR
first_name = 'America y Europa';


-- TRUNCATE TABLE tabla;
-- TRUNCATE elimina todos los registros de manera inmediata sin excepcion alguna
TRUNCATE TABLE persons;