from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from app.database import Base

class Dias_Semana(Base):
    __tablename__ = "dias_semana"

    id_dia = Column(Integer, primary_key=True, index=True)
    nombre_dia = Column(String(15), nullable=False, unique=True)

    horarios = relationship("Horarios", back_populates="dias_semana")