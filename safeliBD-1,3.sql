--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-10-16 15:33:46

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

--
-- TOC entry 5 (class 2615 OID 16897)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16898)
-- Name: Carpetas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Carpetas" (
    id integer NOT NULL,
    "idCarpetaDestinos" integer NOT NULL,
    "idCarpetaUsuario" integer NOT NULL,
    "idUsuario" integer NOT NULL
);


ALTER TABLE public."Carpetas" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16901)
-- Name: CarpetasDestinos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CarpetasDestinos" (
    id integer NOT NULL,
    "idCarpeta" integer NOT NULL,
    "idDestino" integer NOT NULL
);


ALTER TABLE public."CarpetasDestinos" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16904)
-- Name: CarpetasDestinos_idCarpeta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CarpetasDestinos_idCarpeta_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."CarpetasDestinos_idCarpeta_seq" OWNER TO postgres;

--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 219
-- Name: CarpetasDestinos_idCarpeta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CarpetasDestinos_idCarpeta_seq" OWNED BY public."CarpetasDestinos"."idCarpeta";


--
-- TOC entry 220 (class 1259 OID 16905)
-- Name: CarpetasDestinos_idDestino_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CarpetasDestinos_idDestino_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."CarpetasDestinos_idDestino_seq" OWNER TO postgres;

--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 220
-- Name: CarpetasDestinos_idDestino_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CarpetasDestinos_idDestino_seq" OWNED BY public."CarpetasDestinos"."idDestino";


--
-- TOC entry 221 (class 1259 OID 16906)
-- Name: CarpetasDestinos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CarpetasDestinos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."CarpetasDestinos_id_seq" OWNER TO postgres;

--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 221
-- Name: CarpetasDestinos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CarpetasDestinos_id_seq" OWNED BY public."CarpetasDestinos".id;


--
-- TOC entry 222 (class 1259 OID 16907)
-- Name: CarpetasUsuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CarpetasUsuarios" (
    id integer NOT NULL,
    "idCarpeta" integer NOT NULL,
    "idUsuario" integer NOT NULL
);


ALTER TABLE public."CarpetasUsuarios" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16910)
-- Name: CarpetasUsuarios_idCarpeta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CarpetasUsuarios_idCarpeta_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."CarpetasUsuarios_idCarpeta_seq" OWNER TO postgres;

--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 223
-- Name: CarpetasUsuarios_idCarpeta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CarpetasUsuarios_idCarpeta_seq" OWNED BY public."CarpetasUsuarios"."idCarpeta";


--
-- TOC entry 224 (class 1259 OID 16911)
-- Name: CarpetasUsuarios_idUsuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CarpetasUsuarios_idUsuario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."CarpetasUsuarios_idUsuario_seq" OWNER TO postgres;

--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 224
-- Name: CarpetasUsuarios_idUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CarpetasUsuarios_idUsuario_seq" OWNED BY public."CarpetasUsuarios"."idUsuario";


--
-- TOC entry 225 (class 1259 OID 16912)
-- Name: CarpetasUsuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CarpetasUsuarios_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."CarpetasUsuarios_id_seq" OWNER TO postgres;

--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 225
-- Name: CarpetasUsuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CarpetasUsuarios_id_seq" OWNED BY public."CarpetasUsuarios".id;


--
-- TOC entry 226 (class 1259 OID 16913)
-- Name: Carpetas_idCarpetaDestinos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Carpetas_idCarpetaDestinos_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Carpetas_idCarpetaDestinos_seq" OWNER TO postgres;

--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 226
-- Name: Carpetas_idCarpetaDestinos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Carpetas_idCarpetaDestinos_seq" OWNED BY public."Carpetas"."idCarpetaDestinos";


--
-- TOC entry 227 (class 1259 OID 16914)
-- Name: Carpetas_idCarpetaUsuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Carpetas_idCarpetaUsuario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Carpetas_idCarpetaUsuario_seq" OWNER TO postgres;

--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 227
-- Name: Carpetas_idCarpetaUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Carpetas_idCarpetaUsuario_seq" OWNED BY public."Carpetas"."idCarpetaUsuario";


--
-- TOC entry 228 (class 1259 OID 16915)
-- Name: Carpetas_idUsuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Carpetas_idUsuario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Carpetas_idUsuario_seq" OWNER TO postgres;

