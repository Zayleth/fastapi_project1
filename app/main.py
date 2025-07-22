from fastapi import FastAPI, HTTPException, Body, status
from typing import Annotated, List, Optional
from app.schemas import CrearEspecialidad, DevolverEspecialidades, FiltroEspecialidadDeseada, ActualizarEspecialidad

from sqlalchemy import insert, select, update, delete

from app.modelos.citas import Citas
from app.modelos.dias_semana import Dias_Semana
from app.modelos.empleados import Empleados
from app.modelos.especialidad import Especialidad
from app.modelos.historial_clinico import Historial_Clinico
from app.modelos.horarios import Horarios
from app.modelos.pacientes import Pacientes
from app.modelos.salas import Salas_Hospital

from fastapi import Query
from app.database import engine, SessionLocal, Base

Base.metadata.create_all(bind=engine)

app = FastAPI()

# CRUD (Create - Read - Update - Delete)
# CREATE
# Ruta para crear especialidad
@app.post(
    "/especialidad/", 
    status_code=status.HTTP_201_CREATED,
    description="Crea una nueva especialidad en la base de datos.",
    response_model=str,
)
async def crear_especialidad(
    nuevaEspecialidad: Annotated[CrearEspecialidad, Body()]
):

    # Sentencia para agregar datos a tablas
    conexion = SessionLocal()

    sentencia = insert(Especialidad).values(
        nombre_especialidad = nuevaEspecialidad.nombre_especialidad,
        descripcion_especialidad = nuevaEspecialidad.descripcion_especialidad
    )

    conexion.execute(sentencia)
    conexion.commit()
    conexion.close()
    
    return "Especialidad agregada con éxito"

# READ
# Ruta para mostrar/buscar especialidad
@app.get(
    "/especialidad/",
    response_model=list[DevolverEspecialidades],
    description="Visualiza todas las especialidades de Zalud-Integral.",
)
async def obtener_especialidades(
    filtros: Annotated[FiltroEspecialidadDeseada, Query()],
):
    conexion = SessionLocal()

    try:
        query = conexion.query(Especialidad)

        if filtros.nombre_especialidad:
            query = query.filter(
                Especialidad.nombre_especialidad.ilike(f"%{filtros.nombre_especialidad}%")
            )

        resultados = query.all()
        return resultados

    finally:
        conexion.close()

# UPDATE
# Ruta para actualizar especialidad
@app.put(
    "/especialidad/{id_especialidad}",
    status_code=status.HTTP_200_OK,
    description="Actualiza una especialidad por su ID.",
    response_model=str,
)
async def actualizar_especialidad(id_especialidad: int, datos_actualizados: ActualizarEspecialidad):
    conexion = SessionLocal()

    try:
        especialidad = conexion.query(Especialidad).filter(
            Especialidad.id_especialidad == id_especialidad
        ).first()

        if not especialidad:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"No se encontró la especialidad con ID {id_especialidad}",
            )

        if datos_actualizados.nombre_especialidad is not None:
            especialidad.nombre_especialidad = datos_actualizados.nombre_especialidad

        if datos_actualizados.descripcion_especialidad is not None:
            especialidad.descripcion_especialidad = datos_actualizados.descripcion_especialidad

        conexion.commit()
        conexion.refresh(especialidad)

        return (
            f"Especialidad con ID {id_especialidad} actualizada correctamente. "
            f"Nuevo nombre de especialidad: '{especialidad.nombre_especialidad}'."
        )

    finally:
        conexion.close()

# DELETE
# Ruta para eliminar una especialidad
@app.delete(
    "/especialidad/{id_especialidad}/{nombre_especialidad}",
    status_code=status.HTTP_200_OK,
    description="Elimina una especialidad por su ID.",
    response_model=str,
)
async def eliminar_especialidad(id_especialidad: int):
    conexion = SessionLocal()

    try:
        especialidad_obj = conexion.query(Especialidad).filter(
            Especialidad.id_especialidad == id_especialidad
        ).first()

        if not especialidad_obj:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"No se encontró la especialidad con ID {id_especialidad}",
            )

        conexion.delete(especialidad_obj)
        conexion.commit()

        return f"Especialidad con ID {id_especialidad} eliminada correctamente"

    finally:
        conexion.close()