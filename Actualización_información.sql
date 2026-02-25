-- Actualizar información

-- UPDATE tabla
-- SET campo1 = valor1, campo2 = valor2, ..., campoN = valorN
--- WHERE campoM = valorM;
UPDATE persons
SET first_name = 'Pedro', last_name = 'Sánchez'
WHERE id = '1ea2231c-b783-481b-ac3a-23b6f10e2c77';

UPDATE persons
SET available = False;

-- Borrar información

-- DELETE FROM tabla WHERE campoM = valorM;
DELETE FROM persons WHERE id IS NULL;

-- TRUNCATE elimina todos los registros de la tabla y no necesita WHERE
-- TRUNCATE TABLE tabla;
TRUNCATE TABLE persons;