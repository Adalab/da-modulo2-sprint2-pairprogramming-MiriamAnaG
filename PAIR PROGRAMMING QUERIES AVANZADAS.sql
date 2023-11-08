USE northwind;

-- Ejercicio 1 Productos más baratos y caros de nuestra BBDD:

SELECT MIN(unit_price) AS 'Lowestprice', MAX(unit_price) AS 'highestPrice'
FROM products;

-- Ejercicio 2 Conociendo el numero de productos y su precio medio:

SELECT COUNT(units_in_stock) AS NUM_PRODUCTOS , AVG(unit_price) AS PRECIO_MEDIO
FROM products;

-- Ejercicio 3 Sacad la máxima y mínima carga de los pedidos de UK:

SELECT ship_country, MAX(freight), MIN(freight)
FROM orders
WHERE ship_country = 'UK';

-- Ejercicio 4 Qué productos se venden por encima del precio medio:

SELECT product_name, unit_price
FROM products
WHERE unit_price > (SELECT AVG(unit_price) FROM PRODUCTS)
ORDER BY unit_price DESC;

-- Ejercicio 5 Qué productos se han descontinuado: 

SELECT COUNT(product_id)
FROM products
WHERE discontinued = 1;

-- Ejercicio 6 Detalles de los productos de la query anterior:

SELECT product_id, product_name
FROM products
WHERE discontinued = 0
ORDER BY product_id DESC
LIMIT 10;

-- Ejercicio 7 Relación entre número de pedidos y máxima carga:

SELECT  employee_id, COUNT(order_id) AS Numero_pedidos, MAX(freight) AS Carga_maxima
FROM orders
GROUP BY employee_id;

-- Ejercicio 8 Descartar pedidos sin fecha y ordénalos:

SELECT  employee_id, COUNT(order_id) AS Numero_pedidos, MAX(freight) AS Carga_maxima
FROM orders
WHERE order_date IS NOT NULL
GROUP BY employee_id
ORDER BY employee_id;
 
 -- Ejercicio 9 Números de pedidos por día:
 
SELECT YEAR(order_date) AS Año, MONTH(order_date) AS Mes, DAY (order_date) AS Dia, COUNT(order_id) AS Numero_pedidos
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date), DAY(order_date)
ORDER BY Dia, Mes, Año;

-- Ejercicio 10 Número de pedidos por mes y año:

SELECT YEAR(order_date) AS Año, MONTH(order_date) AS Mes, COUNT(order_id) AS Numero_pedidos
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date), DAY(order_date)
ORDER BY Mes, Año;

-- Ejercicio 11 Seleccionad las ciudades con 4 o más empleadas:

SELECT city
FROM employees
GROUP BY city
HAVING COUNT(employee_id) >= 4;

-- Ejercicio 12 Cread una nueva columna basándonos en la cantidad monetaria:

SELECT product_id, unit_price,
CASE
	WHEN unit_price > 2000 THEN 'Alto'
    ELSE 'Bajo'
END AS Categoria
FROM products
