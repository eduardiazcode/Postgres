-- HAVING
-- Es como el filtro WHERE pero por grupo de registros

-- ¿Cual cliente ha hecho má compras? Teniendo en cuenta que contamos una factura como una compra
SELECT * FROM invoices;

SELECT person_id, COUNT(*) AS cantidad
FROM invoices
GROUP BY person_id
ORDER BY 2;

-- Cuales personas han comprado dos veces o más
SELECT person_id, COUNT(*) AS cantidad
FROM invoices
GROUP BY person_id
HAVING COUNT(*) >= 2;
-- Respuesta: Ninguna persona compro más de dos veces

-- Cuales personas solo nos han comprado una sola vez
SELECT person_id, COUNT(*) AS cantidad
FROM invoices
GROUP BY person_id
HAVING COUNT(*) = 1;


-- LIMIT Y OFFSET
-- Permite limitar la cantidad de registros devuelvots. Sirve para paginar las consultas
SELECT * FROM invoice_items ORDER BY 1;

-- Mostrar los primeros 3 productos
SELECT * FROM invoice_items ORDER BY 1 LIMIT 3 OFFSET 0; -- PÁGINA 1
SELECT * FROM invoice_items ORDER BY 1 LIMIT 3 OFFSET 3; -- PÁGINA 2
SELECT * FROM invoice_items ORDER BY 1 LIMIT 3 OFFSET 6; -- PÁGINA 3
SELECT * FROM invoice_items ORDER BY 1 LIMIT 3 OFFSET 9; -- PÁGINA 4

-- REGISTROS A LIMITAR | PÁGINA ?
-- PAGINACIÓN
-- offset := página * limite - limite
-- offest := 1 * 5 - 5 = 0
-- offest := 2 * 5 - 5 = 5
-- offest := 3 * 5 - 5 = 10
-- offest := 4 * 5 - 5 = 15