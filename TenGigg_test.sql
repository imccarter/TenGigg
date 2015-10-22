--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: categories; Type: TABLE; Schema: public; Owner: ivanmccarter; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE categories OWNER TO ivanmccarter;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: ivanmccarter
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO ivanmccarter;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivanmccarter
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: ivanmccarter; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    author_id integer NOT NULL,
    body text NOT NULL,
    commentable_id integer NOT NULL,
    commentable_type character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE comments OWNER TO ivanmccarter;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: ivanmccarter
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_id_seq OWNER TO ivanmccarter;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivanmccarter
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: ivanmccarter; Tablespace: 
--

CREATE TABLE images (
    id integer NOT NULL,
    url character varying NOT NULL,
    thumbnail_url character varying NOT NULL,
    width integer,
    height integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE images OWNER TO ivanmccarter;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: ivanmccarter
--

CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE images_id_seq OWNER TO ivanmccarter;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivanmccarter
--

ALTER SEQUENCE images_id_seq OWNED BY images.id;


--
-- Name: post_categories; Type: TABLE; Schema: public; Owner: ivanmccarter; Tablespace: 
--

CREATE TABLE post_categories (
    id integer NOT NULL,
    post_id integer NOT NULL,
    category_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE post_categories OWNER TO ivanmccarter;

--
-- Name: post_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: ivanmccarter
--

CREATE SEQUENCE post_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE post_categories_id_seq OWNER TO ivanmccarter;

--
-- Name: post_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivanmccarter
--

ALTER SEQUENCE post_categories_id_seq OWNED BY post_categories.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: ivanmccarter; Tablespace: 
--

CREATE TABLE posts (
    id integer NOT NULL,
    author_id integer NOT NULL,
    title character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_id integer
);


ALTER TABLE posts OWNER TO ivanmccarter;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: ivanmccarter
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE posts_id_seq OWNER TO ivanmccarter;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivanmccarter
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: ivanmccarter; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO ivanmccarter;

--
-- Name: users; Type: TABLE; Schema: public; Owner: ivanmccarter; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying NOT NULL,
    password_digest character varying NOT NULL,
    session_token character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_id integer
);


ALTER TABLE users OWNER TO ivanmccarter;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: ivanmccarter
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO ivanmccarter;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivanmccarter
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: votes; Type: TABLE; Schema: public; Owner: ivanmccarter; Tablespace: 
--

CREATE TABLE votes (
    id integer NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL,
    vote_score integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE votes OWNER TO ivanmccarter;

--
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: ivanmccarter
--

CREATE SEQUENCE votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE votes_id_seq OWNER TO ivanmccarter;

--
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivanmccarter
--

ALTER SEQUENCE votes_id_seq OWNED BY votes.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ivanmccarter
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ivanmccarter
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ivanmccarter
--

ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ivanmccarter
--

ALTER TABLE ONLY post_categories ALTER COLUMN id SET DEFAULT nextval('post_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ivanmccarter
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ivanmccarter
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ivanmccarter
--

ALTER TABLE ONLY votes ALTER COLUMN id SET DEFAULT nextval('votes_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: ivanmccarter
--

COPY categories (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivanmccarter
--

SELECT pg_catalog.setval('categories_id_seq', 1, false);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: ivanmccarter
--

COPY comments (id, author_id, body, commentable_id, commentable_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivanmccarter
--

SELECT pg_catalog.setval('comments_id_seq', 1, false);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: ivanmccarter
--

COPY images (id, url, thumbnail_url, width, height, created_at, updated_at) FROM stdin;
\.


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivanmccarter
--

SELECT pg_catalog.setval('images_id_seq', 1, false);


--
-- Data for Name: post_categories; Type: TABLE DATA; Schema: public; Owner: ivanmccarter
--

COPY post_categories (id, post_id, category_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: post_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivanmccarter
--

SELECT pg_catalog.setval('post_categories_id_seq', 1, false);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: ivanmccarter
--

COPY posts (id, author_id, title, created_at, updated_at, image_id) FROM stdin;
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivanmccarter
--

SELECT pg_catalog.setval('posts_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: ivanmccarter
--

COPY schema_migrations (version) FROM stdin;
20150821181258
20150811033456
20150811164649
20150811172909
20150813000015
20150813173915
20150814225537
20150820162505
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ivanmccarter
--

COPY users (id, username, password_digest, session_token, created_at, updated_at, image_id) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivanmccarter
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: ivanmccarter
--

COPY votes (id, user_id, post_id, vote_score, created_at, updated_at) FROM stdin;
\.


--
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivanmccarter
--

SELECT pg_catalog.setval('votes_id_seq', 1, false);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: ivanmccarter; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: ivanmccarter; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: images_pkey; Type: CONSTRAINT; Schema: public; Owner: ivanmccarter; Tablespace: 
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: post_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: ivanmccarter; Tablespace: 
--

ALTER TABLE ONLY post_categories
    ADD CONSTRAINT post_categories_pkey PRIMARY KEY (id);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: public; Owner: ivanmccarter; Tablespace: 
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: ivanmccarter; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: votes_pkey; Type: CONSTRAINT; Schema: public; Owner: ivanmccarter; Tablespace: 
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- Name: index_categories_on_name; Type: INDEX; Schema: public; Owner: ivanmccarter; Tablespace: 
--

CREATE UNIQUE INDEX index_categories_on_name ON categories USING btree (name);


--
-- Name: index_comments_on_author_id; Type: INDEX; Schema: public; Owner: ivanmccarter; Tablespace: 
--

CREATE INDEX index_comments_on_author_id ON comments USING btree (author_id);


--
-- Name: index_comments_on_commentable_id; Type: INDEX; Schema: public; Owner: ivanmccarter; Tablespace: 
--

CREATE INDEX index_comments_on_commentable_id ON comments USING btree (commentable_id);


--
-- Name: index_post_categories_on_category_id; Type: INDEX; Schema: public; Owner: ivanmccarter; Tablespace: 
--

CREATE INDEX index_post_categories_on_category_id ON post_categories USING btree (category_id);


--
-- Name: index_post_categories_on_post_id; Type: INDEX; Schema: public; Owner: ivanmccarter; Tablespace: 
--

CREATE INDEX index_post_categories_on_post_id ON post_categories USING btree (post_id);


--
-- Name: index_post_categories_on_post_id_and_category_id; Type: INDEX; Schema: public; Owner: ivanmccarter; Tablespace: 
--

CREATE INDEX index_post_categories_on_post_id_and_category_id ON post_categories USING btree (post_id, category_id);


--
-- Name: index_posts_on_author_id; Type: INDEX; Schema: public; Owner: ivanmccarter; Tablespace: 
--

CREATE INDEX index_posts_on_author_id ON posts USING btree (author_id);


--
-- Name: index_posts_on_image_id; Type: INDEX; Schema: public; Owner: ivanmccarter; Tablespace: 
--

CREATE INDEX index_posts_on_image_id ON posts USING btree (image_id);


--
-- Name: index_users_on_image_id; Type: INDEX; Schema: public; Owner: ivanmccarter; Tablespace: 
--

CREATE INDEX index_users_on_image_id ON users USING btree (image_id);


--
-- Name: index_users_on_username; Type: INDEX; Schema: public; Owner: ivanmccarter; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_username ON users USING btree (username);


--
-- Name: index_votes_on_user_id_and_post_id; Type: INDEX; Schema: public; Owner: ivanmccarter; Tablespace: 
--

CREATE UNIQUE INDEX index_votes_on_user_id_and_post_id ON votes USING btree (user_id, post_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: ivanmccarter; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: ivanmccarter
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM ivanmccarter;
GRANT ALL ON SCHEMA public TO ivanmccarter;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

