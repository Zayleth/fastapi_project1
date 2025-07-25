--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: citas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.citas (
    id_cita integer NOT NULL,
    id_paciente integer NOT NULL,
    id_empleado integer NOT NULL,
    id_sala integer NOT NULL,
    fecha_cita date NOT NULL,
    hora_cita time without time zone NOT NULL,
    motivo_cita text
);


ALTER TABLE public.citas OWNER TO postgres;

--
-- Name: citas_id_cita_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.citas_id_cita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.citas_id_cita_seq OWNER TO postgres;

--
-- Name: citas_id_cita_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.citas_id_cita_seq OWNED BY public.citas.id_cita;


--
-- Name: dias_semana; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dias_semana (
    id_dia integer NOT NULL,
    nombre_dia character varying(15) NOT NULL
);


ALTER TABLE public.dias_semana OWNER TO postgres;

--
-- Name: dias_semana_id_dia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dias_semana_id_dia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dias_semana_id_dia_seq OWNER TO postgres;

--
-- Name: dias_semana_id_dia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dias_semana_id_dia_seq OWNED BY public.dias_semana.id_dia;


--
-- Name: empleados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleados (
    id_empleado integer NOT NULL,
    nombre_empleado character varying(80) NOT NULL,
    apellido_empleado character varying(80) NOT NULL,
    telefono_empleado character varying(15) NOT NULL,
    cargo_empleado character varying(50),
    id_especialidad integer
);


ALTER TABLE public.empleados OWNER TO postgres;

--
-- Name: empleados_id_empleado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empleados_id_empleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.empleados_id_empleado_seq OWNER TO postgres;

--
-- Name: empleados_id_empleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empleados_id_empleado_seq OWNED BY public.empleados.id_empleado;


--
-- Name: especialidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.especialidad (
    id_especialidad integer NOT NULL,
    nombre_especialidad character varying(80) NOT NULL,
    descripcion_especialidad text
);


ALTER TABLE public.especialidad OWNER TO postgres;

--
-- Name: especialidad_id_especialidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.especialidad_id_especialidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.especialidad_id_especialidad_seq OWNER TO postgres;

--
-- Name: especialidad_id_especialidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.especialidad_id_especialidad_seq OWNED BY public.especialidad.id_especialidad;


--
-- Name: historial_clinico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historial_clinico (
    id_historia integer NOT NULL,
    id_paciente integer,
    fecha date,
    diagnostico text,
    tratamiento text,
    observaciones text
);


ALTER TABLE public.historial_clinico OWNER TO postgres;

--
-- Name: historial_clinico_id_historia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historial_clinico_id_historia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historial_clinico_id_historia_seq OWNER TO postgres;

--
-- Name: historial_clinico_id_historia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historial_clinico_id_historia_seq OWNED BY public.historial_clinico.id_historia;


--
-- Name: horarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.horarios (
    id_horario integer NOT NULL,
    id_empleado integer NOT NULL,
    id_dia integer NOT NULL,
    hora_inicio time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL
);


ALTER TABLE public.horarios OWNER TO postgres;

--
-- Name: horarios_id_horario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.horarios_id_horario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.horarios_id_horario_seq OWNER TO postgres;

--
-- Name: horarios_id_horario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.horarios_id_horario_seq OWNED BY public.horarios.id_horario;


--
-- Name: pacientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pacientes (
    id_paciente integer NOT NULL,
    nombre_paciente character varying(80) NOT NULL,
    apellido_paciente character varying(80) NOT NULL,
    fecha_nacimiento date,
    sexo_paciente character(1),
    direccion_paciente character varying(255),
    telefono_paciente character varying(15) NOT NULL
);


ALTER TABLE public.pacientes OWNER TO postgres;

--
-- Name: pacientes_id_paciente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pacientes_id_paciente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pacientes_id_paciente_seq OWNER TO postgres;

--
-- Name: pacientes_id_paciente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pacientes_id_paciente_seq OWNED BY public.pacientes.id_paciente;


--
-- Name: salas_hospital; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salas_hospital (
    id_sala integer NOT NULL,
    nombre_sala character varying(80) NOT NULL,
    tipo_sala character varying(50),
    capacidad_sala integer NOT NULL,
    CONSTRAINT check_capacidad_sala_mayor_cero CHECK ((capacidad_sala > 0))
);


ALTER TABLE public.salas_hospital OWNER TO postgres;

--
-- Name: salas_hospital_id_sala_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.salas_hospital_id_sala_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.salas_hospital_id_sala_seq OWNER TO postgres;

--
-- Name: salas_hospital_id_sala_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.salas_hospital_id_sala_seq OWNED BY public.salas_hospital.id_sala;


--
-- Name: citas id_cita; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas ALTER COLUMN id_cita SET DEFAULT nextval('public.citas_id_cita_seq'::regclass);


--
-- Name: dias_semana id_dia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dias_semana ALTER COLUMN id_dia SET DEFAULT nextval('public.dias_semana_id_dia_seq'::regclass);


--
-- Name: empleados id_empleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados ALTER COLUMN id_empleado SET DEFAULT nextval('public.empleados_id_empleado_seq'::regclass);


--
-- Name: especialidad id_especialidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especialidad ALTER COLUMN id_especialidad SET DEFAULT nextval('public.especialidad_id_especialidad_seq'::regclass);


--
-- Name: historial_clinico id_historia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_clinico ALTER COLUMN id_historia SET DEFAULT nextval('public.historial_clinico_id_historia_seq'::regclass);


