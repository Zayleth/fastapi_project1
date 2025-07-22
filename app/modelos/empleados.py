from sqlalchemy import Column, Integer, String, ForeignKey, UniqueConstraint
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from app.database import Base

class Empleados(Base):
    __tablename__ = "empleados"

    id_empleado = Column(Integer, primary_key=True, autoincrement=True)
    nombre_empleado = Column(String(80), nullable=False)
    apellido_empleado = Column(String(80), nullable=False)
    telefono_empleado = Column(String(15), nullable=False, unique=True)
    cargo_empleado = Column(String(50))
    id_especialidad = Column(Integer, ForeignKey("especialidad.id_especialidad", ondelete="SET NULL", onupdate="CASCADE"), nullable=True)

    especialidad = relationship("Especialidad", back_populates="empleados")
    horarios = relationship("Horarios", back_populates="empleados")