--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 228
-- Name: Carpetas_idUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Carpetas_idUsuario_seq" OWNED BY public."Carpetas"."idUsuario";


--
-- TOC entry 229 (class 1259 OID 16916)
-- Name: Carpetas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Carpetas_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Carpetas_id_seq" OWNER TO postgres;

--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 229
-- Name: Carpetas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Carpetas_id_seq" OWNED BY public."Carpetas".id;


--
-- TOC entry 230 (class 1259 OID 16917)
-- Name: Destinos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Destinos" (
    id integer NOT NULL,
    "idDestinosUsuarios" integer NOT NULL,
    ubicacion point NOT NULL,
    "idCarpetasDestinos" integer NOT NULL
);


ALTER TABLE public."Destinos" OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16920)
-- Name: DestinosUsuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DestinosUsuarios" (
    id integer NOT NULL,
    "idDestino" integer NOT NULL,
    "idUsuario" integer NOT NULL
);


ALTER TABLE public."DestinosUsuarios" OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16923)
-- Name: DestinosUsuarios_idDestino_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DestinosUsuarios_idDestino_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."DestinosUsuarios_idDestino_seq" OWNER TO postgres;

--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 232
-- Name: DestinosUsuarios_idDestino_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DestinosUsuarios_idDestino_seq" OWNED BY public."DestinosUsuarios"."idDestino";


--
-- TOC entry 233 (class 1259 OID 16924)
-- Name: DestinosUsuarios_idUsuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DestinosUsuarios_idUsuario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."DestinosUsuarios_idUsuario_seq" OWNER TO postgres;

--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 233
-- Name: DestinosUsuarios_idUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DestinosUsuarios_idUsuario_seq" OWNED BY public."DestinosUsuarios"."idUsuario";


--
-- TOC entry 234 (class 1259 OID 16925)
-- Name: DestinosUsuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DestinosUsuarios_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."DestinosUsuarios_id_seq" OWNER TO postgres;

--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 234
-- Name: DestinosUsuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DestinosUsuarios_id_seq" OWNED BY public."DestinosUsuarios".id;


--
-- TOC entry 235 (class 1259 OID 16926)
-- Name: OrbitUsuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrbitUsuario" (
    id integer NOT NULL,
    "idUsuario" integer NOT NULL,
    "idOrbit" integer NOT NULL
);


ALTER TABLE public."OrbitUsuario" OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16929)
-- Name: OrbitUsuario_idOrbit_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."OrbitUsuario_idOrbit_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."OrbitUsuario_idOrbit_seq" OWNER TO postgres;

--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 236
-- Name: OrbitUsuario_idOrbit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OrbitUsuario_idOrbit_seq" OWNED BY public."OrbitUsuario"."idOrbit";


--
-- TOC entry 237 (class 1259 OID 16930)
-- Name: OrbitUsuario_idUsuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."OrbitUsuario_idUsuario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."OrbitUsuario_idUsuario_seq" OWNER TO postgres;

--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 237
-- Name: OrbitUsuario_idUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OrbitUsuario_idUsuario_seq" OWNED BY public."OrbitUsuario"."idUsuario";


--
-- TOC entry 238 (class 1259 OID 16931)
-- Name: OrbitUsuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."OrbitUsuario_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."OrbitUsuario_id_seq" OWNER TO postgres;

--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 238
-- Name: OrbitUsuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OrbitUsuario_id_seq" OWNED BY public."OrbitUsuario".id;


--
-- TOC entry 239 (class 1259 OID 16932)
-- Name: Orbits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Orbits" (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    foto character varying(150),
    "idOrbitUsuario" integer NOT NULL
);


ALTER TABLE public."Orbits" OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16935)
-- Name: Orbits_idOrbitUsuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Orbits_idOrbitUsuario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Orbits_idOrbitUsuario_seq" OWNER TO postgres;

--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 240
-- Name: Orbits_idOrbitUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Orbits_idOrbitUsuario_seq" OWNED BY public."Orbits"."idOrbitUsuario";


--
-- TOC entry 241 (class 1259 OID 16936)
-- Name: Orbits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Orbits_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Orbits_id_seq" OWNER TO postgres;

