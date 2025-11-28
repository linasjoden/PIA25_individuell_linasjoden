from sqlalchemy.orm import Session
from models import Product, Customer, Order

def get_all_products(db: Session):
    """
    Returnerar alla produkter.
    """
    return db.query(Product).all()


def get_products_by_brand(db: Session, brand_id: int):
    """
    Returnerar produkter för ett specifikt varumärke.
    """
    return db.query(Product).filter(Product.brand_id == brand_id).all()


def get_customer_orders(db: Session, customer_id: int):
    """
    Returnerar alla ordrar för en given kund.
    """
    return db.query(Order).filter(Order.customer_id == customer_id).all()

