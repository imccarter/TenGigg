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
1	Funny	2015-09-10 03:40:55.036383	2015-09-10 03:40:55.036383
2	Shocking	2015-09-10 03:40:55.083333	2015-09-10 03:40:55.083333
3	Beautiful	2015-09-10 03:40:55.086991	2015-09-10 03:40:55.086991
4	Informative	2015-09-10 03:40:55.089961	2015-09-10 03:40:55.089961
5	Cute	2015-09-10 03:40:55.092928	2015-09-10 03:40:55.092928
6	Awesome	2015-09-10 03:40:55.095848	2015-09-10 03:40:55.095848
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivanmccarter
--

SELECT pg_catalog.setval('categories_id_seq', 6, true);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: ivanmccarter
--

COPY comments (id, author_id, body, commentable_id, commentable_type, created_at, updated_at) FROM stdin;
1	1	It is actually pretty cute.	1	Post	2015-09-10 03:40:55.778556	2015-09-10 03:40:55.778556
2	6	They're only cute because we've domesticated them to retain their juvenile features.	1	Post	2015-09-10 03:40:55.80969	2015-09-10 03:40:55.80969
3	7	At least you're honest. Enjoy the upvote...	2	Post	2015-09-10 03:40:55.813538	2015-09-10 03:40:55.813538
4	3	Pikachu?	3	Post	2015-09-10 03:40:55.816791	2015-09-10 03:40:55.816791
5	4	It's a tenerec, duh.	3	Post	2015-09-10 03:40:55.820142	2015-09-10 03:40:55.820142
6	7	Looks like a giant turkey. I'd eat it.	4	Post	2015-09-10 03:40:55.823353	2015-09-10 03:40:55.823353
7	7	Slooooo	5	Post	2015-09-10 03:40:55.826623	2015-09-10 03:40:55.826623
8	5	oooooooooo	5	Post	2015-09-10 03:40:55.829795	2015-09-10 03:40:55.829795
9	6	ooooooooth...	5	Post	2015-09-10 03:40:55.832946	2015-09-10 03:40:55.832946
10	5	Wait, this is from zelda, right?	7	Post	2015-09-10 03:40:55.835908	2015-09-10 03:40:55.835908
11	3	Generic offensive comment	8	Post	2015-09-10 03:40:55.838907	2015-09-10 03:40:55.838907
12	4	Generic defensive reply	8	Post	2015-09-10 03:40:55.842902	2015-09-10 03:40:55.842902
13	7	YES	9	Post	2015-09-10 03:40:55.845998	2015-09-10 03:40:55.845998
14	7	YEEEEEEEES	9	Post	2015-09-10 03:40:55.849286	2015-09-10 03:40:55.849286
15	5	Informative!	11	Post	2015-09-10 03:40:55.852645	2015-09-10 03:40:55.852645
16	1	So true.	12	Post	2015-09-10 03:40:55.855741	2015-09-10 03:40:55.855741
17	4	Gorgeous	13	Post	2015-09-10 03:40:55.858827	2015-09-10 03:40:55.858827
18	3	Pretty pretty.	13	Post	2015-09-10 03:40:55.863047	2015-09-10 03:40:55.863047
19	7	So laziness = money?	15	Post	2015-09-10 03:40:55.866441	2015-09-10 03:40:55.866441
20	2	No?	9	Post	2015-09-10 03:40:56.000189	2015-09-10 03:40:56.000189
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivanmccarter
--

SELECT pg_catalog.setval('comments_id_seq', 20, true);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: ivanmccarter
--

