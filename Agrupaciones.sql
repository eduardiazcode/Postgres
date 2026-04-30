-- AGRUPACIONES
-- Tabla productos
CREATE TABLE products (
    id UUID DEFAULT gen_random_uuid() NOT NULL,
    product_name VARCHAR(50) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    CONSTRAINT products_id_pk PRIMARY KEY(id),
    CONSTRAINT products_product_name_uk UNIQUE(product_name)
);

-- Tabla encabezado de facturacion
CREATE TABLE invoices (
    id UUID DEFAULT gen_random_uuid() NOT NULL,
    invoice_date DATE DEFAULT now() NOT NULL,
    person_id UUID NOT NULL,
    CONSTRAINT invoices_id_pk PRIMARY KEY(id),
    CONSTRAINT invoices_person_id_pk FOREIGN KEY(person_id) REFERENCES persons (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

-- Tabla Detalle de facturacion
CREATE TABLE invoice_items (
    id UUID DEFAULT gen_random_uuid() NOT NULL,
    invoice_id UUID NOT NULL,
    product_id UUID NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    quantity INT DEFAULT 1 NOT NULL,
    CONSTRAINT invoice_items_id_pk PRIMARY KEY(id),
    CONSTRAINT invoice_items_invoice_id_fk FOREIGN KEY(invoice_id) REFERENCES invoices (id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT invoice_items_product_id_fk FOREIGN KEY(product_id) REFERENCES products (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

-- Insertar datos en productos
INSERT INTO
    products
VALUES
    (DEFAULT, 'Arroz', 12.31),
    (DEFAULT, 'Papa', 1.44),
    (DEFAULT, 'Carne', 20);

SELECT * FROM persons;

-- Insertamos datos en facturación
INSERT INTO
    invoices (person_id) VALUES ('8bed3dee-8804-47fa-9eed-e512f43c6ee4') RETURNING id;
INSERT INTO invoice_items
VALUES
    (DEFAULT, 'd6d3d0f8-077f-4913-bdd5-36c70a50ee76', 'f4cea3aa-28f9-4ccf-840b-860e7f9c1ce2', 14.11, 2),
    (DEFAULT, 'd6d3d0f8-077f-4913-bdd5-36c70a50ee76', 'effb190a-26a2-4392-a735-498240aaf1f6', 1.44, 1),
    (DEFAULT, 'd6d3d0f8-077f-4913-bdd5-36c70a50ee76', 'c72badc9-8b02-4e34-8774-8579880ea246', 21, 3);

INSERT INTO 
    invoices (person_id) VALUES ('4334cc33-ba3f-4766-b163-dd8500f2eafd') RETURNING id;
INSERT INTO invoice_items
VALUES
    (DEFAULT, '08cb29bb-7c5e-465c-aafa-2a537230f267', 'effb190a-26a2-4392-a735-498240aaf1f6', 1.44, 3),
    (DEFAULT, '08cb29bb-7c5e-465c-aafa-2a537230f267', 'c72badc9-8b02-4e34-8774-8579880ea246', 21, 12);

INSERT INTO
    invoices (person_id) VALUES ('9ab96a01-0709-47f3-8bf5-dc3d99cf7150') RETURNING id;
INSERT INTO invoice_items
VALUES
    (DEFAULT, '1acd13c4-03fa-4d8d-b6cf-01bcf6f9f0a1', 'f4cea3aa-28f9-4ccf-840b-860e7f9c1ce2', 14.11, 1),
    (DEFAULT, '1acd13c4-03fa-4d8d-b6cf-01bcf6f9f0a1', 'effb190a-26a2-4392-a735-498240aaf1f6', 1.44, 5);
    
INSERT INTO
    invoices (person_id) VALUES ('a5fc7744-5fb4-4f2e-88ef-5aec80a3f309') RETURNING id;
INSERT INTO invoice_items
VALUES
    (DEFAULT, 'a9347d08-8520-4aa1-b07e-742f05c8d92c', 'effb190a-26a2-4392-a735-498240aaf1f6', 2, 5);

INSERT INTO
    invoices (person_id) VALUES ('4d53c9b2-ca3f-4dda-8edd-5962f7a72b99') RETURNING id;
INSERT INTO invoice_items
VALUES
    (DEFAULT, 'f26a5507-4d16-42f2-b612-89ab5cf1bd6d', 'f4cea3aa-28f9-4ccf-840b-860e7f9c1ce2', 14.11, 1),
    (DEFAULT, 'f26a5507-4d16-42f2-b612-89ab5cf1bd6d', 'effb190a-26a2-4392-a735-498240aaf1f6', 1.44, 12);


-- CONSULTA DE AGRUPACIONES
-- 1. DISTINCT consulta la informaci;on distinguiendo la proyección
-- Elimina filas duplicadas del resultado de la consulta, solo devuelve valores unicos
SELECT DISTINCT last_name FROM persons;
SELECT * FROM persons;

-- 2. GROUP BY
-- Debe contener los campos proyectados a excepcion de las funciones'
-- Junta las filas que tienen algo en común y conviértelas en una sola fila con un resumen
SELECT last_name
FROM persons
GROUP BY last_name;


SELECT first_name, last_name
FROM persons
GROUP BY first_name, last_name;

-- Consultados información con funciones
SELECT first_name, COUNT(*) AS cantidad
FROM persons
GROUP BY first_name;

SELECT COUNT(*)
FROM persons;

SELECT first_name, COUNT(1) AS cantidad
FROM persons
GROUP BY first_name;

SELECT first_name, COUNT(last_name)
FROM persons
GROUP BY first_name;

SELECT first_name, COUNT(update_at) AS cantidad
FROM persons
GROUP BY first_name;
-- Aqui el resultado usando update_at me saldra cero porque al momento de registrar
-- update_at tiene datos nulos, asi que por eso el resultado DE CANTIDAD saldra 0
-- Mucho cuidado al tratar de buscasr informacion y insertar el nombre de la columna usando COUNT()

-- Preguntas con SQL
-- ¿Cual es el total de ventas de la primera factura?
SELECT * FROM invoices;
SELECT * FROM invoice_items;
SELECT * FROM invoice_items WHERE invoice_id = 'd6d3d0f8-077f-4913-bdd5-36c70a50ee76';

SELECT SUM(price * quantity) 
FROM invoice_items WHERE invoice_id = 'd6d3d0f8-077f-4913-bdd5-36c70a50ee76';
-- El total de la factura es 92.66

--¿Cuanto es el total de todas las facturas, agrupado por factura?
SELECT invoice_id, SUM(price * quantity)
FROM invoice_items
GROUP BY invoice_id;

-- ¿Cuanto ha comprado el cliente Pedro Sanchez?
SELECT * FROM invoices WHERE person_id = '8bed3dee-8804-47fa-9eed-e512f43c6ee4';
SELECT SUM(price * quantity)
FROM invoice_items WHERE invoice_id = 'd6d3d0f8-077f-4913-bdd5-36c70a50ee76';

-- ¿Cuanto ha comprado el cliente Albertano Santa Cruz?
SELECT * FROM invoices WHERE person_id = 'a5fc7744-5fb4-4f2e-88ef-5aec80a3f309';
SELECT SUM(price * quantity)
FROM invoice_items WHERE invoice_id = 'a9347d08-8520-4aa1-b07e-742f05c8d92c';

-- ¿Cual producto se ha vendido mas/menos en cantidad?
SELECT * FROM invoice_items;
SELECT product_id, SUM(quantity) AS cantidad, SUM(price * quantity) AS ganancia
FROM invoice_items
GROUP BY product_id
ORDER BY 2;