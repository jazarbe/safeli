--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.0

-- Started on 2025-11-27 10:38:24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 16398)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16399)
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
-- TOC entry 217 (class 1259 OID 16402)
-- Name: CarpetasDestinos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CarpetasDestinos" (
    id integer NOT NULL,
    "idCarpeta" integer NOT NULL,
    "idDestino" integer NOT NULL
);


ALTER TABLE public."CarpetasDestinos" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16405)
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
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 218
-- Name: CarpetasDestinos_idCarpeta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CarpetasDestinos_idCarpeta_seq" OWNED BY public."CarpetasDestinos"."idCarpeta";


--
-- TOC entry 219 (class 1259 OID 16406)
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
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 219
-- Name: CarpetasDestinos_idDestino_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CarpetasDestinos_idDestino_seq" OWNED BY public."CarpetasDestinos"."idDestino";


--
-- TOC entry 220 (class 1259 OID 16407)
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
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 220
-- Name: CarpetasDestinos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CarpetasDestinos_id_seq" OWNED BY public."CarpetasDestinos".id;


--
-- TOC entry 221 (class 1259 OID 16408)
-- Name: CarpetasUsuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CarpetasUsuarios" (
    id integer NOT NULL,
    "idCarpeta" integer NOT NULL,
    "idUsuario" integer NOT NULL
);


ALTER TABLE public."CarpetasUsuarios" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16411)
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
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 222
-- Name: CarpetasUsuarios_idCarpeta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CarpetasUsuarios_idCarpeta_seq" OWNED BY public."CarpetasUsuarios"."idCarpeta";


--
-- TOC entry 223 (class 1259 OID 16412)
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
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 223
-- Name: CarpetasUsuarios_idUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CarpetasUsuarios_idUsuario_seq" OWNED BY public."CarpetasUsuarios"."idUsuario";


--
-- TOC entry 224 (class 1259 OID 16413)
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
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 224
-- Name: CarpetasUsuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CarpetasUsuarios_id_seq" OWNED BY public."CarpetasUsuarios".id;


--
-- TOC entry 225 (class 1259 OID 16414)
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
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 225
-- Name: Carpetas_idCarpetaDestinos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Carpetas_idCarpetaDestinos_seq" OWNED BY public."Carpetas"."idCarpetaDestinos";


--
-- TOC entry 226 (class 1259 OID 16415)
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
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 226
-- Name: Carpetas_idCarpetaUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Carpetas_idCarpetaUsuario_seq" OWNED BY public."Carpetas"."idCarpetaUsuario";


--
-- TOC entry 227 (class 1259 OID 16416)
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
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 227
-- Name: Carpetas_idUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Carpetas_idUsuario_seq" OWNED BY public."Carpetas"."idUsuario";


--
-- TOC entry 228 (class 1259 OID 16417)
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
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 228
-- Name: Carpetas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Carpetas_id_seq" OWNED BY public."Carpetas".id;


--
-- TOC entry 229 (class 1259 OID 16418)
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
-- TOC entry 230 (class 1259 OID 16421)
-- Name: DestinosUsuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DestinosUsuarios" (
    id integer NOT NULL,
    "idDestino" integer NOT NULL,
    "idUsuario" integer NOT NULL
);


ALTER TABLE public."DestinosUsuarios" OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16424)
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
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 231
-- Name: DestinosUsuarios_idDestino_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DestinosUsuarios_idDestino_seq" OWNED BY public."DestinosUsuarios"."idDestino";


--
-- TOC entry 232 (class 1259 OID 16425)
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
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 232
-- Name: DestinosUsuarios_idUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DestinosUsuarios_idUsuario_seq" OWNED BY public."DestinosUsuarios"."idUsuario";


--
-- TOC entry 233 (class 1259 OID 16426)
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
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 233
-- Name: DestinosUsuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DestinosUsuarios_id_seq" OWNED BY public."DestinosUsuarios".id;


--
-- TOC entry 234 (class 1259 OID 16427)
-- Name: EmailCodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."EmailCodes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."EmailCodes_id_seq" OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16428)
-- Name: EmailCodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EmailCodes" (
    id integer DEFAULT nextval('public."EmailCodes_id_seq"'::regclass) NOT NULL,
    token character varying(255)[] NOT NULL,
    "idUsuario" integer NOT NULL,
    "creadoCuando" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "expiraCuando" timestamp with time zone NOT NULL,
    usado boolean DEFAULT false
);


