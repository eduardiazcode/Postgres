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