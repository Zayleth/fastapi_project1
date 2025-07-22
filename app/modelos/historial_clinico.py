from sqlalchemy import Column, Integer, Date, Text, ForeignKey
from sqlalchemy.orm import relationship
from app.database import Base

class Historial_Clinico(Base):
    __tablename__ = "historial_clinico"

    id_historia = Column(Integer, primary_key=True, autoincrement=True)
    id_paciente = Column(Integer, ForeignKey("pacientes.id_paciente", ondelete="SET NULL"), nullable=True)
    fecha = Column(Date)
    diagnostico = Column(Text)
    tratamiento = Column(Text)
    observaciones = Column(Text)

    pacientes = relationship("Pacientes", back_populates="historial_clinico")
