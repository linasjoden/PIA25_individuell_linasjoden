-- testdata.sql
-- Realistisk testdata för electronics_db

-- Brands (minst 3)
INSERT INTO brands (name, country, founded_year, description)
VALUES
('NovaTech','Sweden',1999,'Swedish consumer electronics brand'),
('OrionElectronics','Germany',1985,'Quality hardware and peripherals'),
('AstraMobile','USA',2008,'Smartphones and mobile accessories');

-- Products (minst 10, fördelade)
INSERT INTO products (name, brand_id, sku, release_year, price, warranty_months, category, stock_quantity)
VALUES
('NovaPhone X', 3, 'AST-001', 2023, 6999.00, 24, 'Smartphones', 50),
('NovaPad 10', 1, 'NVT-PAD10', 2022, 4999.00, 12, 'Tablets', 30),
('OrionBook Pro', 2, 'ORI-BP15', 2021, 12999.00, 24, 'Laptops', 15),
('AstraBud Z', 3, 'AST-BUDZ', 2024, 999.00, 12, 'Accessories', 200),
('NovaCam 4K', 1, 'NVT-CAM4K', 2020, 2999.00, 36, 'Cameras', 20),
('OrionMouse S', 2, 'ORI-MSE-S', 2019, 299.00, 6, 'Accessories', 150),
('NovaPhone Lite', 1, 'NVT-PLITE', 2021, 3999.00, 12, 'Smartphones', 80),
('AstraTab S', 3, 'AST-TABS', 2020, 2999.00, 12, 'Tablets', 25),
('OrionDock', 2, 'ORI-DOCK', 2022, 799.00, 12, 'Peripherals', 60),
('NovaCharger Pro', 1, 'NVT-CHP', 2023, 199.00, 12, 'Accessories', 300);

-- Customers (minst 5)
INSERT INTO customers (first_name, last_name, email, phone, city, registration_date)
VALUES
('Anna','Svensson','[anna.svensson@example.com](mailto:anna.svensson@example.com)','070-1111111','Stockholm','2022-05-10'),
('Erik','Johansson','[erik.johansson@example.com](mailto:erik.johansson@example.com)','070-2222222','Göteborg','2023-02-01'),
('Sofia','Lind','[sofia.lind@example.com](mailto:sofia.lind@example.com)','070-3333333','Malmö','2021-11-20'),
('Johan','Karlsson','[johan.karlsson@example.com](mailto:johan.karlsson@example.com)','070-4444444','Uppsala','2024-01-15'),
('Maria','Olsson','[maria.olsson@example.com](mailto:maria.olsson@example.com)','070-5555555','Lund','2020-07-08');

-- Orders (minst 10)
INSERT INTO orders (customer_id, order_date, total_amount, status, shipping_city)
VALUES
(1, '2024-02-10', 6999.00, 'completed', 'Stockholm'),
(2, '2024-03-05', 12999.00, 'completed', 'Göteborg'),
(3, '2023-12-20', 3999.00, 'pending', 'Malmö'),
(1, '2022-11-01', 2999.00, 'completed', 'Stockholm'),
(4, '2024-06-02', 999.00, 'pending', 'Uppsala'),
(5, '2023-08-15', 199.00, 'completed', 'Lund'),
(2, '2024-01-30', 799.00, 'completed', 'Göteborg'),
(3, '2024-04-18', 2999.00, 'completed', 'Malmö'),
(4, '2023-10-10', 4999.00, 'completed', 'Uppsala'),
(1, '2024-07-01', 1299.00, 'pending', 'Stockholm');

-- Order_items (minst 10)
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 6999.00),
(2, 3, 1, 12999.00),
(3, 7, 1, 3999.00),
(4, 5, 1, 2999.00),
(5, 4, 1, 999.00),
(6, 10, 1, 199.00),
(7, 9, 1, 799.00),
(8, 8, 1, 2999.00),
(9, 2, 1, 4999.00),
(10, 6, 2, 299.00);

-- Reviews (minst 10)
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date)
VALUES
(1,1,5,'Fantastisk telefon!','2024-02-20'),
(3,2,4,'Stabil och snabb','2024-03-06'),
(7,3,3,'Bra pris/prestanda','2023-11-01'),
(5,1,4,'Bra bildkvalitet','2022-12-10'),
(4,4,2,'Inte vad jag förväntade mig','2024-06-10'),
(8,3,5,'Bästa surfplattan','2024-04-20'),
(2,1,4,'Smidig och prisvärd','2022-11-05'),
(9,2,4,'Fungerar fint','2023-10-15'),
(10,5,5,'Laddar snabbt','2023-08-20'),
(6,1,3,'Gott grepp men lite dyr','2024-07-02');
