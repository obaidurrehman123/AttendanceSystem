--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Homebrew)
-- Dumped by pg_dump version 14.8 (Homebrew)

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
-- Name: enum_attendance_attendance; Type: TYPE; Schema: public; Owner: ubaidurrehman
--

CREATE TYPE public.enum_attendance_attendance AS ENUM (
    'pending',
    'present',
    'absent',
    'half day',
    'full day'
);


ALTER TYPE public.enum_attendance_attendance OWNER TO ubaidurrehman;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: ubaidurrehman
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO ubaidurrehman;

--
-- Name: attendance; Type: TABLE; Schema: public; Owner: ubaidurrehman
--

CREATE TABLE public.attendance (
    id integer NOT NULL,
    "ipAddress" character varying(255) NOT NULL,
    location character varying(255) NOT NULL,
    "totalMinutes" double precision DEFAULT '0'::double precision NOT NULL,
    "userId" integer NOT NULL,
    "startTime" timestamp with time zone NOT NULL,
    "endTime" timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.attendance OWNER TO ubaidurrehman;

--
-- Name: attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: ubaidurrehman
--

CREATE SEQUENCE public.attendance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attendance_id_seq OWNER TO ubaidurrehman;

--
-- Name: attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubaidurrehman
--

ALTER SEQUENCE public.attendance_id_seq OWNED BY public.attendance.id;


--
-- Name: attendancestatus; Type: TABLE; Schema: public; Owner: ubaidurrehman
--

CREATE TABLE public.attendancestatus (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    date date NOT NULL,
    day character varying(255) NOT NULL,
    "WorkingHourPerDay" double precision DEFAULT '0'::double precision NOT NULL,
    status character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.attendancestatus OWNER TO ubaidurrehman;

--
-- Name: attendancestatus_id_seq; Type: SEQUENCE; Schema: public; Owner: ubaidurrehman
--

CREATE SEQUENCE public.attendancestatus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attendancestatus_id_seq OWNER TO ubaidurrehman;

--
-- Name: attendancestatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubaidurrehman
--

ALTER SEQUENCE public.attendancestatus_id_seq OWNED BY public.attendancestatus.id;


--
-- Name: ipaddress; Type: TABLE; Schema: public; Owner: ubaidurrehman
--

CREATE TABLE public.ipaddress (
    id integer NOT NULL,
    "ipAddress" character varying(255) NOT NULL,
    location character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.ipaddress OWNER TO ubaidurrehman;

--
-- Name: ipaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: ubaidurrehman
--

CREATE SEQUENCE public.ipaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipaddress_id_seq OWNER TO ubaidurrehman;

--
-- Name: ipaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubaidurrehman
--

ALTER SEQUENCE public.ipaddress_id_seq OWNED BY public.ipaddress.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: ubaidurrehman
--

CREATE TABLE public.permissions (
    id integer NOT NULL,
    "create" boolean DEFAULT false,
    delete boolean DEFAULT false,
    read boolean DEFAULT false,
    "userId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "canUpdate" boolean
);


ALTER TABLE public.permissions OWNER TO ubaidurrehman;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ubaidurrehman
--

CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO ubaidurrehman;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubaidurrehman
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: ubaidurrehman
--

CREATE TABLE public.products (
    id integer NOT NULL,
    "productName" character varying(255) NOT NULL,
    "productPrice" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.products OWNER TO ubaidurrehman;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: ubaidurrehman
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO ubaidurrehman;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubaidurrehman
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: ubaidurrehman
--

CREATE TABLE public.users (
    id integer NOT NULL,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    department character varying(255) NOT NULL,
    role character varying(255) NOT NULL,
    "superUser" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO ubaidurrehman;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: ubaidurrehman
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO ubaidurrehman;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubaidurrehman
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: attendance id; Type: DEFAULT; Schema: public; Owner: ubaidurrehman
--

ALTER TABLE ONLY public.attendance ALTER COLUMN id SET DEFAULT nextval('public.attendance_id_seq'::regclass);


--
-- Name: attendancestatus id; Type: DEFAULT; Schema: public; Owner: ubaidurrehman
--

ALTER TABLE ONLY public.attendancestatus ALTER COLUMN id SET DEFAULT nextval('public.attendancestatus_id_seq'::regclass);


--
-- Name: ipaddress id; Type: DEFAULT; Schema: public; Owner: ubaidurrehman
--

ALTER TABLE ONLY public.ipaddress ALTER COLUMN id SET DEFAULT nextval('public.ipaddress_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: ubaidurrehman
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: ubaidurrehman
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: ubaidurrehman
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: ubaidurrehman
--

COPY public."SequelizeMeta" (name) FROM stdin;
20230610122648-create-user.js
20230610091715-create-permissions.js
20230611132346-create-product.js
20230612163714-create-ipaddress.js
20230618080604-create-attendance-status.js
20230614063826-create-attendance.js
\.


--
-- Data for Name: attendance; Type: TABLE DATA; Schema: public; Owner: ubaidurrehman
--

COPY public.attendance (id, "ipAddress", location, "totalMinutes", "userId", "startTime", "endTime", "createdAt", "updatedAt") FROM stdin;
2	127.0.0.1	remote	4	12	2023-06-18 16:36:39.381+05	2023-06-18 16:41:06.868+05	2023-06-18 16:36:39.382+05	2023-06-18 16:41:06.874+05
3	127.0.0.1	remote	2	12	2023-06-18 16:51:16.141+05	2023-06-18 16:54:03.388+05	2023-06-18 16:51:16.142+05	2023-06-18 16:54:03.394+05
4	172.168.17.172	pf1-groundfloor	480	12	2023-06-18 16:58:12.248+05	2023-06-18 17:10:33.222+05	2023-06-18 16:58:12.25+05	2023-06-18 17:10:33.245+05
5	127.0.0.1	remote	0	12	2023-06-18 17:19:54.656+05	2023-06-18 17:19:58.015+05	2023-06-18 17:19:54.656+05	2023-06-18 17:19:58.017+05
6	127.0.0.1	remote	3	12	2023-06-18 18:18:33.043+05	2023-06-18 18:22:12.649+05	2023-06-18 18:18:33.045+05	2023-06-18 18:22:12.654+05
7	127.0.0.1	remote	0	12	2023-06-19 10:53:10.044+05	2023-06-19 10:53:15.181+05	2023-06-19 10:53:10.045+05	2023-06-19 10:53:15.185+05
8	127.0.0.1	remote	0	12	2023-06-19 14:23:45.054+05	\N	2023-06-19 14:23:45.055+05	2023-06-19 14:23:45.055+05
9	127.0.0.1	remote	0	12	2023-06-19 18:57:05.518+05	\N	2023-06-19 18:57:05.522+05	2023-06-19 18:57:05.522+05
10	127.0.0.1	remote	0	12	2023-06-20 11:42:15.793+05	2023-06-20 11:42:53.801+05	2023-06-20 11:42:15.795+05	2023-06-20 11:42:53.807+05
\.


--
-- Data for Name: attendancestatus; Type: TABLE DATA; Schema: public; Owner: ubaidurrehman
--

COPY public.attendancestatus (id, "userId", date, day, "WorkingHourPerDay", status, "createdAt", "updatedAt") FROM stdin;
1	12	2023-06-18	Sunday	8.15	present	2023-06-18 16:41:07.082+05	2023-06-18 18:22:12.777+05
2	12	2023-06-19	Monday	0	absent	2023-06-19 10:53:15.399+05	2023-06-19 10:53:15.399+05
3	12	2023-06-20	Tuesday	0	absent	2023-06-20 11:42:54.166+05	2023-06-20 11:42:54.166+05
\.


--
-- Data for Name: ipaddress; Type: TABLE DATA; Schema: public; Owner: ubaidurrehman
--

COPY public.ipaddress (id, "ipAddress", location, "createdAt", "updatedAt") FROM stdin;
1	172.16.4.110	pf1-groundfloor	2023-06-16 14:54:56.919+05	2023-06-16 14:54:56.919+05
2	172.16.4.68	pf1-groundfloor	2023-06-16 14:55:31.983+05	2023-06-16 14:55:31.983+05
3	172.16.4.18	pf1-groundfloor	2023-06-16 14:55:39.17+05	2023-06-16 14:55:39.17+05
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: ubaidurrehman
--

COPY public.permissions (id, "create", delete, read, "userId", "createdAt", "updatedAt", "canUpdate") FROM stdin;
8	t	t	t	8	2023-06-11 23:46:49.825+05	2023-06-11 23:46:49.825+05	t
9	t	t	t	9	2023-06-11 23:56:38.205+05	2023-06-12 22:54:17.907+05	f
11	t	f	t	11	2023-06-12 22:56:36.387+05	2023-06-12 22:56:36.387+05	f
12	t	f	t	12	2023-06-15 20:25:10.763+05	2023-06-15 20:25:10.763+05	f
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: ubaidurrehman
--

COPY public.products (id, "productName", "productPrice", "createdAt", "updatedAt") FROM stdin;
1	iphone16	120000000	2023-06-12 00:02:34.566+05	2023-06-12 00:26:26.11+05
3	iphone16	120000000	2023-06-12 22:54:47.76+05	2023-06-12 22:54:47.76+05
4	iphone16	120000000	2023-06-15 16:20:34.082+05	2023-06-15 16:20:34.082+05
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ubaidurrehman
--

COPY public.users (id, firstname, lastname, email, password, department, role, "superUser", "createdAt", "updatedAt") FROM stdin;
8	obaid	ur rehman	link2ubaid98@gmail.com	$2b$10$U9L69gcfflqoMfiHV3vBcuwlEzBdfqw2F9rKgRR4EV.1ol.T5BVV6	Administration	superadmin	t	2023-06-11 23:46:49.805+05	2023-06-11 23:46:49.805+05
9	ahmad	khalid awan	ahmadkhalid123@gmail.com	12345678	administration	operations head	f	2023-06-11 23:56:38.191+05	2023-06-12 22:54:17.891+05
11	ahmad	khalid awan	ahmadkhalid1235@gmail.com	$2b$10$eejwSPuAjP0FmHIKyf8SCOZLM46jcqMlLhOzBsGuWzxfoN85vdC7m	administration	operations head	f	2023-06-12 22:56:36.378+05	2023-06-12 22:56:36.378+05
12	ahmad	khalid awan	ahmadkhalid123456@gmail.com	$2b$10$xaB0BZfy/Hlud82zFQagpeCRQnsiqMQ878BXb3jzHEnduMxI9hcY6	administration	operations head	f	2023-06-15 20:25:10.739+05	2023-06-15 20:25:10.739+05
\.


--
-- Name: attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubaidurrehman
--

SELECT pg_catalog.setval('public.attendance_id_seq', 10, true);


--
-- Name: attendancestatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubaidurrehman
--

SELECT pg_catalog.setval('public.attendancestatus_id_seq', 3, true);


--
-- Name: ipaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubaidurrehman
--

SELECT pg_catalog.setval('public.ipaddress_id_seq', 3, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubaidurrehman
--

SELECT pg_catalog.setval('public.permissions_id_seq', 12, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubaidurrehman
--

SELECT pg_catalog.setval('public.products_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubaidurrehman
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: ubaidurrehman
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: attendance attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: ubaidurrehman
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_pkey PRIMARY KEY (id);


--
-- Name: attendancestatus attendancestatus_pkey; Type: CONSTRAINT; Schema: public; Owner: ubaidurrehman
--

ALTER TABLE ONLY public.attendancestatus
    ADD CONSTRAINT attendancestatus_pkey PRIMARY KEY (id);


--
-- Name: ipaddress ipaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: ubaidurrehman
--

ALTER TABLE ONLY public.ipaddress
    ADD CONSTRAINT ipaddress_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ubaidurrehman
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: ubaidurrehman
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: ubaidurrehman
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: attendance attendance_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ubaidurrehman
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT "attendance_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: attendancestatus attendancestatus_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ubaidurrehman
--

ALTER TABLE ONLY public.attendancestatus
    ADD CONSTRAINT "attendancestatus_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: permissions permissions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ubaidurrehman
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT "permissions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

