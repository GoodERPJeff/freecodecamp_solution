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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    diameter integer,
    distance_from_earth integer,
    age numeric(10,2),
    details text,
    have_life boolean,
    is_habitable boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    diameter integer,
    distance_from_earth integer,
    age numeric(10,2),
    details text,
    have_life boolean,
    is_habitable boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: my_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.my_table (
    my_table_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    diameter integer,
    distance_from_earth integer,
    age numeric(10,2),
    details text,
    have_life boolean,
    is_habitable boolean
);


ALTER TABLE public.my_table OWNER TO freecodecamp;

--
-- Name: my_table_my_table_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.my_table_my_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.my_table_my_table_id_seq OWNER TO freecodecamp;

--
-- Name: my_table_my_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.my_table_my_table_id_seq OWNED BY public.my_table.my_table_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    diameter integer,
    distance_from_earth integer,
    age numeric(10,2),
    details text,
    have_life boolean,
    is_habitable boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    diameter integer,
    distance_from_earth integer,
    age numeric(10,2),
    details text,
    have_life boolean,
    is_habitable boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: my_table my_table_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.my_table ALTER COLUMN my_table_id SET DEFAULT nextval('public.my_table_my_table_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, type, diameter, distance_from_earth, age, details, have_life, is_habitable) FROM stdin;
1	Milky Way	Spiral	105700	0	13.51	The Milky Way is the galaxy that contains our Solar System.	t	t
2	Andromeda	Spiral	220000	2537000	10.00	The Andromeda Galaxy is the nearest spiral galaxy to the Milky Way.	f	f
3	Triangulum	Spiral	60000	3000000	12.00	The Triangulum Galaxy is a member of the Local Group of galaxies.	f	f
4	Messier 81	Spiral	90000	12000000	12.00	Messier 81 is a grand design spiral galaxy located about 12 million light-years away in the constellation Ursa Major.	f	f
5	Messier 82	Irregular	37000	12000000	12.00	Messier 82 is a starburst galaxy approximately 12 million light-years away in the constellation Ursa Major.	f	f
6	NGC 1300	Barred Spiral	110000	61000000	13.00	NGC 1300 is a barred spiral galaxy located about 61 million light-years away in the constellation Eridanus.	f	f
7	NGC 6744	Spiral	200000	30000000	13.00	NGC 6744 is a spiral galaxy located about 30 million light-years away in the constellation Pavo.	f	f
8	NGC 253	Spiral	70000	11000000	12.00	NGC 253 is a spiral galaxy located about 11 million light-years away in the constellation Sculptor.	f	f
9	NGC 891	Spiral	100000	30000000	13.00	NGC 891 is an edge-on spiral galaxy located about 30 million light-years away in the constellation Andromeda.	f	f
10	NGC 4565	Spiral	100000	30000000	13.00	NGC 4565 is an edge-on spiral galaxy located about 30 million light-years away in the constellation Coma Berenices.	f	f
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, type, diameter, distance_from_earth, age, details, have_life, is_habitable, planet_id) FROM stdin;
1	Moon	Natural satellite	3475	0	4.51	The Moon is Earth only natural satellite and the fifth largest moon in the Solar System.	f	f	1
2	Phobos	Natural satellite	22	0	4.50	Phobos is the larger and closer of the two natural satellites of Mars.	f	f	2
3	Deimos	Natural satellite	12	0	4.50	Deimos is the smaller and more distant of the two natural satellites of Mars.	f	f	2
4	Io	Natural satellite	3643	0	4.50	Io is the innermost of the four Galilean moons of Jupiter and is the most geologically active object in the Solar System.	f	f	3
5	Europa	Natural satellite	3122	0	4.50	Europa is the smallest of the four Galilean moons of Jupiter and is believed to have a subsurface ocean.	f	t	3
6	Ganymede	Natural satellite	5268	0	4.50	Ganymede is the largest and most massive moon in the Solar System and is a moon of Jupiter.	f	t	3
7	Callisto	Natural satellite	4821	0	4.50	Callisto is the second-largest moon of Jupiter and is heavily cratered.	f	f	3
8	Titan	Natural satellite	5150	0	4.50	Titan is the largest moon of Saturn and has a thick atmosphere.	f	t	4
9	Rhea	Natural satellite	1528	0	4.50	Rhea is the second-largest moon of Saturn and has a heavily cratered surface.	f	f	4
10	Iapetus	Natural satellite	1469	0	4.50	Iapetus is the third-largest moon of Saturn and has a unique two-tone coloration.	f	f	4
11	Dione	Natural satellite	1123	0	4.50	Dione is the fourth-largest moon of Saturn and has a heavily cratered surface.	f	f	4
12	Tethys	Natural satellite	1060	0	4.50	Tethys is the fifth-largest moon of Saturn and has a large impact crater called Odysseus.	f	f	4
13	Enceladus	Natural satellite	504	0	4.50	Enceladus is the sixth-largest moon of Saturn and has geysers that spew water vapor and ice particles.	f	t	4
14	Mimas	Natural satellite	396	0	4.50	Mimas is the seventh-largest moon of Saturn and has a large impact crater called Herschel.	f	f	4
15	Hyperion	Natural satellite	270	0	4.50	Hyperion is the eighth-largest moon of Saturn and has an irregular shape.	f	f	4
16	Phoebe	Natural satellite	213	0	4.50	Phoebe is the ninth-largest moon of Saturn and has a retrograde orbit.	f	f	4
17	Charon	Natural satellite	1212	0	4.50	Charon is the largest moon of the dwarf planet Pluto and is tidally locked with it.	f	f	9
18	Dysnomia	Natural satellite	700	0	4.50	Dysnomia is the only known moon of the dwarf planet Eris.	f	f	10
19	Hiʻiaka	Natural satellite	350	0	4.50	Hiʻiaka is the largest moon of the dwarf planet Haumea.	f	f	11
20	Namaka	Natural satellite	170	0	4.50	Namaka is the second-largest moon of the dwarf planet Haumea.	f	f	11
21	MK2	Natural satellite	160	0	4.50	MK2 is the only known moon of the dwarf planet Makemake.	f	f	12
22	Kepler-22b I	Natural satellite	500	600	4.50	Kepler-22b I is a hypothetical moon of the exoplanet Kepler-22b.	f	t	13
23	Proxima Centauri b I	Natural satellite	300	4	4.50	Proxima Centauri b I is a hypothetical moon of the exoplanet Proxima Centauri b.	f	t	14
\.


