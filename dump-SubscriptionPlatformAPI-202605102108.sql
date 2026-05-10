--
-- PostgreSQL database cluster dump
--

-- Started on 2026-05-10 21:08:18

\restrict nQpu6WKPGC9z8UA97dIKqrsjYE7NUKhiaY3NVbjhTiEIQe0nCcMhDdJbke54btK

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








\unrestrict nQpu6WKPGC9z8UA97dIKqrsjYE7NUKhiaY3NVbjhTiEIQe0nCcMhDdJbke54btK

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict CdwEuORUrxbLRevAsP9BnwE9ADQYu7s9qZVPBUy8Mwi5lhKfZe1fGV7VMbSMJw6

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-05-10 21:08:18

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

-- Completed on 2026-05-10 21:08:19

--
-- PostgreSQL database dump complete
--

\unrestrict CdwEuORUrxbLRevAsP9BnwE9ADQYu7s9qZVPBUy8Mwi5lhKfZe1fGV7VMbSMJw6

--
-- Database "SubscriptionPlatformAPI" dump
--

--
-- PostgreSQL database dump
--

\restrict Fcct3uKqRk458nkrIzfeG8QbI8483Son3tHBmk7haxKS3C2m1t0D8opQpiYRfmq

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-05-10 21:08:19

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
-- TOC entry 4983 (class 1262 OID 18879)
-- Name: SubscriptionPlatformAPI; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "SubscriptionPlatformAPI" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "SubscriptionPlatformAPI" OWNER TO postgres;

\unrestrict Fcct3uKqRk458nkrIzfeG8QbI8483Son3tHBmk7haxKS3C2m1t0D8opQpiYRfmq
\connect "SubscriptionPlatformAPI"
\restrict Fcct3uKqRk458nkrIzfeG8QbI8483Son3tHBmk7haxKS3C2m1t0D8opQpiYRfmq

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
-- TOC entry 228 (class 1259 OID 19151)
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id integer NOT NULL,
    user_id integer NOT NULL,
    subscription_id integer,
    type character varying(50) NOT NULL,
    title character varying(255) NOT NULL,
    message text NOT NULL,
    is_read boolean DEFAULT false NOT NULL,
    email_sent boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    read_at timestamp without time zone
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 19150)
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_id_seq OWNER TO postgres;

--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 227
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- TOC entry 226 (class 1259 OID 19121)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    user_id integer NOT NULL,
    subscription_id integer,
    amount numeric(18,2) NOT NULL,
    currency character varying(10) DEFAULT 'USD'::character varying NOT NULL,
    status character varying(50) DEFAULT 'pending'::character varying NOT NULL,
    payment_date timestamp without time zone,
    stripe_payment_id character varying(255),
    invoice_url text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 19120)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_id_seq OWNER TO postgres;

--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 225
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- TOC entry 222 (class 1259 OID 19069)
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    category character varying(50) NOT NULL,
    price_monthly numeric(10,2) NOT NULL,
    price_yearly numeric(10,2),
    features jsonb DEFAULT '[]'::jsonb NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.services OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 19068)
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_id_seq OWNER TO postgres;

--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 221
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- TOC entry 224 (class 1259 OID 19089)
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriptions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    service_id integer NOT NULL,
    status character varying(50) DEFAULT 'active'::character varying NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    auto_renew boolean DEFAULT true NOT NULL,
    stripe_subscription_id character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.subscriptions OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 19088)
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subscriptions_id_seq OWNER TO postgres;

--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 223
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- TOC entry 220 (class 1259 OID 19047)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    full_name character varying(255) NOT NULL,
    status character varying(50) DEFAULT 'active'::character varying NOT NULL,
    role character varying(50) DEFAULT 'User'::character varying NOT NULL,
    password_hash character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 19046)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4793 (class 2604 OID 19154)
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- TOC entry 4789 (class 2604 OID 19124)
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- TOC entry 4780 (class 2604 OID 19072)
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- TOC entry 4784 (class 2604 OID 19092)
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- TOC entry 4775 (class 2604 OID 19050)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4977 (class 0 OID 19151)
-- Dependencies: 228
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, user_id, subscription_id, type, title, message, is_read, email_sent, created_at, read_at) FROM stdin;
1	3	1	service_update	Обновление: CloudBox Storage	Добавили более быстрый поиск и улучшили совместный доступ по ссылке.	t	f	2026-05-04 18:25:05.628051	\N
2	4	2	service_update	Обновление: Pulse Monitoring	Появились новые шаблоны дашбордов и группировка алертов.	f	f	2026-05-03 18:25:05.713113	\N
3	5	3	payment_failed	Платёж ожидает подтверждения	Платёж находится в статусе pending. Завершите оплату для активации подписки.	f	f	2026-04-29 18:25:05.737658	\N
4	6	4	subscription_expiring	Подписка истекла	Ваша подписка Support Desk Pro истекла. Продлите её, чтобы продолжить пользоваться сервисом.	f	f	2026-05-06 18:25:05.761024	\N
5	3	9	service_update	Обновление: CloudBox Storage	Добавили более быстрый поиск и улучшили совместный доступ по ссылке.	t	f	2026-04-25 18:32:48.672377	\N
6	4	10	service_update	Обновление: Pulse Monitoring	Появились новые шаблоны дашбордов и группировка алертов.	f	f	2026-04-26 18:32:48.760974	\N
7	5	11	payment_failed	Платёж ожидает подтверждения	Платёж находится в статусе pending. Завершите оплату для активации подписки.	f	f	2026-04-30 18:32:48.785726	\N
8	6	12	subscription_expiring	Подписка истекла	Ваша подписка Support Desk Pro истекла. Продлите её, чтобы продолжить пользоваться сервисом.	f	f	2026-04-30 18:32:48.80491	\N
9	3	17	service_update	Обновление: CloudBox Storage	Добавили более быстрый поиск и улучшили совместный доступ по ссылке.	t	f	2026-05-05 18:50:26.794666	\N
10	4	18	service_update	Обновление: Pulse Monitoring	Появились новые шаблоны дашбордов и группировка алертов.	f	f	2026-05-01 18:50:26.849406	\N
11	5	19	payment_failed	Платёж ожидает подтверждения	Платёж находится в статусе pending. Завершите оплату для активации подписки.	f	f	2026-05-04 18:50:26.862171	\N
12	6	20	subscription_expiring	Подписка истекла	Ваша подписка Support Desk Pro истекла. Продлите её, чтобы продолжить пользоваться сервисом.	f	f	2026-04-21 18:50:26.873989	\N
\.


