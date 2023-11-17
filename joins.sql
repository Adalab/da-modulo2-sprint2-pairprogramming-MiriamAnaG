USE northwind;

-- EJERCICIO 1. Pedidos por empresa en UK:
SELECT customers.customer_id, customers.company_name, COUNT(orders.order_id) AS Numeropedidos
FROM customers
INNER JOIN orders 
ON customers.customer_id = orders.customer_id
WHERE country = 'UK'
GROUP BY  customers.customer_id;

-- EJERCICIO 2. Productos pedidos por empresa en UK por año:

SELECT customers.company_name AS NombreEmpresa, YEAR(orders.order_Date) AS Año, COUNT(order_details.quantity) AS NumObjetos
FROM orders
INNER JOIN customers 
ON orders.customer_id = customers.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
WHERE customers.country = 'UK'
GROUP BY NombreEmpresa, Año
ORDER BY NombreEmpresa, Año;

-- EJERCICIO 3. Mejorad la query anterior:

SELECT customers.company_name AS NombreEmpresa, YEAR(orders.order_Date) AS Año, COUNT(order_details.quantity) AS NumObjetos, SUM(order_details.unit_price * (1 - order_details.discount)) AS DineroTotal
FROM orders
INNER JOIN customers 
ON orders.customer_id = customers.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
WHERE customers.country = 'UK'
GROUP BY NombreEmpresa, Año
ORDER BY NombreEmpresa, Año;

-- EJERCICIO 4. BONUS: Pedidos que han realizado cada compañía y su fecha:

SELECT orders.order_id, customers.company_name, orders.order_date
FROM orders
LEFT JOIN customers
ON  orders.customer_id = customers.customer_id
WHERE orders.order_id > 0;

-- EJERCICIO 6. Qué empresas tenemos en la BBDD Northwind:

SELECT orders.order_id, orders.order_date, customers.company_name
FROM orders
LEFT JOIN customers
ON orders.customer_id = customers.customer_id;

-- EJERCICIO 7. Pedidos por cliente de UK:

SELECT customers.company_name, COUNT(orders.order_id)
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.country = 'UK'
GROUP BY customers.company_name;

-- EJERCICIO 8. Empresas de UK y sus pedidos:

SELECT customers.company_name, orders.order_id, orders.order_date
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.country = 'UK'
GROUP BY customers.company_name, orders.order_id;

-- EJERCICIO 9. Empleadas que sean de la misma ciudad:

SELECT *
FROM employees AS e1, employees AS e2
WHERE e1.employee_id = e2.reports_to;
