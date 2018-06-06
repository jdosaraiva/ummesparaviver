--
-- PostgreSQL database dump
--

-- Dumped from database version 10.2
-- Dumped by pg_dump version 10.2

-- Started on 2018-05-31 13:53:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 32771)
-- Name: tcontroleemail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tcontroleemail (
    id bigint NOT NULL,
    codigoinscrito bigint NOT NULL,
    tipo smallint NOT NULL
);


ALTER TABLE tcontroleemail OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 32769)
-- Name: tcontroleemail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tcontroleemail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tcontroleemail_id_seq OWNER TO postgres;

--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 196
-- Name: tcontroleemail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tcontroleemail_id_seq OWNED BY tcontroleemail.id;


--
-- TOC entry 198 (class 1259 OID 32778)
-- Name: tdiasemana; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tdiasemana (
    id smallint NOT NULL,
    nome character(20) NOT NULL
);


ALTER TABLE tdiasemana OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 32835)
-- Name: tdiasemana_facilhosp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tdiasemana_facilhosp (
    iddiasemana smallint NOT NULL,
    idfacilhosp bigint NOT NULL
);


ALTER TABLE tdiasemana_facilhosp OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 32790)
-- Name: tfacilhosp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tfacilhosp (
    id bigint NOT NULL,
    nome character(50) NOT NULL,
    numfuncao smallint NOT NULL,
    grupooutro character(30) DEFAULT NULL::bpchar,
    endereco character(100) DEFAULT NULL::bpchar,
    complemento character(30) DEFAULT NULL::bpchar,
    bairro character(30) DEFAULT NULL::bpchar,
    cidade character(30) DEFAULT NULL::bpchar,
    cep character(10) DEFAULT NULL::bpchar,
    telefoneres character(15) DEFAULT NULL::bpchar,
    telefonecom character(15) DEFAULT NULL::bpchar,
    telefonecel character(15) DEFAULT NULL::bpchar,
    email character(100) DEFAULT NULL::bpchar,
    membro bit(1) NOT NULL,
    qtdeadultos smallint,
    qtdecriancas smallint,
    obs character(200) DEFAULT NULL::bpchar,
    statusregistro character(1) NOT NULL,
    datacadastro timestamp without time zone,
    origeminfo character(20) DEFAULT NULL::bpchar
);


ALTER TABLE tfacilhosp OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 32788)
-- Name: tfacilhosp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tfacilhosp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tfacilhosp_id_seq OWNER TO postgres;

--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 200
-- Name: tfacilhosp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tfacilhosp_id_seq OWNED BY tfacilhosp.id;


--
-- TOC entry 199 (class 1259 OID 32783)
-- Name: tfuncao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tfuncao (
    id smallint NOT NULL,
    nome character(20) NOT NULL
);


ALTER TABLE tfuncao OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 32902)
-- Name: tgrupo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tgrupo (
    id bigint NOT NULL,
    codigofac bigint NOT NULL,
    codigohosp bigint NOT NULL,
    diasemana smallint NOT NULL,
    horario smallint NOT NULL,
    tipogrupo smallint NOT NULL,
    grupooutro character(30) DEFAULT NULL::bpchar,
    qtdemaxima bigint NOT NULL,
    status character(1) DEFAULT 'F'::bpchar
);


ALTER TABLE tgrupo OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 32900)
-- Name: tgrupo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tgrupo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tgrupo_id_seq OWNER TO postgres;

--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 205
-- Name: tgrupo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tgrupo_id_seq OWNED BY tgrupo.id;


--
-- TOC entry 203 (class 1259 OID 32850)
-- Name: thorario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE thorario (
    id smallint NOT NULL,
    nome character(20) NOT NULL
);


ALTER TABLE thorario OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 32940)
-- Name: thorario_facilhosp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE thorario_facilhosp (
    idhorario smallint NOT NULL,
    idfacilhosp bigint NOT NULL
);


ALTER TABLE thorario_facilhosp OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 32964)
-- Name: tparticipante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tparticipante (
    id bigint NOT NULL,
    codigogrupo bigint NOT NULL,
    nome character(50) NOT NULL,
    email character(100) DEFAULT NULL::bpchar,
    telefone character(15) DEFAULT NULL::bpchar,
    outrotelefone character(15) DEFAULT NULL::bpchar,
    datacadastro timestamp without time zone,
    qtdecriancas integer
);


ALTER TABLE tparticipante OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 32962)
-- Name: tparticipante_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tparticipante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tparticipante_id_seq OWNER TO postgres;

--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 208
-- Name: tparticipante_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tparticipante_id_seq OWNED BY tparticipante.id;


--
-- TOC entry 210 (class 1259 OID 32976)
-- Name: trole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE trole (
    codigo character(15) NOT NULL,
    descricao character(15) NOT NULL
);


ALTER TABLE trole OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 32855)
-- Name: ttipogrupo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ttipogrupo (
    id smallint NOT NULL,
    nome character(20) NOT NULL
);


ALTER TABLE ttipogrupo OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 32981)
-- Name: ttipogrupo_facilhosp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ttipogrupo_facilhosp (
    idtipogrupo integer NOT NULL,
    idfacilhosp bigint NOT NULL
);


ALTER TABLE ttipogrupo_facilhosp OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 32996)
-- Name: tusuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tusuario (
    login character(15) NOT NULL,
    nome character(50) DEFAULT NULL::bpchar,
    senha character(15) NOT NULL,
    idfacilhosp bigint
);


ALTER TABLE tusuario OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 33019)
-- Name: tusuariorole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tusuariorole (
    loginusuario character(15) NOT NULL,
    codigorole character(15) DEFAULT NULL::bpchar
);


ALTER TABLE tusuariorole OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 33035)
-- Name: vw_facil; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vw_facil AS
 SELECT tfacilhosp.id,
    tfacilhosp.nome,
    tfacilhosp.numfuncao,
    tfacilhosp.grupooutro,
    tfacilhosp.endereco,
    tfacilhosp.complemento,
    tfacilhosp.bairro,
    tfacilhosp.cidade,
    tfacilhosp.cep,
    tfacilhosp.telefoneres,
    tfacilhosp.telefonecom,
    tfacilhosp.telefonecel,
    tfacilhosp.email,
    tfacilhosp.membro,
    tfacilhosp.qtdeadultos,
    tfacilhosp.qtdecriancas,
    tfacilhosp.obs,
    tfacilhosp.statusregistro,
    tfacilhosp.datacadastro,
    tfacilhosp.origeminfo
   FROM tfacilhosp
  WHERE (tfacilhosp.numfuncao = ANY (ARRAY[1, 99]));


ALTER TABLE vw_facil OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 33040)
-- Name: vw_hosp; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vw_hosp AS
 SELECT tfacilhosp.id,
    tfacilhosp.nome,
    tfacilhosp.numfuncao,
    tfacilhosp.grupooutro,
    tfacilhosp.endereco,
    tfacilhosp.complemento,
    tfacilhosp.bairro,
    tfacilhosp.cidade,
    tfacilhosp.cep,
    tfacilhosp.telefoneres,
    tfacilhosp.telefonecom,
    tfacilhosp.telefonecel,
    tfacilhosp.email,
    tfacilhosp.membro,
    tfacilhosp.qtdeadultos,
    tfacilhosp.qtdecriancas,
    tfacilhosp.obs,
    tfacilhosp.statusregistro,
    tfacilhosp.datacadastro,
    tfacilhosp.origeminfo
   FROM tfacilhosp
  WHERE (tfacilhosp.numfuncao = ANY (ARRAY[2, 99]));


ALTER TABLE vw_hosp OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 33045)
-- Name: vw_grupo_qtde; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vw_grupo_qtde AS
 SELECT t1.id AS "Id Grupo",
    t7.nome AS "Facilitador(Função)",
    upper((t2.nome)::text) AS "Facilitador",
    upper((t3.nome)::text) AS "Hospedeiro",
    t4.nome AS "Dia da Semana",
    t5.nome AS "Horário",
    t6.nome AS "Tipo",
    t1.qtdemaxima AS "Quantidade Pessoas",
    t2.email AS "Facilidador(Email)",
    t2.telefoneres AS "Facilitador(Tel Res)",
    t2.telefonecom AS "Facilitador(Tel Com)",
    t2.telefonecel AS "Facilitador(Tel Cel)",
    t3.email AS "Hospedeiro(Email)",
    t3.telefoneres AS "Hospedeiro(Tel Res)",
    t3.telefonecom AS "Hospedeiro(Tel Com)",
    t3.telefonecel AS "Hospedeiro(Tel Cel)",
    t3.qtdeadultos AS "Hospedeiro(Qtde Adultos)",
    upper((t3.endereco)::text) AS "Endereço",
    upper((t3.bairro)::text) AS "Bairro",
    upper((t3.cidade)::text) AS "Cidade",
    ( SELECT count(0) AS count
           FROM tparticipante
          WHERE (tparticipante.codigogrupo = t1.id)) AS "QTDE INSCRITOS"
   FROM ((((((tgrupo t1
     JOIN vw_facil t2 ON ((t1.codigofac = t2.id)))
     JOIN vw_hosp t3 ON ((t1.codigohosp = t3.id)))
     JOIN tdiasemana t4 ON ((t1.diasemana = t4.id)))
     JOIN thorario t5 ON ((t1.horario = t5.id)))
     JOIN ttipogrupo t6 ON ((t1.tipogrupo = t6.id)))
     JOIN tfuncao t7 ON ((t2.numfuncao = t7.id)))
  ORDER BY t1.id;


ALTER TABLE vw_grupo_qtde OWNER TO postgres;

--
-- TOC entry 2741 (class 2604 OID 32774)
-- Name: tcontroleemail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tcontroleemail ALTER COLUMN id SET DEFAULT nextval('tcontroleemail_id_seq'::regclass);


--
-- TOC entry 2742 (class 2604 OID 32793)
-- Name: tfacilhosp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tfacilhosp ALTER COLUMN id SET DEFAULT nextval('tfacilhosp_id_seq'::regclass);


--
-- TOC entry 2755 (class 2604 OID 32905)
-- Name: tgrupo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tgrupo ALTER COLUMN id SET DEFAULT nextval('tgrupo_id_seq'::regclass);


--
-- TOC entry 2758 (class 2604 OID 32967)
-- Name: tparticipante id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tparticipante ALTER COLUMN id SET DEFAULT nextval('tparticipante_id_seq'::regclass);


--
-- TOC entry 2939 (class 0 OID 32771)
-- Dependencies: 197
-- Data for Name: tcontroleemail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tcontroleemail (id, codigoinscrito, tipo) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 32778)
-- Dependencies: 198
-- Data for Name: tdiasemana; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tdiasemana (id, nome) FROM stdin;
1	Domingo             
2	Segunda             
3	Terça               
4	Quarta              
5	Quinta              
6	Sexta               
7	Sábado              
9	INDEFINIDO          
\.


--
-- TOC entry 2944 (class 0 OID 32835)
-- Dependencies: 202
-- Data for Name: tdiasemana_facilhosp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tdiasemana_facilhosp (iddiasemana, idfacilhosp) FROM stdin;
6	1
7	1
5	2
6	4
6	5
4	6
4	7
2	8
3	8
5	8
3	9
3	10
5	10
6	10
2	11
3	12
5	12
4	13
7	15
2	17
3	17
5	17
6	17
7	18
4	19
1	20
6	21
7	22
2	23
4	25
6	27
6	28
2	29
7	29
6	30
4	31
1	32
2	32
3	32
4	32
5	32
6	32
7	32
6	33
3	34
5	35
5	36
4	37
6	38
2	39
3	39
4	39
5	39
6	39
4	40
7	41
4	42
1	43
2	43
3	43
4	43
5	43
6	43
7	43
3	45
5	45
6	46
1	47
2	47
3	47
4	47
5	47
6	47
7	47
6	48
2	49
6	49
2	50
3	51
5	51
3	52
3	54
2	55
3	55
4	55
5	55
3	56
3	57
1	59
3	59
4	59
5	59
6	59
7	59
4	60
2	61
3	61
1	62
2	62
3	62
4	62
5	62
6	62
7	62
1	63
2	63
3	63
4	63
5	63
6	63
7	63
3	64
1	65
2	65
3	65
4	65
5	65
6	65
7	65
3	66
3	68
4	69
4	70
4	72
5	72
5	73
5	74
6	74
4	75
4	76
6	76
4	77
6	77
4	78
5	79
5	80
6	80
5	81
5	82
6	82
5	83
1	84
2	84
3	84
4	84
5	84
6	84
7	84
5	85
5	86
5	87
5	88
5	89
1	90
2	90
3	90
4	90
5	90
6	90
7	90
3	92
5	94
3	95
4	95
6	95
7	95
2	96
6	96
6	97
7	99
7	100
7	101
7	102
5	103
5	104
7	104
2	105
3	105
4	105
5	105
2	106
1	106
1	107
7	107
7	108
1	108
5	109
6	522
6	523
7	524
3	525
2	526
6	526
3	527
5	528
5	529
6	530
6	531
4	532
3	533
7	534
7	535
5	536
5	537
6	538
6	539
5	540
5	541
5	542
5	543
6	544
4	545
6	546
6	547
4	548
7	549
6	550
7	551
6	552
5	553
5	554
7	555
6	556
5	557
5	558
6	559
6	560
5	561
5	562
5	563
5	564
6	565
6	566
5	567
6	568
6	569
5	570
6	571
6	572
6	573
6	574
2	575
2	576
5	577
6	578
6	579
6	580
7	581
7	582
6	583
5	584
5	585
5	586
5	587
6	588
3	589
3	590
6	591
6	592
\.


