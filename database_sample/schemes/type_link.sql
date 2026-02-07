--
-- PostgreSQL database dump
--

\restrict HGZ7q54bs0zXOgixRiONQoN5JSZfhtthPdb79awIbFgl47xemLSIoig03Eo8w2T

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2026-02-07 15:38:52

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
-- TOC entry 7033 (class 0 OID 2574244)
-- Dependencies: 274
-- Data for Name: type_link; Type: TABLE DATA; Schema: atd; Owner: nsi
--

COPY atd.type_link (id, name, description) FROM stdin;
1	District up to state	\N
2	Tehsil up to district	\N
4	Gram Panchayat up to district	\N
5	Village up to GP	\N
51	Village up to district	\N
3	Block up to district	\N
41	Gram Panchayat up to block	\N
52	Village up to tehsil	\N
21	Subtehsil up to Tehsil	\N
521	Village up to subtehsil	\N
\.


-- Completed on 2026-02-07 15:38:52

--
-- PostgreSQL database dump complete
--

\unrestrict HGZ7q54bs0zXOgixRiONQoN5JSZfhtthPdb79awIbFgl47xemLSIoig03Eo8w2T

