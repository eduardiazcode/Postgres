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