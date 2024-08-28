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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(70) NOT NULL,
    asteroid_size numeric,
    orbital_period integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(60) NOT NULL,
    number_of_stars_in_milions integer,
    contain_black_hole boolean,
    distance_from_earth_in_light_years text
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
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    moon_diameter integer NOT NULL,
    moon_orbital_period integer,
    has_rings boolean
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
    name character varying(70) NOT NULL,
    star_id integer NOT NULL,
    planet_mass numeric,
    planet_radius integer,
    has_atmosphere boolean,
    has_liquid_water boolean
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
    name character varying(70) NOT NULL,
    star_type character varying(60),
    star_mass numeric,
    star_radius integer,
    galaxy_id integer NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939, 5);
INSERT INTO public.asteroid VALUES (2, 'Pallas', 512, 5);
INSERT INTO public.asteroid VALUES (3, 'Vesta', 525, 4);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 434, 6);
INSERT INTO public.asteroid VALUES (5, 'Eros', 16.8, 2);
INSERT INTO public.asteroid VALUES (6, 'Gaspra', 18.2, 3);
INSERT INTO public.asteroid VALUES (7, 'Ida', 31.4, 5);
INSERT INTO public.asteroid VALUES (8, 'Bennu', 0.49, 1);
INSERT INTO public.asteroid VALUES (9, 'Apophis', 0.37, 1);
INSERT INTO public.asteroid VALUES (10, 'Itokawa', 0.33, 2);
INSERT INTO public.asteroid VALUES (11, 'Juno', 233, 4);
INSERT INTO public.asteroid VALUES (12, 'Davida', 326, 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 100, true, '0');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 1000, true, '2.537');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 40, false, '2.723');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 160, true, '23');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 800, true, '29');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 1000, true, '21');
INSERT INTO public.galaxy VALUES (7, 'Large Magellanic Cloud', 'Irregular', 30, false, '0.163');
INSERT INTO public.galaxy VALUES (8, 'Small Magellanic Cloud', 'Irregular', 3, false, '0.200');
INSERT INTO public.galaxy VALUES (9, 'Messier 87', 'Elliptical', 1200, true, '53.5');
INSERT INTO public.galaxy VALUES (10, 'Centaurus A', 'Lenticular', 200, true, '13');
INSERT INTO public.galaxy VALUES (11, 'NGC 1300', 'Barred Spiral', 100, true, '61.3');
INSERT INTO public.galaxy VALUES (12, 'NGC 4945', 'Barred Spiral', 200, true, '13');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3475, 27, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, 0, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, 1, false);
INSERT INTO public.moon VALUES (4, 'Io', 3, 3642, 2, false);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3122, 4, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5262, 7, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4821, 17, false);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 5150, 16, false);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, 504, 1, false);
INSERT INTO public.moon VALUES (10, 'Mimas', 4, 396, 1, false);
INSERT INTO public.moon VALUES (11, 'Triton', 7, 2707, 6, false);
INSERT INTO public.moon VALUES (12, 'Oberon', 8, 1523, 14, false);
INSERT INTO public.moon VALUES (13, 'Rhea', 4, 1528, 5, false);
INSERT INTO public.moon VALUES (14, 'Iapetus', 4, 1469, 79, false);
INSERT INTO public.moon VALUES (15, 'Dione', 4, 1123, 3, false);
INSERT INTO public.moon VALUES (16, 'Tethys', 4, 1066, 2, false);
INSERT INTO public.moon VALUES (17, 'Hyperion', 4, 270, 21, false);
INSERT INTO public.moon VALUES (18, 'Miranda', 8, 472, 1, false);
INSERT INTO public.moon VALUES (19, 'Ariel', 8, 1158, 3, false);
INSERT INTO public.moon VALUES (20, 'Umbriel', 8, 1169, 4, false);
INSERT INTO public.moon VALUES (21, 'Charon', 6, 1212, 6, false);
INSERT INTO public.moon VALUES (22, 'Nix', 6, 50, 25, false);
INSERT INTO public.moon VALUES (23, 'Hydra', 6, 62, 38, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, 1, true, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0.107, 1, true, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 317.8, 11, true, false);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 95.2, 9, true, false);
INSERT INTO public.planet VALUES (5, 'Venus', 1, 0.815, 1, true, false);
INSERT INTO public.planet VALUES (6, 'Mercury', 1, 0.055, 0, false, false);
INSERT INTO public.planet VALUES (7, 'Neptune', 1, 17.1, 4, true, false);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 14.5, 4, true, false);
INSERT INTO public.planet VALUES (9, 'Titan', 4, 0.0225, 0, true, false);
INSERT INTO public.planet VALUES (10, 'Europa', 3, 0.008, 0, true, true);
INSERT INTO public.planet VALUES (11, 'Ganymede', 3, 0.025, 0, true, false);
INSERT INTO public.planet VALUES (12, 'Callisto', 3, 0.018, 0, true, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'Main Sequence', 2.02, 2, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red Supergiant', 20, 887, 2);
INSERT INTO public.star VALUES (3, 'Vega', 'Main Sequence', 2.14, 2, 3);
INSERT INTO public.star VALUES (4, 'Arcturus', 'Red Giant', 1.08, 25, 4);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'Red Dwarf', 0.122, 0, 1);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 'Main Sequence', 1.1, 1, 1);
INSERT INTO public.star VALUES (7, 'Altair', 'Main Sequence', 1.79, 2, 5);
INSERT INTO public.star VALUES (8, 'Spica', 'Binary', 11, 7, 6);
INSERT INTO public.star VALUES (9, 'Regulus', 'Main Sequence', 3.8, 3, 7);
INSERT INTO public.star VALUES (10, 'Antares', 'Red Supergiant', 12.4, 680, 8);
INSERT INTO public.star VALUES (11, 'Polaris', 'Supergiant', 5.4, 38, 9);
INSERT INTO public.star VALUES (12, 'Deneb', 'Supergiant', 19, 203, 10);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 12, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: asteroid asteroid_asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


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

