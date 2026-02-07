--
-- PostgreSQL database dump
--

\restrict n08lcPVHv3G0wwFEF8fWQlbm4eXAWWifKZ708YAHjwyO5tHTg0w3lrplP8Yy5tm

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2026-02-07 15:33:19

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
-- TOC entry 7 (class 2615 OID 2572878)
-- Name: atd; Type: SCHEMA; Schema: -; Owner: nsi
--

CREATE SCHEMA atd;


ALTER SCHEMA atd OWNER TO nsi;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 243 (class 1259 OID 2574140)
-- Name: info_area_devision; Type: TABLE; Schema: atd; Owner: nsi
--

CREATE TABLE atd.info_area_devision (
    id integer DEFAULT nextval(('atd.info_area_devision_id_area_seq'::text)::regclass) NOT NULL,
    id_country integer NOT NULL,
    id_type_devis integer NOT NULL,
    name_full character varying(150),
    name_short character varying(100),
    code_devision character varying(24) NOT NULL,
    date_start timestamp without time zone,
    date_end timestamp without time zone,
    id_status_shape integer NOT NULL,
    name_alt character varying(255),
    code_iso character varying(16),
    description character varying(64)
);


ALTER TABLE atd.info_area_devision OWNER TO nsi;

--
-- TOC entry 7099 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE info_area_devision; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON TABLE atd.info_area_devision IS 'Справочник единиц территориального деления';


--
-- TOC entry 7100 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN info_area_devision.id; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.info_area_devision.id IS 'ПК территориальной единицы';


--
-- TOC entry 7101 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN info_area_devision.id_country; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.info_area_devision.id_country IS 'Идентификатор страны размещения территориальной единицы';


--
-- TOC entry 7102 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN info_area_devision.id_type_devis; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.info_area_devision.id_type_devis IS 'Идентификатор типа территориального деления';


--
-- TOC entry 7103 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN info_area_devision.name_full; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.info_area_devision.name_full IS 'Полное название территориальной единицы (англ.)';


--
-- TOC entry 7104 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN info_area_devision.name_short; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.info_area_devision.name_short IS 'Краткое наименование территориальной единицы (англ.)';


--
-- TOC entry 7105 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN info_area_devision.code_devision; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.info_area_devision.code_devision IS 'Код территориальной единицы';


--
-- TOC entry 244 (class 1259 OID 2574146)
-- Name: actual_districts; Type: VIEW; Schema: atd; Owner: nsi
--

CREATE VIEW atd.actual_districts AS
 SELECT id AS id_area,
    id_country,
    id_type_devis,
    name_full,
    name_short,
    code_devision,
    date_start,
    date_end,
    id_status_shape,
    name_alt,
    code_iso,
    description AS describe
   FROM atd.info_area_devision aaa
  WHERE ((date_end IS NULL) AND (id_type_devis = 2))
  ORDER BY code_devision;


ALTER VIEW atd.actual_districts OWNER TO nsi;

--
-- TOC entry 245 (class 1259 OID 2574150)
-- Name: actual_gps; Type: VIEW; Schema: atd; Owner: nsi
--

CREATE VIEW atd.actual_gps AS
 SELECT id AS id_area,
    id_country,
    id_type_devis,
    name_full,
    name_short,
    code_devision,
    date_start,
    date_end,
    id_status_shape,
    name_alt,
    code_iso,
    description AS describe
   FROM atd.info_area_devision aaa
  WHERE ((date_end IS NULL) AND (id_type_devis = 4))
  ORDER BY code_devision;


ALTER VIEW atd.actual_gps OWNER TO nsi;

--
-- TOC entry 246 (class 1259 OID 2574154)
-- Name: actual_states; Type: VIEW; Schema: atd; Owner: nsi
--

CREATE VIEW atd.actual_states AS
 SELECT id AS id_area,
    id_country,
    id_type_devis,
    name_full,
    name_short,
    code_devision,
    date_start,
    date_end,
    id_status_shape,
    name_alt,
    code_iso,
    description AS describe
   FROM atd.info_area_devision aaa
  WHERE ((date_end IS NULL) AND (id_type_devis = 1));


ALTER VIEW atd.actual_states OWNER TO nsi;

--
-- TOC entry 247 (class 1259 OID 2574158)
-- Name: link_up_down; Type: TABLE; Schema: atd; Owner: nsi
--

CREATE TABLE atd.link_up_down (
    id integer DEFAULT nextval(('atd.link_up_down_id_link_seq'::text)::regclass) NOT NULL,
    id_area integer NOT NULL,
    id_parent_area integer NOT NULL,
    id_type_link integer
);