--
-- TOC entry 2943 (class 0 OID 32790)
-- Dependencies: 201
-- Data for Name: tfacilhosp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tfacilhosp (id, nome, numfuncao, grupooutro, endereco, complemento, bairro, cidade, cep, telefoneres, telefonecom, telefonecel, email, membro, qtdeadultos, qtdecriancas, obs, statusregistro, datacadastro, origeminfo) FROM stdin;
1	Adriana e Reginaldo Chagas                        	99	\N	Rua das Violetas, 165                                                                               	\N	Fazendinha                    	Cotia                         	06355-550 	4169-5187      	               	9962-7524      	reginaldo_chagas@uol.com.br                                                                         	1	10	0	                                                                                                                                                                                                        	P	\N	\N
2	Alexandre Gaffo                                   	99	\N	Av. Prof. Jose Maria Alkimin, 764                                                                   	\N	Rio Pequeno                   	São Paulo                     	05366-000 	3719-1954      	               	8755-6868      	alexandregaffo@terra.com.br                                                                         	1	10	0	Domingo 10:30                                                                                                                                                                                           	P	\N	\N
3	Amilton Correa de Azevedo                         	99	\N	Av. Dona Cherubiana Vianna, 1306                                                                    	\N	Vila Santo Antonio            	Granja Viana                  	06708-360 	4777-9368      	4778-0299      	8899-6776      	amilton@allcancy.com.br                                                                             	1	0	0	                                                                                                                                                                                                        	P	\N	\N
4	André Luis Serafim                                	99	\N	Rua José Hemeterio de Medeiros                                                                      	\N	Jd novo Osasco                	Osasco                        	06142-120 	3591-0232      	               	9819-0556      	alst.serafim@gmail.com                                                                              	1	6	0	                                                                                                                                                                                                        	P	\N	\N
5	Cláudia Maria Rosa                                	99	\N	R. Dr. Edmundo José de Lima, 139                                                                    	\N	Rio Pequeno                   	São Paulo                     	05366-100 	3731-5449      	               	9537-9535      	claudiarosa200@hotmail.com                                                                          	1	8	0	                                                                                                                                                                                                        	P	\N	\N
6	Decio Mazagão Garcia                              	99	\N	Alameda Suecia 537                                                                                  	\N	Alphaville                    	Barueri                       	06474-230 	4195-6261      	3215-7000      	9601-0089      	deciogarcia@gmail.com                                                                               	1	20	0	s/ crianças                                                                                                                                                                                             	P	\N	\N
7	Dilce Rodrigues Naletto                           	99	\N	R. Iquiririm, 130 Ap. 43                                                                            	\N	Butantã                       	São Paulo                     	05586-000 	3726-1917      	               	8367-9211      	drnaletto@uol.com.br                                                                                	1	5	0	Grupos de senhoras                                                                                                                                                                                      	P	\N	\N
8	Elaine Cristina Damaceno                          	99	\N	R. Coqueiro, 112                                                                                    	\N	Cidade das Flores             	Osasco                        	06184-080 	3695-5779      	               	9561-1365      	elainecdam@hotmail.com                                                                              	1	10	0	                                                                                                                                                                                                        	P	\N	\N
9	Eliana Dias de Oliveira                           	99	\N	R. Gal. Brasilio Taborda, 224                                                                       	\N	Butantã                       	São Paulo                     	          	3542-8710      	               	9585-8343      	e9669p@yahoo.com.br                                                                                 	1	10	0	s/ crianças                                                                                                                                                                                             	P	\N	\N
10	Eliane Sukerth Pantalena                          	99	\N	Al. do Porto, 164                                                                                   	\N	Alphavilhe                    	Barueri                       	06473-072 	4195-3162      	               	7398-2727      	pantalena@mackenzie.com.br                                                                          	1	12	0	S/limite crianças - 10a                                                                                                                                                                                 	P	\N	\N
11	Elmano Antonio de Oliveira Santos                 	99	\N	R. Milton Soares 215, bl 5 ap 85                                                                    	\N	Rio Pequeno                   	São Paulo                     	05382-010 	               	               	8955-5329      	elmanoa@me.com                                                                                      	1	6	0	                                                                                                                                                                                                        	P	\N	\N
12	Elmary Santos Bruschi                             	99	\N	R. Sândalo, 37                                                                                      	\N	Cidade das Flores             	Osasco                        	06184-270 	3608-0225      	               	8058-7599      	ca.bruschi@gmail.com                                                                                	1	7	3	                                                                                                                                                                                                        	P	\N	\N
13	Estefan e Elzira Kiss                             	99	\N	R. Giacomo Carissimi, 138                                                                           	\N	Jd Adalgiza                   	São Paulo                     	05386-120 	4306-8232      	               	               	elzira.kiss@gmail.com                                                                               	1	10	0	                                                                                                                                                                                                        	P	\N	\N
14	Felipe Andrade Santos                             	99	\N	Av. Agenor Couto de Magalhães, 222 Apt. 502-A                                                       	\N	Pirituba                      	São Paulo                     	          	3534-1563      	4199-4324      	7613-5833      	felipeandrades@gmail.com                                                                            	1	10	55	                                                                                                                                                                                                        	P	\N	\N
15	Geraldo Luiz da Silva                             	99	\N	R. Cajamar, 125 - Pq. Bandeirantes                                                                  	\N	Vl Menk                       	Osasco                        	06268-070 	3601-2091      	2464-8243      	7028-4241      	geraldoluizd@yahoo.com.br                                                                           	1	15	5	Veio da 4 Igr. de Osasco                                                                                                                                                                                	P	\N	\N
16	Gilberto D. Ribeiro Jr                            	99	\N	Av. Eduardo Amaral, 3935 bl 16 ap 121                                                               	\N	Jd. Piratininga               	Osasco                        	06230-150 	               	3915-8958      	5458-8798      	gilberto.junior1108@gmail.com                                                                       	1	0	0	                                                                                                                                                                                                        	P	\N	\N
17	Gina Atanasov de Godoy                            	99	\N	R. Jose Ferreira Kiffer, 37                                                                         	\N	Pq. Continental               	São Paulo                     	          	4328-2404      	               	6617-9494      	ginaatanasovgodoy@gmail.com                                                                         	1	10	0	                                                                                                                                                                                                        	P	\N	\N
18	Guilherme e Cintia Silva                          	99	\N	R. Adão Gonçalves da Costa, 75                                                                      	\N	Jd. Jussara                   	Carapicuiba                   	06321-040 	4167-5362      	               	8034-7228      	cghair@terra.com.br                                                                                 	1	20	0	                                                                                                                                                                                                        	P	\N	\N
19	Isabel Cristina Medeiros da Silva                 	99	\N	R. Prof. Gioconda Mussolini, 12 Apt. 42                                                             	\N	Butantã                       	São Paulo                     	05587-120 	               	               	8202-0805      	bel.medeiros@yahoo.com.br                                                                           	1	12	0	Já estão no grupo 7 pessoas                                                                                                                                                                             	P	\N	\N
20	Janir Ferreira dos Santos                         	99	\N	Av. Washington Luis, 153                                                                            	\N	Quitauna                      	Osasco                        	06182-290 	3608-0522      	               	9990-0155      	valfios@itelefonica.com.br                                                                          	1	20	0	                                                                                                                                                                                                        	P	\N	\N
21	Jenny Abanto Alvarez                              	99	\N	R. Paranauçu, 94                                                                                    	\N	Jaguaré                       	São Paulo                     	05335-030 	2819-8683      	               	8192-4675      	jein11@hotmail.com                                                                                  	1	20	0	                                                                                                                                                                                                        	P	\N	\N
22	Jorge Pacheco Furtado                             	99	\N	R. São Luiz, 253                                                                                    	\N	Rochdale                      	Osasco                        	06226-210 	3448-5039      	2198-9191      	9259-6423      	pr.jfurtado@gmail.com                                                                               	1	10	0	                                                                                                                                                                                                        	P	\N	\N
23	José Márcio Gonçalves e Cinara                    	99	\N	R. da Fraternidade, 53 (ao lado do 477)                                                             	\N	Jd. Oriental                  	São Paulo                     	06033-110 	3692-3547      	5029-3377      	7856-8089      	jose.marcio@itau-unibanco.com.br                                                                    	1	15	6	                                                                                                                                                                                                        	P	\N	\N
24	Kaio Julio Cesar Pezzutti                         	99	\N	Rua André Fernandes , 97                                                                            	\N	Centro                        	Santana de Parnaiba           	06501-50  	7597-7723      	               	7597-5843      	kaiopezzutti@yahoo.com.br                                                                           	1	0	0	                                                                                                                                                                                                        	P	\N	\N
25	Lindalva de Abreu                                 	99	\N	R. Ibitinga, 65                                                                                     	\N	Cohab                         	Carapicuiba                   	06326-400 	4187-5489      	               	8543-8748      	lindalva-abreu@ig.com.br                                                                            	1	10	0	Já tem 4 participantes além dela.                                                                                                                                                                       	P	\N	\N
26	Luciano Mello                                     	99	\N	R. João Del Porto, 47                                                                               	\N	Jd Suiná                      	Taboão da Serra               	06773-080 	4139-7439      	               	6746-8782      	pe.dalando.cicloturismo@gmail.com                                                                   	1	0	0	                                                                                                                                                                                                        	P	\N	\N
27	Luis Carlos de Oliveira e Valquiria               	99	\N	R. Jardim, 20                                                                                       	\N	Jd das Flores                 	Osasco                        	06120-180 	3699-1864      	               	9246-6198      	luisoliveira@usp.br                                                                                 	1	16	0	Sistema de rodizio de casas                                                                                                                                                                             	P	\N	\N
28	Marcelo e Tatiane Orsoni                          	99	\N	R. Dr. Manoel Paiva Ramos, 95 ap 83 B                                                               	\N	Vl. São Francisco             	São Paulo                     	05331-015 	3835-8131      	3699-0082      	8959-7754      	barros.tatiane@gmail.com                                                                            	1	12	0	Domingo - manhã                                                                                                                                                                                         	P	\N	\N
29	Marcelo Marques                                   	99	\N	Av. Marco Penteado Ulchoa Rodrigues, 4446 Ap. 63 - Bl 4                                             	\N	Tamboré                       	Barueri                       	06543-001 	2424-7228      	7397-7481      	6831-1663      	marques087@gmail.com                                                                                	1	15	5	                                                                                                                                                                                                        	P	\N	\N
30	Marcio Alves de Lara                              	99	\N	Av. Eng Antonio Eiras Garcia, 79 apto 62 C                                                          	\N	Butantã                       	São Paulo                     	05588-000 	2371-4441      	3718-5303      	9523-3389      	marcio.lara@brasilfoods.com                                                                         	1	8	0	                                                                                                                                                                                                        	P	\N	\N
31	Marcos Maurício Ferro Ferreira                    	99	\N	Av. Padre Vicente Melillo 953 - Apt. 72-A                                                           	\N	Umuarama                      	Osasco                        	06036-013 	               	3684-2312      	9624-5061      	ferreira.marcosmf@gmail.com                                                                         	1	12	0	Gp de jovens casados - rodízio nas casas                                                                                                                                                                	P	\N	\N
32	Maria das Graças Silva Araujo                     	99	\N	Rua Judite França Costa, 144 cs 2                                                                   	\N	Jd. Bonfiglioli               	São Paulo                     	05592-040 	2503-2910      	               	8408-0219      	mgracas.araujo@gmail.com                                                                            	1	10	0	                                                                                                                                                                                                        	P	\N	\N
33	Maria Terezinha Barreto Palma                     	99	\N	Av. Prof. José Maria Alkimin                                                                        	\N	Rio Pequeno                   	São Paulo                     	05366-000 	3735-0858      	               	8905-4680      	                                                                                                    	1	7	0	                                                                                                                                                                                                        	P	\N	\N
34	Nanci Fanti Pata Avila                            	99	\N	R. Das Academias, 81                                                                                	\N	Cidade Universitaria          	São Paulo                     	05359-170 	3731-4059      	3061-7136      	9652-0977      	nanci-avila@bol.com.br                                                                              	1	10	3	                                                                                                                                                                                                        	P	\N	\N
35	Norma de Lima Ferreira de Jesus                   	99	\N	Rua Dr. Wladimir do Amaral, 286                                                                     	\N	Butantã                       	São Paulo                     	05535-070 	3721-6596      	2504-5781      	8367-3928      	nifj@uol.com.br                                                                                     	1	20	0	                                                                                                                                                                                                        	P	\N	\N
36	Orlando Miniguini                                 	99	\N	R. Tipoanas, 109                                                                                    	\N	Fazendinha                    	Cotia                         	06352-040 	41698138       	               	9485-6406      	propart@bol.com.br                                                                                  	1	10	0	                                                                                                                                                                                                        	P	\N	\N
37	Renato Prazeres Pereira dos Santos                	99	\N	Av. Estados Unidos - Cond. Innova São Francisco, Apt. 176                                           	\N	Jd. Adalgisa                  	Osasco                        	06030-210 	               	9766-0777      	9613-8344      	natoprazeres@gmail.com                                                                              	1	6	0	                                                                                                                                                                                                        	P	\N	\N
38	Ricardo de Mendonça da Silva                      	99	\N	R. Quitanduba, 310 apto 45                                                                          	\N	Caxingui                      	São Paulo                     	05516-030 	2805-8416      	3158-1038      	8925-9038 / 664	rmendoncas@hotmail.com                                                                              	1	10	4	                                                                                                                                                                                                        	P	\N	\N
39	Rodrigo Tostes Lavoura                            	99	\N	Rua Bartolomeu Bon, 300 - apto. 12C                                                                 	\N	Km 15 da Raposo               	São Paulo                     	05528-200 	2828-3179      	3677-4464      	8690-0679      	rodrigolavoura@yahoo.com.br                                                                         	1	15	5	                                                                                                                                                                                                        	P	\N	\N
40	Samarone Lins Lessa                               	99	\N	R. Pardinho, 298                                                                                    	\N	Munhoz Jr.                    	Osasco                        	06240-010 	3602-1479      	7771-3121      	7538-4200      	linslessa@yahoo.com.br                                                                              	1	8	8	                                                                                                                                                                                                        	P	\N	\N
41	Samir Pereira de Moraes                           	99	\N	Av. João de Papa, 55 apto 123                                                                       	\N	IAPI                          	Osasco                        	06236-020 	3656-3040      	               	7259-0856      	racsamoraes@terra.com.br                                                                            	1	8	0	                                                                                                                                                                                                        	P	\N	\N
42	Sebastião Benedito Mendonça                       	99	\N	R. Dr. Aires Martins Torres, 180 Apt. 33                                                            	\N	Vl São Francisco              	São Paulo                     	05352-060 	3609-8763      	               	9365-1556      	sb.mendonca@hotmail.com                                                                             	1	12	6	                                                                                                                                                                                                        	P	\N	\N
43	Valerie Gill de Abreu                             	99	\N	R. David Eid, 849 apto 151                                                                          	\N	Interlagos                    	São Paulo                     	04438-000 	2367-2232      	               	7111-2232      	val@sepal.org.br                                                                                    	1	15	0	                                                                                                                                                                                                        	P	\N	\N
44	Wilson e Maria José da S. Alvarinho               	99	\N	Av. Prof. José Alkimin, 960                                                                         	\N	Jd. Esther                    	São Paulo                     	05366-000 	5841-8988      	               	9155-9033      	wsalvarinho@ig.com.br                                                                               	1	10	0	                                                                                                                                                                                                        	P	\N	\N
45	Wilson Versolato                                  	99	\N	Rua Maracatu, 448 - casa 20                                                                         	\N	Chacara Cantagalo             	Cotia                         	06711-340 	4702-7900      	9642-7273      	9642-7273      	patricia.herrera@wpgb.com.br                                                                        	1	12	0	                                                                                                                                                                                                        	P	\N	\N
46	Zelandia Prates de A. Ishida                      	99	\N	R. Tomas Gonçalves, 148                                                                             	\N	Vl Gomes                      	Sao Paulo                     	05590-030 	2476-2290      	               	9439-4583      	zelandia.ishida@gmail.com                                                                           	1	10	0	Grupo com mulheres casadas                                                                                                                                                                              	P	\N	\N
47	Angelo Marques                                    	1	\N	Rua das Camelias, 369                                                                               	\N	Pq. Assunção                  	Taboão da Serra               	06754-110 	4787-7738      	3478-6900      	9543-4044      	angelo.marques@bol.com.br                                                                           	1	15	0	                                                                                                                                                                                                        	P	\N	\N
48	Emilene Ledres Lima e Luciano                     	2	\N	R. Sueli Coelho Geraldo, 55                                                                         	\N	Jd. Trianon                   	Taboão da Serra               	          	3813-1466      	               	8316-4896      	emileneledres@hotmail.com                                                                           	1	10	4	Incluir no grupo do Angelo                                                                                                                                                                              	P	\N	\N
49	Daniel Colella Pinter                             	2	\N	R. Irineu Salvador Pinto, 142                                                                       	\N	Jd. Esther                    	São Paulo                     	05374-130 	3763-4263      	               	8805-2537      	adriana_teixeira2004@ig.com.br                                                                      	1	20	0	Domingo pela manhã                                                                                                                                                                                      	P	\N	\N
50	Érika Frison Bertozzi Leite                       	1	\N	Av. Escola Politécnica, 2200 - Itália 4                                                             	\N	Rio Pequeno                   	São Paulo                     	05350-000 	3535-5023      	8771-6568      	6753-8461      	erika.fb@gmail.com                                                                                  	1	0	0	                                                                                                                                                                                                        	P	\N	\N
51	Paulo Luis e Claudia Cristiane                    	1	\N	R. Gestão do Rego Monteiro, 666 - Apt. 64                                                           	\N	Jd. Bonfiglioli               	São Paulo                     	05594-030 	3735-8717      	3766-3340      	9909-7735      	pcgandara@ig.com.br                                                                                 	1	0	0	                                                                                                                                                                                                        	P	\N	\N
52	Maria Perpétuo S. de A. S. Moreira                	2	\N	Rua Nitemar Vasconcelos, 133                                                                        	\N	Jd. Bonfiglioli               	São Paulo                     	05595-020 	3731-8286      	               	8174-7606      	perpetuo55@hotmail.com                                                                              	1	15	5	                                                                                                                                                                                                        	P	\N	\N
53	Alexandre Ogeda Ramalho                           	1	\N	R. Inacio Manuel Alvares, 80 ap 32 B                                                                	\N	Jd. Esther                    	São Paulo                     	05372-110 	3782-6159      	3713-3724      	9454-0563      	alexandre_vb30@hotmail.com                                                                          	1	0	0	                                                                                                                                                                                                        	P	\N	\N
54	Claudice Lima da Silva                            	2	\N	Calçada das Violetas, 173                                                                           	\N	Alphaville                    	Barueri                       	          	4191-8119      	               	8115-5185      	clau-lins@hotmail.com                                                                               	1	20	0	                                                                                                                                                                                                        	P	\N	\N
55	Hozanias Correia Santos                           	1	\N	Rua Alha Elias Abide, 78                                                                            	\N	Pq. Dos Principes             	Osasco                        	06030-300 	3609-6942      	3608-1804      	7895-3664      	correia@bendflex.com.br                                                                             	1	0	0	                                                                                                                                                                                                        	P	\N	\N
56	Maria José de O. Palheta                          	2	\N	R. Cunha Matos, 153                                                                                 	\N	Rio Pequeno                   	São Paulo                     	          	3782-1637      	3014-5212      	5237-9583      	maria.palheta@sa.cushwake.com                                                                       	1	10	0	                                                                                                                                                                                                        	P	\N	\N
57	Luiz Sakamoto                                     	2	\N	R. Rosa, 52                                                                                         	\N	Jd. das Flores                	Osasco                        	06112-130 	4620-0433      	2174-8323      	8504-0288      	lnsakamoto@gmail.com                                                                                	1	8	0	Ricardo será facilitador                                                                                                                                                                                	P	\N	\N
58	Ricardo Martins de Oliveira                       	1	\N	Av. José Joaquim Seabra, 759 - Apt. 21                                                              	\N	Rio Pequeno                   	São Paulo                     	05364-000 	3768-3940      	               	9615-6391      	rmaroli@hotmail.com                                                                                 	1	6	0	H- Luiz e Alba Sakamoto                                                                                                                                                                                 	P	\N	\N
59	Flávia Serafim L. Silva                           	2	\N	R. Dr. Hélio Fidelis, 152 Ap. 24 G                                                                  	\N	Vl. São Francisco             	Sao Paulo                     	05351-035 	4306-5397      	               	7887-5447      	aisilva@oi.com.br                                                                                   	1	20	5	preferência crianças 4 a 8a                                                                                                                                                                             	P	\N	\N
60	Sérgio Vitorini                                   	1	\N	R. Carolina Nabuco, 30 cs 14                                                                        	\N	Jd. Esther                    	São Paulo                     	05372-070 	3782-6148      	3785-1001      	9997-1507      	sergio@sreletronica.com.br                                                                          	1	0	0	                                                                                                                                                                                                        	P	\N	\N
61	André Rojas de Moura Guilherme                    	1	\N	Rua Dolores Duran, 225                                                                              	\N	Jd. Santo Onofre              	Taboão da Serra               	06785-190 	4138-4486      	               	8499-8560      	andrermoura@gmail.com                                                                               	1	0	0	                                                                                                                                                                                                        	P	\N	\N
62	Marcelo Crocelli                                  	2	\N	R. Ivar Bekhman, 65                                                                                 	\N	Campo Limpo                   	São Paulo                     	05788-420 	5844-6459      	5841-3054      	7448-7088      	marcelo.crocelli768@gmail.com                                                                       	1	30	10	Próximo Taboão da Serra, Morumbi                                                                                                                                                                        	P	\N	\N
63	Jesiel de Vanconcelos Pascoal                     	2	\N	Av. Edmundo Amaral, 3935 Bl 1 Ap. 53                                                                	\N	Jd. Piratininga               	Osasco                        	06230-150 	3549-2396      	7071-6140      	6283-7784      	jesiel_vasconcelos@hotmail.com                                                                      	1	10	0	                                                                                                                                                                                                        	P	\N	\N
64	José Maurício da Silva                            	1	\N	Av. Comandante Sampaio, 755                                                                         	\N	km 18                         	Osasco                        	06192-010 	3607-2825      	2884-5563      	6204-8285      	mauricioeliza@uol.com.br                                                                            	1	8	4	                                                                                                                                                                                                        	P	\N	\N
65	Angela Cristina Santos Mariano                    	2	\N	R. Dácio Aguiar de Moraes, 50                                                                       	\N	Butanta                       	São Paulo                     	05589-040 	3777-4328      	               	9345-1889      	amariano60@gmail.com                                                                                	1	10	0	                                                                                                                                                                                                        	P	\N	\N
66	Jéba e Clau                                       	1	\N	Av. Edmundo Amaral, 130 - Bl 3 Apt. 23                                                              	\N	Jd. Piratininga               	Osasco                        	06230-150 	4325-7081      	4163-6064      	9332-0206      	jeba_revolucao@ig.com.br                                                                            	1	0	0	Gegê de 4a, casais c/crianças                                                                                                                                                                           	P	\N	\N
67	Mateus Roberto de Souza                           	2	\N	Av. Dr. Candido Motta Filho, 81 - 53 D                                                              	\N	Vl São Francisco              	São Paulo                     	          	2768-7002      	3879-7809      	8694-9838      	mateusr@herbalife.com                                                                               	1	0	0	                                                                                                                                                                                                        	P	\N	\N
68	Cristiane Rodrigues Ferreira                      	1	\N	R. Manuel Martins Colaço, 246 - Bl 08 Apt. 29                                                       	\N	Jd. D´Abril                   	Osasco                        	05396-080 	3783-6053      	3684-3753      	6760-3020      	cris_rf27@yahoo.com.br                                                                              	1	0	0	                                                                                                                                                                                                        	P	\N	\N
69	Janice Souza                                      	2	\N	Av. Flora, 2210                                                                                     	\N	Jaguaribe - Osasco            	Sao Paulo                     	          	3448-4818      	               	               	janice.souza21@gmail.com                                                                            	1	15	0	Segunda a tarde é possível                                                                                                                                                                              	P	\N	\N
70	Ozéas Correia dos Santos                          	1	\N	R. Dr. Victor Ayrosa, 40 Apt. 23                                                                    	\N	Jd. Ypê                       	Osasco                        	06060-270 	               	3718-1124      	9518-8962      	ozeaseva@ig.com.br                                                                                  	1	0	0	                                                                                                                                                                                                        	P	\N	\N
71	Elias Sena Yarmalavicius                          	1	\N	R. Alberto Tanganelli Neto, 166                                                                     	\N	Butantã                       	São Paulo                     	05540-030 	2193-2032      	2195-4860      	9846-8905      	elias.sena@gmail.com                                                                                	1	0	0	Hosp. na casa da mãe Florinda Sena Yarmalavicius                                                                                                                                                        	P	\N	\N
72	Florinda Serra ...                                	2	\N	Rua Alberto Tanganelli Neto, 211                                                                    	\N	Butantã                       	Sao Paulo                     	05540-030 	3726-9274      	               	               	helenaya@ig.com.br                                                                                  	1	20	0	                                                                                                                                                                                                        	P	\N	\N
73	José Eduardo Corrêa Batista                       	1	\N	Av. Prof. João Goulart, 01 Ap. 134                                                                  	\N	Umuarama                      	                              	          	               	2178-4044      	8235-1025      	jedu.batista@ig.com.br                                                                              	1	0	0	Lideravam um grupo na igreja anterior.                                                                                                                                                                  	P	\N	\N
74	Carlos Augusto G. Pires                           	2	\N	R. Manoel Saraiva, 130                                                                              	\N	Campesina                     	Osasco                        	06023-060 	3682-2592      	               	8458-3862      	                                                                                                    	1	14	0	Hosp. Um casal de idosos                                                                                                                                                                                	P	\N	\N
75	Genivaldo José Oliveira / Adriana                 	1	\N	Av. Vitor Civita, 1394 - casa 60                                                                    	\N	Jd. Conceição                 	Osasco                        	06140-260 	3433-4717      	9786-9420      	7771-3265      	dricavital@yahoo.com.br                                                                             	1	0	0	Aberto a outros dias se necessário                                                                                                                                                                      	P	\N	\N
76	Érika Cavalcante Andrade                          	2	\N	R. Jaguarão, 109                                                                                    	\N	Vl. Das Rosas                 	Osasco                        	06260-020 	3602-1076      	               	7148-4813      	cavalcante.erika@ig.com.br                                                                          	1	8	4	                                                                                                                                                                                                        	P	\N	\N
77	Maritania Quintela de Moura...                    	2	\N	R. Dr. Aires Martins Torres, 180 B                                                                  	\N	Vl. São Francisco             	São Paulo                     	          	3763-6322      	               	8130-6168      	tania.quintela@gmail.com                                                                            	1	10	0	podem levar filhos                                                                                                                                                                                      	P	\N	\N
78	Marcelo Eduardo Pinheiro Gomes                    	1	\N	Est. Manoel Lages do Chão, 850 Bl 2 Ap. 11                                                          	\N	Jd. Caiapiá                   	Cotia                         	06705-9030	4148-8389      	4613-1821      	7616-9030      	marcelo.pinheirogomes@uol.com.br                                                                    	1	0	0	                                                                                                                                                                                                        	P	\N	\N
79	Adriana Guimarães                                 	2	\N	Rua 8 de Março, 127                                                                                 	\N	Jd. 1 de Maio                 	Osasco                        	06147-005 	3695-1659      	               	7875-2676      	drikkaguimaraes@hotmail.com                                                                         	1	15	0	Próximo a Resid. Pr. Ricardo                                                                                                                                                                            	P	\N	\N
80	Ronaldo Souza                                     	1	\N	R. Conde Eduardo L. Matarazzo, 3                                                                    	\N	Vl. São Francisco             	São Paulo                     	          	               	7647-8797      	8447-5042      	ronaldo@ravscorp.com                                                                                	1	0	0	Se precisar para outros dias, também está a disposição                                                                                                                                                  	P	\N	\N
81	Elenilda C. Braz de Aguiar                        	2	\N	R. Tenente Aviador Mota Lima, 375                                                                   	\N	Caxingui                      	Sao Paulo                     	05517-030 	3721-2527      	               	9558-8477      	elenata@terra.com.br                                                                                	1	8	0	                                                                                                                                                                                                        	P	\N	\N
82	Helio Yassuhissa Ishida                           	1	\N	R. Tomas Gonçalves, 148 casa 17                                                                     	\N	Vl. Gomes                     	São Paulo                     	05590-030 	2476-2290      	               	9659-2999      	helio.ishida@gmail.com                                                                              	1	0	0	                                                                                                                                                                                                        	P	\N	\N
83	Edvaldo Cruz e Ruth                               	2	\N	R. Eng. Willy Fisher, 240                                                                           	\N	Rio Pequeno                   	Sao Paulo                     	05368-050 	3731-6182      	               	9362-6813      	                                                                                                    	1	15	6	Tem uma garagem - não tem cadeiras p/ núm. Superior a esse                                                                                                                                              	P	\N	\N
84	Daiane Lançoni e Olimpio                          	1	\N	R. Conde Eduardo L. Matarazzo, 3 Bl 3                                                               	\N	Vl.  São Francisco            	São Paulo                     	05356-000 	2936-5412      	               	8121-8586      	daiane.lanconi@uol.com.br                                                                           	1	0	0	É conhecida do Cornélio - Igr. Presbiteriana                                                                                                                                                            	P	\N	\N
85	Samuel Cosmo Santana                              	2	\N	R. Paranauçu, 94                                                                                    	\N	Jaguaré                       	São Paulo                     	05335-030 	3483-9469      	               	9745-8757      	marketing.samuel@hotmail.com                                                                        	1	15	0	                                                                                                                                                                                                        	P	\N	\N
86	Thelma Vitols                                     	1	\N	Rua Caetano Polis, 297                                                                              	\N	Jaguaré                       	São Paulo                     	05335-120 	3681-5414      	               	8202-9208      	thelma.vitols@terra.com.br                                                                          	1	0	0	Grupo na casa da Jenny/Samuel                                                                                                                                                                           	P	\N	\N
87	Paulo Roberto Camargo da Silva                    	1	\N	R. Espírito Santo, 351                                                                              	\N	Jd. Rochdalle                 	Osasco                        	06220-090 	3686-0796      	3847-4717      	9617-1687      	pr_pauloroberto30@hotmail.com                                                                       	1	0	0	H - Ana Ap. Cacia                                                                                                                                                                                       	P	\N	\N
88	Anna Ap. Cacia Lima Barreto                       	2	\N	R. Odila Catan, 223                                                                                 	\N	Jd. Roberto                   	Osasco                        	06170-060 	2827-2960      	7389-2155      	7389-2115      	annalevi1@hotmail.com                                                                               	1	8	4	Pr. Paulo Roberto - facilitador                                                                                                                                                                         	P	\N	\N
89	Gilmar Rodrigues dos Reis                         	2	\N	Av. Dona Blandina Ignês Julio, 741 Apt 48                                                           	\N	Jaguaribe                     	Osasco                        	06050-120 	3609-2177      	4198-6202      	9519-9369      	grodriguesdosreis@gmail.com                                                                         	1	8	4	                                                                                                                                                                                                        	P	\N	\N
90	Helena Maria dos Santos Biondo                    	1	\N	Av. Antonio Carlos Costa, 475                                                                       	\N	Bela Vista                    	Osasco                        	06053-010 	6704-3978      	3685-3850      	               	helena.biondo@r7.com                                                                                	1	0	0	                                                                                                                                                                                                        	P	\N	\N
91	Bruna Peruchi                                     	1	\N	R. Giuseppe Ferrari, 34                                                                             	\N	Jd. Umuarama                  	                              	06036-040 	3699-2735      	               	7180-1611      	bperuchi13@hotmail.com                                                                              	1	0	0	                                                                                                                                                                                                        	P	\N	\N
92	Amanda Silagi                                     	2	\N	R. Cactus, 103                                                                                      	\N	Jd. das Flores                	Osasco                        	          	3685-4420      	               	9528-4893      	                                                                                                    	1	0	0	                                                                                                                                                                                                        	P	\N	\N
93	Carlos Cadima Balcazar                            	1	\N	R. Erico Verissimo, 362                                                                             	\N	Jd. Cambara                   	São Paulo                     	05560-000 	3782-7419      	3602-8355      	7622-8889      	ccadima@uol.com.br                                                                                  	1	0	0	                                                                                                                                                                                                        	P	\N	\N
94	Lina Domingos Lopes                               	2	\N	R. Cesário Vendamini, 70                                                                            	\N	Jd. Adalgisa                  	Osasco                        	06030-210 	3683-6147      	               	               	claudiocdlopes@uol.com.br                                                                           	1	0	0	                                                                                                                                                                                                        	P	\N	\N
95	Aneilde Soares Lima Alves                         	1	\N	R. Capivari Mirim, 195                                                                              	\N	Jd. Dracena                   	                              	05528-290 	3751-3498      	               	8495-6253      	capimi195@hotmail.com                                                                               	1	0	0	Grupo de mulheres                                                                                                                                                                                       	P	\N	\N
96	Ivonete Maria de Almeida                          	2	\N	Rua Prof. Gilio Satim, 88                                                                           	\N	Rio Pequeno                   	São Paulo                     	          	3368-5012      	               	8170-8013      	                                                                                                    	1	10	0	                                                                                                                                                                                                        	P	\N	\N
97	Kelly Cristina Picorele Torres Cavalcante         	2	\N	Al Jundiaí, 162                                                                                     	Residencial 4                 	Alphaville                    	Santana de Parnaíba           	06411-080 	4163-5953      	               	9659-1003      	torresassessorias@uol.com.br                                                                        	1	10	0	                                                                                                                                                                                                        	P	\N	\N
98	Willian Lopes de Macedo                           	1	\N	Av. Getulio Vargas, 990 bl 38 ap 21                                                                 	\N	Jd. Piratininga               	Osasco                        	06233-020 	3656-4809      	2202-0703      	9398-2699      	wlmmm@ig.com.br                                                                                     	1	0	0	                                                                                                                                                                                                        	P	\N	\N
99	Cristiano Limoli                                  	1	\N	R. Belgrado, 239                                                                                    	\N	Valle do Sol                  	                              	          	               	4162-2784      	8412-5615      	cristiano.golden@gmail.com                                                                          	1	0	0	Facilitar na casa do Luiz e Luciana                                                                                                                                                                     	P	\N	\N
100	Luciana Bastazin Marques de S.                    	2	\N	R. Eulo Maroni, 166 Bl 02 Ap. 12                                                                    	\N	Jaguaré / SP                  	Sao Paulo                     	05338-100 	3763-4907      	               	9540-0255      	lubastazin@yahoo.com.br                                                                             	1	12	4	Pedem a Cristiane Limoli                                                                                                                                                                                	P	\N	\N
101	Ângela Ap. Ribeiro Chaves                         	1	\N	R. Monteiro Lobato, 114                                                                             	\N	Vila Aliança                  	                              	06268-010 	4556-3894      	2183-6700      	9914-2113      	angela.archaves@hotmail.com                                                                         	1	0	0	                                                                                                                                                                                                        	P	\N	\N
102	Lucinha Vicente                                   	2	\N	Av. Getulio Vargas, 420 bl 26 ap 42                                                                 	\N	Jd. Piratininga               	Osasco                        	          	3697-0989      	               	9505-1170      	lu_vicente@yahoo.com.br                                                                             	1	10	0	Inscreveu-se por @ Pr. Daniel                                                                                                                                                                           	P	\N	\N
103	Alexandre Daniel Bizetti                          	1	\N	R. Dr. Francisco Patti, 156                                                                         	\N	Vl. São Francisco             	São Paulo                     	05352-090 	3714-6962      	5189-7938      	9260-9761      	alexandre.bizetti@merck.com                                                                         	1	0	0	                                                                                                                                                                                                        	P	\N	\N
104	Agostinha Capistrano Rocha                        	2	\N	Av. Dr. Alberto Jackson Byington, 320 Bl 9 Apt. 41                                                  	\N	Vl Menck                      	Osasco                        	06273-050 	3601-4914      	               	8221-2547      	acaprocha@hotmail.com                                                                               	1	20	10	Passando Rochdale, no sentido Anhanguera prox. Km 18                                                                                                                                                    	P	\N	\N
105	Jose Carlos Melgarejo                             	1	\N	R. Leopoldo Migues, 448 apto 402                                                                    	\N	Cambuci                       	São Paulo                     	01518-120 	3123-1325      	3256-2726      	9982-6455      	josemelca@hotmail.com                                                                               	1	0	0	                                                                                                                                                                                                        	P	\N	\N
106	Manoela Gomes de A. Silva                         	2	\N	Trav. José Copertino Saraiva,                                                                       	\N	Vila Yara                     	Osasco                        	06026-260 	3691-2064      	3654-3224      	9555-2071      	manoelale@hotmail.com                                                                               	1	30	10	Ajuda como avaliar espaço fisico.                                                                                                                                                                       	P	\N	\N
107	Nivea Magda M. de Lima Ruiz                       	2	\N	R. das Camarças, 76                                                                                 	\N	Jd. do Engenho                	                              	046711-460	4551-2896      	3688-4828      	6536-3676      	niveamagda@hotmail.com                                                                              	1	12	10	Próxim Raposo Km 21                                                                                                                                                                                     	P	\N	\N
108	Sydnei dos Santos                                 	1	\N	R. Pantaleão Braz 450 Ap. 81                                                                        	\N	Jd. Esther                    	São Paulo                     	05372-080 	2592-7989      	               	8445-9756      	sydsan@hotmail.com                                                                                  	1	0	0	Grupo misto c/ crianças - possui dois filhos 7 e 11 anos.                                                                                                                                               	P	\N	\N
109	Gildete de Brito Teixeira                         	2	\N	R. Paula Rodrigues, 250 Bl 11 Ap. 31                                                                	\N	Jd. Piratininga               	Osasco                        	06233-030 	3656-5631      	               	9233-8171      	gildete.net@globo.com                                                                               	1	10	3	encontros quinzenais                                                                                                                                                                                    	P	\N	\N
110	Tania Correia                                     	1	\N	R. Doutor Italo Eboli, 195                                                                          	\N	Jd. Bonfiglioli               	São Paulo                     	05592-060 	3733-3694      	3022-2344      	8046-1109      	taniacorreia11@gmail.com                                                                            	1	0	0	Projeto Debora - as quinta-feiras                                                                                                                                                                       	P	\N	\N
522	Tó e Aline                                        	99	                              	Av. dos Carvalhos, 157                                                                              	                              	Fazendinha                    	Carapicuíba                   	          	               	               	               	toaline@uol.com.br                                                                                  	1	13	13	já é GP                                                                                                                                                                                                 	P	2012-03-04 12:46:19	admin               
523	Tó e Aline                                        	99	                              	Av. dos Carvalhos, 157                                                                              	                              	Fazendinha                    	Carapicuiba                   	          	               	               	               	                                                                                                    	1	13	13	já é um GP                                                                                                                                                                                              	P	2012-03-04 12:51:52	admin               
524	Gabriel A. Ribeiro de Oliveira                    	99	                              	Rua Porto Alegre, 52                                                                                	                              	Rochdale                      	Osasco                        	06286-180 	3602-0942      	               	9930-6435      	gabrielribeiro350@gmail.com                                                                         	1	10	0	                                                                                                                                                                                                        	P	2012-03-04 20:46:36	\N
525	Weslei dos Santos Pontes                          	99	                              	R. Angelo Clerice, 221                                                                              	                              	Jd. Boa Vista                 	Sao Paulo                     	05584-040 	3715-0863      	7703-5196      	7368-1306      	wspservice@gmail.com                                                                                	1	12	8	                                                                                                                                                                                                        	P	2012-03-06 16:11:26	voluntario          
526	Edmilson e Beatriz Almeida                        	2	                              	Rua Diogo Gomes Carneiro, 500                                                                       	casa 64                       	Jd. Rosa Maria                	Osasco                        	          	3788-1181      	2188-0533      	7886-5970      	edmilson.almeida@hotmail.com                                                                        	1	10	6	                                                                                                                                                                                                        	P	2012-03-06 16:20:19	voluntario          
527	José Mauricio da Silva                            	99	                              	Av. Comandante Sampaio, 755                                                                         	apto. 31                      	km 18                         	Osasco                        	06192-010 	36072825       	28845555       	               	mauricioeliza@uol.com.br                                                                            	1	8	4	                                                                                                                                                                                                        	P	2012-03-09 11:56:43	admin               
528	Oswaldo Junior                                    	1	                              	\N	\N	Vila D'Este                   	Cotia                         	\N	37634551       	28845555       	93232573       	oswaldo@ibmemorial.org.br                                                                           	1	20	0	                                                                                                                                                                                                        	P	2012-03-09 12:07:55	admin               
529	Fauze Jibran Hsieh                                	2	                              	R. Comendador Elias Zarzur, 487 casa 1                                                              	casa 1                        	Alto da Boa Vista             	Sao Paulo                     	04736-001 	21298808       	21936688       	94549878       	fauze@infinitocultural.com.br                                                                       	1	20	0	                                                                                                                                                                                                        	P	2012-03-09 12:15:07	admin               
530	Marcelo Eduardo Pinheiro gomes                    	1	                              	\N	\N	Jardim Caiapiá                	Cotia                         	\N	41488389       	46131821       	76169030       	marcelo.pinheirogomes@uol.com.br                                                                    	1	15	6	                                                                                                                                                                                                        	P	2012-03-09 12:37:54	admin               
531	Regina Alice de Abreu Bustamante Canales          	2	                              	Rua Victor Hugo, 178                                                                                	km 28,5 da Raposo             	Colinas S. Fernando           	Cotia                         	06704-505 	46141045       	41940880       	94492825       	reginalice70@hotmail.com                                                                            	0	15	6	                                                                                                                                                                                                        	P	2012-03-09 12:41:30	admin               
532	Alberto Yaegashi                                  	99	                              	R. Itapemirum, 486                                                                                  	apto. 901                     	Morumbi                       	São Paulo                     	          	               	37824185       	83803770       	alberto@secretsprofessional.com.br                                                                  	1	10	6	                                                                                                                                                                                                        	P	2012-03-09 12:56:41	admin               
533	Weslei dos Santos Pontes                          	99	                              	R. Angelo Clerice, 221                                                                              	                              	Jardim Boa Vista              	São Paulo                     	05584-040 	37150863       	77035196       	73681306       	wspservice@gmail.com                                                                                	1	12	8	                                                                                                                                                                                                        	P	2012-03-09 13:58:29	\N
534	Angela A. Ribeiro Chaves                          	1	                              	\N	\N	Vila Aliança                  	Osasco                        	\N	35995314       	21836700       	99142113       	angela.archaves@hotmail.com                                                                         	1	8	4	                                                                                                                                                                                                        	P	2012-03-09 15:03:15	admin               
535	Grazielly Natalione Almeida de Castro             	2	                              	R. Santa Marcela, 98                                                                                	                              	Jardim Califórnia             	Osasco                        	06124-110 	28368508       	30917686       	71354501       	grazicastro@usp.br                                                                                  	1	8	4	                                                                                                                                                                                                        	P	2012-03-09 15:06:21	admin               
536	Juliana de Paula Castro                           	2	                              	Av. Manoel Pedro Pimentel, 200                                                                      	Bloco 14, apto. 61            	Jardim Wilson                 	Osasco                        	06020-194 	37141428       	96314928       	72187093       	juliana.pcastro@hotmail.com                                                                         	1	8	0	                                                                                                                                                                                                        	P	2012-03-09 15:33:55	admin               
537	Roberto de Melo e Adriana                         	1	                              	\N	\N	                              	                              	\N	3719-2713      	               	7865-2331      	                                                                                                    	1	8	0	                                                                                                                                                                                                        	P	2012-03-09 15:36:36	admin               
538	Maritania Quintela de Moura Silva Gomes           	2	                              	R. Dr. Aires Martins Torres, 180 B                                                                  	Bentevi - 3º andar            	Vl. São Francisco             	Sao Paulo                     	          	37636322       	               	        8130616	tania.quintela@gmail.com                                                                            	0	10	3	                                                                                                                                                                                                        	P	2012-03-09 15:49:26	admin               
539	Reginaldo Francisco dos Santos                    	1	                              	\N	\N	Jaguaré                       	São Paulo                     	\N	39324542       	39336429       	85778068       	rfsantos.eng@bol.com.br                                                                             	1	\N	\N	                                                                                                                                                                                                        	P	2012-03-09 15:51:30	admin               
540	Roberto de Melo                                   	1	                              	\N	\N	                              	                              	\N	               	               	78652331       	robertomel.cobraman@yahoo.com.br                                                                    	1	10	5	                                                                                                                                                                                                        	P	2012-03-09 15:59:47	admin               
541	Dulcinea Vasconcelos Pascoal de Oliveira          	2	                              	R. Manoel Joaquim Pera, 78                                                                          	                              	Butantã                       	São Paulo                     	76690-364 	37224929       	               	76690364       	dulcejaniocasa@gmail.com                                                                            	1	10	5	                                                                                                                                                                                                        	P	2012-03-09 16:02:42	admin               
554	LETICIA REIS                                      	1	                              	\N	\N	Parque das Azaléias           	Osasco                        	\N	4187-8118      	               	8611-5531      	letisrs@hotmail.com                                                                                 	1	\N	\N	                                                                                                                                                                                                        	P	2012-03-09 17:08:49	admin               
542	Jesiel de Vasconcelos Pascoal                     	2	                              	Av. Edmundo Amaral, 3935                                                                            	Bloco 1 - Apto. 53            	Jardim Piratininga            	Osasco                        	06230-150 	35992396       	70716140       	62837784       	jesiel_vasconcelos@hotmail.com                                                                      	1	10	4	                                                                                                                                                                                                        	P	2012-03-09 16:07:49	admin               
543	José Eduardo Correa Batista e kelly               	1	                              	\N	\N	Umuarama                      	Osasco                        	\N	               	21784044       	82351025       	jedu.batista@ig.com.br                                                                              	1	10	4	                                                                                                                                                                                                        	P	2012-03-09 16:09:41	admin               
544	Siomara C. Veronezi                               	1	                              	\N	\N	R. Felipe Terra 184           	Cotia                         	\N	461244         	               	89575154       	siomaraveronezi@ig.com.br                                                                           	1	10	3	                                                                                                                                                                                                        	P	2012-03-09 16:30:39	admin               
545	Carlos Augusto Gonçalves Pires                    	2	                              	R. Manoel Saraiva, 130                                                                              	                              	Campesina                     	Osasco                        	06023-060 	37821536       	               	94244274       	                                                                                                    	1	15	0	                                                                                                                                                                                                        	P	2012-03-09 16:35:02	admin               
546	Maria Ivonete Almeida Silva                       	2	                              	R. Venancio Flores, 119-A                                                                           	                              	Jd. Ivana                     	Sao Paulo                     	05364-246 	3714-2866      	               	7474-3246      	ivonete.almeida@hotmail.com                                                                         	1	15	0	                                                                                                                                                                                                        	P	2012-03-09 16:37:58	admin               
547	SYDNEI SANTOS                                     	1	                              	\N	\N	Jardim Ester Yolanda          	São Paulo                     	\N	2592-7989      	               	8445-9756      	sydsan@hotmail.com                                                                                  	1	\N	\N	                                                                                                                                                                                                        	P	2012-03-09 16:40:36	admin               
548	Fabiana Ferraz                                    	1	                              	\N	\N	Jd. Raposo Tavares            	                              	\N	               	               	               	fabianaprata@yahoo.com.br                                                                           	1	15	\N	                                                                                                                                                                                                        	P	2012-03-09 16:40:54	admin               
549	Patricia B de Freitas                             	2	                              	R. Felipe Terra, 184                                                                                	casa 69                       	Granja Viana                  	Cotia                         	06710-540 	               	55075756       	70501284       	freitas.patriciab@gmail.com                                                                         	1	12	0	                                                                                                                                                                                                        	P	2012-03-09 16:46:48	admin               
550	LEONARDO E RITA NOLASCO                           	2	                              	Rua Dr. Paulo Ferraz da Costa Aguiar 1600                                                           	apto 62 -G                    	Vila Yara                     	Osasco                        	06026-090 	3891-2288      	               	8369-3985      	ritadiasnolasco@uol.com.br                                                                          	1	12	4	                                                                                                                                                                                                        	P	2012-03-09 16:47:55	admin               
551	Thais Godoy de Azevedo                            	1	                              	\N	\N	Granja Viana                  	Cotia                         	\N	47779368       	               	91447676       	thaitata@gmail.com                                                                                  	1	12	\N	                                                                                                                                                                                                        	P	2012-03-09 16:48:12	admin               
552	RIVA PEREIRA DIAS                                 	1	                              	\N	\N	Vila Yara                     	Osasco                        	\N	3448-3263      	               	9681-9159      	riva bereta@ig.com.br                                                                               	1	\N	\N	                                                                                                                                                                                                        	P	2012-03-09 16:50:21	admin               
553	JULIANA DE PAULA CASTRO                           	2	                              	Av. Manoel Pedro Pimentel, 200 Bl 14 Ap. 61                                                         	bloco 14 apto 61              	Jd. Wilson                    	Osasco                        	06020-194 	3714-1428      	7218-7093      	9631-4928      	juliana.pcastro@hotmail.com                                                                         	1	8	0	                                                                                                                                                                                                        	P	2012-03-09 17:06:37	admin               
555	Rodrigo Papp Cadima                               	99	                              	Av. Ipê, 177                                                                                        	                              	Cidade das Flores             	Osasco                        	06184-170 	               	               	89856639       	daopapp@hotmail.com                                                                                 	1	15	0	                                                                                                                                                                                                        	P	2012-03-11 10:53:40	admin               
556	eduardo gomes ronconi                             	99	                              	av. manoel pedro pimentel                                                                           	200 bloco 13 apto 94          	jardim wilson                 	Osasco                        	06020-194 	3714-3618      	3605-1243      	8474-1027      	tcronconi1@terra.com.br                                                                             	1	8	4	                                                                                                                                                                                                        	P	2012-03-11 20:51:06	\N
557	Thais Godoy de Azevedo                            	1	                              	\N	\N	Granja Viana                  	Cotia                         	\N	47779368       	               	91447676       	thaitata@hotmail.com                                                                                	1	7	0	                                                                                                                                                                                                        	P	2012-03-13 16:47:01	\N
558	Cida Aparecida Carneiro                           	2	                              	Av. Eng. Antonio Eiras Garcia, 4455                                                                 	apto.2123                     	Jardim Rosa Maria             	São Paulo                     	05564-100 	37881903       	               	62507585       	cidacarneiros@gmail.com                                                                             	1	7	0	                                                                                                                                                                                                        	P	2012-03-13 16:51:54	\N
559	Luiz Meneguini                                    	1	                              	\N	\N	Jaguaré                       	São Paulo                     	\N	2507-1638      	               	9688-1638      	luizmeneguini@gmail.com                                                                             	1	10	6	                                                                                                                                                                                                        	P	2012-03-14 12:40:50	admin               
560	Edson e Solange Lima                              	2	                              	Av. Dr. Martin Luther King, 2255 Ap. 71 B                                                           	                              	Vl São Francisco              	Sao Paulo                     	06030-016 	3683-5878      	9981-6224      	9179-6985      	solange@santander.com.br                                                                            	1	10	6	                                                                                                                                                                                                        	P	2012-03-14 12:45:00	admin               
561	Alexandre Bixetti                                 	1	                              	\N	\N	Vila São Francisco            	São Paulo                     	\N	3714-6962      	5189-7938      	9260-9761      	alexandre.bizetti@merck.com                                                                         	1	10	5	                                                                                                                                                                                                        	P	2012-03-14 12:51:42	admin               
562	Dulcimea Vasconcelos P de Oliveira                	2	                              	Rua Manoel Joaquim Pera 78                                                                          	Conjunto Resid. Butantã       	Butantã                       	São Paulo                     	05539-030 	               	               	               	jessicavasconcelosoliveira@gmail.com                                                                	1	10	5	                                                                                                                                                                                                        	P	2012-03-14 12:55:22	admin               
563	Alexandre Bizetti                                 	1	                              	\N	\N	Cidade São Francisco          	São Paulo                     	\N	               	               	               	                                                                                                    	1	10	5	                                                                                                                                                                                                        	P	2012-03-14 13:03:43	admin               
564	Cida Carneiro                                     	99	                              	Av. Engenheiro Antonio Heitor Eiras Garcia 4455 apto 2123                                           	                              	Rosa Maria                    	São Paulo                     	05564-100 	3788-1903      	               	6250-7585      	cidacarneiros@gmail.com                                                                             	1	10	0	                                                                                                                                                                                                        	P	2012-03-14 15:43:44	\N
565	Suely Begnini                                     	2	                              	R. Prof. Astolfo Tavares Paes, 86                                                                   	apto 62, bloco A              	Vila São francisco            	São Paulo                     	05352-070 	37653569       	               	81036093       	suelybegnini@bol.com.br                                                                             	1	8	4	                                                                                                                                                                                                        	P	2012-03-14 16:48:22	\N
566	Roberto Mello                                     	1	                              	\N	\N	Jaguaré                       	São Paulo                     	\N	               	               	78652331       	robertomel.cobraman@yahoo.com.br                                                                    	1	8	4	                                                                                                                                                                                                        	P	2012-03-14 16:49:39	\N
567	Carlos Augusto Gonçalves Pires                    	2	                              	Rua Manoel Saraiva 130                                                                              	                              	Campesina                     	Osasco                        	06023-060 	3682-2592      	               	8458-3862      	                                                                                                    	1	15	0	                                                                                                                                                                                                        	P	2012-03-15 11:26:35	admin               
568	Ronaldo Souza                                     	1	                              	\N	\N	São Francisco                 	São Paulo                     	\N	               	               	8447-5042      	ravs@ravs.com.br                                                                                    	1	15	0	                                                                                                                                                                                                        	P	2012-03-15 15:16:21	\N
569	Edmilson e Beatriz Almeida                        	2	                              	Rua Diogo Gomes Carneiro 500 casa 64                                                                	                              	Jardim Rosa Maria             	São Paulo                     	05547-030 	3788-1181      	2188-0533      	7886-5970      	edmilson.almeida@hotmail.com                                                                        	0	15	0	                                                                                                                                                                                                        	P	2012-03-15 15:37:55	\N
570	Carlos Augusto  Gonçalves Pires                   	2	                              	R. Manoel Saraiva, 130                                                                              	                              	Campesina                     	Osasco                        	06023-060 	3682-2592      	               	8458-3862      	                                                                                                    	1	15	0	                                                                                                                                                                                                        	P	2012-03-15 15:45:35	\N
571	Samuel Santana                                    	2	                              	R. Paranauçu, 94                                                                                    	                              	Jaguaré                       	São Paulo                     	05335-030 	3483-9469      	               	9745-8757      	samuelmarketing@hotmail.com                                                                         	1	20	0	                                                                                                                                                                                                        	P	2012-03-15 16:00:36	\N
572	Marize Paiva                                      	1	                              	\N	\N	Jaguaré                       	São Paulo                     	\N	3726-4973      	               	8999-2628      	marize.paiva@gmail.com                                                                              	1	20	0	                                                                                                                                                                                                        	P	2012-03-15 16:06:28	\N
573	Genivaldo José Oliveira                           	1	                              	\N	\N	Jardim Conceição              	Osasco                        	\N	34334717       	9786-9420      	7771-3265      	dricavital@yahoo.com.br                                                                             	1	12	10	                                                                                                                                                                                                        	P	2012-03-16 11:38:36	admin               
574	Nivea Magda M de Lima Ruiz                        	2	                              	Rua das Camurças 76                                                                                 	                              	Jardim do Engenho             	Cotia                         	04671-460 	4551-2896      	3688-4828      	6536-3676      	niveamagda@hotmail.com                                                                              	1	12	10	                                                                                                                                                                                                        	P	2012-03-16 11:45:19	admin               
575	Erika Frison B Leite                              	1	                              	\N	\N	Rio Pequeno                   	São Paulo                     	\N	3535-5023      	8771-6568      	6753-8461      	erika.fb@gmail.com                                                                                  	1	6	0	                                                                                                                                                                                                        	P	2012-03-16 12:48:59	\N
576	Mateus Roberto de Souza                           	2	                              	Av. Dr. Candido de Mota Filho, 31 53 D                                                              	                              	Vila São francisco            	São Paulo                     	05351-000 	2768-7002      	3379-7809      	8694-9838      	mateus@herbalife.com                                                                                	1	6	0	                                                                                                                                                                                                        	P	2012-03-16 12:52:32	\N
577	José Braz Gomes                                   	1	                              	\N	\N	Cohab 2 -                     	Carapicuiba                   	\N	41888797       	               	91939930       	                                                                                                    	1	\N	\N	                                                                                                                                                                                                        	P	2012-03-18 20:58:50	\N
578	Eduardo Gomes Ronconi e Tereza                    	99	                              	Av. Manoel Pedro Pimentel, 200                                                                      	Bl 13 - apto. 94              	Jardim Wilson                 	Osasco                        	06020-194 	37143618       	36051243       	84741027       	tcronconi1@terra.com.br                                                                             	1	10	6	                                                                                                                                                                                                        	P	2012-03-20 15:04:41	admin               
579	Lucas e Thalita                                   	99	casais jovens                 	Av. Miguel Frias e Vasconcelos, 756                                                                 	apto. 183, torre 2            	Jaguaré                       	São Paulo                     	          	               	               	81268002       	lucborgess@hotmail.com                                                                              	1	10	0	                                                                                                                                                                                                        	P	2012-03-20 15:10:56	admin               
580	Paulo Fernando e Simone Rodrigues                 	2	                              	Est. São Francisco 2701                                                                             	apto. 214 - Bloco Canário     	Ecos Natureza Club            	Taboão da Serra               	06764-290 	47718168       	               	93493738       	paulofernando@drigon.com.br                                                                         	1	20	8	                                                                                                                                                                                                        	P	2012-03-20 15:38:07	admin               
581	Livia Martins Hannes                              	1	                              	\N	\N	Butantã                       	São Paulo                     	\N	               	               	8164-9998      	liviahannes@hotmail.com                                                                             	1	10	0	                                                                                                                                                                                                        	P	2012-03-21 14:10:54	\N
582	Jessica Vasconcelos                               	2	                              	Rua Manoel Joaquim Pera, 78                                                                         	Conj. Residencail Butantã     	Butantã                       	São Paulo                     	05539-030 	3722-4929      	               	               	jessicavasconcelosoliveira@gmail.com                                                                	1	10	0	                                                                                                                                                                                                        	P	2012-03-21 14:14:23	\N
583	Angelo Marques                                    	99	                              	Rua Das Camelias,  369                                                                              	                              	Parque Assunção               	Taboão da Serra               	06754-110 	4787-7738      	3478-6900      	9543-4044      	angelo.marques@bol.com.br                                                                           	1	10	0	                                                                                                                                                                                                        	P	2012-03-21 14:50:10	admin               
584	Norma de Lima Ferreira de Jesus                   	99	                              	Rua Dr. Wladimir do Amaral, 286                                                                     	                              	Butantã                       	São Paulo                     	05535-070 	3721-6596      	               	               	nifj@uol.com.br                                                                                     	1	20	7	                                                                                                                                                                                                        	P	2012-03-27 16:32:14	admin               
585	Norma de Lima Ferreira de Jesus                   	2	                              	Rua Dr. Wladimir do Amaral 286                                                                      	                              	Butantã                       	São Paulo                     	05535-070 	3721-6596      	               	               	nifj@uol.com.br                                                                                     	1	20	7	                                                                                                                                                                                                        	P	2012-03-27 16:36:10	admin               
586	Michel Jorge Buoery Neto                          	1	                              	\N	\N	Butantã                       	São Paulo                     	\N	3721-6596      	               	8367-3928      	mbuoery@hotmail.com                                                                                 	1	20	7	                                                                                                                                                                                                        	P	2012-03-27 16:38:40	admin               
587	Fernando & Fátima                                 	99	                              	 Rua Pedro Domingos da Silva, 17                                                                    	                              	Jardim da Glória              	Osasco                        	06038-380 	3659-6674      	7519-0301      	9988-0330      	marcnando@gmail.com                                                                                 	1	10	4	                                                                                                                                                                                                        	P	2012-03-28 17:49:53	admin               
588	Jussara Camara Pessoa                             	99	                              	Av. José Lourenço 261                                                                               	apto. 12                      	Jardim Jaguaribe              	Osasco                        	06053-020 	36053781       	               	76912955       	jpessoa03@gmail.com                                                                                 	1	10	8	                                                                                                                                                                                                        	P	2012-04-15 11:57:40	admin               
589	Erika Frison Leite                                	1	                              	\N	\N	                              	São Paulo                     	\N	               	               	67538461       	erika.fb@gmail.com                                                                                  	1	15	0	                                                                                                                                                                                                        	P	2012-05-06 11:40:57	\N
590	Marta Lucia                                       	2	                              	Av. José Maria Alkimin 431                                                                          	                              	Jardim Ester                  	São Paulo                     	          	35676931       	               	               	                                                                                                    	1	15	0	                                                                                                                                                                                                        	P	2012-05-06 11:43:15	\N
591	 Alex Clayton Lins                                	1	                              	\N	\N	Jd. Cipava                    	Osasco - SP                   	\N	11 3592-0145   	               	11 8698-0875   	alex-c-lins@uol.com.br                                                                              	1	15	10	                                                                                                                                                                                                        	P	2012-06-19 16:17:42	admin               
592	 Flavia Torres Baptista Strobl                    	2	                              	Rua Bernardo dos Santos, 10                                                                         	Torre Sigma - Apto 101        	Js Cipava                     	Osasco                        	05542-000 	11 3721-1117   	               	11 8080-8419   	torresstrobl@gmail.com                                                                              	1	15	10	                                                                                                                                                                                                        	P	2012-06-19 16:21:15	admin               
\.


