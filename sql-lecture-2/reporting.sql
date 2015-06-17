-- What is the total cost of a cart?
  -- What products are in the cart?
  -- SELECT product_id FROM line_items WHERE cart_id = ?
  -- SELECT price FROM products WHERE id = ?
  SELECT cart_id, SUM(price) AS total_price FROM products 
  JOIN line_items ON line_items.product_id = products.id
  WHERE cart_id = 1

SELECT sum(price) FROM products WHERE cart_id = 1

-- Invoice the Customer

  SELECT cart_id, customers.name, SUM(price) as total_price FROM products 
  LEFT JOIN line_items ON line_items.product_id = products.id
  JOIN carts ON line_items.cart_id = carts.id
  JOIN customers ON carts.customer_id = customers.id
  GROUP BY customer_id, cart_id



-- What is the most popular product?

SELECT COUNT(*) as total_orders FROM line_items GROUP BY product_id;
SELECT products.name, COUNT(*) as total_orders FROM line_items
JOIN products ON line_items.product_id = products.id
GROUP BY product_id;

-- Who is the most profitable customer?

SELECT * FROM products 
JOIN line_items ON line_items.product_id = products.id
JOIN carts ON line_items.cart_id = carts.id
JOIN customers ON carts.customer_id = customers.id 
GROUP BY customer_id ORDER BY total_price DESC LIMIT 1

-- How many products did one customer buy?

-- Most revenue generating product?