ALTER TABLE atd.link_up_down OWNER TO nsi;

--
-- TOC entry 7106 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE link_up_down; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON TABLE atd.link_up_down IS 'Справочник подчиненности территориального деления';


--
-- TOC entry 7107 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN link_up_down.id; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.link_up_down.id IS 'ПК записи подчинения';


--
-- TOC entry 7108 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN link_up_down.id_area; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.link_up_down.id_area IS 'Идентификатор территориальной единицы';


--
-- TOC entry 7109 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN link_up_down.id_parent_area; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.link_up_down.id_parent_area IS 'Идентификатор территориальной единицы, которой принадлежит территориальная единица';


--
-- TOC entry 248 (class 1259 OID 2574162)
-- Name: shape; Type: TABLE; Schema: atd; Owner: nsi
--

CREATE TABLE atd.shape (
    id integer NOT NULL,
    id_area integer NOT NULL,
    polygon_full public.geometry(MultiPolygon),
    polygon_legal public.geometry(MultiPolygon),
    polygon_shot public.geometry(MultiPolygon),
    line public.geography(MultiLineString,4326),
    centroid public.geometry(Point),
    name_table character varying(50),
    mrd_code character varying(50)
);


ALTER TABLE atd.shape OWNER TO nsi;

--
-- TOC entry 7110 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE shape; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON TABLE atd.shape IS 'Справочник границ территорий';


--
-- TOC entry 7111 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN shape.id; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.shape.id IS 'ПК границы территориальной единицы';


--
-- TOC entry 7112 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN shape.id_area; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.shape.id_area IS 'Идентификатор территориальной единицы';


--
-- TOC entry 7113 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN shape.polygon_full; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.shape.polygon_full IS 'Детальная граница территориальной единицы';


--
-- TOC entry 7114 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN shape.polygon_legal; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.shape.polygon_legal IS 'Утвержденная (официальная) граница территориальной единицы';


--
-- TOC entry 7115 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN shape.polygon_shot; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.shape.polygon_shot IS 'Упрощенная граница территориальной единицы';


--
-- TOC entry 7116 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN shape.line; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.shape.line IS 'Линейная территориальная единица';


--
-- TOC entry 7117 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN shape.centroid; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.shape.centroid IS 'Центройд территориальной единицы';


--
-- TOC entry 7118 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN shape.name_table; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.shape.name_table IS 'Наименование таблицы описания территориальной единицы';


--
-- TOC entry 249 (class 1259 OID 2574167)
-- Name: all_actual_districts; Type: VIEW; Schema: atd; Owner: postgres
--

CREATE VIEW atd.all_actual_districts AS
 SELECT st.id_area AS state_id,
    st.code_devision AS "StateCode",
    st.name_full AS "StateName",
    ds.id_area AS distr_id,
    ds.code_devision AS "LGDDstCode",
    ds.name_full AS "DistrName",
    ds.name_alt AS "AltDstName",
    ds.id_type_devis AS "DivLevel",
    sh.polygon_full AS geom
   FROM atd.actual_states st,
    atd.actual_districts ds,
    atd.shape sh,
    atd.link_up_down ln
  WHERE ((st.id_area = ln.id_parent_area) AND (ds.id_area = ln.id_area) AND (ds.id_area = sh.id_area) AND (ds.date_end IS NULL) AND (ds.id_type_devis = 2))
  ORDER BY st.code_devision, ds.code_devision;


ALTER VIEW atd.all_actual_districts OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 2574171)
-- Name: all_actual_states; Type: VIEW; Schema: atd; Owner: nsi
--

CREATE VIEW atd.all_actual_states AS
 SELECT st.code_devision AS "StateCode",
    st.code_iso AS "StCodeISO",
    st.name_full AS "StateName",
    st.name_alt AS "StAltName",
    sh.polygon_full AS geom
   FROM atd.info_area_devision st,
    atd.shape sh
  WHERE ((st.id = sh.id_area) AND (st.date_end IS NULL) AND (st.id_type_devis = 1));


ALTER VIEW atd.all_actual_states OWNER TO nsi;

--
-- TOC entry 251 (class 1259 OID 2574175)
-- Name: district_in_state; Type: VIEW; Schema: atd; Owner: nsi
--

CREATE VIEW atd.district_in_state AS
 SELECT state_id,
    "StateCode",
    "StateName",
    distr_id,
    "LGDDstCode",
    "DistrName",
    "AltDstName",
    "DivLevel"
   FROM atd.all_actual_districts
  WHERE (state_id = 7212)
  ORDER BY "LGDDstCode";