COPY images (id, url, thumbnail_url, width, height, created_at, updated_at) FROM stdin;
1	http://res.cloudinary.com/dwds5fsan/image/upload/w_150,h_150,c_fill/v1440028989/default_dqhmax.png	http://res.cloudinary.com/dwds5fsan/image/upload/w_75,h_75,c_fill/v1440028989/default_dqhmax.png	\N	\N	2015-09-10 03:40:55.132676	2015-09-10 03:40:55.132676
2	http://res.cloudinary.com/dwds5fsan/image/upload/w_150,h_150,c_fill/v1440453901/Cage_mvwvix.jpg	http://res.cloudinary.com/dwds5fsan/image/upload/w_75,h_75,c_fill/v1440453901/Cage_mvwvix.jpg	\N	\N	2015-09-10 03:40:55.136962	2015-09-10 03:40:55.136962
3	http://res.cloudinary.com/dwds5fsan/image/upload/w_150,h_150,c_fill/v1440453907/Keanu_khd0dl.jpg	http://res.cloudinary.com/dwds5fsan/image/upload/w_75,h_75,c_fill/v1440453907/Keanu_khd0dl.jpg	\N	\N	2015-09-10 03:40:55.139745	2015-09-10 03:40:55.139745
4	http://res.cloudinary.com/dwds5fsan/image/upload/w_150,h_150,c_fill/v1440453907/father_a2zr0d.jpg	http://res.cloudinary.com/dwds5fsan/image/upload/w_75,h_75,c_fill/v1440453907/father_a2zr0d.jpg	\N	\N	2015-09-10 03:40:55.142425	2015-09-10 03:40:55.142425
5	http://res.cloudinary.com/dwds5fsan/image/upload/w_150,h_150,c_fill/v1440453910/walrus_yvwm9h.png	http://res.cloudinary.com/dwds5fsan/image/upload/w_75,h_75,c_fill/v1440453910/walrus_yvwm9h.png	\N	\N	2015-09-10 03:40:55.145029	2015-09-10 03:40:55.145029
6	http://res.cloudinary.com/dwds5fsan/image/upload/w_150,h_150,c_fill/v1440453907/xpdefault_kqwzcv.jpg	http://res.cloudinary.com/dwds5fsan/image/upload/w_75,h_75,c_fill/v1440453907/xpdefault_kqwzcv.jpg	\N	\N	2015-09-10 03:40:55.147655	2015-09-10 03:40:55.147655
7	http://res.cloudinary.com/dwds5fsan/image/upload/w_150,h_150,c_fill/v1440453906/doge_tk6lk7.jpg	http://res.cloudinary.com/dwds5fsan/image/upload/w_75,h_75,c_fill/v1440453906/doge_tk6lk7.jpg	\N	\N	2015-09-10 03:40:55.150184	2015-09-10 03:40:55.150184
8	http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440395159/rottweiler-puppy_mgfnww.jpg	http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440395159/rottweiler-puppy_mgfnww.jpg	\N	\N	2015-09-10 03:40:55.291266	2015-09-10 03:40:55.291266
9	http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440395298/tumblr_nrzqf36AAP1ssska3o1_500_iop0i8.jpg	http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440395298/tumblr_nrzqf36AAP1ssska3o1_500_iop0i8.jpg	\N	\N	2015-09-10 03:40:55.317199	2015-09-10 03:40:55.317199
10	http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440437094/tenerec_oei8z8.jpg	http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440437094/tenerec_oei8z8.jpg	\N	\N	2015-09-10 03:40:55.320469	2015-09-10 03:40:55.320469
11	http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440436981/California_Condor_fx5cap.jpg	http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440436981/California_Condor_fx5cap.jpg	\N	\N	2015-09-10 03:40:55.323031	2015-09-10 03:40:55.323031
12	http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440437087/sloth_qlqxkd.jpg	http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440437087/sloth_qlqxkd.jpg	\N	\N	2015-09-10 03:40:55.325568	2015-09-10 03:40:55.325568
13	http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440303235/qfi42n0dzvrmuhkrg9wn.gif	http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440303235/qfi42n0dzvrmuhkrg9wn.gif	\N	\N	2015-09-10 03:40:55.327986	2015-09-10 03:40:55.327986
14	http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440437026/Force_harry_sxjeud.jpg	http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440437026/Force_harry_sxjeud.jpg	\N	\N	2015-09-10 03:40:55.330503	2015-09-10 03:40:55.330503
15	http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440436955/bad_unicorn_zmvrre.jpg	http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440436955/bad_unicorn_zmvrre.jpg	\N	\N	2015-09-10 03:40:55.332996	2015-09-10 03:40:55.332996
16	http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440453384/office_no_uhyuty.gif	http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440453384/office_no_uhyuty.gif	\N	\N	2015-09-10 03:40:55.335468	2015-09-10 03:40:55.335468
17	http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440437002/cezanne_mont_sainte-victoire_atziln.jpg	http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440437002/cezanne_mont_sainte-victoire_atziln.jpg	\N	\N	2015-09-10 03:40:55.337966	2015-09-10 03:40:55.337966
18	http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440437110/What_makes_good_infographic_h8hhtg.png	http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440437110/What_makes_good_infographic_h8hhtg.png	\N	\N	2015-09-10 03:40:55.34037	2015-09-10 03:40:55.34037
19	http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440437022/first_world_rcomvl.jpg	http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440437022/first_world_rcomvl.jpg	\N	\N	2015-09-10 03:40:55.34311	2015-09-10 03:40:55.34311
20	http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440437044/jSiBWHS6Q7efg_v1pt2e.jpg	http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440437044/jSiBWHS6Q7efg_v1pt2e.jpg	\N	\N	2015-09-10 03:40:55.346177	2015-09-10 03:40:55.346177
21	http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440437050/jxLkF3jX3lIW9_wyqnx5.jpg	http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440437050/jxLkF3jX3lIW9_wyqnx5.jpg	\N	\N	2015-09-10 03:40:55.349565	2015-09-10 03:40:55.349565
22	http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440436947/11-motivational-quotes_e8bwoo.jpg	http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440436947/11-motivational-quotes_e8bwoo.jpg	\N	\N	2015-09-10 03:40:55.3523	2015-09-10 03:40:55.3523
23	http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440437014/famousquotes_vam6z8.jpg	http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440437014/famousquotes_vam6z8.jpg	\N	\N	2015-09-10 03:40:55.3549	2015-09-10 03:40:55.3549
\.


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivanmccarter
--

