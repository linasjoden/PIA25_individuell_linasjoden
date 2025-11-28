#  Electronics Project
## Beskrivning

Detta projekt är ett system för att hantera elektronikprodukter, kunder och beställningar.
Det använder Python, SQLAlchemy ORM och en PostgreSQL-databas (electronics_db).
Projektet inkluderar även avancerade SQL-frågor och databaspoptimering.

## Funktioner

Hämta alla produkter, produkter per tillverkare och kunders ordrar via Python-funktioner (queries.py).

Avancerade SQL-queries med subqueries, window functions, och CASE (queries_advanced.sql).

Databasoptimering med index och EXPLAIN ANALYZE (optimization.sql).

Test av databasanslutning (test_connection.py).

Huvudprogram (main.py) som demonstrerar hur data hämtas och visas.

 ## Filöversikt

### Filbeskrivning

main.py	Startpunkt för programmet. Hämtar och skriver ut exempeldata.
database.py	Skapar SQLAlchemy-engine och session. Hanterar anslutning till PostgreSQL.
models.py	ORM-modeller (Product, Customer, Order osv.).
queries.py	Python-funktioner som frågar databasen via SQLAlchemy.
queries_advanced.sql	Avancerade SQL-frågor: subqueries, window functions och CASE.
optimization.sql	Indexoptimering och EXPLAIN ANALYZE.
test_connection.py	Testar databasanslutningen och skapar session.
schema.sql	Skapar databastabeller.
testdata.sql	Infogar testdata i databasen.
requirements.txt	Projektberoenden.
README.md	Dokumentation.
report.md	Rapport om databasdesign och optimering.



## 🛠 Installation & Setup

### Följ dessa steg för att köra projektet lokalt:


###  Klona projektet  
```
git clone <repo-url>
cd <mappnamn>
```


### Skapa och aktivera en virtuell miljö

**Windows PowerShell**
```
python -m venv venv
.\venv\Scripts\Activate.ps1
```

**Git Bash**
```bash
python -m venv venv
source venv/Scripts/activate
```

**Linux / macOS**
```bash
python3 -m venv venv
source venv/bin/activate
```

---

### Installera beroenden
```bash
pip install -r requirements.txt
```

---

### Skapa och fyll databasen
1. Skapa databasen i PostgreSQL (t.ex. via psql eller pgAdmin).
2. Kör filerna:  
   - `schema.sql`  
   - `testdata.sql`  

---

### Skapa `.env`-fil
Skapa en `.env` i projektroten med följande innehåll:

```
DATABASE_URL=postgresql://<användare>:<lösenord>@localhost:5432/electronics_db
DB_ECHO=False
```



## Användning

### Testa databasanslutning
 
```
python test_connection.py
```


### Kör huvudprogrammet
```
python main.py
```

**Exempel på att använda Python-funktioner i queries.py:**
````
from database import get_db
from queries import get_all_products, get_products_by_brand, get_customer_orders

db = next(get_db())
products = get_all_products(db)
brand_products = get_products_by_brand(db, brand_id=1)
customer_orders = get_customer_orders(db, customer_id=1)
````


**SQL-filer** (queries_advanced.sql och optimization.sql) kan köras direkt i PostgreSQL för avancerade analyser och optimeringar.

**Databasoptimering (från report.md)**

Räkna antal produkter per tillverkare: Index idx_products_brand_id på products.brand_id förbättrar prestanda på join och aggregering.

Hitta kunder som spenderat mest totalt: Index idx_orders_customer_id på orders.customer_id snabbar upp SUM och GROUP BY.

Att lägga till index på kolumner som används i JOIN och WHERE-klausuler kan avsevärt förbättra prestanda.

## Struktur
electronics_mapp/
├── main.py
├── models.py
├── database.py
├── queries.py
├── queries_advanced.sql
├── optimization.sql
├── test_connection.py
├── schema.sql
├── testdata.sql
├── requirements.txt
├── README.md
└── report.md


## Licens

Detta projekt är för kursbruk och inte licensierat för kommersiell användning.