--
-- TOC entry 4975 (class 0 OID 19121)
-- Dependencies: 226
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, user_id, subscription_id, amount, currency, status, payment_date, stripe_payment_id, invoice_url, created_at) FROM stdin;
1	3	1	12.99	USD	completed	2026-04-27 18:25:05.015778	demo_pay_eda7ee447	https://example.com/invoice/demo	2026-05-07 18:25:05.399223
2	3	6	21.99	USD	completed	2026-05-02 18:25:05.015778	demo_pay_891a08ca6	https://example.com/invoice/demo	2026-05-07 18:25:05.50554
3	4	2	24.99	USD	completed	2026-04-17 18:25:05.015778	demo_pay_f947ee027	https://example.com/invoice/demo	2026-05-07 18:25:05.52114
4	4	7	14.99	USD	completed	2026-04-22 18:25:05.015778	demo_pay_541be4a36	https://example.com/invoice/demo	2026-05-07 18:25:05.542138
5	5	3	29.99	USD	pending	\N	demo_pay_4df4b55e3	https://example.com/invoice/demo	2026-05-07 18:25:05.560655
6	6	4	19.99	USD	completed	2026-03-07 18:25:05.015778	demo_pay_b48da2812	https://example.com/invoice/demo	2026-05-07 18:25:05.574915
7	7	5	34.99	USD	refunded	2026-04-12 18:25:05.015778	demo_pay_81e03b217	https://example.com/invoice/demo	2026-05-07 18:25:05.590102
8	3	9	12.99	USD	completed	2026-04-27 18:32:47.848832	demo_pay_5917ffc2f	https://example.com/invoice/demo	2026-05-07 18:32:48.469897
9	3	14	21.99	USD	completed	2026-05-02 18:32:47.848832	demo_pay_d01abdd0a	https://example.com/invoice/demo	2026-05-07 18:32:48.554837
10	4	10	24.99	USD	completed	2026-04-17 18:32:47.848832	demo_pay_1317a6e18	https://example.com/invoice/demo	2026-05-07 18:32:48.568134
11	4	15	14.99	USD	completed	2026-04-22 18:32:47.848832	demo_pay_d3b288d6c	https://example.com/invoice/demo	2026-05-07 18:32:48.5791
12	5	11	29.99	USD	pending	\N	demo_pay_16b41d39e	https://example.com/invoice/demo	2026-05-07 18:32:48.595502
13	6	12	19.99	USD	completed	2026-03-07 18:32:47.848832	demo_pay_c3ba20ea0	https://example.com/invoice/demo	2026-05-07 18:32:48.614828
14	7	13	34.99	USD	refunded	2026-04-12 18:32:47.848832	demo_pay_98df89558	https://example.com/invoice/demo	2026-05-07 18:32:48.634947
15	3	17	12.99	USD	completed	2026-04-27 18:50:26.071933	demo_pay_87455b2c5	https://example.com/invoice/demo	2026-05-07 18:50:26.609544
16	3	22	21.99	USD	completed	2026-05-02 18:50:26.071933	demo_pay_6b4c0d29a	https://example.com/invoice/demo	2026-05-07 18:50:26.69662
17	4	18	24.99	USD	completed	2026-04-17 18:50:26.071933	demo_pay_22d722eb4	https://example.com/invoice/demo	2026-05-07 18:50:26.715286
18	4	23	14.99	USD	completed	2026-04-22 18:50:26.071933	demo_pay_71237ad62	https://example.com/invoice/demo	2026-05-07 18:50:26.727824
19	5	19	29.99	USD	pending	\N	demo_pay_d34d3116c	https://example.com/invoice/demo	2026-05-07 18:50:26.742061
20	6	20	19.99	USD	completed	2026-03-07 18:50:26.071933	demo_pay_d2ac554a5	https://example.com/invoice/demo	2026-05-07 18:50:26.75474
21	7	21	34.99	USD	refunded	2026-04-12 18:50:26.071933	demo_pay_e68af45e4	https://example.com/invoice/demo	2026-05-07 18:50:26.767725
\.


--
-- TOC entry 4971 (class 0 OID 19069)
-- Dependencies: 222
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, name, description, category, price_monthly, price_yearly, features, created_at) FROM stdin;
1	CloudBox Storage	Надёжное облачное хранилище для команд и проектов: версионирование, быстрый поиск, доступ 24/7.	Cloud	12.99	129.00	["1 TB хранилища", "История версий 30 дней", "Совместный доступ по ссылке", "SLA 99.9%", "Поддержка по email"]	2026-05-07 18:25:03.060173
2	Pipeline CI/CD	Автоматизация сборки и деплоя: пайплайны, окружения, артефакты, интеграции с Git.	DevOps	29.99	299.00	["50 минут CI в день", "Деплой в 2 окружения", "Docker registry (20 GB)", "Webhook интеграции", "История релизов"]	2026-05-07 18:25:03.629221
3	Pulse Monitoring	Мониторинг инфраструктуры и приложений: метрики, алерты, дашборды, статус‑страницы.	Monitoring	24.99	249.00	["До 25 хостов", "Алерты (email/telegram)", "Дашборды и теги", "Статус‑страница", "Хранение метрик 30 дней"]	2026-05-07 18:25:03.653529
4	Support Desk Pro	Сервис‑деск для поддержки клиентов: тикеты, SLA, шаблоны ответов, база знаний.	Support	19.99	199.00	["Неограниченные тикеты", "SLA и приоритеты", "Шаблоны ответов", "База знаний", "Экспорт отчётов"]	2026-05-07 18:25:03.669367
5	Insight Analytics	Продуктовая аналитика: события, воронки, когортный анализ, retention, A/B тесты.	Analytics	34.99	349.00	["До 1M событий/мес", "Воронки и когорты", "Retention отчёты", "A/B тестирование", "Экспорт в CSV"]	2026-05-07 18:25:03.683902
6	MailSender	Транзакционные и маркетинговые письма: шаблоны, домены, статистика доставляемости.	Marketing	14.99	149.00	["До 20k писем/мес", "SMTP + API", "Шаблоны писем", "Статистика и UTM", "SPF/DKIM подсказки"]	2026-05-07 18:25:03.699599
7	DB Backup Vault	Автоматические бэкапы PostgreSQL/MySQL: расписание, шифрование, быстрый restore.	Security	17.99	179.00	["Ежедневные бэкапы", "Шифрование AES‑256", "Хранение 14 дней", "Restore в 1 клик", "Webhook уведомления"]	2026-05-07 18:25:03.713196
8	API Gateway Plus	API‑шлюз: лимиты, ключи, логирование, маршрутизация, базовая защита от злоупотреблений.	API	21.99	219.00	["API Keys", "Rate limiting", "Логи запросов", "Маршрутизация", "IP allow/deny"]	2026-05-07 18:25:03.729678
\.


