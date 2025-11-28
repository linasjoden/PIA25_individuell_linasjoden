# Rapport – Databasoptimering och design

## Databasdesign
- Tabellen **products** innehåller information om produkter inklusive `brand_id` som kopplar produkten till tabellen **brands**.  
- Tabellen **orders** innehåller kundbeställningar och har kolumnen `customer_id` som refererar till tabellen **customers**.  
- Relationerna mellan tabellerna:
  - **products → brands** (många-till-en)
  - **orders → customers** (många-till-en)
  - **order_items → orders** (många-till-en)
  - **order_items → products** (många-till-en)

## Index och optimering
Två queries från Del 1 analyserades med EXPLAIN ANALYZE för att förbättra prestanda:

1. **Räkna antal produkter per tillverkare**
   - Ursprunglig query: JOIN mellan **brands** och **products**.
   - Index skapat: `idx_products_brand_id` på kolumnen `products.brand_id`.
   - Effekt: Snabbare join och aggregering när man räknar produkter per brand.

2. **Hitta kunder som spenderat mest totalt**
   - Ursprunglig query: JOIN mellan **customers** och **orders**, SUM över total_amount.
   - Index skapat: `idx_orders_customer_id` på kolumnen `orders.customer_id`.
   - Effekt: Aggregering över kunders beställningar går snabbare, särskilt vid stora datamängder.

### Slutsats
- Att lägga till index på kolumner som används i JOIN och WHERE-klausuler kan avsevärt förbättra prestanda.  
- EXPLAIN ANALYZE visade kortare exekveringstid efter index.  
- Denna optimering är viktig för att hantera stora datamängder och snabba upp vanliga frågor i databasen.