--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 241
-- Name: Orbits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Orbits_id_seq" OWNED BY public."Orbits".id;


--
-- TOC entry 242 (class 1259 OID 16937)
-- Name: Usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuarios" (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    apellido character varying(150) NOT NULL,
    email character varying(150) NOT NULL,
    "nroTelefono" integer,
    username character varying(150) NOT NULL,
    foto character varying(150) NOT NULL,
    bio character varying(150),
    "fechaNacimiento" date NOT NULL,
    "contraseña" character varying(50) NOT NULL,
    ubicacion point,
    "idDestinos" integer NOT NULL,
    "idOrbitUsuario" integer NOT NULL
);


ALTER TABLE public."Usuarios" OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16942)
-- Name: Usuarios_idDestinos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Usuarios_idDestinos_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Usuarios_idDestinos_seq" OWNER TO postgres;

--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 243
-- Name: Usuarios_idDestinos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Usuarios_idDestinos_seq" OWNED BY public."Usuarios"."idDestinos";


--
-- TOC entry 244 (class 1259 OID 16943)
-- Name: Usuarios_idOrbitUsuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Usuarios_idOrbitUsuario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Usuarios_idOrbitUsuario_seq" OWNER TO postgres;

--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 244
-- Name: Usuarios_idOrbitUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Usuarios_idOrbitUsuario_seq" OWNED BY public."Usuarios"."idOrbitUsuario";


--
-- TOC entry 245 (class 1259 OID 16944)
-- Name: Usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Usuarios_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Usuarios_id_seq" OWNER TO postgres;

--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 245
-- Name: Usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Usuarios_id_seq" OWNED BY public."Usuarios".id;


--
-- TOC entry 246 (class 1259 OID 16945)
-- Name: destinos_carpeta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.destinos_carpeta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.destinos_carpeta_seq OWNER TO postgres;

--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 246
-- Name: destinos_carpeta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.destinos_carpeta_seq OWNED BY public."Destinos"."idCarpetasDestinos";


--
-- TOC entry 247 (class 1259 OID 16946)
-- Name: destinos_idUsuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."destinos_idUsuario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."destinos_idUsuario_seq" OWNER TO postgres;

--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 247
-- Name: destinos_idUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."destinos_idUsuario_seq" OWNED BY public."Destinos"."idDestinosUsuarios";


--
-- TOC entry 248 (class 1259 OID 16947)
-- Name: destinos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.destinos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.destinos_id_seq OWNER TO postgres;

--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 248
-- Name: destinos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.destinos_id_seq OWNED BY public."Destinos".id;


--
-- TOC entry 4746 (class 2604 OID 16948)
-- Name: Carpetas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carpetas" ALTER COLUMN id SET DEFAULT nextval('public."Carpetas_id_seq"'::regclass);


--
-- TOC entry 4747 (class 2604 OID 16949)
-- Name: Carpetas idCarpetaDestinos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carpetas" ALTER COLUMN "idCarpetaDestinos" SET DEFAULT nextval('public."Carpetas_idCarpetaDestinos_seq"'::regclass);


--
-- TOC entry 4748 (class 2604 OID 16950)
-- Name: Carpetas idCarpetaUsuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carpetas" ALTER COLUMN "idCarpetaUsuario" SET DEFAULT nextval('public."Carpetas_idCarpetaUsuario_seq"'::regclass);


--
-- TOC entry 4749 (class 2604 OID 16951)
-- Name: Carpetas idUsuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carpetas" ALTER COLUMN "idUsuario" SET DEFAULT nextval('public."Carpetas_idUsuario_seq"'::regclass);


--
-- TOC entry 4750 (class 2604 OID 16952)
-- Name: CarpetasDestinos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasDestinos" ALTER COLUMN id SET DEFAULT nextval('public."CarpetasDestinos_id_seq"'::regclass);


--
-- TOC entry 4751 (class 2604 OID 16953)
-- Name: CarpetasDestinos idCarpeta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasDestinos" ALTER COLUMN "idCarpeta" SET DEFAULT nextval('public."CarpetasDestinos_idCarpeta_seq"'::regclass);


