from database import get_db
from queries import get_all_products, get_products_by_brand, get_customer_orders

def main():
    db_gen = get_db()
    
    try:
        db = next(db_gen)

        # 1) Hämta alla produkter
        products = get_all_products(db)
        print("Alla produkter:")
        for p in products:
            print(f"{p.name} - {p.price} SEK")
        print("\n")

        # 2) Hämta produkter för ett specifikt brand (t.ex brand_id=1)
        brand_products = get_products_by_brand(db, brand_id=1)
        print("Produkter för brand 1:")
        for p in brand_products:
            print(f"{p.name} - {p.price} SEK")
        print("\n")

        # 3) Hämta ordrar för en kund (t.ex customer_id=1)
        customer_orders = get_customer_orders(db, customer_id=1)
        print("Ordrar för kund 1:")
        for o in customer_orders:
            print(f"Order ID: {o.id} - Totalt: {o.total_amount} SEK")

    except Exception as e:
        print(f"Ett fel uppstod: {e}")

    finally:
        db_gen.close()




if __name__ == "__main__":
    main()