--
-- Name: horarios id_horario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horarios ALTER COLUMN id_horario SET DEFAULT nextval('public.horarios_id_horario_seq'::regclass);


--
-- Name: pacientes id_paciente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes ALTER COLUMN id_paciente SET DEFAULT nextval('public.pacientes_id_paciente_seq'::regclass);


--
-- Name: salas_hospital id_sala; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salas_hospital ALTER COLUMN id_sala SET DEFAULT nextval('public.salas_hospital_id_sala_seq'::regclass);


--
-- Data for Name: citas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.citas (id_cita, id_paciente, id_empleado, id_sala, fecha_cita, hora_cita, motivo_cita) FROM stdin;
\.


--
-- Data for Name: dias_semana; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dias_semana (id_dia, nombre_dia) FROM stdin;
\.


--
-- Data for Name: empleados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleados (id_empleado, nombre_empleado, apellido_empleado, telefono_empleado, cargo_empleado, id_especialidad) FROM stdin;
\.


--
-- Data for Name: especialidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.especialidad (id_especialidad, nombre_especialidad, descripcion_especialidad) FROM stdin;
3	cardiologia	test
8	pediatria	test
13	pediatra	test
\.


--
-- Data for Name: historial_clinico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historial_clinico (id_historia, id_paciente, fecha, diagnostico, tratamiento, observaciones) FROM stdin;
\.


--
-- Data for Name: horarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.horarios (id_horario, id_empleado, id_dia, hora_inicio, hora_fin) FROM stdin;
\.


--
-- Data for Name: pacientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pacientes (id_paciente, nombre_paciente, apellido_paciente, fecha_nacimiento, sexo_paciente, direccion_paciente, telefono_paciente) FROM stdin;
\.


--
-- Data for Name: salas_hospital; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.salas_hospital (id_sala, nombre_sala, tipo_sala, capacidad_sala) FROM stdin;
\.


--
-- Name: citas_id_cita_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.citas_id_cita_seq', 1, false);


--
-- Name: dias_semana_id_dia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dias_semana_id_dia_seq', 1, false);


--
-- Name: empleados_id_empleado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empleados_id_empleado_seq', 1, false);


--
-- Name: especialidad_id_especialidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.especialidad_id_especialidad_seq', 13, true);


--
-- Name: historial_clinico_id_historia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historial_clinico_id_historia_seq', 1, false);


--
-- Name: horarios_id_horario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.horarios_id_horario_seq', 1, false);


--
-- Name: pacientes_id_paciente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pacientes_id_paciente_seq', 1, false);


--
-- Name: salas_hospital_id_sala_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.salas_hospital_id_sala_seq', 1, false);


--
-- Name: citas citas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_pkey PRIMARY KEY (id_cita);


--
-- Name: dias_semana dias_semana_nombre_dia_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dias_semana
    ADD CONSTRAINT dias_semana_nombre_dia_key UNIQUE (nombre_dia);


--
-- Name: dias_semana dias_semana_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dias_semana
    ADD CONSTRAINT dias_semana_pkey PRIMARY KEY (id_dia);


--
-- Name: empleados empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (id_empleado);


--
-- Name: empleados empleados_telefono_empleado_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_telefono_empleado_key UNIQUE (telefono_empleado);


--
-- Name: especialidad especialidad_nombre_especialidad_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especialidad
    ADD CONSTRAINT especialidad_nombre_especialidad_key UNIQUE (nombre_especialidad);


--
-- Name: especialidad especialidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especialidad
    ADD CONSTRAINT especialidad_pkey PRIMARY KEY (id_especialidad);


--
-- Name: historial_clinico historial_clinico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_clinico
    ADD CONSTRAINT historial_clinico_pkey PRIMARY KEY (id_historia);


--
-- Name: horarios horarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horarios
    ADD CONSTRAINT horarios_pkey PRIMARY KEY (id_horario);


--
-- Name: pacientes pacientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id_paciente);


--
-- Name: pacientes pacientes_telefono_paciente_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_telefono_paciente_key UNIQUE (telefono_paciente);


--
-- Name: salas_hospital salas_hospital_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salas_hospital
    ADD CONSTRAINT salas_hospital_pkey PRIMARY KEY (id_sala);


--
-- Name: ix_dias_semana_id_dia; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_dias_semana_id_dia ON public.dias_semana USING btree (id_dia);


--
-- Name: citas citas_id_empleado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleados(id_empleado);


--
-- Name: citas citas_id_paciente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.pacientes(id_paciente);


--
-- Name: citas citas_id_sala_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_id_sala_fkey FOREIGN KEY (id_sala) REFERENCES public.salas_hospital(id_sala);


--
-- Name: empleados empleados_id_especialidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_id_especialidad_fkey FOREIGN KEY (id_especialidad) REFERENCES public.especialidad(id_especialidad) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: historial_clinico historial_clinico_id_paciente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_clinico
    ADD CONSTRAINT historial_clinico_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.pacientes(id_paciente) ON DELETE SET NULL;


--
-- Name: horarios horarios_id_dia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horarios
    ADD CONSTRAINT horarios_id_dia_fkey FOREIGN KEY (id_dia) REFERENCES public.dias_semana(id_dia);


--
-- Name: horarios horarios_id_empleado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horarios
    ADD CONSTRAINT horarios_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleados(id_empleado);


--
-- PostgreSQL database dump complete
--