ALTER VIEW atd.district_in_state OWNER TO nsi;

--
-- TOC entry 252 (class 1259 OID 2574179)
-- Name: block_in_state; Type: VIEW; Schema: atd; Owner: nsi
--

CREATE VIEW atd.block_in_state AS
 SELECT atd.id AS block_id,
    atd.id_type_devis AS "DivLevel",
    atd.name_full AS blockname,
    atd.code_devision AS lgdblkcode
   FROM atd.info_area_devision atd,
    atd.link_up_down lnk,
    atd.district_in_state dst
  WHERE ((atd.id_type_devis = 3) AND (atd.date_end IS NULL) AND (lnk.id_area = atd.id) AND (lnk.id_type_link = 3) AND (lnk.id_parent_area = dst.distr_id))
  ORDER BY atd.code_devision;


ALTER VIEW atd.block_in_state OWNER TO nsi;

--
-- TOC entry 253 (class 1259 OID 2574183)
-- Name: country; Type: TABLE; Schema: atd; Owner: nsi
--

CREATE TABLE atd.country (
    id integer DEFAULT nextval(('atd.country_id_country_seq'::text)::regclass) NOT NULL,
    id_code_country character varying(3),
    "ISO_code" character varying(3),
    name_full character varying(200) NOT NULL,
    name_shot character varying(150),
    date_start date DEFAULT CURRENT_DATE NOT NULL,
    date_end date,
    id_r integer
);


ALTER TABLE atd.country OWNER TO nsi;

--
-- TOC entry 254 (class 1259 OID 2574188)
-- Name: country_id_country_seq; Type: SEQUENCE; Schema: atd; Owner: nsi
--

CREATE SEQUENCE atd.country_id_country_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE atd.country_id_country_seq OWNER TO nsi;

--
-- TOC entry 255 (class 1259 OID 2574189)
-- Name: dist_id_seq; Type: SEQUENCE; Schema: atd; Owner: nsi
--

CREATE SEQUENCE atd.dist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE atd.dist_id_seq OWNER TO nsi;

--
-- TOC entry 256 (class 1259 OID 2574190)
-- Name: gp_in_state; Type: VIEW; Schema: atd; Owner: nsi
--

CREATE VIEW atd.gp_in_state AS
 SELECT atd.id AS gp_id,
    atd.id_type_devis AS "DivLevel",
    atd.name_full AS gpname,
    atd.code_devision AS lgdgpcode
   FROM atd.info_area_devision atd,
    atd.link_up_down lnk,
    atd.block_in_state blk
  WHERE ((atd.id_type_devis = 4) AND (atd.date_end IS NULL) AND (lnk.id_area = atd.id) AND (lnk.id_type_link = 41) AND (lnk.id_parent_area = blk.block_id))
  ORDER BY atd.code_devision;


ALTER VIEW atd.gp_in_state OWNER TO nsi;

--
-- TOC entry 257 (class 1259 OID 2574194)
-- Name: history_dist; Type: VIEW; Schema: atd; Owner: nsi
--

CREATE VIEW atd.history_dist AS
 SELECT st.id_area AS state_id,
    st.code_devision AS "StateCode",
    st.name_full AS "StateName",
    ds.id_area AS distr_id,
    ds.code_devision AS "LGDDstCode",
    ds.name_full AS "DistrName",
    ds.name_alt AS "AltDstName",
    ds.id_type_devis,
    ln.id_type_link
   FROM ( SELECT info_area_devision.id AS id_area,
            info_area_devision.code_devision,
            info_area_devision.name_full
           FROM atd.info_area_devision
          WHERE ((info_area_devision.id_type_devis = 1) AND (info_area_devision.date_end IS NOT NULL))) st,
    ( SELECT info_area_devision.id AS id_area,
            info_area_devision.code_devision,
            info_area_devision.name_full,
            info_area_devision.name_alt,
            info_area_devision.id_type_devis,
            info_area_devision.date_end
           FROM atd.info_area_devision
          WHERE ((info_area_devision.id_type_devis = 2) AND (info_area_devision.date_end IS NOT NULL))) ds,
    atd.link_up_down ln
  WHERE ((st.id_area = ln.id_parent_area) AND (ds.id_area = ln.id_area) AND (ds.date_end IS NOT NULL) AND (ds.id_type_devis = 2) AND (st.id_area = 17))
  ORDER BY st.code_devision, ds.code_devision;


ALTER VIEW atd.history_dist OWNER TO nsi;