--
-- TOC entry 2941 (class 0 OID 32783)
-- Dependencies: 199
-- Data for Name: tfuncao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tfuncao (id, nome) FROM stdin;
1	Facilitador         
2	Hospedeiro          
99	Ambos               
\.


--
-- TOC entry 2948 (class 0 OID 32902)
-- Dependencies: 206
-- Data for Name: tgrupo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tgrupo (id, codigofac, codigohosp, diasemana, horario, tipogrupo, grupooutro, qtdemaxima, status) FROM stdin;
252	46	46	6	1	7	                              	10	F
251	45	45	5	2	4	                              	12	F
250	44	44	7	2	5	                              	10	F
248	43	43	7	2	5	                              	15	F
247	42	42	4	2	4	                              	12	F
246	41	41	5	2	5	                              	8	F
245	40	40	4	2	4	                              	8	F
244	39	39	5	2	4	                              	15	F
242	38	38	6	2	4	                              	10	F
241	37	37	4	2	5	                              	6	F
240	36	36	5	2	5	                              	10	F
388	589	590	3	2	5	                              	15	F
238	34	34	3	2	4	                              	10	F
237	33	33	6	2	7	                              	8	F
235	31	31	4	2	5	                              	12	F
234	30	30	6	2	5	                              	8	F
232	29	29	2	2	4	                              	15	F
231	28	28	6	2	4	                              	13	F
230	27	27	6	2	4	                              	17	F
229	26	26	7	1	5	                              	10	F
228	25	25	4	1	7	                              	10	F
227	24	24	6	2	4	                              	12	F
226	23	23	2	2	4	                              	15	F
225	22	22	7	2	5	                              	10	F
224	21	21	6	1	7	                              	20	F
223	20	20	7	2	4	                              	20	F
222	19	19	4	2	5	                              	12	F
220	17	17	2	2	5	                              	10	F
219	16	16	6	2	3	                              	10	F
218	15	15	7	2	4	                              	15	F
217	14	14	6	2	4	                              	10	F
216	13	13	4	1	7	                              	13	F
215	12	12	3	1	7	                              	7	F
214	11	11	2	2	5	                              	6	F
212	9	9	3	2	7	                              	10	F
211	8	8	4	2	4	                              	2	F
210	7	7	4	1	7	                              	6	F
209	6	6	4	2	5	                              	20	F
207	5	5	6	2	5	                              	8	F
204	4	4	6	2	5	                              	6	F
202	2	2	5	2	5	                              	10	F
201	1	1	6	2	4	                              	20	F
255	51	51	3	2	5	                              	15	F
256	53	54	3	2	5	                              	20	F
257	55	56	3	2	5	                              	10	F
258	58	57	3	2	5	                              	8	F
385	586	586	5	2	4	                              	20	F
260	61	62	2	2	4	                              	30	F
262	66	65	3	2	5	                              	10	F
264	70	69	4	2	5	                              	15	F
266	71	72	4	2	5	                              	20	F
271	82	81	5	2	5	                              	8	F
274	84	83	2	2	4	                              	15	F
276	87	88	5	2	4	                              	8	F
277	90	89	5	2	4	                              	8	F
278	91	92	3	2	7	                              	12	F
281	95	96	2	2	7	                              	10	F
283	98	97	6	2	5	                              	10	F
285	99	100	7	2	4	                              	12	F
290	105	106	5	2	4	                              	30	F
386	587	587	5	2	4	                              	11	F
352	527	527	3	2	4	                              	8	F
350	522	522	6	2	4	                              	13	F
351	524	524	7	2	5	                              	10	F
353	528	529	5	2	5	                              	25	F
354	530	531	6	2	4	                              	15	F
355	532	532	4	2	4	                              	10	F
356	525	525	3	2	4	                              	12	F
384	583	583	6	2	5	                              	10	F
368	555	555	7	2	6	                              	2	F
359	539	538	6	2	4	                              	10	F
383	581	582	7	1	6	                              	15	F
382	552	580	6	2	4	                              	20	F
381	579	579	6	2	9	                              	10	F
363	547	546	6	2	5	                              	15	F
380	578	578	6	2	4	                              	4	F
379	547	576	2	2	5	                              	8	F
378	573	574	6	2	4	                              	12	F
387	588	588	6	2	4	                              	12	F
373	564	564	5	2	5	                              	10	F
374	566	565	6	2	4	                              	8	F
375	568	569	6	2	5	                              	15	F
376	73	570	5	2	5	                              	15	F
377	572	571	6	2	5	                              	20	F
389	591	592	6	2	3	                              	15	F
\.


