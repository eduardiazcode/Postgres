-- Restricciones de llave primaria, llave única y llaves foráneas
DROP TABLE IF EXISTS persons;
DROP TABLE IF EXISTS jobs;

-- CREAR TABLA PERSONAS
CREATE TABLE persons(
    id UUID DEFAULT gen_random_uuid() NOT NULL,
    first_name VARCHAR(60) NOT NULL,
    last_name VARCHAR(60)NOT NULL,
    birthday DATE NOT NULL,
    create_at TIMESTAMP DEFAULT now() NOT NULL,
    updated_at TIMESTAMP,
    CONSTRAINT persons_id_pk PRIMARY KEY (id),
    CONSTRAINT persons_firt_name_last_name_uk UNIQUE (first_name, last_name)
);

INSERT INTO persons
VALUES (DEFAULT, 'Eduardo', 'Diaz', '2015-06-07', DEFAULT, NULL);

-- Viola las restricciones de unique k
INSERT INTO persons
VALUES (DEFAULT, 'Eduardo', 'Diaz', '2015-06-07', DEFAULT, NULL);

-- Viola las restricciones de primary key
INSERT INTO persons
VALUES ('379af6d2-aad2-4f79-acc1-ae0bb4fe03f8', 'Eduardo', 'Chavez', '2015-06-07', DEFAULT, NULL);

INSERT INTO persons
VALUES (DEFAULT, 'Eduardo', 'Álvarez', '2021-05-24', DEFAULT, NULL);

INSERT INTO persons
VALUES (DEFAULT, 'Diego', 'De la Vega', '2000-09-19');

-- LLAVES FORANEAS
-- CREAR LA TABLA DE EMPLEOS
CREATE TABLE jobs(
    id UUID DEFAULT gen_random_uuid() NOT NULL,
    persons_id UUID NOT NULL,
    job_name VARCHAR(50) NOT NULL,
    create_at TIMESTAMP DEFAULT now() NOT NULL,
    update_at TIMESTAMP,
    CONSTRAINT jobs_id_pk PRIMARY KEY(id),
    CONSTRAINT jobs_persons_id_fk FOREIGN KEY(persons_id)
        REFERENCES persons (id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

-- Insertar datos en los empleos
INSERT INTO jobs
    VALUES (DEFAULT, '3fcc8ec5-a7d0-4803-8ed2-1e9d6f32f228', 'DEVELOPER', DEFAULT, now()
);
 -- No podra insertar este registro porque no existe en la tabla padre persons
INSERT INTO jobs
    VALUES (DEFAULT, 'abcc8ec5-a7d0-4803-8ed2-1e9d6f32f228', 'DEVELOPER', DEFAULT, now()
);

UPDATE jobs
SET update_at = NULL
WHERE id = '028e8e47-2790-4672-9651-668eb76b2326'

-- Intento de borrado de información de personas
DELETE FROM persons
WHERE id = '3fcc8ec5-a7d0-4803-8ed2-1e9d6f32f228';

DELETE FROM persons
WHERE id = '7432dd98-22e6-4992-a64b-cb9a83448848';