--
-- TOC entry 258 (class 1259 OID 2574199)
-- Name: history_block; Type: VIEW; Schema: atd; Owner: nsi
--

CREATE VIEW atd.history_block AS
 SELECT atd.id AS block_id,
    atd.id_type_devis,
    atd.name_full AS blockname,
    atd.code_devision AS lgdblkcode
   FROM atd.info_area_devision atd,
    atd.link_up_down lnk,
    atd.history_dist dst
  WHERE ((atd.id_type_devis = 3) AND (dst.id_type_devis = 2) AND (atd.date_end IS NOT NULL) AND (lnk.id_area = atd.id) AND (lnk.id_parent_area = dst.distr_id))
  ORDER BY atd.code_devision;


ALTER VIEW atd.history_block OWNER TO nsi;

--
-- TOC entry 259 (class 1259 OID 2574203)
-- Name: history_gp; Type: VIEW; Schema: atd; Owner: nsi
--

CREATE VIEW atd.history_gp AS
 SELECT atd.id AS gp_id,
    atd.id_type_devis AS "DivLevel",
    atd.name_full AS gpname,
    atd.code_devision AS lgdgpcode,
    lnk.id_type_link
   FROM atd.info_area_devision atd,
    atd.link_up_down lnk,
    atd.history_block blk
  WHERE ((atd.id_type_devis = 4) AND (atd.date_end IS NOT NULL) AND (lnk.id_area = atd.id) AND (lnk.id_type_link = 41) AND (lnk.id_parent_area = blk.block_id))
  ORDER BY atd.code_devision;


ALTER VIEW atd.history_gp OWNER TO nsi;

--
-- TOC entry 260 (class 1259 OID 2574207)
-- Name: id_country_view; Type: VIEW; Schema: atd; Owner: nsi
--

CREATE VIEW atd.id_country_view AS
 SELECT concat(((id || '.'::text) || (name_full)::text)) AS concat,
    'id'::text AS t
   FROM atd.country
  ORDER BY id;


ALTER VIEW atd.id_country_view OWNER TO nsi;

--
-- TOC entry 261 (class 1259 OID 2574211)
-- Name: id_district_view; Type: VIEW; Schema: atd; Owner: nsi
--

CREATE VIEW atd.id_district_view AS
 SELECT concat((((code_devision)::text || '.'::text) || (name_full)::text)) AS concat,
    'id'::text AS t
   FROM atd.info_area_devision
  WHERE ((id_type_devis = 2) AND (date_end IS NULL))
  ORDER BY code_devision;


ALTER VIEW atd.id_district_view OWNER TO nsi;

--
-- TOC entry 262 (class 1259 OID 2574215)
-- Name: type_devision; Type: TABLE; Schema: atd; Owner: nsi
--

CREATE TABLE atd.type_devision (
    id integer DEFAULT nextval(('atd.type_devision_id_type_devis_seq'::text)::regclass) NOT NULL,
    id_country integer NOT NULL,
    name_devis character varying(50) NOT NULL,
    description text,
    name_devis_short character varying(50)
);


ALTER TABLE atd.type_devision OWNER TO nsi;

--
-- TOC entry 7119 (class 0 OID 0)
-- Dependencies: 262
-- Name: TABLE type_devision; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON TABLE atd.type_devision IS 'Type of devision in countries';


--
-- TOC entry 7120 (class 0 OID 0)
-- Dependencies: 262
-- Name: COLUMN type_devision.id; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.type_devision.id IS 'ÏÊ çàïèñè òèïà äåëåíèÿ òåððèòîðèè';


--
-- TOC entry 7121 (class 0 OID 0)
-- Dependencies: 262
-- Name: COLUMN type_devision.id_country; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.type_devision.id_country IS 'Èäåíòèôèêàòîð ñòðàíû, â êîòîðîé ïðèìåíÿåòñÿ òåððèòîðèàëüíîå äåëåíèå';


--
-- TOC entry 7122 (class 0 OID 0)
-- Dependencies: 262
-- Name: COLUMN type_devision.name_devis; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.type_devision.name_devis IS 'Íàèìåíîâàíèå òåððèòîðèàëüíîãî äåëåíèÿ (àíãë.)';


--
-- TOC entry 7123 (class 0 OID 0)
-- Dependencies: 262
-- Name: COLUMN type_devision.description; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.type_devision.description IS 'Êðàòêîå îïèñàíèå òèïà äåëåíèÿ òåððèòîðèè (àíãë.)';


