from sqlalchemy import Column,Integer,String, Float, DateTime, ForeignKey, Text
from sqlalchemy.orm import relationship
from sqlalchemy import CheckConstraint, func, Numeric

from datetime import datetime, timezone

from database import Base


class Brand(Base):
   
    __tablename__ ='brands'
    
    id = Column(Integer, primary_key = True, autoincrement = True )
    name = Column(String(100), nullable = False )
    country = Column(String(100))
    founded_year = Column(Integer)
    description = Column(String)
    created_at = Column(DateTime(timezone=True), default=datetime.utcnow)
    
    products = relationship("Product", back_populates="brand", cascade="all, delete-orphan")


class Product(Base):
    
    __tablename__ = 'products'
    
    id = Column(Integer, primary_key=True, autoincrement=True) # SERIAL / auto-increment
    name = Column(String, nullable=False)
    brand_id = Column(Integer, ForeignKey("brands.id", ondelete='RESTRICT'), nullable=False)  # Korrekt
    sku = Column(String, unique=True) # Produktkod
    release_year = Column(Integer) # Lanseringsår
    price = Column(Numeric(10,2), nullable=False) # Pris
    warranty_months = Column(Integer) # Garanti i månader
    category = Column(String) # Kategori: Smartphones, Laptops, Tablets
    stock_quantity = Column(Integer, default=0) # Lagersaldo
    created_at = Column(DateTime(timezone=True), default=datetime.utcnow) # Skapad datum

    brand = relationship("Brand", back_populates="products")

    __table_args__ = ( CheckConstraint('price > 0', 
                                       name='check_price_positive'), CheckConstraint('stock_quantity >= 0', name='check_stock_non_negative'), )



class Customer (Base):
    
    __tablename__= 'customers'
    
    id = Column(Integer, primary_key=True, autoincrement=True) # Primary key / SERIAL 
    first_name = Column(String, nullable=False) # Förnamn 
    last_name = Column(String, nullable=False) # Efternamn 
    email = Column(String, nullable=False, unique=True) # E-post 
    phone = Column(String) # Telefonnummer 
    city = Column(String) # Stad 
    registration_date = Column(DateTime(timezone=True), default=datetime.utcnow) # Registreringsdatum 
    created_at = Column(DateTime(timezone=True), default = datetime.utcnow) # Skapad datum

    orders = relationship("Order", back_populates="customer", cascade="all, delete-orphan")


class Order (Base):
    
    __tablename__= 'orders'
    
    id = Column(Integer, primary_key=True, autoincrement=True) # Primary key / SERIAL 
    customer_id = Column(Integer, ForeignKey("customers.id",ondelete = 'CASCADE'), nullable=False) # Foreign key till Customers 
    order_date = Column(DateTime(timezone=True), default = datetime.utcnow) # Beställningsdatum 
    total_amount = Column(Float) # Totalt belopp 
    status = Column(String, server_default='pending') # Status: pending, completed, cancelled 
    shipping_city = Column(String) # Leveransstad 
    created_at = Column(DateTime(timezone=True), default = datetime.utcnow)

    customer = relationship("Customer", back_populates="orders")
    items = relationship("Order_Item", back_populates="order", cascade="all, delete-orphan")


class Order_Item(Base): 
    
    __tablename__ = 'order_items' 
    
    id = Column(Integer, primary_key=True, autoincrement=True) # Primary key / SERIAL 
    order_id = Column(Integer, ForeignKey("orders.id", ondelete = 'CASCADE'), nullable=False) #orderrader tas bort när order tas bort # Foreign key till Orders 
    product_id = Column(Integer, ForeignKey("products.id", ondelete = 'RESTRICT'), nullable=False) # Foreign key till Products #ej radera produkter automatiskt
    quantity = Column(Integer, nullable=False) # Antal 
    unit_price = Column(Numeric(10,2), nullable=False) # Styckpris 
    created_at = Column(DateTime(timezone=True), default =datetime.utcnow) # Skapad datum

    order = relationship("Order", back_populates="items")
    product = relationship("Product")
    
    __table_args__ = ( CheckConstraint('quantity > 0 AND unit_price > 0', 
                                       name='check_quantity_unitprice_positive'), )


class Review (Base):
    
    __tablename__ = 'reviews'

    id = Column(Integer, primary_key=True, autoincrement=True) # Primary key / SERIAL 
    product_id = Column(Integer, ForeignKey("products.id", ondelete = 'CASCADE'), nullable=False) # Foreign key till Products 
    customer_id = Column(Integer, ForeignKey("customers.id", ondelete = 'CASCADE'), nullable=False) # Foreign key till Customers 
    rating = Column(Integer, nullable=False) # Betyg 1-5 
    comment = Column(Text) # Kommentar 
    review_date = Column(DateTime(timezone=True), default =datetime.utcnow) # Recensionsdatum 
    created_at = Column(DateTime(timezone=True), server_default=func.now()) # Skapad datum 

    __table_args__ = (
    CheckConstraint('rating >= 1 AND rating <= 5', name='check_rating_range'), )  
    