ALTER TABLE public."EmailCodes" OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16436)
-- Name: OrbitUsuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrbitUsuario" (
    id integer NOT NULL,
    "idUsuario" integer NOT NULL,
    "idOrbit" integer NOT NULL
);


ALTER TABLE public."OrbitUsuario" OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16439)
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
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 237
-- Name: OrbitUsuario_idOrbit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OrbitUsuario_idOrbit_seq" OWNED BY public."OrbitUsuario"."idOrbit";


--
-- TOC entry 238 (class 1259 OID 16440)
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
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 238
-- Name: OrbitUsuario_idUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OrbitUsuario_idUsuario_seq" OWNED BY public."OrbitUsuario"."idUsuario";


--
-- TOC entry 239 (class 1259 OID 16441)
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
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 239
-- Name: OrbitUsuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OrbitUsuario_id_seq" OWNED BY public."OrbitUsuario".id;


--
-- TOC entry 240 (class 1259 OID 16442)
-- Name: Orbits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Orbits" (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    foto character varying(150),
    link character varying(500) NOT NULL
);


ALTER TABLE public."Orbits" OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16447)
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
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 241
-- Name: Orbits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Orbits_id_seq" OWNED BY public."Orbits".id;


--
-- TOC entry 242 (class 1259 OID 16448)
-- Name: SafeliScore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SafeliScore" (
    id integer NOT NULL,
    ubicacion character varying(500) NOT NULL,
    feedback character varying(50000),
    "cantEstrellas" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."SafeliScore" OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16454)
-- Name: Usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuarios" (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    apellido character varying(150) NOT NULL,
    email character varying(150) NOT NULL,
    "nroTelefono" integer,
    username character varying(150) NOT NULL,
    foto character varying(150) DEFAULT '-1'::integer NOT NULL,
    bio character varying(150),
    "fechaNacimiento" date NOT NULL,
    "contraseña" character varying(50) NOT NULL,
    "idDestinos" integer,
    "contactoEmergencia" integer DEFAULT '-1'::integer,
    confirmado boolean,
    ubicacion character varying(150)
);


ALTER TABLE public."Usuarios" OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 16461)
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
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 244
-- Name: Usuarios_idDestinos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Usuarios_idDestinos_seq" OWNED BY public."Usuarios"."idDestinos";


--
-- TOC entry 245 (class 1259 OID 16462)
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
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 245
-- Name: Usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Usuarios_id_seq" OWNED BY public."Usuarios".id;


--
-- TOC entry 246 (class 1259 OID 16463)
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
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 246
-- Name: destinos_carpeta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.destinos_carpeta_seq OWNED BY public."Destinos"."idCarpetasDestinos";


--
-- TOC entry 247 (class 1259 OID 16464)
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
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 247
-- Name: destinos_idUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."destinos_idUsuario_seq" OWNED BY public."Destinos"."idDestinosUsuarios";


--
-- TOC entry 248 (class 1259 OID 16465)
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
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 248
-- Name: destinos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.destinos_id_seq OWNED BY public."Destinos".id;


--
-- TOC entry 4693 (class 2604 OID 16466)
-- Name: Carpetas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carpetas" ALTER COLUMN id SET DEFAULT nextval('public."Carpetas_id_seq"'::regclass);


--
-- TOC entry 4694 (class 2604 OID 16467)
-- Name: Carpetas idCarpetaDestinos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carpetas" ALTER COLUMN "idCarpetaDestinos" SET DEFAULT nextval('public."Carpetas_idCarpetaDestinos_seq"'::regclass);


--
-- TOC entry 4695 (class 2604 OID 16468)
-- Name: Carpetas idCarpetaUsuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carpetas" ALTER COLUMN "idCarpetaUsuario" SET DEFAULT nextval('public."Carpetas_idCarpetaUsuario_seq"'::regclass);


--
-- TOC entry 4696 (class 2604 OID 16469)
-- Name: Carpetas idUsuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carpetas" ALTER COLUMN "idUsuario" SET DEFAULT nextval('public."Carpetas_idUsuario_seq"'::regclass);


--
-- TOC entry 4697 (class 2604 OID 16470)
-- Name: CarpetasDestinos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasDestinos" ALTER COLUMN id SET DEFAULT nextval('public."CarpetasDestinos_id_seq"'::regclass);