SELECT pg_catalog.setval('images_id_seq', 23, true);


--
-- Data for Name: post_categories; Type: TABLE DATA; Schema: public; Owner: ivanmccarter
--

COPY post_categories (id, post_id, category_id, created_at, updated_at) FROM stdin;
1	1	5	2015-09-10 03:40:55.532719	2015-09-10 03:40:55.532719
2	2	5	2015-09-10 03:40:55.546507	2015-09-10 03:40:55.546507
3	3	5	2015-09-10 03:40:55.559404	2015-09-10 03:40:55.559404
4	3	4	2015-09-10 03:40:55.561522	2015-09-10 03:40:55.561522
5	3	2	2015-09-10 03:40:55.563438	2015-09-10 03:40:55.563438
6	4	2	2015-09-10 03:40:55.576849	2015-09-10 03:40:55.576849
7	4	4	2015-09-10 03:40:55.578906	2015-09-10 03:40:55.578906
8	4	6	2015-09-10 03:40:55.580789	2015-09-10 03:40:55.580789
9	5	1	2015-09-10 03:40:55.593513	2015-09-10 03:40:55.593513
10	5	5	2015-09-10 03:40:55.595539	2015-09-10 03:40:55.595539
11	5	6	2015-09-10 03:40:55.597372	2015-09-10 03:40:55.597372
12	6	1	2015-09-10 03:40:55.609178	2015-09-10 03:40:55.609178
13	6	5	2015-09-10 03:40:55.611121	2015-09-10 03:40:55.611121
14	7	1	2015-09-10 03:40:55.622325	2015-09-10 03:40:55.622325
15	7	2	2015-09-10 03:40:55.624232	2015-09-10 03:40:55.624232
16	8	3	2015-09-10 03:40:55.635222	2015-09-10 03:40:55.635222
17	8	6	2015-09-10 03:40:55.63715	2015-09-10 03:40:55.63715
18	9	1	2015-09-10 03:40:55.649088	2015-09-10 03:40:55.649088
19	9	2	2015-09-10 03:40:55.650995	2015-09-10 03:40:55.650995
20	10	3	2015-09-10 03:40:55.660845	2015-09-10 03:40:55.660845
21	11	2	2015-09-10 03:40:55.672173	2015-09-10 03:40:55.672173
22	11	4	2015-09-10 03:40:55.674042	2015-09-10 03:40:55.674042
23	12	1	2015-09-10 03:40:55.683881	2015-09-10 03:40:55.683881
24	13	3	2015-09-10 03:40:55.694464	2015-09-10 03:40:55.694464
25	13	6	2015-09-10 03:40:55.696461	2015-09-10 03:40:55.696461
26	14	3	2015-09-10 03:40:55.707454	2015-09-10 03:40:55.707454
27	14	6	2015-09-10 03:40:55.709486	2015-09-10 03:40:55.709486
28	15	4	2015-09-10 03:40:55.720863	2015-09-10 03:40:55.720863
29	15	6	2015-09-10 03:40:55.722825	2015-09-10 03:40:55.722825
30	16	1	2015-09-10 03:40:55.734077	2015-09-10 03:40:55.734077
31	16	4	2015-09-10 03:40:55.736107	2015-09-10 03:40:55.736107
\.


--
-- Name: post_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivanmccarter
--