--
-- TOC entry 4973 (class 0 OID 19089)
-- Dependencies: 224
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriptions (id, user_id, service_id, status, start_date, end_date, auto_renew, stripe_subscription_id, created_at, updated_at) FROM stdin;
1	3	1	active	2026-04-27 18:25:05.015778	2026-06-07 18:25:05.015778	t	demo_sub_60fa6a0f4	2026-05-07 18:25:05.058012	2026-05-07 18:25:05.058112
2	4	3	active	2026-04-17 18:25:05.015778	2026-06-07 18:25:05.015778	t	demo_sub_a273ef2ac	2026-05-07 18:25:05.205506	2026-05-07 18:25:05.205506
3	5	2	pending	2026-05-06 18:25:05.015778	2026-06-07 18:25:05.015778	t	demo_sub_9557c3045	2026-05-07 18:25:05.221397	2026-05-07 18:25:05.221397
4	6	4	expired	2026-03-07 18:25:05.015778	2026-04-07 18:25:05.015778	f	demo_sub_fe80e7d84	2026-05-07 18:25:05.237015	2026-05-07 18:25:05.237015
5	7	5	canceled	2026-04-07 18:25:05.015778	2026-05-17 18:25:05.015778	f	demo_sub_3e9a9de4a	2026-05-07 18:25:05.258805	2026-05-07 18:25:05.258806
6	3	8	active	2026-05-02 18:25:05.015778	2026-06-07 18:25:05.015778	t	demo_sub_27ee30c03	2026-05-07 18:25:05.279859	2026-05-07 18:25:05.27986
7	4	6	active	2026-04-22 18:25:05.015778	2026-06-07 18:25:05.015778	t	demo_sub_b2b452736	2026-05-07 18:25:05.303317	2026-05-07 18:25:05.303318
8	5	7	active	2026-04-30 18:25:05.015778	2026-06-07 18:25:05.015778	t	demo_sub_9eed34224	2026-05-07 18:25:05.327736	2026-05-07 18:25:05.327736
9	3	1	active	2026-04-27 18:32:47.848832	2026-06-07 18:32:47.848832	t	demo_sub_05c10ee05	2026-05-07 18:32:47.919847	2026-05-07 18:32:47.91998
10	4	3	active	2026-04-17 18:32:47.848832	2026-06-07 18:32:47.848832	t	demo_sub_2b72f7d1e	2026-05-07 18:32:48.353412	2026-05-07 18:32:48.353412
11	5	2	pending	2026-05-06 18:32:47.848832	2026-06-07 18:32:47.848832	t	demo_sub_52745b572	2026-05-07 18:32:48.3695	2026-05-07 18:32:48.3695
12	6	4	expired	2026-03-07 18:32:47.848832	2026-04-07 18:32:47.848832	f	demo_sub_6bc713204	2026-05-07 18:32:48.381737	2026-05-07 18:32:48.381737
13	7	5	canceled	2026-04-07 18:32:47.848832	2026-05-17 18:32:47.848832	f	demo_sub_2b6b5328a	2026-05-07 18:32:48.3958	2026-05-07 18:32:48.3958
14	3	8	active	2026-05-02 18:32:47.848832	2026-06-07 18:32:47.848832	t	demo_sub_d25488f51	2026-05-07 18:32:48.407751	2026-05-07 18:32:48.407751
15	4	6	active	2026-04-22 18:32:47.848832	2026-06-07 18:32:47.848832	t	demo_sub_1a4c744c6	2026-05-07 18:32:48.420247	2026-05-07 18:32:48.420247
16	5	7	active	2026-04-30 18:32:47.848832	2026-06-07 18:32:47.848832	t	demo_sub_71dc59a9a	2026-05-07 18:32:48.43265	2026-05-07 18:32:48.43265
17	3	1	active	2026-04-27 18:50:26.071933	2026-06-07 18:50:26.071933	t	demo_sub_430fe8bd5	2026-05-07 18:50:26.098319	2026-05-07 18:50:26.098385
18	4	3	active	2026-04-17 18:50:26.071933	2026-06-07 18:50:26.071933	t	demo_sub_ae47fa2c1	2026-05-07 18:50:26.483133	2026-05-07 18:50:26.483133
19	5	2	pending	2026-05-06 18:50:26.071933	2026-06-07 18:50:26.071933	t	demo_sub_83aaacfbf	2026-05-07 18:50:26.501533	2026-05-07 18:50:26.501533
20	6	4	expired	2026-03-07 18:50:26.071933	2026-04-07 18:50:26.071933	f	demo_sub_44708d556	2026-05-07 18:50:26.514603	2026-05-07 18:50:26.514603
21	7	5	canceled	2026-04-07 18:50:26.071933	2026-05-17 18:50:26.071933	f	demo_sub_bb96b6a4d	2026-05-07 18:50:26.526194	2026-05-07 18:50:26.526194
22	3	8	active	2026-05-02 18:50:26.071933	2026-06-07 18:50:26.071933	t	demo_sub_8abf5921b	2026-05-07 18:50:26.537666	2026-05-07 18:50:26.537667
23	4	6	active	2026-04-22 18:50:26.071933	2026-06-07 18:50:26.071933	t	demo_sub_a983b91cf	2026-05-07 18:50:26.55302	2026-05-07 18:50:26.55302
24	5	7	active	2026-04-30 18:50:26.071933	2026-06-07 18:50:26.071933	t	demo_sub_04dbb39de	2026-05-07 18:50:26.568199	2026-05-07 18:50:26.5682
\.


--
-- TOC entry 4969 (class 0 OID 19047)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, full_name, status, role, password_hash, created_at, updated_at) FROM stdin;
1	admin@subscription.local	System Administrator	active	Admin	AQAAAAIAAYagAAAAEFGu/KF23v0HfKzcp8h9JiTn4XCjLlosY1lthS70sv3uD0X5zuDty+u+gKQ4TOMJOw==	2026-05-07 18:18:43.155652	2026-05-07 18:18:43.155756
2	user@subscription.local	Default User	active	User	AQAAAAIAAYagAAAAEAH77ZtCeIhmRJPmSzgjpnJqoYAjEFmcgQomehunP648WdcWQOs6G8kKh3hwELBZiQ==	2026-05-07 18:18:43.925661	2026-05-07 18:18:43.925661
3	ivan.petrov@demo.local	Иван Петров	active	User	AQAAAAIAAYagAAAAEAb/BqsaFeAAMChU2ZPFJUoiScruUge++0a+O4jBiQj9McjF9pVLctza/5A2zf1duA==	2026-05-07 18:25:03.753394	2026-05-07 18:25:03.753544
4	anna.smirnova@demo.local	Анна Смирнова	active	User	AQAAAAIAAYagAAAAEC4QlHKGSZbEUp9lYLko4QFYpQXHuI+Ac7VjGVUY54cOSLlwdLTtP4xZrLPN83CA3g==	2026-05-07 18:25:04.01079	2026-05-07 18:25:04.01079
5	dmitry.kozlov@demo.local	Дмитрий Козлов	active	User	AQAAAAIAAYagAAAAEJgUt7Et/We4KKsBGYu7XUO0yATB7wOvtXmzT2YiyNwDXZNSoJanGOS1gDryYFRIhg==	2026-05-07 18:25:04.274716	2026-05-07 18:25:04.274716
6	olga.ivanova@demo.local	Ольга Иванова	active	User	AQAAAAIAAYagAAAAEA+mB4T+w61g/8EFI5amcgL9Perls0/rvyw9JVUsJdscPnMGDnwo+pqpA07OWbNkAg==	2026-05-07 18:25:04.483021	2026-05-07 18:25:04.483022
7	sergey.volkov@demo.local	Сергей Волков	active	User	AQAAAAIAAYagAAAAEFoIKZ1/GuPy4rLW3yO3NrUOhRqCK1MTguT7ng01aBGReRmPNk51j1fePw9pmAGFqA==	2026-05-07 18:25:04.802745	2026-05-07 18:25:04.802745
\.


