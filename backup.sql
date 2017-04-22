--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO django;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO django;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO django;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO django;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO django;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO django;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO django;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO django;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO django;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO django;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO django;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO django;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO django;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO django;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO django;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO django;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO django;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO django;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO django;

--
-- Name: pos_employee; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE pos_employee (
    id integer NOT NULL,
    store_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE pos_employee OWNER TO django;

--
-- Name: pos_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE pos_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pos_employee_id_seq OWNER TO django;

--
-- Name: pos_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE pos_employee_id_seq OWNED BY pos_employee.id;


--
-- Name: pos_order; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE pos_order (
    id integer NOT NULL,
    store_id integer NOT NULL,
    date_hour timestamp with time zone NOT NULL
);


ALTER TABLE pos_order OWNER TO django;

--
-- Name: pos_order_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE pos_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pos_order_id_seq OWNER TO django;

--
-- Name: pos_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE pos_order_id_seq OWNED BY pos_order.id;


--
-- Name: pos_orderproduct; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE pos_orderproduct (
    id integer NOT NULL,
    quantity integer NOT NULL,
    delivery_date timestamp with time zone NOT NULL,
    expiration_date timestamp with time zone NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE pos_orderproduct OWNER TO django;

--
-- Name: pos_orderproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE pos_orderproduct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pos_orderproduct_id_seq OWNER TO django;

--
-- Name: pos_orderproduct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE pos_orderproduct_id_seq OWNED BY pos_orderproduct.id;


--
-- Name: pos_product; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE pos_product (
    id integer NOT NULL,
    barcode integer NOT NULL,
    name character varying(80) NOT NULL,
    store_price numeric(20,2) NOT NULL,
    supplier_price numeric(20,2) NOT NULL,
    image character varying(100),
    type character varying(80) NOT NULL,
    supplier_id integer NOT NULL
);


ALTER TABLE pos_product OWNER TO django;

--
-- Name: pos_product_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE pos_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pos_product_id_seq OWNER TO django;

--
-- Name: pos_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE pos_product_id_seq OWNED BY pos_product.id;


--
-- Name: pos_store; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE pos_store (
    id integer NOT NULL,
    location character varying(80) NOT NULL,
    address text NOT NULL,
    coordinate_x numeric(40,20) NOT NULL,
    coordinate_y numeric(40,20) NOT NULL
);


ALTER TABLE pos_store OWNER TO django;

--
-- Name: pos_store_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE pos_store_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pos_store_id_seq OWNER TO django;

--
-- Name: pos_store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE pos_store_id_seq OWNED BY pos_store.id;


--
-- Name: pos_storeproduct; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE pos_storeproduct (
    id integer NOT NULL,
    product_id integer NOT NULL,
    store_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE pos_storeproduct OWNER TO django;

--
-- Name: pos_storeproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE pos_storeproduct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pos_storeproduct_id_seq OWNER TO django;

--
-- Name: pos_storeproduct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE pos_storeproduct_id_seq OWNED BY pos_storeproduct.id;


--
-- Name: pos_supplier; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE pos_supplier (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE pos_supplier OWNER TO django;

--
-- Name: pos_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE pos_supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pos_supplier_id_seq OWNER TO django;

--
-- Name: pos_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE pos_supplier_id_seq OWNED BY pos_supplier.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_employee ALTER COLUMN id SET DEFAULT nextval('pos_employee_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_order ALTER COLUMN id SET DEFAULT nextval('pos_order_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_orderproduct ALTER COLUMN id SET DEFAULT nextval('pos_orderproduct_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_product ALTER COLUMN id SET DEFAULT nextval('pos_product_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_store ALTER COLUMN id SET DEFAULT nextval('pos_store_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_storeproduct ALTER COLUMN id SET DEFAULT nextval('pos_storeproduct_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_supplier ALTER COLUMN id SET DEFAULT nextval('pos_supplier_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add user	2	add_user
5	Can change user	2	change_user
6	Can delete user	2	delete_user
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add product	7	add_product
20	Can change product	7	change_product
21	Can delete product	7	delete_product
22	Can add supplier	8	add_supplier
23	Can change supplier	8	change_supplier
24	Can delete supplier	8	delete_supplier
25	Can add order product	9	add_orderproduct
26	Can change order product	9	change_orderproduct
27	Can delete order product	9	delete_orderproduct
28	Can add employee	10	add_employee
29	Can change employee	10	change_employee
30	Can delete employee	10	delete_employee
31	Can add store	11	add_store
32	Can change store	11	change_store
33	Can delete store	11	delete_store
34	Can add store product	12	add_storeproduct
35	Can change store product	12	change_storeproduct
36	Can delete store product	12	delete_storeproduct
37	Can add order	13	add_order
38	Can change order	13	change_order
39	Can delete order	13	delete_order
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_permission_id_seq', 39, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$36000$vtGcmm7DqLWV$CNo1Kt4jJ9Ke81ElD6Kv9/kDlxuyeQz2Di07Q9V+/VU=	2017-04-22 12:36:32.906128-05	t	admin			admin@pos.com	t	t	2017-04-22 12:36:13.087699-05
2	pbkdf2_sha256$36000$1DekhLsToTu5$CwhllnEyB2sKtS95p5lQKD/3dEcuNfH89n2htHdhX7M=	\N	f	gerente1	Gerente	1		t	t	2017-04-22 12:38:00-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: django
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-04-22 12:38:00.719126-05	2	gerente1	1	[{"added": {}}]	2	1
2	2017-04-22 12:38:26.199995-05	2	gerente1	2	[{"changed": {"fields": ["first_name", "last_name", "is_staff"]}}]	2	1
3	2017-04-22 12:39:33.828656-05	1	Reforma 23	1	[{"added": {}}]	11	1
4	2017-04-22 12:39:36.861397-05	1	Gerente 1	1	[{"added": {}}]	10	1
5	2017-04-22 12:39:56.780187-05	1	Order object	1	[{"added": {}}]	13	1
6	2017-04-22 13:02:53.021508-05	1	Supplier object	1	[{"added": {}}]	8	1
7	2017-04-22 13:03:41.748511-05	1	Product object	1	[{"added": {}}]	7	1
8	2017-04-22 13:04:11.616634-05	1	OrderProduct object	1	[{"added": {}}]	9	1
9	2017-04-22 13:08:21.363164-05	1	OrderProduct object	2	[]	9	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 9, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: django
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	user
3	auth	permission
4	auth	group
5	contenttypes	contenttype
6	sessions	session
7	pos	product
8	pos	supplier
9	pos	orderproduct
10	pos	employee
11	pos	store
12	pos	storeproduct
13	pos	order
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('django_content_type_id_seq', 13, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: django
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-04-22 12:34:23.102997-05
2	auth	0001_initial	2017-04-22 12:34:23.381794-05
3	admin	0001_initial	2017-04-22 12:34:23.465127-05
4	admin	0002_logentry_remove_auto_add	2017-04-22 12:34:23.503179-05
5	contenttypes	0002_remove_content_type_name	2017-04-22 12:34:23.555377-05
6	auth	0002_alter_permission_name_max_length	2017-04-22 12:34:23.579568-05
7	auth	0003_alter_user_email_max_length	2017-04-22 12:34:23.611312-05
8	auth	0004_alter_user_username_opts	2017-04-22 12:34:23.636207-05
9	auth	0005_alter_user_last_login_null	2017-04-22 12:34:23.666834-05
10	auth	0006_require_contenttypes_0002	2017-04-22 12:34:23.675752-05
11	auth	0007_alter_validators_add_error_messages	2017-04-22 12:34:23.702432-05
12	auth	0008_alter_user_username_max_length	2017-04-22 12:34:23.750257-05
13	pos	0001_initial	2017-04-22 12:34:23.861787-05
14	pos	0002_auto_20170422_0352	2017-04-22 12:34:23.888355-05
15	pos	0003_auto_20170422_0732	2017-04-22 12:34:24.166844-05
16	pos	0004_auto_20170422_1657	2017-04-22 12:34:24.194124-05
17	pos	0005_auto_20170422_1729	2017-04-22 12:34:24.341451-05
18	sessions	0001_initial	2017-04-22 12:34:24.405692-05
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('django_migrations_id_seq', 18, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: django
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
ha4rqypwmfrg6boirl8yjkgkoxgxx30s	MDJmMTgzNjlhNDllMWEyNWU1NDEyMTU1YzM2NjM5MzFlMGQ4Mzk4Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2E4OGFiNTBmYzEwZjM2MDg5MGE4NDczMjE3ZWUzMTA4ZGMyZjBjMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-06 12:36:32.915877-05
\.


--
-- Data for Name: pos_employee; Type: TABLE DATA; Schema: public; Owner: django
--

COPY pos_employee (id, store_id, user_id) FROM stdin;
1	1	2
\.


--
-- Name: pos_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('pos_employee_id_seq', 1, true);


--
-- Data for Name: pos_order; Type: TABLE DATA; Schema: public; Owner: django
--

COPY pos_order (id, store_id, date_hour) FROM stdin;
1	1	2017-04-22 12:39:53-05
2	1	2017-04-22 12:39:53-05
\.


--
-- Name: pos_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('pos_order_id_seq', 2, true);


--
-- Data for Name: pos_orderproduct; Type: TABLE DATA; Schema: public; Owner: django
--

COPY pos_orderproduct (id, quantity, delivery_date, expiration_date, order_id, product_id) FROM stdin;
1	5	2017-04-22 13:03:50-05	2017-04-30 13:04:05-05	1	1
\.


--
-- Name: pos_orderproduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('pos_orderproduct_id_seq', 1, true);


--
-- Data for Name: pos_product; Type: TABLE DATA; Schema: public; Owner: django
--

COPY pos_product (id, barcode, name, store_price, supplier_price, image, type, supplier_id) FROM stdin;
1	12345678	Leche Alpura	10.00	6.00	product_12345678	Bebida	1
\.


--
-- Name: pos_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('pos_product_id_seq', 1, true);


--
-- Data for Name: pos_store; Type: TABLE DATA; Schema: public; Owner: django
--

COPY pos_store (id, location, address, coordinate_x, coordinate_y) FROM stdin;
1	Reforma 23	Reforma 23, cp klsfjioqahwegjknwekg	19.99999990000000000000	93.99999999000000000000
\.


--
-- Name: pos_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('pos_store_id_seq', 1, true);


--
-- Data for Name: pos_storeproduct; Type: TABLE DATA; Schema: public; Owner: django
--

COPY pos_storeproduct (id, product_id, store_id, quantity) FROM stdin;
4	1	1	1
\.


--
-- Name: pos_storeproduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('pos_storeproduct_id_seq', 4, true);


--
-- Data for Name: pos_supplier; Type: TABLE DATA; Schema: public; Owner: django
--

COPY pos_supplier (id, name) FROM stdin;
1	Alpura
\.


--
-- Name: pos_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('pos_supplier_id_seq', 1, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: pos_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_employee
    ADD CONSTRAINT pos_employee_pkey PRIMARY KEY (id);


--
-- Name: pos_employee_user_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_employee
    ADD CONSTRAINT pos_employee_user_id_key UNIQUE (user_id);


--
-- Name: pos_order_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_order
    ADD CONSTRAINT pos_order_pkey PRIMARY KEY (id);


--
-- Name: pos_orderproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_orderproduct
    ADD CONSTRAINT pos_orderproduct_pkey PRIMARY KEY (id);


--
-- Name: pos_product_barcode_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_product
    ADD CONSTRAINT pos_product_barcode_key UNIQUE (barcode);


--
-- Name: pos_product_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_product
    ADD CONSTRAINT pos_product_pkey PRIMARY KEY (id);


--
-- Name: pos_store_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_store
    ADD CONSTRAINT pos_store_pkey PRIMARY KEY (id);


--
-- Name: pos_storeproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_storeproduct
    ADD CONSTRAINT pos_storeproduct_pkey PRIMARY KEY (id);


--
-- Name: pos_supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_supplier
    ADD CONSTRAINT pos_supplier_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: pos_employee_store_id_0f3cf191; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX pos_employee_store_id_0f3cf191 ON pos_employee USING btree (store_id);


--
-- Name: pos_order_store_id_1e40f363; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX pos_order_store_id_1e40f363 ON pos_order USING btree (store_id);


--
-- Name: pos_orderproduct_order_id_cbb7ec57; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX pos_orderproduct_order_id_cbb7ec57 ON pos_orderproduct USING btree (order_id);


--
-- Name: pos_orderproduct_product_id_e2f6069a; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX pos_orderproduct_product_id_e2f6069a ON pos_orderproduct USING btree (product_id);


--
-- Name: pos_product_supplier_id_4474ce5f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX pos_product_supplier_id_4474ce5f ON pos_product USING btree (supplier_id);


--
-- Name: pos_storeproduct_product_id_83811eaa; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX pos_storeproduct_product_id_83811eaa ON pos_storeproduct USING btree (product_id);


--
-- Name: pos_storeproduct_store_id_2223b02e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX pos_storeproduct_store_id_2223b02e ON pos_storeproduct USING btree (store_id);


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pos_employee_store_id_0f3cf191_fk_pos_store_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_employee
    ADD CONSTRAINT pos_employee_store_id_0f3cf191_fk_pos_store_id FOREIGN KEY (store_id) REFERENCES pos_store(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pos_employee_user_id_ff769009_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_employee
    ADD CONSTRAINT pos_employee_user_id_ff769009_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pos_order_store_id_1e40f363_fk_pos_store_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_order
    ADD CONSTRAINT pos_order_store_id_1e40f363_fk_pos_store_id FOREIGN KEY (store_id) REFERENCES pos_store(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pos_orderproduct_order_id_cbb7ec57_fk_pos_order_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_orderproduct
    ADD CONSTRAINT pos_orderproduct_order_id_cbb7ec57_fk_pos_order_id FOREIGN KEY (order_id) REFERENCES pos_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pos_orderproduct_product_id_e2f6069a_fk_pos_product_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_orderproduct
    ADD CONSTRAINT pos_orderproduct_product_id_e2f6069a_fk_pos_product_id FOREIGN KEY (product_id) REFERENCES pos_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pos_product_supplier_id_4474ce5f_fk_pos_supplier_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_product
    ADD CONSTRAINT pos_product_supplier_id_4474ce5f_fk_pos_supplier_id FOREIGN KEY (supplier_id) REFERENCES pos_supplier(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pos_storeproduct_product_id_83811eaa_fk_pos_product_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_storeproduct
    ADD CONSTRAINT pos_storeproduct_product_id_83811eaa_fk_pos_product_id FOREIGN KEY (product_id) REFERENCES pos_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pos_storeproduct_store_id_2223b02e_fk_pos_store_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY pos_storeproduct
    ADD CONSTRAINT pos_storeproduct_store_id_2223b02e_fk_pos_store_id FOREIGN KEY (store_id) REFERENCES pos_store(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

