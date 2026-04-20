-- 1. Restricciones de llaves primarias, llave unica y llave foranea

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

-- 2. Llaves Foraneas
-- CREAR TABLA DE EMPLEOS
CREATE TABLE jobs(
    id UUID DEFAULT gen_random_uuid() NOT NULL,
    persons_id UUID NOT NULL,
    job_name VARCHAR(50) NOT NULL,
    create_at TIMESTAMP DEFAULT now() NOT NULL,
    update_at TIMESTAMP,
    CONSTRAINT jobs_id_pk PRIMARY KEY (id),
    CONSTRAINT jobs_persons_id_fk FOREIGN KEY (persons_id)
        REFERENCES persons(id) -- indica que se va relacionar con la tabla persons con el campo id
        ON UPDATE RESTRICT -- No se le permite actualizar el id la tabla padre si ya tiene registros en la tabla hija
        ON DELETE RESTRICT -- No se le permite borrar el id en la tabla padre si ya tiene registros en la tabla hija
        -- Y en caso pues se requiera actualizar los ids en la tabla padre entonces que eso cambios
        -- Tambien se generen en la tabla hija para eso cambiamos el RESTRIC => (CASCADE)
);

-- Insertar datos en los empleos
INSERT INTO jobs
VALUES (DEFAULT, '8bed3dee-8804-47fa-9eed-e512f43c6ee4', 'Alfarero', DEFAULT, DEFAULT);

-- Insertar ID que no esta en la tabla padre
INSERT INTO jobs
VALUES (DEFAULT, '7bad3dee-8804-47fa-9eed-e512f43c6ee4', 'Alfarero', DEFAULT, DEFAULT);
-- No se puede incluir debido a que este id no esta presente en la tabla persons

-- Intento de borrada de un registro que esta conectado a la tabla jobs
DELETE FROM persons
WHERE id = '8bed3dee-8804-47fa-9eed-e512f43c6ee4';
-- No se podra borrar debido a que el id ya esta conectada a la tabla jobs

-- Intento de borrado de un registro que no esta conectado a la tabla jobs
DELETE FROM persons
WHERE id = 'b781d71e-354c-4c3d-80a5-91d03c82cd72';
-- Este si se pudo borrar porque el id no estaba conectado a la tabla jobs
-- No tenia hijos en otras tablas, no tenia relaciones 