--
-- Data for Name: my_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.my_table (my_table_id, name, type, diameter, distance_from_earth, age, details, have_life, is_habitable) FROM stdin;
1	My Object 1	Type A	1000	10000	5.00	This is a sample object of Type A.	f	f
2	My Object 2	Type B	2000	20000	10.00	This is a sample object of Type B.	t	t
3	My Object 3	Type C	3000	30000	15.00	This is a sample object of Type C.	f	t
4	My Object 4	Type D	4000	40000	20.00	This is a sample object of Type D.	t	f
5	My Object 5	Type E	5000	50000	25.00	This is a sample object of Type E.	f	f
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, type, diameter, distance_from_earth, age, details, have_life, is_habitable, star_id) FROM stdin;
1	Earth	Terrestrial	12742	0	4.54	Earth is the third planet from the Sun and the only known planet to support life.	t	t	1
2	Mars	Terrestrial	6779	0	4.60	Mars is the fourth planet from the Sun and is often referred to as the Red Planet.	f	f	1
3	Jupiter	Gas giant	139820	0	4.50	Jupiter is the largest planet in the Solar System and is known for its Great Red Spot.	f	f	1
4	Saturn	Gas giant	116460	0	4.50	Saturn is the sixth planet from the Sun and is known for its prominent ring system.	f	f	1
5	Venus	Terrestrial	12104	0	4.50	Venus is the second planet from the Sun and has a thick atmosphere that traps heat.	f	f	1
6	Mercury	Terrestrial	4879	0	4.50	Mercury is the closest planet to the Sun and has a very thin atmosphere.	f	f	1
7	Neptune	Ice giant	49244	0	4.50	Neptune is the eighth planet from the Sun and is known for its deep blue color.	f	f	1
8	Uranus	Ice giant	50724	0	4.50	Uranus is the seventh planet from the Sun and has a unique sideways rotation.	f	f	1
9	Pluto	Dwarf planet	2377	0	4.50	Pluto is a dwarf planet in the Kuiper belt and was once considered the ninth planet in the Solar System.	f	f	1
10	Ceres	Dwarf planet	946	0	4.50	Ceres is the largest object in the asteroid belt between Mars and Jupiter and is classified as a dwarf planet.	f	f	1
11	Eris	Dwarf planet	2326	0	4.50	Eris is a dwarf planet located in the scattered disc region of the Solar System.	f	f	1
12	Haumea	Dwarf planet	1632	0	4.50	Haumea is a dwarf planet located in the Kuiper belt and is known for its elongated shape.	f	f	1
13	Makemake	Dwarf planet	1430	0	4.50	Makemake is a dwarf planet located in the Kuiper belt and is one of the largest known objects in that region.	f	f	1
14	Kepler-22b	Exoplanet	25000	600	4.50	Kepler-22b is an exoplanet located in the habitable zone of its star.	f	t	1
15	Proxima Centauri b	Exoplanet	11400	4	4.50	Proxima Centauri b is an exoplanet orbiting the red dwarf star Proxima Centauri.	f	t	2
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, type, diameter, distance_from_earth, age, details, have_life, is_habitable, galaxy_id) FROM stdin;
1	Sun	G-type main-sequence star	1392000	0	4.60	The Sun is the star at the center of the Solar System.	t	t	1
2	Proxima Centauri	Red dwarf	200000	4	4.85	Proxima Centauri is the closest known star to the Sun.	f	f	1
3	Sirius	A-type main-sequence star	2370000	9	0.24	Sirius is the brightest star in the night sky.	f	f	1
4	Betelgeuse	Red supergiant	1200000000	643	8.00	Betelgeuse is a red supergiant star in the constellation Orion.	f	f	1
5	Rigel	Blue supergiant	78000000	863	8.00	Rigel is a blue supergiant star in the constellation Orion.	f	f	1
6	Vega	A-type main-sequence star	2030000	25	0.46	Vega is the fifth-brightest star in the night sky.	f	f	1
7	Polaris	F-type supergiant	44000000	323	70.00	Polaris is the North Star.	f	f	1
8	Aldebaran	K-type giant	44500000	65	6.60	Aldebaran is the brightest star in the constellation Taurus.	f	f	1
9	Antares	Red supergiant	883000000	550	12.00	Antares is a red supergiant star in the constellation Scorpius.	f	f	1
10	Spica	B-type main-sequence star	7800000	250	12.00	Spica is the brightest star in the constellation Virgo.	f	f	1
\.


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: my_table_my_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.my_table_my_table_id_seq', 5, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: my_table my_table_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.my_table
    ADD CONSTRAINT my_table_name_key UNIQUE (name);


--
-- Name: my_table my_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.my_table
    ADD CONSTRAINT my_table_pkey PRIMARY KEY (my_table_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

