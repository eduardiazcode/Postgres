-- Insertar Datos

-- 1. Insert into tabla (campo1, ..., campoN) VALUES (valor1, ..., valorN)
INSERT INTO persons (id, first_name, last_name, birthday, available)
VALUES (gen_random_uuid(), 'Eduardo', 'Diaz', '2000-04-10', True);

INSERT INTO persons (birthday, first_name, id, available, last_name)
VALUES ('1963-07-28', 'Alejandro', gen_random_uuid(), False, 'Coaquira');

-- 2. Inser into tabla VALUES (valor1, valor2, ..., valorN)
INSERT INTO persons
VALUES (gen_random_uuid(), 'Maikol', 'Fernandez', '2005-11-02', False)

-- 3. Insert into tabla VALUES (defaulr, valorN, valorM, ..., valorZ);
INSERT INTO persons
VALUES (DEFAULT, 'Eduardo', DEFAULT, DEFAULT, True);

-- 3.1. Valores por defecto
CREATE TABLE students (
    id UUID DEFAULT gen_random_uuid(),
    first_name VARCHAR(50),
    is_active BOOLEAN DEFAULT true,
    create_at_ TIMESTAMP DEFAULT now()
);

INSERT INTO students
VALUES (DEFAULT, 'Carlos', DEFAULT, DEFAULT);

INSERT INTO students (first_name)
VALUES ('Chayanne');

-- Insertar varios datos
-- 4. Insert into tabla VALUES (valorA1, ..., valorAn) (valorB1, ..., valorBN);
INSERT INTO students
VALUES
(DEFAULT, 'Miriam', DEFAULT, DEFAULT),
(DEFAULT, 'Carla', DEFAULT, DEFAULT),
(DEFAULT, 'Alexia', DEFAULT, DEFAULT),
(DEFAULT, 'Peter', DEFAULT, DEFAULT);

INSERT INTO students (first_name, create_at_)
VALUES
('Michelle', '2022-08-15'),
('Juan', '2022-11-02');

INSERT INTO students (first_name, is_active, create_at_)
VALUES
('Pablo', False, '2023-03-24'),
('Esperanza', False, '2024-04-12');

-- Insertar datos provenientes de otra tabla
-- 5. Insert into tabla SELECT your-query;
CREATE TABLE tmp_student(
    f_name VARCHAR(60),
    active BOOLEAN
);

INSERT INTO tmp_student
VALUES
('Primer', TRUE),
('Segundo', FALSE),
('Tercero', TRUE),
('Cuarto', TRUE);

INSERT INTO students (first_name, is_active)
SELECT f_name, active
FROM tmp_student

-- 6. Datos nulos
DROP TABLE students;

CREATE TABLE students(
    id UUID DEFAULT gen_random_uuid() NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    is_active   BOOLEAN NOT NULL,
    create_at_ TIMESTAMP DEFAULT now() NOT NULL,
    update_at TIMESTAMP
);

INSERT INTO students
VALUES
(DEFAULT, 'Pedro', True, DEFAULT, DEFAULT);

-- No es posible porque viola las restricciones de nulo
