USE `northwind`;
-- EJERCICIO 1:

WITH `info_cliente`
AS (
	SELECT `customer_id`, `company_name`
	FROM `customers` )
SELECT `customer_id`, `company_name`
FROM `customers`; 

-- EJERCICIO 2: 

WITH `info_cliente`
AS (
	SELECT `customer_id`, `company_name`
	FROM `customers`
	)
SELECT `customer_id`, `company_name`
FROM `customers`
WHERE `country`= 'Germany';

-- EJERCICIO 3:

WITH `info_cliente`
AS ( 
	SELECT `orders`.`customer_id`, `customers`.`company_name`, `orders`.`order_id`, `orders`.`order_date`
    FROM `orders`
    LEFT JOIN `customers`
    ON `orders`.`customer_id` = `customers`.`customer_id`)
SELECT `info_cliente`.`customer_id`, `info_cliente`.`company_name`, `info_cliente`.`order_id`, `info_cliente`.`order_date`
FROM `info_cliente`;

-- EJERCICIO 4:
WITH `cantidad_facturas`
AS(
	SELECT `customer_id`, COUNT(`order_id`) AS `numero_facturas`
	FROM `orders`
	GROUP BY `customer_id`)
SELECT `cantidad_facturas`.`customer_id`, `customers`.`company_name`,  `cantidad_facturas`.`numero_facturas`
FROM `cantidad_facturas`
LEFT JOIN `customers` 
ON `cantidad_facturas`.`customer_id` = `customers`.`customer_id`
GROUP BY `cantidad_facturas`.`customer_id`, `customers`.`company_name`;

-- EJERCICIO 5: 
WITH `cantidades_producto`
AS(
	SELECT `product_id`, SUM(`quantity`) AS `cantidad_total`
    FROM `order_details`
    GROUP BY `product_id`)
SELECT `cantidades_producto`.`product_id`, `products`.`product_name`, AVG(`cantidades_producto`.`cantidad_total`) AS `media`
FROM `cantidades_producto`
LEFT JOIN `products`
ON `cantidades_producto`.`product_id` = `products`.`product_id`
GROUP BY `cantidades_producto`.`product_id`, `products`.`product_name`;

