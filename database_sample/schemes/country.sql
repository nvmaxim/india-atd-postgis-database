--
-- PostgreSQL database dump
--

\restrict zFP2PKJZcyCxBegDEb9IaKDA7fCVKByucHZuQV6UqMiqR0QQC93Jdedc0lPlqv4

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2026-02-07 15:38:09

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
-- TOC entry 7033 (class 0 OID 2574183)
-- Dependencies: 253
-- Data for Name: country; Type: TABLE DATA; Schema: atd; Owner: nsi
--

COPY atd.country (id, id_code_country, "ISO_code", name_full, name_shot, date_start, date_end, id_r) FROM stdin;
2	\N	\N	Aruba (Netherlands)	\N	2024-06-14	\N	2
3	\N	\N	Antigua and Barbuda	\N	2024-06-14	\N	3
4	\N	\N	Afghanistan	\N	2024-06-14	\N	4
5	\N	\N	Jersey (UK)	\N	2024-06-14	\N	5
6	\N	\N	Algeria	\N	2024-06-14	\N	6
7	\N	\N	Azerbaijan	\N	2024-06-14	\N	7
8	\N	\N	Albania	\N	2024-06-14	\N	8
9	\N	\N	Armenia	\N	2024-06-14	\N	9
10	\N	\N	Andorra	\N	2024-06-14	\N	10
11	\N	\N	Angola	\N	2024-06-14	\N	11
12	\N	\N	American Samoa (US)	\N	2024-06-14	\N	12
13	\N	\N	Argentina	\N	2024-06-14	\N	13
14	\N	\N	Australia	\N	2024-06-14	\N	14
15	\N	\N	Guadeloupe (France)	\N	2024-06-14	\N	15
16	\N	\N	Austria	\N	2024-06-14	\N	16
17	\N	\N	Anguilla (UK)	\N	2024-06-14	\N	17
18	\N	\N	Antarctica	\N	2024-06-14	\N	18
19	\N	\N	Bahrain	\N	2024-06-14	\N	19
20	\N	\N	Barbados	\N	2024-06-14	\N	20
21	\N	\N	Bosnia and Herzegovina	\N	2024-06-14	\N	21
22	\N	\N	Guam (US)	\N	2024-06-14	\N	22
23	\N	\N	Greece	\N	2024-06-14	\N	23
24	\N	\N	Botswana	\N	2024-06-14	\N	24
25	\N	\N	Bermuda (UK)	\N	2024-06-14	\N	25
26	\N	\N	Belgium	\N	2024-06-14	\N	26
27	\N	\N	Costa Rica	\N	2024-06-14	\N	27
28	\N	\N	Bahamas	\N	2024-06-14	\N	28
29	\N	\N	Bulgaria	\N	2024-06-14	\N	29
30	\N	\N	Bouvet Island (Norway)	\N	2024-06-14	\N	30
31	\N	\N	Bangladesh	\N	2024-06-14	\N	31
32	\N	\N	Belize	\N	2024-06-14	\N	32
33	\N	\N	Bolivia	\N	2024-06-14	\N	33
34	\N	\N	Myanmar	\N	2024-06-14	\N	34
35	\N	\N	Benin	\N	2024-06-14	\N	35
36	\N	\N	Belarus	\N	2024-06-14	\N	36
37	\N	\N	Brunei	\N	2024-06-14	\N	37
38	\N	\N	Burundi	\N	2024-06-14	\N	38
39	\N	\N	Canada	\N	2024-06-14	\N	39
40	\N	\N	Solomon Islands	\N	2024-06-14	\N	40
41	\N	\N	Brazil	\N	2024-06-14	\N	41
42	\N	\N	Bhutan	\N	2024-06-14	\N	42
43	\N	\N	Democratic Republic of the Congo	\N	2024-06-14	\N	43
44	\N	\N	China	\N	2024-06-14	\N	44
45	\N	\N	Chile	\N	2024-06-14	\N	45
46	\N	\N	Cayman Islands (UK)	\N	2024-06-14	\N	46
47	\N	\N	Cocos (Keeling) Islands (Australia)	\N	2024-06-14	\N	47
48	\N	\N	Cambodia	\N	2024-06-14	\N	48
49	\N	\N	Chad	\N	2024-06-14	\N	49
50	\N	\N	Sri Lanka	\N	2024-06-14	\N	50
51	\N	\N	Congo	\N	2024-06-14	\N	51
52	\N	\N	Cameroon	\N	2024-06-14	\N	52
53	\N	\N	Comoros	\N	2024-06-14	\N	53
54	\N	\N	Colombia	\N	2024-06-14	\N	54
55	\N	\N	Northern Mariana Islands (US)	\N	2024-06-14	\N	55
56	\N	\N	Central African Republic	\N	2024-06-14	\N	56
57	\N	\N	Cook Islands (New Zealand)	\N	2024-06-14	\N	57
58	\N	\N	Cyprus	\N	2024-06-14	\N	58
59	\N	\N	Cuba	\N	2024-06-14	\N	59
60	\N	\N	Cape Verde	\N	2024-06-14	\N	60
61	\N	\N	Denmark	\N	2024-06-14	\N	61
62	\N	\N	Djibouti	\N	2024-06-14	\N	62
63	\N	\N	Dominica	\N	2024-06-14	\N	63
64	\N	\N	Jarvis Island (US)	\N	2024-06-14	\N	64
65	\N	\N	Dominican Republic	\N	2024-06-14	\N	65
66	\N	\N	El Salvador	\N	2024-06-14	\N	66
67	\N	\N	Heard Island & McDonald Islands (Australia)	\N	2024-06-14	\N	67
68	\N	\N	Ecuador	\N	2024-06-14	\N	68
69	\N	\N	French Guiana (France)	\N	2024-06-14	\N	69
70	\N	\N	Finland	\N	2024-06-14	\N	70
71	\N	\N	Egypt	\N	2024-06-14	\N	71
72	\N	\N	Fiji	\N	2024-06-14	\N	72
73	\N	\N	Ireland	\N	2024-06-14	\N	73
74	\N	\N	Equatorial Guinea	\N	2024-06-14	\N	74
75	\N	\N	Estonia	\N	2024-06-14	\N	75
76	\N	\N	Eritrea	\N	2024-06-14	\N	76
77	\N	\N	Ethiopia	\N	2024-06-14	\N	77
78	\N	\N	Czech Republic	\N	2024-06-14	\N	78
79	\N	\N	Falkland Islands (UK)	\N	2024-06-14	\N	79
80	\N	\N	Federated States of Micronesia	\N	2024-06-14	\N	80
81	\N	\N	Faroe Islands (Denmark)	\N	2024-06-14	\N	81
82	\N	\N	French Polynesia (France)	\N	2024-06-14	\N	82
83	\N	\N	Baker Island (US)	\N	2024-06-14	\N	83
84	\N	\N	France	\N	2024-06-14	\N	84
85	\N	\N	Jamaica	\N	2024-06-14	\N	85
86	\N	\N	French Southern & Antarctic Lands (France)	\N	2024-06-14	\N	86
87	\N	\N	Gambia	\N	2024-06-14	\N	87
88	\N	\N	Ghana	\N	2024-06-14	\N	88
89	\N	\N	Gibraltar (UK)	\N	2024-06-14	\N	89
90	\N	\N	Grenada	\N	2024-06-14	\N	90
91	\N	\N	Guernsey (UK)	\N	2024-06-14	\N	91
92	\N	\N	Greenland (Denmark)	\N	2024-06-14	\N	92
93	\N	\N	Germany	\N	2024-06-14	\N	93
94	\N	\N	Glorioso Islands (France)	\N	2024-06-14	\N	94
95	\N	\N	Gabon	\N	2024-06-14	\N	95
96	\N	\N	Georgia	\N	2024-06-14	\N	96
97	\N	\N	Guatemala	\N	2024-06-14	\N	97
98	\N	\N	Guinea	\N	2024-06-14	\N	98
99	\N	\N	Jan Mayen (Norway)	\N	2024-06-14	\N	99
100	\N	\N	Guyana	\N	2024-06-14	\N	100
101	\N	\N	Palestine	\N	2024-06-14	\N	101
102	\N	\N	Haiti	\N	2024-06-14	\N	102
103	\N	\N	Honduras	\N	2024-06-14	\N	103
104	\N	\N	Howland Island (US)	\N	2024-06-14	\N	104
105	\N	\N	Hungary	\N	2024-06-14	\N	105
106	\N	\N	Iceland	\N	2024-06-14	\N	106
107	\N	\N	Isle of Man (UK)	\N	2024-06-14	\N	107
108	\N	\N	India	\N	2024-06-14	\N	108
109	\N	\N	British Indian Ocean Territory (UK)	\N	2024-06-14	\N	109
110	\N	\N	Iran	\N	2024-06-14	\N	110
111	\N	\N	Croatia	\N	2024-06-14	\N	111
112	\N	\N	Israel	\N	2024-06-14	\N	112
113	\N	\N	Italy	\N	2024-06-14	\N	113
114	\N	\N	Ivory Coast	\N	2024-06-14	\N	114
115	\N	\N	Iraq	\N	2024-06-14	\N	115
116	\N	\N	Japan	\N	2024-06-14	\N	116
117	\N	\N	Jordan	\N	2024-06-14	\N	117
118	\N	\N	Johnston Atoll (US)	\N	2024-06-14	\N	118
119	\N	\N	Juan De Nova Island (France)	\N	2024-06-14	\N	119
120	\N	\N	Kenya	\N	2024-06-14	\N	120
121	\N	\N	Liberia	\N	2024-06-14	\N	121
122	\N	\N	Kyrgyzstan	\N	2024-06-14	\N	122
123	\N	\N	Latvia	\N	2024-06-14	\N	123
124	\N	\N	North Korea	\N	2024-06-14	\N	124
125	\N	\N	Kiribati	\N	2024-06-14	\N	125
126	\N	\N	Lithuania	\N	2024-06-14	\N	126
127	\N	\N	Maldives	\N	2024-06-14	\N	127
128	\N	\N	South Korea	\N	2024-06-14	\N	128
129	\N	\N	Christmas Island (Australia)	\N	2024-06-14	\N	129
130	\N	\N	Kuwait	\N	2024-06-14	\N	130
131	\N	\N	Kazakhstan	\N	2024-06-14	\N	131
132	\N	\N	Qatar	\N	2024-06-14	\N	132
133	\N	\N	Laos	\N	2024-06-14	\N	133
134	\N	\N	Lebanon	\N	2024-06-14	\N	134
135	\N	\N	Reunion (France)	\N	2024-06-14	\N	135
136	\N	\N	Slovakia	\N	2024-06-14	\N	136
137	\N	\N	Liechtenstein	\N	2024-06-14	\N	137
138	\N	\N	Lesotho	\N	2024-06-14	\N	138
139	\N	\N	Luxembourg	\N	2024-06-14	\N	139
140	\N	\N	Montenegro	\N	2024-06-14	\N	140
141	\N	\N	Mexico	\N	2024-06-14	\N	141
142	\N	\N	Malaysia	\N	2024-06-14	\N	142
143	\N	\N	Marshall Islands	\N	2024-06-14	\N	143
144	\N	\N	Libya	\N	2024-06-14	\N	144
145	\N	\N	Madagascar	\N	2024-06-14	\N	145
146	\N	\N	Martinique (France)	\N	2024-06-14	\N	146
147	\N	\N	Moldova	\N	2024-06-14	\N	147
148	\N	\N	Mayotte (France)	\N	2024-06-14	\N	148
149	\N	\N	Mongolia	\N	2024-06-14	\N	149
150	\N	\N	Montserrat (UK)	\N	2024-06-14	\N	150
151	\N	\N	Malawi	\N	2024-06-14	\N	151
152	\N	\N	Macedonia	\N	2024-06-14	\N	152
153	\N	\N	New Caledonia (France)	\N	2024-06-14	\N	153
154	\N	\N	Niue (New Zealand)	\N	2024-06-14	\N	154
155	\N	\N	Norfolk Island (Australia)	\N	2024-06-14	\N	155
156	\N	\N	Mali	\N	2024-06-14	\N	156
157	\N	\N	Monaco	\N	2024-06-14	\N	157
158	\N	\N	Morocco	\N	2024-06-14	\N	158
159	\N	\N	Mauritius	\N	2024-06-14	\N	159
160	\N	\N	Midway Islands (US)	\N	2024-06-14	\N	160
161	\N	\N	Suriname	\N	2024-06-14	\N	161
162	\N	\N	Mauritania	\N	2024-06-14	\N	162
163	\N	\N	Malta	\N	2024-06-14	\N	163
164	\N	\N	Oman	\N	2024-06-14	\N	164
165	\N	\N	Papua New Guinea	\N	2024-06-14	\N	165
166	\N	\N	Mozambique	\N	2024-06-14	\N	166
167	\N	\N	Niger	\N	2024-06-14	\N	167
168	\N	\N	Vanuatu	\N	2024-06-14	\N	168
169	\N	\N	Palau (US)	\N	2024-06-14	\N	169
170	\N	\N	Nigeria	\N	2024-06-14	\N	170
171	\N	\N	Netherlands	\N	2024-06-14	\N	171
172	\N	\N	Norway	\N	2024-06-14	\N	172
173	\N	\N	Nepal	\N	2024-06-14	\N	173
174	\N	\N	Nauru	\N	2024-06-14	\N	174
175	\N	\N	Nicaragua	\N	2024-06-14	\N	175
176	\N	\N	New Zealand	\N	2024-06-14	\N	176
177	\N	\N	Paraguay	\N	2024-06-14	\N	177
178	\N	\N	Pitcairn Islands (UK)	\N	2024-06-14	\N	178
179	\N	\N	Peru	\N	2024-06-14	\N	179
180	\N	\N	Paracel Islands (China)	\N	2024-06-14	\N	180
181	\N	\N	Spratly Islands (Disputed)	\N	2024-06-14	\N	181
182	\N	\N	Pakistan	\N	2024-06-14	\N	182
183	\N	\N	Poland	\N	2024-06-14	\N	183
184	\N	\N	Guinea-Bissau	\N	2024-06-14	\N	184
185	\N	\N	Panama	\N	2024-06-14	\N	185
186	\N	\N	Portugal	\N	2024-06-14	\N	186
187	\N	\N	Romania	\N	2024-06-14	\N	187
188	\N	\N	Philippines	\N	2024-06-14	\N	188
189	\N	\N	Puerto Rico (US)	\N	2024-06-14	\N	189
190	\N	\N	Russia	\N	2024-06-14	\N	190
191	\N	\N	Rwanda	\N	2024-06-14	\N	191
192	\N	\N	Saudi Arabia	\N	2024-06-14	\N	192
193	\N	\N	St. Pierre and Miquelon (France)	\N	2024-06-14	\N	193
194	\N	\N	St. Kitts and Nevis	\N	2024-06-14	\N	194
195	\N	\N	Seychelles	\N	2024-06-14	\N	195
196	\N	\N	South Africa	\N	2024-06-14	\N	196
197	\N	\N	Senegal	\N	2024-06-14	\N	197
198	\N	\N	St. Helena (UK)	\N	2024-06-14	\N	198
199	\N	\N	Slovenia	\N	2024-06-14	\N	199
200	\N	\N	Sierra Leone	\N	2024-06-14	\N	200
201	\N	\N	San Marino	\N	2024-06-14	\N	201
202	\N	\N	Singapore	\N	2024-06-14	\N	202
203	\N	\N	Somalia	\N	2024-06-14	\N	203
204	\N	\N	Spain	\N	2024-06-14	\N	204
205	\N	\N	Serbia	\N	2024-06-14	\N	205
206	\N	\N	St. Lucia	\N	2024-06-14	\N	206
207	\N	\N	Syria	\N	2024-06-14	\N	207
208	\N	\N	Western Sahara	\N	2024-06-14	\N	208
209	\N	\N	Wake Island (US)	\N	2024-06-14	\N	209
210	\N	\N	Sudan	\N	2024-06-14	\N	210
211	\N	\N	Svalbard (Norway)	\N	2024-06-14	\N	211
212	\N	\N	Sweden	\N	2024-06-14	\N	212
213	\N	\N	South Georgia and the South Sandwich Is (UK)	\N	2024-06-14	\N	213
214	\N	\N	Western Samoa	\N	2024-06-14	\N	214
215	\N	\N	Switzerland	\N	2024-06-14	\N	215
216	\N	\N	United Arab Emirates	\N	2024-06-14	\N	216
217	\N	\N	Trinidad and Tobago	\N	2024-06-14	\N	217
218	\N	\N	Thailand	\N	2024-06-14	\N	218
219	\N	\N	Togo	\N	2024-06-14	\N	219
220	\N	\N	Tajikistan	\N	2024-06-14	\N	220
221	\N	\N	Turks and Caicos Islands (UK)	\N	2024-06-14	\N	221
222	\N	\N	Tokelau (New Zealand)	\N	2024-06-14	\N	222
223	\N	\N	Tonga	\N	2024-06-14	\N	223
224	\N	\N	Sao Tome and Principe	\N	2024-06-14	\N	224
225	\N	\N	Tunisia	\N	2024-06-14	\N	225
226	\N	\N	Turkey	\N	2024-06-14	\N	226
227	\N	\N	Tuvalu	\N	2024-06-14	\N	227
228	\N	\N	Taiwan	\N	2024-06-14	\N	228
229	\N	\N	American Virgin Islands (US)	\N	2024-06-14	\N	229
230	\N	\N	Turkmenistan	\N	2024-06-14	\N	230
231	\N	\N	Tanzania	\N	2024-06-14	\N	231
232	\N	\N	Swaziland	\N	2024-06-14	\N	232
233	\N	\N	Uganda	\N	2024-06-14	\N	233
234	\N	\N	United Kingdom	\N	2024-06-14	\N	234
235	\N	\N	Ukraine	\N	2024-06-14	\N	235
236	\N	\N	United States	\N	2024-06-14	\N	236
237	\N	\N	Burkina Faso	\N	2024-06-14	\N	237
238	\N	\N	Uruguay	\N	2024-06-14	\N	238
239	\N	\N	Namibia	\N	2024-06-14	\N	239
240	\N	\N	Wallis and Futuna (France)	\N	2024-06-14	\N	240
241	\N	\N	Uzbekistan	\N	2024-06-14	\N	241
242	\N	\N	St. Vincent and the Grenadines	\N	2024-06-14	\N	242
243	\N	\N	Venezuela	\N	2024-06-14	\N	243
244	\N	\N	British Virgin Islands(UK)	\N	2024-06-14	\N	244
245	\N	\N	Vietnam	\N	2024-06-14	\N	245
246	\N	\N	Yemen	\N	2024-06-14	\N	246
247	\N	\N	Zimbabwe	\N	2024-06-14	\N	247
248	\N	\N	Zambia	\N	2024-06-14	\N	248
249	\N	\N	South Sudan	\N	2024-06-14	\N	249
250	\N	\N	Indonesia	\N	2024-06-14	\N	250
251	\N	\N	East Timor	\N	2024-06-14	\N	251
252	\N	\N	Curacao (Netherlands)	\N	2024-06-14	\N	252
253	\N	\N	Bonaire (Netherlands)	\N	2024-06-14	\N	253
\.


-- Completed on 2026-02-07 15:38:09

--
-- PostgreSQL database dump complete
--

\unrestrict zFP2PKJZcyCxBegDEb9IaKDA7fCVKByucHZuQV6UqMiqR0QQC93Jdedc0lPlqv4

