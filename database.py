
import os
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base
from dotenv import load_dotenv

# Ladda miljövariabler från .env
load_dotenv()

DATABASE_URL = os.getenv("DATABASE_URL") 
if not DATABASE_URL:
    raise ValueError("DATABASE_URL saknas i .env")

Base = declarative_base()
engine = create_engine(DATABASE_URL, echo=True)  # echo=True skriver SQL i loggen
SessionLocal = sessionmaker(bind=engine)

def get_db():
    """
    Skapar och returnerar en SQLAlchemy-databassession.
    Sessionen stängs automatiskt när generatorn avslutas.
    """
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

