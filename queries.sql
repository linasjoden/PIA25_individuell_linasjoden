

-- hämta alla produkter sorterade efter namn
SELECT * FROM products
ORDER BY name ASC;


--hämta alla produkter som kostar mer än 5000 kr
SELECT * FROM products
WHERE price > 5000;


--hämta alla beställningar från 2024
SELECT *
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2024;



--hämta alla pending beställningar
SELECT * FROM orders
WHERE status = 'pending';



--visa alla produkter med deras tillverkares namn
SELECT p.name AS product_name, b.name AS brand_name
FROM products p
JOIN brands b ON p.brand_id = b.id


--visa alla beställningar med kundens namn och totalt belopp
SELECT 
    o.id AS order_id,
    c.first_name AS customer_name,
    o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.id
ORDER BY o.id;


--visa vilka produkter varje kund har köpt
SELECT  
    c.first_name || ' ' || c.last_name AS customer_name,
    p.name AS product_name
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
ORDER BY customer_name, product_name;


--räkna antal produkter per tillverkare
SELECT b.name       AS brand_name,
       COUNT(p.id)  AS product_count
FROM brands b
LEFT JOIN products p ON p.brand_id = b.id
GROUP BY b.name
ORDER BY product_count DESC, b.name ASC;


--hitta kunder som spenderat mest totalt
SELECT 
    (c.first_name || ' ' || c.last_name) AS customer_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.first_name, c.last_name
ORDER BY total_spent DESC;


--hitta produkter med genomsnittligt betyg i recensioner
SELECT p.name AS product_name,
       AVG(r.rating) AS average_rating
FROM products p
LEFT JOIN reviews r ON p.id = r.product_id
GROUP BY p.id, p.name
ORDER BY average_rating DESC;