--
-- TOC entry 2945 (class 0 OID 32850)
-- Dependencies: 203
-- Data for Name: thorario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY thorario (id, nome) FROM stdin;
0	Manhã               
1	Tarde               
2	Noite               
9	INDEFINIDO          
\.


--
-- TOC entry 2949 (class 0 OID 32940)
-- Dependencies: 207
-- Data for Name: thorario_facilhosp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY thorario_facilhosp (idhorario, idfacilhosp) FROM stdin;
1	13
1	21
2	4
2	8
2	41
2	50
2	63
2	28
2	33
2	77
2	5
2	6
2	9
2	11
2	18
2	19
2	23
2	27
2	30
2	35
2	38
2	39
2	42
2	45
2	47
2	49
2	52
2	54
2	57
2	59
2	61
2	62
2	64
2	65
2	69
2	74
2	76
2	79
2	81
2	82
2	89
2	90
2	94
2	97
2	101
2	105
2	107
2	25
2	22
2	37
2	34
2	51
2	56
2	58
2	68
2	75
2	78
2	87
2	88
2	92
2	104
2	109
2	31
2	36
2	66
2	91
0	84
2	84
2	2
2	10
2	14
2	17
2	29
2	40
2	48
2	60
2	70
2	72
2	73
2	80
2	83
2	85
2	86
2	99
2	100
2	102
2	103
0	55
1	55
2	55
0	20
1	20
2	20
0	106
1	106
2	106
0	1
1	1
2	1
1	7
1	12
1	46
1	95
2	95
1	15
2	15
1	32
2	32
1	43
2	43
1	96
2	96
1	108
2	108
2	522
2	523
2	524
2	525
2	526
2	527
2	528
2	529
2	530
2	531
2	532
2	533
2	534
2	535
2	536
2	537
2	538
2	539
2	540
2	541
2	542
2	543
2	544
2	545
2	546
2	547
2	548
2	549
2	550
2	551
2	552
2	553
2	554
2	555
2	556
2	557
2	558
2	559
2	560
2	561
2	562
2	563
2	564
2	565
2	566
2	567
2	568
2	569
2	570
2	571
2	572
2	573
2	574
2	575
2	576
2	577
2	578
2	579
2	580
1	581
1	582
2	583
2	584
2	585
2	586
2	587
2	588
2	589
2	590
2	591
2	592
\.


