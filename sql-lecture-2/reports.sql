# The total price of a cart / cart summary

# All carts, all customers
SELECT line_items.cart_id, products.name, products.price, customers.name 
FROM products 
INNER JOIN line_items ON products.id = line_items.product_id 
INNER JOIN carts ON carts.id = line_items.cart_id 
INNER JOIN customers ON carts.customer_id = customers.id
WHERE customers.name = "Avi";

SELECT line_items.cart_id, products.name, products.price, customers.name 
FROM products 
INNER JOIN line_items ON products.id = line_items.product_id 
INNER JOIN carts ON carts.id = line_items.cart_id 
INNER JOIN customers ON carts.customer_id = customers.id
WHERE customers.name = "Avi"
GROUP BY line_items.cart_id
ORDER BY products.price DESC
;

# PRICE OF A CART

SELECT cart_id, customers.name, SUM(products.price) AS total_price, COUNT(products.id) AS total_products
FROM products 
INNER JOIN line_items ON products.id = line_items.product_id 
INNER JOIN carts ON carts.id = line_items.cart_id 
INNER JOIN customers ON carts.customer_id = customers.id
WHERE customers.name = "Avi" 
GROUP BY line_items.cart_id
HAVING total_price > 30
ORDER BY total_price DESC

# Who bought what?

# Most popular product

# Most profitable customer

SELECT customers.name, carts.id AS total_price FROM products 
JOIN line_items ON line_items.product_id = products.id
JOIN carts ON line_items.cart_id = carts.id
JOIN customers ON carts.customer_id = customers.id 