--
-- TOC entry 263 (class 1259 OID 2574221)
-- Name: id_type_devision_view; Type: VIEW; Schema: atd; Owner: nsi
--

CREATE VIEW atd.id_type_devision_view AS
 SELECT concat(((id || '.'::text) || (name_devis)::text)) AS concat,
    'id'::text AS t
   FROM atd.type_devision
  ORDER BY id;


ALTER VIEW atd.id_type_devision_view OWNER TO nsi;

--
-- TOC entry 264 (class 1259 OID 2574225)
-- Name: info_area_devision_id_area_seq; Type: SEQUENCE; Schema: atd; Owner: nsi
--

CREATE SEQUENCE atd.info_area_devision_id_area_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE atd.info_area_devision_id_area_seq OWNER TO nsi;

--
-- TOC entry 265 (class 1259 OID 2574226)
-- Name: link_up_down_id_link_seq; Type: SEQUENCE; Schema: atd; Owner: nsi
--

CREATE SEQUENCE atd.link_up_down_id_link_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE atd.link_up_down_id_link_seq OWNER TO nsi;

--
-- TOC entry 266 (class 1259 OID 2574227)
-- Name: shape_id_shape_seq; Type: SEQUENCE; Schema: atd; Owner: nsi
--

CREATE SEQUENCE atd.shape_id_shape_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE atd.shape_id_shape_seq OWNER TO nsi;

--
-- TOC entry 7124 (class 0 OID 0)
-- Dependencies: 266
-- Name: shape_id_shape_seq; Type: SEQUENCE OWNED BY; Schema: atd; Owner: nsi
--

ALTER SEQUENCE atd.shape_id_shape_seq OWNED BY atd.shape.id;


--
-- TOC entry 267 (class 1259 OID 2574228)
-- Name: state_id_seq; Type: SEQUENCE; Schema: atd; Owner: nsi
--

CREATE SEQUENCE atd.state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE atd.state_id_seq OWNER TO nsi;

--
-- TOC entry 268 (class 1259 OID 2574229)
-- Name: status_shape; Type: TABLE; Schema: atd; Owner: nsi
--

CREATE TABLE atd.status_shape (
    id integer DEFAULT nextval(('atd.status_shape_id_status_shape_seq'::text)::regclass) NOT NULL,
    name_status_shape character varying(255) NOT NULL
);


ALTER TABLE atd.status_shape OWNER TO nsi;

--
-- TOC entry 7125 (class 0 OID 0)
-- Dependencies: 268
-- Name: TABLE status_shape; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON TABLE atd.status_shape IS 'Справочник состояния/готовности границ ';


--
-- TOC entry 7126 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN status_shape.id; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.status_shape.id IS 'ПК записи типа границ';


--
-- TOC entry 7127 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN status_shape.name_status_shape; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.status_shape.name_status_shape IS 'Наименование типа готовности границ (англ.)';


--
-- TOC entry 269 (class 1259 OID 2574233)
-- Name: status_shape_id_status_shape_seq; Type: SEQUENCE; Schema: atd; Owner: nsi
--

CREATE SEQUENCE atd.status_shape_id_status_shape_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE atd.status_shape_id_status_shape_seq OWNER TO nsi;

--
-- TOC entry 270 (class 1259 OID 2574234)
-- Name: tehsil_in_state; Type: VIEW; Schema: atd; Owner: nsi
--

CREATE VIEW atd.tehsil_in_state AS
 SELECT atd.id AS tehsil_id,
    atd.id_type_devis AS "DivLevel",
    atd.name_full AS blockname,
    atd.code_devision AS lgdblkcode
   FROM atd.info_area_devision atd,
    atd.link_up_down lnk,
    atd.district_in_state dst
  WHERE ((atd.id_type_devis = 6) AND (atd.date_end IS NULL) AND (lnk.id_area = atd.id) AND (lnk.id_type_link = 2) AND (lnk.id_parent_area = dst.distr_id))
  ORDER BY atd.code_devision;


ALTER VIEW atd.tehsil_in_state OWNER TO nsi;

--
-- TOC entry 271 (class 1259 OID 2574238)
-- Name: stehsil_in_state; Type: VIEW; Schema: atd; Owner: nsi
--

CREATE VIEW atd.stehsil_in_state AS
 SELECT atd.id AS subtehsil_id,
    atd.id_type_devis AS "DivLevel",
    atd.name_full AS blockname,
    atd.code_devision AS lgdblkcode
   FROM atd.info_area_devision atd,
    atd.link_up_down lnk,
    atd.tehsil_in_state th
  WHERE ((atd.id_type_devis = 61) AND (atd.date_end IS NULL) AND (lnk.id_area = atd.id) AND (lnk.id_type_link = 21) AND (lnk.id_parent_area = th.tehsil_id))
  ORDER BY atd.code_devision;


