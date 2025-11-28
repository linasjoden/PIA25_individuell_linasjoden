-- schema.sql
-- Skapar databasen och alla tabeller för electronics_db
-- Kör detta i psql eller lämplig klient

-- 1) Skapa databasen (kör som superuser eller en användare med rättigheter)
CREATE DATABASE electronics_db;

-- Byt anslutning till databasen (i psql)
\c electronics_db;

-- 2) Tabell: brands
CREATE TABLE brands (
id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
country VARCHAR(100),
founded_year INT,
description TEXT,
created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3) Tabell: products
CREATE TABLE products (
id SERIAL PRIMARY KEY,
name VARCHAR NOT NULL,
brand_id INT NOT NULL,
sku VARCHAR UNIQUE,
release_year INT,
price NUMERIC(12,2) NOT NULL,
warranty_months INT,
category VARCHAR,
stock_quantity INT DEFAULT 0,
created_at TIMESTAMPTZ DEFAULT NOW(),

```
CONSTRAINT fk_brand
    FOREIGN KEY (brand_id)
    REFERENCES brands(id)
    ON DELETE RESTRICT,

CONSTRAINT check_price_positive
    CHECK (price > 0),

CONSTRAINT check_stock_non_negative
    CHECK (stock_quantity >= 0)
```

);

-- 4) Tabell: customers
CREATE TABLE customers (
id SERIAL PRIMARY KEY,
first_name VARCHAR NOT NULL,
last_name VARCHAR NOT NULL,
email VARCHAR UNIQUE NOT NULL,
phone VARCHAR,
city VARCHAR,
registration_date DATE DEFAULT CURRENT_DATE,
created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 5) Tabell: orders
CREATE TABLE orders (
id SERIAL PRIMARY KEY,
customer_id INT NOT NULL,
order_date DATE DEFAULT CURRENT_DATE,
total_amount NUMERIC(12,2),
status VARCHAR DEFAULT 'pending',
shipping_city VARCHAR,
created_at TIMESTAMPTZ DEFAULT NOW(),

```
CONSTRAINT fk_customer
    FOREIGN KEY (customer_id)
    REFERENCES customers(id)
    ON DELETE CASCADE
```

);

-- 6) Tabell: order_items
CREATE TABLE order_items (
id SERIAL PRIMARY KEY,
order_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL,
unit_price NUMERIC(12,2) NOT NULL,
created_at TIMESTAMPTZ DEFAULT NOW(),

```
CONSTRAINT fk_order
    FOREIGN KEY (order_id)
    REFERENCES orders(id)
    ON DELETE CASCADE,

CONSTRAINT fk_product
    FOREIGN KEY (product_id)
    REFERENCES products(id)
    ON DELETE RESTRICT,

CONSTRAINT check_quantity_unit_price
    CHECK (quantity > 0 AND unit_price > 0)
```

);

-- 7) Tabell: reviews
CREATE TABLE reviews (
id SERIAL PRIMARY KEY,
product_id INT NOT NULL,
customer_id INT NOT NULL,
rating INT NOT NULL,
comment TEXT,
review_date DATE DEFAULT CURRENT_DATE,
created_at TIMESTAMPTZ DEFAULT NOW(),

```
CONSTRAINT fk_review_product
    FOREIGN KEY (product_id)
    REFERENCES products(id)
    ON DELETE CASCADE,

CONSTRAINT fk_review_customer
    FOREIGN KEY (customer_id)
    REFERENCES customers(id)
    ON DELETE CASCADE,

CONSTRAINT check_rating_range
    CHECK (rating BETWEEN 1 AND 5)
```

);

-- 8) Index på foreign keys (för prestanda vid joins)
CREATE INDEX idx_products_brand_id ON products(brand_id);
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);
CREATE INDEX idx_reviews_product_id ON reviews(product_id);
CREATE INDEX idx_reviews_customer_id ON reviews(customer_id);

-- Slut på schema.sql