--
-- TOC entry 4698 (class 2604 OID 16471)
-- Name: CarpetasDestinos idCarpeta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasDestinos" ALTER COLUMN "idCarpeta" SET DEFAULT nextval('public."CarpetasDestinos_idCarpeta_seq"'::regclass);


--
-- TOC entry 4699 (class 2604 OID 16472)
-- Name: CarpetasDestinos idDestino; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasDestinos" ALTER COLUMN "idDestino" SET DEFAULT nextval('public."CarpetasDestinos_idDestino_seq"'::regclass);


--
-- TOC entry 4700 (class 2604 OID 16473)
-- Name: CarpetasUsuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasUsuarios" ALTER COLUMN id SET DEFAULT nextval('public."CarpetasUsuarios_id_seq"'::regclass);


--
-- TOC entry 4701 (class 2604 OID 16474)
-- Name: CarpetasUsuarios idCarpeta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasUsuarios" ALTER COLUMN "idCarpeta" SET DEFAULT nextval('public."CarpetasUsuarios_idCarpeta_seq"'::regclass);


--
-- TOC entry 4702 (class 2604 OID 16475)
-- Name: CarpetasUsuarios idUsuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasUsuarios" ALTER COLUMN "idUsuario" SET DEFAULT nextval('public."CarpetasUsuarios_idUsuario_seq"'::regclass);


--
-- TOC entry 4703 (class 2604 OID 16476)
-- Name: Destinos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Destinos" ALTER COLUMN id SET DEFAULT nextval('public.destinos_id_seq'::regclass);


--
-- TOC entry 4704 (class 2604 OID 16477)
-- Name: Destinos idDestinosUsuarios; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Destinos" ALTER COLUMN "idDestinosUsuarios" SET DEFAULT nextval('public."destinos_idUsuario_seq"'::regclass);


--
-- TOC entry 4705 (class 2604 OID 16478)
-- Name: Destinos idCarpetasDestinos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Destinos" ALTER COLUMN "idCarpetasDestinos" SET DEFAULT nextval('public.destinos_carpeta_seq'::regclass);


--
-- TOC entry 4706 (class 2604 OID 16479)
-- Name: DestinosUsuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DestinosUsuarios" ALTER COLUMN id SET DEFAULT nextval('public."DestinosUsuarios_id_seq"'::regclass);


--
-- TOC entry 4707 (class 2604 OID 16480)
-- Name: DestinosUsuarios idDestino; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DestinosUsuarios" ALTER COLUMN "idDestino" SET DEFAULT nextval('public."DestinosUsuarios_idDestino_seq"'::regclass);


--
-- TOC entry 4708 (class 2604 OID 16481)
-- Name: DestinosUsuarios idUsuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DestinosUsuarios" ALTER COLUMN "idUsuario" SET DEFAULT nextval('public."DestinosUsuarios_idUsuario_seq"'::regclass);


--
-- TOC entry 4712 (class 2604 OID 16482)
-- Name: OrbitUsuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrbitUsuario" ALTER COLUMN id SET DEFAULT nextval('public."OrbitUsuario_id_seq"'::regclass);


--
-- TOC entry 4713 (class 2604 OID 16483)
-- Name: OrbitUsuario idUsuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrbitUsuario" ALTER COLUMN "idUsuario" SET DEFAULT nextval('public."OrbitUsuario_idUsuario_seq"'::regclass);


--
-- TOC entry 4714 (class 2604 OID 16484)
-- Name: OrbitUsuario idOrbit; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrbitUsuario" ALTER COLUMN "idOrbit" SET DEFAULT nextval('public."OrbitUsuario_idOrbit_seq"'::regclass);


--
-- TOC entry 4715 (class 2604 OID 16485)
-- Name: Orbits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orbits" ALTER COLUMN id SET DEFAULT nextval('public."Orbits_id_seq"'::regclass);


--
-- TOC entry 4717 (class 2604 OID 16486)
-- Name: Usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuarios" ALTER COLUMN id SET DEFAULT nextval('public."Usuarios_id_seq"'::regclass);


