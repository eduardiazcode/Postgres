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
INSERT INTO persons (id, first_name, last_name, email, birth_date, available_for_work)
VALUES(DEFAULT, 'Pedro', DEFAULT, 'pedro.perez@gmail.com', DEFAULT, True);