--
-- TOC entry 2951 (class 0 OID 32964)
-- Dependencies: 209
-- Data for Name: tparticipante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tparticipante (id, codigogrupo, nome, email, telefone, outrotelefone, datacadastro, qtdecriancas) FROM stdin;
1629	231	Tatiane                                           	barros.tatiane@gmail.com                                                                            	89597754       	\N	2012-03-04 12:21:37	2
1630	230	flavio de oliveira                                	                                                                                                    	8567-5789      	\N	2012-03-04 12:22:41	2
1631	244	Alexandre Zaballa Dias                            	azaballadias@gmail.com                                                                              	83797799       	\N	2012-03-04 12:22:47	2
1632	231	Evelyn                                            	                                                                                                    	89587754       	\N	2012-03-04 12:23:02	2
1633	230	vivian boletini de oliveira                       	                                                                                                    	8567-5789      	\N	2012-03-04 12:23:18	\N
1634	231	ronaldo                                           	                                                                                                    	89587754       	\N	2012-03-04 12:23:23	\N
1635	231	joao ricardo                                      	                                                                                                    	89587754       	\N	2012-03-04 12:23:56	\N
1636	230	edison                                            	                                                                                                    	3603-5494      	\N	2012-03-04 12:24:05	1
1637	231	Erika                                             	                                                                                                    	89587754       	\N	2012-03-04 12:24:23	2
1638	230	elaine                                            	                                                                                                    	3603-5494      	\N	2012-03-04 12:24:32	\N
1639	241	Lilian Walsh Keller                               	                                                                                                    	97660777       	\N	2012-03-04 12:24:44	\N
1640	231	Katia                                             	                                                                                                    	89587754       	\N	2012-03-04 12:25:12	\N
1641	230	donizeti zambeli                                  	                                                                                                    	3688-2669      	\N	2012-03-04 12:25:15	\N
1642	230	claudeti zambeli                                  	                                                                                                    	3688-2669      	\N	2012-03-04 12:25:44	\N
1854	382	José Marques de Oliveira                          	riva.bereta@ig.com.br                                                                               	3448-3263      	\N	2012-03-25 12:05:58	\N
1644	230	alberto                                           	                                                                                                    	3695-5494      	\N	2012-03-04 12:26:22	1
1856	351	Margarida de Araújo Almeida                       	                                                                                                    	34317559       	\N	2012-03-25 12:08:17	\N
1855	351	Ricardo de Almeida                                	                                                                                                    	34317559       	\N	2012-03-25 12:07:42	\N
1647	230	ivete                                             	                                                                                                    	3695-5494      	\N	2012-03-04 12:27:11	\N
1648	291	Diego de Lima Ruiz                                	                                                                                                    	4551-2896      	\N	2012-03-04 12:27:16	\N
1649	291	Donizete Lima                                     	                                                                                                    	8693-6884      	\N	2012-03-04 12:28:18	\N
1847	274	Gabriel                                           	                                                                                                    	3731-6182      	\N	2012-03-21 12:03:58	\N
1651	291	katherine Moura G. dos Santos                     	sydsan@hotmail.com                                                                                  	8445-9756      	\N	2012-03-04 12:30:37	2
1846	274	Natalia                                           	                                                                                                    	3731-6182      	\N	2012-03-21 12:03:33	\N
1653	268	Valeria Calera                                    	                                                                                                    	25764914       	\N	2012-03-04 12:31:26	4
1654	225	Mauro Furtado                                     	                                                                                                    	11 - 79967928  	\N	2012-03-04 12:31:33	\N
1655	268	Anderson Calera                                   	                                                                                                    	25764914       	\N	2012-03-04 12:31:47	\N
1656	225	Adriana Furtado                                   	                                                                                                    	11 - 77318872  	\N	2012-03-04 12:32:47	\N
1657	285	adriana limoli                                    	                                                                                                    	8412-5615      	\N	2012-03-04 12:40:39	1
1658	285	aline franco                                      	luiz.sou@globo.com                                                                                  	9736-5047      	\N	2012-03-04 12:41:37	\N
1659	285	luiz alves                                        	luiz.sou@globo.com                                                                                  	9736-5047      	\N	2012-03-04 12:43:08	\N
1660	275	Otaviano Santana                                  	                                                                                                    	11 37682919    	\N	2012-03-04 20:51:48	\N
1661	275	Leondina Cosmo de Santana                         	                                                                                                    	37682919       	\N	2012-03-04 20:52:14	\N
1662	275	Rosana Cosmo Santana                              	                                                                                                    	37682919       	\N	2012-03-04 20:52:42	\N
1664	216	Alzira Morales Freitas                            	aa@gmail.com                                                                                        	1111           	\N	2012-03-09 11:14:49	\N
1665	216	Elza Câmara                                       	aa@gmail.com                                                                                        	1111           	\N	2012-03-09 11:15:12	\N
1666	216	Idalina Maria Ribeiro                             	aa@gmail.com                                                                                        	1111           	\N	2012-03-09 11:15:35	\N
1667	216	Ivonete Maria de Almeida                          	aa@gmail.com                                                                                        	1111           	\N	2012-03-09 11:15:59	\N
1668	216	Lionor Da Silva Nascimento                        	aa@gmail.com                                                                                        	1111           	\N	2012-03-09 11:16:21	\N
1669	216	Lúcia Maria Aleixo dos Santos                     	aa@gmail.com                                                                                        	1111           	\N	2012-03-09 11:16:43	\N
1670	216	Maria Cristina D Pietro                           	aa@gmail.com                                                                                        	1111           	\N	2012-03-09 11:17:03	\N
1671	216	Setsuko Okayama Tiba                              	aa@gmail.com                                                                                        	1111           	\N	2012-03-09 11:17:27	\N
1672	216	Terezinha Rodrigues Lima                          	aa@gmail.com                                                                                        	1111           	\N	2012-03-09 11:17:47	\N
1673	368	Tatiana Jacob Hessel Bueno Cadima                 	tathibueno@hotmail.com                                                                              	89962251       	\N	2012-03-11 10:57:42	0
1674	207	Leia Costa Matos                                  	leiaplanodesaude@gmail.com                                                                          	37315449       	\N	2012-03-11 12:19:35	\N
1712	226	jumara goncalves                                  	                                                                                                    	8456-6706      	\N	2012-03-11 20:42:46	\N
1711	226	barbara goncalves                                 	                                                                                                    	3692-3547      	\N	2012-03-11 20:42:12	\N
1710	271	Zelandia Ishida                                   	zelandia.ishida@gmail.com                                                                           	2476-2290      	\N	2012-03-11 20:35:27	\N
1709	237	Vera Paes                                         	                                                                                                    	37350858       	\N	2012-03-11 12:56:07	\N
1679	235	Fernando Takahashi                                	                                                                                                    	92183773       	\N	2012-03-11 12:26:54	\N
1680	201	Celina                                            	                                                                                                    	4169-8138      	\N	2012-03-11 12:27:14	\N
1681	201	Orlando                                           	                                                                                                    	9485-6406      	\N	2012-03-11 12:27:43	\N
1682	235	Cristhiane Takahashi                              	                                                                                                    	92663283       	\N	2012-03-11 12:28:06	\N
1683	201	Adriana                                           	                                                                                                    	7338-5545      	\N	2012-03-11 12:28:37	\N
1684	235	Priscila Mesquita                                 	                                                                                                    	98287207       	\N	2012-03-11 12:28:48	\N
1685	235	Rodrigo Oliveira                                  	                                                                                                    	99603582       	\N	2012-03-11 12:29:23	\N
1686	285	Ruth Simon                                        	                                                                                                    	37812066       	\N	2012-03-11 12:29:36	\N
1687	235	Tamara                                            	                                                                                                    	99593340       	\N	2012-03-11 12:31:07	\N
1688	283	joao ricardo boccuzzi grimaldi                    	joao.grimaldi@ig.com.br                                                                             	4191-7072      	\N	2012-03-11 12:32:54	2
1689	237	Tereza Cristina C. Silva                          	                                                                                                    	3735-0858      	\N	2012-03-11 12:33:24	\N
1690	354	Patricia ROSEMEIRE Valentim Gomes                 	                                                                                                    	41488389       	\N	2012-03-11 12:34:07	\N
1691	283	kenia picorele torres grimaldi                    	keniatorres@ig.com.br                                                                               	9536-5972      	\N	2012-03-11 12:34:21	\N
1692	237	Elza Campos dos Santos                            	                                                                                                    	3735-0858      	\N	2012-03-11 12:34:33	\N
1845	274	Ruth                                              	                                                                                                    	3731-6182      	\N	2012-03-21 12:03:03	\N
1694	237	Maria Aparecida Campos Mendes                     	                                                                                                    	3735-0858      	\N	2012-03-11 12:35:46	\N
1695	237	Vanda F Goncalves                                 	                                                                                                    	3735-0858      	\N	2012-03-11 12:37:35	\N
1696	237	Marta Rodrigues                                   	                                                                                                    	3735-0858      	\N	2012-03-11 12:38:08	\N
1848	381	Thalita                                           	                                                                                                    	8284-7444      	\N	2012-03-21 13:39:26	\N
1698	283	marcio pereira cavalcante                         	                                                                                                    	4163-3608      	\N	2012-03-11 12:39:28	\N
1975	373	osmar apendino                                    	                                                                                                    	62507585       	\N	2012-04-15 18:32:44	\N
1700	237	Hida Rodrigues                                    	                                                                                                    	3735-0858      	\N	2012-03-11 12:40:08	\N
1858	204	Erica Carvalho Da Silva                           	aa@gmail.com                                                                                        	3655-2815      	\N	2012-03-25 12:11:11	\N
1702	283	bruna torres                                      	                                                                                                    	4163-5953      	\N	2012-03-11 12:41:02	\N
1703	245	Elane lessa                                       	                                                                                                    	36021479       	\N	2012-03-11 12:43:20	2
1704	245	Elidio Silvestre                                  	                                                                                                    	36039803       	\N	2012-03-11 12:44:12	1
1705	245	Eduana Silvestre                                  	                                                                                                    	36039803       	\N	2012-03-11 12:44:55	\N
1706	245	Cira Lessa                                        	                                                                                                    	36024418       	\N	2012-03-11 12:45:39	\N
1707	245	Valdemario Lessa                                  	                                                                                                    	36024418       	\N	2012-03-11 12:46:29	\N
1713	259	Ester Noemi Soares                                	aa@gmail.com                                                                                        	3681-8116      	\N	2012-03-11 20:43:12	\N
1714	222	Elieser                                           	                                                                                                    	8202-0805      	\N	2012-03-11 20:43:27	\N
1715	226	rosangela batista                                 	                                                                                                    	8089-0249      	\N	2012-03-11 20:43:48	\N
1716	256	Wellinton                                         	                                                                                                    	91417505       	\N	2012-03-11 20:43:51	1
1717	222	Talita                                            	                                                                                                    	8202-0805      	\N	2012-03-11 20:43:51	\N
1718	222	Jeferson                                          	                                                                                                    	8202-0805      	\N	2012-03-11 20:44:14	\N
1719	226	maria glicia                                      	                                                                                                    	3605-4617      	\N	2012-03-11 20:44:23	\N
1720	256	Simone                                            	                                                                                                    	91417505       	\N	2012-03-11 20:44:25	\N
1721	222	Rafaela                                           	                                                                                                    	8202-0805      	\N	2012-03-11 20:44:32	\N
1722	222	Mariana                                           	                                                                                                    	8202-0805      	\N	2012-03-11 20:44:49	\N
1723	226	cinara goncalves                                  	                                                                                                    	3692-3547      	\N	2012-03-11 20:45:48	\N
1724	222	Rafael                                            	                                                                                                    	8202-0805      	\N	2012-03-11 20:45:49	\N
1725	222	Renata                                            	                                                                                                    	8202-0805      	\N	2012-03-11 20:46:06	\N
1726	256	Saara Ramalho                                     	                                                                                                    	63005052       	\N	2012-03-11 20:46:07	1
1727	275	Roberto Ciarci Junior                             	aa@gmail.com                                                                                        	3681-5414      	\N	2012-03-11 20:46:45	\N
1728	222	Nayara                                            	                                                                                                    	8202-0805      	\N	2012-03-11 20:48:02	\N
1729	222	Reginer                                           	                                                                                                    	8202-0805      	\N	2012-03-11 20:48:33	\N
1730	222	Nilberth                                          	                                                                                                    	8202-0805      	\N	2012-03-11 20:48:56	\N
1731	222	Mariana Ferreira                                  	                                                                                                    	8202-0805      	\N	2012-03-11 20:49:23	\N
1732	215	Silvia Menezes                                    	                                                                                                    	3608-0225      	\N	2012-03-11 20:53:39	\N
1733	215	Candida Pavao                                     	                                                                                                    	3608-0225      	\N	2012-03-11 20:54:31	\N
1734	277	Romeu Garcia Larajeira                            	helena.biondo@r7.com                                                                                	36853850       	\N	2012-03-11 20:54:39	\N
1735	363	katherine moura g. p. dos santos                  	                                                                                                    	2592-7989      	\N	2012-03-11 20:54:53	1
1736	215	Elisete                                           	                                                                                                    	3608-0225      	\N	2012-03-11 20:54:56	\N
1737	258	Alba Sakamoto                                     	aa@gmail.com                                                                                        	4620-0433      	\N	2012-03-11 20:57:24	\N
1738	235	Fabio Ferreira                                    	                                                                                                    	97393917       	\N	2012-03-11 20:58:12	\N
1739	235	Joice Conessa                                     	                                                                                                    	95626457       	\N	2012-03-11 20:58:55	\N
1740	258	Fernanda Bispo Martins                            	rifer2004@uol.com                                                                                   	3768-3940      	\N	2012-03-11 21:03:53	\N
1741	218	Veria Siqueira da Silva                           	                                                                                                    	3601-2091      	\N	2012-03-11 21:06:47	\N
1742	218	Thiago Luis da Silva                              	                                                                                                    	8266-6958      	\N	2012-03-11 21:07:33	\N
1743	218	Aline Amorin Silva                                	                                                                                                    	8266-6958      	\N	2012-03-11 21:08:06	\N
1748	378	Diego Ruiz                                        	                                                                                                    	6536-3676      	\N	2012-03-16 11:50:06	\N
1746	229	Luciano esposa                                    	                                                                                                    	4139-7439      	\N	2012-03-15 22:05:13	\N
1749	378	Donizete de Lima                                  	                                                                                                    	6536-3676      	\N	2012-03-16 11:52:11	\N
1750	379	Andressa                                          	                                                                                                    	2768-7002      	\N	2012-03-16 12:54:38	\N
1752	376	Kelly Maria de Santana Batista                    	                                                                                                    	8235-1025      	\N	2012-03-16 14:30:55	3
1853	236	irmã                                              	mgracas.araujo@gmail.com                                                                            	25032910       	\N	2012-03-22 09:21:09	\N
1852	236	Kelly                                             	mgracas.araujo@gmail.com                                                                            	25032910       	\N	2012-03-22 09:20:28	\N
1851	236	Beatriz                                           	mgracas.araujo@gmail.com                                                                            	25032910       	\N	2012-03-22 09:19:43	\N
1757	285	Suzy                                              	                                                                                                    	86698047       	\N	2012-03-18 10:40:45	\N
1758	285	Alex                                              	                                                                                                    	86698047       	\N	2012-03-18 10:41:15	\N
1759	246	Elizangela Nunes                                  	soueliz@gmail.com                                                                                   	               	\N	2012-03-18 11:58:10	\N
2135	211	xxxxxxxxxxxxxxxxxxxx                              	                                                                                                    	93128297       	\N	2012-05-10 09:38:53	\N
1761	210	Carmen Yosino                                     	                                                                                                    	37351256       	\N	2012-03-18 12:01:52	\N
1762	238	eliana helena                                     	                                                                                                    	37212727       	\N	2012-03-18 12:01:54	\N
1763	353	Debora Olivia                                     	debora_olivia@yahoo.com                                                                             	37634551       	\N	2012-03-18 12:02:16	\N
1764	246	Lucinha Vicente                                   	lu_vicente@yahoo.com.br                                                                             	9505-1150      	\N	2012-03-18 12:02:19	\N
1765	238	joao vitor                                        	                                                                                                    	37212727       	\N	2012-03-18 12:02:38	\N
1766	201	Patricia Freitas                                  	freitas.patriciab@gmail.com                                                                         	70034443       	\N	2012-03-18 12:02:46	\N
1767	350	Sonia Regina Gomes                                	srg@soniareginagomes.com.br                                                                         	4169-8475      	\N	2012-03-18 12:03:14	\N
1951	245	Sergio Paulo                                      	aa@gmail.com                                                                                        	1111-1111      	\N	2012-04-15 11:56:45	\N
1769	210	tereza da silva metidieri                         	tmetidieri@ibest.com.br                                                                             	3731-3581      	\N	2012-03-18 12:03:36	\N
1770	255	Yonara dantas de Oliveira                         	yonaradantas@yahoo.com.br                                                                           	8039-9168      	\N	2012-03-18 12:03:50	\N
1771	210	Lindaura Teixeira                                 	                                                                                                    	76083272       	\N	2012-03-18 12:03:58	\N
1772	250	Silvio Batista de Oliveira                        	silvio_batista@hotmail.com                                                                          	80484414       	\N	2012-03-18 12:04:41	\N
1977	219	Natascha                                          	                                                                                                    	3915-8958      	\N	2012-04-15 18:47:27	\N
1774	234	Denise de Souza Scala                             	godenisescala@yahoo.com.br                                                                          	23852411       	\N	2012-03-18 12:04:47	\N
1775	255	Miguel Antar                                      	miguedz5@gmail.com                                                                                  	6539-3645      	\N	2012-03-18 12:04:48	\N
1776	350	Richard Huebner                                   	richard_huebner@hotmail.com                                                                         	4169-8475      	\N	2012-03-18 12:05:37	\N
1777	212	Karla Cristina Ravanelli Capelas                  	karla.ravanelli@ibest.com.br                                                                        	9191-3952      	\N	2012-03-18 12:05:56	\N
1778	356	maria tania                                       	                                                                                                    	37826728       	\N	2012-03-18 12:06:50	\N
1779	229	debora  coelho                                    	debora@amy.com.br                                                                                   	7655-7473      	\N	2012-03-18 12:07:13	\N
1780	356	luciana da silva                                  	lu.ssousa4@hotmail.com                                                                              	37826728       	\N	2012-03-18 12:07:53	\N
1781	229	cesar coelho                                      	cesar@prostudio.arq.br                                                                              	7634-7559      	\N	2012-03-18 12:08:00	\N
1782	370	Nadia de Carvalho Outor                           	nadia.outor@hotmail.com                                                                             	37143263  82019	\N	2012-03-18 12:08:19	1
1783	251	marcelo curtale                                   	curtale@ig.com.br                                                                                   	66452305       	\N	2012-03-18 12:10:19	1
1784	354	Jorge Hugo Bustamente Canales                     	jorge@itempisos.com.br                                                                              	7658-0949      	\N	2012-03-18 12:10:41	1
1785	251	siomara curtale                                   	                                                                                                    	89575154       	\N	2012-03-18 12:10:55	\N
1786	370	Ayokunle Onasanya                                 	aayoonas72@yahoo.co.uk                                                                              	3535-0562      	\N	2012-03-18 12:11:22	2
1787	234	Rose Gonçalves                                    	rosegoncalves@yahoo.com.br                                                                          	84568371       	\N	2012-03-18 12:12:40	\N
1788	370	Titilope Onasanya                                 	ayoonas72@yahoo.co.uk                                                                               	3535-0562      	\N	2012-03-18 12:12:52	\N
2065	250	Jairo Jr.                                         	jota6341@hotmail.com                                                                                	7151-8712      	\N	2012-04-29 20:49:35	\N
1790	283	ANDREIA nalva dos Santas                          	andreia.santas@abtar.com                                                                            	7151-7454      	\N	2012-03-18 12:14:10	\N
1791	238	Marcelo Tavares                                   	nanci-avila@bol.com.br                                                                              	3731-4059      	\N	2012-03-18 12:14:38	\N
1792	283	Carlos Fabro                                      	carlosfabro@uol.com.br                                                                              	7151-7454      	\N	2012-03-18 12:15:11	\N
1793	225	angela chaves                                     	angela.archaves@hotmail.com                                                                         	9914-2113      	\N	2012-03-18 12:16:12	\N
1794	220	Eliane Papapietro                                 	                                                                                                    	8322-0049      	\N	2012-03-18 12:17:27	\N
1795	225	paulo chaves                                      	pauloschaves1957@yahoo.com.br                                                                       	7434-1944      	\N	2012-03-18 12:17:33	\N
1804	225	Francismar Faria                                  	ffaria@mitsuialimentos.com                                                                          	3592-8351      	\N	2012-03-18 19:08:23	\N
1797	225	josimar faria                                     	                                                                                                    	3592-8351      	\N	2012-03-18 12:18:48	\N
1798	244	TAIS NETO ASAKURA                                 	asakura_house@terra.com.br                                                                          	3735-3125      	\N	2012-03-18 12:25:26	1
1799	244	agnaldo asakura                                   	asakura_house@terra.com.br                                                                          	8917-7545      	\N	2012-03-18 12:26:36	\N
1800	201	claudia leite                                     	claudia.a.leite@hotmail.com                                                                         	4702-9741      	\N	2012-03-18 12:34:24	2
1801	201	andre leite                                       	andre.leite@innovative.com.br                                                                       	9619-5674      	\N	2012-03-18 12:35:14	\N
1802	352	Fabio Simões                                      	aa@gmail.com                                                                                        	3683-0132      	\N	2012-03-18 18:54:42	2
1803	352	Alessandra reis                                   	22@gmail.com                                                                                        	3683-0132      	\N	2012-03-18 18:55:38	\N
1805	378	Roselaine Palma de Avila Reis                     	biaecia@ig.com.br                                                                                   	47029812 - 7065	\N	2012-03-18 20:35:33	2
1806	378	Saulo de Tarso de Avila Reis                      	                                                                                                    	70656103       	\N	2012-03-18 20:36:28	\N
1807	373	Fernando Iwao Nakshima                            	voo_da_aguia_2377@hotmail.com                                                                       	3783-2229      	\N	2012-03-18 20:38:13	\N
1808	350	marcelo de souza                                  	mfagundes2010@hotmail.com                                                                           	78256330       	\N	2012-03-18 20:38:32	\N
1809	373	Marcelo Seiji Nakashima                           	22@gmail.com                                                                                        	3783-2229      	\N	2012-03-18 20:39:05	\N
1810	370	katlen boedler                                    	katlen.boedler@hotmail.com                                                                          	96693407       	\N	2012-03-18 20:39:27	2
1811	350	eliane almeida da silva fagundes                  	                                                                                                    	78256330       	\N	2012-03-18 20:39:36	1
1812	250	Adilson Benvindo de Araújo                        	                                                                                                    	85475519       	\N	2012-03-18 20:39:37	1
1813	373	Regina Bernadete Funchal                          	aa@gmail.com                                                                                        	3783-2229      	\N	2012-03-18 20:39:54	\N
1814	370	georg boedler                                     	                                                                                                    	96693407       	\N	2012-03-18 20:40:07	\N
1815	276	Marcos Pereira Bertoldo                           	marcos-bertoldo@hotmail.com                                                                         	6820-8132      	\N	2012-03-18 20:40:17	1
1816	250	Ligia Viana Gonçalves de Araújo                   	                                                                                                    	85475519       	\N	2012-03-18 20:40:34	\N
1866	247	andressa beatriz patornilio (12 anos)             	ariene_patornilio@ig.com.br                                                                         	98180291       	\N	2012-03-25 20:46:10	\N
1850	384	Lucimen Costa Oliveira                            	                                                                                                    	4771-3242      	\N	2012-03-21 14:59:19	\N
2064	219	Fernando                                          	                                                                                                    	3681-1882      	\N	2012-04-29 20:05:37	\N
1849	384	Wagner de Oliveira                                	wrgwgf@yahoo.com.br                                                                                 	47713242       	\N	2012-03-21 14:58:40	\N
2063	219	Fabiana                                           	                                                                                                    	3681-1882      	\N	2012-04-29 20:04:34	\N
1865	247	Ariene Bleide Fischer                             	ariene_patornilio@ig.com.br                                                                         	98180291       	\N	2012-03-25 20:44:54	\N
1823	240	Samuel Rodrigues Ayres                            	samuel@unysistem.com.br                                                                             	81650375       	\N	2012-03-18 20:44:12	\N
1824	235	Leticia Regina Ferreira Sanchetta                 	leticiarff@hotmail.com                                                                              	84678799       	\N	2012-03-18 20:45:15	\N
1825	235	Renato de Sousa Sanchetta                         	                                                                                                    	81169712       	\N	2012-03-18 20:46:09	\N
1826	377	Vanessa Leber                                     	                                                                                                    	34263628  - 999	\N	2012-03-18 20:46:22	\N
1827	377	andreas leber                                     	                                                                                                    	34263628       	\N	2012-03-18 20:47:07	\N
1828	377	Denice Rosini                                     	                                                                                                    	78963711       	\N	2012-03-18 20:48:20	\N
1829	377	Gabriel Rosini                                    	                                                                                                    	78963711       	\N	2012-03-18 20:48:53	\N
1830	377	Valdecy                                           	                                                                                                    	37825321       	\N	2012-03-18 20:49:19	\N
1831	354	Juliana Silva de Andrade                          	                                                                                                    	99218332       	\N	2012-03-18 20:49:35	2
1832	377	Regina Bernardete                                 	                                                                                                    	37832229       	\N	2012-03-18 20:49:44	\N
1833	377	Jenny Abanto Santana                              	                                                                                                    	28198683       	\N	2012-03-18 20:50:24	\N
1834	264	cristiane rodrigues ferreira                      	cris_rf27@yahoo.com.br                                                                              	37836053       	\N	2012-03-18 20:53:26	\N
1835	264	eva borges dos santos                             	vbeva@hotmail.com                                                                                   	73150843       	\N	2012-03-18 20:57:52	\N
1836	353	Roberta                                           	aa@gmail.com                                                                                        	2193-6688      	\N	2012-03-20 15:09:31	\N
1837	353	Patricia                                          	aa@gmail.com                                                                                        	2193-6688      	\N	2012-03-20 15:09:55	\N
1838	353	Adriano                                           	aa@gmail.com                                                                                        	2193-6688      	\N	2012-03-20 15:10:20	\N
1839	353	Alessandra                                        	aa@gmail.com                                                                                        	2193-6688      	\N	2012-03-20 15:10:49	\N
1840	353	Alessandro                                        	aa@gmail.com                                                                                        	2193-6688      	\N	2012-03-20 15:11:12	\N
1841	353	Ramon                                             	aa@gmail.com                                                                                        	2193-6688      	\N	2012-03-20 15:11:39	\N
1842	353	Maria Ângela                                      	aa@gmail.com                                                                                        	2193-6688      	\N	2012-03-20 15:12:01	\N
1843	353	Marcia                                            	aa@gmail.com                                                                                        	2193-6688      	\N	2012-03-20 15:12:24	\N
1844	353	Vivian Corominas                                  	aa@gmail.com                                                                                        	2193-6688      	\N	2012-03-20 15:12:55	\N
1976	202	cleunice aparecida dos reis soares                	cleunice.reis@carrera.com.br                                                                        	36492075       	\N	2012-04-15 18:35:19	\N
1860	204	Ricardo Da Silva                                  	aa@gmail.com                                                                                        	3655-2815      	\N	2012-03-25 12:12:17	\N
1861	274	olga oliveira nunes                               	olganunes29@hotmail.com                                                                             	79752632       	\N	2012-03-25 12:12:52	2
1862	274	emerson araujo da silva                           	araujo_eas@hotmail.com                                                                              	67611962       	\N	2012-03-25 12:14:59	\N
1863	379	Luciene Rodighro dos Santos                       	ronaldo.luciene@uol.com.br                                                                          	3654-1003      	\N	2012-03-25 12:15:31	\N
1864	379	Ronaldo dos Santos                                	ronaldo.luciene@uol.com.br                                                                          	3654-1003      	\N	2012-03-25 12:15:58	\N
1867	220	giselia rodrigues chaves                          	babychaves@hotmail.com                                                                              	3842-6765      	\N	2012-03-25 20:46:51	\N
1868	220	giselda rodrigues chaves giglio                   	                                                                                                    	3842-6765      	\N	2012-03-25 20:48:10	\N
1869	248	marco antonio de abreu                            	marcoadeabreu@ig.com.br                                                                             	23672232       	\N	2012-03-25 20:51:26	\N
1870	215	Neide Baena                                       	                                                                                                    	3608-0225      	\N	2012-03-25 20:53:15	\N
1871	276	Edna Ramos dos Santos                             	ednaramos2@ig.con.br                                                                                	36094532       	\N	2012-03-25 20:54:58	\N
1872	276	Flavio Ferreira dos Santos                        	flavioferreira1979@bol.com.br                                                                       	36094532       	\N	2012-03-25 20:55:59	\N
1873	232	Tayna Lima                                        	tayna.s2@gmail.com                                                                                  	7781-9158      	\N	2012-03-25 21:09:22	\N
1874	232	Leila cordeiro                                    	lcordeiro@sabesp.com.br                                                                             	7200-3108      	\N	2012-03-25 21:10:16	\N
1875	232	Rafael Lopes                                      	lopes116@gmail.com                                                                                  	7778-7845      	\N	2012-03-25 21:11:12	\N
1876	383	Juliana Melo                                      	aa@gmail.com.br                                                                                     	82844788       	\N	2012-03-28 12:58:38	\N
1877	383	Yasmin Bazilli                                    	aa@gmail.com                                                                                        	86408218       	\N	2012-03-28 12:59:08	\N
1878	383	Vanessa Cristina                                  	aa@gmail.com                                                                                        	84366049       	\N	2012-03-28 12:59:45	\N
2119	217	Carolina Martins Milhoranza                       	cmilhoranza@hotmail.com                                                                             	 3599-7109     	\N	2012-05-08 14:41:26	\N
1880	376	Rodrigo Assis                                     	tuning206@gmail.com                                                                                 	               	\N	2012-03-28 15:55:43	\N
1881	386	Fátima                                            	                                                                                                    	75190301       	\N	2012-03-28 17:51:41	\N
1882	386	Cleonice                                          	marcnando@gmail.com                                                                                 	               	\N	2012-03-28 17:52:12	\N
1883	247	Maritania                                         	                                                                                                    	81306168       	\N	2012-04-01 12:03:33	2
1884	281	elisa tiaki ozaki                                 	                                                                                                    	37194076       	\N	2012-04-01 12:03:39	\N
1885	225	Lurdes de Oliveira                                	                                                                                                    	36860639       	\N	2012-04-01 12:04:30	\N
1886	207	Ana Claudia Souza Ramos Siqueira                  	anacsramos@hotmail.com                                                                              	64448756       	\N	2012-04-01 12:06:01	\N
1887	225	Fernanda Ferreira de Lima                         	                                                                                                    	36860639       	\N	2012-04-01 12:07:10	\N
1888	220	wander kikuti                                     	                                                                                                    	37680136       	\N	2012-04-01 12:07:18	\N
1889	235	Luciana Honorato                                  	                                                                                                    	98352622       	\N	2012-04-01 12:08:16	\N
1890	210	Andrea Plasa                                      	franplasa2011@hotmail.com                                                                           	52141893       	\N	2012-04-01 12:09:29	\N
1891	217	Jaqueline Pelison                                 	suporteform@yahoo.com.br                                                                            	39443956       	\N	2012-04-01 12:10:45	1
1892	373	Edvaldo Liberato da Silva                         	edvaldo.liberato@gmail.com                                                                          	37269056       	\N	2012-04-01 12:11:32	\N
1893	373	Jane Cunha da Silva                               	edvaldo.liberato@gmail.com                                                                          	37269056       	\N	2012-04-01 12:12:26	\N
1894	385	Andrea Plasa                                      	franplasa2011@hotmail.com                                                                           	52141893       	\N	2012-04-01 12:13:06	1
1895	385	Gilberto Valeriano Moreira                        	                                                                                                    	84988788       	\N	2012-04-01 12:13:40	\N
1896	220	ruth soares citranglo                             	ruthsoarescitranglo@gmail.com                                                                       	37140923       	\N	2012-04-01 12:14:27	\N
1897	376	SONIA SCRIPINIC                                   	                                                                                                    	37193870       	\N	2012-04-01 12:16:22	\N
1898	376	ROGERIO SCRIPINIC                                 	                                                                                                    	37193870       	\N	2012-04-01 12:16:51	\N
2066	250	REGINA CELIA M NASCIMENTO                         	                                                                                                    	36375192       	\N	2012-04-29 20:51:41	\N
2067	382	Erica                                             	                                                                                                    	8336-5516      	\N	2012-04-29 20:52:14	2
1901	226	lucimara mqdias                                   	lucimaraq12@hotmail.com                                                                             	37836683       	\N	2012-04-01 12:21:49	2
1902	285	Miriam Vitoriano da SIlva                         	m2vitoriano@yahoo.com.br                                                                            	3782           	\N	2012-04-01 12:24:45	1
1903	285	Antonio Vitoriano                                 	reportagem@vitorianostudios.com.br                                                                  	94449497       	\N	2012-04-01 12:25:45	\N
1904	359	IRENE VITOLS                                      	ivitols@hotmail.com                                                                                 	37146689       	\N	2012-04-01 12:26:32	\N
1905	215	maria de lourdes                                  	                                                                                                    	2779-9488      	\N	2012-04-01 20:36:58	\N
1906	231	Daniela Soares                                    	dani.paris.soares@hotmail.com                                                                       	76252275       	\N	2012-04-01 20:39:18	\N
1907	202	isa maria dos reis                                	repuspestudantes@gmail.com                                                                          	96064651       	\N	2012-04-01 20:39:26	\N
1908	383	bruna milany                                      	brudiis_rs@hotmail.com                                                                              	6835-0931      	\N	2012-04-01 20:39:57	\N
1909	202	carlos alberto oliva                              	                                                                                                    	96064651       	\N	2012-04-01 20:40:16	1
1910	231	Milton Junior                                     	mmjunior@overcomex.com.br                                                                           	77726138       	\N	2012-04-01 20:40:21	\N
1947	383	celso de melo vieira souza                        	                                                                                                    	6187-7133      	\N	2012-04-10 15:10:52	\N
1912	384	JONAS LEITE SILVA                                 	jonas.leite-silva@itau-unibanco.com.br                                                              	4787-6112      	\N	2012-04-01 20:42:24	\N
1913	380	Cristiane Franciscato Cruz                        	ccruz@sbb.org.br                                                                                    	989881155      	\N	2012-04-01 20:42:50	2
1914	247	Marisa Cipriano Alves                             	marisaovelha@hotmail.com                                                                            	37142444       	\N	2012-04-01 20:42:52	\N
1915	202	carmem lucia dos reis                             	billuxd_@hotmail.com                                                                                	74237293       	\N	2012-04-01 20:42:56	1
1916	384	FLAVIA SARTORI                                    	f_sarttori@hotmail.com                                                                              	8709-4553      	\N	2012-04-01 20:43:31	\N
1917	256	amanda cristina bezerra                           	mandinha.engenheira@gmail.com                                                                       	8050-3575      	\N	2012-04-01 20:45:40	\N
1918	377	SIMONE DE LIMA GERMANO                            	fisioslg@hotmail.com                                                                                	9969-6366      	\N	2012-04-01 20:45:45	\N
1919	386	Selma Santos                                      	selmassantos1@hotmail.com                                                                           	34315199       	\N	2012-04-01 20:45:53	1
1920	386	Carlos Silva                                      	selmassantos1@hotmail.com                                                                           	34315199       	\N	2012-04-01 20:46:55	\N
1921	247	LUCIENE BERNARDES DE SANTANA ALMEIDA              	lucienebernardes@hotmail.com                                                                        	99821988       	\N	2012-04-01 20:48:13	2
1922	359	Elaine                                            	                                                                                                    	7020-2648      	\N	2012-04-01 20:48:28	\N
1923	247	JOSE EDUARDO CARNEIRO ALMEIDA                     	eduardo@autoperfect.com.br                                                                          	7721-8556      	\N	2012-04-01 20:49:17	\N
1924	220	Marcia Alves Mota                                 	so_mota@hotmail.com                                                                                 	9253-3922      	\N	2012-04-01 20:49:31	\N
1925	244	Gilda Cristina Caggiano Giacono                   	cristina.caggiano70@gmail.com                                                                       	77741116       	\N	2012-04-01 20:53:00	\N
1926	383	mara regina ribeiro                               	mre.ribeiro@hotmail.com                                                                             	36053371       	\N	2012-04-01 20:53:05	\N
1927	383	Fernanda Viana Ferreira                           	fernanda.viana@brasanitas.com.br                                                                    	8179-5751      	\N	2012-04-01 20:58:32	\N
1928	256	carla gonzaga rabetti                             	carlagrabetti@hotmail.com                                                                           	8227-9343      	\N	2012-04-01 21:02:21	\N
1929	224	zureide spinoza scalco delmasso                   	zu-scalco@bol.com.br                                                                                	3714-0101      	\N	2012-04-08 12:02:12	\N
1930	351	reginaldo paulo da silva                          	regispaulo2008@ig.com.br                                                                            	9611-7596      	\N	2012-04-08 12:07:35	\N
1931	351	fabiana cristina damaceno vsilva                  	phabycd@hotmail.com                                                                                 	9964-7751      	\N	2012-04-08 12:08:21	\N
1932	377	SUZANA SALAZAR                                    	sussimar@hotmail.com                                                                                	12 - 8143-8843 	\N	2012-04-08 12:08:48	0
1933	355	hugo albuquerque                                  	hpralbuquerque@yahoo.com                                                                            	29248138       	\N	2012-04-08 12:08:51	\N
1934	370	aline rodrigues maia reinehr                      	alinemaiasp@hotmail.com                                                                             	3684-0258      	\N	2012-04-08 12:10:02	1
1935	377	EDWARD FLOREZ PACHECO                             	ted.florez@gmail.com                                                                                	11 - 7031-7666 	\N	2012-04-08 12:10:08	0
1936	355	leticia albuquerque                               	letegusmao@hotmail.com                                                                              	29248138       	\N	2012-04-08 12:10:16	1
1937	370	leandro reinehr                                   	alinemaiasp@hotmail.com                                                                             	3684-0258      	\N	2012-04-08 12:10:56	\N
1953	274	Aida Rufino de Oliveira                           	aidarufino@terra.com.br                                                                             	94737798       	\N	2012-04-15 11:58:52	1
1939	210	luiza vieira                                      	                                                                                                    	3733-7183      	\N	2012-04-08 12:17:45	\N
1952	245	Arlete                                            	aa@gmail.com                                                                                        	1111-1111      	\N	2012-04-15 11:57:50	\N
1941	244	creusa cavalcante santos                          	creuka@hotmail.com                                                                                  	37811327       	\N	2012-04-08 12:24:23	\N
1942	244	meuchar cavalcante da silva                       	                                                                                                    	37811327       	\N	2012-04-08 12:25:16	\N
2148	389	Andrea Carla de Moraes Calheiros                  	andreacarla-lins@uol.com.br                                                                         	 (11) 84047532 	\N	2012-06-19 16:25:37	\N
1944	385	Raquel Buoery                                     	                                                                                                    	83673903       	\N	2012-04-08 20:34:37	\N
1945	385	Isabelle Jesus                                    	                                                                                                    	83674605       	\N	2012-04-08 20:35:16	\N
1946	285	Ligianne Monteiro                                 	ligianne@hotmail.com                                                                                	3766-8795      	\N	2012-04-10 15:07:19	\N
1950	386	Luciana Mota Sylvestrin                           	lsylvestrin@adp.com.br                                                                              	8652-7604      	\N	2012-04-10 15:18:35	1
1949	251	ana carolina belmonte                             	cabelmon@yahoo.com.br                                                                               	4702-6800      	\N	2012-04-10 15:15:24	1
2062	238	ronaldo B. Costa                                  	                                                                                                    	9732-9537      	\N	2012-04-29 19:48:49	\N
1955	256	Adriana de Souza Gama                             	adriana_sushi@hotmail.com                                                                           	6864-0391      	\N	2012-04-15 12:01:49	\N
1956	382	ALBERTO ZOBOLI                                    	a.zoboli@hotmail.com                                                                                	82262709       	\N	2012-04-15 12:02:43	1
1957	382	ALINNE G K  ZOBOLI                                	alinne.zoboli@hotmail.com                                                                           	81662222       	\N	2012-04-15 12:03:37	\N
1958	359	elaine cristina chaves lima                       	                                                                                                    	3682-4179      	\N	2012-04-15 12:05:51	2
1959	359	welbison lopes lima                               	                                                                                                    	3682-4179      	\N	2012-04-15 12:07:01	\N
1960	281	Maria Helena de Lima                              	limamh@hotmail.com                                                                                  	8502-0558      	\N	2012-04-15 12:07:41	1
1961	234	Alessandra L. dos Santps                          	m_stos@ig.com.br                                                                                    	2507-3733      	\N	2012-04-15 12:09:16	\N
1962	234	Mario dos Santos                                  	m_santos@ig,com.br                                                                                  	2507-3733      	\N	2012-04-15 12:10:05	\N
1963	215	vera lucia nogueira medeiros                      	luciaveranm@bol.com.br                                                                              	7150-5555      	\N	2012-04-15 12:13:17	\N
1964	381	Fernanda Garcia Pires                             	ffeffs@gmail.com                                                                                    	7466-5459      	\N	2012-04-15 12:13:51	\N
1965	285	MARCIA DE SOUZA T. LIMA                           	marciaso@cte.com.br                                                                                 	91371344       	\N	2012-04-15 12:18:15	2
1966	377	Gabriela Moraes                                   	ghbmoraes@gmail.com                                                                                 	66063932       	\N	2012-04-15 12:20:34	\N
1967	377	Daniel Moraes                                     	daniel.net.moraes@hotmail.com                                                                       	660 63932      	\N	2012-04-15 12:21:39	\N
1968	351	silvia claudia da fonseca                         	klaufonseca@uol.com.br                                                                              	3621-6141      	\N	2012-04-15 12:24:03	\N
1969	231	FERNANDO MOREIRA                                  	fe_moreira@terra.com.br                                                                             	8400-1345      	\N	2012-04-15 12:24:36	2
1970	231	SILVIA OLAH MOREIRA                               	silvia.olah@terra.com.br                                                                            	7038-5110      	\N	2012-04-15 12:25:27	\N
1971	264	José Roberto Goudinho                             	joseroberto5goudinho@hotmail.com                                                                    	72878363       	\N	2012-04-15 12:28:05	\N
1972	277	José Roberto Goudinho                             	joseroberto5goudinho@hotmail.com                                                                    	72878363       	\N	2012-04-15 12:29:05	\N
1973	271	Eliezer Miranda S Silva                           	eliezer28081982@hotmail.com                                                                         	6435-6925      	\N	2012-04-15 12:33:12	\N
1974	242	Eveline                                           	                                                                                                    	6642-4430      	\N	2012-04-15 18:10:31	1
1978	216	Dina P dos Santos                                 	                                                                                                    	4306-8232      	\N	2012-04-15 18:50:37	\N
1979	216	Gildetete teixeira                                	                                                                                                    	3656-5631      	\N	2012-04-15 18:51:23	\N
1980	216	Maria Aparecida B. Gonçalves                      	8187-1736@gmail.com                                                                                 	3685-0850      	\N	2012-04-15 18:52:54	\N
1981	278	Filipe Cunha                                      	                                                                                                    	12345678       	\N	2012-04-15 19:02:16	\N
1982	278	Gleice                                            	                                                                                                    	12345678       	\N	2012-04-15 19:02:45	\N
1986	354	Lilian Vanessa O. Duarte                          	lilianvduarte@ig.com.br                                                                             	3685-3674      	\N	2012-04-15 20:21:29	\N
1984	354	Igor Ibraim                                       	                                                                                                    	3685-3674      	\N	2012-04-15 20:17:23	\N
1985	354	Roberto Carlos Ibraim                             	                                                                                                    	3685-3674      	\N	2012-04-15 20:18:22	\N
1987	373	Irma Santos Cunha                                 	irmasantoscunha@hotmail.com                                                                         	46162173       	\N	2012-04-15 21:16:57	\N
1988	381	Giovana Ribeiro dos Santos                        	g_rsantos@yahoo.com.br                                                                              	8345-8587      	\N	2012-04-15 21:17:46	\N
1989	381	ANA LUCIA LUIZ DE SOUZA                           	ana_luizsouza@yahoo.com.br                                                                          	3485-4818      	\N	2012-04-15 21:31:41	0
1990	381	Charline Souza                                    	charlineverklart@hotmail.com                                                                        	8820-6680      	\N	2012-04-15 21:32:18	\N
1991	381	ARTUR FERREIRA DE SOUZA                           	arthur22_buri@yahoo.com.br                                                                          	7985-2860      	\N	2012-04-15 21:32:47	\N
1992	381	Helder Yamamoto                                   	                                                                                                    	79998007       	\N	2012-04-15 21:33:23	\N
1993	359	Renato Rocha                                      	rocha.rm@gmail.com                                                                                  	8189-0222      	\N	2012-04-18 17:10:30	2
1994	359	Aldilene Campelo Rocha                            	aldi.rocha@gmail.com                                                                                	8577-8150      	\N	2012-04-18 17:10:57	\N
1995	277	Gilmara Souza Reis Caccaro                        	gilbaccaro.@ibst.com.br                                                                             	83474516       	\N	2012-04-22 10:34:59	1
1996	277	Milva da Silva Carvalho                           	carvalho.milva@gmail.com                                                                            	36053220       	\N	2012-04-22 10:35:34	\N
1997	238	Noemi Vasconcellos dos Santos                     	noemisan@iq.usp.br                                                                                  	9637-3647      	\N	2012-04-22 11:58:01	\N
1998	381	Dina                                              	                                                                                                    	84584864       	\N	2012-04-22 12:11:23	\N
1999	381	Ester                                             	                                                                                                    	8644-3003      	\N	2012-04-22 12:11:56	\N
2000	355	Elaine Luithardt de Medeiros                      	                                                                                                    	2894-7275      	\N	2012-04-22 12:13:46	2
2001	246	MARIA JOSÉ DA SILVA LUGLI                         	                                                                                                    	86101805       	\N	2012-04-22 12:14:52	\N
2002	387	Tania G Monteiro                                  	                                                                                                    	9230-7710      	\N	2012-04-22 12:20:07	1
2003	257	Solange Cardoso Martins                           	                                                                                                    	37614045       	\N	2012-04-22 12:21:57	\N
2004	257	Maurina da Silva Carvalho                         	                                                                                                    	38815213       	\N	2012-04-22 12:22:29	\N
2005	230	Elisangela Oliveira                               	elifejo.2012@terra.com.br                                                                           	3608-7787      	\N	2012-04-22 12:22:54	1
2006	257	Sebastiao Araujo de Carvalho                      	                                                                                                    	38815213       	\N	2012-04-22 12:22:57	\N
2007	230	Fernades Oliveira                                 	fernandes.da@terra.com.br                                                                           	3608-7787      	\N	2012-04-22 12:24:00	\N
2008	377	Otaviano Santana                                  	                                                                                                    	37682919       	\N	2012-04-22 12:27:56	\N
2009	377	Leondina Cosmo de Santada                         	                                                                                                    	37682919       	\N	2012-04-22 12:28:40	\N
2010	377	Rosana C Santana                                  	                                                                                                    	37682919       	\N	2012-04-22 12:29:15	\N
2011	202	Loren Milena                                      	lorenmilena.reis@gmail.com                                                                          	8472-3081      	\N	2012-04-22 18:39:32	\N
2012	220	Nelson Crepaldi                                   	                                                                                                    	6617-9494      	\N	2012-04-22 18:57:33	\N
2013	250	Miriam Dias Santos Silva                          	                                                                                                    	4701-0158      	\N	2012-04-22 20:36:16	\N
2014	250	Giovanne Pereira da Silva                         	giovanne_silva@uol.com.br                                                                           	4701-0158      	\N	2012-04-22 20:38:25	\N
2015	240	MICHELE ALVES                                     	miamil24@hotmail.com                                                                                	8626-6549      	\N	2012-04-22 20:43:29	0
2016	264	Rodrigo da Silva                                  	rodrigo.melchior@hotmail.com                                                                        	8012-5786      	\N	2012-04-22 20:44:00	\N
2017	240	ANDERSON FABIO ALVES                              	fabio.anderson@hotmail.it                                                                           	8626-7524      	\N	2012-04-22 20:44:29	0
2018	264	Carolina Batista Maldonado Rodrigues              	carollina_maldonado@hotmail.com                                                                     	6097-2891      	\N	2012-04-22 20:45:19	\N
2019	377	MILENA TEIXEIRA DA CUNHA SANGI                    	cunha_milena@yahoo.com.br                                                                           	9249-9098      	\N	2012-04-22 20:49:43	0
2020	377	RICARDO DIAS SANGI                                	cunha_milena@yahoo.com.br                                                                           	7839-5987      	\N	2012-04-22 20:50:41	0
2021	202	Maria Vanilde Pereira Medrado                     	                                                                                                    	36092966       	\N	2012-04-22 20:54:53	\N
2022	230	Mariele Galvao de Oliveira                        	mariele_rod@yahoo.com.br                                                                            	3695-1165      	\N	2012-04-22 20:57:54	\N
2023	230	Rodrigo Pereira de Oliveira                       	                                                                                                    	8364-2230      	\N	2012-04-22 20:58:46	\N
2024	247	CLAUDIA KNUPP FERNANDES                           	claudiakfernandes@gmail.com                                                                         	7977-0392      	\N	2012-04-22 21:01:36	2
2025	247	DANIEL MENDES FERNANDES                           	daniel@myofficehome.com.br                                                                          	7402-9947      	\N	2012-04-22 21:03:07	0
2027	370	ELBSON                                            	                                                                                                    	7768 0657      	\N	2012-04-29 11:09:56	\N
2028	387	Kelli dos Santos Oliveira                         	                                                                                                    	25327052       	\N	2012-04-29 12:07:52	1
2029	204	alessandra regina de souza                        	alessandra.souza2504@yahoo.com.br                                                                   	3416-7652      	\N	2012-04-29 12:07:55	\N
2030	387	Thiago Ferreira Borges                            	                                                                                                    	91156543       	\N	2012-04-29 12:08:30	\N
2031	224	Greice Oliveira                                   	gre.ferreira@hotmail.com                                                                            	37651019       	\N	2012-04-29 12:11:09	\N
2032	276	dayana timoteo pinto                              	daydeusefiel@hotmail.com                                                                            	8015-0156      	\N	2012-04-29 12:13:48	\N
2033	209	Alessandra Cristina da Silva                      	aleshalon@hotmail.com                                                                               	74624971       	\N	2012-04-29 12:15:02	\N
2034	225	Eliana de Araujo Furtado                          	                                                                                                    	3448-5039      	\N	2012-04-29 12:15:06	\N
2035	238	Ana Daneida Villanueva Llapa                      	anavilla777@gmail.com                                                                               	8817-9506      	\N	2012-04-29 12:15:26	1
2120	217	Flavio Martins Milhoranza                         	                                                                                                    	8233-1960      	\N	2012-05-08 14:42:23	\N
2037	224	Vanilza Nogueira de Santana                       	nvanilza@yahoo.com.br                                                                               	74694015       	\N	2012-04-29 12:15:57	\N
2038	238	Jose Manuel Cardenas Medina                       	ppcardenas777@gmail.com                                                                             	94466234       	\N	2012-04-29 12:16:57	\N
2121	350	Elaine Oliveira Francisco                         	elainefranciscorh@gmail.com                                                                         	4243-4402      	\N	2012-05-08 14:53:26	2
2040	234	Karen Brito                                       	karenbrito2@hotmail.com                                                                             	8134-3331      	\N	2012-04-29 12:18:42	\N
2041	250	Jonas Oliveira da Silva                           	jonassilva@usp.com.br                                                                               	8509-8385      	\N	2012-04-29 12:18:57	\N
2042	380	Agostinha Capistrano Rocha                        	                                                                                                    	36014914       	\N	2012-04-29 12:19:26	\N
2043	250	Luciene Conceição de Oliveira                     	lucieneadm01@hotmail.com                                                                            	8148-7442      	\N	2012-04-29 12:19:55	\N
2044	234	Fernando Coelho                                   	fecomi@terra.com.br                                                                                 	8193-0759      	\N	2012-04-29 12:19:55	\N
2045	380	José Ribamar Souza Rocha                          	                                                                                                    	36014914       	\N	2012-04-29 12:19:59	\N
2046	229	roberto teixeira de melo                          	meloroberto@ig.com.br                                                                               	7999-7600      	\N	2012-04-29 12:21:26	\N
2047	229	karina adelia franca de melo                      	adeliakarina1@hotmail.com                                                                           	8913-1949      	\N	2012-04-29 12:22:25	\N
2048	385	Rubens Macedo Bueno                               	ludvc@ig.com.br                                                                                     	68301312       	\N	2012-04-29 12:24:16	1
2049	385	judith felizberto artacho                         	                                                                                                    	9456-4315      	\N	2012-04-29 12:24:34	\N
2118	379	Sophia Gebauer de Jesus                           	                                                                                                    	85785030       	\N	2012-05-06 10:58:00	\N
2051	385	Ludimila Volc Bueno                               	ludvc@ig.com.br                                                                                     	36833063       	\N	2012-04-29 12:25:07	\N
2117	379	Katherine M. G. P. dos Santos                     	                                                                                                    	25927989       	\N	2012-05-06 10:57:16	\N
2053	355	Joci Carla                                        	jogallafrio@gmail.com                                                                               	82656396       	\N	2012-04-29 12:27:57	\N
2054	246	Elaine Cristina                                   	criselaine.castro@hotmail.com                                                                       	88853545       	\N	2012-04-29 12:29:58	\N
2055	212	Luciana Bartolomeu Iadocicco                      	luiadocicco@gmail.com                                                                               	8578-3845      	\N	2012-04-29 12:31:50	\N
2056	230	Romilda Miltus                                    	romildamguerreiro@gmail.com                                                                         	3699-0394      	\N	2012-04-29 12:36:19	\N
2057	230	Victor Luis Castanho Guerreiro                    	vickwolf@gmail.com                                                                                  	3699-0394      	\N	2012-04-29 12:37:29	1
2058	352	Luciano                                           	                                                                                                    	3607-2825      	\N	2012-04-29 12:40:57	\N
2059	352	Elisete                                           	                                                                                                    	36072825       	\N	2012-04-29 12:41:24	\N
2060	212	Martiniano                                        	martinianofolha@terra.com.br                                                                        	3721-3602      	\N	2012-04-29 12:41:44	\N
2061	212	Gersonita                                         	                                                                                                    	3721-3602      	\N	2012-04-29 12:42:46	\N
2068	217	thamirys de oliveira gomes                        	tha.thamirys@gmail.com                                                                              	8653-9471      	\N	2012-04-29 20:53:29	\N
2069	385	Helena Yarmalavicius                              	aa@gmail.com                                                                                        	37269274       	\N	2012-04-29 20:53:29	1
2070	382	Rodrigo                                           	                                                                                                    	8336-5516      	\N	2012-04-29 20:53:32	\N
2071	234	Alexsander Ramos Duarte                           	alexsanderrd@gmail.com                                                                              	6365-8732      	\N	2012-04-29 20:53:57	0
2072	256	Paula Adriana Pires                               	paulaadrianapires@hotmail.com                                                                       	82730378       	\N	2012-04-29 20:53:59	\N
2073	217	joyce canejo coutinho                             	joycec4u@yahoo.com.br                                                                               	8408-9236      	\N	2012-04-29 20:54:33	\N
2074	217	michele bueno oliveira                            	bueno_michele@yahoo.com.br                                                                          	9964-3686      	\N	2012-04-29 20:55:28	\N
2075	219	Vanessa Aguiar                                    	vanessa.castilho@cs.edu.br                                                                          	70474169       	\N	2012-04-29 20:55:37	1
2076	219	Rafael Aguiar                                     	rafael@sogelinvestimentos.com                                                                       	57662601       	\N	2012-04-29 20:56:22	\N
2077	382	Eliane Aparecida Veiga                            	elianeveiga@globomail.com                                                                           	3783-2240      	\N	2012-04-29 20:56:30	2
2078	382	Fabio Josino da Silva                             	fabiojosino@globomail.com                                                                           	3782-2240      	\N	2012-04-29 20:57:20	0
2079	386	Vera Nilce Boltini Dias                           	vera.botini@yahoo.com.br                                                                            	3605-3623      	\N	2012-04-29 20:58:44	\N
2080	277	Flavio dos Santos Malaquias                       	malaquias.flavio@gmail.com                                                                          	70307531       	\N	2012-04-29 20:59:06	1
2081	255	PAULA INARA DE SOUZA MAYWORE                      	                                                                                                    	96697752       	\N	2012-04-29 20:59:19	\N
2082	386	Vanderley Dias                                    	vera.boltini@yahoo.com.br                                                                           	3605-3623      	\N	2012-04-29 20:59:35	\N
2083	247	Maria das Gracas P.Benedetti                      	                                                                                                    	3719-1150      	\N	2012-04-29 20:59:51	\N
2084	247	Maria das Gracas P.Benedetti                      	                                                                                                    	3719-1150      	\N	2012-04-29 20:59:51	\N
2085	255	NICOLE LAZARO                                     	                                                                                                    	87394937       	\N	2012-04-29 20:59:52	\N
2086	255	SERGIO TEIXEIRA                                   	                                                                                                    	78540161       	\N	2012-04-29 21:00:27	\N
2087	247	Gentil Antonio Benedetti                          	                                                                                                    	37191150       	\N	2012-04-29 21:00:51	\N
2088	359	FLAVIA SERAFINA L SILVA                           	                                                                                                    	43065397       	\N	2012-04-29 21:01:36	\N
2089	359	AILSOM BASILIO DA SILVA                           	                                                                                                    	43065397       	\N	2012-04-29 21:02:17	\N
2090	258	Ana Maria Guirado Rodrigues                       	hipercold@hotmail.com                                                                               	3609-3543      	\N	2012-04-29 21:03:54	\N
2091	277	REGIANE ALVES DA SILVA MALAQUIAS                  	remalaquias@hotmail.com                                                                             	52180920       	\N	2012-04-29 21:04:14	\N
2092	258	Lazaro Rodrigues                                  	hipercold@hotmail.com                                                                               	3609-3543      	\N	2012-04-29 21:04:42	\N
2093	386	Lina Domingos Lopes                               	stefanyteti@hotmail.com                                                                             	36836147       	\N	2012-04-29 21:05:45	\N
2094	376	Eunice Vieira Sampaio de Souza                    	                                                                                                    	34482526       	\N	2012-04-29 21:06:31	\N
2095	386	Stefany Falcao Macedo                             	stefanyteti@hotmail.com                                                                             	76244222       	\N	2012-04-29 21:06:55	\N
2096	256	Ingrid F Gloria                                   	ingrid.cavy@hotmail.com                                                                             	8636-0471      	\N	2012-04-29 21:09:16	\N
2097	256	Marcelo C. Gloria                                 	marcelocgloria@gmail.com                                                                            	7813-0575      	\N	2012-04-29 21:10:59	\N
2098	229	janete alves gomes                                	janeteag@gmail.com                                                                                  	9575-9855      	\N	2012-04-29 21:11:01	\N
2099	219	Alexandre Ramos                                   	ramos_web@hotmail.com                                                                               	9792-8013      	\N	2012-04-29 21:19:28	\N
2100	219	Gisele Ramos                                      	gisele_web@hotmail.com                                                                              	9697-6416      	\N	2012-04-29 21:20:12	\N
2101	387	Sheila Regiane da Silva                           	                                                                                                    	3655-2509      	\N	2012-05-02 10:39:34	\N
2102	387	Mauricio Rodrigues Olímpio                        	                                                                                                    	3655-2509      	\N	2012-05-02 10:40:02	2
2103	387	Mariana M. Carvalho                               	                                                                                                    	3605-1038      	\N	2012-05-02 10:40:43	\N
2104	387	Edgar Dias Carvalho                               	                                                                                                    	3605-1038      	\N	2012-05-02 10:41:08	1
2105	387	Vanda Bueno                                       	                                                                                                    	3714-7891      	\N	2012-05-02 10:48:53	\N
2106	387	Artur Bueno                                       	                                                                                                    	3714-7891      	\N	2012-05-02 10:52:51	\N
2107	207	Soraya Gomes                                      	                                                                                                    	3731-5449      	\N	2012-05-02 11:32:47	\N
2108	207	Tamara Regina Calvo                               	                                                                                                    	3731-5449      	\N	2012-05-02 11:33:13	\N
2109	207	Marcelo Miranda e Souza                           	                                                                                                    	3731-5449      	\N	2012-05-02 11:33:56	\N
2110	387	Daniela Maciel Evangelista                        	                                                                                                    	9336-2279      	\N	2012-05-02 11:40:39	\N
2111	387	Jose Ap. Evangelista                              	                                                                                                    	9336-3101      	\N	2012-05-02 11:41:10	3
2112	271	Fernanda                                          	                                                                                                    	3721-2527      	\N	2012-05-02 11:59:03	\N
2113	271	Gabriele                                          	                                                                                                    	3721-2527      	\N	2012-05-02 11:59:24	\N
2114	271	Armando                                           	                                                                                                    	3721-2527      	\N	2012-05-02 12:00:01	\N
2116	386	Rosalina Souza                                    	                                                                                                    	3609-7652      	\N	2012-05-02 14:41:20	\N
2122	350	Thiago Plaça                                      	                                                                                                    	6703-7906      	\N	2012-05-08 14:54:06	\N
2137	388	Graziela Leite do Nascimento                      	personalgraziela@hotmail.com                                                                        	77494432       	\N	2012-05-16 10:22:06	0
2136	388	Cristiano Leite do Nascimento                     	crileitenascimento@gmail.com                                                                        	82064861       	\N	2012-05-16 10:21:39	0
2125	353	Lislei de Azevedo                                 	lislei.azevedo@syngenta.com                                                                         	9620-7719      	\N	2012-05-08 15:32:39	\N
2126	274	Rodrigo Alves Theodoro                            	rodrigo.alves@bel-ar.com.br                                                                         	3733-3240      	\N	2012-05-08 15:57:27	1
2127	274	Ledinéia Bassi Theodoro                           	                                                                                                    	7706-3005      	\N	2012-05-08 15:57:57	\N
2128	266	Taiz Asakura                                      	asakura.house@terra.com.br                                                                          	3735-3125      	\N	2012-05-08 16:07:26	1
2129	266	Agnaldo Asakura                                   	                                                                                                    	9114-0094      	\N	2012-05-08 16:07:46	\N
2130	219	Glicia                                            	glicia.burgos@gmail.com                                                                             	3686-9236      	\N	2012-05-08 16:10:19	\N
2131	219	Fernando Jorge                                    	fer.jorge@gmail.com                                                                                 	8386-9580      	\N	2012-05-08 16:11:08	\N
2132	201	Rosangela                                         	                                                                                                    	3591-1033      	\N	2012-05-08 16:21:44	\N
2133	258	Elaine Cristina Damaceno                          	elainecdam@hotmail.com                                                                              	3695-3221      	\N	2012-05-09 09:43:36	\N
2134	258	Fabiana C. Damaceno                               	                                                                                                    	3695-3221      	\N	2012-05-09 09:44:07	\N
2138	388	Geny Paiva Leite                                  	                                                                                                    	37510598       	\N	2012-05-16 10:22:23	0
2139	388	Maria Cristina Valenzuela                         	tinavalenz@yahoo.com.br                                                                             	92880170       	\N	2012-05-16 10:23:04	0
2140	388	Jean de Bethencourt                               	                                                                                                    	76937227       	\N	2012-05-16 10:23:31	0
2141	388	Maria Fátima                                      	                                                                                                    	29224272       	\N	2012-05-16 10:23:49	0
2142	230	Elaine Damaceno                                   	                                                                                                    	95611365       	\N	2012-05-22 16:02:55	\N
2143	230	Fabiana Damaceno                                  	                                                                                                    	95611365       	\N	2012-05-22 16:03:49	\N
2144	274	Claudia Knupp Fernandes                           	claudiakfernandes@gmail.com                                                                         	7977-0392      	\N	2012-05-29 15:19:16	2
2145	274	Daniel                                            	                                                                                                    	7977-0392      	\N	2012-05-29 15:22:33	\N
2146	244	Luciana F. Cunha                                  	lucianaf_cunha@hotmail.com                                                                          	9720-1474      	\N	2012-06-12 14:09:25	\N
2147	244	Carlos Gustavo                                    	                                                                                                    	3569-4601      	\N	2012-06-12 14:09:59	\N
2149	389	Paulo Marcelo Strobl                              	paulostrobl@gmail.com                                                                               	66628421       	\N	2012-06-27 11:46:54	\N
2150	389	Fábio do Carmo Ferreira                           	fcf10@ig.com.br                                                                                     	+551183564636  	\N	2012-06-27 11:47:44	\N
2151	389	Greice Kelly Oliveira Ferreira                    	gre.ferreira@hotmail.com                                                                            	+551183564636  	\N	2012-06-27 11:48:36	\N
2152	389	Alberto Zoboli                                    	a.zoboli@hotmail.com                                                                                	+551183564636  	\N	2012-06-27 11:49:34	\N
2153	389	Alinne Gisely Katsuragawa Zoboli                  	alinne.zoboli@hotmail.com                                                                           	+551182262709  	\N	2012-06-27 11:50:30	\N
2155	389	Paulo Rogério Quintiliano                         	rogerquintiliano@gmail.com                                                                          	               	\N	2012-06-27 11:53:14	\N
2156	389	Denise Quintiliano                                	denise.quintiliano@gmail.com                                                                        	               	\N	2012-06-27 11:53:47	\N
\.