--
-- TOC entry 4911 (class 0 OID 16399)
-- Dependencies: 216
-- Data for Name: Carpetas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4912 (class 0 OID 16402)
-- Dependencies: 217
-- Data for Name: CarpetasDestinos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4916 (class 0 OID 16408)
-- Dependencies: 221
-- Data for Name: CarpetasUsuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4924 (class 0 OID 16418)
-- Dependencies: 229
-- Data for Name: Destinos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4925 (class 0 OID 16421)
-- Dependencies: 230
-- Data for Name: DestinosUsuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4930 (class 0 OID 16428)
-- Dependencies: 235
-- Data for Name: EmailCodes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4931 (class 0 OID 16436)
-- Dependencies: 236
-- Data for Name: OrbitUsuario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4935 (class 0 OID 16442)
-- Dependencies: 240
-- Data for Name: Orbits; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4937 (class 0 OID 16448)
-- Dependencies: 242
-- Data for Name: SafeliScore; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4938 (class 0 OID 16454)
-- Dependencies: 243
-- Data for Name: Usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Usuarios" VALUES (6, 'Joaco', 'iribas', 'joaquiniribas@gmail.com', 1120203434, 'Aura2Man', 'IMG_8121.jpeg', '', '2000-02-01', 'miSafeli.360', NULL, 1180809090, false, NULL);
INSERT INTO public."Usuarios" VALUES (7, 'Jazmin', 'Arias', 'jazminariasberlin@gmail.com', 1139448264, 'jazarbe', 'foto-jaz.jpg', '', '2009-03-16', 'prueba4', NULL, 0, false, NULL);
INSERT INTO public."Usuarios" VALUES (8, 'Diana', 'Park', 'dianairenepark08@gmail.com', 11, 'ddpyi', 'foto-dai.jfif', '', '2008-11-27', 'holadai', NULL, 0, false, NULL);
INSERT INTO public."Usuarios" VALUES (9, 'Ciro', 'Perazzo', 'ciroperazzo08@gmail.com', 0, 'cirif', 'default.jpg', '', '2008-10-20', 'hola', NULL, 0, false, NULL);


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 218
-- Name: CarpetasDestinos_idCarpeta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CarpetasDestinos_idCarpeta_seq"', 1, false);


--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 219
-- Name: CarpetasDestinos_idDestino_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CarpetasDestinos_idDestino_seq"', 1, false);


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 220
-- Name: CarpetasDestinos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CarpetasDestinos_id_seq"', 1, false);


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 222
-- Name: CarpetasUsuarios_idCarpeta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CarpetasUsuarios_idCarpeta_seq"', 1, false);


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 223
-- Name: CarpetasUsuarios_idUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CarpetasUsuarios_idUsuario_seq"', 1, false);


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 224
-- Name: CarpetasUsuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CarpetasUsuarios_id_seq"', 1, false);


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 225
-- Name: Carpetas_idCarpetaDestinos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Carpetas_idCarpetaDestinos_seq"', 1, false);


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 226
-- Name: Carpetas_idCarpetaUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Carpetas_idCarpetaUsuario_seq"', 1, false);


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 227
-- Name: Carpetas_idUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Carpetas_idUsuario_seq"', 1, false);


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 228
-- Name: Carpetas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Carpetas_id_seq"', 1, false);


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 231
-- Name: DestinosUsuarios_idDestino_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DestinosUsuarios_idDestino_seq"', 1, false);


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 232
-- Name: DestinosUsuarios_idUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DestinosUsuarios_idUsuario_seq"', 1, false);


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 233
-- Name: DestinosUsuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DestinosUsuarios_id_seq"', 1, false);


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 234
-- Name: EmailCodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."EmailCodes_id_seq"', 1, false);


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 237
-- Name: OrbitUsuario_idOrbit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OrbitUsuario_idOrbit_seq"', 1, false);


--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 238
-- Name: OrbitUsuario_idUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OrbitUsuario_idUsuario_seq"', 1, false);


--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 239
-- Name: OrbitUsuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OrbitUsuario_id_seq"', 19, true);


--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 241
-- Name: Orbits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Orbits_id_seq"', 24, true);


--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 244
-- Name: Usuarios_idDestinos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Usuarios_idDestinos_seq"', 1, false);


--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 245
-- Name: Usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Usuarios_id_seq"', 9, true);


--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 246
-- Name: destinos_carpeta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.destinos_carpeta_seq', 1, false);


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 247
-- Name: destinos_idUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."destinos_idUsuario_seq"', 1, false);


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 248
-- Name: destinos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.destinos_id_seq', 1, false);


--
-- TOC entry 4750 (class 2606 OID 16488)
-- Name: SafeliScore SafeliScore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SafeliScore"
    ADD CONSTRAINT "SafeliScore_pkey" PRIMARY KEY (id);


