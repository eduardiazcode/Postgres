-- Crear tabla de personas
-- ID, primer nombre, apellido, edad, correo electronico, fecha de nacimiennto, disponible trabajo
CREATE TABLE persons(
    id UUID,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age SMALLINT,
    email VARCHAR(100),
    birth_date DATE,
    available_for_work BOOLEAN
);

-- Crea la tabla de trabajos
-- ID, ID de la persona, fecha de inicio, fecha de fin, actual trabajo
CREATE TABLE jobs(
    id UUID,
    persons_id UUID,
    start_date DATE,
    end_date DATE,
    current_job BOOLEAN
);

-- Borrar la edad de la tabla de personas
ALTER TABLE persons DROP COLUMN age;

-- Agregar nombre del trabajo a la tabla de trabajos
ALTER TABLE jobs ADD COLUMN job_name VARCHAR(60);