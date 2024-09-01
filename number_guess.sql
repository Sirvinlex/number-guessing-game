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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('vin', 1, 80);
INSERT INTO public.users VALUES ('lex2', 3, 80);
INSERT INTO public.users VALUES ('vin2', 3, 60);
INSERT INTO public.users VALUES ('user_1725112194313', 2, 60);
INSERT INTO public.users VALUES ('user_1725112194314', 5, 60);
INSERT INTO public.users VALUES ('user_1725112239264', 2, 60);
INSERT INTO public.users VALUES ('user_1725112239265', 5, 60);
INSERT INTO public.users VALUES ('new', 1, 60);
INSERT INTO public.users VALUES ('new2', 1, 7);
INSERT INTO public.users VALUES ('new3', 2, 2);
INSERT INTO public.users VALUES ('9', 1, 1);
INSERT INTO public.users VALUES ('user_1725194708839', 2, 10);
INSERT INTO public.users VALUES ('user_1725194708840', 5, 10);
INSERT INTO public.users VALUES ('user_1725195247613', 2, 429);
INSERT INTO public.users VALUES ('user_1725195247614', 5, 130);
INSERT INTO public.users VALUES ('lex', 13, 1);
INSERT INTO public.users VALUES ('user_1725195495869', 2, 591);
INSERT INTO public.users VALUES ('user_1725195495870', 5, 347);
INSERT INTO public.users VALUES ('user_1725195582371', 2, 150);
INSERT INTO public.users VALUES ('user_1725195582372', 5, 82);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