SELECT pg_catalog.setval('post_categories_id_seq', 31, true);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: ivanmccarter
--

COPY posts (id, author_id, title, created_at, updated_at, image_id) FROM stdin;
1	1	Here's an adorable puppy you can stare at so you don't have to think about the triviality of your contribution to society	2015-09-10 03:40:55.511467	2015-09-10 03:40:55.511467	8
2	4	Let's all just upvote this photo of a kitten that I just googled so I can sleep easy knowing that I have plenty of internet points	2015-09-10 03:40:55.544283	2015-09-10 03:40:55.544283	9
3	4	This animal's uniqueness is only enhanced by the dearth of any real wildlife in my immediate vicinity!	2015-09-10 03:40:55.55711	2015-09-10 03:40:55.55711	10
4	4	Raising awareness is a crucial part of any conservation effort	2015-09-10 03:40:55.574637	2015-09-10 03:40:55.574637	11
5	5	Charismatic megafauna always get the upvotes.	2015-09-10 03:40:55.591401	2015-09-10 03:40:55.591401	12
6	6	My studies confirm that users desire short loops of silent low-quality video featuring animals acting silly.	2015-09-10 03:40:55.606956	2015-09-10 03:40:55.606956	13
7	7	This joke features references to media that this userbase is fond of.	2015-09-10 03:40:55.620239	2015-09-10 03:40:55.620239	14
8	4	Please support your internet community's artists!	2015-09-10 03:40:55.63308	2015-09-10 03:40:55.63308	15
9	5	The voices in your head are actually useful here.	2015-09-10 03:40:55.646938	2015-09-10 03:40:55.646938	16
10	3	I don't know why I posted this here... Move along...	2015-09-10 03:40:55.658794	2015-09-10 03:40:55.658794	17
11	6	You're less likely to feel your life slipping between your fingers if you think you've learned something	2015-09-10 03:40:55.670028	2015-09-10 03:40:55.670028	18
12	7	There's no way that bemoaning a minor grievance common to most people in a developed nation can get downvoted on the internet!	2015-09-10 03:40:55.681826	2015-09-10 03:40:55.681826	19
13	5	Stare long enough and you might forget that you're just wasting time	2015-09-10 03:40:55.692431	2015-09-10 03:40:55.692431	20
14	3	Maybe one day I'll travel there. Probably not, though.	2015-09-10 03:40:55.705438	2015-09-10 03:40:55.705438	21
15	5	It carries more meaning because a famous person said it	2015-09-10 03:40:55.718706	2015-09-10 03:40:55.718706	22
16	2	Believe it!	2015-09-10 03:40:55.731987	2015-09-10 03:40:55.731987	23
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivanmccarter
--

SELECT pg_catalog.setval('posts_id_seq', 16, true);


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
1	PtntZr0	$2a$10$Ur.Oi2bJWfC3kf38CI8Up.VTtCHifYokRxbrxY/UWttFWN1MksPB6	k3HjY00uUyS9d8GTVqyqrQ	2015-09-10 03:40:55.254865	2015-09-10 03:40:55.254865	2
3	0pin10n8d	$2a$10$uu6MD52.tO76iaA8Kfqh3u.4/RILd96Q9AvJadEexkMroH0czvWLC	yG6vxUh1N1N_6_ZB6Zd9EQ	2015-09-10 03:40:55.268363	2015-09-10 03:40:55.268363	5
4	anml<3r	$2a$10$rW1Cz9Fufs0xoA./MNbBVOoKUCydqyEKwD1.x.mRACliq/qAZ165S	ig_6pBlklNcWn_iwICbI0Q	2015-09-10 03:40:55.273323	2015-09-10 03:40:55.273323	4
5	the_1_uPPer	$2a$10$XIPENryNXGTHOdv/kuwtCOeHfK3ceOPPRWMq0NBIdh0LUH.cR5/D.	hZgqMvkz3WjWUMeeOjLCAg	2015-09-10 03:40:55.278131	2015-09-10 03:40:55.278131	7
6	321chemtrails	$2a$10$EfCBYcsba2OHVhvEoHXdROfMur/QEs5lpxbtbD5VEko2z8Cw4f7Ze	6OVdQDHrK0JhlA-g2M51Bg	2015-09-10 03:40:55.283151	2015-09-10 03:40:55.283151	3
7	mamameme	$2a$10$9vwP4h/P9fmzKS4WgQSsCuY3CwzvUop/tBEFKfaK6hcNOaerm7nlC	RP6JBc3vYJOCvGi584V8fQ	2015-09-10 03:40:55.288	2015-09-10 03:40:55.288	6
2	Guest	$2a$10$Sxn33rNu7KOajKen4deAzumB.in8m1nL0DiTce2dyux97cyOh/ZDK	Jy7RGZP6PV-AndCs2-1kjg	2015-09-10 03:40:55.263192	2015-09-10 04:44:05.737563	1
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivanmccarter
--

