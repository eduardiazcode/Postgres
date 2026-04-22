-- Ordenar el resultado de la columna
SELECT * FROM persons;

-- ORDER BY numero de campo
SELECT * FROM persons
ORDER BY 2;

-- ORDER BY numero de campp descendente
SELECT * FROM persons 
ORDER BY 2 DESC;

-- ORDER BY numero de campo (fecha y hora de creracion)
SELECT * FROM persons 
ORDER BY 2, 5;

-- ORDER BY numero de campo (fecha y hora de creracion) DESCENDENTE
SELECT * FROM persons 
ORDER BY 2 DESC, 5 DESC;

-- order by nombre de campo
SELECT * FROM persons
ORDER BY last_name DESC;