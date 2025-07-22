from sqlalchemy import Column, Integer, String, Text
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from app.database import Base

class Especialidad(Base):
    __tablename__ = "especialidad"

    id_especialidad = Column(Integer, primary_key=True, autoincrement=True)
    nombre_especialidad = Column(String(80), unique=True, nullable=False)
    descripcion_especialidad = Column(Text)

    empleados = relationship("Empleados", back_populates="especialidad")