ALTER VIEW atd.stehsil_in_state OWNER TO nsi;

--
-- TOC entry 272 (class 1259 OID 2574242)
-- Name: table_import_s_no_seq; Type: SEQUENCE; Schema: atd; Owner: nsi
--

CREATE SEQUENCE atd.table_import_s_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE atd.table_import_s_no_seq OWNER TO nsi;

--
-- TOC entry 273 (class 1259 OID 2574243)
-- Name: type_devision_id_type_devis_seq; Type: SEQUENCE; Schema: atd; Owner: nsi
--

CREATE SEQUENCE atd.type_devision_id_type_devis_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE atd.type_devision_id_type_devis_seq OWNER TO nsi;

--
-- TOC entry 274 (class 1259 OID 2574244)
-- Name: type_link; Type: TABLE; Schema: atd; Owner: nsi
--

CREATE TABLE atd.type_link (
    id integer DEFAULT nextval(('atd.type_link_id_type_link_seq'::text)::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE atd.type_link OWNER TO nsi;

--
-- TOC entry 7129 (class 0 OID 0)
-- Dependencies: 274
-- Name: TABLE type_link; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON TABLE atd.type_link IS 'Тип связи между единицами территориального деления';


--
-- TOC entry 7130 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN type_link.id; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.type_link.id IS 'Уникальный ключ';


--
-- TOC entry 7131 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN type_link.name; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.type_link.name IS 'Наименование типа связи';


--
-- TOC entry 7132 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN type_link.description; Type: COMMENT; Schema: atd; Owner: nsi
--

COMMENT ON COLUMN atd.type_link.description IS 'Описание типа связи';


--
-- TOC entry 275 (class 1259 OID 2574250)
-- Name: type_link_id_type_link_seq; Type: SEQUENCE; Schema: atd; Owner: nsi
--

CREATE SEQUENCE atd.type_link_id_type_link_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE atd.type_link_id_type_link_seq OWNER TO nsi;

--
-- TOC entry 276 (class 1259 OID 2574251)
-- Name: vil_in_state_up_distr; Type: VIEW; Schema: atd; Owner: nsi
--

CREATE VIEW atd.vil_in_state_up_distr AS
 SELECT atd.id AS vil_id,
    atd.id_type_devis AS "DivLevel",
    atd.name_full AS villname,
    atd.code_devision AS lgdvilcode
   FROM atd.info_area_devision atd,
    atd.link_up_down lnk,
    atd.district_in_state ds
  WHERE ((atd.id_type_devis = 5) AND (atd.date_end IS NULL) AND (lnk.id_area = atd.id) AND (lnk.id_type_link = 51) AND (lnk.id_parent_area = ds.distr_id))
  ORDER BY atd.code_devision;


ALTER VIEW atd.vil_in_state_up_distr OWNER TO nsi;

--
-- TOC entry 277 (class 1259 OID 2574255)
-- Name: vil_in_state_up_gp; Type: VIEW; Schema: atd; Owner: nsi
--

CREATE VIEW atd.vil_in_state_up_gp AS
 SELECT atd.id AS vil_id,
    atd.id_type_devis AS "DivLevel",
    atd.name_full AS villname,
    atd.code_devision AS lgdvilcode
   FROM atd.info_area_devision atd,
    atd.link_up_down lnk,
    atd.gp_in_state gp
  WHERE ((atd.id_type_devis = 5) AND (atd.date_end IS NULL) AND (lnk.id_area = atd.id) AND (lnk.id_type_link = 5) AND (lnk.id_parent_area = gp.gp_id))
  ORDER BY atd.code_devision;


ALTER VIEW atd.vil_in_state_up_gp OWNER TO nsi;

--
-- TOC entry 278 (class 1259 OID 2574259)
-- Name: vil_in_state_up_sth; Type: VIEW; Schema: atd; Owner: nsi
--

CREATE VIEW atd.vil_in_state_up_sth AS
 SELECT atd.id AS vil_id,
    atd.id_type_devis AS "DivLevel",
    atd.name_full AS villname,
    atd.code_devision AS lgdvilcode
   FROM atd.info_area_devision atd,
    atd.link_up_down lnk,
    atd.stehsil_in_state sth
  WHERE ((atd.id_type_devis = 5) AND (atd.date_end IS NULL) AND (lnk.id_area = atd.id) AND (lnk.id_type_link = 521) AND (lnk.id_parent_area = sth.subtehsil_id))
  ORDER BY atd.code_devision;


ALTER VIEW atd.vil_in_state_up_sth OWNER TO nsi;

--
-- TOC entry 279 (class 1259 OID 2574263)
-- Name: vil_in_state_up_th; Type: VIEW; Schema: atd; Owner: nsi
--

CREATE VIEW atd.vil_in_state_up_th AS
 SELECT atd.id AS vil_id,
    atd.id_type_devis AS "DivLevel",
    atd.name_full AS villname,
    atd.code_devision AS lgdvilcode
   FROM atd.info_area_devision atd,
    atd.link_up_down lnk,
    atd.tehsil_in_state th
  WHERE ((atd.id_type_devis = 5) AND (atd.date_end IS NULL) AND (lnk.id_area = atd.id) AND (lnk.id_type_link = 52) AND (lnk.id_parent_area = th.tehsil_id))
  ORDER BY atd.code_devision;


ALTER VIEW atd.vil_in_state_up_th OWNER TO nsi;

--
-- TOC entry 6803 (class 2604 OID 2575391)
-- Name: shape id; Type: DEFAULT; Schema: atd; Owner: nsi
--

ALTER TABLE ONLY atd.shape ALTER COLUMN id SET DEFAULT nextval('atd.shape_id_shape_seq'::regclass);


--
-- TOC entry 6817 (class 2606 OID 2590784)
-- Name: link_up_down PK_LinkUpDown; Type: CONSTRAINT; Schema: atd; Owner: nsi
--

ALTER TABLE ONLY atd.link_up_down
    ADD CONSTRAINT "PK_LinkUpDown" PRIMARY KEY (id);


--
-- TOC entry 6813 (class 2606 OID 2590786)
-- Name: info_area_devision PK_area_devision; Type: CONSTRAINT; Schema: atd; Owner: nsi
--

ALTER TABLE ONLY atd.info_area_devision
    ADD CONSTRAINT "PK_area_devision" PRIMARY KEY (id);


--
-- TOC entry 6820 (class 2606 OID 2590788)
-- Name: shape PK_id_shape; Type: CONSTRAINT; Schema: atd; Owner: nsi
--

ALTER TABLE ONLY atd.shape
    ADD CONSTRAINT "PK_id_shape" PRIMARY KEY (id);


--
-- TOC entry 6825 (class 2606 OID 2590790)
-- Name: type_devision PK_id_type_devis; Type: CONSTRAINT; Schema: atd; Owner: nsi
--

ALTER TABLE ONLY atd.type_devision
    ADD CONSTRAINT "PK_id_type_devis" PRIMARY KEY (id);


--
-- TOC entry 6827 (class 2606 OID 2590792)
-- Name: status_shape PK_status_shape; Type: CONSTRAINT; Schema: atd; Owner: nsi
--

ALTER TABLE ONLY atd.status_shape
    ADD CONSTRAINT "PK_status_shape" PRIMARY KEY (id);


--
-- TOC entry 6829 (class 2606 OID 2590794)
-- Name: type_link PK_type_link; Type: CONSTRAINT; Schema: atd; Owner: nsi
--

ALTER TABLE ONLY atd.type_link
    ADD CONSTRAINT "PK_type_link" PRIMARY KEY (id);


--
-- TOC entry 6822 (class 2606 OID 2590796)
-- Name: country PK_Страны; Type: CONSTRAINT; Schema: atd; Owner: nsi
--

ALTER TABLE ONLY atd.country
    ADD CONSTRAINT "PK_Страны" PRIMARY KEY (id);


--
-- TOC entry 6809 (class 1259 OID 2591034)
-- Name: IXFK_country_index; Type: INDEX; Schema: atd; Owner: nsi
--

CREATE INDEX "IXFK_country_index" ON atd.info_area_devision USING btree (id_country);


--
-- TOC entry 6818 (class 1259 OID 2591035)
-- Name: IXFK_id_area; Type: INDEX; Schema: atd; Owner: nsi
--

CREATE INDEX "IXFK_id_area" ON atd.shape USING btree (id_area);


--
-- TOC entry 6810 (class 1259 OID 2591036)
-- Name: IXFK_info_area_devision_status_shape; Type: INDEX; Schema: atd; Owner: nsi
--

CREATE INDEX "IXFK_info_area_devision_status_shape" ON atd.info_area_devision USING btree (id_status_shape);


--
-- TOC entry 6814 (class 1259 OID 2591037)
-- Name: IXFK_link_up_down_area; Type: INDEX; Schema: atd; Owner: nsi
--

CREATE INDEX "IXFK_link_up_down_area" ON atd.link_up_down USING btree (id_area);


--
-- TOC entry 6815 (class 1259 OID 2591038)
-- Name: IXFK_link_up_down_type_link; Type: INDEX; Schema: atd; Owner: nsi
--

CREATE INDEX "IXFK_link_up_down_type_link" ON atd.link_up_down USING btree (id_type_link);


--
-- TOC entry 6811 (class 1259 OID 2591039)
-- Name: IXFK_type_devis; Type: INDEX; Schema: atd; Owner: nsi
--

CREATE INDEX "IXFK_type_devis" ON atd.info_area_devision USING btree (id_type_devis);


--
-- TOC entry 6823 (class 1259 OID 2591040)
-- Name: IXFK_Òèï òåððèòîðèàëüíîãî äåëåíèÿ_È; Type: INDEX; Schema: atd; Owner: nsi
--

CREATE INDEX "IXFK_Òèï òåððèòîðèàëüíîãî äåëåíèÿ_È" ON atd.type_devision USING btree (id);


--
-- TOC entry 6836 (class 2606 OID 2591078)
-- Name: type_devision FK_atd_country; Type: FK CONSTRAINT; Schema: atd; Owner: nsi
--

ALTER TABLE ONLY atd.type_devision
    ADD CONSTRAINT "FK_atd_country" FOREIGN KEY (id_country) REFERENCES atd.country(id);


--
-- TOC entry 6830 (class 2606 OID 2591083)
-- Name: info_area_devision FK_country; Type: FK CONSTRAINT; Schema: atd; Owner: nsi
--

ALTER TABLE ONLY atd.info_area_devision
    ADD CONSTRAINT "FK_country" FOREIGN KEY (id_country) REFERENCES atd.country(id);


--
-- TOC entry 6835 (class 2606 OID 2591088)
-- Name: shape FK_info_area_devision; Type: FK CONSTRAINT; Schema: atd; Owner: nsi
--

ALTER TABLE ONLY atd.shape
    ADD CONSTRAINT "FK_info_area_devision" FOREIGN KEY (id_area) REFERENCES atd.info_area_devision(id);


--
-- TOC entry 6831 (class 2606 OID 2591093)
-- Name: info_area_devision FK_info_area_devision_status_shape; Type: FK CONSTRAINT; Schema: atd; Owner: nsi
--

ALTER TABLE ONLY atd.info_area_devision
    ADD CONSTRAINT "FK_info_area_devision_status_shape" FOREIGN KEY (id_status_shape) REFERENCES atd.status_shape(id);


--
-- TOC entry 6833 (class 2606 OID 2591098)
-- Name: link_up_down FK_link_up_down_area; Type: FK CONSTRAINT; Schema: atd; Owner: nsi
--

ALTER TABLE ONLY atd.link_up_down
    ADD CONSTRAINT "FK_link_up_down_area" FOREIGN KEY (id_area) REFERENCES atd.info_area_devision(id);


--
-- TOC entry 6834 (class 2606 OID 2591103)
-- Name: link_up_down FK_link_up_down_type_link; Type: FK CONSTRAINT; Schema: atd; Owner: nsi
--

ALTER TABLE ONLY atd.link_up_down
    ADD CONSTRAINT "FK_link_up_down_type_link" FOREIGN KEY (id_type_link) REFERENCES atd.type_link(id);


--
-- TOC entry 6832 (class 2606 OID 2591108)
-- Name: info_area_devision FK_type_devis; Type: FK CONSTRAINT; Schema: atd; Owner: nsi
--

ALTER TABLE ONLY atd.info_area_devision
    ADD CONSTRAINT "FK_type_devis" FOREIGN KEY (id_type_devis) REFERENCES atd.type_devision(id);


--
-- TOC entry 7128 (class 0 OID 0)
-- Dependencies: 269
-- Name: SEQUENCE status_shape_id_status_shape_seq; Type: ACL; Schema: atd; Owner: nsi
--

GRANT ALL ON SEQUENCE atd.status_shape_id_status_shape_seq TO PUBLIC;
GRANT ALL ON SEQUENCE atd.status_shape_id_status_shape_seq TO postgres;


-- Completed on 2026-02-07 15:33:19

--
-- PostgreSQL database dump complete
--

\unrestrict n08lcPVHv3G0wwFEF8fWQlbm4eXAWWifKZ708YAHjwyO5tHTg0w3lrplP8Yy5tm