--
-- TOC entry 4753 (class 2606 OID 16490)
-- Name: Usuarios id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- TOC entry 4723 (class 2606 OID 16492)
-- Name: Carpetas idCarpeta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carpetas"
    ADD CONSTRAINT "idCarpeta" PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 4727 (class 2606 OID 16494)
-- Name: CarpetasDestinos idCarpetaDestinos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasDestinos"
    ADD CONSTRAINT "idCarpetaDestinos" PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 4731 (class 2606 OID 16496)
-- Name: CarpetasUsuarios idCarpetaUsuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasUsuarios"
    ADD CONSTRAINT "idCarpetaUsuario" PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 4740 (class 2606 OID 16498)
-- Name: EmailCodes idContraseñaCodes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EmailCodes"
    ADD CONSTRAINT "idContraseñaCodes" PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 4735 (class 2606 OID 16500)
-- Name: Destinos idDest; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Destinos"
    ADD CONSTRAINT "idDest" PRIMARY KEY (id);


--
-- TOC entry 4738 (class 2606 OID 16502)
-- Name: DestinosUsuarios idDestinoUsuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DestinosUsuarios"
    ADD CONSTRAINT "idDestinoUsuario" PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 4748 (class 2606 OID 16504)
-- Name: Orbits idOrbit; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orbits"
    ADD CONSTRAINT "idOrbit" PRIMARY KEY (id);


--
-- TOC entry 4746 (class 2606 OID 16506)
-- Name: OrbitUsuario idOrbitUsuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrbitUsuario"
    ADD CONSTRAINT "idOrbitUsuario" PRIMARY KEY (id);


--
-- TOC entry 4742 (class 2606 OID 16508)
-- Name: EmailCodes tokenUnique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EmailCodes"
    ADD CONSTRAINT "tokenUnique" UNIQUE (token);


--
-- TOC entry 4724 (class 1259 OID 16509)
-- Name: fki_idCarpetaCarpetasDestinos; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idCarpetaCarpetasDestinos" ON public."CarpetasDestinos" USING btree ("idCarpeta");


--
-- TOC entry 4728 (class 1259 OID 16510)
-- Name: fki_idCarpetaCarpetasUsuarios; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idCarpetaCarpetasUsuarios" ON public."CarpetasUsuarios" USING btree ("idCarpeta");


--
-- TOC entry 4720 (class 1259 OID 16511)
-- Name: fki_idCarpetaDestinos; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idCarpetaDestinos" ON public."Carpetas" USING btree ("idCarpetaDestinos");


--
-- TOC entry 4721 (class 1259 OID 16512)
-- Name: fki_idCarpetaUsuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idCarpetaUsuario" ON public."Carpetas" USING btree ("idCarpetaUsuario");


--
-- TOC entry 4732 (class 1259 OID 16513)
-- Name: fki_idCarpetasDestinos; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idCarpetasDestinos" ON public."Destinos" USING btree ("idCarpetasDestinos");


--
-- TOC entry 4736 (class 1259 OID 16514)
-- Name: fki_idDestino; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idDestino" ON public."DestinosUsuarios" USING btree ("idDestino");


--
-- TOC entry 4725 (class 1259 OID 16515)
-- Name: fki_idDestinoCarpetasDestinos; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idDestinoCarpetasDestinos" ON public."CarpetasDestinos" USING btree ("idDestino");


--
-- TOC entry 4751 (class 1259 OID 16516)
-- Name: fki_idDestinos; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idDestinos" ON public."Usuarios" USING btree ("idDestinos");


--
-- TOC entry 4733 (class 1259 OID 16517)
-- Name: fki_idDestinosUsuarios; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idDestinosUsuarios" ON public."Destinos" USING btree ("idDestinosUsuarios");


--
-- TOC entry 4743 (class 1259 OID 16518)
-- Name: fki_idOrbit; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idOrbit" ON public."OrbitUsuario" USING btree ("idOrbit");


--
-- TOC entry 4744 (class 1259 OID 16519)
-- Name: fki_idUsuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idUsuario" ON public."OrbitUsuario" USING btree ("idUsuario");


--
-- TOC entry 4729 (class 1259 OID 16520)
-- Name: fki_idUsuarioCarpetasUsuarios; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_idUsuarioCarpetasUsuarios" ON public."CarpetasUsuarios" USING btree ("idUsuario");


