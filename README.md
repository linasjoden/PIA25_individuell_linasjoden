# electronics Project
## Beskrivning

Detta projekt är ett system för att hantera elektronikprodukter, kunder och beställningar.
Projektet använder Python med SQLAlchemy ORM för att interagera med en PostgreSQL-databas (electronics_db).
Projektet innehåller även SQL-filer med avancerade queries och optimeringar.

**Funktioner**

Hämta alla produkter, produkter per tillverkare och kunders ordrar via Python-funktioner (queries.py).

Avancerade SQL-queries med subqueries, window functions och CASE (queries_advanced.sql).

Databasoptimering med index för snabbare sökningar (optimization.sql).

Test av databasanslutning (test_connection.py).

Huvudprogram (main.py) för att visa produkter och koppla till databasen.

Filer och beskrivning
Fil	Beskrivning
main.py	Startpunkt för programmet. Hämtar och skriver ut produkter och ordrar med exempel.
database.py	Skapar SQLAlchemy-engine och session, hanterar anslutning till PostgreSQL.
models.py	Python-klasser som motsvarar databastabeller (Product, Customer, Order, etc.).
queries.py	Python-funktioner för databasfrågor med SQLAlchemy ORM.
queries_advanced.sql	Avancerade SQL-frågor: subqueries, window functions och CASE.
optimization.sql	Optimering av queries med index och EXPLAIN ANALYZE.
test_connection.py	Testar databasanslutning och returnerar en session.
schema.sql	Skapar databastabeller (PostgreSQL).
testdata.sql	Infogar testdata i databasen.
requirements.txt	Lista över Python-beroenden.
README.md	Denna fil.
report.md	Rapport om databasdesign och optimering.
Installation

**Klona repot:**

git clone https://github.com/linasjoden/PIA25_individuell_linasjoden.git


**Skapa en virtuell miljö:**

python -m venv .elec


**Aktivera miljön:**

Windows PowerShell: .\.elec\Scripts\Activate.ps1

Git Bash: source .elec/Scripts/activate

**Installera beroenden:**

pip install -r requirements.txt


Skapa databasen i PostgreSQL och kör schema.sql och testdata.sql för att skapa tabeller och fylla på testdata.

Skapa .env med anslutningsinfo:


DATABASE_URL=postgresql://<användare>:<lösenord>@localhost:5432/electronics_db
DB_ECHO=False


**Användning**

Testa databasanslutning:

python test_connection.py


**Kör huvudprogrammet:**

python main.py


**Exempel på att använda Python-funktioner i queries.py:**

from database import get_db
from queries import get_all_products, get_products_by_brand, get_customer_orders

db = next(get_db())
products = get_all_products(db)
brand_products = get_products_by_brand(db, brand_id=1)
customer_orders = get_customer_orders(db, customer_id=1)


**SQL-filer** (queries_advanced.sql och optimization.sql) kan köras direkt i PostgreSQL för avancerade analyser och optimeringar.

**Databasoptimering (från report.md)**

Räkna antal produkter per tillverkare: Index idx_products_brand_id på products.brand_id förbättrar prestanda på join och aggregering.

Hitta kunder som spenderat mest totalt: Index idx_orders_customer_id på orders.customer_id snabbar upp SUM och GROUP BY.

Att lägga till index på kolumner som används i JOIN och WHERE-klausuler kan avsevärt förbättra prestanda.

**Struktur**
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

**Licens**

Detta projekt är för kursbruk och inte licensierat för kommersiell användning.