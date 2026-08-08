--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    round character varying(60) NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(60) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) FROM stdin;
1	2018	65	66	4	2	Final
2	2018	67	68	2	0	Third Place
3	2018	66	68	2	1	Semi-Final
4	2018	65	67	1	0	Semi-Final
5	2018	66	69	3	2	Quarter-Final
6	2018	68	70	2	0	Quarter-Final
7	2018	67	71	2	1	Quarter-Final
8	2018	65	72	2	0	Quarter-Final
9	2018	68	73	2	1	Eighth-Final
10	2018	70	74	1	0	Eighth-Final
11	2018	67	75	3	2	Eighth-Final
12	2018	71	76	2	0	Eighth-Final
13	2018	66	77	2	1	Eighth-Final
14	2018	69	78	2	1	Eighth-Final
15	2018	72	79	2	1	Eighth-Final
16	2018	65	80	4	3	Eighth-Final
17	2014	81	80	1	0	Final
18	2014	82	71	3	0	Third Place
19	2014	80	82	1	0	Semi-Final
20	2014	81	71	7	1	Semi-Final
21	2014	82	83	1	0	Quarter-Final
22	2014	80	67	1	0	Quarter-Final
23	2014	71	73	2	1	Quarter-Final
24	2014	81	65	1	0	Quarter-Final
25	2014	71	84	2	1	Eighth-Final
26	2014	73	72	2	0	Eighth-Final
27	2014	65	85	2	0	Eighth-Final
28	2014	81	86	2	1	Eighth-Final
29	2014	82	76	2	1	Eighth-Final
30	2014	83	87	2	1	Eighth-Final
31	2014	80	74	1	0	Eighth-Final
32	2014	67	88	2	1	Eighth-Final
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.teams (team_id, name) FROM stdin;
65	France
66	Croatia
67	Belgium
68	England
69	Russia
70	Sweden
71	Brazil
72	Uruguay
73	Colombia
74	Switzerland
75	Japan
76	Mexico
77	Denmark
78	Spain
79	Portugal
80	Argentina
81	Germany
82	Netherlands
83	Costa Rica
84	Chile
85	Nigeria
86	Algeria
87	Greece
88	United States
\.


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 88, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: teams uc_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT uc_name UNIQUE (name);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

