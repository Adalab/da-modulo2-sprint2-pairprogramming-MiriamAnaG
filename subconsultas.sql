USE `northwind`;

/* EJERCICIO 1: Extraed los pedidos con el máximo "order_date" para cada empleado.
Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado. Para eso nos pide que lo hagamos con una query correlacionada.*/

SELECT `order_id`, `customer_id`, `employee_id`, MAX(`order_date`), `required_date` 
FROM `orders` AS o
WHERE `order_date` = (
    SELECT MAX(`order_date`)
    FROM `orders` AS o2
    WHERE `o`.`employee_id` = `o2`.`employee_id`
)
GROUP BY `order_id`;

/* EJERCICIO 2: Extraed el precio unitario máximo (unit_price) de cada producto vendido.
Supongamos que ahora nuestro jefe quiere un informe de los productos vendidos y su precio unitario. De nuevo lo tendréis que hacer con queries correlacionadas. .*/

SELECT `product_id`, MAX(`unit_price`) 
FROM `order_details` AS od
WHERE `unit_price` = (
    SELECT MAX(`unit_price`)
    FROM `order_details` AS od2
    WHERE `od`.`product_id` = `od2`.`product_id`
)
GROUP BY `product_id`;

/* EJERCICIO 3:  Extraed información de los productos "Beverages"
En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar un tipo de producto. En concreto, 
tienen especial interés por los productos con categoría "Beverages". Devuelve el ID del producto, el nombre del producto y su ID de categoría..*/

SELECT `product_id`, `product_name`, `category_id`
FROM `products`
WHERE `category_id`IN (SELECT `category_id`
					FROM `categories`
                    WHERE `category_id` = 1)
GROUP BY `product_id`;

/* EJERCICIO 4: Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, entonces podría dirigirse a estos países para buscar proveedores adicionales. */

SELECT `country`
FROM `customers`
WHERE `country` NOT IN(SELECT  `country`
						FROM `suppliers`)
GROUP BY `country`; 
					
/* EJERCICIO 5: Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"
Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del producto "Grandma's Boysenberry Spread" (ProductID 6) en un solo pedido. */

SELECT  `order_id`, `customer_id`
FROM `orders`
WHERE `order_id` IN (SELECT `order_id`
					FROM `order_details`
					WHERE `product_id` = 6 AND `quantity` > 20)
GROUP BY `order_id`;


/*EJERCICIO 6: Extraed los 10 productos más caros
Nos siguen pidiendo más queries correlacionadas. En este caso queremos saber cuáles son los 10 productos más caros.*/

SELECT `product_id`, `unit_price`, `category_id`
FROM `products` as p
WHERE `unit_price` = (
	SELECT MAX(`unit_price`)
    FROM `products` as p2
    WHERE `p`.`category_id` = `p2`.`category_id`)
ORDER BY `category_id`
LIMIT 10;


