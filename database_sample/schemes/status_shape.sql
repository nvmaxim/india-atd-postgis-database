--
-- PostgreSQL database dump
--

\restrict Y46BXukuhHfwedIBVR09EUrVWtuwPaNeH1N0t24CI40VLXbfdu9YTuqvc8L7b7K

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2026-02-07 15:38:40

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
-- TOC entry 7033 (class 0 OID 2574229)
-- Dependencies: 268
-- Data for Name: status_shape; Type: TABLE DATA; Schema: atd; Owner: nsi
--

COPY atd.status_shape (id, name_status_shape) FROM stdin;
1	Not input
2	Draft input
3	Precision input
\.


-- Completed on 2026-02-07 15:38:40

--
-- PostgreSQL database dump complete
--

\unrestrict Y46BXukuhHfwedIBVR09EUrVWtuwPaNeH1N0t24CI40VLXbfdu9YTuqvc8L7b7K

