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
-- Name: astronomer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomer (
    astronomer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    birth_year integer,
    death_year integer,
    nationality character varying(50)
);


ALTER TABLE public.astronomer OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomer_astronomer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomer_astronomer_id_seq OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomer_astronomer_id_seq OWNED BY public.astronomer.astronomer_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    constellation text NOT NULL,
    rank_in_local_group integer,
    star_formation_rate_index integer,
    hubble_type_index integer,
    redshift numeric(8,4),
    distance_mpc numeric(10,3),
    is_star_forming boolean NOT NULL,
    is_spiral boolean NOT NULL
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
    name character varying(50) NOT NULL,
    discoverer character varying(100),
    discovered_date date,
    description text NOT NULL,
    mean_temperature_k integer,
    mean_ecuatorial_radius_km integer,
    periapsis integer,
    apoapsis integer,
    eccentricity numeric(6,1),
    surface_gravity numeric(6,1),
    has_atmosphere boolean NOT NULL,
    is_bigger_moon boolean NOT NULL,
    planet_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    description text NOT NULL,
    moons_numbers integer,
    mean_temperature_k integer,
    mean_ecuatorial_radius_km integer,
    aphelion numeric(7,1),
    perihelion numeric(7,1),
    eccentricity numeric(6,1),
    is_solid boolean NOT NULL,
    is_bigger_earth boolean NOT NULL,
    star_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    description text NOT NULL,
    mean_temperature_k integer,
    mean_ecuatorial_radius_km integer,
    age_billions_years numeric(5,1),
    surface_gravity numeric(6,1),
    has_confirmed_exoplanets boolean NOT NULL,
    is_bigger_sun boolean NOT NULL,
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
-- Name: astronomer astronomer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer ALTER COLUMN astronomer_id SET DEFAULT nextval('public.astronomer_astronomer_id_seq'::regclass);


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
-- Data for Name: astronomer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomer VALUES (1, 'Galileo Galilei', 1564, 1642, 'Italian');
INSERT INTO public.astronomer VALUES (2, 'Christiaan Huygens', 1629, 1695, 'Dutch');
INSERT INTO public.astronomer VALUES (3, 'Giovanni Cassini', 1625, 1712, 'Italian/French');
INSERT INTO public.astronomer VALUES (4, 'William Herschel', 1738, 1822, 'German/British');
INSERT INTO public.astronomer VALUES (5, 'Asaph Hall', 1829, 1907, 'American');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', 2, 4, 7, 0.0000, 0.000, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda (M31)', 'Andromeda', 1, 3, 5, -0.0010, 0.778, true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum (M33)', 'Triangulum', 3, 5, 8, -0.0006, 0.940, true, true);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud (LMC)', 'Dorado/Mensa', 4, 5, 10, 0.0009, 0.050, true, false);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud (SMC)', 'Tucana', 5, 4, 10, 0.0006, 0.062, true, false);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A (NGC 5128)', 'Centaurus', NULL, 2, 0, 0.0018, 3.800, false, false);
INSERT INTO public.galaxy VALUES (7, 'Bode`s Galaxy (M81)', 'Ursa Major', NULL, 4, 6, 0.0002, 3.600, true, true);
INSERT INTO public.galaxy VALUES (8, 'Cigar Galaxy (M82)', 'Ursa Major', NULL, 5, 10, 0.0007, 3.500, true, false);
INSERT INTO public.galaxy VALUES (9, 'Whirlpool Galaxy (M51)', 'Canes Venatici', NULL, 5, 7, 0.0015, 7.600, true, true);
INSERT INTO public.galaxy VALUES (10, 'Messier 87 (M87)', 'Virgo', NULL, 1, 0, 0.0043, 16.700, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, NULL, 'Earth’s only permanent natural satellite and the fifth largest moon in the Solar System.', 270, 1737, 363300, 405500, 0.1, 1.6, false, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Asaph Hall', '1877-08-18', 'Inner, larger moon of Mars, spiraling inward to eventually impact the planet.', 233, 11, 6000, 6800, 0.0, 0.0, false, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Asaph Hall', '1877-08-12', 'Outer, smaller moon of Mars, irregularly shaped.', 233, 6, 23460, 23470, 0.0, 0.0, false, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Galileo Galilei', '1610-01-08', 'Most volcanically active world in the Solar System due to tidal forces.', 130, 1822, 420000, 423400, 0.0, 1.8, false, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Galileo Galilei', '1610-01-08', 'Icy moon with evidence of a vast subsurface ocean of liquid water.', 102, 1561, 670900, 676900, 0.0, 1.3, false, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Galileo Galilei', '1610-01-08', 'Largest moon in the Solar System, larger than Mercury and Pluto, with a magnetic field.', 110, 2634, 1070400, 1070400, 0.0, 1.4, false, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Galileo Galilei', '1610-01-08', 'Heavily cratered, ancient moon, possibly containing a subsurface ocean.', 134, 2410, 1880000, 1883000, 0.0, 1.2, false, true, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'Edward Barnard', '1892-09-09', 'Irregularly shaped, reddish inner moon of Jupiter.', 122, 84, 181365, 181365, 0.0, 0.0, false, false, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 'C. Perrine', '1904-12-03', 'Largest member of the Himalia group of irregular prograde satellites.', 122, 85, 11461000, 11461000, 0.2, 0.0, false, false, 5);
INSERT INTO public.moon VALUES (10, 'Elara', 'C. Perrine', '1905-01-02', 'Irregular prograde satellite of Jupiter.', 122, 43, 11737000, 11737000, 0.2, 0.0, false, false, 5);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 'P. Melotte', '1908-01-27', 'Largest member of its retrograde irregular satellite group.', 122, 30, 24657000, 24657000, 0.4, 0.0, false, false, 5);
INSERT INTO public.moon VALUES (12, 'Titan', 'Christiaan Huygens', '1655-03-25', 'Second-largest moon, only one with a dense atmosphere and stable liquid surface lakes (methane/ethane).', 94, 2575, 1186600, 1257000, 0.0, 1.4, true, true, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', 'Giovanni Cassini', '1672-12-23', 'Second-largest moon of Saturn, icy and heavily cratered.', 73, 764, 527040, 527040, 0.0, 0.3, false, true, 6);
INSERT INTO public.moon VALUES (14, 'Iapetus', 'Giovanni Cassini', '1671-10-25', 'Distinct two-tone coloration and equatorial ridge.', 130, 735, 3561300, 3561300, 0.0, 0.2, false, true, 6);
INSERT INTO public.moon VALUES (15, 'Dione', 'Giovanni Cassini', '1684-03-21', 'Icy moon with bright wispy streaks, likely ice cliffs.', 87, 561, 377400, 377400, 0.0, 0.2, false, false, 6);
INSERT INTO public.moon VALUES (16, 'Tethys', 'Giovanni Cassini', '1684-03-21', 'Icy moon with a huge impact crater (Odysseus) and a great canyon (Ithaca Chasma).', 86, 531, 294619, 294619, 0.0, 0.2, false, false, 6);
INSERT INTO public.moon VALUES (17, 'Enceladus', 'Frederick Herschel', '1789-08-28', 'Known for dramatic cryovolcanic geysers erupting from its south pole.', 75, 252, 238042, 238042, 0.0, 0.1, false, false, 6);
INSERT INTO public.moon VALUES (18, 'Mimas', 'Frederick Herschel', '1789-08-28', 'Smallest of the inner major moons, famous for its massive Herschel crater.', 64, 198, 185539, 185539, 0.0, 0.1, false, false, 6);
INSERT INTO public.moon VALUES (19, 'Hyperion', 'W. Lassell, W. Bond', '1848-09-16', 'Irregular, porous moon, tumbles chaotically.', 122, 135, 1481000, 1481000, 0.1, 0.0, false, false, 6);
INSERT INTO public.moon VALUES (20, 'Phoebe', 'W. Pickering', '1898-03-17', 'Irregular, dark, outer moon of Saturn with a retrograde orbit.', 75, 107, 12952000, 12952000, 0.2, 0.0, false, false, 6);
INSERT INTO public.moon VALUES (21, 'Titania', 'Frederick Herschel', '1787-01-11', 'Largest moon of Uranus, named after the Queen of the Fairies.', 73, 788, 435900, 435900, 0.0, 0.4, false, true, 7);
INSERT INTO public.moon VALUES (22, 'Oberon', 'Frederick Herschel', '1787-01-11', 'Second largest and outermost of the major moons, heavily cratered.', 73, 761, 583500, 583500, 0.0, 0.4, false, true, 7);
INSERT INTO public.moon VALUES (23, 'Umbriel', 'William Lassell', '1851-10-24', 'Darkest of the major moons, ancient and heavily cratered.', 73, 585, 266000, 266000, 0.0, 0.3, false, false, 7);
INSERT INTO public.moon VALUES (24, 'Ariel', 'William Lassell', '1851-10-24', 'Brightest moon with surface features indicating past geological activity.', 73, 579, 190500, 190500, 0.0, 0.3, false, false, 7);
INSERT INTO public.moon VALUES (25, 'Miranda', 'Gerard Kuiper', '1948-02-16', 'Innermost major moon, highly varied terrain, suggesting resurfacing.', 73, 236, 129900, 129900, 0.0, 0.1, false, false, 7);
INSERT INTO public.moon VALUES (26, 'Triton', 'William Lassell', '1846-10-10', 'Largest moon of Neptune, only large moon with a retrograde orbit, has cryovolcanism.', 38, 1353, 354800, 354800, 0.0, 0.8, true, true, 8);
INSERT INTO public.moon VALUES (27, 'Nereid', 'Gerard Kuiper', '1949-05-01', 'Irregular outer moon with an extremely eccentric orbit.', 50, 170, 1372000, 9621000, 0.8, 0.0, false, false, 8);
INSERT INTO public.moon VALUES (28, 'Janus', 'Audouin Dollfus', '1966-12-15', 'Co-orbital moon of Saturn, shares an orbit with Epimetheus.', 70, 90, 151472, 151472, 0.0, 0.0, false, false, 6);
INSERT INTO public.moon VALUES (29, 'Epimetheus', 'Richard Walker', '1966-12-18', 'Co-orbital moon of Saturn, shares an orbit with Janus.', 70, 58, 151422, 151422, 0.0, 0.0, false, false, 6);
INSERT INTO public.moon VALUES (30, 'Larissa', 'H. Reitsema et al.', '1989-05-28', 'Inner satellite of Neptune, irregularly shaped.', 70, 97, 73500, 73500, 0.0, 0.0, false, false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Closest planet to the Sun and the smallest.', 0, 440, 2440, 0.5, 0.3, 0.2, true, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Hottest planet with a dense toxic atmosphere.', 0, 737, 6052, 0.7, 0.7, 0.0, true, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The only astronomical object known to harbor life.', 1, 288, 6378, 1.0, 1.0, 0.0, true, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The Red Planet, home to Olympus Mons.', 2, 210, 3390, 1.7, 1.4, 0.1, true, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet, a massive gas giant.', 95, 165, 71492, 5.5, 5.0, 0.0, false, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Known for its prominent ring system.', 146, 134, 60268, 10.1, 9.0, 0.1, false, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'An ice giant that rotates on its side.', 28, 76, 25559, 20.1, 18.3, 0.0, false, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Farthest known planet, an ice giant with strong winds.', 16, 73, 24764, 30.3, 29.8, 0.0, false, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'A dwarf planet in the Kuiper Belt.', 5, 44, 1188, 49.3, 29.7, 0.2, true, false, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 'First Earth-size planet in the habitable zone of another star.', 0, 250, 6800, 1.5, 1.5, 0.0, true, false, 2);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'Osiris, a massive hot Jupiter exoplanet.', 0, 1500, 163000, 0.0, 0.0, 0.0, false, true, 3);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 'Super-Earth candidate in a red dwarf habitable zone.', 0, 280, 8500, 0.1, 0.1, 0.0, true, false, 4);
INSERT INTO public.planet VALUES (13, 'WASP-12b', 'Extremely hot, egg-shaped, tidally-locked planet.', 0, 2500, 260000, 0.0, 0.0, 0.0, false, true, 5);
INSERT INTO public.planet VALUES (14, 'Hypothetus A', 'A small, cold, rocky planet far from its star.', 3, 100, 1500, 30.5, 25.5, 0.1, true, false, 6);
INSERT INTO public.planet VALUES (15, 'Gas Giant Z', 'A massive gas giant orbiting a binary star system.', 50, 180, 80000, 12.0, 11.0, 0.1, false, true, 7);
INSERT INTO public.planet VALUES (16, 'Oceanus 7', 'A hypothetical world covered entirely in deep water.', 6, 300, 10000, 2.5, 2.4, 0.0, true, true, 8);
INSERT INTO public.planet VALUES (17, 'Lava World 1', 'A volcanic planet extremely close to its star.', 0, 2000, 5000, 0.0, 0.0, 0.0, true, false, 9);
INSERT INTO public.planet VALUES (18, 'Mega-Uranus', 'An icy giant much larger than Uranus.', 15, 60, 120000, 40.0, 38.0, 0.0, false, true, 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'Estrella enana amarilla G2V, fuente de vida en la Tierra.', 5778, 695700, 4.6, 274.0, true, false, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Enana roja M5V, la estrella más cercana al Sol. Parte de un sistema triple.', 3042, 100000, 4.9, 520.0, true, false, 1);
INSERT INTO public.star VALUES (3, 'Sirius A', 'Estrella binaria A1V, la más brillante en el cielo nocturno.', 9940, 1190000, 0.2, 230.0, false, true, 1);
INSERT INTO public.star VALUES (4, 'Barnard`s Star', 'Enana roja M4V, segunda estrella más cercana al Sol.', 3100, 140000, 10.0, 560.0, true, false, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'Gigante roja M1-2Ia-Iab, una de las estrellas más grandes visibles.', 3500, 612700000, 0.0, 0.0, false, true, 1);
INSERT INTO public.star VALUES (6, 'Rigel', 'Supergigante azul-blanca B8Ia, una de las más luminosas conocidas.', 12100, 54260000, 0.2, 0.8, false, true, 1);
INSERT INTO public.star VALUES (7, 'TRAPPIST-1', 'Enana roja M8V, famosa por albergar siete planetas terrestres.', 2560, 84000, 7.6, 610.0, true, false, 1);
INSERT INTO public.star VALUES (8, 'Kepler-186', 'Enana roja M1V, conocida por tener el primer planeta del tamaño de la Tierra en zona habitable.', 3750, 480000, 4.0, 50.0, true, false, 1);
INSERT INTO public.star VALUES (9, 'R136a1', 'Supergigante hipermasiva de una galaxia vecina (Gran Nube de Magallanes).', 50000, 20000000, 0.0, 0.1, false, true, 2);
INSERT INTO public.star VALUES (10, 'Vega', 'Estrella blanca A0V, prototipo de estrellas con disco de escombros.', 9602, 1640000, 0.4, 100.0, false, true, 1);


--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomer_astronomer_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 30, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: astronomer astronomer_full_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_full_name_key UNIQUE (name);


--
-- Name: astronomer astronomer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_pkey PRIMARY KEY (astronomer_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