--
-- TOC entry 2952 (class 0 OID 32976)
-- Dependencies: 210
-- Data for Name: trole; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY trole (codigo, descricao) FROM stdin;
ADMIN          	Administrador  
STAND          	Estande        
HOSPEDEIRO     	Hospedeiro     
FACILITADOR    	Facilitador    
\.


--
-- TOC entry 2946 (class 0 OID 32855)
-- Dependencies: 204
-- Data for Name: ttipogrupo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ttipogrupo (id, nome) FROM stdin;
1	Adolescentes        
2	Casais sem filhos   
3	Casais com filhos   
4	Misto com crianças  
5	Misto sem crianças  
6	Jovens              
7	Mulheres            
8	Familiares          
9	Profissional        
10	Sozinhos            
11	Homens              
12	Surdos              
13	Escola              
14	Escoteiros          
99	Outro               
98	INDEFINIDO          
15	Misto               
\.


--
-- TOC entry 2953 (class 0 OID 32981)
-- Dependencies: 211
-- Data for Name: ttipogrupo_facilhosp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ttipogrupo_facilhosp (idtipogrupo, idfacilhosp) FROM stdin;
3	522
3	523
5	524
4	525
4	526
4	527
5	528
5	529
4	530
4	531
4	532
4	533
4	534
4	535
5	536
5	537
4	538
4	539
4	540
4	541
4	542
4	543
4	544
5	545
5	546
5	547
5	548
5	549
4	550
5	551
4	552
5	553
5	554
6	555
99	556
5	557
5	558
4	559
4	560
4	561
4	562
4	563
5	564
4	565
4	566
5	567
5	568
5	569
5	570
5	571
5	572
4	573
4	574
5	575
5	576
4	577
4	578
2	579
99	579
4	580
6	581
6	582
5	583
4	584
4	585
4	586
4	587
4	588
5	589
5	590
3	591
3	592
\.