--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 227
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 12, true);


--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 225
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 21, true);


--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 221
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 8, true);


--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 223
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 24, true);


--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- TOC entry 4814 (class 2606 OID 19169)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 4810 (class 2606 OID 19137)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 4802 (class 2606 OID 19086)
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- TOC entry 4806 (class 2606 OID 19107)
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- TOC entry 4799 (class 2606 OID 19066)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4811 (class 1259 OID 19181)
-- Name: ix_notifications_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_notifications_type ON public.notifications USING btree (type);


--
-- TOC entry 4812 (class 1259 OID 19180)
-- Name: ix_notifications_user_read; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_notifications_user_read ON public.notifications USING btree (user_id, is_read);


--
-- TOC entry 4807 (class 1259 OID 19148)
-- Name: ix_payments_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_payments_status ON public.payments USING btree (status);


--
-- TOC entry 4808 (class 1259 OID 19149)
-- Name: ix_payments_stripe_payment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_payments_stripe_payment_id ON public.payments USING btree (stripe_payment_id);


--
-- TOC entry 4800 (class 1259 OID 19087)
-- Name: ix_services_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_services_category ON public.services USING btree (category);


--
-- TOC entry 4803 (class 1259 OID 19118)
-- Name: ix_subscriptions_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_subscriptions_status ON public.subscriptions USING btree (status);


--
-- TOC entry 4804 (class 1259 OID 19119)
-- Name: ix_subscriptions_stripe_subscription_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_subscriptions_stripe_subscription_id ON public.subscriptions USING btree (stripe_subscription_id);


--
-- TOC entry 4797 (class 1259 OID 19067)
-- Name: ix_users_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_users_email ON public.users USING btree (email);


--
-- TOC entry 4819 (class 2606 OID 19175)
-- Name: notifications fk_notifications_subscriptions_subscription_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk_notifications_subscriptions_subscription_id FOREIGN KEY (subscription_id) REFERENCES public.subscriptions(id) ON DELETE SET NULL;


--
-- TOC entry 4820 (class 2606 OID 19170)
-- Name: notifications fk_notifications_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk_notifications_users_user_id FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4817 (class 2606 OID 19143)
-- Name: payments fk_payments_subscriptions_subscription_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT fk_payments_subscriptions_subscription_id FOREIGN KEY (subscription_id) REFERENCES public.subscriptions(id) ON DELETE SET NULL;


--
-- TOC entry 4818 (class 2606 OID 19138)
-- Name: payments fk_payments_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT fk_payments_users_user_id FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4815 (class 2606 OID 19113)
-- Name: subscriptions fk_subscriptions_services_service_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT fk_subscriptions_services_service_id FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- TOC entry 4816 (class 2606 OID 19108)
-- Name: subscriptions fk_subscriptions_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT fk_subscriptions_users_user_id FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2026-05-10 21:08:19

--
-- PostgreSQL database dump complete
--

\unrestrict Fcct3uKqRk458nkrIzfeG8QbI8483Son3tHBmk7haxKS3C2m1t0D8opQpiYRfmq

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict 0YU4mwWuTfXVv3oOfCKgPb7icXaaU1P8m4NjikdAyiZlTSsG1HjxDKIRKF01FyE

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-05-10 21:08:19

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
-- TOC entry 8 (class 2615 OID 18358)
-- Name: audit; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA audit;


ALTER SCHEMA audit OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 18357)
-- Name: billing; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA billing;


ALTER SCHEMA billing OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 18356)
-- Name: plans; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA plans;


ALTER SCHEMA plans OWNER TO postgres;

--
-- TOC entry 9 (class 2615 OID 18614)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 5077 (class 0 OID 0)
-- Dependencies: 9
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- TOC entry 5 (class 2615 OID 18355)
-- Name: users; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA users;


ALTER SCHEMA users OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 246 (class 1259 OID 18597)
-- Name: audit_logs; Type: TABLE; Schema: audit; Owner: postgres
--

CREATE TABLE audit.audit_logs (
    id integer NOT NULL,
    user_id integer NOT NULL,
    action character varying(100) NOT NULL,
    target_table character varying(50) NOT NULL,
    target_id bigint NOT NULL,
    changed_by character varying(100),
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE audit.audit_logs OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 18596)
-- Name: audit_logs_id_seq; Type: SEQUENCE; Schema: audit; Owner: postgres
--

CREATE SEQUENCE audit.audit_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE audit.audit_logs_id_seq OWNER TO postgres;

--
-- TOC entry 5079 (class 0 OID 0)
-- Dependencies: 245
-- Name: audit_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: audit; Owner: postgres
--

ALTER SEQUENCE audit.audit_logs_id_seq OWNED BY audit.audit_logs.id;


--
-- TOC entry 242 (class 1259 OID 18560)
-- Name: discounts; Type: TABLE; Schema: billing; Owner: postgres
--

CREATE TABLE billing.discounts (
    id integer NOT NULL,
    code character varying(50) NOT NULL,
    description text,
    type character varying(20) NOT NULL,
    value numeric(12,2) NOT NULL,
    max_uses integer DEFAULT 0,
    used_count integer DEFAULT 0,
    valid_from date,
    valid_to date,
    is_active boolean DEFAULT true NOT NULL,
    CONSTRAINT discounts_type_check CHECK (((type)::text = ANY ((ARRAY['Percentage'::character varying, 'FixedAmount'::character varying, 'FreeTrial'::character varying])::text[])))
);


ALTER TABLE billing.discounts OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 18559)
-- Name: discounts_id_seq; Type: SEQUENCE; Schema: billing; Owner: postgres
--

CREATE SEQUENCE billing.discounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE billing.discounts_id_seq OWNER TO postgres;

--
-- TOC entry 5080 (class 0 OID 0)
-- Dependencies: 241
-- Name: discounts_id_seq; Type: SEQUENCE OWNED BY; Schema: billing; Owner: postgres
--

ALTER SEQUENCE billing.discounts_id_seq OWNED BY billing.discounts.id;


--
-- TOC entry 236 (class 1259 OID 18502)
-- Name: invoice_items; Type: TABLE; Schema: billing; Owner: postgres
--

CREATE TABLE billing.invoice_items (
    id integer NOT NULL,
    invoice_id integer NOT NULL,
    description text NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    unit_price numeric(12,2) NOT NULL,
    tax_rate numeric(5,2) DEFAULT 0,
    tax_amount numeric(12,2) DEFAULT 0,
    amount numeric(12,2) DEFAULT 0 NOT NULL
);


ALTER TABLE billing.invoice_items OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 18501)
-- Name: invoice_items_id_seq; Type: SEQUENCE; Schema: billing; Owner: postgres
--

