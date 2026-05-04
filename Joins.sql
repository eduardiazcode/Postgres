-- JOINS
--  combina filas de dos o más tablas basándose en una columna que tienen en común.

-- Conteo de registros de nuestras tablas
SELECT COUNT(*) FROM invoices;
SELECT COUNT(*) FROM invoice_items;

-- CROSS JOIN
-- combina todo con todo

-- CROSS JOIN sin usar la cláusula JOIN
SELECT *
FROM invoices, invoice_items;

-- CROSS JOIN utilizando la claúsula JOIN
SELECT *
FROM invoices CROSS JOIN invoice_items;

-- NATURAL JOIN
-- une automáticamente por columnas con el mismo nombre
-- Filtra la realción de la tabla A con la tabla B con el nombre del campo identico
CREATE TABLE alpha (
    id INT NOT NULL,
    descripcion VARCHAR(50) NOT NULL,
    CONSTRAINT alpha_id_pk PRIMARY KEY (id)
);

CREATE TABLE beta (
    id INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    CONSTRAINT beta_id_fk FOREIGN KEY(id)
        REFERENCES alpha (id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

CREATE TABLE gamma (
    id INT NOT NULL,
    descripcion VARCHAR(50) NOT NULL,
    CONSTRAINT gamma_id_pk PRIMARY KEY (id)
);

-- POBLADO DE INFORMACION
INSERT INTO alpha
VALUES 
(1, 'Uno'),
(2, 'Dos'),
(3, 'Tres'),
(4, 'Cuatro');

INSERT INTO beta
VALUES
(1, 'ONE'),
(2, 'TWO'),
(3, 'THREE');

INSERT INTO gamma
VALUES
(1, 'ONE'),
(2, 'TWO'),
(3, 'THREE');

SELECT * FROM alpha CROSS JOIN beta;

SELECT * FROM alpha NATURAL JOIN beta;

SELECT * FROM alpha NATURAL JOIN gamma;