SELECT pg_catalog.setval('users_id_seq', 7, true);


--
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: ivanmccarter
--

COPY votes (id, user_id, post_id, vote_score, created_at, updated_at) FROM stdin;
1	1	1	1	2015-09-10 03:40:55.882369	2015-09-10 03:40:55.882369
2	7	1	1	2015-09-10 03:40:55.888468	2015-09-10 03:40:55.888468
3	3	1	1	2015-09-10 03:40:55.89171	2015-09-10 03:40:55.89171
4	4	1	1	2015-09-10 03:40:55.894781	2015-09-10 03:40:55.894781
5	5	1	1	2015-09-10 03:40:55.897762	2015-09-10 03:40:55.897762
6	6	2	1	2015-09-10 03:40:55.900858	2015-09-10 03:40:55.900858
7	1	4	-1	2015-09-10 03:40:55.904054	2015-09-10 03:40:55.904054
8	3	4	-1	2015-09-10 03:40:55.907303	2015-09-10 03:40:55.907303
9	5	5	-1	2015-09-10 03:40:55.910495	2015-09-10 03:40:55.910495
10	7	5	1	2015-09-10 03:40:55.91351	2015-09-10 03:40:55.91351
11	6	5	1	2015-09-10 03:40:55.917061	2015-09-10 03:40:55.917061
12	1	5	1	2015-09-10 03:40:55.920403	2015-09-10 03:40:55.920403
13	4	5	1	2015-09-10 03:40:55.923941	2015-09-10 03:40:55.923941
14	1	6	1	2015-09-10 03:40:55.927119	2015-09-10 03:40:55.927119
15	3	6	1	2015-09-10 03:40:55.93029	2015-09-10 03:40:55.93029
16	7	6	-1	2015-09-10 03:40:55.933416	2015-09-10 03:40:55.933416
17	4	7	1	2015-09-10 03:40:55.936534	2015-09-10 03:40:55.936534
18	5	7	1	2015-09-10 03:40:55.939422	2015-09-10 03:40:55.939422
19	1	7	1	2015-09-10 03:40:55.942333	2015-09-10 03:40:55.942333
20	3	7	1	2015-09-10 03:40:55.945539	2015-09-10 03:40:55.945539
21	1	8	-1	2015-09-10 03:40:55.948503	2015-09-10 03:40:55.948503
22	1	9	1	2015-09-10 03:40:55.951672	2015-09-10 03:40:55.951672
23	1	10	-1	2015-09-10 03:40:55.954717	2015-09-10 03:40:55.954717
24	3	10	-1	2015-09-10 03:40:55.957777	2015-09-10 03:40:55.957777
25	5	10	-1	2015-09-10 03:40:55.960978	2015-09-10 03:40:55.960978
26	6	10	-1	2015-09-10 03:40:55.964076	2015-09-10 03:40:55.964076
27	1	11	-1	2015-09-10 03:40:55.967104	2015-09-10 03:40:55.967104
28	1	12	1	2015-09-10 03:40:55.969999	2015-09-10 03:40:55.969999
29	3	12	1	2015-09-10 03:40:55.97285	2015-09-10 03:40:55.97285
30	1	13	1	2015-09-10 03:40:55.975771	2015-09-10 03:40:55.975771
31	7	15	-1	2015-09-10 03:40:55.978741	2015-09-10 03:40:55.978741
32	1	16	1	2015-09-10 03:40:55.981654	2015-09-10 03:40:55.981654
33	3	16	1	2015-09-10 03:40:55.984777	2015-09-10 03:40:55.984777
34	4	16	1	2015-09-10 03:40:55.987667	2015-09-10 03:40:55.987667
35	7	16	1	2015-09-10 03:40:55.990759	2015-09-10 03:40:55.990759
36	6	1	1	2015-09-10 03:40:55.993809	2015-09-10 03:40:55.993809
37	5	16	1	2015-09-10 03:40:55.996751	2015-09-10 03:40:55.996751
\.


--
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivanmccarter
--

SELECT pg_catalog.setval('votes_id_seq', 37, true);


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

