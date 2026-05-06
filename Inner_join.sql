-- JOIN
-- Es combinar, dos o mas tablas, al hacer consultas pordemos combinar la información
-- De dos tablas para generar un informe

-- INNER JOIN (intersección A ∩ B)
-- Combina filas de dos o más tablas basándose en una columna que tienen en común.
-- Muestra los registros que tienen coincidencia en ambas tablas
-- Nosotros indicamos que campo que va coincidir, es decir, el campo que va a ser la relación entre ambas tablas
SELECT * FROM persons;
SELECT * FROM invoices;

-- ENCABEZADOS DE FACTURAS
SELECT * FROM persons
INNER JOIN invoices
ON persons.id = invoices.person_id;

SELECT persons.id, persons.first_name, persons.last_name, persons.birthday,
    invoices.invoice_date
FROM persons
INNER JOIN invoices ON
    persons.id = invoices.person_id;

-- DETALLE DE FACTURAS
SELECT persons.id, persons.first_name, persons.last_name,
        invoices.invoice_date AS fecha_factura,
        products.product_name AS producto,
        invoice_items.quantity AS cantidad, invoice_items.price AS precio,
        (invoice_items.price * invoice_items.quantity) AS total
FROM persons
INNER JOIN invoices ON
    persons.id = invoices.person_id
    INNER JOIN invoice_items
    ON invoices.id = invoice_items.invoice_id
    INNER JOIN products
    ON products.id = invoice_items.product_id
    WHERE persons.first_name = 'Alejandro';


-- LEFT JOIN (A -B)
-- Combina filas de dos o más tablas basándose en una columna que tienen en común.

-- Mostrar todos nuestros usuarios asi no hayan comprado
SELECT first_name, last_name, invoice_date
FROM persons LEFT JOIN invoices
ON persons.id = invoices.person_id;

SELECT * FROM persons;
SELECT * FROM invoices;


-- RIGHT JOIN (B - A)
-- Combina filas de dos o más tablas basándose en una columna que tienen en común.
SELECT first_name, last_name, invoice_date
FROM invoices RIGHT JOIN persons
ON invoices.person_id = persons.id;


-- FULL JOIN (A U B)
SELECT * FROM alpha;
SELECT * FROM gamma;

INSERT INTO gamma
VALUES
(5, 'FIVE'),
(6, 'SIX'),
(7, 'SEVEN');

SELECT * FROM
alpha FULL JOIN gamma
ON alpha.id = gamma.id;