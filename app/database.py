from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, Session
from dotenv import load_dotenv
from sqlalchemy.engine import Engine
from dotenv import load_dotenv
from sqlalchemy.ext.declarative import declarative_base
import os

load_dotenv()

DB_USER: str | None = os.getenv("DB_USER") 
DB_PASSWORD: str | None = os.getenv("DB_PASSWORD")
DB_HOST: str | None = os.getenv("DB_HOST")
DB_PORT: str | None = os.getenv("DB_PORT")
DB_NAME: str | None = os.getenv("DB_NAME")

SQLALCHEMY_DATABASE_URL: str = f"postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"

# Motor de SQLAlchemy
engine: Engine = create_engine(url=SQLALCHEMY_DATABASE_URL) 
SessionLocal: sessionmaker[Session] = sessionmaker(bind=engine)

Base = declarative_base()