--
-- TOC entry 4752 (class 2604 OID 16954)
-- Name: CarpetasDestinos idDestino; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasDestinos" ALTER COLUMN "idDestino" SET DEFAULT nextval('public."CarpetasDestinos_idDestino_seq"'::regclass);


--
-- TOC entry 4753 (class 2604 OID 16955)
-- Name: CarpetasUsuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasUsuarios" ALTER COLUMN id SET DEFAULT nextval('public."CarpetasUsuarios_id_seq"'::regclass);


--
-- TOC entry 4754 (class 2604 OID 16956)
-- Name: CarpetasUsuarios idCarpeta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasUsuarios" ALTER COLUMN "idCarpeta" SET DEFAULT nextval('public."CarpetasUsuarios_idCarpeta_seq"'::regclass);


--
-- TOC entry 4755 (class 2604 OID 16957)
-- Name: CarpetasUsuarios idUsuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasUsuarios" ALTER COLUMN "idUsuario" SET DEFAULT nextval('public."CarpetasUsuarios_idUsuario_seq"'::regclass);


--
-- TOC entry 4756 (class 2604 OID 16958)
-- Name: Destinos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Destinos" ALTER COLUMN id SET DEFAULT nextval('public.destinos_id_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 16959)
-- Name: Destinos idDestinosUsuarios; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Destinos" ALTER COLUMN "idDestinosUsuarios" SET DEFAULT nextval('public."destinos_idUsuario_seq"'::regclass);


--
-- TOC entry 4758 (class 2604 OID 16960)
-- Name: Destinos idCarpetasDestinos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Destinos" ALTER COLUMN "idCarpetasDestinos" SET DEFAULT nextval('public.destinos_carpeta_seq'::regclass);


--
-- TOC entry 4759 (class 2604 OID 16961)
-- Name: DestinosUsuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DestinosUsuarios" ALTER COLUMN id SET DEFAULT nextval('public."DestinosUsuarios_id_seq"'::regclass);


--
-- TOC entry 4760 (class 2604 OID 16962)
-- Name: DestinosUsuarios idDestino; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DestinosUsuarios" ALTER COLUMN "idDestino" SET DEFAULT nextval('public."DestinosUsuarios_idDestino_seq"'::regclass);


--
-- TOC entry 4761 (class 2604 OID 16963)
-- Name: DestinosUsuarios idUsuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DestinosUsuarios" ALTER COLUMN "idUsuario" SET DEFAULT nextval('public."DestinosUsuarios_idUsuario_seq"'::regclass);


--
-- TOC entry 4762 (class 2604 OID 16964)
-- Name: OrbitUsuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrbitUsuario" ALTER COLUMN id SET DEFAULT nextval('public."OrbitUsuario_id_seq"'::regclass);


--
-- TOC entry 4763 (class 2604 OID 16965)
-- Name: OrbitUsuario idUsuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrbitUsuario" ALTER COLUMN "idUsuario" SET DEFAULT nextval('public."OrbitUsuario_idUsuario_seq"'::regclass);


--
-- TOC entry 4764 (class 2604 OID 16966)
-- Name: OrbitUsuario idOrbit; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrbitUsuario" ALTER COLUMN "idOrbit" SET DEFAULT nextval('public."OrbitUsuario_idOrbit_seq"'::regclass);


--
-- TOC entry 4765 (class 2604 OID 16967)
-- Name: Orbits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orbits" ALTER COLUMN id SET DEFAULT nextval('public."Orbits_id_seq"'::regclass);


--
-- TOC entry 4766 (class 2604 OID 16968)
-- Name: Orbits idOrbitUsuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orbits" ALTER COLUMN "idOrbitUsuario" SET DEFAULT nextval('public."Orbits_idOrbitUsuario_seq"'::regclass);


--
-- TOC entry 4767 (class 2604 OID 16969)
-- Name: Usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuarios" ALTER COLUMN id SET DEFAULT nextval('public."Usuarios_id_seq"'::regclass);


--
-- TOC entry 4768 (class 2604 OID 16970)
-- Name: Usuarios idDestinos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuarios" ALTER COLUMN "idDestinos" SET DEFAULT nextval('public."Usuarios_idDestinos_seq"'::regclass);


