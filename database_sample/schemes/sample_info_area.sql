--
-- PostgreSQL database dump
--

\restrict xsf7FQUGkeeZJjRBYoWxhjgtLmkHc4bAVe9L2UcChQ5LnSG06BNmMxwKesi8phe

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2026-02-07 15:43:34

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
-- TOC entry 7037 (class 0 OID 2737725)
-- Dependencies: 709
-- Data for Name: sample_info_area; Type: TABLE DATA; Schema: atd; Owner: postgres
--

COPY atd.sample_info_area (id, id_country, id_type_devis, name_full, name_short, code_devision, date_start, date_end, id_status_shape, name_alt, code_iso, description) FROM stdin;
24	108	1	Manipur	\N	14	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
25	108	1	Meghalaya	\N	17	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
26	108	1	Mizoram	\N	15	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
27	108	1	Puducherry	\N	34	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
30	108	1	Sikkim	\N	11	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
31	108	1	Tamil Nadu	\N	33	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
32	108	1	Tripura	\N	16	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
34	108	1	West Bengal	\N	19	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
35	108	1	Nagaland	\N	13	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
36	108	1	Assam	\N	18	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
926	108	3	Ambala-ll	\N	448	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
39	108	2	Mancherial	\N	712	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
40	108	2	Medchal	\N	713	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
41	108	2	North & Middle Andaman	\N	639	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
42	108	2	South Andaman	\N	640	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
43	108	2	Chittoor	\N	554	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
44	108	2	East Godavari	\N	545	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
45	108	2	Guntur	\N	548	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
46	108	2	Krishna	\N	547	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
47	108	2	Kurnool	\N	552	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
48	108	2	Prakasam	\N	549	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
49	108	2	Sri Potti Sriramulu Nellore	\N	550	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
50	108	2	Srikakulam	\N	542	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
51	108	2	Visakhapatnam	\N	544	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
52	108	2	Vizianagaram	\N	543	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
53	108	2	West Godavari	\N	546	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
54	108	2	Y.S.R.	\N	551	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
55	108	2	Anjaw	\N	252	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
56	108	2	Changlang	\N	253	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
57	108	2	Dibang Valley	\N	258	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
58	108	2	East Kameng	\N	247	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
59	108	2	East Siang	\N	251	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
60	108	2	Kra Daadi	\N	720	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
61	108	2	Kurung Kumey	\N	256	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
62	108	2	Lohit	\N	259	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
63	108	2	Longding	\N	257	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
64	108	2	Lower Dibang Valley	\N	670	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
65	108	2	Lower Subansiri	\N	255	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
66	108	2	Namsai	\N	721	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
67	108	2	Tirap	\N	254	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
68	108	2	Dhemaji	\N	308	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
69	108	2	Dhubri	\N	301	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
70	108	2	Panch Mahals	\N	484	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
71	108	2	Patan	\N	470	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
72	108	2	Porbandar	\N	478	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
73	108	2	Rajkot	\N	476	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
75	108	2	Surat	\N	492	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
76	108	2	Bilaspur (HP)	\N	30	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
77	108	2	Tapi	\N	493	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
78	108	2	The Dangs	\N	489	2021-01-01 00:00:00	2022-08-25 00:00:00	1	\N	\N	\N
\.


-- Completed on 2026-02-07 15:43:34

--
-- PostgreSQL database dump complete
--

\unrestrict xsf7FQUGkeeZJjRBYoWxhjgtLmkHc4bAVe9L2UcChQ5LnSG06BNmMxwKesi8phe