--
-- TOC entry 4757 (class 2606 OID 16521)
-- Name: CarpetasDestinos idCarpetaCarpetasDestinos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasDestinos"
    ADD CONSTRAINT "idCarpetaCarpetasDestinos" FOREIGN KEY ("idCarpeta") REFERENCES public."Carpetas"(id) NOT VALID;


--
-- TOC entry 4759 (class 2606 OID 16526)
-- Name: CarpetasUsuarios idCarpetaCarpetasUsuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasUsuarios"
    ADD CONSTRAINT "idCarpetaCarpetasUsuarios" FOREIGN KEY ("idCarpeta") REFERENCES public."Carpetas"(id) NOT VALID;


--
-- TOC entry 4754 (class 2606 OID 16531)
-- Name: Carpetas idCarpetaDestinos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carpetas"
    ADD CONSTRAINT "idCarpetaDestinos" FOREIGN KEY ("idCarpetaDestinos") REFERENCES public."CarpetasDestinos"(id) NOT VALID;


--
-- TOC entry 4755 (class 2606 OID 16536)
-- Name: Carpetas idCarpetaUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carpetas"
    ADD CONSTRAINT "idCarpetaUsuario" FOREIGN KEY ("idCarpetaUsuario") REFERENCES public."CarpetasUsuarios"(id) NOT VALID;


--
-- TOC entry 4761 (class 2606 OID 16541)
-- Name: Destinos idCarpetasDestinos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Destinos"
    ADD CONSTRAINT "idCarpetasDestinos" FOREIGN KEY ("idCarpetasDestinos") REFERENCES public."CarpetasDestinos"(id) NOT VALID;


--
-- TOC entry 4763 (class 2606 OID 16546)
-- Name: DestinosUsuarios idDestino; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DestinosUsuarios"
    ADD CONSTRAINT "idDestino" FOREIGN KEY ("idDestino") REFERENCES public."Destinos"(id) NOT VALID;


--
-- TOC entry 4758 (class 2606 OID 16551)
-- Name: CarpetasDestinos idDestinoCarpetasDestinos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasDestinos"
    ADD CONSTRAINT "idDestinoCarpetasDestinos" FOREIGN KEY ("idDestino") REFERENCES public."Destinos"(id) NOT VALID;


--
-- TOC entry 4762 (class 2606 OID 16556)
-- Name: Destinos idDestinosUsuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Destinos"
    ADD CONSTRAINT "idDestinosUsuarios" FOREIGN KEY ("idDestinosUsuarios") REFERENCES public."DestinosUsuarios"(id) NOT VALID;


--
-- TOC entry 4766 (class 2606 OID 16561)
-- Name: OrbitUsuario idOrbit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrbitUsuario"
    ADD CONSTRAINT "idOrbit" FOREIGN KEY ("idOrbit") REFERENCES public."Orbits"(id) NOT VALID;


--
-- TOC entry 4767 (class 2606 OID 16566)
-- Name: OrbitUsuario idUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrbitUsuario"
    ADD CONSTRAINT "idUsuario" FOREIGN KEY ("idUsuario") REFERENCES public."Usuarios"(id) NOT VALID;


--
-- TOC entry 4756 (class 2606 OID 16571)
-- Name: Carpetas idUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carpetas"
    ADD CONSTRAINT "idUsuario" FOREIGN KEY ("idUsuario") REFERENCES public."Usuarios"(id) NOT VALID;


--
-- TOC entry 4764 (class 2606 OID 16576)
-- Name: DestinosUsuarios idUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DestinosUsuarios"
    ADD CONSTRAINT "idUsuario" FOREIGN KEY ("idUsuario") REFERENCES public."Usuarios"(id) NOT VALID;


--
-- TOC entry 4765 (class 2606 OID 16581)
-- Name: EmailCodes idUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EmailCodes"
    ADD CONSTRAINT "idUsuario" FOREIGN KEY ("idUsuario") REFERENCES public."Usuarios"(id);


--
-- TOC entry 4760 (class 2606 OID 16586)
-- Name: CarpetasUsuarios idUsuarioCarpetasUsuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarpetasUsuarios"
    ADD CONSTRAINT "idUsuarioCarpetasUsuarios" FOREIGN KEY ("idUsuario") REFERENCES public."Usuarios"(id) NOT VALID;


--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2025-11-27 10:38:24

--
-- PostgreSQL database dump complete
--