CREATE SEQUENCE billing.invoice_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE billing.invoice_items_id_seq OWNER TO postgres;

--
-- TOC entry 5081 (class 0 OID 0)
-- Dependencies: 235
-- Name: invoice_items_id_seq; Type: SEQUENCE OWNED BY; Schema: billing; Owner: postgres
--

ALTER SEQUENCE billing.invoice_items_id_seq OWNED BY billing.invoice_items.id;


--
-- TOC entry 234 (class 1259 OID 18472)
-- Name: invoices; Type: TABLE; Schema: billing; Owner: postgres
--

CREATE TABLE billing.invoices (
    id integer NOT NULL,
    subscription_id integer NOT NULL,
    invoice_number character varying(30) NOT NULL,
    issue_date date DEFAULT CURRENT_DATE NOT NULL,
    due_date date NOT NULL,
    total_amount numeric(12,2) DEFAULT 0 NOT NULL,
    status character varying(20) NOT NULL,
    tax_amount numeric(12,2) DEFAULT 0,
    discount_amount numeric(12,2) DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT invoices_status_check CHECK (((status)::text = ANY ((ARRAY['Draft'::character varying, 'Sent'::character varying, 'Paid'::character varying, 'Overdue'::character varying, 'Cancelled'::character varying])::text[])))
);


ALTER TABLE billing.invoices OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 18471)
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: billing; Owner: postgres
--

CREATE SEQUENCE billing.invoices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE billing.invoices_id_seq OWNER TO postgres;

--
-- TOC entry 5082 (class 0 OID 0)
-- Dependencies: 233
-- Name: invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: billing; Owner: postgres
--

ALTER SEQUENCE billing.invoices_id_seq OWNED BY billing.invoices.id;


--
-- TOC entry 238 (class 1259 OID 18526)
-- Name: payment_methods; Type: TABLE; Schema: billing; Owner: postgres
--

CREATE TABLE billing.payment_methods (
    id integer NOT NULL,
    provider character varying(50) NOT NULL,
    last4 character varying(4),
    exp_month integer,
    exp_year integer,
    is_default boolean DEFAULT false
);


ALTER TABLE billing.payment_methods OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 18525)
-- Name: payment_methods_id_seq; Type: SEQUENCE; Schema: billing; Owner: postgres
--

CREATE SEQUENCE billing.payment_methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE billing.payment_methods_id_seq OWNER TO postgres;

--
-- TOC entry 5083 (class 0 OID 0)
-- Dependencies: 237
-- Name: payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: billing; Owner: postgres
--

ALTER SEQUENCE billing.payment_methods_id_seq OWNED BY billing.payment_methods.id;


--
-- TOC entry 240 (class 1259 OID 18536)
-- Name: payments; Type: TABLE; Schema: billing; Owner: postgres
--

CREATE TABLE billing.payments (
    id integer NOT NULL,
    invoice_id integer NOT NULL,
    payment_method_id integer,
    transaction_id character varying(100),
    amount numeric(12,2) NOT NULL,
    payment_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status character varying(20) NOT NULL,
    CONSTRAINT payments_status_check CHECK (((status)::text = ANY ((ARRAY['Success'::character varying, 'Failed'::character varying, 'Refunded'::character varying, 'Pending'::character varying])::text[])))
);


ALTER TABLE billing.payments OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 18535)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: billing; Owner: postgres
--

CREATE SEQUENCE billing.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE billing.payments_id_seq OWNER TO postgres;

--
-- TOC entry 5084 (class 0 OID 0)
-- Dependencies: 239
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: billing; Owner: postgres
--

ALTER SEQUENCE billing.payments_id_seq OWNED BY billing.payments.id;


--
-- TOC entry 232 (class 1259 OID 18449)
-- Name: subscription_addons; Type: TABLE; Schema: billing; Owner: postgres
--

CREATE TABLE billing.subscription_addons (
    id integer NOT NULL,
    subscription_id integer NOT NULL,
    plan_version_id integer NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    unit_price numeric(12,2) NOT NULL
);


ALTER TABLE billing.subscription_addons OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 18448)
-- Name: subscription_addons_id_seq; Type: SEQUENCE; Schema: billing; Owner: postgres
--

CREATE SEQUENCE billing.subscription_addons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE billing.subscription_addons_id_seq OWNER TO postgres;

--
-- TOC entry 5085 (class 0 OID 0)
-- Dependencies: 231
-- Name: subscription_addons_id_seq; Type: SEQUENCE OWNED BY; Schema: billing; Owner: postgres
--

ALTER SEQUENCE billing.subscription_addons_id_seq OWNED BY billing.subscription_addons.id;


--
-- TOC entry 230 (class 1259 OID 18417)
-- Name: subscriptions; Type: TABLE; Schema: billing; Owner: postgres
--

CREATE TABLE billing.subscriptions (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    plan_version_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date,
    status character varying(20) NOT NULL,
    next_billing_cycle date,
    cancellation_date date,
    proration_version_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT subscriptions_status_check CHECK (((status)::text = ANY ((ARRAY['Active'::character varying, 'Suspended'::character varying, 'Cancelled'::character varying, 'Expired'::character varying])::text[])))
);


ALTER TABLE billing.subscriptions OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 18416)
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: billing; Owner: postgres
--

CREATE SEQUENCE billing.subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE billing.subscriptions_id_seq OWNER TO postgres;

--
-- TOC entry 5086 (class 0 OID 0)
-- Dependencies: 229
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: billing; Owner: postgres
--

ALTER SEQUENCE billing.subscriptions_id_seq OWNED BY billing.subscriptions.id;


--
-- TOC entry 244 (class 1259 OID 18580)
-- Name: usage_records; Type: TABLE; Schema: billing; Owner: postgres
--

CREATE TABLE billing.usage_records (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    usage_date date NOT NULL,
    quantity numeric(12,2) NOT NULL,
    unit character varying(50)
);


ALTER TABLE billing.usage_records OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 18579)
-- Name: usage_records_id_seq; Type: SEQUENCE; Schema: billing; Owner: postgres
--

CREATE SEQUENCE billing.usage_records_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE billing.usage_records_id_seq OWNER TO postgres;

--
-- TOC entry 5087 (class 0 OID 0)
-- Dependencies: 243
-- Name: usage_records_id_seq; Type: SEQUENCE OWNED BY; Schema: billing; Owner: postgres
--

ALTER SEQUENCE billing.usage_records_id_seq OWNED BY billing.usage_records.id;


--
-- TOC entry 226 (class 1259 OID 18379)
-- Name: plan_templates; Type: TABLE; Schema: plans; Owner: postgres
--

CREATE TABLE plans.plan_templates (
    id integer NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    default_monthly_price numeric(12,2) NOT NULL,
    default_setup_price numeric(12,2) NOT NULL
);


ALTER TABLE plans.plan_templates OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18378)
-- Name: plan_templates_id_seq; Type: SEQUENCE; Schema: plans; Owner: postgres
--

