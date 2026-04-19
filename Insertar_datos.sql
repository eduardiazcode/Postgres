-- Insertar datos

-- 1. Insert into tabla (campo1, campo2, ..., campoN) values (valor1, valor2, ..., valorN);
INSERT INTO persons (id, first_name, last_name, email, birth_date, available_for_work)
VALUES(gen_random_uuid(), 'Pedro', 'Perez', 'pedro.perez@gmail.com', '1980-02-15', True);

INSERT INTO persons (first_name, last_name, birth_date, available_for_work, email, id)
VALUES('Pedro', 'Perez','1980-02-15', True,'pedro.perez@gmail.com', gen_random_uuid());

-- 2. Insert into tabla values (valor1, valor2, ..., valorN)
INSERT INTO persons
VALUES(gen_random_uuid(), 'Pedro', 'Perez', 'pedro.perez@gmail.com', '1980-02-15', True);

-- 3. Insert into tabla (default, valorN, valorM, ..., valorZ);
INSERT INTO persons
VALUES(DEFAULT, 'Pedro', DEFAULT, 'pedro.perez@gmail.com', DEFAULT, True);

-- 3.1 Valores por defecto

CREATE TABLE students (
    id UUID DEFAULT gen_random_uuid(),
    first_name VARCHAR(50),
    is_active BOOLEAN DEFAULT TRUE,
    create_at TIMESTAMP DEFAULT now()
);

INSERT INTO students
VALUES (DEFAULT, 'Richard', DEFAULT, DEFAULT);

INSERT INTO students (first_name)
VALUES ('Alexander')

-- 4. Insert into tabla VALUES (valorA1, ..., valorN),(valorB1, ..., valorBN);
-- Insertar varios valores dentro de una tabla
INSERT INTO students
VALUES
(DEFAULT, 'Moises', DEFAULT, DEFAULT),
(DEFAULT, 'Shakira', DEFAULT, DEFAULT),
(DEFAULT, 'Alberto', DEFAULT, DEFAULT),
(DEFAULT, 'Sergio', DEFAULT, DEFAULT);

-- Insertar datos en columnas en especifico
INSERT INTO students (first_name, create_at)
VALUES
('Rodrigo', '2005-06-01'),
('Michelle', '2003-02-21');

-- Insertar datos desde una consulta
-- 5. Insert into tabla SELECT your-query
CREATE TABLE tmp_students (
    f_name VARCHAR(50),
    active BOOLEAN
);

INSERT INTO tmp_students
VALUES
('Primer', TRUE),
('Segundo', FALSE),
('Tercero', TRUE),
('CUARTO', TRUE);

INSERT INTO students(first_name, is_active)
SELECT f_name, active
FROM tmp_students;

-- 6. Datos nulos
INSERT INTO students VALUES (NULL, NULL, NULL, NULL);

DROP TABLE students;

CREATE TABLE students (
    id UUID DEFAULT gen_random_uuid() NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    is_active BOOLEAN NOT NULL,
    create_at TIMESTAMP DEFAULT now() NOT NULL,
    update_at TIMESTAMP
);

INSERT INTO students
VALUES (DEFAULT, 'Joel', TRUE, DEFAULT, DEFAULT);