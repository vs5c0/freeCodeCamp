--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
    name character varying NOT NULL,
    type character varying,
    description text,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    distance_from_planet numeric,
    is_inhabited boolean NOT NULL,
    is_tidal_locked boolean
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer,
    radius integer,
    has_life boolean NOT NULL,
    is_habitable boolean NOT NULL
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
    name character varying NOT NULL,
    galaxy_id integer,
    mass numeric,
    brightness integer NOT NULL,
    has_planets boolean
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'The galaxy containing our solar system', true, 13000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'The nearest spiral galaxy to the Milky Way', false, 12000);
INSERT INTO public.galaxy VALUES (3, 'Centaurus A', 'Elliptical', 'A prominent galaxy in the Centaurus constellation', false, 13000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 'A classic example of a spiral galaxy', false, 13000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 'A galaxy notable for its prominent bulge and dark band of dust', true, 13000);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'Spiral', 'The third-largest galaxy in the Local Group', false, 13000);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'Spiral-shaped galaxies with a central bulge and spiral arms');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'Galaxies shaped like ellipsoids, varying in size and brightness');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'Galaxies lacking a defined shape, often resulting from gravitational interactions');
INSERT INTO public.galaxy_type VALUES (4, 'Lenticular', 'Galaxies with a disk-like structure but without spiral arms');
INSERT INTO public.galaxy_type VALUES (5, 'Dwarf', 'Relatively small galaxies, often satellites of larger galaxies');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 384400, false, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 9378, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 23460, false, false);
INSERT INTO public.moon VALUES (4, 'Europa', 4, 670900, false, true);
INSERT INTO public.moon VALUES (5, 'Titan', 5, 1221870, false, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, 1070400, false, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 4, 1882700, false, true);
INSERT INTO public.moon VALUES (8, 'Triton', 1, 354800, false, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, 238040, false, true);
INSERT INTO public.moon VALUES (10, 'Io', 4, 421700, false, false);
INSERT INTO public.moon VALUES (11, 'Titania', 5, 436300, false, false);
INSERT INTO public.moon VALUES (12, 'Rhea', 4, 527040, false, false);
INSERT INTO public.moon VALUES (13, 'Oberon', 5, 583520, false, false);
INSERT INTO public.moon VALUES (14, 'Iapetus', 4, 3561300, false, false);
INSERT INTO public.moon VALUES (15, 'Charon', 1, 19591, false, true);
INSERT INTO public.moon VALUES (16, 'Dione', 4, 377420, false, false);
INSERT INTO public.moon VALUES (17, 'Ariel', 5, 190900, false, false);
INSERT INTO public.moon VALUES (18, 'Umbriel', 5, 266000, false, false);
INSERT INTO public.moon VALUES (19, 'Tethys', 4, 294660, false, false);
INSERT INTO public.moon VALUES (20, 'Miranda', 1, 129390, false, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371, true, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 3389, false, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 2, 69911, false, false);
INSERT INTO public.planet VALUES (4, 'Saturn', 2, 58232, false, false);
INSERT INTO public.planet VALUES (5, 'Kepler-452b', 6, 6371, true, true);
INSERT INTO public.planet VALUES (6, 'HD 209458 b', 6, 142984, false, false);
INSERT INTO public.planet VALUES (7, 'Venus', 1, 6052, false, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 4, 24622, false, false);
INSERT INTO public.planet VALUES (9, 'Uranus', 4, 25362, false, false);
INSERT INTO public.planet VALUES (10, 'Mercury', 1, 2440, false, false);
INSERT INTO public.planet VALUES (11, 'Gliese 581 c', 9, 7520, true, true);
INSERT INTO public.planet VALUES (12, 'Gliese 581 d', 9, 9500, true, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1989000000000000000000000000000, 27, true);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 2200000000000000000000000000000, 5, true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 1, 1800000000000000000000000000000, 4, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, 15000000000000000000000000000000, 1400, false);
INSERT INTO public.star VALUES (5, 'Vega', 1, 2100000000000000000000000000000, 40, true);
INSERT INTO public.star VALUES (6, 'Arcturus', 3, 11000000000000000000000000000000, 170, true);
INSERT INTO public.star VALUES (7, 'Sirius', 1, 2020000000000000000000000000000, 25, true);
INSERT INTO public.star VALUES (8, 'Aldebaran', 3, 17000000000000000000000000000000, 170, true);
INSERT INTO public.star VALUES (9, 'Canopus', 4, 8700000000000000000000000000000, 31000, false);
INSERT INTO public.star VALUES (10, 'Rigel', 4, 23000000000000000000000000000000, 120000, false);
INSERT INTO public.star VALUES (11, 'Proxima Centauri', 1, 244700000000000000000000000000, 0, true);
INSERT INTO public.star VALUES (12, 'Polaris', 1, 5400000000000000000000000000000, 43, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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

