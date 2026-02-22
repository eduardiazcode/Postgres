-- Crear tabla de personas
-- ID, primer nombre, apellido, edad, fecha nacimiento, disponiblidad
CREATE TABLE persons(
    id UUID,
    first_name VARCHAR(60),
    last_name VARCHAR(60),
    age SMALLINT,
    birthday date,
    available BOOLEAN
);

-- Crear tabla de trabajos
-- ID, ID Persona, fecha inicial, fecha final, actual
CREATE TABLE JOBS(
    id UUID,
    persons_id UUID,
    begins_at DATE,
    end_at DATE,
    currently BOOLEAN
);

-- Borrar la edad de la tabla personas
ALTER TABLE persons DROP COLUMN age;

-- Agrega el nombre del trabajo a la tabla de trabajos
ALTER TABLE jobs ADD COLUMN job_name VARCHAR(50);

-- Crea tabla que vamos a borrar
CREATE TABLE para_borrar(
    id SERIAL,
    howto VARCHAR(50)
);

-- Borrar tabla innecesaria
DROP TABLE para_borrar;