--
-- TOC entry 4769 (class 2604 OID 16971)
-- Name: Usuarios idOrbitUsuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuarios" ALTER COLUMN "idOrbitUsuario" SET DEFAULT nextval('public."Usuarios_idOrbitUsuario_seq"'::regclass);


--
-- TOC entry 4960 (class 0 OID 16898)
-- Dependencies: 217
-- Data for Name: Carpetas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4961 (class 0 OID 16901)
-- Dependencies: 218
-- Data for Name: CarpetasDestinos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4965 (class 0 OID 16907)
-- Dependencies: 222
-- Data for Name: CarpetasUsuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4973 (class 0 OID 16917)
-- Dependencies: 230
-- Data for Name: Destinos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4974 (class 0 OID 16920)
-- Dependencies: 231
-- Data for Name: DestinosUsuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4978 (class 0 OID 16926)
-- Dependencies: 235
-- Data for Name: OrbitUsuario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4982 (class 0 OID 16932)
-- Dependencies: 239
-- Data for Name: Orbits; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4985 (class 0 OID 16937)
-- Dependencies: 242
-- Data for Name: Usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 219
-- Name: CarpetasDestinos_idCarpeta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CarpetasDestinos_idCarpeta_seq"', 1, false);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 220
-- Name: CarpetasDestinos_idDestino_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CarpetasDestinos_idDestino_seq"', 1, false);


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 221
-- Name: CarpetasDestinos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CarpetasDestinos_id_seq"', 1, false);


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 223
-- Name: CarpetasUsuarios_idCarpeta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CarpetasUsuarios_idCarpeta_seq"', 1, false);


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 224
-- Name: CarpetasUsuarios_idUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CarpetasUsuarios_idUsuario_seq"', 1, false);


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 225
-- Name: CarpetasUsuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CarpetasUsuarios_id_seq"', 1, false);


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 226
-- Name: Carpetas_idCarpetaDestinos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Carpetas_idCarpetaDestinos_seq"', 1, false);


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 227
-- Name: Carpetas_idCarpetaUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Carpetas_idCarpetaUsuario_seq"', 1, false);


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 228
-- Name: Carpetas_idUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Carpetas_idUsuario_seq"', 1, false);


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 229
-- Name: Carpetas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Carpetas_id_seq"', 1, false);


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 232
-- Name: DestinosUsuarios_idDestino_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DestinosUsuarios_idDestino_seq"', 1, false);


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 233
-- Name: DestinosUsuarios_idUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DestinosUsuarios_idUsuario_seq"', 1, false);


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 234
-- Name: DestinosUsuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DestinosUsuarios_id_seq"', 1, false);


--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 236
-- Name: OrbitUsuario_idOrbit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OrbitUsuario_idOrbit_seq"', 1, false);


--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 237
-- Name: OrbitUsuario_idUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OrbitUsuario_idUsuario_seq"', 1, false);


--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 238
-- Name: OrbitUsuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OrbitUsuario_id_seq"', 1, false);


--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 240
-- Name: Orbits_idOrbitUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Orbits_idOrbitUsuario_seq"', 1, false);


--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 241
-- Name: Orbits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Orbits_id_seq"', 1, false);


--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 243
-- Name: Usuarios_idDestinos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Usuarios_idDestinos_seq"', 1, false);


--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 244
-- Name: Usuarios_idOrbitUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Usuarios_idOrbitUsuario_seq"', 1, false);


--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 245
-- Name: Usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Usuarios_id_seq"', 1, false);


--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 246
-- Name: destinos_carpeta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.destinos_carpeta_seq', 1, false);


--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 247
-- Name: destinos_idUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."destinos_idUsuario_seq"', 1, false);


--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 248
-- Name: destinos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.destinos_id_seq', 1, false);


--
-- TOC entry 4798 (class 2606 OID 16973)
-- Name: Usuarios id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- TOC entry 4773 (class 2606 OID 16975)
-- Name: Carpetas idCarpeta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carpetas"
    ADD CONSTRAINT "idCarpeta" PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 4777 (class 2606 OID 16977)
-- Name: CarpetasDestinos idCarpetaDestinos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasDestinos"
    ADD CONSTRAINT "idCarpetaDestinos" PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 4781 (class 2606 OID 16979)
-- Name: CarpetasUsuarios idCarpetaUsuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasUsuarios"
    ADD CONSTRAINT "idCarpetaUsuario" PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 4785 (class 2606 OID 16981)
