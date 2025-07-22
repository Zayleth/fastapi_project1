from sqlalchemy import Column, Integer, String, Date, CHAR
from sqlalchemy.orm import relationship
from app.database import Base

class Pacientes(Base):
    __tablename__ = "pacientes"

    id_paciente = Column(Integer, primary_key=True, autoincrement=True)
    nombre_paciente = Column(String(80), nullable=False)
    apellido_paciente = Column(String(80), nullable=False)
    fecha_nacimiento = Column(Date)
    sexo_paciente = Column(CHAR(1))
    direccion_paciente = Column(String(255))
    telefono_paciente = Column(String(15), nullable=False, unique=True)

    citas = relationship("Citas", back_populates="pacientes", cascade="all, delete-orphan")
    historial_clinico = relationship("Historial_Clinico", back_populates="pacientes", cascade="all, delete-orphan")
