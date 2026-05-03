-- FILTROS
-- WHERE => la principal herramienta para hacer filtros
-- campo operador valor, ejemplo: WHERE first_name 'Alexys';
INSERT INTO persons
VALUES
(gen_random_uuid(), 'Alejandro', 'Perez', '2022-04-13', DEFAULT, DEFAULT),
(gen_random_uuid(), 'Vitor', 'Lambda', '2003-07-31', DEFAULT, DEFAULT),
(gen_random_uuid(), 'Albertano', 'Santa Cruz', '1989-12-14', DEFAULT, DEFAULT),
(gen_random_uuid(), 'Ichigo', 'Kurosaki', '2000-06-10', DEFAULT, DEFAULT);

INSERT INTO persons
VALUES
(gen_random_uuid(), 'Alejandro', 'De la Vega', '2022-04-13', DEFAULT, DEFAULT),
(gen_random_uuid(), 'Alejandro', 'Guerrero', '2022-04-13', DEFAULT, DEFAULT);
-----------------------------------------------------------------------------

SELECT * FROM persons WHERE first_name = 'Alejandro';

-- 1. FUNCIONES
SELECT * FROM persons WHERE upper(first_name) = 'ALEJANDRO';
SELECT * FROM persons WHERE length(last_name) = 10;

-- 2. OPERADORES DE COMPARACIÓN
-- (<>),(!=),(<=),(>=),(=)
SELECT * FROM persons WHERE length(first_name) = 9;
SELECT * FROM persons WHERE length(first_name) < 9;
SELECT * FROM persons WHERE length(first_name) > 9;
SELECT * FROM persons WHERE length(first_name) != 9;
SELECT * FROM persons WHERE length(first_name) <> 5;

-- 3. AND & OR
SELECT * FROM persons WHERE upper(first_name) = 'Alejandro' OR last_name <> 'De la Vega';
SELECT * FROM persons WHERE upper(first_name) = 'ALEJANDRO' OR first_name = 'Albertano';
SELECT * FROM persons WHERE upper(first_name) = 'ALEJANDRO' AND last_name = 'Perez';

-- 4. LIKE normal
SELECT * FROM persons WHERE upper(first_name) LIKE 'ALEJANDRO';

-- 4.1 LIKE un solo caracter (_)
SELECT * FROM persons WHERE upper(first_name) LIKE 'ALEJAN__O';

-- 4.2 LIKE varios caracteres (%)
SELECT * FROM persons WHERE upper(first_name) LIKE 'AL%';

-- 5. ILIKE
SELECT * FROM persons WHERE first_name ILIKE '%Go%'; -- cuando con que empieza y con que termina
SELECT * FROM persons WHERE last_name ILIKE '% %';

-- 6. BETWEEN (entre fechas o numeros)
SELECT * FROM persons WHERE birthday BETWEEN '1989-01-01' AND '2007-12-31';

-- 7. IN VALORES
INSERT INTO jobs
VALUES 
(DEFAULT, '4d53c9b2-ca3f-4dda-8edd-5962f7a72b99', 'Peluquero', '2007-07-30', now()),
(DEFAULT, '8456f652-0b3a-4ee7-938e-a49a10979334', 'Futbolista', '2002-03-02', now()),
(DEFAULT, '9ab96a01-0709-47f3-8bf5-dc3d99cf7150', 'Contador', '2013-06-04', now()),
(DEFAULT, 'a5fc7744-5fb4-4f2e-88ef-5aec80a3f309', 'Mecanico', '1998-01-12', now()),
(DEFAULT, 'e56a6fed-17d2-4bd9-bb95-7dfdd856817f', 'Mecanico', '2007-07-30', now());

SELECT * FROM jobs WHERE job_name IN ('Peluquero', 'Futbolista', 'Mecanico');

-- 8. IN SELECT
SELECT * FROM jobs
WHERE persons_id IN (SELECT id from persons);

SELECT * FROM persons;

SELECT * FROM persons
WHERE id IN (SELECT persons_id FROM jobs);

-- 9. IS NULL
SELECT * FROM jobs  WHERE update_at IS NULL;

-- 10. NOT
SELECT * FROM jobs WHERE update_at IS NOT NULL;

SELECT * FROM persons
WHERE id NOT IN (SELECT persons_id FROM jobs);