--
-- TOC entry 2954 (class 0 OID 32996)
-- Dependencies: 212
-- Data for Name: tusuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tusuario (login, nome, senha, idfacilhosp) FROM stdin;
allan.jones    	Allan Jones                                       	senha30dias    	\N
admin          	Administrador                                     	ibmadminsp     	\N
voluntario     	Voluntário                                        	voluntarioibm  	\N
toaline        	Tó e Aline                                        	5634           	522
jussara588     	Jussara Camara Pessoa                             	jpessoa588     	588
marcnando      	FERNANDO & FÁTIMA                                 	3306           	587
angelo.marques 	ANGELO MARQUES                                    	1952           	583
lucborgess     	LUCAS E THALITA                                   	8250           	579
tcronconi1     	EDUARDO GOMES RONCONI E TEREZA                    	7668           	578
cidacarneiros  	CIDA CARNEIRO                                     	6947           	564
daopapp        	RODRIGO PAPP CADIMA                               	6315           	555
alberto        	ALBERTO YAEGASHI                                  	3074           	532
mauricioeliza  	JOSÉ MAURICIO DA SILVA                            	7662           	527
wspservice     	WESLEI DOS SANTOS PONTES                          	7934           	525
gabrielribeiro 	GABRIEL A. RIBEIRO DE OLIVEIRA                    	1005           	524
zelandia.ishid 	Zelandia Prates de A. Ishida                      	zelandiaishid46	46
patricia.herre 	WILSON VERSOLATO                                  	9752           	45
wsalvarinho    	WILSON E MARIA JOSÉ DA S. ALVARINHO               	6631           	44
val            	VALERIE GILL DE ABREU                             	5149           	43
sb.mendonca    	SEBASTIÃO BENEDITO MENDONÇA                       	2116           	42
racsamoraes    	SAMIR PEREIRA DE MORAES                           	2082           	41
linslessa      	SAMARONE LINS LESSA                               	2562           	40
rodrigolavoura 	RODRIGO TOSTES LAVOURA                            	8334           	39
rmendoncas     	RICARDO DE MENDONÇA DA SILVA                      	8710           	38
natoprazeres   	RENATO PRAZERES PEREIRA DOS SANTOS                	7360           	37
propart        	ORLANDO MINIGUINI                                 	5361           	36
nanci-avila    	NANCI FANTI PATA AVILA                            	6184           	34
mgracas.araujo 	MARIA DAS GRAÇAS SILVA ARAUJO                     	1197           	32
ferreira.marco 	MARCOS MAURÍCIO FERRO FERREIRA                    	6001           	31
marcio.lara    	MARCIO ALVES DE LARA                              	1177           	30
marques087     	MARCELO MARQUES                                   	2584           	29
barros.tatiane 	MARCELO E TATIANE ORSONI                          	6349           	28
luisoliveira   	LUIS CARLOS DE OLIVEIRA E VALQUIRIA               	1250           	27
pe.dalando.cic 	LUCIANO MELLO                                     	6781           	26
lindalva-abreu 	LINDALVA DE ABREU                                 	7873           	25
kaiopezzutti   	KAIO JULIO CESAR PEZZUTTI                         	9014           	24
jose.marcio    	JOSÉ MÁRCIO GONÇALVES E CINARA                    	2260           	23
pr.jfurtado    	JORGE PACHECO FURTADO                             	2494           	22
jein11         	JENNY ABANTO ALVAREZ                              	8473           	21
valfios        	JANIR FERREIRA DOS SANTOS                         	4510           	20
bel.medeiros   	ISABEL CRISTINA MEDEIROS DA SILVA                 	2555           	19
ginaatanasovgo 	GINA ATANASOV DE GODOY                            	8071           	17
gilberto.junio 	GILBERTO D. RIBEIRO JR                            	7020           	16
geraldoluizd   	GERALDO LUIZ DA SILVA                             	8182           	15
felipeandrades 	FELIPE ANDRADE SANTOS                             	1878           	14
elzira.kiss    	ESTEFAN E ELZIRA KISS                             	5977           	13
ca.bruschi     	ELMARY SANTOS BRUSCHI                             	5128           	12
elmanoa        	ELMANO ANTONIO DE OLIVEIRA SANTOS                 	1295           	11
e9669p         	ELIANA DIAS DE OLIVEIRA                           	5251           	9
elainecdam     	ELAINE CRISTINA DAMACENO                          	2764           	8
drnaletto      	DILCE RODRIGUES NALETTO                           	1835           	7
deciogarcia    	DECIO MAZAGÃO GARCIA                              	2642           	6
claudiarosa200 	CLÁUDIA MARIA ROSA                                	3186           	5
alst.serafim   	ANDRÉ LUIS SERAFIM                                	4686           	4
alexandregaffo 	ALEXANDRE GAFFO                                   	8944           	2
reginaldo_chag 	ADRIANA E REGINALDO CHAGAS                        	4808           	1
liviahannes    	LIVIA MARTINS HANNES                              	1836           	581
erika.fb       	ERIKA FRISON B LEITE                              	3708           	575
dricavital     	GENIVALDO JOSÉ OLIVEIRA                           	7258           	573
marize.paiva   	MARIZE PAIVA                                      	7346           	572
ravs           	RONALDO SOUZA                                     	2412           	568
robertomel.cob 	ROBERTO MELLO                                     	1670           	566
luizmeneguini  	LUIZ MENEGUINI                                    	7170           	559
riva bereta    	RIVA PEREIRA DIAS                                 	4098           	552
sydsan         	SYDNEI SANTOS                                     	2102           	547
rfsantos.eng   	REGINALDO FRANCISCO DOS SANTOS                    	4997           	539
marcelo.pinhei 	MARCELO EDUARDO PINHEIRO GOMES                    	7299           	530
oswaldo        	OSWALDO JUNIOR                                    	9177           	528
josemelca      	JOSE CARLOS MELGAREJO                             	9754           	105
cristiano.gold 	CRISTIANO LIMOLI                                  	6617           	99
wlmmm          	WILLIAN LOPES DE MACEDO                           	3539           	98
capimi195      	ANEILDE SOARES LIMA ALVES                         	4256           	95
bperuchi13     	BRUNA PERUCHI                                     	3713           	91
helena.biondo  	HELENA MARIA DOS SANTOS BIONDO                    	5061           	90
pr_paulorobert 	PAULO ROBERTO CAMARGO DA SILVA                    	5090           	87
daiane.lanconi 	DAIANE LANÇONI E OLIMPIO                          	4911           	84
helio.ishida   	HELIO YASSUHISSA ISHIDA                           	1190           	82
jedu.batista   	JOSÉ EDUARDO CORRÊA BATISTA                       	8209           	73
elias.sena     	ELIAS SENA YARMALAVICIUS                          	7549           	71
ozeaseva       	OZÉAS CORREIA DOS SANTOS                          	1867           	70
jeba_revolucao 	JÉBA E CLAU                                       	5654           	66
andrermoura    	ANDRÉ ROJAS DE MOURA GUILHERME                    	7073           	61
rmaroli        	RICARDO MARTINS DE OLIVEIRA                       	7808           	58
correia        	HOZANIAS CORREIA SANTOS                           	5995           	55
alexandre_vb30 	ALEXANDRE OGEDA RAMALHO                           	4403           	53
pcgandara      	PAULO LUIS E CLAUDIA CRISTIANE                    	7387           	51
alex591        	 Alex Clayton Lins                                	alexclins591   	591
flavia592      	 Flavia Torres Baptista Strobl                    	torresstrobl592	592
\.


