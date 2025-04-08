--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17 (Homebrew)
-- Dumped by pg_dump version 14.17 (Homebrew)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cache; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO david;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO david;

--
-- Name: cars; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.cars (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cars OWNER TO david;

--
-- Name: cars_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.cars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cars_id_seq OWNER TO david;

--
-- Name: cars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.cars_id_seq OWNED BY public.cars.id;


--
-- Name: configuration_options; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.configuration_options (
    id bigint NOT NULL,
    configuration_id bigint NOT NULL,
    option_id bigint NOT NULL
);


ALTER TABLE public.configuration_options OWNER TO david;

--
-- Name: configuration_options_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.configuration_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configuration_options_id_seq OWNER TO david;

--
-- Name: configuration_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.configuration_options_id_seq OWNED BY public.configuration_options.id;


--
-- Name: configurations; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.configurations (
    id bigint NOT NULL,
    car_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.configurations OWNER TO david;

--
-- Name: configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configurations_id_seq OWNER TO david;

--
-- Name: configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.configurations_id_seq OWNED BY public.configurations.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO david;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO david;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO david;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO david;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO david;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO david;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO david;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: options; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.options (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.options OWNER TO david;

--
-- Name: options_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.options_id_seq OWNER TO david;

--
-- Name: options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.options_id_seq OWNED BY public.options.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO david;

--
-- Name: prices; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.prices (
    id bigint NOT NULL,
    configuration_id bigint NOT NULL,
    price numeric(10,2) NOT NULL,
    start_date date NOT NULL,
    end_date date,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.prices OWNER TO david;

--
-- Name: prices_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prices_id_seq OWNER TO david;

--
-- Name: prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.prices_id_seq OWNED BY public.prices.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO david;

--
-- Name: users; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO david;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO david;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: cars id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.cars ALTER COLUMN id SET DEFAULT nextval('public.cars_id_seq'::regclass);


--
-- Name: configuration_options id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.configuration_options ALTER COLUMN id SET DEFAULT nextval('public.configuration_options_id_seq'::regclass);


--
-- Name: configurations id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.configurations ALTER COLUMN id SET DEFAULT nextval('public.configurations_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: options id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.options ALTER COLUMN id SET DEFAULT nextval('public.options_id_seq'::regclass);


--
-- Name: prices id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.prices ALTER COLUMN id SET DEFAULT nextval('public.prices_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: david
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: david
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: david
--

COPY public.cars (id, name, created_at, updated_at) FROM stdin;
1	Toyota Camry	2025-04-08 03:24:54	2025-04-08 03:24:54
\.


--
-- Data for Name: configuration_options; Type: TABLE DATA; Schema: public; Owner: david
--

COPY public.configuration_options (id, configuration_id, option_id) FROM stdin;
1	1	1
2	1	2
\.


--
-- Data for Name: configurations; Type: TABLE DATA; Schema: public; Owner: david
--

COPY public.configurations (id, car_id, name, created_at, updated_at) FROM stdin;
1	1	Comfort	2025-04-08 03:24:54	2025-04-08 03:24:54
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: david
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: david
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: david
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: david
--

COPY public.migrations (id, migration, batch) FROM stdin;
8	0001_01_01_000000_create_users_table	1
9	0001_01_01_000001_create_cache_table	1
10	0001_01_01_000002_create_jobs_table	1
11	2025_04_08_030003_create_cars_table	1
12	2025_04_08_030004_create_options_table	1
13	2025_04_08_030008_create_configurations_table	1
14	2025_04_08_030009_create_configuration_options_table	1
15	2025_04_08_030010_create_prices_table	1
\.


--
-- Data for Name: options; Type: TABLE DATA; Schema: public; Owner: david
--

COPY public.options (id, name, created_at, updated_at) FROM stdin;
1	Climate Control	2025-04-08 03:24:54	2025-04-08 03:24:54
2	Leather Seats	2025-04-08 03:24:54	2025-04-08 03:24:54
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: david
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: prices; Type: TABLE DATA; Schema: public; Owner: david
--

COPY public.prices (id, configuration_id, price, start_date, end_date, created_at, updated_at) FROM stdin;
1	1	35000.00	2025-04-03	\N	2025-04-08 03:24:55	2025-04-08 03:24:55
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: david
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
Cd2KqqhW1SPjpCwV29Ukzz0N1ikNJQCQk529F3hm	\N	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoia2xYbEtocDZCb3dIaTZYakdwOFdYZzdoMEFiNDNIYUFkRnNlUkUzMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1744083466
vcuMgMNNyzExvjr2rufe97Q98B1Bf104v2xy7Zrr	\N	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiak1YZzhnbEhmN2dmZXVhVEtCWm9KeHFQZE1ucVB3ak1MQWttYVlNcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1744107883
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: david
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
\.


--
-- Name: cars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('public.cars_id_seq', 1, true);


--
-- Name: configuration_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('public.configuration_options_id_seq', 2, true);


--
-- Name: configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('public.configurations_id_seq', 1, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('public.migrations_id_seq', 15, true);


--
-- Name: options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('public.options_id_seq', 2, true);


--
-- Name: prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('public.prices_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: cars cars_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);


--
-- Name: configuration_options configuration_options_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.configuration_options
    ADD CONSTRAINT configuration_options_pkey PRIMARY KEY (id);


--
-- Name: configurations configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.configurations
    ADD CONSTRAINT configurations_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: options options_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: prices prices_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: configuration_options configuration_options_configuration_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.configuration_options
    ADD CONSTRAINT configuration_options_configuration_id_foreign FOREIGN KEY (configuration_id) REFERENCES public.configurations(id) ON DELETE CASCADE;


--
-- Name: configuration_options configuration_options_option_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.configuration_options
    ADD CONSTRAINT configuration_options_option_id_foreign FOREIGN KEY (option_id) REFERENCES public.options(id) ON DELETE CASCADE;


--
-- Name: configurations configurations_car_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.configurations
    ADD CONSTRAINT configurations_car_id_foreign FOREIGN KEY (car_id) REFERENCES public.cars(id) ON DELETE CASCADE;


--
-- Name: prices prices_configuration_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_configuration_id_foreign FOREIGN KEY (configuration_id) REFERENCES public.configurations(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

