-- MySQL dump 10.13  Distrib 5.7.22, for Win64 (x86_64)
--
-- Host: localhost    Database: cemparasem
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table 'tcontroleemail'
--

DROP TABLE IF EXISTS 'tcontroleemail';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE 'tcontroleemail' (
  'ID' BIGSERIAL NOT NULL PRIMARY KEY,
  'CODIGOINSCRITO' int(10) NOT NULL,
  'TIPO' int(2) NOT NULL,
  KEY 'EINSCRITO_FK' ('CODIGOINSCRITO')
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table 'tcontroleemail'
--

LOCK TABLES 'tcontroleemail' WRITE;
/*!40000 ALTER TABLE 'tcontroleemail' DISABLE KEYS */;
/*!40000 ALTER TABLE 'tcontroleemail' ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'tdiasemana'
--

DROP TABLE IF EXISTS 'tdiasemana';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE 'tdiasemana' (
  'ID' int(1) NOT NULL,
  'NOME' char(20) NOT NULL,
  UNIQUE KEY 'ID' ('ID')
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table 'tdiasemana'
--

LOCK TABLES 'tdiasemana' WRITE;
/*!40000 ALTER TABLE 'tdiasemana' DISABLE KEYS */;
INSERT INTO 'tdiasemana' VALUES (1,'Domingo'),(2,'Segunda'),(3,'Terça'),(4,'Quarta'),(5,'Quinta'),(6,'Sexta'),(7,'Sábado'),(9,'INDEFINIDO');
/*!40000 ALTER TABLE 'tdiasemana' ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'tdiasemana_facilhosp'
--

DROP TABLE IF EXISTS 'tdiasemana_facilhosp';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE 'tdiasemana_facilhosp' (
  'IDDIASEMANA' int(1) NOT NULL,
  'IDFACILHOSP' int(10) NOT NULL,
  KEY 'DIASEMANA_FK' ('IDDIASEMANA'),
  KEY 'FACILHOSP2_FK' ('IDFACILHOSP')
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table 'tdiasemana_facilhosp'
--

LOCK TABLES 'tdiasemana_facilhosp' WRITE;
/*!40000 ALTER TABLE 'tdiasemana_facilhosp' DISABLE KEYS */;
INSERT INTO 'tdiasemana_facilhosp' VALUES (6,1),(7,1),(5,2),(6,4),(6,5),(4,6),(4,7),(2,8),(3,8),(5,8),(3,9),(3,10),(5,10),(6,10),(2,11),(3,12),(5,12),(4,13),(7,15),(2,17),(3,17),(5,17),(6,17),(7,18),(4,19),(1,20),(6,21),(7,22),(2,23),(4,25),(6,27),(6,28),(2,29),(7,29),(6,30),(4,31),(1,32),(2,32),(3,32),(4,32),(5,32),(6,32),(7,32),(6,33),(3,34),(5,35),(5,36),(4,37),(6,38),(2,39),(3,39),(4,39),(5,39),(6,39),(4,40),(7,41),(4,42),(1,43),(2,43),(3,43),(4,43),(5,43),(6,43),(7,43),(3,45),(5,45),(6,46),(1,47),(2,47),(3,47),(4,47),(5,47),(6,47),(7,47),(6,48),(2,49),(6,49),(2,50),(3,51),(5,51),(3,52),(3,54),(2,55),(3,55),(4,55),(5,55),(3,56),(3,57),(1,59),(3,59),(4,59),(5,59),(6,59),(7,59),(4,60),(2,61),(3,61),(1,62),(2,62),(3,62),(4,62),(5,62),(6,62),(7,62),(1,63),(2,63),(3,63),(4,63),(5,63),(6,63),(7,63),(3,64),(1,65),(2,65),(3,65),(4,65),(5,65),(6,65),(7,65),(3,66),(3,68),(4,69),(4,70),(4,72),(5,72),(5,73),(5,74),(6,74),(4,75),(4,76),(6,76),(4,77),(6,77),(4,78),(5,79),(5,80),(6,80),(5,81),(5,82),(6,82),(5,83),(1,84),(2,84),(3,84),(4,84),(5,84),(6,84),(7,84),(5,85),(5,86),(5,87),(5,88),(5,89),(1,90),(2,90),(3,90),(4,90),(5,90),(6,90),(7,90),(3,92),(5,94),(3,95),(4,95),(6,95),(7,95),(2,96),(6,96),(6,97),(7,99),(7,100),(7,101),(7,102),(5,103),(5,104),(7,104),(2,105),(3,105),(4,105),(5,105),(2,106),(1,106),(1,107),(7,107),(7,108),(1,108),(5,109),(6,522),(6,523),(7,524),(3,525),(2,526),(6,526),(3,527),(5,528),(5,529),(6,530),(6,531),(4,532),(3,533),(7,534),(7,535),(5,536),(5,537),(6,538),(6,539),(5,540),(5,541),(5,542),(5,543),(6,544),(4,545),(6,546),(6,547),(4,548),(7,549),(6,550),(7,551),(6,552),(5,553),(5,554),(7,555),(6,556),(5,557),(5,558),(6,559),(6,560),(5,561),(5,562),(5,563),(5,564),(6,565),(6,566),(5,567),(6,568),(6,569),(5,570),(6,571),(6,572),(6,573),(6,574),(2,575),(2,576),(5,577),(6,578),(6,579),(6,580),(7,581),(7,582),(6,583),(5,584),(5,585),(5,586),(5,587),(6,588),(3,589),(3,590),(6,591),(6,592);
/*!40000 ALTER TABLE 'tdiasemana_facilhosp' ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'tfacilhosp'
--

DROP TABLE IF EXISTS 'tfacilhosp';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE 'tfacilhosp' (
  'ID' int(10) NOT NULL AUTO_INCREMENT,
  'NOME' char(50) NOT NULL,
  'NUMFUNCAO' int(2) NOT NULL,
  'GRUPOOUTRO' char(30) DEFAULT NULL,
  'ENDERECO' char(100) DEFAULT NULL,
  'COMPLEMENTO' char(30) DEFAULT NULL,
  'BAIRRO' char(30) DEFAULT NULL,
  'CIDADE' char(30) DEFAULT NULL,
  'CEP' char(10) DEFAULT NULL,
  'TELEFONERES' char(15) DEFAULT NULL,
  'TELEFONECOM' char(15) DEFAULT NULL,
  'TELEFONECEL' char(15) DEFAULT NULL,
  'EMAIL' char(100) DEFAULT NULL,
  'MEMBRO' bit(1) NOT NULL,
  'QTDEADULTOS' int(2) DEFAULT NULL,
  'QTDECRIANCAS' int(2) DEFAULT NULL,
  'OBS' char(200) DEFAULT NULL,
  'STATUSREGISTRO' char(1) NOT NULL,
  'DATACADASTRO' datetime DEFAULT NULL,
  'ORIGEMINFO' char(20) DEFAULT NULL,
  PRIMARY KEY ('ID'),
  KEY 'FUNCAO_FK' ('NUMFUNCAO')
) ENGINE=MyISAM AUTO_INCREMENT=593 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table 'tfacilhosp'
--

LOCK TABLES 'tfacilhosp' WRITE;
/*!40000 ALTER TABLE 'tfacilhosp' DISABLE KEYS */;
INSERT INTO 'tfacilhosp' VALUES (1,'Adriana e Reginaldo Chagas',99,NULL,'Rua das Violetas, 165',NULL,'Fazendinha','Cotia','06355-550','4169-5187','','9962-7524','reginaldo_chagas@uol.com.br','',10,0,'','P',NULL,NULL),(2,'Alexandre Gaffo',99,NULL,'Av. Prof. Jose Maria Alkimin, 764',NULL,'Rio Pequeno','São Paulo','05366-000','3719-1954','','8755-6868','alexandregaffo@terra.com.br','',10,0,'Domingo 10:30','P',NULL,NULL),(3,'Amilton Correa de Azevedo',99,NULL,'Av. Dona Cherubiana Vianna, 1306',NULL,'Vila Santo Antonio','Granja Viana','06708-360','4777-9368','4778-0299','8899-6776','amilton@allcancy.com.br','',0,0,'','P',NULL,NULL),(4,'André Luis Serafim',99,NULL,'Rua José Hemeterio de Medeiros',NULL,'Jd novo Osasco','Osasco','06142-120','3591-0232','','9819-0556','alst.serafim@gmail.com','',6,0,'','P',NULL,NULL),(5,'Cláudia Maria Rosa',99,NULL,'R. Dr. Edmundo José de Lima, 139',NULL,'Rio Pequeno','São Paulo','05366-100','3731-5449','','9537-9535','claudiarosa200@hotmail.com','',8,0,'','P',NULL,NULL),(6,'Decio Mazagão Garcia',99,NULL,'Alameda Suecia 537',NULL,'Alphaville','Barueri','06474-230','4195-6261','3215-7000','9601-0089','deciogarcia@gmail.com','',20,0,'s/ crianças','P',NULL,NULL),(7,'Dilce Rodrigues Naletto',99,NULL,'R. Iquiririm, 130 Ap. 43',NULL,'Butantã','São Paulo','05586-000','3726-1917','','8367-9211','drnaletto@uol.com.br','',5,0,'Grupos de senhoras','P',NULL,NULL),(8,'Elaine Cristina Damaceno',99,NULL,'R. Coqueiro, 112',NULL,'Cidade das Flores','Osasco','06184-080','3695-5779','','9561-1365','elainecdam@hotmail.com','',10,0,'','P',NULL,NULL),(9,'Eliana Dias de Oliveira',99,NULL,'R. Gal. Brasilio Taborda, 224',NULL,'Butantã','São Paulo','','3542-8710','','9585-8343','e9669p@yahoo.com.br','',10,0,'s/ crianças','P',NULL,NULL),(10,'Eliane Sukerth Pantalena',99,NULL,'Al. do Porto, 164',NULL,'Alphavilhe','Barueri','06473-072','4195-3162','','7398-2727','pantalena@mackenzie.com.br','',12,0,'S/limite crianças - 10a','P',NULL,NULL),(11,'Elmano Antonio de Oliveira Santos',99,NULL,'R. Milton Soares 215, bl 5 ap 85',NULL,'Rio Pequeno','São Paulo','05382-010','','','8955-5329','elmanoa@me.com','',6,0,'','P',NULL,NULL),(12,'Elmary Santos Bruschi',99,NULL,'R. Sândalo, 37',NULL,'Cidade das Flores','Osasco','06184-270','3608-0225','','8058-7599','ca.bruschi@gmail.com','',7,3,'','P',NULL,NULL),(13,'Estefan e Elzira Kiss',99,NULL,'R. Giacomo Carissimi, 138',NULL,'Jd Adalgiza','São Paulo','05386-120','4306-8232','','','elzira.kiss@gmail.com','',10,0,'','P',NULL,NULL),(14,'Felipe Andrade Santos',99,NULL,'Av. Agenor Couto de Magalhães, 222 Apt. 502-A',NULL,'Pirituba','São Paulo','','3534-1563','4199-4324','7613-5833','felipeandrades@gmail.com','',10,55,'','P',NULL,NULL),(15,'Geraldo Luiz da Silva',99,NULL,'R. Cajamar, 125 - Pq. Bandeirantes',NULL,'Vl Menk','Osasco','06268-070','3601-2091','2464-8243','7028-4241','geraldoluizd@yahoo.com.br','',15,5,'Veio da 4 Igr. de Osasco','P',NULL,NULL),(16,'Gilberto D. Ribeiro Jr',99,NULL,'Av. Eduardo Amaral, 3935 bl 16 ap 121',NULL,'Jd. Piratininga','Osasco','06230-150','','3915-8958','5458-8798','gilberto.junior1108@gmail.com','',0,0,'','P',NULL,NULL),(17,'Gina Atanasov de Godoy',99,NULL,'R. Jose Ferreira Kiffer, 37',NULL,'Pq. Continental','São Paulo','','4328-2404','','6617-9494','ginaatanasovgodoy@gmail.com','',10,0,'','P',NULL,NULL),(18,'Guilherme e Cintia Silva',99,NULL,'R. Adão Gonçalves da Costa, 75',NULL,'Jd. Jussara','Carapicuiba','06321-040','4167-5362','','8034-7228','cghair@terra.com.br','',20,0,'','P',NULL,NULL),(19,'Isabel Cristina Medeiros da Silva',99,NULL,'R. Prof. Gioconda Mussolini, 12 Apt. 42',NULL,'Butantã','São Paulo','05587-120','','','8202-0805','bel.medeiros@yahoo.com.br','',12,0,'Já estão no grupo 7 pessoas','P',NULL,NULL),(20,'Janir Ferreira dos Santos',99,NULL,'Av. Washington Luis, 153',NULL,'Quitauna','Osasco','06182-290','3608-0522','','9990-0155','valfios@itelefonica.com.br','',20,0,'','P',NULL,NULL),(21,'Jenny Abanto Alvarez',99,NULL,'R. Paranauçu, 94',NULL,'Jaguaré','São Paulo','05335-030','2819-8683','','8192-4675','jein11@hotmail.com','',20,0,'','P',NULL,NULL),(22,'Jorge Pacheco Furtado',99,NULL,'R. São Luiz, 253',NULL,'Rochdale','Osasco','06226-210','3448-5039','2198-9191','9259-6423','pr.jfurtado@gmail.com','',10,0,'','P',NULL,NULL),(23,'José Márcio Gonçalves e Cinara',99,NULL,'R. da Fraternidade, 53 (ao lado do 477)',NULL,'Jd. Oriental','São Paulo','06033-110','3692-3547','5029-3377','7856-8089','jose.marcio@itau-unibanco.com.br','',15,6,'','P',NULL,NULL),(24,'Kaio Julio Cesar Pezzutti',99,NULL,'Rua André Fernandes , 97',NULL,'Centro','Santana de Parnaiba','06501-50','7597-7723','','7597-5843','kaiopezzutti@yahoo.com.br','',0,0,'','P',NULL,NULL),(25,'Lindalva de Abreu',99,NULL,'R. Ibitinga, 65',NULL,'Cohab','Carapicuiba','06326-400','4187-5489','','8543-8748','lindalva-abreu@ig.com.br','',10,0,'Já tem 4 participantes além dela.','P',NULL,NULL),(26,'Luciano Mello',99,NULL,'R. João Del Porto, 47',NULL,'Jd Suiná','Taboão da Serra','06773-080','4139-7439','','6746-8782','pe.dalando.cicloturismo@gmail.com','',0,0,'','P',NULL,NULL),(27,'Luis Carlos de Oliveira e Valquiria',99,NULL,'R. Jardim, 20',NULL,'Jd das Flores','Osasco','06120-180','3699-1864','','9246-6198','luisoliveira@usp.br','',16,0,'Sistema de rodizio de casas','P',NULL,NULL),(28,'Marcelo e Tatiane Orsoni',99,NULL,'R. Dr. Manoel Paiva Ramos, 95 ap 83 B',NULL,'Vl. São Francisco','São Paulo','05331-015','3835-8131','3699-0082','8959-7754','barros.tatiane@gmail.com','',12,0,'Domingo - manhã','P',NULL,NULL),(29,'Marcelo Marques',99,NULL,'Av. Marco Penteado Ulchoa Rodrigues, 4446 Ap. 63 - Bl 4',NULL,'Tamboré','Barueri','06543-001','2424-7228','7397-7481','6831-1663','marques087@gmail.com','',15,5,'','P',NULL,NULL),(30,'Marcio Alves de Lara',99,NULL,'Av. Eng Antonio Eiras Garcia, 79 apto 62 C',NULL,'Butantã','São Paulo','05588-000','2371-4441','3718-5303','9523-3389','marcio.lara@brasilfoods.com','',8,0,'','P',NULL,NULL),(31,'Marcos Maurício Ferro Ferreira',99,NULL,'Av. Padre Vicente Melillo 953 - Apt. 72-A',NULL,'Umuarama','Osasco','06036-013','','3684-2312','9624-5061','ferreira.marcosmf@gmail.com','',12,0,'Gp de jovens casados - rodízio nas casas','P',NULL,NULL),(32,'Maria das Graças Silva Araujo',99,NULL,'Rua Judite França Costa, 144 cs 2',NULL,'Jd. Bonfiglioli','São Paulo','05592-040','2503-2910','','8408-0219','mgracas.araujo@gmail.com','',10,0,'','P',NULL,NULL),(33,'Maria Terezinha Barreto Palma',99,NULL,'Av. Prof. José Maria Alkimin',NULL,'Rio Pequeno','São Paulo','05366-000','3735-0858','','8905-4680','','',7,0,'','P',NULL,NULL),(34,'Nanci Fanti Pata Avila',99,NULL,'R. Das Academias, 81',NULL,'Cidade Universitaria','São Paulo','05359-170','3731-4059','3061-7136','9652-0977','nanci-avila@bol.com.br','',10,3,'','P',NULL,NULL),(35,'Norma de Lima Ferreira de Jesus',99,NULL,'Rua Dr. Wladimir do Amaral, 286',NULL,'Butantã','São Paulo','05535-070','3721-6596','2504-5781','8367-3928','nifj@uol.com.br','',20,0,'','P',NULL,NULL),(36,'Orlando Miniguini',99,NULL,'R. Tipoanas, 109',NULL,'Fazendinha','Cotia','06352-040','41698138','','9485-6406','propart@bol.com.br','',10,0,'','P',NULL,NULL),(37,'Renato Prazeres Pereira dos Santos',99,NULL,'Av. Estados Unidos - Cond. Innova São Francisco, Apt. 176',NULL,'Jd. Adalgisa','Osasco','06030-210','','9766-0777','9613-8344','natoprazeres@gmail.com','',6,0,'','P',NULL,NULL),(38,'Ricardo de Mendonça da Silva',99,NULL,'R. Quitanduba, 310 apto 45',NULL,'Caxingui','São Paulo','05516-030','2805-8416','3158-1038','8925-9038 / 664','rmendoncas@hotmail.com','',10,4,'','P',NULL,NULL),(39,'Rodrigo Tostes Lavoura',99,NULL,'Rua Bartolomeu Bon, 300 - apto. 12C',NULL,'Km 15 da Raposo','São Paulo','05528-200','2828-3179','3677-4464','8690-0679','rodrigolavoura@yahoo.com.br','',15,5,'','P',NULL,NULL),(40,'Samarone Lins Lessa',99,NULL,'R. Pardinho, 298',NULL,'Munhoz Jr.','Osasco','06240-010','3602-1479','7771-3121','7538-4200','linslessa@yahoo.com.br','',8,8,'','P',NULL,NULL),(41,'Samir Pereira de Moraes',99,NULL,'Av. João de Papa, 55 apto 123',NULL,'IAPI','Osasco','06236-020','3656-3040','','7259-0856','racsamoraes@terra.com.br','',8,0,'','P',NULL,NULL),(42,'Sebastião Benedito Mendonça',99,NULL,'R. Dr. Aires Martins Torres, 180 Apt. 33',NULL,'Vl São Francisco','São Paulo','05352-060','3609-8763','','9365-1556','sb.mendonca@hotmail.com','',12,6,'','P',NULL,NULL),(43,'Valerie Gill de Abreu',99,NULL,'R. David Eid, 849 apto 151',NULL,'Interlagos','São Paulo','04438-000','2367-2232','','7111-2232','val@sepal.org.br','',15,0,'','P',NULL,NULL),(44,'Wilson e Maria José da S. Alvarinho',99,NULL,'Av. Prof. José Alkimin, 960',NULL,'Jd. Esther','São Paulo','05366-000','5841-8988','','9155-9033','wsalvarinho@ig.com.br','',10,0,'','P',NULL,NULL),(45,'Wilson Versolato',99,NULL,'Rua Maracatu, 448 - casa 20',NULL,'Chacara Cantagalo','Cotia','06711-340','4702-7900','9642-7273','9642-7273','patricia.herrera@wpgb.com.br','',12,0,'','P',NULL,NULL),(46,'Zelandia Prates de A. Ishida',99,NULL,'R. Tomas Gonçalves, 148',NULL,'Vl Gomes','Sao Paulo','05590-030','2476-2290','','9439-4583','zelandia.ishida@gmail.com','',10,0,'Grupo com mulheres casadas','P',NULL,NULL),(47,'Angelo Marques',1,NULL,'Rua das Camelias, 369',NULL,'Pq. Assunção','Taboão da Serra','06754-110','4787-7738','3478-6900','9543-4044','angelo.marques@bol.com.br','',15,0,'','P',NULL,NULL),(48,'Emilene Ledres Lima e Luciano',2,NULL,'R. Sueli Coelho Geraldo, 55',NULL,'Jd. Trianon','Taboão da Serra','','3813-1466','','8316-4896','emileneledres@hotmail.com','',10,4,'Incluir no grupo do Angelo','P',NULL,NULL),(49,'Daniel Colella Pinter',2,NULL,'R. Irineu Salvador Pinto, 142',NULL,'Jd. Esther','São Paulo','05374-130','3763-4263','','8805-2537','adriana_teixeira2004@ig.com.br','',20,0,'Domingo pela manhã','P',NULL,NULL),(50,'Érika Frison Bertozzi Leite',1,NULL,'Av. Escola Politécnica, 2200 - Itália 4',NULL,'Rio Pequeno','São Paulo','05350-000','3535-5023','8771-6568','6753-8461','erika.fb@gmail.com','',0,0,'','P',NULL,NULL),(51,'Paulo Luis e Claudia Cristiane',1,NULL,'R. Gestão do Rego Monteiro, 666 - Apt. 64',NULL,'Jd. Bonfiglioli','São Paulo','05594-030','3735-8717','3766-3340','9909-7735','pcgandara@ig.com.br','',0,0,'','P',NULL,NULL),(52,'Maria Perpétuo S. de A. S. Moreira',2,NULL,'Rua Nitemar Vasconcelos, 133',NULL,'Jd. Bonfiglioli','São Paulo','05595-020','3731-8286','','8174-7606','perpetuo55@hotmail.com','',15,5,'','P',NULL,NULL),(53,'Alexandre Ogeda Ramalho',1,NULL,'R. Inacio Manuel Alvares, 80 ap 32 B',NULL,'Jd. Esther','São Paulo','05372-110','3782-6159','3713-3724','9454-0563','alexandre_vb30@hotmail.com','',0,0,'','P',NULL,NULL),(54,'Claudice Lima da Silva',2,NULL,'Calçada das Violetas, 173',NULL,'Alphaville','Barueri','','4191-8119','','8115-5185','clau-lins@hotmail.com','',20,0,'','P',NULL,NULL),(55,'Hozanias Correia Santos',1,NULL,'Rua Alha Elias Abide, 78',NULL,'Pq. Dos Principes','Osasco','06030-300','3609-6942','3608-1804','7895-3664','correia@bendflex.com.br','',0,0,'','P',NULL,NULL),(56,'Maria José de O. Palheta',2,NULL,'R. Cunha Matos, 153',NULL,'Rio Pequeno','São Paulo','','3782-1637','3014-5212','5237-9583','maria.palheta@sa.cushwake.com','',10,0,'','P',NULL,NULL),(57,'Luiz Sakamoto',2,NULL,'R. Rosa, 52',NULL,'Jd. das Flores','Osasco','06112-130','4620-0433','2174-8323','8504-0288','lnsakamoto@gmail.com','',8,0,'Ricardo será facilitador','P',NULL,NULL),(58,'Ricardo Martins de Oliveira',1,NULL,'Av. José Joaquim Seabra, 759 - Apt. 21',NULL,'Rio Pequeno','São Paulo','05364-000','3768-3940','','9615-6391','rmaroli@hotmail.com','',6,0,'H- Luiz e Alba Sakamoto','P',NULL,NULL),(59,'Flávia Serafim L. Silva',2,NULL,'R. Dr. Hélio Fidelis, 152 Ap. 24 G',NULL,'Vl. São Francisco','Sao Paulo','05351-035','4306-5397','','7887-5447','aisilva@oi.com.br','',20,5,'preferência crianças 4 a 8a','P',NULL,NULL),(60,'Sérgio Vitorini',1,NULL,'R. Carolina Nabuco, 30 cs 14',NULL,'Jd. Esther','São Paulo','05372-070','3782-6148','3785-1001','9997-1507','sergio@sreletronica.com.br','',0,0,'','P',NULL,NULL),(61,'André Rojas de Moura Guilherme',1,NULL,'Rua Dolores Duran, 225',NULL,'Jd. Santo Onofre','Taboão da Serra','06785-190','4138-4486','','8499-8560','andrermoura@gmail.com','',0,0,'','P',NULL,NULL),(62,'Marcelo Crocelli',2,NULL,'R. Ivar Bekhman, 65',NULL,'Campo Limpo','São Paulo','05788-420','5844-6459','5841-3054','7448-7088','marcelo.crocelli768@gmail.com','',30,10,'Próximo Taboão da Serra, Morumbi','P',NULL,NULL),(63,'Jesiel de Vanconcelos Pascoal',2,NULL,'Av. Edmundo Amaral, 3935 Bl 1 Ap. 53',NULL,'Jd. Piratininga','Osasco','06230-150','3549-2396','7071-6140','6283-7784','jesiel_vasconcelos@hotmail.com','',10,0,'','P',NULL,NULL),(64,'José Maurício da Silva',1,NULL,'Av. Comandante Sampaio, 755',NULL,'km 18','Osasco','06192-010','3607-2825','2884-5563','6204-8285','mauricioeliza@uol.com.br','',8,4,'','P',NULL,NULL),(65,'Angela Cristina Santos Mariano',2,NULL,'R. Dácio Aguiar de Moraes, 50',NULL,'Butanta','São Paulo','05589-040','3777-4328','','9345-1889','amariano60@gmail.com','',10,0,'','P',NULL,NULL),(66,'Jéba e Clau',1,NULL,'Av. Edmundo Amaral, 130 - Bl 3 Apt. 23',NULL,'Jd. Piratininga','Osasco','06230-150','4325-7081','4163-6064','9332-0206','jeba_revolucao@ig.com.br','',0,0,'Gegê de 4a, casais c/crianças','P',NULL,NULL),(67,'Mateus Roberto de Souza',2,NULL,'Av. Dr. Candido Motta Filho, 81 - 53 D',NULL,'Vl São Francisco','São Paulo','','2768-7002','3879-7809','8694-9838','mateusr@herbalife.com','',0,0,'','P',NULL,NULL),(68,'Cristiane Rodrigues Ferreira',1,NULL,'R. Manuel Martins Colaço, 246 - Bl 08 Apt. 29',NULL,'Jd. D´Abril','Osasco','05396-080','3783-6053','3684-3753','6760-3020','cris_rf27@yahoo.com.br','',0,0,'','P',NULL,NULL),(69,'Janice Souza',2,NULL,'Av. Flora, 2210',NULL,'Jaguaribe - Osasco','Sao Paulo','','3448-4818','','','janice.souza21@gmail.com','',15,0,'Segunda a tarde é possível','P',NULL,NULL),(70,'Ozéas Correia dos Santos',1,NULL,'R. Dr. Victor Ayrosa, 40 Apt. 23',NULL,'Jd. Ypê','Osasco','06060-270','','3718-1124','9518-8962','ozeaseva@ig.com.br','',0,0,'','P',NULL,NULL),(71,'Elias Sena Yarmalavicius',1,NULL,'R. Alberto Tanganelli Neto, 166',NULL,'Butantã','São Paulo','05540-030','2193-2032','2195-4860','9846-8905','elias.sena@gmail.com','',0,0,'Hosp. na casa da mãe Florinda Sena Yarmalavicius','P',NULL,NULL),(72,'Florinda Serra ...',2,NULL,'Rua Alberto Tanganelli Neto, 211',NULL,'Butantã','Sao Paulo','05540-030','3726-9274','','','helenaya@ig.com.br','',20,0,'','P',NULL,NULL),(73,'José Eduardo Corrêa Batista',1,NULL,'Av. Prof. João Goulart, 01 Ap. 134',NULL,'Umuarama','','','','2178-4044','8235-1025','jedu.batista@ig.com.br','',0,0,'Lideravam um grupo na igreja anterior.','P',NULL,NULL),(74,'Carlos Augusto G. Pires',2,NULL,'R. Manoel Saraiva, 130',NULL,'Campesina','Osasco','06023-060','3682-2592','','8458-3862','','',14,0,'Hosp. Um casal de idosos','P',NULL,NULL),(75,'Genivaldo José Oliveira / Adriana',1,NULL,'Av. Vitor Civita, 1394 - casa 60',NULL,'Jd. Conceição','Osasco','06140-260','3433-4717','9786-9420','7771-3265','dricavital@yahoo.com.br','',0,0,'Aberto a outros dias se necessário','P',NULL,NULL),(76,'Érika Cavalcante Andrade',2,NULL,'R. Jaguarão, 109',NULL,'Vl. Das Rosas','Osasco','06260-020','3602-1076','','7148-4813','cavalcante.erika@ig.com.br','',8,4,'','P',NULL,NULL),(77,'Maritania Quintela de Moura...',2,NULL,'R. Dr. Aires Martins Torres, 180 B',NULL,'Vl. São Francisco','São Paulo','','3763-6322','','8130-6168','tania.quintela@gmail.com','',10,0,'podem levar filhos','P',NULL,NULL),(78,'Marcelo Eduardo Pinheiro Gomes',1,NULL,'Est. Manoel Lages do Chão, 850 Bl 2 Ap. 11',NULL,'Jd. Caiapiá','Cotia','06705-9030','4148-8389','4613-1821','7616-9030','marcelo.pinheirogomes@uol.com.br','',0,0,'','P',NULL,NULL),(79,'Adriana Guimarães',2,NULL,'Rua 8 de Março, 127',NULL,'Jd. 1 de Maio','Osasco','06147-005','3695-1659','','7875-2676','drikkaguimaraes@hotmail.com','',15,0,'Próximo a Resid. Pr. Ricardo','P',NULL,NULL),(80,'Ronaldo Souza',1,NULL,'R. Conde Eduardo L. Matarazzo, 3',NULL,'Vl. São Francisco','São Paulo','','','7647-8797','8447-5042','ronaldo@ravscorp.com','',0,0,'Se precisar para outros dias, também está a disposição','P',NULL,NULL),(81,'Elenilda C. Braz de Aguiar',2,NULL,'R. Tenente Aviador Mota Lima, 375',NULL,'Caxingui','Sao Paulo','05517-030','3721-2527','','9558-8477','elenata@terra.com.br','',8,0,'','P',NULL,NULL),(82,'Helio Yassuhissa Ishida',1,NULL,'R. Tomas Gonçalves, 148 casa 17',NULL,'Vl. Gomes','São Paulo','05590-030','2476-2290','','9659-2999','helio.ishida@gmail.com','',0,0,'','P',NULL,NULL),(83,'Edvaldo Cruz e Ruth',2,NULL,'R. Eng. Willy Fisher, 240',NULL,'Rio Pequeno','Sao Paulo','05368-050','3731-6182','','9362-6813','','',15,6,'Tem uma garagem - não tem cadeiras p/ núm. Superior a esse','P',NULL,NULL),(84,'Daiane Lançoni e Olimpio',1,NULL,'R. Conde Eduardo L. Matarazzo, 3 Bl 3',NULL,'Vl.  São Francisco','São Paulo','05356-000','2936-5412','','8121-8586','daiane.lanconi@uol.com.br','',0,0,'É conhecida do Cornélio - Igr. Presbiteriana','P',NULL,NULL),(85,'Samuel Cosmo Santana',2,NULL,'R. Paranauçu, 94',NULL,'Jaguaré','São Paulo','05335-030','3483-9469','','9745-8757','marketing.samuel@hotmail.com','',15,0,'','P',NULL,NULL),(86,'Thelma Vitols',1,NULL,'Rua Caetano Polis, 297',NULL,'Jaguaré','São Paulo','05335-120','3681-5414','','8202-9208','thelma.vitols@terra.com.br','',0,0,'Grupo na casa da Jenny/Samuel','P',NULL,NULL),(87,'Paulo Roberto Camargo da Silva',1,NULL,'R. Espírito Santo, 351',NULL,'Jd. Rochdalle','Osasco','06220-090','3686-0796','3847-4717','9617-1687','pr_pauloroberto30@hotmail.com','',0,0,'H - Ana Ap. Cacia','P',NULL,NULL),(88,'Anna Ap. Cacia Lima Barreto',2,NULL,'R. Odila Catan, 223',NULL,'Jd. Roberto','Osasco','06170-060','2827-2960','7389-2155','7389-2115','annalevi1@hotmail.com','',8,4,'Pr. Paulo Roberto - facilitador','P',NULL,NULL),(89,'Gilmar Rodrigues dos Reis',2,NULL,'Av. Dona Blandina Ignês Julio, 741 Apt 48',NULL,'Jaguaribe','Osasco','06050-120','3609-2177','4198-6202','9519-9369','grodriguesdosreis@gmail.com','',8,4,'','P',NULL,NULL),(90,'Helena Maria dos Santos Biondo',1,NULL,'Av. Antonio Carlos Costa, 475',NULL,'Bela Vista','Osasco','06053-010','6704-3978','3685-3850','','helena.biondo@r7.com','',0,0,'','P',NULL,NULL),(91,'Bruna Peruchi',1,NULL,'R. Giuseppe Ferrari, 34',NULL,'Jd. Umuarama','','06036-040','3699-2735','','7180-1611','bperuchi13@hotmail.com','',0,0,'','P',NULL,NULL),(92,'Amanda Silagi',2,NULL,'R. Cactus, 103',NULL,'Jd. das Flores','Osasco','','3685-4420','','9528-4893','','',0,0,'','P',NULL,NULL),(93,'Carlos Cadima Balcazar',1,NULL,'R. Erico Verissimo, 362',NULL,'Jd. Cambara','São Paulo','05560-000','3782-7419','3602-8355','7622-8889','ccadima@uol.com.br','',0,0,'','P',NULL,NULL),(94,'Lina Domingos Lopes',2,NULL,'R. Cesário Vendamini, 70',NULL,'Jd. Adalgisa','Osasco','06030-210','3683-6147','','','claudiocdlopes@uol.com.br','',0,0,'','P',NULL,NULL),(95,'Aneilde Soares Lima Alves',1,NULL,'R. Capivari Mirim, 195',NULL,'Jd. Dracena','','05528-290','3751-3498','','8495-6253','capimi195@hotmail.com','',0,0,'Grupo de mulheres','P',NULL,NULL),(96,'Ivonete Maria de Almeida',2,NULL,'Rua Prof. Gilio Satim, 88',NULL,'Rio Pequeno','São Paulo','','3368-5012','','8170-8013','','',10,0,'','P',NULL,NULL),(97,'Kelly Cristina Picorele Torres Cavalcante',2,NULL,'Al Jundiaí, 162','Residencial 4','Alphaville','Santana de Parnaíba','06411-080','4163-5953','','9659-1003','torresassessorias@uol.com.br','',10,0,'','P',NULL,NULL),(98,'Willian Lopes de Macedo',1,NULL,'Av. Getulio Vargas, 990 bl 38 ap 21',NULL,'Jd. Piratininga','Osasco','06233-020','3656-4809','2202-0703','9398-2699','wlmmm@ig.com.br','',0,0,'','P',NULL,NULL),(99,'Cristiano Limoli',1,NULL,'R. Belgrado, 239',NULL,'Valle do Sol','','','','4162-2784','8412-5615','cristiano.golden@gmail.com','',0,0,'Facilitar na casa do Luiz e Luciana','P',NULL,NULL),(100,'Luciana Bastazin Marques de S.',2,NULL,'R. Eulo Maroni, 166 Bl 02 Ap. 12',NULL,'Jaguaré / SP','Sao Paulo','05338-100','3763-4907','','9540-0255','lubastazin@yahoo.com.br','',12,4,'Pedem a Cristiane Limoli','P',NULL,NULL),(101,'Ângela Ap. Ribeiro Chaves',1,NULL,'R. Monteiro Lobato, 114',NULL,'Vila Aliança','','06268-010','4556-3894','2183-6700','9914-2113','angela.archaves@hotmail.com','',0,0,'','P',NULL,NULL),(102,'Lucinha Vicente',2,NULL,'Av. Getulio Vargas, 420 bl 26 ap 42',NULL,'Jd. Piratininga','Osasco','','3697-0989','','9505-1170','lu_vicente@yahoo.com.br','',10,0,'Inscreveu-se por @ Pr. Daniel','P',NULL,NULL),(103,'Alexandre Daniel Bizetti',1,NULL,'R. Dr. Francisco Patti, 156',NULL,'Vl. São Francisco','São Paulo','05352-090','3714-6962','5189-7938','9260-9761','alexandre.bizetti@merck.com','',0,0,'','P',NULL,NULL),(104,'Agostinha Capistrano Rocha',2,NULL,'Av. Dr. Alberto Jackson Byington, 320 Bl 9 Apt. 41',NULL,'Vl Menck','Osasco','06273-050','3601-4914','','8221-2547','acaprocha@hotmail.com','',20,10,'Passando Rochdale, no sentido Anhanguera prox. Km 18','P',NULL,NULL),(105,'Jose Carlos Melgarejo',1,NULL,'R. Leopoldo Migues, 448 apto 402',NULL,'Cambuci','São Paulo','01518-120','3123-1325','3256-2726','9982-6455','josemelca@hotmail.com','',0,0,'','P',NULL,NULL),(106,'Manoela Gomes de A. Silva',2,NULL,'Trav. José Copertino Saraiva,',NULL,'Vila Yara','Osasco','06026-260','3691-2064','3654-3224','9555-2071','manoelale@hotmail.com','',30,10,'Ajuda como avaliar espaço fisico.','P',NULL,NULL),(107,'Nivea Magda M. de Lima Ruiz',2,NULL,'R. das Camarças, 76',NULL,'Jd. do Engenho','','046711-460','4551-2896','3688-4828','6536-3676','niveamagda@hotmail.com','',12,10,'Próxim Raposo Km 21','P',NULL,NULL),(108,'Sydnei dos Santos',1,NULL,'R. Pantaleão Braz 450 Ap. 81',NULL,'Jd. Esther','São Paulo','05372-080','2592-7989','','8445-9756','sydsan@hotmail.com','',0,0,'Grupo misto c/ crianças - possui dois filhos 7 e 11 anos.','P',NULL,NULL),(109,'Gildete de Brito Teixeira',2,NULL,'R. Paula Rodrigues, 250 Bl 11 Ap. 31',NULL,'Jd. Piratininga','Osasco','06233-030','3656-5631','','9233-8171','gildete.net@globo.com','',10,3,'encontros quinzenais','P',NULL,NULL),(110,'Tania Correia',1,NULL,'R. Doutor Italo Eboli, 195',NULL,'Jd. Bonfiglioli','São Paulo','05592-060','3733-3694','3022-2344','8046-1109','taniacorreia11@gmail.com','',0,0,'Projeto Debora - as quinta-feiras','P',NULL,NULL),(522,'Tó e Aline',99,'','Av. dos Carvalhos, 157','','Fazendinha','Carapicuíba','','','','','toaline@uol.com.br','',13,13,'já é GP','P','2012-03-04 12:46:19','admin'),(523,'Tó e Aline',99,'','Av. dos Carvalhos, 157','','Fazendinha','Carapicuiba','','','','','','',13,13,'já é um GP','P','2012-03-04 12:51:52','admin'),(524,'Gabriel A. Ribeiro de Oliveira',99,'','Rua Porto Alegre, 52','','Rochdale','Osasco','06286-180','3602-0942','','9930-6435','gabrielribeiro350@gmail.com','',10,0,'','P','2012-03-04 20:46:36',NULL),(525,'Weslei dos Santos Pontes',99,'','R. Angelo Clerice, 221','','Jd. Boa Vista','Sao Paulo','05584-040','3715-0863','7703-5196','7368-1306','wspservice@gmail.com','',12,8,'','P','2012-03-06 16:11:26','voluntario'),(526,'Edmilson e Beatriz Almeida',2,'','Rua Diogo Gomes Carneiro, 500','casa 64','Jd. Rosa Maria','Osasco','','3788-1181','2188-0533','7886-5970','edmilson.almeida@hotmail.com','',10,6,'','P','2012-03-06 16:20:19','voluntario'),(527,'José Mauricio da Silva',99,'','Av. Comandante Sampaio, 755','apto. 31','km 18','Osasco','06192-010','36072825','28845555','','mauricioeliza@uol.com.br','',8,4,'','P','2012-03-09 11:56:43','admin'),(528,'Oswaldo Junior',1,'',NULL,NULL,'Vila D\'Este','Cotia',NULL,'37634551','28845555','93232573','oswaldo@ibmemorial.org.br','',20,0,'','P','2012-03-09 12:07:55','admin'),(529,'Fauze Jibran Hsieh',2,'','R. Comendador Elias Zarzur, 487 casa 1','casa 1','Alto da Boa Vista','Sao Paulo','04736-001','21298808','21936688','94549878','fauze@infinitocultural.com.br','',20,0,'','P','2012-03-09 12:15:07','admin'),(530,'Marcelo Eduardo Pinheiro gomes',1,'',NULL,NULL,'Jardim Caiapiá','Cotia',NULL,'41488389','46131821','76169030','marcelo.pinheirogomes@uol.com.br','',15,6,'','P','2012-03-09 12:37:54','admin'),(531,'Regina Alice de Abreu Bustamante Canales',2,'','Rua Victor Hugo, 178','km 28,5 da Raposo','Colinas S. Fernando','Cotia','06704-505','46141045','41940880','94492825','reginalice70@hotmail.com','\0',15,6,'','P','2012-03-09 12:41:30','admin'),(532,'Alberto Yaegashi',99,'','R. Itapemirum, 486','apto. 901','Morumbi','São Paulo','','','37824185','83803770','alberto@secretsprofessional.com.br','',10,6,'','P','2012-03-09 12:56:41','admin'),(533,'Weslei dos Santos Pontes',99,'','R. Angelo Clerice, 221','','Jardim Boa Vista','São Paulo','05584-040','37150863','77035196','73681306','wspservice@gmail.com','',12,8,'','P','2012-03-09 13:58:29',NULL),(534,'Angela A. Ribeiro Chaves',1,'',NULL,NULL,'Vila Aliança','Osasco',NULL,'35995314','21836700','99142113','angela.archaves@hotmail.com','',8,4,'','P','2012-03-09 15:03:15','admin'),(535,'Grazielly Natalione Almeida de Castro',2,'','R. Santa Marcela, 98','','Jardim Califórnia','Osasco','06124-110','28368508','30917686','71354501','grazicastro@usp.br','',8,4,'','P','2012-03-09 15:06:21','admin'),(536,'Juliana de Paula Castro',2,'','Av. Manoel Pedro Pimentel, 200','Bloco 14, apto. 61','Jardim Wilson','Osasco','06020-194','37141428','96314928','72187093','juliana.pcastro@hotmail.com','',8,0,'','P','2012-03-09 15:33:55','admin'),(537,'Roberto de Melo e Adriana',1,'',NULL,NULL,'','',NULL,'3719-2713','','7865-2331','','',8,0,'','P','2012-03-09 15:36:36','admin'),(538,'Maritania Quintela de Moura Silva Gomes',2,'','R. Dr. Aires Martins Torres, 180 B','Bentevi - 3º andar','Vl. São Francisco','Sao Paulo','','37636322','','        8130616','tania.quintela@gmail.com','\0',10,3,'','P','2012-03-09 15:49:26','admin'),(539,'Reginaldo Francisco dos Santos',1,'',NULL,NULL,'Jaguaré','São Paulo',NULL,'39324542','39336429','85778068','rfsantos.eng@bol.com.br','',NULL,NULL,'','P','2012-03-09 15:51:30','admin'),(540,'Roberto de Melo',1,'',NULL,NULL,'','',NULL,'','','78652331','robertomel.cobraman@yahoo.com.br','',10,5,'','P','2012-03-09 15:59:47','admin'),(541,'Dulcinea Vasconcelos Pascoal de Oliveira',2,'','R. Manoel Joaquim Pera, 78','','Butantã','São Paulo','76690-364','37224929','','76690364','dulcejaniocasa@gmail.com','',10,5,'','P','2012-03-09 16:02:42','admin'),(542,'Jesiel de Vasconcelos Pascoal',2,'','Av. Edmundo Amaral, 3935','Bloco 1 - Apto. 53','Jardim Piratininga','Osasco','06230-150','35992396','70716140','62837784','jesiel_vasconcelos@hotmail.com','',10,4,'','P','2012-03-09 16:07:49','admin'),(543,'José Eduardo Correa Batista e kelly',1,'',NULL,NULL,'Umuarama','Osasco',NULL,'','21784044','82351025','jedu.batista@ig.com.br','',10,4,'','P','2012-03-09 16:09:41','admin'),(544,'Siomara C. Veronezi',1,'',NULL,NULL,'R. Felipe Terra 184','Cotia',NULL,'461244','','89575154','siomaraveronezi@ig.com.br','',10,3,'','P','2012-03-09 16:30:39','admin'),(545,'Carlos Augusto Gonçalves Pires',2,'','R. Manoel Saraiva, 130','','Campesina','Osasco','06023-060','37821536','','94244274','','',15,0,'','P','2012-03-09 16:35:02','admin'),(546,'Maria Ivonete Almeida Silva',2,'','R. Venancio Flores, 119-A','','Jd. Ivana','Sao Paulo','05364-246','3714-2866','','7474-3246','ivonete.almeida@hotmail.com','',15,0,'','P','2012-03-09 16:37:58','admin'),(547,'SYDNEI SANTOS',1,'',NULL,NULL,'Jardim Ester Yolanda','São Paulo',NULL,'2592-7989','','8445-9756','sydsan@hotmail.com','',NULL,NULL,'','P','2012-03-09 16:40:36','admin'),(548,'Fabiana Ferraz',1,'',NULL,NULL,'Jd. Raposo Tavares','',NULL,'','','','fabianaprata@yahoo.com.br','',15,NULL,'','P','2012-03-09 16:40:54','admin'),(549,'Patricia B de Freitas',2,'','R. Felipe Terra, 184','casa 69','Granja Viana','Cotia','06710-540','','55075756','70501284','freitas.patriciab@gmail.com','',12,0,'','P','2012-03-09 16:46:48','admin'),(550,'LEONARDO E RITA NOLASCO',2,'','Rua Dr. Paulo Ferraz da Costa Aguiar 1600','apto 62 -G','Vila Yara','Osasco','06026-090','3891-2288','','8369-3985','ritadiasnolasco@uol.com.br','',12,4,'','P','2012-03-09 16:47:55','admin'),(551,'Thais Godoy de Azevedo',1,'',NULL,NULL,'Granja Viana','Cotia',NULL,'47779368','','91447676','thaitata@gmail.com','',12,NULL,'','P','2012-03-09 16:48:12','admin'),(552,'RIVA PEREIRA DIAS',1,'',NULL,NULL,'Vila Yara','Osasco',NULL,'3448-3263','','9681-9159','riva bereta@ig.com.br','',NULL,NULL,'','P','2012-03-09 16:50:21','admin'),(553,'JULIANA DE PAULA CASTRO',2,'','Av. Manoel Pedro Pimentel, 200 Bl 14 Ap. 61','bloco 14 apto 61','Jd. Wilson','Osasco','06020-194','3714-1428','7218-7093','9631-4928','juliana.pcastro@hotmail.com','',8,0,'','P','2012-03-09 17:06:37','admin'),(554,'LETICIA REIS',1,'',NULL,NULL,'Parque das Azaléias','Osasco',NULL,'4187-8118','','8611-5531','letisrs@hotmail.com','',NULL,NULL,'','P','2012-03-09 17:08:49','admin'),(555,'Rodrigo Papp Cadima',99,'','Av. Ipê, 177','','Cidade das Flores','Osasco','06184-170','','','89856639','daopapp@hotmail.com','',15,0,'','P','2012-03-11 10:53:40','admin'),(556,'eduardo gomes ronconi',99,'','av. manoel pedro pimentel','200 bloco 13 apto 94','jardim wilson','Osasco','06020-194','3714-3618','3605-1243','8474-1027','tcronconi1@terra.com.br','',8,4,'','P','2012-03-11 20:51:06',NULL),(557,'Thais Godoy de Azevedo',1,'',NULL,NULL,'Granja Viana','Cotia',NULL,'47779368','','91447676','thaitata@hotmail.com','',7,0,'','P','2012-03-13 16:47:01',NULL),(558,'Cida Aparecida Carneiro',2,'','Av. Eng. Antonio Eiras Garcia, 4455','apto.2123','Jardim Rosa Maria','São Paulo','05564-100','37881903','','62507585','cidacarneiros@gmail.com','',7,0,'','P','2012-03-13 16:51:54',NULL),(559,'Luiz Meneguini',1,'',NULL,NULL,'Jaguaré','São Paulo',NULL,'2507-1638','','9688-1638','luizmeneguini@gmail.com','',10,6,'','P','2012-03-14 12:40:50','admin'),(560,'Edson e Solange Lima',2,'','Av. Dr. Martin Luther King, 2255 Ap. 71 B','','Vl São Francisco','Sao Paulo','06030-016','3683-5878','9981-6224','9179-6985','solange@santander.com.br','',10,6,'','P','2012-03-14 12:45:00','admin'),(561,'Alexandre Bixetti',1,'',NULL,NULL,'Vila São Francisco','São Paulo',NULL,'3714-6962','5189-7938','9260-9761','alexandre.bizetti@merck.com','',10,5,'','P','2012-03-14 12:51:42','admin'),(562,'Dulcimea Vasconcelos P de Oliveira',2,'','Rua Manoel Joaquim Pera 78','Conjunto Resid. Butantã','Butantã','São Paulo','05539-030','','','','jessicavasconcelosoliveira@gmail.com','',10,5,'','P','2012-03-14 12:55:22','admin'),(563,'Alexandre Bizetti',1,'',NULL,NULL,'Cidade São Francisco','São Paulo',NULL,'','','','','',10,5,'','P','2012-03-14 13:03:43','admin'),(564,'Cida Carneiro',99,'','Av. Engenheiro Antonio Heitor Eiras Garcia 4455 apto 2123','','Rosa Maria','São Paulo','05564-100','3788-1903','','6250-7585','cidacarneiros@gmail.com','',10,0,'','P','2012-03-14 15:43:44',NULL),(565,'Suely Begnini',2,'','R. Prof. Astolfo Tavares Paes, 86','apto 62, bloco A','Vila São francisco','São Paulo','05352-070','37653569','','81036093','suelybegnini@bol.com.br','',8,4,'','P','2012-03-14 16:48:22',NULL),(566,'Roberto Mello',1,'',NULL,NULL,'Jaguaré','São Paulo',NULL,'','','78652331','robertomel.cobraman@yahoo.com.br','',8,4,'','P','2012-03-14 16:49:39',NULL),(567,'Carlos Augusto Gonçalves Pires',2,'','Rua Manoel Saraiva 130','','Campesina','Osasco','06023-060','3682-2592','','8458-3862','','',15,0,'','P','2012-03-15 11:26:35','admin'),(568,'Ronaldo Souza',1,'',NULL,NULL,'São Francisco','São Paulo',NULL,'','','8447-5042','ravs@ravs.com.br','',15,0,'','P','2012-03-15 15:16:21',NULL),(569,'Edmilson e Beatriz Almeida',2,'','Rua Diogo Gomes Carneiro 500 casa 64','','Jardim Rosa Maria','São Paulo','05547-030','3788-1181','2188-0533','7886-5970','edmilson.almeida@hotmail.com','\0',15,0,'','P','2012-03-15 15:37:55',NULL),(570,'Carlos Augusto  Gonçalves Pires',2,'','R. Manoel Saraiva, 130','','Campesina','Osasco','06023-060','3682-2592','','8458-3862','','',15,0,'','P','2012-03-15 15:45:35',NULL),(571,'Samuel Santana',2,'','R. Paranauçu, 94','','Jaguaré','São Paulo','05335-030','3483-9469','','9745-8757','samuelmarketing@hotmail.com','',20,0,'','P','2012-03-15 16:00:36',NULL),(572,'Marize Paiva',1,'',NULL,NULL,'Jaguaré','São Paulo',NULL,'3726-4973','','8999-2628','marize.paiva@gmail.com','',20,0,'','P','2012-03-15 16:06:28',NULL),(573,'Genivaldo José Oliveira',1,'',NULL,NULL,'Jardim Conceição','Osasco',NULL,'34334717','9786-9420','7771-3265','dricavital@yahoo.com.br','',12,10,'','P','2012-03-16 11:38:36','admin'),(574,'Nivea Magda M de Lima Ruiz',2,'','Rua das Camurças 76','','Jardim do Engenho','Cotia','04671-460','4551-2896','3688-4828','6536-3676','niveamagda@hotmail.com','',12,10,'','P','2012-03-16 11:45:19','admin'),(575,'Erika Frison B Leite',1,'',NULL,NULL,'Rio Pequeno','São Paulo',NULL,'3535-5023','8771-6568','6753-8461','erika.fb@gmail.com','',6,0,'','P','2012-03-16 12:48:59',NULL),(576,'Mateus Roberto de Souza',2,'','Av. Dr. Candido de Mota Filho, 31 53 D','','Vila São francisco','São Paulo','05351-000','2768-7002','3379-7809','8694-9838','mateus@herbalife.com','',6,0,'','P','2012-03-16 12:52:32',NULL),(577,'José Braz Gomes',1,'',NULL,NULL,'Cohab 2 -','Carapicuiba',NULL,'41888797','','91939930','','',NULL,NULL,'','P','2012-03-18 20:58:50',NULL),(578,'Eduardo Gomes Ronconi e Tereza',99,'','Av. Manoel Pedro Pimentel, 200','Bl 13 - apto. 94','Jardim Wilson','Osasco','06020-194','37143618','36051243','84741027','tcronconi1@terra.com.br','',10,6,'','P','2012-03-20 15:04:41','admin'),(579,'Lucas e Thalita',99,'casais jovens','Av. Miguel Frias e Vasconcelos, 756','apto. 183, torre 2','Jaguaré','São Paulo','','','','81268002','lucborgess@hotmail.com','',10,0,'','P','2012-03-20 15:10:56','admin'),(580,'Paulo Fernando e Simone Rodrigues',2,'','Est. São Francisco 2701','apto. 214 - Bloco Canário','Ecos Natureza Club','Taboão da Serra','06764-290','47718168','','93493738','paulofernando@drigon.com.br','',20,8,'','P','2012-03-20 15:38:07','admin'),(581,'Livia Martins Hannes',1,'',NULL,NULL,'Butantã','São Paulo',NULL,'','','8164-9998','liviahannes@hotmail.com','',10,0,'','P','2012-03-21 14:10:54',NULL),(582,'Jessica Vasconcelos',2,'','Rua Manoel Joaquim Pera, 78','Conj. Residencail Butantã','Butantã','São Paulo','05539-030','3722-4929','','','jessicavasconcelosoliveira@gmail.com','',10,0,'','P','2012-03-21 14:14:23',NULL),(583,'Angelo Marques',99,'','Rua Das Camelias,  369','','Parque Assunção','Taboão da Serra','06754-110','4787-7738','3478-6900','9543-4044','angelo.marques@bol.com.br','',10,0,'','P','2012-03-21 14:50:10','admin'),(584,'Norma de Lima Ferreira de Jesus',99,'','Rua Dr. Wladimir do Amaral, 286','','Butantã','São Paulo','05535-070','3721-6596','','','nifj@uol.com.br','',20,7,'','P','2012-03-27 16:32:14','admin'),(585,'Norma de Lima Ferreira de Jesus',2,'','Rua Dr. Wladimir do Amaral 286','','Butantã','São Paulo','05535-070','3721-6596','','','nifj@uol.com.br','',20,7,'','P','2012-03-27 16:36:10','admin'),(586,'Michel Jorge Buoery Neto',1,'',NULL,NULL,'Butantã','São Paulo',NULL,'3721-6596','','8367-3928','mbuoery@hotmail.com','',20,7,'','P','2012-03-27 16:38:40','admin'),(587,'Fernando & Fátima',99,'',' Rua Pedro Domingos da Silva, 17','','Jardim da Glória','Osasco','06038-380','3659-6674','7519-0301','9988-0330','marcnando@gmail.com','',10,4,'','P','2012-03-28 17:49:53','admin'),(588,'Jussara Camara Pessoa',99,'','Av. José Lourenço 261','apto. 12','Jardim Jaguaribe','Osasco','06053-020','36053781','','76912955','jpessoa03@gmail.com','',10,8,'','P','2012-04-15 11:57:40','admin'),(589,'Erika Frison Leite',1,'',NULL,NULL,'','São Paulo',NULL,'','','67538461','erika.fb@gmail.com','',15,0,'','P','2012-05-06 11:40:57',NULL),(590,'Marta Lucia',2,'','Av. José Maria Alkimin 431','','Jardim Ester','São Paulo','','35676931','','','','',15,0,'','P','2012-05-06 11:43:15',NULL),(591,' Alex Clayton Lins',1,'',NULL,NULL,'Jd. Cipava','Osasco - SP',NULL,'11 3592-0145','','11 8698-0875','alex-c-lins@uol.com.br','',15,10,'','P','2012-06-19 16:17:42','admin'),(592,' Flavia Torres Baptista Strobl',2,'','Rua Bernardo dos Santos, 10','Torre Sigma - Apto 101','Js Cipava','Osasco','05542-000','11 3721-1117','','11 8080-8419','torresstrobl@gmail.com','',15,10,'','P','2012-06-19 16:21:15','admin');
/*!40000 ALTER TABLE 'tfacilhosp' ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'tfuncao'
--

DROP TABLE IF EXISTS 'tfuncao';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE 'tfuncao' (
  'ID' int(1) NOT NULL,
  'NOME' char(20) NOT NULL,
  UNIQUE KEY 'ID' ('ID')
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table 'tfuncao'
--

LOCK TABLES 'tfuncao' WRITE;
/*!40000 ALTER TABLE 'tfuncao' DISABLE KEYS */;
INSERT INTO 'tfuncao' VALUES (1,'Facilitador'),(2,'Hospedeiro'),(99,'Ambos');
/*!40000 ALTER TABLE 'tfuncao' ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'tgrupo'
--

DROP TABLE IF EXISTS 'tgrupo';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE 'tgrupo' (
  'ID' int(10) NOT NULL AUTO_INCREMENT,
  'CODIGOFAC' int(10) NOT NULL,
  'CODIGOHOSP' int(10) NOT NULL,
  'DIASEMANA' int(1) NOT NULL,
  'HORARIO' int(1) NOT NULL,
  'TIPOGRUPO' int(2) NOT NULL,
  'GRUPOOUTRO' char(30) DEFAULT NULL,
  'QTDEMAXIMA' int(10) NOT NULL,
  'STATUS' char(1) DEFAULT 'F',
  PRIMARY KEY ('ID'),
  KEY 'GFACILITADOR_FK' ('CODIGOFAC'),
  KEY 'GHOSPEDEIRO_FK' ('CODIGOHOSP'),
  KEY 'GDIASEMANA_FK' ('DIASEMANA'),
  KEY 'GHORARIO_FK' ('HORARIO'),
  KEY 'GTIPOGRUPO_FK' ('TIPOGRUPO')
) ENGINE=MyISAM AUTO_INCREMENT=390 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table 'tgrupo'
--

LOCK TABLES 'tgrupo' WRITE;
/*!40000 ALTER TABLE 'tgrupo' DISABLE KEYS */;
INSERT INTO 'tgrupo' VALUES (252,46,46,6,1,7,'',10,'F'),(251,45,45,5,2,4,'',12,'F'),(250,44,44,7,2,5,'',10,'F'),(248,43,43,7,2,5,'',15,'F'),(247,42,42,4,2,4,'',12,'F'),(246,41,41,5,2,5,'',8,'F'),(245,40,40,4,2,4,'',8,'F'),(244,39,39,5,2,4,'',15,'F'),(242,38,38,6,2,4,'',10,'F'),(241,37,37,4,2,5,'',6,'F'),(240,36,36,5,2,5,'',10,'F'),(388,589,590,3,2,5,'',15,'F'),(238,34,34,3,2,4,'',10,'F'),(237,33,33,6,2,7,'',8,'F'),(235,31,31,4,2,5,'',12,'F'),(234,30,30,6,2,5,'',8,'F'),(232,29,29,2,2,4,'',15,'F'),(231,28,28,6,2,4,'',13,'F'),(230,27,27,6,2,4,'',17,'F'),(229,26,26,7,1,5,'',10,'F'),(228,25,25,4,1,7,'',10,'F'),(227,24,24,6,2,4,'',12,'F'),(226,23,23,2,2,4,'',15,'F'),(225,22,22,7,2,5,'',10,'F'),(224,21,21,6,1,7,'',20,'F'),(223,20,20,7,2,4,'',20,'F'),(222,19,19,4,2,5,'',12,'F'),(220,17,17,2,2,5,'',10,'F'),(219,16,16,6,2,3,'',10,'F'),(218,15,15,7,2,4,'',15,'F'),(217,14,14,6,2,4,'',10,'F'),(216,13,13,4,1,7,'',13,'F'),(215,12,12,3,1,7,'',7,'F'),(214,11,11,2,2,5,'',6,'F'),(212,9,9,3,2,7,'',10,'F'),(211,8,8,4,2,4,'',2,'F'),(210,7,7,4,1,7,'',6,'F'),(209,6,6,4,2,5,'',20,'F'),(207,5,5,6,2,5,'',8,'F'),(204,4,4,6,2,5,'',6,'F'),(202,2,2,5,2,5,'',10,'F'),(201,1,1,6,2,4,'',20,'F'),(255,51,51,3,2,5,'',15,'F'),(256,53,54,3,2,5,'',20,'F'),(257,55,56,3,2,5,'',10,'F'),(258,58,57,3,2,5,'',8,'F'),(385,586,586,5,2,4,'',20,'F'),(260,61,62,2,2,4,'',30,'F'),(262,66,65,3,2,5,'',10,'F'),(264,70,69,4,2,5,'',15,'F'),(266,71,72,4,2,5,'',20,'F'),(271,82,81,5,2,5,'',8,'F'),(274,84,83,2,2,4,'',15,'F'),(276,87,88,5,2,4,'',8,'F'),(277,90,89,5,2,4,'',8,'F'),(278,91,92,3,2,7,'',12,'F'),(281,95,96,2,2,7,'',10,'F'),(283,98,97,6,2,5,'',10,'F'),(285,99,100,7,2,4,'',12,'F'),(290,105,106,5,2,4,'',30,'F'),(386,587,587,5,2,4,'',11,'F'),(352,527,527,3,2,4,'',8,'F'),(350,522,522,6,2,4,'',13,'F'),(351,524,524,7,2,5,'',10,'F'),(353,528,529,5,2,5,'',25,'F'),(354,530,531,6,2,4,'',15,'F'),(355,532,532,4,2,4,'',10,'F'),(356,525,525,3,2,4,'',12,'F'),(384,583,583,6,2,5,'',10,'F'),(368,555,555,7,2,6,'',2,'F'),(359,539,538,6,2,4,'',10,'F'),(383,581,582,7,1,6,'',15,'F'),(382,552,580,6,2,4,'',20,'F'),(381,579,579,6,2,9,'',10,'F'),(363,547,546,6,2,5,'',15,'F'),(380,578,578,6,2,4,'',4,'F'),(379,547,576,2,2,5,'',8,'F'),(378,573,574,6,2,4,'',12,'F'),(387,588,588,6,2,4,'',12,'F'),(373,564,564,5,2,5,'',10,'F'),(374,566,565,6,2,4,'',8,'F'),(375,568,569,6,2,5,'',15,'F'),(376,73,570,5,2,5,'',15,'F'),(377,572,571,6,2,5,'',20,'F'),(389,591,592,6,2,3,'',15,'F');
/*!40000 ALTER TABLE 'tgrupo' ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'thorario'
--

DROP TABLE IF EXISTS 'thorario';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE 'thorario' (
  'ID' int(1) NOT NULL,
  'NOME' char(20) NOT NULL,
  UNIQUE KEY 'ID' ('ID')
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table 'thorario'
--

LOCK TABLES 'thorario' WRITE;
/*!40000 ALTER TABLE 'thorario' DISABLE KEYS */;
INSERT INTO 'thorario' VALUES (0,'Manhã'),(1,'Tarde'),(2,'Noite'),(9,'INDEFINIDO');
/*!40000 ALTER TABLE 'thorario' ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'thorario_facilhosp'
--

DROP TABLE IF EXISTS 'thorario_facilhosp';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE 'thorario_facilhosp' (
  'IDHORARIO' int(1) NOT NULL,
  'IDFACILHOSP' int(10) NOT NULL,
  KEY 'HORARIO_FK' ('IDHORARIO'),
  KEY 'FACILHOSP3_FK' ('IDFACILHOSP')
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table 'thorario_facilhosp'
--

LOCK TABLES 'thorario_facilhosp' WRITE;
/*!40000 ALTER TABLE 'thorario_facilhosp' DISABLE KEYS */;
INSERT INTO 'thorario_facilhosp' VALUES (1,13),(1,21),(2,4),(2,8),(2,41),(2,50),(2,63),(2,28),(2,33),(2,77),(2,5),(2,6),(2,9),(2,11),(2,18),(2,19),(2,23),(2,27),(2,30),(2,35),(2,38),(2,39),(2,42),(2,45),(2,47),(2,49),(2,52),(2,54),(2,57),(2,59),(2,61),(2,62),(2,64),(2,65),(2,69),(2,74),(2,76),(2,79),(2,81),(2,82),(2,89),(2,90),(2,94),(2,97),(2,101),(2,105),(2,107),(2,25),(2,22),(2,37),(2,34),(2,51),(2,56),(2,58),(2,68),(2,75),(2,78),(2,87),(2,88),(2,92),(2,104),(2,109),(2,31),(2,36),(2,66),(2,91),(0,84),(2,84),(2,2),(2,10),(2,14),(2,17),(2,29),(2,40),(2,48),(2,60),(2,70),(2,72),(2,73),(2,80),(2,83),(2,85),(2,86),(2,99),(2,100),(2,102),(2,103),(0,55),(1,55),(2,55),(0,20),(1,20),(2,20),(0,106),(1,106),(2,106),(0,1),(1,1),(2,1),(1,7),(1,12),(1,46),(1,95),(2,95),(1,15),(2,15),(1,32),(2,32),(1,43),(2,43),(1,96),(2,96),(1,108),(2,108),(2,522),(2,523),(2,524),(2,525),(2,526),(2,527),(2,528),(2,529),(2,530),(2,531),(2,532),(2,533),(2,534),(2,535),(2,536),(2,537),(2,538),(2,539),(2,540),(2,541),(2,542),(2,543),(2,544),(2,545),(2,546),(2,547),(2,548),(2,549),(2,550),(2,551),(2,552),(2,553),(2,554),(2,555),(2,556),(2,557),(2,558),(2,559),(2,560),(2,561),(2,562),(2,563),(2,564),(2,565),(2,566),(2,567),(2,568),(2,569),(2,570),(2,571),(2,572),(2,573),(2,574),(2,575),(2,576),(2,577),(2,578),(2,579),(2,580),(1,581),(1,582),(2,583),(2,584),(2,585),(2,586),(2,587),(2,588),(2,589),(2,590),(2,591),(2,592);
/*!40000 ALTER TABLE 'thorario_facilhosp' ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'tparticipante'
--

DROP TABLE IF EXISTS 'tparticipante';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE 'tparticipante' (
  'ID' int(10) NOT NULL AUTO_INCREMENT,
  'CODIGOGRUPO' int(10) NOT NULL,
  'NOME' char(50) NOT NULL,
  'EMAIL' char(100) DEFAULT NULL,
  'TELEFONE' char(15) DEFAULT NULL,
  'OUTROTELEFONE' char(15) DEFAULT NULL,
  'DATACADASTRO' datetime DEFAULT NULL,
  'QTDECRIANCAS' int(2) DEFAULT NULL,
  PRIMARY KEY ('ID'),
  KEY 'PGRUPO_FK' ('CODIGOGRUPO')
) ENGINE=MyISAM AUTO_INCREMENT=2157 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table 'tparticipante'
--

LOCK TABLES 'tparticipante' WRITE;
/*!40000 ALTER TABLE 'tparticipante' DISABLE KEYS */;
INSERT INTO 'tparticipante' VALUES (1629,231,'Tatiane','barros.tatiane@gmail.com','89597754',NULL,'2012-03-04 12:21:37',2),(1630,230,'flavio de oliveira','','8567-5789',NULL,'2012-03-04 12:22:41',2),(1631,244,'Alexandre Zaballa Dias','azaballadias@gmail.com','83797799',NULL,'2012-03-04 12:22:47',2),(1632,231,'Evelyn','','89587754',NULL,'2012-03-04 12:23:02',2),(1633,230,'vivian boletini de oliveira','','8567-5789',NULL,'2012-03-04 12:23:18',NULL),(1634,231,'ronaldo','','89587754',NULL,'2012-03-04 12:23:23',NULL),(1635,231,'joao ricardo','','89587754',NULL,'2012-03-04 12:23:56',NULL),(1636,230,'edison','','3603-5494',NULL,'2012-03-04 12:24:05',1),(1637,231,'Erika','','89587754',NULL,'2012-03-04 12:24:23',2),(1638,230,'elaine','','3603-5494',NULL,'2012-03-04 12:24:32',NULL),(1639,241,'Lilian Walsh Keller','','97660777',NULL,'2012-03-04 12:24:44',NULL),(1640,231,'Katia','','89587754',NULL,'2012-03-04 12:25:12',NULL),(1641,230,'donizeti zambeli','','3688-2669',NULL,'2012-03-04 12:25:15',NULL),(1642,230,'claudeti zambeli','','3688-2669',NULL,'2012-03-04 12:25:44',NULL),(1854,382,'José Marques de Oliveira','riva.bereta@ig.com.br','3448-3263',NULL,'2012-03-25 12:05:58',NULL),(1644,230,'alberto','','3695-5494',NULL,'2012-03-04 12:26:22',1),(1856,351,'Margarida de Araújo Almeida','','34317559',NULL,'2012-03-25 12:08:17',NULL),(1855,351,'Ricardo de Almeida','','34317559',NULL,'2012-03-25 12:07:42',NULL),(1647,230,'ivete','','3695-5494',NULL,'2012-03-04 12:27:11',NULL),(1648,291,'Diego de Lima Ruiz','','4551-2896',NULL,'2012-03-04 12:27:16',NULL),(1649,291,'Donizete Lima','','8693-6884',NULL,'2012-03-04 12:28:18',NULL),(1847,274,'Gabriel','','3731-6182',NULL,'2012-03-21 12:03:58',NULL),(1651,291,'katherine Moura G. dos Santos','sydsan@hotmail.com','8445-9756',NULL,'2012-03-04 12:30:37',2),(1846,274,'Natalia','','3731-6182',NULL,'2012-03-21 12:03:33',NULL),(1653,268,'Valeria Calera','','25764914',NULL,'2012-03-04 12:31:26',4),(1654,225,'Mauro Furtado','','11 - 79967928',NULL,'2012-03-04 12:31:33',NULL),(1655,268,'Anderson Calera','','25764914',NULL,'2012-03-04 12:31:47',NULL),(1656,225,'Adriana Furtado','','11 - 77318872',NULL,'2012-03-04 12:32:47',NULL),(1657,285,'adriana limoli','','8412-5615',NULL,'2012-03-04 12:40:39',1),(1658,285,'aline franco','luiz.sou@globo.com','9736-5047',NULL,'2012-03-04 12:41:37',NULL),(1659,285,'luiz alves','luiz.sou@globo.com','9736-5047',NULL,'2012-03-04 12:43:08',NULL),(1660,275,'Otaviano Santana','','11 37682919',NULL,'2012-03-04 20:51:48',NULL),(1661,275,'Leondina Cosmo de Santana','','37682919',NULL,'2012-03-04 20:52:14',NULL),(1662,275,'Rosana Cosmo Santana','','37682919',NULL,'2012-03-04 20:52:42',NULL),(1664,216,'Alzira Morales Freitas','aa@gmail.com','1111',NULL,'2012-03-09 11:14:49',NULL),(1665,216,'Elza Câmara','aa@gmail.com','1111',NULL,'2012-03-09 11:15:12',NULL),(1666,216,'Idalina Maria Ribeiro','aa@gmail.com','1111',NULL,'2012-03-09 11:15:35',NULL),(1667,216,'Ivonete Maria de Almeida','aa@gmail.com','1111',NULL,'2012-03-09 11:15:59',NULL),(1668,216,'Lionor Da Silva Nascimento','aa@gmail.com','1111',NULL,'2012-03-09 11:16:21',NULL),(1669,216,'Lúcia Maria Aleixo dos Santos','aa@gmail.com','1111',NULL,'2012-03-09 11:16:43',NULL),(1670,216,'Maria Cristina D Pietro','aa@gmail.com','1111',NULL,'2012-03-09 11:17:03',NULL),(1671,216,'Setsuko Okayama Tiba','aa@gmail.com','1111',NULL,'2012-03-09 11:17:27',NULL),(1672,216,'Terezinha Rodrigues Lima','aa@gmail.com','1111',NULL,'2012-03-09 11:17:47',NULL),(1673,368,'Tatiana Jacob Hessel Bueno Cadima','tathibueno@hotmail.com','89962251',NULL,'2012-03-11 10:57:42',0),(1674,207,'Leia Costa Matos','leiaplanodesaude@gmail.com','37315449',NULL,'2012-03-11 12:19:35',NULL),(1712,226,'jumara goncalves','','8456-6706',NULL,'2012-03-11 20:42:46',NULL),(1711,226,'barbara goncalves','','3692-3547',NULL,'2012-03-11 20:42:12',NULL),(1710,271,'Zelandia Ishida','zelandia.ishida@gmail.com','2476-2290',NULL,'2012-03-11 20:35:27',NULL),(1709,237,'Vera Paes','','37350858',NULL,'2012-03-11 12:56:07',NULL),(1679,235,'Fernando Takahashi','','92183773',NULL,'2012-03-11 12:26:54',NULL),(1680,201,'Celina','','4169-8138',NULL,'2012-03-11 12:27:14',NULL),(1681,201,'Orlando','','9485-6406',NULL,'2012-03-11 12:27:43',NULL),(1682,235,'Cristhiane Takahashi','','92663283',NULL,'2012-03-11 12:28:06',NULL),(1683,201,'Adriana','','7338-5545',NULL,'2012-03-11 12:28:37',NULL),(1684,235,'Priscila Mesquita','','98287207',NULL,'2012-03-11 12:28:48',NULL),(1685,235,'Rodrigo Oliveira','','99603582',NULL,'2012-03-11 12:29:23',NULL),(1686,285,'Ruth Simon','','37812066',NULL,'2012-03-11 12:29:36',NULL),(1687,235,'Tamara','','99593340',NULL,'2012-03-11 12:31:07',NULL),(1688,283,'joao ricardo boccuzzi grimaldi','joao.grimaldi@ig.com.br','4191-7072',NULL,'2012-03-11 12:32:54',2),(1689,237,'Tereza Cristina C. Silva','','3735-0858',NULL,'2012-03-11 12:33:24',NULL),(1690,354,'Patricia ROSEMEIRE Valentim Gomes','','41488389',NULL,'2012-03-11 12:34:07',NULL),(1691,283,'kenia picorele torres grimaldi','keniatorres@ig.com.br','9536-5972',NULL,'2012-03-11 12:34:21',NULL),(1692,237,'Elza Campos dos Santos','','3735-0858',NULL,'2012-03-11 12:34:33',NULL),(1845,274,'Ruth','','3731-6182',NULL,'2012-03-21 12:03:03',NULL),(1694,237,'Maria Aparecida Campos Mendes','','3735-0858',NULL,'2012-03-11 12:35:46',NULL),(1695,237,'Vanda F Goncalves','','3735-0858',NULL,'2012-03-11 12:37:35',NULL),(1696,237,'Marta Rodrigues','','3735-0858',NULL,'2012-03-11 12:38:08',NULL),(1848,381,'Thalita','','8284-7444',NULL,'2012-03-21 13:39:26',NULL),(1698,283,'marcio pereira cavalcante','','4163-3608',NULL,'2012-03-11 12:39:28',NULL),(1975,373,'osmar apendino','','62507585',NULL,'2012-04-15 18:32:44',NULL),(1700,237,'Hida Rodrigues','','3735-0858',NULL,'2012-03-11 12:40:08',NULL),(1858,204,'Erica Carvalho Da Silva','aa@gmail.com','3655-2815',NULL,'2012-03-25 12:11:11',NULL),(1702,283,'bruna torres','','4163-5953',NULL,'2012-03-11 12:41:02',NULL),(1703,245,'Elane lessa','','36021479',NULL,'2012-03-11 12:43:20',2),(1704,245,'Elidio Silvestre','','36039803',NULL,'2012-03-11 12:44:12',1),(1705,245,'Eduana Silvestre','','36039803',NULL,'2012-03-11 12:44:55',NULL),(1706,245,'Cira Lessa','','36024418',NULL,'2012-03-11 12:45:39',NULL),(1707,245,'Valdemario Lessa','','36024418',NULL,'2012-03-11 12:46:29',NULL),(1713,259,'Ester Noemi Soares','aa@gmail.com','3681-8116',NULL,'2012-03-11 20:43:12',NULL),(1714,222,'Elieser','','8202-0805',NULL,'2012-03-11 20:43:27',NULL),(1715,226,'rosangela batista','','8089-0249',NULL,'2012-03-11 20:43:48',NULL),(1716,256,'Wellinton','','91417505',NULL,'2012-03-11 20:43:51',1),(1717,222,'Talita','','8202-0805',NULL,'2012-03-11 20:43:51',NULL),(1718,222,'Jeferson','','8202-0805',NULL,'2012-03-11 20:44:14',NULL),(1719,226,'maria glicia','','3605-4617',NULL,'2012-03-11 20:44:23',NULL),(1720,256,'Simone','','91417505',NULL,'2012-03-11 20:44:25',NULL),(1721,222,'Rafaela','','8202-0805',NULL,'2012-03-11 20:44:32',NULL),(1722,222,'Mariana','','8202-0805',NULL,'2012-03-11 20:44:49',NULL),(1723,226,'cinara goncalves','','3692-3547',NULL,'2012-03-11 20:45:48',NULL),(1724,222,'Rafael','','8202-0805',NULL,'2012-03-11 20:45:49',NULL),(1725,222,'Renata','','8202-0805',NULL,'2012-03-11 20:46:06',NULL),(1726,256,'Saara Ramalho','','63005052',NULL,'2012-03-11 20:46:07',1),(1727,275,'Roberto Ciarci Junior','aa@gmail.com','3681-5414',NULL,'2012-03-11 20:46:45',NULL),(1728,222,'Nayara','','8202-0805',NULL,'2012-03-11 20:48:02',NULL),(1729,222,'Reginer','','8202-0805',NULL,'2012-03-11 20:48:33',NULL),(1730,222,'Nilberth','','8202-0805',NULL,'2012-03-11 20:48:56',NULL),(1731,222,'Mariana Ferreira','','8202-0805',NULL,'2012-03-11 20:49:23',NULL),(1732,215,'Silvia Menezes','','3608-0225',NULL,'2012-03-11 20:53:39',NULL),(1733,215,'Candida Pavao','','3608-0225',NULL,'2012-03-11 20:54:31',NULL),(1734,277,'Romeu Garcia Larajeira','helena.biondo@r7.com','36853850',NULL,'2012-03-11 20:54:39',NULL),(1735,363,'katherine moura g. p. dos santos','','2592-7989',NULL,'2012-03-11 20:54:53',1),(1736,215,'Elisete','','3608-0225',NULL,'2012-03-11 20:54:56',NULL),(1737,258,'Alba Sakamoto','aa@gmail.com','4620-0433',NULL,'2012-03-11 20:57:24',NULL),(1738,235,'Fabio Ferreira','','97393917',NULL,'2012-03-11 20:58:12',NULL),(1739,235,'Joice Conessa','','95626457',NULL,'2012-03-11 20:58:55',NULL),(1740,258,'Fernanda Bispo Martins','rifer2004@uol.com','3768-3940',NULL,'2012-03-11 21:03:53',NULL),(1741,218,'Veria Siqueira da Silva','','3601-2091',NULL,'2012-03-11 21:06:47',NULL),(1742,218,'Thiago Luis da Silva','','8266-6958',NULL,'2012-03-11 21:07:33',NULL),(1743,218,'Aline Amorin Silva','','8266-6958',NULL,'2012-03-11 21:08:06',NULL),(1748,378,'Diego Ruiz','','6536-3676',NULL,'2012-03-16 11:50:06',NULL),(1746,229,'Luciano esposa','','4139-7439',NULL,'2012-03-15 22:05:13',NULL),(1749,378,'Donizete de Lima','','6536-3676',NULL,'2012-03-16 11:52:11',NULL),(1750,379,'Andressa','','2768-7002',NULL,'2012-03-16 12:54:38',NULL),(1752,376,'Kelly Maria de Santana Batista','','8235-1025',NULL,'2012-03-16 14:30:55',3),(1853,236,'irmã','mgracas.araujo@gmail.com','25032910',NULL,'2012-03-22 09:21:09',NULL),(1852,236,'Kelly','mgracas.araujo@gmail.com','25032910',NULL,'2012-03-22 09:20:28',NULL),(1851,236,'Beatriz','mgracas.araujo@gmail.com','25032910',NULL,'2012-03-22 09:19:43',NULL),(1757,285,'Suzy','','86698047',NULL,'2012-03-18 10:40:45',NULL),(1758,285,'Alex','','86698047',NULL,'2012-03-18 10:41:15',NULL),(1759,246,'Elizangela Nunes','soueliz@gmail.com','',NULL,'2012-03-18 11:58:10',NULL),(2135,211,'xxxxxxxxxxxxxxxxxxxx','','93128297',NULL,'2012-05-10 09:38:53',NULL),(1761,210,'Carmen Yosino','','37351256',NULL,'2012-03-18 12:01:52',NULL),(1762,238,'eliana helena','','37212727',NULL,'2012-03-18 12:01:54',NULL),(1763,353,'Debora Olivia','debora_olivia@yahoo.com','37634551',NULL,'2012-03-18 12:02:16',NULL),(1764,246,'Lucinha Vicente','lu_vicente@yahoo.com.br','9505-1150',NULL,'2012-03-18 12:02:19',NULL),(1765,238,'joao vitor','','37212727',NULL,'2012-03-18 12:02:38',NULL),(1766,201,'Patricia Freitas','freitas.patriciab@gmail.com','70034443',NULL,'2012-03-18 12:02:46',NULL),(1767,350,'Sonia Regina Gomes','srg@soniareginagomes.com.br','4169-8475',NULL,'2012-03-18 12:03:14',NULL),(1951,245,'Sergio Paulo','aa@gmail.com','1111-1111',NULL,'2012-04-15 11:56:45',NULL),(1769,210,'tereza da silva metidieri','tmetidieri@ibest.com.br','3731-3581',NULL,'2012-03-18 12:03:36',NULL),(1770,255,'Yonara dantas de Oliveira','yonaradantas@yahoo.com.br','8039-9168',NULL,'2012-03-18 12:03:50',NULL),(1771,210,'Lindaura Teixeira','','76083272',NULL,'2012-03-18 12:03:58',NULL),(1772,250,'Silvio Batista de Oliveira','silvio_batista@hotmail.com','80484414',NULL,'2012-03-18 12:04:41',NULL),(1977,219,'Natascha','','3915-8958',NULL,'2012-04-15 18:47:27',NULL),(1774,234,'Denise de Souza Scala','godenisescala@yahoo.com.br','23852411',NULL,'2012-03-18 12:04:47',NULL),(1775,255,'Miguel Antar','miguedz5@gmail.com','6539-3645',NULL,'2012-03-18 12:04:48',NULL),(1776,350,'Richard Huebner','richard_huebner@hotmail.com','4169-8475',NULL,'2012-03-18 12:05:37',NULL),(1777,212,'Karla Cristina Ravanelli Capelas','karla.ravanelli@ibest.com.br','9191-3952',NULL,'2012-03-18 12:05:56',NULL),(1778,356,'maria tania','','37826728',NULL,'2012-03-18 12:06:50',NULL),(1779,229,'debora  coelho','debora@amy.com.br','7655-7473',NULL,'2012-03-18 12:07:13',NULL),(1780,356,'luciana da silva','lu.ssousa4@hotmail.com','37826728',NULL,'2012-03-18 12:07:53',NULL),(1781,229,'cesar coelho','cesar@prostudio.arq.br','7634-7559',NULL,'2012-03-18 12:08:00',NULL),(1782,370,'Nadia de Carvalho Outor','nadia.outor@hotmail.com','37143263  82019',NULL,'2012-03-18 12:08:19',1),(1783,251,'marcelo curtale','curtale@ig.com.br','66452305',NULL,'2012-03-18 12:10:19',1),(1784,354,'Jorge Hugo Bustamente Canales','jorge@itempisos.com.br','7658-0949',NULL,'2012-03-18 12:10:41',1),(1785,251,'siomara curtale','','89575154',NULL,'2012-03-18 12:10:55',NULL),(1786,370,'Ayokunle Onasanya','aayoonas72@yahoo.co.uk','3535-0562',NULL,'2012-03-18 12:11:22',2),(1787,234,'Rose Gonçalves','rosegoncalves@yahoo.com.br','84568371',NULL,'2012-03-18 12:12:40',NULL),(1788,370,'Titilope Onasanya','ayoonas72@yahoo.co.uk','3535-0562',NULL,'2012-03-18 12:12:52',NULL),(2065,250,'Jairo Jr.','jota6341@hotmail.com','7151-8712',NULL,'2012-04-29 20:49:35',NULL),(1790,283,'ANDREIA nalva dos Santas','andreia.santas@abtar.com','7151-7454',NULL,'2012-03-18 12:14:10',NULL),(1791,238,'Marcelo Tavares','nanci-avila@bol.com.br','3731-4059',NULL,'2012-03-18 12:14:38',NULL),(1792,283,'Carlos Fabro','carlosfabro@uol.com.br','7151-7454',NULL,'2012-03-18 12:15:11',NULL),(1793,225,'angela chaves','angela.archaves@hotmail.com','9914-2113',NULL,'2012-03-18 12:16:12',NULL),(1794,220,'Eliane Papapietro','','8322-0049',NULL,'2012-03-18 12:17:27',NULL),(1795,225,'paulo chaves','pauloschaves1957@yahoo.com.br','7434-1944',NULL,'2012-03-18 12:17:33',NULL),(1804,225,'Francismar Faria','ffaria@mitsuialimentos.com','3592-8351',NULL,'2012-03-18 19:08:23',NULL),(1797,225,'josimar faria','','3592-8351',NULL,'2012-03-18 12:18:48',NULL),(1798,244,'TAIS NETO ASAKURA','asakura_house@terra.com.br','3735-3125',NULL,'2012-03-18 12:25:26',1),(1799,244,'agnaldo asakura','asakura_house@terra.com.br','8917-7545',NULL,'2012-03-18 12:26:36',NULL),(1800,201,'claudia leite','claudia.a.leite@hotmail.com','4702-9741',NULL,'2012-03-18 12:34:24',2),(1801,201,'andre leite','andre.leite@innovative.com.br','9619-5674',NULL,'2012-03-18 12:35:14',NULL),(1802,352,'Fabio Simões','aa@gmail.com','3683-0132',NULL,'2012-03-18 18:54:42',2),(1803,352,'Alessandra reis','22@gmail.com','3683-0132',NULL,'2012-03-18 18:55:38',NULL),(1805,378,'Roselaine Palma de Avila Reis','biaecia@ig.com.br','47029812 - 7065',NULL,'2012-03-18 20:35:33',2),(1806,378,'Saulo de Tarso de Avila Reis','','70656103',NULL,'2012-03-18 20:36:28',NULL),(1807,373,'Fernando Iwao Nakshima','voo_da_aguia_2377@hotmail.com','3783-2229',NULL,'2012-03-18 20:38:13',NULL),(1808,350,'marcelo de souza','mfagundes2010@hotmail.com','78256330',NULL,'2012-03-18 20:38:32',NULL),(1809,373,'Marcelo Seiji Nakashima','22@gmail.com','3783-2229',NULL,'2012-03-18 20:39:05',NULL),(1810,370,'katlen boedler','katlen.boedler@hotmail.com','96693407',NULL,'2012-03-18 20:39:27',2),(1811,350,'eliane almeida da silva fagundes','','78256330',NULL,'2012-03-18 20:39:36',1),(1812,250,'Adilson Benvindo de Araújo','','85475519',NULL,'2012-03-18 20:39:37',1),(1813,373,'Regina Bernadete Funchal','aa@gmail.com','3783-2229',NULL,'2012-03-18 20:39:54',NULL),(1814,370,'georg boedler','','96693407',NULL,'2012-03-18 20:40:07',NULL),(1815,276,'Marcos Pereira Bertoldo','marcos-bertoldo@hotmail.com','6820-8132',NULL,'2012-03-18 20:40:17',1),(1816,250,'Ligia Viana Gonçalves de Araújo','','85475519',NULL,'2012-03-18 20:40:34',NULL),(1866,247,'andressa beatriz patornilio (12 anos)','ariene_patornilio@ig.com.br','98180291',NULL,'2012-03-25 20:46:10',NULL),(1850,384,'Lucimen Costa Oliveira','','4771-3242',NULL,'2012-03-21 14:59:19',NULL),(2064,219,'Fernando','','3681-1882',NULL,'2012-04-29 20:05:37',NULL),(1849,384,'Wagner de Oliveira','wrgwgf@yahoo.com.br','47713242',NULL,'2012-03-21 14:58:40',NULL),(2063,219,'Fabiana','','3681-1882',NULL,'2012-04-29 20:04:34',NULL),(1865,247,'Ariene Bleide Fischer','ariene_patornilio@ig.com.br','98180291',NULL,'2012-03-25 20:44:54',NULL),(1823,240,'Samuel Rodrigues Ayres','samuel@unysistem.com.br','81650375',NULL,'2012-03-18 20:44:12',NULL),(1824,235,'Leticia Regina Ferreira Sanchetta','leticiarff@hotmail.com','84678799',NULL,'2012-03-18 20:45:15',NULL),(1825,235,'Renato de Sousa Sanchetta','','81169712',NULL,'2012-03-18 20:46:09',NULL),(1826,377,'Vanessa Leber','','34263628  - 999',NULL,'2012-03-18 20:46:22',NULL),(1827,377,'andreas leber','','34263628',NULL,'2012-03-18 20:47:07',NULL),(1828,377,'Denice Rosini','','78963711',NULL,'2012-03-18 20:48:20',NULL),(1829,377,'Gabriel Rosini','','78963711',NULL,'2012-03-18 20:48:53',NULL),(1830,377,'Valdecy','','37825321',NULL,'2012-03-18 20:49:19',NULL),(1831,354,'Juliana Silva de Andrade','','99218332',NULL,'2012-03-18 20:49:35',2),(1832,377,'Regina Bernardete','','37832229',NULL,'2012-03-18 20:49:44',NULL),(1833,377,'Jenny Abanto Santana','','28198683',NULL,'2012-03-18 20:50:24',NULL),(1834,264,'cristiane rodrigues ferreira','cris_rf27@yahoo.com.br','37836053',NULL,'2012-03-18 20:53:26',NULL),(1835,264,'eva borges dos santos','vbeva@hotmail.com','73150843',NULL,'2012-03-18 20:57:52',NULL),(1836,353,'Roberta','aa@gmail.com','2193-6688',NULL,'2012-03-20 15:09:31',NULL),(1837,353,'Patricia','aa@gmail.com','2193-6688',NULL,'2012-03-20 15:09:55',NULL),(1838,353,'Adriano','aa@gmail.com','2193-6688',NULL,'2012-03-20 15:10:20',NULL),(1839,353,'Alessandra','aa@gmail.com','2193-6688',NULL,'2012-03-20 15:10:49',NULL),(1840,353,'Alessandro','aa@gmail.com','2193-6688',NULL,'2012-03-20 15:11:12',NULL),(1841,353,'Ramon','aa@gmail.com','2193-6688',NULL,'2012-03-20 15:11:39',NULL),(1842,353,'Maria Ângela','aa@gmail.com','2193-6688',NULL,'2012-03-20 15:12:01',NULL),(1843,353,'Marcia','aa@gmail.com','2193-6688',NULL,'2012-03-20 15:12:24',NULL),(1844,353,'Vivian Corominas','aa@gmail.com','2193-6688',NULL,'2012-03-20 15:12:55',NULL),(1976,202,'cleunice aparecida dos reis soares','cleunice.reis@carrera.com.br','36492075',NULL,'2012-04-15 18:35:19',NULL),(1860,204,'Ricardo Da Silva','aa@gmail.com','3655-2815',NULL,'2012-03-25 12:12:17',NULL),(1861,274,'olga oliveira nunes','olganunes29@hotmail.com','79752632',NULL,'2012-03-25 12:12:52',2),(1862,274,'emerson araujo da silva','araujo_eas@hotmail.com','67611962',NULL,'2012-03-25 12:14:59',NULL),(1863,379,'Luciene Rodighro dos Santos','ronaldo.luciene@uol.com.br','3654-1003',NULL,'2012-03-25 12:15:31',NULL),(1864,379,'Ronaldo dos Santos','ronaldo.luciene@uol.com.br','3654-1003',NULL,'2012-03-25 12:15:58',NULL),(1867,220,'giselia rodrigues chaves','babychaves@hotmail.com','3842-6765',NULL,'2012-03-25 20:46:51',NULL),(1868,220,'giselda rodrigues chaves giglio','','3842-6765',NULL,'2012-03-25 20:48:10',NULL),(1869,248,'marco antonio de abreu','marcoadeabreu@ig.com.br','23672232',NULL,'2012-03-25 20:51:26',NULL),(1870,215,'Neide Baena','','3608-0225',NULL,'2012-03-25 20:53:15',NULL),(1871,276,'Edna Ramos dos Santos','ednaramos2@ig.con.br','36094532',NULL,'2012-03-25 20:54:58',NULL),(1872,276,'Flavio Ferreira dos Santos','flavioferreira1979@bol.com.br','36094532',NULL,'2012-03-25 20:55:59',NULL),(1873,232,'Tayna Lima','tayna.s2@gmail.com','7781-9158',NULL,'2012-03-25 21:09:22',NULL),(1874,232,'Leila cordeiro','lcordeiro@sabesp.com.br','7200-3108',NULL,'2012-03-25 21:10:16',NULL),(1875,232,'Rafael Lopes','lopes116@gmail.com','7778-7845',NULL,'2012-03-25 21:11:12',NULL),(1876,383,'Juliana Melo','aa@gmail.com.br','82844788',NULL,'2012-03-28 12:58:38',NULL),(1877,383,'Yasmin Bazilli','aa@gmail.com','86408218',NULL,'2012-03-28 12:59:08',NULL),(1878,383,'Vanessa Cristina','aa@gmail.com','84366049',NULL,'2012-03-28 12:59:45',NULL),(2119,217,'Carolina Martins Milhoranza','cmilhoranza@hotmail.com',' 3599-7109',NULL,'2012-05-08 14:41:26',NULL),(1880,376,'Rodrigo Assis','tuning206@gmail.com','',NULL,'2012-03-28 15:55:43',NULL),(1881,386,'Fátima','','75190301',NULL,'2012-03-28 17:51:41',NULL),(1882,386,'Cleonice','marcnando@gmail.com','',NULL,'2012-03-28 17:52:12',NULL),(1883,247,'Maritania','','81306168',NULL,'2012-04-01 12:03:33',2),(1884,281,'elisa tiaki ozaki','','37194076',NULL,'2012-04-01 12:03:39',NULL),(1885,225,'Lurdes de Oliveira','','36860639',NULL,'2012-04-01 12:04:30',NULL),(1886,207,'Ana Claudia Souza Ramos Siqueira','anacsramos@hotmail.com','64448756',NULL,'2012-04-01 12:06:01',NULL),(1887,225,'Fernanda Ferreira de Lima','','36860639',NULL,'2012-04-01 12:07:10',NULL),(1888,220,'wander kikuti','','37680136',NULL,'2012-04-01 12:07:18',NULL),(1889,235,'Luciana Honorato','','98352622',NULL,'2012-04-01 12:08:16',NULL),(1890,210,'Andrea Plasa','franplasa2011@hotmail.com','52141893',NULL,'2012-04-01 12:09:29',NULL),(1891,217,'Jaqueline Pelison','suporteform@yahoo.com.br','39443956',NULL,'2012-04-01 12:10:45',1),(1892,373,'Edvaldo Liberato da Silva','edvaldo.liberato@gmail.com','37269056',NULL,'2012-04-01 12:11:32',NULL),(1893,373,'Jane Cunha da Silva','edvaldo.liberato@gmail.com','37269056',NULL,'2012-04-01 12:12:26',NULL),(1894,385,'Andrea Plasa','franplasa2011@hotmail.com','52141893',NULL,'2012-04-01 12:13:06',1),(1895,385,'Gilberto Valeriano Moreira','','84988788',NULL,'2012-04-01 12:13:40',NULL),(1896,220,'ruth soares citranglo','ruthsoarescitranglo@gmail.com','37140923',NULL,'2012-04-01 12:14:27',NULL),(1897,376,'SONIA SCRIPINIC','','37193870',NULL,'2012-04-01 12:16:22',NULL),(1898,376,'ROGERIO SCRIPINIC','','37193870',NULL,'2012-04-01 12:16:51',NULL),(2066,250,'REGINA CELIA M NASCIMENTO','','36375192',NULL,'2012-04-29 20:51:41',NULL),(2067,382,'Erica','','8336-5516',NULL,'2012-04-29 20:52:14',2),(1901,226,'lucimara mqdias','lucimaraq12@hotmail.com','37836683',NULL,'2012-04-01 12:21:49',2),(1902,285,'Miriam Vitoriano da SIlva','m2vitoriano@yahoo.com.br','3782',NULL,'2012-04-01 12:24:45',1),(1903,285,'Antonio Vitoriano','reportagem@vitorianostudios.com.br','94449497',NULL,'2012-04-01 12:25:45',NULL),(1904,359,'IRENE VITOLS','ivitols@hotmail.com','37146689',NULL,'2012-04-01 12:26:32',NULL),(1905,215,'maria de lourdes','','2779-9488',NULL,'2012-04-01 20:36:58',NULL),(1906,231,'Daniela Soares','dani.paris.soares@hotmail.com','76252275',NULL,'2012-04-01 20:39:18',NULL),(1907,202,'isa maria dos reis','repuspestudantes@gmail.com','96064651',NULL,'2012-04-01 20:39:26',NULL),(1908,383,'bruna milany','brudiis_rs@hotmail.com','6835-0931',NULL,'2012-04-01 20:39:57',NULL),(1909,202,'carlos alberto oliva','','96064651',NULL,'2012-04-01 20:40:16',1),(1910,231,'Milton Junior','mmjunior@overcomex.com.br','77726138',NULL,'2012-04-01 20:40:21',NULL),(1947,383,'celso de melo vieira souza','','6187-7133',NULL,'2012-04-10 15:10:52',NULL),(1912,384,'JONAS LEITE SILVA','jonas.leite-silva@itau-unibanco.com.br','4787-6112',NULL,'2012-04-01 20:42:24',NULL),(1913,380,'Cristiane Franciscato Cruz','ccruz@sbb.org.br','989881155',NULL,'2012-04-01 20:42:50',2),(1914,247,'Marisa Cipriano Alves','marisaovelha@hotmail.com','37142444',NULL,'2012-04-01 20:42:52',NULL),(1915,202,'carmem lucia dos reis','billuxd_@hotmail.com','74237293',NULL,'2012-04-01 20:42:56',1),(1916,384,'FLAVIA SARTORI','f_sarttori@hotmail.com','8709-4553',NULL,'2012-04-01 20:43:31',NULL),(1917,256,'amanda cristina bezerra','mandinha.engenheira@gmail.com','8050-3575',NULL,'2012-04-01 20:45:40',NULL),(1918,377,'SIMONE DE LIMA GERMANO','fisioslg@hotmail.com','9969-6366',NULL,'2012-04-01 20:45:45',NULL),(1919,386,'Selma Santos','selmassantos1@hotmail.com','34315199',NULL,'2012-04-01 20:45:53',1),(1920,386,'Carlos Silva','selmassantos1@hotmail.com','34315199',NULL,'2012-04-01 20:46:55',NULL),(1921,247,'LUCIENE BERNARDES DE SANTANA ALMEIDA','lucienebernardes@hotmail.com','99821988',NULL,'2012-04-01 20:48:13',2),(1922,359,'Elaine','','7020-2648',NULL,'2012-04-01 20:48:28',NULL),(1923,247,'JOSE EDUARDO CARNEIRO ALMEIDA','eduardo@autoperfect.com.br','7721-8556',NULL,'2012-04-01 20:49:17',NULL),(1924,220,'Marcia Alves Mota','so_mota@hotmail.com','9253-3922',NULL,'2012-04-01 20:49:31',NULL),(1925,244,'Gilda Cristina Caggiano Giacono','cristina.caggiano70@gmail.com','77741116',NULL,'2012-04-01 20:53:00',NULL),(1926,383,'mara regina ribeiro','mre.ribeiro@hotmail.com','36053371',NULL,'2012-04-01 20:53:05',NULL),(1927,383,'Fernanda Viana Ferreira','fernanda.viana@brasanitas.com.br','8179-5751',NULL,'2012-04-01 20:58:32',NULL),(1928,256,'carla gonzaga rabetti','carlagrabetti@hotmail.com','8227-9343',NULL,'2012-04-01 21:02:21',NULL),(1929,224,'zureide spinoza scalco delmasso','zu-scalco@bol.com.br','3714-0101',NULL,'2012-04-08 12:02:12',NULL),(1930,351,'reginaldo paulo da silva','regispaulo2008@ig.com.br','9611-7596',NULL,'2012-04-08 12:07:35',NULL),(1931,351,'fabiana cristina damaceno vsilva','phabycd@hotmail.com','9964-7751',NULL,'2012-04-08 12:08:21',NULL),(1932,377,'SUZANA SALAZAR','sussimar@hotmail.com','12 - 8143-8843',NULL,'2012-04-08 12:08:48',0),(1933,355,'hugo albuquerque','hpralbuquerque@yahoo.com','29248138',NULL,'2012-04-08 12:08:51',NULL),(1934,370,'aline rodrigues maia reinehr','alinemaiasp@hotmail.com','3684-0258',NULL,'2012-04-08 12:10:02',1),(1935,377,'EDWARD FLOREZ PACHECO','ted.florez@gmail.com','11 - 7031-7666',NULL,'2012-04-08 12:10:08',0),(1936,355,'leticia albuquerque','letegusmao@hotmail.com','29248138',NULL,'2012-04-08 12:10:16',1),(1937,370,'leandro reinehr','alinemaiasp@hotmail.com','3684-0258',NULL,'2012-04-08 12:10:56',NULL),(1953,274,'Aida Rufino de Oliveira','aidarufino@terra.com.br','94737798',NULL,'2012-04-15 11:58:52',1),(1939,210,'luiza vieira','','3733-7183',NULL,'2012-04-08 12:17:45',NULL),(1952,245,'Arlete','aa@gmail.com','1111-1111',NULL,'2012-04-15 11:57:50',NULL),(1941,244,'creusa cavalcante santos','creuka@hotmail.com','37811327',NULL,'2012-04-08 12:24:23',NULL),(1942,244,'meuchar cavalcante da silva','','37811327',NULL,'2012-04-08 12:25:16',NULL),(2148,389,'Andrea Carla de Moraes Calheiros','andreacarla-lins@uol.com.br',' (11) 84047532',NULL,'2012-06-19 16:25:37',NULL),(1944,385,'Raquel Buoery','','83673903',NULL,'2012-04-08 20:34:37',NULL),(1945,385,'Isabelle Jesus','','83674605',NULL,'2012-04-08 20:35:16',NULL),(1946,285,'Ligianne Monteiro','ligianne@hotmail.com','3766-8795',NULL,'2012-04-10 15:07:19',NULL),(1950,386,'Luciana Mota Sylvestrin','lsylvestrin@adp.com.br','8652-7604',NULL,'2012-04-10 15:18:35',1),(1949,251,'ana carolina belmonte','cabelmon@yahoo.com.br','4702-6800',NULL,'2012-04-10 15:15:24',1),(2062,238,'ronaldo B. Costa','','9732-9537',NULL,'2012-04-29 19:48:49',NULL),(1955,256,'Adriana de Souza Gama','adriana_sushi@hotmail.com','6864-0391',NULL,'2012-04-15 12:01:49',NULL),(1956,382,'ALBERTO ZOBOLI','a.zoboli@hotmail.com','82262709',NULL,'2012-04-15 12:02:43',1),(1957,382,'ALINNE G K  ZOBOLI','alinne.zoboli@hotmail.com','81662222',NULL,'2012-04-15 12:03:37',NULL),(1958,359,'elaine cristina chaves lima','','3682-4179',NULL,'2012-04-15 12:05:51',2),(1959,359,'welbison lopes lima','','3682-4179',NULL,'2012-04-15 12:07:01',NULL),(1960,281,'Maria Helena de Lima','limamh@hotmail.com','8502-0558',NULL,'2012-04-15 12:07:41',1),(1961,234,'Alessandra L. dos Santps','m_stos@ig.com.br','2507-3733',NULL,'2012-04-15 12:09:16',NULL),(1962,234,'Mario dos Santos','m_santos@ig,com.br','2507-3733',NULL,'2012-04-15 12:10:05',NULL),(1963,215,'vera lucia nogueira medeiros','luciaveranm@bol.com.br','7150-5555',NULL,'2012-04-15 12:13:17',NULL),(1964,381,'Fernanda Garcia Pires','ffeffs@gmail.com','7466-5459',NULL,'2012-04-15 12:13:51',NULL),(1965,285,'MARCIA DE SOUZA T. LIMA','marciaso@cte.com.br','91371344',NULL,'2012-04-15 12:18:15',2),(1966,377,'Gabriela Moraes','ghbmoraes@gmail.com','66063932',NULL,'2012-04-15 12:20:34',NULL),(1967,377,'Daniel Moraes','daniel.net.moraes@hotmail.com','660 63932',NULL,'2012-04-15 12:21:39',NULL),(1968,351,'silvia claudia da fonseca','klaufonseca@uol.com.br','3621-6141',NULL,'2012-04-15 12:24:03',NULL),(1969,231,'FERNANDO MOREIRA','fe_moreira@terra.com.br','8400-1345',NULL,'2012-04-15 12:24:36',2),(1970,231,'SILVIA OLAH MOREIRA','silvia.olah@terra.com.br','7038-5110',NULL,'2012-04-15 12:25:27',NULL),(1971,264,'José Roberto Goudinho','joseroberto5goudinho@hotmail.com','72878363',NULL,'2012-04-15 12:28:05',NULL),(1972,277,'José Roberto Goudinho','joseroberto5goudinho@hotmail.com','72878363',NULL,'2012-04-15 12:29:05',NULL),(1973,271,'Eliezer Miranda S Silva','eliezer28081982@hotmail.com','6435-6925',NULL,'2012-04-15 12:33:12',NULL),(1974,242,'Eveline','','6642-4430',NULL,'2012-04-15 18:10:31',1),(1978,216,'Dina P dos Santos','','4306-8232',NULL,'2012-04-15 18:50:37',NULL),(1979,216,'Gildetete teixeira','','3656-5631',NULL,'2012-04-15 18:51:23',NULL),(1980,216,'Maria Aparecida B. Gonçalves','8187-1736@gmail.com','3685-0850',NULL,'2012-04-15 18:52:54',NULL),(1981,278,'Filipe Cunha','','12345678',NULL,'2012-04-15 19:02:16',NULL),(1982,278,'Gleice','','12345678',NULL,'2012-04-15 19:02:45',NULL),(1986,354,'Lilian Vanessa O. Duarte','lilianvduarte@ig.com.br','3685-3674',NULL,'2012-04-15 20:21:29',NULL),(1984,354,'Igor Ibraim','','3685-3674',NULL,'2012-04-15 20:17:23',NULL),(1985,354,'Roberto Carlos Ibraim','','3685-3674',NULL,'2012-04-15 20:18:22',NULL),(1987,373,'Irma Santos Cunha','irmasantoscunha@hotmail.com','46162173',NULL,'2012-04-15 21:16:57',NULL),(1988,381,'Giovana Ribeiro dos Santos','g_rsantos@yahoo.com.br','8345-8587',NULL,'2012-04-15 21:17:46',NULL),(1989,381,'ANA LUCIA LUIZ DE SOUZA','ana_luizsouza@yahoo.com.br','3485-4818',NULL,'2012-04-15 21:31:41',0),(1990,381,'Charline Souza','charlineverklart@hotmail.com','8820-6680',NULL,'2012-04-15 21:32:18',NULL),(1991,381,'ARTUR FERREIRA DE SOUZA','arthur22_buri@yahoo.com.br','7985-2860',NULL,'2012-04-15 21:32:47',NULL),(1992,381,'Helder Yamamoto','','79998007',NULL,'2012-04-15 21:33:23',NULL),(1993,359,'Renato Rocha','rocha.rm@gmail.com','8189-0222',NULL,'2012-04-18 17:10:30',2),(1994,359,'Aldilene Campelo Rocha','aldi.rocha@gmail.com','8577-8150',NULL,'2012-04-18 17:10:57',NULL),(1995,277,'Gilmara Souza Reis Caccaro','gilbaccaro.@ibst.com.br','83474516',NULL,'2012-04-22 10:34:59',1),(1996,277,'Milva da Silva Carvalho','carvalho.milva@gmail.com','36053220',NULL,'2012-04-22 10:35:34',NULL),(1997,238,'Noemi Vasconcellos dos Santos','noemisan@iq.usp.br','9637-3647',NULL,'2012-04-22 11:58:01',NULL),(1998,381,'Dina','','84584864',NULL,'2012-04-22 12:11:23',NULL),(1999,381,'Ester','','8644-3003',NULL,'2012-04-22 12:11:56',NULL),(2000,355,'Elaine Luithardt de Medeiros','','2894-7275',NULL,'2012-04-22 12:13:46',2),(2001,246,'MARIA JOSÉ DA SILVA LUGLI','','86101805',NULL,'2012-04-22 12:14:52',NULL),(2002,387,'Tania G Monteiro','','9230-7710',NULL,'2012-04-22 12:20:07',1),(2003,257,'Solange Cardoso Martins','','37614045',NULL,'2012-04-22 12:21:57',NULL),(2004,257,'Maurina da Silva Carvalho','','38815213',NULL,'2012-04-22 12:22:29',NULL),(2005,230,'Elisangela Oliveira','elifejo.2012@terra.com.br','3608-7787',NULL,'2012-04-22 12:22:54',1),(2006,257,'Sebastiao Araujo de Carvalho','','38815213',NULL,'2012-04-22 12:22:57',NULL),(2007,230,'Fernades Oliveira','fernandes.da@terra.com.br','3608-7787',NULL,'2012-04-22 12:24:00',NULL),(2008,377,'Otaviano Santana','','37682919',NULL,'2012-04-22 12:27:56',NULL),(2009,377,'Leondina Cosmo de Santada','','37682919',NULL,'2012-04-22 12:28:40',NULL),(2010,377,'Rosana C Santana','','37682919',NULL,'2012-04-22 12:29:15',NULL),(2011,202,'Loren Milena','lorenmilena.reis@gmail.com','8472-3081',NULL,'2012-04-22 18:39:32',NULL),(2012,220,'Nelson Crepaldi','','6617-9494',NULL,'2012-04-22 18:57:33',NULL),(2013,250,'Miriam Dias Santos Silva','','4701-0158',NULL,'2012-04-22 20:36:16',NULL),(2014,250,'Giovanne Pereira da Silva','giovanne_silva@uol.com.br','4701-0158',NULL,'2012-04-22 20:38:25',NULL),(2015,240,'MICHELE ALVES','miamil24@hotmail.com','8626-6549',NULL,'2012-04-22 20:43:29',0),(2016,264,'Rodrigo da Silva','rodrigo.melchior@hotmail.com','8012-5786',NULL,'2012-04-22 20:44:00',NULL),(2017,240,'ANDERSON FABIO ALVES','fabio.anderson@hotmail.it','8626-7524',NULL,'2012-04-22 20:44:29',0),(2018,264,'Carolina Batista Maldonado Rodrigues','carollina_maldonado@hotmail.com','6097-2891',NULL,'2012-04-22 20:45:19',NULL),(2019,377,'MILENA TEIXEIRA DA CUNHA SANGI','cunha_milena@yahoo.com.br','9249-9098',NULL,'2012-04-22 20:49:43',0),(2020,377,'RICARDO DIAS SANGI','cunha_milena@yahoo.com.br','7839-5987',NULL,'2012-04-22 20:50:41',0),(2021,202,'Maria Vanilde Pereira Medrado','','36092966',NULL,'2012-04-22 20:54:53',NULL),(2022,230,'Mariele Galvao de Oliveira','mariele_rod@yahoo.com.br','3695-1165',NULL,'2012-04-22 20:57:54',NULL),(2023,230,'Rodrigo Pereira de Oliveira','','8364-2230',NULL,'2012-04-22 20:58:46',NULL),(2024,247,'CLAUDIA KNUPP FERNANDES','claudiakfernandes@gmail.com','7977-0392',NULL,'2012-04-22 21:01:36',2),(2025,247,'DANIEL MENDES FERNANDES','daniel@myofficehome.com.br','7402-9947',NULL,'2012-04-22 21:03:07',0),(2027,370,'ELBSON','','7768 0657',NULL,'2012-04-29 11:09:56',NULL),(2028,387,'Kelli dos Santos Oliveira','','25327052',NULL,'2012-04-29 12:07:52',1),(2029,204,'alessandra regina de souza','alessandra.souza2504@yahoo.com.br','3416-7652',NULL,'2012-04-29 12:07:55',NULL),(2030,387,'Thiago Ferreira Borges','','91156543',NULL,'2012-04-29 12:08:30',NULL),(2031,224,'Greice Oliveira','gre.ferreira@hotmail.com','37651019',NULL,'2012-04-29 12:11:09',NULL),(2032,276,'dayana timoteo pinto','daydeusefiel@hotmail.com','8015-0156',NULL,'2012-04-29 12:13:48',NULL),(2033,209,'Alessandra Cristina da Silva','aleshalon@hotmail.com','74624971',NULL,'2012-04-29 12:15:02',NULL),(2034,225,'Eliana de Araujo Furtado','','3448-5039',NULL,'2012-04-29 12:15:06',NULL),(2035,238,'Ana Daneida Villanueva Llapa','anavilla777@gmail.com','8817-9506',NULL,'2012-04-29 12:15:26',1),(2120,217,'Flavio Martins Milhoranza','','8233-1960',NULL,'2012-05-08 14:42:23',NULL),(2037,224,'Vanilza Nogueira de Santana','nvanilza@yahoo.com.br','74694015',NULL,'2012-04-29 12:15:57',NULL),(2038,238,'Jose Manuel Cardenas Medina','ppcardenas777@gmail.com','94466234',NULL,'2012-04-29 12:16:57',NULL),(2121,350,'Elaine Oliveira Francisco','elainefranciscorh@gmail.com','4243-4402',NULL,'2012-05-08 14:53:26',2),(2040,234,'Karen Brito','karenbrito2@hotmail.com','8134-3331',NULL,'2012-04-29 12:18:42',NULL),(2041,250,'Jonas Oliveira da Silva','jonassilva@usp.com.br','8509-8385',NULL,'2012-04-29 12:18:57',NULL),(2042,380,'Agostinha Capistrano Rocha','','36014914',NULL,'2012-04-29 12:19:26',NULL),(2043,250,'Luciene Conceição de Oliveira','lucieneadm01@hotmail.com','8148-7442',NULL,'2012-04-29 12:19:55',NULL),(2044,234,'Fernando Coelho','fecomi@terra.com.br','8193-0759',NULL,'2012-04-29 12:19:55',NULL),(2045,380,'José Ribamar Souza Rocha','','36014914',NULL,'2012-04-29 12:19:59',NULL),(2046,229,'roberto teixeira de melo','meloroberto@ig.com.br','7999-7600',NULL,'2012-04-29 12:21:26',NULL),(2047,229,'karina adelia franca de melo','adeliakarina1@hotmail.com','8913-1949',NULL,'2012-04-29 12:22:25',NULL),(2048,385,'Rubens Macedo Bueno','ludvc@ig.com.br','68301312',NULL,'2012-04-29 12:24:16',1),(2049,385,'judith felizberto artacho','','9456-4315',NULL,'2012-04-29 12:24:34',NULL),(2118,379,'Sophia Gebauer de Jesus','','85785030',NULL,'2012-05-06 10:58:00',NULL),(2051,385,'Ludimila Volc Bueno','ludvc@ig.com.br','36833063',NULL,'2012-04-29 12:25:07',NULL),(2117,379,'Katherine M. G. P. dos Santos','','25927989',NULL,'2012-05-06 10:57:16',NULL),(2053,355,'Joci Carla','jogallafrio@gmail.com','82656396',NULL,'2012-04-29 12:27:57',NULL),(2054,246,'Elaine Cristina','criselaine.castro@hotmail.com','88853545',NULL,'2012-04-29 12:29:58',NULL),(2055,212,'Luciana Bartolomeu Iadocicco','luiadocicco@gmail.com','8578-3845',NULL,'2012-04-29 12:31:50',NULL),(2056,230,'Romilda Miltus','romildamguerreiro@gmail.com','3699-0394',NULL,'2012-04-29 12:36:19',NULL),(2057,230,'Victor Luis Castanho Guerreiro','vickwolf@gmail.com','3699-0394',NULL,'2012-04-29 12:37:29',1),(2058,352,'Luciano','','3607-2825',NULL,'2012-04-29 12:40:57',NULL),(2059,352,'Elisete','','36072825',NULL,'2012-04-29 12:41:24',NULL),(2060,212,'Martiniano','martinianofolha@terra.com.br','3721-3602',NULL,'2012-04-29 12:41:44',NULL),(2061,212,'Gersonita','','3721-3602',NULL,'2012-04-29 12:42:46',NULL),(2068,217,'thamirys de oliveira gomes','tha.thamirys@gmail.com','8653-9471',NULL,'2012-04-29 20:53:29',NULL),(2069,385,'Helena Yarmalavicius','aa@gmail.com','37269274',NULL,'2012-04-29 20:53:29',1),(2070,382,'Rodrigo','','8336-5516',NULL,'2012-04-29 20:53:32',NULL),(2071,234,'Alexsander Ramos Duarte','alexsanderrd@gmail.com','6365-8732',NULL,'2012-04-29 20:53:57',0),(2072,256,'Paula Adriana Pires','paulaadrianapires@hotmail.com','82730378',NULL,'2012-04-29 20:53:59',NULL),(2073,217,'joyce canejo coutinho','joycec4u@yahoo.com.br','8408-9236',NULL,'2012-04-29 20:54:33',NULL),(2074,217,'michele bueno oliveira','bueno_michele@yahoo.com.br','9964-3686',NULL,'2012-04-29 20:55:28',NULL),(2075,219,'Vanessa Aguiar','vanessa.castilho@cs.edu.br','70474169',NULL,'2012-04-29 20:55:37',1),(2076,219,'Rafael Aguiar','rafael@sogelinvestimentos.com','57662601',NULL,'2012-04-29 20:56:22',NULL),(2077,382,'Eliane Aparecida Veiga','elianeveiga@globomail.com','3783-2240',NULL,'2012-04-29 20:56:30',2),(2078,382,'Fabio Josino da Silva','fabiojosino@globomail.com','3782-2240',NULL,'2012-04-29 20:57:20',0),(2079,386,'Vera Nilce Boltini Dias','vera.botini@yahoo.com.br','3605-3623',NULL,'2012-04-29 20:58:44',NULL),(2080,277,'Flavio dos Santos Malaquias','malaquias.flavio@gmail.com','70307531',NULL,'2012-04-29 20:59:06',1),(2081,255,'PAULA INARA DE SOUZA MAYWORE','','96697752',NULL,'2012-04-29 20:59:19',NULL),(2082,386,'Vanderley Dias','vera.boltini@yahoo.com.br','3605-3623',NULL,'2012-04-29 20:59:35',NULL),(2083,247,'Maria das Gracas P.Benedetti','','3719-1150',NULL,'2012-04-29 20:59:51',NULL),(2084,247,'Maria das Gracas P.Benedetti','','3719-1150',NULL,'2012-04-29 20:59:51',NULL),(2085,255,'NICOLE LAZARO','','87394937',NULL,'2012-04-29 20:59:52',NULL),(2086,255,'SERGIO TEIXEIRA','','78540161',NULL,'2012-04-29 21:00:27',NULL),(2087,247,'Gentil Antonio Benedetti','','37191150',NULL,'2012-04-29 21:00:51',NULL),(2088,359,'FLAVIA SERAFINA L SILVA','','43065397',NULL,'2012-04-29 21:01:36',NULL),(2089,359,'AILSOM BASILIO DA SILVA','','43065397',NULL,'2012-04-29 21:02:17',NULL),(2090,258,'Ana Maria Guirado Rodrigues','hipercold@hotmail.com','3609-3543',NULL,'2012-04-29 21:03:54',NULL),(2091,277,'REGIANE ALVES DA SILVA MALAQUIAS','remalaquias@hotmail.com','52180920',NULL,'2012-04-29 21:04:14',NULL),(2092,258,'Lazaro Rodrigues','hipercold@hotmail.com','3609-3543',NULL,'2012-04-29 21:04:42',NULL),(2093,386,'Lina Domingos Lopes','stefanyteti@hotmail.com','36836147',NULL,'2012-04-29 21:05:45',NULL),(2094,376,'Eunice Vieira Sampaio de Souza','','34482526',NULL,'2012-04-29 21:06:31',NULL),(2095,386,'Stefany Falcao Macedo','stefanyteti@hotmail.com','76244222',NULL,'2012-04-29 21:06:55',NULL),(2096,256,'Ingrid F Gloria','ingrid.cavy@hotmail.com','8636-0471',NULL,'2012-04-29 21:09:16',NULL),(2097,256,'Marcelo C. Gloria','marcelocgloria@gmail.com','7813-0575',NULL,'2012-04-29 21:10:59',NULL),(2098,229,'janete alves gomes','janeteag@gmail.com','9575-9855',NULL,'2012-04-29 21:11:01',NULL),(2099,219,'Alexandre Ramos','ramos_web@hotmail.com','9792-8013',NULL,'2012-04-29 21:19:28',NULL),(2100,219,'Gisele Ramos','gisele_web@hotmail.com','9697-6416',NULL,'2012-04-29 21:20:12',NULL),(2101,387,'Sheila Regiane da Silva','','3655-2509',NULL,'2012-05-02 10:39:34',NULL),(2102,387,'Mauricio Rodrigues Olímpio','','3655-2509',NULL,'2012-05-02 10:40:02',2),(2103,387,'Mariana M. Carvalho','','3605-1038',NULL,'2012-05-02 10:40:43',NULL),(2104,387,'Edgar Dias Carvalho','','3605-1038',NULL,'2012-05-02 10:41:08',1),(2105,387,'Vanda Bueno','','3714-7891',NULL,'2012-05-02 10:48:53',NULL),(2106,387,'Artur Bueno','','3714-7891',NULL,'2012-05-02 10:52:51',NULL),(2107,207,'Soraya Gomes','','3731-5449',NULL,'2012-05-02 11:32:47',NULL),(2108,207,'Tamara Regina Calvo','','3731-5449',NULL,'2012-05-02 11:33:13',NULL),(2109,207,'Marcelo Miranda e Souza','','3731-5449',NULL,'2012-05-02 11:33:56',NULL),(2110,387,'Daniela Maciel Evangelista','','9336-2279',NULL,'2012-05-02 11:40:39',NULL),(2111,387,'Jose Ap. Evangelista','','9336-3101',NULL,'2012-05-02 11:41:10',3),(2112,271,'Fernanda','','3721-2527',NULL,'2012-05-02 11:59:03',NULL),(2113,271,'Gabriele','','3721-2527',NULL,'2012-05-02 11:59:24',NULL),(2114,271,'Armando','','3721-2527',NULL,'2012-05-02 12:00:01',NULL),(2116,386,'Rosalina Souza','','3609-7652',NULL,'2012-05-02 14:41:20',NULL),(2122,350,'Thiago Plaça','','6703-7906',NULL,'2012-05-08 14:54:06',NULL),(2137,388,'Graziela Leite do Nascimento','personalgraziela@hotmail.com','77494432',NULL,'2012-05-16 10:22:06',0),(2136,388,'Cristiano Leite do Nascimento','crileitenascimento@gmail.com','82064861',NULL,'2012-05-16 10:21:39',0),(2125,353,'Lislei de Azevedo','lislei.azevedo@syngenta.com','9620-7719',NULL,'2012-05-08 15:32:39',NULL),(2126,274,'Rodrigo Alves Theodoro','rodrigo.alves@bel-ar.com.br','3733-3240',NULL,'2012-05-08 15:57:27',1),(2127,274,'Ledinéia Bassi Theodoro','','7706-3005',NULL,'2012-05-08 15:57:57',NULL),(2128,266,'Taiz Asakura','asakura.house@terra.com.br','3735-3125',NULL,'2012-05-08 16:07:26',1),(2129,266,'Agnaldo Asakura','','9114-0094',NULL,'2012-05-08 16:07:46',NULL),(2130,219,'Glicia','glicia.burgos@gmail.com','3686-9236',NULL,'2012-05-08 16:10:19',NULL),(2131,219,'Fernando Jorge','fer.jorge@gmail.com','8386-9580',NULL,'2012-05-08 16:11:08',NULL),(2132,201,'Rosangela','','3591-1033',NULL,'2012-05-08 16:21:44',NULL),(2133,258,'Elaine Cristina Damaceno','elainecdam@hotmail.com','3695-3221',NULL,'2012-05-09 09:43:36',NULL),(2134,258,'Fabiana C. Damaceno','','3695-3221',NULL,'2012-05-09 09:44:07',NULL),(2138,388,'Geny Paiva Leite','','37510598',NULL,'2012-05-16 10:22:23',0),(2139,388,'Maria Cristina Valenzuela','tinavalenz@yahoo.com.br','92880170',NULL,'2012-05-16 10:23:04',0),(2140,388,'Jean de Bethencourt','','76937227',NULL,'2012-05-16 10:23:31',0),(2141,388,'Maria Fátima','','29224272',NULL,'2012-05-16 10:23:49',0),(2142,230,'Elaine Damaceno','','95611365',NULL,'2012-05-22 16:02:55',NULL),(2143,230,'Fabiana Damaceno','','95611365',NULL,'2012-05-22 16:03:49',NULL),(2144,274,'Claudia Knupp Fernandes','claudiakfernandes@gmail.com','7977-0392',NULL,'2012-05-29 15:19:16',2),(2145,274,'Daniel','','7977-0392',NULL,'2012-05-29 15:22:33',NULL),(2146,244,'Luciana F. Cunha','lucianaf_cunha@hotmail.com','9720-1474',NULL,'2012-06-12 14:09:25',NULL),(2147,244,'Carlos Gustavo','','3569-4601',NULL,'2012-06-12 14:09:59',NULL),(2149,389,'Paulo Marcelo Strobl','paulostrobl@gmail.com','66628421',NULL,'2012-06-27 11:46:54',NULL),(2150,389,'Fábio do Carmo Ferreira','fcf10@ig.com.br','+551183564636',NULL,'2012-06-27 11:47:44',NULL),(2151,389,'Greice Kelly Oliveira Ferreira','gre.ferreira@hotmail.com','+551183564636',NULL,'2012-06-27 11:48:36',NULL),(2152,389,'Alberto Zoboli','a.zoboli@hotmail.com','+551183564636',NULL,'2012-06-27 11:49:34',NULL),(2153,389,'Alinne Gisely Katsuragawa Zoboli','alinne.zoboli@hotmail.com','+551182262709',NULL,'2012-06-27 11:50:30',NULL),(2155,389,'Paulo Rogério Quintiliano','rogerquintiliano@gmail.com','',NULL,'2012-06-27 11:53:14',NULL),(2156,389,'Denise Quintiliano','denise.quintiliano@gmail.com','',NULL,'2012-06-27 11:53:47',NULL);
/*!40000 ALTER TABLE 'tparticipante' ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'trole'
--

DROP TABLE IF EXISTS 'trole';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE 'trole' (
  'CODIGO' char(15) NOT NULL,
  'DESCRICAO' char(15) NOT NULL,
  PRIMARY KEY ('CODIGO')
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table 'trole'
--

LOCK TABLES 'trole' WRITE;
/*!40000 ALTER TABLE 'trole' DISABLE KEYS */;
INSERT INTO 'trole' VALUES ('ADMIN','Administrador'),('STAND','Estande'),('HOSPEDEIRO','Hospedeiro'),('FACILITADOR','Facilitador');
/*!40000 ALTER TABLE 'trole' ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'ttipogrupo'
--

DROP TABLE IF EXISTS 'ttipogrupo';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE 'ttipogrupo' (
  'ID' int(2) NOT NULL,
  'NOME' char(20) NOT NULL,
  UNIQUE KEY 'ID' ('ID')
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table 'ttipogrupo'
--

LOCK TABLES 'ttipogrupo' WRITE;
/*!40000 ALTER TABLE 'ttipogrupo' DISABLE KEYS */;
INSERT INTO 'ttipogrupo' VALUES (1,'Adolescentes'),(2,'Casais sem filhos'),(3,'Casais com filhos'),(4,'Misto com crianças'),(5,'Misto sem crianças'),(6,'Jovens'),(7,'Mulheres'),(8,'Familiares'),(9,'Profissional'),(10,'Sozinhos'),(11,'Homens'),(12,'Surdos'),(13,'Escola'),(14,'Escoteiros'),(99,'Outro'),(98,'INDEFINIDO'),(15,'Misto');
/*!40000 ALTER TABLE 'ttipogrupo' ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'ttipogrupo_facilhosp'
--

DROP TABLE IF EXISTS 'ttipogrupo_facilhosp';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE 'ttipogrupo_facilhosp' (
  'IDTIPOGRUPO' int(2) NOT NULL,
  'IDFACILHOSP' int(10) NOT NULL,
  KEY 'TIPOGRUPO_FK' ('IDTIPOGRUPO'),
  KEY 'FACILHOSP1_FK' ('IDFACILHOSP')
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table 'ttipogrupo_facilhosp'
--

LOCK TABLES 'ttipogrupo_facilhosp' WRITE;
/*!40000 ALTER TABLE 'ttipogrupo_facilhosp' DISABLE KEYS */;
INSERT INTO 'ttipogrupo_facilhosp' VALUES (3,522),(3,523),(5,524),(4,525),(4,526),(4,527),(5,528),(5,529),(4,530),(4,531),(4,532),(4,533),(4,534),(4,535),(5,536),(5,537),(4,538),(4,539),(4,540),(4,541),(4,542),(4,543),(4,544),(5,545),(5,546),(5,547),(5,548),(5,549),(4,550),(5,551),(4,552),(5,553),(5,554),(6,555),(99,556),(5,557),(5,558),(4,559),(4,560),(4,561),(4,562),(4,563),(5,564),(4,565),(4,566),(5,567),(5,568),(5,569),(5,570),(5,571),(5,572),(4,573),(4,574),(5,575),(5,576),(4,577),(4,578),(2,579),(99,579),(4,580),(6,581),(6,582),(5,583),(4,584),(4,585),(4,586),(4,587),(4,588),(5,589),(5,590),(3,591),(3,592);
/*!40000 ALTER TABLE 'ttipogrupo_facilhosp' ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'tusuario'
--

DROP TABLE IF EXISTS 'tusuario';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE 'tusuario' (
  'LOGIN' char(15) NOT NULL,
  'NOME' char(50) DEFAULT NULL,
  'SENHA' char(15) NOT NULL,
  'IDFACILHOSP' int(10) DEFAULT NULL,
  PRIMARY KEY ('LOGIN'),
  KEY 'FACILHOSP4_FK' ('IDFACILHOSP')
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table 'tusuario'
--

LOCK TABLES 'tusuario' WRITE;
/*!40000 ALTER TABLE 'tusuario' DISABLE KEYS */;
INSERT INTO 'tusuario' VALUES ('allan.jones','Allan Jones','senha30dias',NULL),('admin','Administrador','ibmadminsp',NULL),('voluntario','Voluntário','voluntarioibm',NULL),('toaline','Tó e Aline','5634',522),('jussara588','Jussara Camara Pessoa','jpessoa588',588),('marcnando','FERNANDO & FÁTIMA','3306',587),('angelo.marques','ANGELO MARQUES','1952',583),('lucborgess','LUCAS E THALITA','8250',579),('tcronconi1','EDUARDO GOMES RONCONI E TEREZA','7668',578),('cidacarneiros','CIDA CARNEIRO','6947',564),('daopapp','RODRIGO PAPP CADIMA','6315',555),('alberto','ALBERTO YAEGASHI','3074',532),('mauricioeliza','JOSÉ MAURICIO DA SILVA','7662',527),('wspservice','WESLEI DOS SANTOS PONTES','7934',525),('gabrielribeiro','GABRIEL A. RIBEIRO DE OLIVEIRA','1005',524),('zelandia.ishid','Zelandia Prates de A. Ishida','zelandiaishid46',46),('patricia.herre','WILSON VERSOLATO','9752',45),('wsalvarinho','WILSON E MARIA JOSÉ DA S. ALVARINHO','6631',44),('val','VALERIE GILL DE ABREU','5149',43),('sb.mendonca','SEBASTIÃO BENEDITO MENDONÇA','2116',42),('racsamoraes','SAMIR PEREIRA DE MORAES','2082',41),('linslessa','SAMARONE LINS LESSA','2562',40),('rodrigolavoura','RODRIGO TOSTES LAVOURA','8334',39),('rmendoncas','RICARDO DE MENDONÇA DA SILVA','8710',38),('natoprazeres','RENATO PRAZERES PEREIRA DOS SANTOS','7360',37),('propart','ORLANDO MINIGUINI','5361',36),('nanci-avila','NANCI FANTI PATA AVILA','6184',34),('mgracas.araujo','MARIA DAS GRAÇAS SILVA ARAUJO','1197',32),('ferreira.marco','MARCOS MAURÍCIO FERRO FERREIRA','6001',31),('marcio.lara','MARCIO ALVES DE LARA','1177',30),('marques087','MARCELO MARQUES','2584',29),('barros.tatiane','MARCELO E TATIANE ORSONI','6349',28),('luisoliveira','LUIS CARLOS DE OLIVEIRA E VALQUIRIA','1250',27),('pe.dalando.cic','LUCIANO MELLO','6781',26),('lindalva-abreu','LINDALVA DE ABREU','7873',25),('kaiopezzutti','KAIO JULIO CESAR PEZZUTTI','9014',24),('jose.marcio','JOSÉ MÁRCIO GONÇALVES E CINARA','2260',23),('pr.jfurtado','JORGE PACHECO FURTADO','2494',22),('jein11','JENNY ABANTO ALVAREZ','8473',21),('valfios','JANIR FERREIRA DOS SANTOS','4510',20),('bel.medeiros','ISABEL CRISTINA MEDEIROS DA SILVA','2555',19),('ginaatanasovgo','GINA ATANASOV DE GODOY','8071',17),('gilberto.junio','GILBERTO D. RIBEIRO JR','7020',16),('geraldoluizd','GERALDO LUIZ DA SILVA','8182',15),('felipeandrades','FELIPE ANDRADE SANTOS','1878',14),('elzira.kiss','ESTEFAN E ELZIRA KISS','5977',13),('ca.bruschi','ELMARY SANTOS BRUSCHI','5128',12),('elmanoa','ELMANO ANTONIO DE OLIVEIRA SANTOS','1295',11),('e9669p','ELIANA DIAS DE OLIVEIRA','5251',9),('elainecdam','ELAINE CRISTINA DAMACENO','2764',8),('drnaletto','DILCE RODRIGUES NALETTO','1835',7),('deciogarcia','DECIO MAZAGÃO GARCIA','2642',6),('claudiarosa200','CLÁUDIA MARIA ROSA','3186',5),('alst.serafim','ANDRÉ LUIS SERAFIM','4686',4),('alexandregaffo','ALEXANDRE GAFFO','8944',2),('reginaldo_chag','ADRIANA E REGINALDO CHAGAS','4808',1),('liviahannes','LIVIA MARTINS HANNES','1836',581),('erika.fb','ERIKA FRISON B LEITE','3708',575),('dricavital','GENIVALDO JOSÉ OLIVEIRA','7258',573),('marize.paiva','MARIZE PAIVA','7346',572),('ravs','RONALDO SOUZA','2412',568),('robertomel.cob','ROBERTO MELLO','1670',566),('luizmeneguini','LUIZ MENEGUINI','7170',559),('riva bereta','RIVA PEREIRA DIAS','4098',552),('sydsan','SYDNEI SANTOS','2102',547),('rfsantos.eng','REGINALDO FRANCISCO DOS SANTOS','4997',539),('marcelo.pinhei','MARCELO EDUARDO PINHEIRO GOMES','7299',530),('oswaldo','OSWALDO JUNIOR','9177',528),('josemelca','JOSE CARLOS MELGAREJO','9754',105),('cristiano.gold','CRISTIANO LIMOLI','6617',99),('wlmmm','WILLIAN LOPES DE MACEDO','3539',98),('capimi195','ANEILDE SOARES LIMA ALVES','4256',95),('bperuchi13','BRUNA PERUCHI','3713',91),('helena.biondo','HELENA MARIA DOS SANTOS BIONDO','5061',90),('pr_paulorobert','PAULO ROBERTO CAMARGO DA SILVA','5090',87),('daiane.lanconi','DAIANE LANÇONI E OLIMPIO','4911',84),('helio.ishida','HELIO YASSUHISSA ISHIDA','1190',82),('jedu.batista','JOSÉ EDUARDO CORRÊA BATISTA','8209',73),('elias.sena','ELIAS SENA YARMALAVICIUS','7549',71),('ozeaseva','OZÉAS CORREIA DOS SANTOS','1867',70),('jeba_revolucao','JÉBA E CLAU','5654',66),('andrermoura','ANDRÉ ROJAS DE MOURA GUILHERME','7073',61),('rmaroli','RICARDO MARTINS DE OLIVEIRA','7808',58),('correia','HOZANIAS CORREIA SANTOS','5995',55),('alexandre_vb30','ALEXANDRE OGEDA RAMALHO','4403',53),('pcgandara','PAULO LUIS E CLAUDIA CRISTIANE','7387',51),('alex591',' Alex Clayton Lins','alexclins591',591),('flavia592',' Flavia Torres Baptista Strobl','torresstrobl592',592);
/*!40000 ALTER TABLE 'tusuario' ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'tusuariorole'
--

DROP TABLE IF EXISTS 'tusuariorole';
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE 'tusuariorole' (
  'LOGINUSUARIO' char(15) NOT NULL,
  'CODIGOROLE' char(15) DEFAULT NULL,
  KEY 'USUARIO_FK' ('LOGINUSUARIO'),
  KEY 'ROLE_FK' ('CODIGOROLE')
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table 'tusuariorole'
--

LOCK TABLES 'tusuariorole' WRITE;
/*!40000 ALTER TABLE 'tusuariorole' DISABLE KEYS */;
INSERT INTO 'tusuariorole' VALUES ('allan.jones','ADMIN'),('admin','ADMIN'),('voluntario','STAND');
/*!40000 ALTER TABLE 'tusuariorole' ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view 'vw_facil'
--

DROP TABLE IF EXISTS 'vw_facil';
/*!50001 DROP VIEW IF EXISTS 'vw_facil'*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW 'vw_facil' AS SELECT 
 1 AS 'ID',
 1 AS 'NOME',
 1 AS 'NUMFUNCAO',
 1 AS 'GRUPOOUTRO',
 1 AS 'ENDERECO',
 1 AS 'COMPLEMENTO',
 1 AS 'BAIRRO',
 1 AS 'CIDADE',
 1 AS 'CEP',
 1 AS 'TELEFONERES',
 1 AS 'TELEFONECOM',
 1 AS 'TELEFONECEL',
 1 AS 'EMAIL',
 1 AS 'MEMBRO',
 1 AS 'QTDEADULTOS',
 1 AS 'QTDECRIANCAS',
 1 AS 'OBS',
 1 AS 'STATUSREGISTRO',
 1 AS 'DATACADASTRO',
 1 AS 'ORIGEMINFO'*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view 'vw_grupo_qtde'
--

DROP TABLE IF EXISTS 'vw_grupo_qtde';
/*!50001 DROP VIEW IF EXISTS 'vw_grupo_qtde'*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW 'vw_grupo_qtde' AS SELECT 
 1 AS 'Id Grupo',
 1 AS 'Facilitador(Função)',
 1 AS 'Facilitador',
 1 AS 'Hospedeiro',
 1 AS 'Dia da Semana',
 1 AS 'Horário',
 1 AS 'Tipo',
 1 AS 'Quantidade Pessoas',
 1 AS 'Facilidador(Email)',
 1 AS 'Facilitador(Tel Res)',
 1 AS 'Facilitador(Tel Com)',
 1 AS 'Facilitador(Tel Cel)',
 1 AS 'Hospedeiro(Email)',
 1 AS 'Hospedeiro(Tel Res)',
 1 AS 'Hospedeiro(Tel Com)',
 1 AS 'Hospedeiro(Tel Cel)',
 1 AS 'Hospedeiro(Qtde Adultos)',
 1 AS 'Endereço',
 1 AS 'Bairro',
 1 AS 'Cidade',
 1 AS 'QTDE INSCRITOS'*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view 'vw_hosp'
--

DROP TABLE IF EXISTS 'vw_hosp';
/*!50001 DROP VIEW IF EXISTS 'vw_hosp'*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW 'vw_hosp' AS SELECT 
 1 AS 'ID',
 1 AS 'NOME',
 1 AS 'NUMFUNCAO',
 1 AS 'GRUPOOUTRO',
 1 AS 'ENDERECO',
 1 AS 'COMPLEMENTO',
 1 AS 'BAIRRO',
 1 AS 'CIDADE',
 1 AS 'CEP',
 1 AS 'TELEFONERES',
 1 AS 'TELEFONECOM',
 1 AS 'TELEFONECEL',
 1 AS 'EMAIL',
 1 AS 'MEMBRO',
 1 AS 'QTDEADULTOS',
 1 AS 'QTDECRIANCAS',
 1 AS 'OBS',
 1 AS 'STATUSREGISTRO',
 1 AS 'DATACADASTRO',
 1 AS 'ORIGEMINFO'*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view 'vw_facil'
--

/*!50001 DROP VIEW IF EXISTS 'vw_facil'*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER='cemparasem'@'%' SQL SECURITY INVOKER */
/*!50001 VIEW 'vw_facil' AS select 'tfacilhosp'.'ID' AS 'ID','tfacilhosp'.'NOME' AS 'NOME','tfacilhosp'.'NUMFUNCAO' AS 'NUMFUNCAO','tfacilhosp'.'GRUPOOUTRO' AS 'GRUPOOUTRO','tfacilhosp'.'ENDERECO' AS 'ENDERECO','tfacilhosp'.'COMPLEMENTO' AS 'COMPLEMENTO','tfacilhosp'.'BAIRRO' AS 'BAIRRO','tfacilhosp'.'CIDADE' AS 'CIDADE','tfacilhosp'.'CEP' AS 'CEP','tfacilhosp'.'TELEFONERES' AS 'TELEFONERES','tfacilhosp'.'TELEFONECOM' AS 'TELEFONECOM','tfacilhosp'.'TELEFONECEL' AS 'TELEFONECEL','tfacilhosp'.'EMAIL' AS 'EMAIL','tfacilhosp'.'MEMBRO' AS 'MEMBRO','tfacilhosp'.'QTDEADULTOS' AS 'QTDEADULTOS','tfacilhosp'.'QTDECRIANCAS' AS 'QTDECRIANCAS','tfacilhosp'.'OBS' AS 'OBS','tfacilhosp'.'STATUSREGISTRO' AS 'STATUSREGISTRO','tfacilhosp'.'DATACADASTRO' AS 'DATACADASTRO','tfacilhosp'.'ORIGEMINFO' AS 'ORIGEMINFO' from 'tfacilhosp' where ('tfacilhosp'.'NUMFUNCAO' in (1,99)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view 'vw_grupo_qtde'
--

/*!50001 DROP VIEW IF EXISTS 'vw_grupo_qtde'*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER='cemparasem'@'%' SQL SECURITY DEFINER */
/*!50001 VIEW 'vw_grupo_qtde' AS select 't1'.'ID' AS 'Id Grupo','t7'.'NOME' AS 'Facilitador(Função)',upper('t2'.'NOME') AS 'Facilitador',upper('t3'.'NOME') AS 'Hospedeiro','t4'.'NOME' AS 'Dia da Semana','t5'.'NOME' AS 'Horário','t6'.'NOME' AS 'Tipo','t1'.'QTDEMAXIMA' AS 'Quantidade Pessoas','t2'.'EMAIL' AS 'Facilidador(Email)','t2'.'TELEFONERES' AS 'Facilitador(Tel Res)','t2'.'TELEFONECOM' AS 'Facilitador(Tel Com)','t2'.'TELEFONECEL' AS 'Facilitador(Tel Cel)','t3'.'EMAIL' AS 'Hospedeiro(Email)','t3'.'TELEFONERES' AS 'Hospedeiro(Tel Res)','t3'.'TELEFONECOM' AS 'Hospedeiro(Tel Com)','t3'.'TELEFONECEL' AS 'Hospedeiro(Tel Cel)','t3'.'QTDEADULTOS' AS 'Hospedeiro(Qtde Adultos)',upper('t3'.'ENDERECO') AS 'Endereço',upper('t3'.'BAIRRO') AS 'Bairro',upper('t3'.'CIDADE') AS 'Cidade',(select count(0) from 'tparticipante' where ('tparticipante'.'CODIGOGRUPO' = 't1'.'ID')) AS 'QTDE INSCRITOS' from (((((('tgrupo' 't1' join 'vw_facil' 't2') join 'vw_hosp' 't3') join 'tdiasemana' 't4') join 'thorario' 't5') join 'ttipogrupo' 't6') join 'tfuncao' 't7') where (('t1'.'CODIGOFAC' = 't2'.'ID') and ('t1'.'CODIGOHOSP' = 't3'.'ID') and ('t1'.'DIASEMANA' = 't4'.'ID') and ('t1'.'HORARIO' = 't5'.'ID') and ('t1'.'TIPOGRUPO' = 't6'.'ID') and ('t2'.'NUMFUNCAO' = 't7'.'ID')) order by 't1'.'ID' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view 'vw_hosp'
--

/*!50001 DROP VIEW IF EXISTS 'vw_hosp'*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER='cemparasem'@'%' SQL SECURITY INVOKER */
/*!50001 VIEW 'vw_hosp' AS select 'tfacilhosp'.'ID' AS 'ID','tfacilhosp'.'NOME' AS 'NOME','tfacilhosp'.'NUMFUNCAO' AS 'NUMFUNCAO','tfacilhosp'.'GRUPOOUTRO' AS 'GRUPOOUTRO','tfacilhosp'.'ENDERECO' AS 'ENDERECO','tfacilhosp'.'COMPLEMENTO' AS 'COMPLEMENTO','tfacilhosp'.'BAIRRO' AS 'BAIRRO','tfacilhosp'.'CIDADE' AS 'CIDADE','tfacilhosp'.'CEP' AS 'CEP','tfacilhosp'.'TELEFONERES' AS 'TELEFONERES','tfacilhosp'.'TELEFONECOM' AS 'TELEFONECOM','tfacilhosp'.'TELEFONECEL' AS 'TELEFONECEL','tfacilhosp'.'EMAIL' AS 'EMAIL','tfacilhosp'.'MEMBRO' AS 'MEMBRO','tfacilhosp'.'QTDEADULTOS' AS 'QTDEADULTOS','tfacilhosp'.'QTDECRIANCAS' AS 'QTDECRIANCAS','tfacilhosp'.'OBS' AS 'OBS','tfacilhosp'.'STATUSREGISTRO' AS 'STATUSREGISTRO','tfacilhosp'.'DATACADASTRO' AS 'DATACADASTRO','tfacilhosp'.'ORIGEMINFO' AS 'ORIGEMINFO' from 'tfacilhosp' where ('tfacilhosp'.'NUMFUNCAO' in (2,99)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-26 11:25:45
