-- Restricciones de llaves primarias, llave unica y llave foranea

-- La eliminacion de esta tabla esta usando una condicional que primero verifica que la tabla exista
-- Si esta no existiera solo mostrara una advertencia y conitunuara con el resto del código
DROP TABLE IF EXISTS persons;
DROP TABLE IF EXISTS jobs;

-- CREAR LA TABLA PERSONAS
CREATE TABLE persons (
    id UUID DEFAULT gen_random_uuid() NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birthday DATE NOT NULL,
    create_at TIMESTAMP DEFAULT now() NOT NULL,
    update_at TIMESTAMP,
    CONSTRAINT persons_id_pk PRIMARY KEY (id),
    CONSTRAINT persons_first_name_last_name_uk UNIQUE (first_name, last_name)
);

-- PRIMARY KEY: Garantiza que cada persona sea única e irrepetible. Al ser UUID, es ideal para sistemas distribuidos.
-- UNIQUE: Es una llave compuesta. Evita duplicados lógicos (no puede haber dos "Juan Perez" idénticos), aunque tengan IDs diferentes

-- INSERTAR DATOS EN LA TABLA PERSONAS
INSERT INTO persons
VALUES (DEFAULT, 'Pedro', 'Garcia', now(), DEFAULT, NULL);

-- Viola restricciones de UK
INSERT INTO persons
VALUES (DEFAULT, 'Pedro', 'Garcia', now(), DEFAULT, NULL);

INSERT INTO persons
VALUES (DEFAULT, 'Pedro', 'Sanchez', now(), DEFAULT, NULL);

-- Viola restricciones de PK
INSERT INTO persons
VALUES ('b781d71e-354c-4c3d-80a5-91d03c82cd72', 'Natalie', 'Suarez', now(), DEFAULT, NULL);