from pydantic import BaseModel
from typing import Optional

# Crear una especialidad
class CrearEspecialidad(BaseModel):
    nombre_especialidad: str
    descripcion_especialidad: Optional[str] = None

# Devolver una especialidad
class DevolverEspecialidades(BaseModel):
    id_especialidad: int
    nombre_especialidad: str
    descripcion_especialidad: Optional[str] = None

# Filtrar búsquedas por nombre
class FiltroEspecialidadDeseada(BaseModel):
    nombre_especialidad: Optional[str] = None

# Actualizar una especialidad
class ActualizarEspecialidad(BaseModel):
    nombre_especialidad: Optional[str] = None
    descripcion_especialidad: Optional[str] = None