--
-- TOC entry 2955 (class 0 OID 33019)
-- Dependencies: 213
-- Data for Name: tusuariorole; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tusuariorole (loginusuario, codigorole) FROM stdin;
allan.jones    	ADMIN          
admin          	ADMIN          
voluntario     	STAND          
\.


--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 196
-- Name: tcontroleemail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tcontroleemail_id_seq', 1, false);


--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 200
-- Name: tfacilhosp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tfacilhosp_id_seq', 1, false);


--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 205
-- Name: tgrupo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tgrupo_id_seq', 1, false);


--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 208
-- Name: tparticipante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tparticipante_id_seq', 1, false);


--
-- TOC entry 2766 (class 2606 OID 32776)
-- Name: tcontroleemail tcontroleemail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tcontroleemail
    ADD CONSTRAINT tcontroleemail_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 32839)
-- Name: tdiasemana_facilhosp tdiasemana_facilhosp_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdiasemana_facilhosp
    ADD CONSTRAINT tdiasemana_facilhosp_pk PRIMARY KEY (iddiasemana, idfacilhosp);


--
-- TOC entry 2768 (class 2606 OID 32782)
-- Name: tdiasemana tdiasemana_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdiasemana
    ADD CONSTRAINT tdiasemana_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 32810)
-- Name: tfacilhosp tfacilhosp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tfacilhosp
    ADD CONSTRAINT tfacilhosp_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 32787)
-- Name: tfuncao tfuncao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tfuncao
    ADD CONSTRAINT tfuncao_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 32909)
-- Name: tgrupo tgrupo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tgrupo
    ADD CONSTRAINT tgrupo_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 32944)
-- Name: thorario_facilhosp thorario_facilhosp_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY thorario_facilhosp
    ADD CONSTRAINT thorario_facilhosp_pk PRIMARY KEY (idhorario, idfacilhosp);


--
-- TOC entry 2777 (class 2606 OID 32854)
-- Name: thorario thorario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY thorario
    ADD CONSTRAINT thorario_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 32972)
-- Name: tparticipante tparticipante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tparticipante
    ADD CONSTRAINT tparticipante_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 32980)
-- Name: trole trole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trole
    ADD CONSTRAINT trole_pkey PRIMARY KEY (codigo);


--
-- TOC entry 2795 (class 2606 OID 32985)
-- Name: ttipogrupo_facilhosp ttipogrupo_facilhosp_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ttipogrupo_facilhosp
    ADD CONSTRAINT ttipogrupo_facilhosp_pk PRIMARY KEY (idtipogrupo, idfacilhosp);


--
-- TOC entry 2779 (class 2606 OID 32859)
-- Name: ttipogrupo ttipogrupo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ttipogrupo
    ADD CONSTRAINT ttipogrupo_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 33001)
-- Name: tusuario tusuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tusuario
    ADD CONSTRAINT tusuario_pkey PRIMARY KEY (login);


--
-- TOC entry 2800 (class 2606 OID 33024)
-- Name: tusuariorole tusuariorole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tusuariorole
    ADD CONSTRAINT tusuariorole_pkey PRIMARY KEY (loginusuario);


--
-- TOC entry 2796 (class 1259 OID 33007)
-- Name: facilhosp4_fk_i; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX facilhosp4_fk_i ON tusuario USING btree (idfacilhosp);


--
-- TOC entry 2764 (class 1259 OID 32777)
-- Name: i_codigoinscrito; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_codigoinscrito ON tcontroleemail USING btree (codigoinscrito);


--
-- TOC entry 2780 (class 1259 OID 32937)
-- Name: i_gdiasemana_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_gdiasemana_fk ON tgrupo USING btree (diasemana);


--
-- TOC entry 2781 (class 1259 OID 32935)
-- Name: i_gfacilitador_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_gfacilitador_fk ON tgrupo USING btree (codigofac);


--
-- TOC entry 2782 (class 1259 OID 32938)
-- Name: i_ghorario_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_ghorario_fk ON tgrupo USING btree (horario);


--
-- TOC entry 2783 (class 1259 OID 32936)
-- Name: i_ghospedeiro_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_ghospedeiro_fk ON tgrupo USING btree (codigohosp);


--
-- TOC entry 2784 (class 1259 OID 32939)
-- Name: i_gtipogrupo_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_gtipogrupo_fk ON tgrupo USING btree (tipogrupo);


--
-- TOC entry 2789 (class 1259 OID 32973)
-- Name: pgrupo_fk_i; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pgrupo_fk_i ON tparticipante USING btree (codigogrupo);


--
-- TOC entry 2771 (class 1259 OID 32831)
-- Name: tfacilhosp_funcao; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tfacilhosp_funcao ON tfacilhosp USING btree (numfuncao);


--
-- TOC entry 2811 (class 2606 OID 33002)
-- Name: tusuario facilhosp4_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tusuario
    ADD CONSTRAINT facilhosp4_fk FOREIGN KEY (idfacilhosp) REFERENCES tfacilhosp(id);


--
-- TOC entry 2801 (class 2606 OID 32811)
-- Name: tfacilhosp funcao_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tfacilhosp
    ADD CONSTRAINT funcao_fk FOREIGN KEY (numfuncao) REFERENCES tfuncao(id);


--
-- TOC entry 2806 (class 2606 OID 32920)
-- Name: tgrupo gdiasemana_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tgrupo
    ADD CONSTRAINT gdiasemana_fk FOREIGN KEY (diasemana) REFERENCES tdiasemana(id);


--
-- TOC entry 2804 (class 2606 OID 32910)
-- Name: tgrupo gfacilitador_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tgrupo
    ADD CONSTRAINT gfacilitador_fk FOREIGN KEY (codigofac) REFERENCES tfacilhosp(id);


--
-- TOC entry 2807 (class 2606 OID 32925)
-- Name: tgrupo ghorario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tgrupo
    ADD CONSTRAINT ghorario_fk FOREIGN KEY (horario) REFERENCES thorario(id);


--
-- TOC entry 2805 (class 2606 OID 32915)
-- Name: tgrupo ghospedeiro_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tgrupo
    ADD CONSTRAINT ghospedeiro_fk FOREIGN KEY (codigohosp) REFERENCES tfacilhosp(id);


--
-- TOC entry 2808 (class 2606 OID 32930)
-- Name: tgrupo gtipogrupo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tgrupo
    ADD CONSTRAINT gtipogrupo_fk FOREIGN KEY (tipogrupo) REFERENCES ttipogrupo(id);


--
-- TOC entry 2802 (class 2606 OID 32840)
-- Name: tdiasemana_facilhosp tdiasemana_facilhosp_fk_iddiasemana; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdiasemana_facilhosp
    ADD CONSTRAINT tdiasemana_facilhosp_fk_iddiasemana FOREIGN KEY (iddiasemana) REFERENCES tdiasemana(id);


--
-- TOC entry 2803 (class 2606 OID 32845)
-- Name: tdiasemana_facilhosp tdiasemana_facilhosp_fk_idfacilhosp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdiasemana_facilhosp
    ADD CONSTRAINT tdiasemana_facilhosp_fk_idfacilhosp FOREIGN KEY (idfacilhosp) REFERENCES tfacilhosp(id);


--
-- TOC entry 2810 (class 2606 OID 32991)
-- Name: ttipogrupo_facilhosp tfacilhosp_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ttipogrupo_facilhosp
    ADD CONSTRAINT tfacilhosp_fk FOREIGN KEY (idfacilhosp) REFERENCES tfacilhosp(id);


--
-- TOC entry 2809 (class 2606 OID 32986)
-- Name: ttipogrupo_facilhosp ttipogrupo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ttipogrupo_facilhosp
    ADD CONSTRAINT ttipogrupo_fk FOREIGN KEY (idtipogrupo) REFERENCES ttipogrupo(id);


--
-- TOC entry 2813 (class 2606 OID 33030)
-- Name: tusuariorole tusuariorole_codigorole_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tusuariorole
    ADD CONSTRAINT tusuariorole_codigorole_fk FOREIGN KEY (codigorole) REFERENCES trole(codigo);


--
-- TOC entry 2812 (class 2606 OID 33025)
-- Name: tusuariorole tusuariorole_loginusuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tusuariorole
    ADD CONSTRAINT tusuariorole_loginusuario_fk FOREIGN KEY (loginusuario) REFERENCES tusuario(login);


-- Completed on 2018-05-31 13:53:40

--
-- PostgreSQL database dump complete
--

