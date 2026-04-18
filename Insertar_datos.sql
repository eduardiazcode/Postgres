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
