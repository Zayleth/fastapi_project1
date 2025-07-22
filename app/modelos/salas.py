from sqlalchemy import Column, Integer, String, CheckConstraint
from sqlalchemy.orm import relationship
from app.database import Base

class Salas_Hospital(Base):
    __tablename__ = "salas_hospital"

    id_sala = Column(Integer, primary_key=True, autoincrement=True)
    nombre_sala = Column(String(80), nullable=False)
    tipo_sala = Column(String(50))
    capacidad_sala = Column(Integer, nullable=False, default=1)

    __table_args__ = (
        CheckConstraint('capacidad_sala > 0', name='check_capacidad_sala_mayor_cero'),
    )

    citas = relationship("Citas", back_populates="salas_hospital")