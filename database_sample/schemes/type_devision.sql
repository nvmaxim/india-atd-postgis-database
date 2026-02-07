--
-- PostgreSQL database dump
--

\restrict UdAwP9tqtujIOeSg72f6X0K9tmk6oylyRxAbBnHx5oPapULU8hANx9wPg7XpqbF

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2026-02-07 15:38:25

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
-- TOC entry 7035 (class 0 OID 2574215)
-- Dependencies: 262
-- Data for Name: type_devision; Type: TABLE DATA; Schema: atd; Owner: nsi
--

COPY atd.type_devision (id, id_country, name_devis, description, name_devis_short) FROM stdin;
1	108	State	\N	St
2	108	District	\N	Dst
3	108	CD Block	\N	Blk
4	108	Gram Panchayat	\N	GP
5	108	Village	\N	Vil
6	108	Tehsil	\N	Th
61	108	SubTehsil	\N	sTh
7	108	Urban	\N	Urb
8	108	Forest and Lands	\N	For
\.


-- Completed on 2026-02-07 15:38:25

--
-- PostgreSQL database dump complete
--

\unrestrict UdAwP9tqtujIOeSg72f6X0K9tmk6oylyRxAbBnHx5oPapULU8hANx9wPg7XpqbF