CREATE SEQUENCE plans.plan_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE plans.plan_templates_id_seq OWNER TO postgres;

--
-- TOC entry 5088 (class 0 OID 0)
-- Dependencies: 225
-- Name: plan_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: plans; Owner: postgres
--

ALTER SEQUENCE plans.plan_templates_id_seq OWNED BY plans.plan_templates.id;


--
-- TOC entry 228 (class 1259 OID 18395)
-- Name: plan_versions; Type: TABLE; Schema: plans; Owner: postgres
--

CREATE TABLE plans.plan_versions (
    id integer NOT NULL,
    plan_template_id integer NOT NULL,
    version_number integer NOT NULL,
    effective_from date NOT NULL,
    effective_to date,
    monthly_price numeric(12,2) NOT NULL,
    setup_price numeric(12,2) NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE plans.plan_versions OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 18394)
-- Name: plan_versions_id_seq; Type: SEQUENCE; Schema: plans; Owner: postgres
--

CREATE SEQUENCE plans.plan_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE plans.plan_versions_id_seq OWNER TO postgres;

--
-- TOC entry 5089 (class 0 OID 0)
-- Dependencies: 227
-- Name: plan_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: plans; Owner: postgres
--

ALTER SEQUENCE plans.plan_versions_id_seq OWNED BY plans.plan_versions.id;


--
-- TOC entry 224 (class 1259 OID 18360)
-- Name: customers; Type: TABLE; Schema: users; Owner: postgres
--

CREATE TABLE users.customers (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(30),
    registration_ip inet,
    registration_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    company_name character varying(200),
    tax_id character varying(50)
);


ALTER TABLE users.customers OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18359)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: users; Owner: postgres
--

CREATE SEQUENCE users.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE users.customers_id_seq OWNER TO postgres;

--
-- TOC entry 5090 (class 0 OID 0)
-- Dependencies: 223
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: users; Owner: postgres
--

ALTER SEQUENCE users.customers_id_seq OWNED BY users.customers.id;


--
-- TOC entry 4846 (class 2604 OID 18600)
-- Name: audit_logs id; Type: DEFAULT; Schema: audit; Owner: postgres
--

ALTER TABLE ONLY audit.audit_logs ALTER COLUMN id SET DEFAULT nextval('audit.audit_logs_id_seq'::regclass);


--
-- TOC entry 4841 (class 2604 OID 18563)
-- Name: discounts id; Type: DEFAULT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.discounts ALTER COLUMN id SET DEFAULT nextval('billing.discounts_id_seq'::regclass);


--
-- TOC entry 4832 (class 2604 OID 18505)
-- Name: invoice_items id; Type: DEFAULT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.invoice_items ALTER COLUMN id SET DEFAULT nextval('billing.invoice_items_id_seq'::regclass);


--
-- TOC entry 4825 (class 2604 OID 18475)
-- Name: invoices id; Type: DEFAULT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.invoices ALTER COLUMN id SET DEFAULT nextval('billing.invoices_id_seq'::regclass);


--
-- TOC entry 4837 (class 2604 OID 18529)
-- Name: payment_methods id; Type: DEFAULT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.payment_methods ALTER COLUMN id SET DEFAULT nextval('billing.payment_methods_id_seq'::regclass);


--
-- TOC entry 4839 (class 2604 OID 18539)
-- Name: payments id; Type: DEFAULT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.payments ALTER COLUMN id SET DEFAULT nextval('billing.payments_id_seq'::regclass);


--
-- TOC entry 4823 (class 2604 OID 18452)
-- Name: subscription_addons id; Type: DEFAULT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.subscription_addons ALTER COLUMN id SET DEFAULT nextval('billing.subscription_addons_id_seq'::regclass);


--
-- TOC entry 4820 (class 2604 OID 18420)
-- Name: subscriptions id; Type: DEFAULT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.subscriptions ALTER COLUMN id SET DEFAULT nextval('billing.subscriptions_id_seq'::regclass);


--
-- TOC entry 4845 (class 2604 OID 18583)
-- Name: usage_records id; Type: DEFAULT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.usage_records ALTER COLUMN id SET DEFAULT nextval('billing.usage_records_id_seq'::regclass);


--
-- TOC entry 4817 (class 2604 OID 18382)
-- Name: plan_templates id; Type: DEFAULT; Schema: plans; Owner: postgres
--

ALTER TABLE ONLY plans.plan_templates ALTER COLUMN id SET DEFAULT nextval('plans.plan_templates_id_seq'::regclass);


--
-- TOC entry 4818 (class 2604 OID 18398)
-- Name: plan_versions id; Type: DEFAULT; Schema: plans; Owner: postgres
--

ALTER TABLE ONLY plans.plan_versions ALTER COLUMN id SET DEFAULT nextval('plans.plan_versions_id_seq'::regclass);


--
-- TOC entry 4814 (class 2604 OID 18363)
-- Name: customers id; Type: DEFAULT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.customers ALTER COLUMN id SET DEFAULT nextval('users.customers_id_seq'::regclass);


--
-- TOC entry 5071 (class 0 OID 18597)
-- Dependencies: 246
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: audit; Owner: postgres
--

COPY audit.audit_logs (id, user_id, action, target_table, target_id, changed_by, changed_at) FROM stdin;
\.


--
-- TOC entry 5067 (class 0 OID 18560)
-- Dependencies: 242
-- Data for Name: discounts; Type: TABLE DATA; Schema: billing; Owner: postgres
--

COPY billing.discounts (id, code, description, type, value, max_uses, used_count, valid_from, valid_to, is_active) FROM stdin;
\.


--
-- TOC entry 5061 (class 0 OID 18502)
-- Dependencies: 236
-- Data for Name: invoice_items; Type: TABLE DATA; Schema: billing; Owner: postgres
--

COPY billing.invoice_items (id, invoice_id, description, quantity, unit_price, tax_rate, tax_amount, amount) FROM stdin;
\.


--
-- TOC entry 5059 (class 0 OID 18472)
-- Dependencies: 234
-- Data for Name: invoices; Type: TABLE DATA; Schema: billing; Owner: postgres
--

