from sqlalchemy import Column, Integer, Time, ForeignKey
from sqlalchemy.orm import relationship
from app.database import Base

class Horarios(Base):
    __tablename__ = "horarios"

    id_horario = Column(Integer, primary_key=True, autoincrement=True)
    id_empleado = Column(Integer, ForeignKey("empleados.id_empleado"), nullable=False)
    id_dia = Column(Integer, ForeignKey("dias_semana.id_dia"), nullable=False)
    hora_inicio = Column(Time, nullable=False)
    hora_fin = Column(Time, nullable=False)

    dias_semana = relationship("Dias_Semana", back_populates="horarios")
    empleados = relationship("Empleados", back_populates="horarios")
