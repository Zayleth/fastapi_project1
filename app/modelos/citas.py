from sqlalchemy import Column, Integer, Date, Time, Text, ForeignKey
from sqlalchemy.orm import relationship
from app.database import Base

class Citas(Base):
    __tablename__ = "citas"

    id_cita = Column(Integer, primary_key=True, autoincrement=True)
    id_paciente = Column(Integer, ForeignKey("pacientes.id_paciente"), nullable=False)
    id_empleado = Column(Integer, ForeignKey("empleados.id_empleado"), nullable=False)
    id_sala = Column(Integer, ForeignKey("salas_hospital.id_sala"), nullable=False)

    fecha_cita = Column(Date, nullable=False)
    hora_cita = Column(Time, nullable=False)
    motivo_cita = Column(Text)

    salas_hospital = relationship("Salas_Hospital", back_populates="citas")
    pacientes = relationship("Pacientes", back_populates="citas")