COPY billing.invoices (id, subscription_id, invoice_number, issue_date, due_date, total_amount, status, tax_amount, discount_amount, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5063 (class 0 OID 18526)
-- Dependencies: 238
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: billing; Owner: postgres
--

COPY billing.payment_methods (id, provider, last4, exp_month, exp_year, is_default) FROM stdin;
\.


--
-- TOC entry 5065 (class 0 OID 18536)
-- Dependencies: 240
-- Data for Name: payments; Type: TABLE DATA; Schema: billing; Owner: postgres
--

COPY billing.payments (id, invoice_id, payment_method_id, transaction_id, amount, payment_date, status) FROM stdin;
\.


--
-- TOC entry 5057 (class 0 OID 18449)
-- Dependencies: 232
-- Data for Name: subscription_addons; Type: TABLE DATA; Schema: billing; Owner: postgres
--

COPY billing.subscription_addons (id, subscription_id, plan_version_id, quantity, unit_price) FROM stdin;
\.


--
-- TOC entry 5055 (class 0 OID 18417)
-- Dependencies: 230
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: billing; Owner: postgres
--

COPY billing.subscriptions (id, customer_id, plan_version_id, start_date, end_date, status, next_billing_cycle, cancellation_date, proration_version_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5069 (class 0 OID 18580)
-- Dependencies: 244
-- Data for Name: usage_records; Type: TABLE DATA; Schema: billing; Owner: postgres
--

COPY billing.usage_records (id, customer_id, usage_date, quantity, unit) FROM stdin;
\.


--
-- TOC entry 5051 (class 0 OID 18379)
-- Dependencies: 226
-- Data for Name: plan_templates; Type: TABLE DATA; Schema: plans; Owner: postgres
--

COPY plans.plan_templates (id, code, name, description, default_monthly_price, default_setup_price) FROM stdin;
\.


--
-- TOC entry 5053 (class 0 OID 18395)
-- Dependencies: 228
-- Data for Name: plan_versions; Type: TABLE DATA; Schema: plans; Owner: postgres
--

COPY plans.plan_versions (id, plan_template_id, version_number, effective_from, effective_to, monthly_price, setup_price, is_active) FROM stdin;
\.


--
-- TOC entry 5049 (class 0 OID 18360)
-- Dependencies: 224
-- Data for Name: customers; Type: TABLE DATA; Schema: users; Owner: postgres
--

COPY users.customers (id, first_name, last_name, email, phone, registration_ip, registration_date, is_active, company_name, tax_id) FROM stdin;
\.


--
-- TOC entry 5091 (class 0 OID 0)
-- Dependencies: 245
-- Name: audit_logs_id_seq; Type: SEQUENCE SET; Schema: audit; Owner: postgres
--

SELECT pg_catalog.setval('audit.audit_logs_id_seq', 1, false);


--
-- TOC entry 5092 (class 0 OID 0)
-- Dependencies: 241
-- Name: discounts_id_seq; Type: SEQUENCE SET; Schema: billing; Owner: postgres
--

SELECT pg_catalog.setval('billing.discounts_id_seq', 1, false);


--
-- TOC entry 5093 (class 0 OID 0)
-- Dependencies: 235
-- Name: invoice_items_id_seq; Type: SEQUENCE SET; Schema: billing; Owner: postgres
--

SELECT pg_catalog.setval('billing.invoice_items_id_seq', 1, false);


--
-- TOC entry 5094 (class 0 OID 0)
-- Dependencies: 233
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: billing; Owner: postgres
--

SELECT pg_catalog.setval('billing.invoices_id_seq', 1, false);


--
-- TOC entry 5095 (class 0 OID 0)
-- Dependencies: 237
-- Name: payment_methods_id_seq; Type: SEQUENCE SET; Schema: billing; Owner: postgres
--

SELECT pg_catalog.setval('billing.payment_methods_id_seq', 1, false);


--
-- TOC entry 5096 (class 0 OID 0)
-- Dependencies: 239
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: billing; Owner: postgres
--

SELECT pg_catalog.setval('billing.payments_id_seq', 1, false);


--
-- TOC entry 5097 (class 0 OID 0)
-- Dependencies: 231
-- Name: subscription_addons_id_seq; Type: SEQUENCE SET; Schema: billing; Owner: postgres
--

SELECT pg_catalog.setval('billing.subscription_addons_id_seq', 1, false);


--
-- TOC entry 5098 (class 0 OID 0)
-- Dependencies: 229
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: billing; Owner: postgres
--

SELECT pg_catalog.setval('billing.subscriptions_id_seq', 1, false);


--
-- TOC entry 5099 (class 0 OID 0)
-- Dependencies: 243
-- Name: usage_records_id_seq; Type: SEQUENCE SET; Schema: billing; Owner: postgres
--

SELECT pg_catalog.setval('billing.usage_records_id_seq', 1, false);


--
-- TOC entry 5100 (class 0 OID 0)
-- Dependencies: 225
-- Name: plan_templates_id_seq; Type: SEQUENCE SET; Schema: plans; Owner: postgres
--

SELECT pg_catalog.setval('plans.plan_templates_id_seq', 1, false);


--
-- TOC entry 5101 (class 0 OID 0)
-- Dependencies: 227
-- Name: plan_versions_id_seq; Type: SEQUENCE SET; Schema: plans; Owner: postgres
--

SELECT pg_catalog.setval('plans.plan_versions_id_seq', 1, false);


--
-- TOC entry 5102 (class 0 OID 0)
-- Dependencies: 223
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: users; Owner: postgres
--

SELECT pg_catalog.setval('users.customers_id_seq', 1, false);


--
-- TOC entry 4889 (class 2606 OID 18609)
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: audit; Owner: postgres
--

ALTER TABLE ONLY audit.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 4883 (class 2606 OID 18578)
-- Name: discounts discounts_code_key; Type: CONSTRAINT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.discounts
    ADD CONSTRAINT discounts_code_key UNIQUE (code);


--
-- TOC entry 4885 (class 2606 OID 18576)
-- Name: discounts discounts_pkey; Type: CONSTRAINT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.discounts
    ADD CONSTRAINT discounts_pkey PRIMARY KEY (id);


--
-- TOC entry 4877 (class 2606 OID 18519)
-- Name: invoice_items invoice_items_pkey; Type: CONSTRAINT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.invoice_items
    ADD CONSTRAINT invoice_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4873 (class 2606 OID 18495)
-- Name: invoices invoices_invoice_number_key; Type: CONSTRAINT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.invoices
    ADD CONSTRAINT invoices_invoice_number_key UNIQUE (invoice_number);


--
-- TOC entry 4875 (class 2606 OID 18493)
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- TOC entry 4879 (class 2606 OID 18534)
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- TOC entry 4881 (class 2606 OID 18548)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 4870 (class 2606 OID 18460)
-- Name: subscription_addons subscription_addons_pkey; Type: CONSTRAINT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.subscription_addons
    ADD CONSTRAINT subscription_addons_pkey PRIMARY KEY (id);


--
-- TOC entry 4868 (class 2606 OID 18432)
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- TOC entry 4887 (class 2606 OID 18589)
-- Name: usage_records usage_records_pkey; Type: CONSTRAINT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.usage_records
    ADD CONSTRAINT usage_records_pkey PRIMARY KEY (id);


--
-- TOC entry 4858 (class 2606 OID 18393)
-- Name: plan_templates plan_templates_code_key; Type: CONSTRAINT; Schema: plans; Owner: postgres
--

ALTER TABLE ONLY plans.plan_templates
    ADD CONSTRAINT plan_templates_code_key UNIQUE (code);


--
-- TOC entry 4860 (class 2606 OID 18391)
-- Name: plan_templates plan_templates_pkey; Type: CONSTRAINT; Schema: plans; Owner: postgres
--

ALTER TABLE ONLY plans.plan_templates
    ADD CONSTRAINT plan_templates_pkey PRIMARY KEY (id);


--
-- TOC entry 4862 (class 2606 OID 18408)
-- Name: plan_versions plan_versions_pkey; Type: CONSTRAINT; Schema: plans; Owner: postgres
--

ALTER TABLE ONLY plans.plan_versions
    ADD CONSTRAINT plan_versions_pkey PRIMARY KEY (id);


--
-- TOC entry 4864 (class 2606 OID 18410)
-- Name: plan_versions unique_version; Type: CONSTRAINT; Schema: plans; Owner: postgres
--

ALTER TABLE ONLY plans.plan_versions
    ADD CONSTRAINT unique_version UNIQUE (plan_template_id, version_number);


--
-- TOC entry 4853 (class 2606 OID 18377)
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- TOC entry 4855 (class 2606 OID 18375)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 4871 (class 1259 OID 18613)
-- Name: idx_invoices_subscription; Type: INDEX; Schema: billing; Owner: postgres
--

CREATE INDEX idx_invoices_subscription ON billing.invoices USING btree (subscription_id);


--
-- TOC entry 4865 (class 1259 OID 18611)
-- Name: idx_subscriptions_customer; Type: INDEX; Schema: billing; Owner: postgres
--

CREATE INDEX idx_subscriptions_customer ON billing.subscriptions USING btree (customer_id);


--
-- TOC entry 4866 (class 1259 OID 18612)
-- Name: idx_subscriptions_plan_version; Type: INDEX; Schema: billing; Owner: postgres
--

CREATE INDEX idx_subscriptions_plan_version ON billing.subscriptions USING btree (plan_version_id);


--
-- TOC entry 4856 (class 1259 OID 18610)
-- Name: idx_customers_email; Type: INDEX; Schema: users; Owner: postgres
--

CREATE INDEX idx_customers_email ON users.customers USING btree (email);


--
-- TOC entry 4897 (class 2606 OID 18520)
-- Name: invoice_items invoice_items_invoice_id_fkey; Type: FK CONSTRAINT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.invoice_items
    ADD CONSTRAINT invoice_items_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES billing.invoices(id) ON DELETE CASCADE;


--
-- TOC entry 4896 (class 2606 OID 18496)
-- Name: invoices invoices_subscription_id_fkey; Type: FK CONSTRAINT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.invoices
    ADD CONSTRAINT invoices_subscription_id_fkey FOREIGN KEY (subscription_id) REFERENCES billing.subscriptions(id) ON DELETE CASCADE;


--
-- TOC entry 4898 (class 2606 OID 18549)
-- Name: payments payments_invoice_id_fkey; Type: FK CONSTRAINT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.payments
    ADD CONSTRAINT payments_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES billing.invoices(id) ON DELETE CASCADE;


--
-- TOC entry 4899 (class 2606 OID 18554)
-- Name: payments payments_payment_method_id_fkey; Type: FK CONSTRAINT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.payments
    ADD CONSTRAINT payments_payment_method_id_fkey FOREIGN KEY (payment_method_id) REFERENCES billing.payment_methods(id) ON DELETE SET NULL;


--
-- TOC entry 4894 (class 2606 OID 18466)
-- Name: subscription_addons subscription_addons_plan_version_id_fkey; Type: FK CONSTRAINT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.subscription_addons
    ADD CONSTRAINT subscription_addons_plan_version_id_fkey FOREIGN KEY (plan_version_id) REFERENCES plans.plan_versions(id) ON DELETE RESTRICT;


--
-- TOC entry 4895 (class 2606 OID 18461)
-- Name: subscription_addons subscription_addons_subscription_id_fkey; Type: FK CONSTRAINT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.subscription_addons
    ADD CONSTRAINT subscription_addons_subscription_id_fkey FOREIGN KEY (subscription_id) REFERENCES billing.subscriptions(id) ON DELETE CASCADE;


--
-- TOC entry 4891 (class 2606 OID 18433)
-- Name: subscriptions subscriptions_customer_id_fkey; Type: FK CONSTRAINT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.subscriptions
    ADD CONSTRAINT subscriptions_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES users.customers(id) ON DELETE CASCADE;


--
-- TOC entry 4892 (class 2606 OID 18438)
-- Name: subscriptions subscriptions_plan_version_id_fkey; Type: FK CONSTRAINT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.subscriptions
    ADD CONSTRAINT subscriptions_plan_version_id_fkey FOREIGN KEY (plan_version_id) REFERENCES plans.plan_versions(id) ON DELETE RESTRICT;


--
-- TOC entry 4893 (class 2606 OID 18443)
-- Name: subscriptions subscriptions_proration_version_id_fkey; Type: FK CONSTRAINT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.subscriptions
    ADD CONSTRAINT subscriptions_proration_version_id_fkey FOREIGN KEY (proration_version_id) REFERENCES plans.plan_versions(id);


--
-- TOC entry 4900 (class 2606 OID 18590)
-- Name: usage_records usage_records_customer_id_fkey; Type: FK CONSTRAINT; Schema: billing; Owner: postgres
--

ALTER TABLE ONLY billing.usage_records
    ADD CONSTRAINT usage_records_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES users.customers(id) ON DELETE CASCADE;


--
-- TOC entry 4890 (class 2606 OID 18411)
-- Name: plan_versions plan_versions_plan_template_id_fkey; Type: FK CONSTRAINT; Schema: plans; Owner: postgres
--

ALTER TABLE ONLY plans.plan_versions
    ADD CONSTRAINT plan_versions_plan_template_id_fkey FOREIGN KEY (plan_template_id) REFERENCES plans.plan_templates(id) ON DELETE CASCADE;


--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 9
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2026-05-10 21:08:20

--
-- PostgreSQL database dump complete
--

\unrestrict 0YU4mwWuTfXVv3oOfCKgPb7icXaaU1P8m4NjikdAyiZlTSsG1HjxDKIRKF01FyE

--
-- Database "subscriptionplatformapi" dump
--

--
-- PostgreSQL database dump
--

\restrict jYF2rgfB2rGEvLWzB64ffM179juebJDvADlSOtoAwK0HTTI5edTstA49b9YhLV1

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-05-10 21:08:20

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
-- TOC entry 4902 (class 1262 OID 18877)
-- Name: subscriptionplatformapi; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE subscriptionplatformapi WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE subscriptionplatformapi OWNER TO postgres;

\unrestrict jYF2rgfB2rGEvLWzB64ffM179juebJDvADlSOtoAwK0HTTI5edTstA49b9YhLV1
\connect subscriptionplatformapi
\restrict jYF2rgfB2rGEvLWzB64ffM179juebJDvADlSOtoAwK0HTTI5edTstA49b9YhLV1

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

-- Completed on 2026-05-10 21:08:21

--
-- PostgreSQL database dump complete
--

\unrestrict jYF2rgfB2rGEvLWzB64ffM179juebJDvADlSOtoAwK0HTTI5edTstA49b9YhLV1

-- Completed on 2026-05-10 21:08:21

--
-- PostgreSQL database cluster dump complete
--