-- Name: Destinos idDest; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Destinos"
    ADD CONSTRAINT "idDest" PRIMARY KEY (id);


--
-- TOC entry 4788 (class 2606 OID 16983)
-- Name: DestinosUsuarios idDestinoUsuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DestinosUsuarios"
    ADD CONSTRAINT "idDestinoUsuario" PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 4795 (class 2606 OID 16985)
-- Name: Orbits idOrbit; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orbits"
    ADD CONSTRAINT "idOrbit" PRIMARY KEY (id);


--
-- TOC entry 4792 (class 2606 OID 16987)
-- Name: OrbitUsuario idOrbitUsuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrbitUsuario"
    ADD CONSTRAINT "idOrbitUsuario" PRIMARY KEY (id);


--
-- TOC entry 4774 (class 1259 OID 16988)
-- Name: fki_idCarpetaCarpetasDestinos; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idCarpetaCarpetasDestinos" ON public."CarpetasDestinos" USING btree ("idCarpeta");


--
-- TOC entry 4778 (class 1259 OID 17057)
-- Name: fki_idCarpetaCarpetasUsuarios; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idCarpetaCarpetasUsuarios" ON public."CarpetasUsuarios" USING btree ("idCarpeta");


--
-- TOC entry 4770 (class 1259 OID 17039)
-- Name: fki_idCarpetaDestinos; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idCarpetaDestinos" ON public."Carpetas" USING btree ("idCarpetaDestinos");


--
-- TOC entry 4771 (class 1259 OID 17045)
-- Name: fki_idCarpetaUsuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idCarpetaUsuario" ON public."Carpetas" USING btree ("idCarpetaUsuario");


--
-- TOC entry 4782 (class 1259 OID 17075)
-- Name: fki_idCarpetasDestinos; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idCarpetasDestinos" ON public."Destinos" USING btree ("idCarpetasDestinos");


--
-- TOC entry 4786 (class 1259 OID 17081)
-- Name: fki_idDestino; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idDestino" ON public."DestinosUsuarios" USING btree ("idDestino");


--
-- TOC entry 4775 (class 1259 OID 17051)
-- Name: fki_idDestinoCarpetasDestinos; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idDestinoCarpetasDestinos" ON public."CarpetasDestinos" USING btree ("idDestino");


--
-- TOC entry 4796 (class 1259 OID 16989)
-- Name: fki_idDestinos; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idDestinos" ON public."Usuarios" USING btree ("idDestinos");


--
-- TOC entry 4783 (class 1259 OID 17069)
-- Name: fki_idDestinosUsuarios; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idDestinosUsuarios" ON public."Destinos" USING btree ("idDestinosUsuarios");


--
-- TOC entry 4789 (class 1259 OID 16990)
-- Name: fki_idOrbit; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idOrbit" ON public."OrbitUsuario" USING btree ("idOrbit");


--
-- TOC entry 4793 (class 1259 OID 16991)
-- Name: fki_idOrbitUsuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idOrbitUsuario" ON public."Orbits" USING btree ("idOrbitUsuario");


--
-- TOC entry 4790 (class 1259 OID 16992)
-- Name: fki_idUsuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idUsuario" ON public."OrbitUsuario" USING btree ("idUsuario");


--
-- TOC entry 4779 (class 1259 OID 17063)
-- Name: fki_idUsuarioCarpetasUsuarios; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idUsuarioCarpetasUsuarios" ON public."CarpetasUsuarios" USING btree ("idUsuario");


--
-- TOC entry 4802 (class 2606 OID 16993)
-- Name: CarpetasDestinos idCarpetaCarpetasDestinos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasDestinos"
    ADD CONSTRAINT "idCarpetaCarpetasDestinos" FOREIGN KEY ("idCarpeta") REFERENCES public."Carpetas"(id) NOT VALID;


--
-- TOC entry 4804 (class 2606 OID 17052)
-- Name: CarpetasUsuarios idCarpetaCarpetasUsuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasUsuarios"
    ADD CONSTRAINT "idCarpetaCarpetasUsuarios" FOREIGN KEY ("idCarpeta") REFERENCES public."Carpetas"(id) NOT VALID;


