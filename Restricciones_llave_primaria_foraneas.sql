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