--
-- TOC entry 4799 (class 2606 OID 17034)
-- Name: Carpetas idCarpetaDestinos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carpetas"
    ADD CONSTRAINT "idCarpetaDestinos" FOREIGN KEY ("idCarpetaDestinos") REFERENCES public."CarpetasDestinos"(id) NOT VALID;


--
-- TOC entry 4800 (class 2606 OID 17040)
-- Name: Carpetas idCarpetaUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carpetas"
    ADD CONSTRAINT "idCarpetaUsuario" FOREIGN KEY ("idCarpetaUsuario") REFERENCES public."CarpetasUsuarios"(id) NOT VALID;


--
-- TOC entry 4806 (class 2606 OID 17070)
-- Name: Destinos idCarpetasDestinos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Destinos"
    ADD CONSTRAINT "idCarpetasDestinos" FOREIGN KEY ("idCarpetasDestinos") REFERENCES public."CarpetasDestinos"(id) NOT VALID;


--
-- TOC entry 4808 (class 2606 OID 17076)
-- Name: DestinosUsuarios idDestino; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DestinosUsuarios"
    ADD CONSTRAINT "idDestino" FOREIGN KEY ("idDestino") REFERENCES public."Destinos"(id) NOT VALID;


--
-- TOC entry 4803 (class 2606 OID 17046)
-- Name: CarpetasDestinos idDestinoCarpetasDestinos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasDestinos"
    ADD CONSTRAINT "idDestinoCarpetasDestinos" FOREIGN KEY ("idDestino") REFERENCES public."Destinos"(id) NOT VALID;


--
-- TOC entry 4813 (class 2606 OID 16998)
-- Name: Usuarios idDestinos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT "idDestinos" FOREIGN KEY ("idDestinos") REFERENCES public."Destinos"(id) NOT VALID;


--
-- TOC entry 4807 (class 2606 OID 17064)
-- Name: Destinos idDestinosUsuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Destinos"
    ADD CONSTRAINT "idDestinosUsuarios" FOREIGN KEY ("idDestinosUsuarios") REFERENCES public."DestinosUsuarios"(id) NOT VALID;


--
-- TOC entry 4810 (class 2606 OID 17003)
-- Name: OrbitUsuario idOrbit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrbitUsuario"
    ADD CONSTRAINT "idOrbit" FOREIGN KEY ("idOrbit") REFERENCES public."Orbits"(id) NOT VALID;


--
-- TOC entry 4812 (class 2606 OID 17008)
-- Name: Orbits idOrbitUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orbits"
    ADD CONSTRAINT "idOrbitUsuario" FOREIGN KEY ("idOrbitUsuario") REFERENCES public."OrbitUsuario"(id) NOT VALID;


--
-- TOC entry 4814 (class 2606 OID 17013)
-- Name: Usuarios idOrbitUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT "idOrbitUsuario" FOREIGN KEY ("idOrbitUsuario") REFERENCES public."OrbitUsuario"(id) NOT VALID;


--
-- TOC entry 4811 (class 2606 OID 17018)
-- Name: OrbitUsuario idUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrbitUsuario"
    ADD CONSTRAINT "idUsuario" FOREIGN KEY ("idUsuario") REFERENCES public."Usuarios"(id) NOT VALID;


--
-- TOC entry 4801 (class 2606 OID 17029)
-- Name: Carpetas idUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carpetas"
    ADD CONSTRAINT "idUsuario" FOREIGN KEY ("idUsuario") REFERENCES public."Usuarios"(id) NOT VALID;


--
-- TOC entry 4809 (class 2606 OID 17082)
-- Name: DestinosUsuarios idUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DestinosUsuarios"
    ADD CONSTRAINT "idUsuario" FOREIGN KEY ("idUsuario") REFERENCES public."Usuarios"(id) NOT VALID;


--
-- TOC entry 4805 (class 2606 OID 17058)
-- Name: CarpetasUsuarios idUsuarioCarpetasUsuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasUsuarios"
    ADD CONSTRAINT "idUsuarioCarpetasUsuarios" FOREIGN KEY ("idUsuario") REFERENCES public."Usuarios"(id) NOT VALID;


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2025-10-16 15:33:46

--
-- PostgreSQL database dump complete
--

