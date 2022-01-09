package sql;

import java.sql.SQLException;
import java.sql.Statement;

public class CreateTables {
	private Statement stmt = null;
	
	public CreateTables(Statement stmt) {
		this.stmt = stmt;
	}
	
	public void create() {
		String rqFriendship = "CREATE TABLE IF NOT EXISTS `friendship` (\n"
				 + "  `id` int(255) NOT NULL AUTO_INCREMENT,\n"
				 + "  `userId1` int(255) NOT NULL,\n"
				 + "  `userId2` int(255) NOT NULL,\n"
				 + "  `status` int(255) NOT NULL,\n"
				 + "  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,\n"
				 + "  PRIMARY KEY (`id`)\n"
				 + ") ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;"
				 ;
		
		String rqStatus = "CREATE TABLE IF NOT EXISTS `status` (\n"
				+ "  `id` int(255) NOT NULL UNIQUE,\n"
				+ "  `status` varchar(255) COLLATE utf8_bin NOT NULL\n"
				+ ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;"
				;
		
		String rqUser = "CREATE TABLE IF NOT EXISTS `user` (\n"
				+ "  `id` bigint(20) NOT NULL AUTO_INCREMENT,\n"
				+ "  `username` varchar(255) COLLATE utf8_bin NOT NULL,\n"
				+ "  `email` varchar(255) COLLATE utf8_bin NOT NULL,\n"
				+ "  `password` varchar(255) COLLATE utf8_bin NOT NULL,\n"
				+ "  `date_creation` date NOT NULL,\n"
				+ "  `nom` varchar(255) COLLATE utf8_bin NOT NULL,\n"
				+ "  `role` varchar(255) COLLATE utf8_bin NOT NULL,\n"
				+ "  `sexe` varchar(10) COLLATE utf8_bin NOT NULL,\n"
				+ "  `prenom` varchar(255) COLLATE utf8_bin NOT NULL,\n"
				+ "  `naissance` date NOT NULL,\n"
				+ "  PRIMARY KEY (`id`),\n"
				+ "  UNIQUE KEY `email` (`email`)\n"
				+ ") ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
		
		String rqNotif = "CREATE TABLE IF NOT EXISTS notifications( \n"
				+ " `userId1` int(255) NOT NULL,\n"
				+ " `userId2` int(255) NOT NULL,\n"
				+ " `type` int(255) NOT NULL,\n"
				+ " `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,\n"
				+ " `autoId` int(255) NOT NULL AUTO_INCREMENT,\n"
				+ "  PRIMARY KEY (`autoId`)\n"
				+ ");";
		
		String rqAct = "CREATE TABLE IF NOT EXISTS `activite` (\n"
				+ "  `id` int(255) NOT NULL AUTO_INCREMENT,\n"
				+ "  `userId` int(255) NOT NULL,\n"
				+ "  `adresse` varchar(255) COLLATE utf8_bin NOT NULL,\n"
				+ "  `nom` varchar(255) COLLATE utf8_bin NOT NULL,\n"
				+ "  `ville` varchar(255) COLLATE utf8_bin NOT NULL,\n"
				+ "  `date` date NOT NULL,\n"
				+ "  `debut` time NOT NULL,\n"
				+ "  `fin` time NOT NULL,\n"
				+ "  PRIMARY KEY (`id`)\n"
				+ ") ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
		
		String rqCovid = "CREATE TABLE IF NOT EXISTS `coviduser` (\n"
				+ "  `id` int(255) NOT NULL AUTO_INCREMENT,\n"
				+ "  `userId` int(255) NOT NULL,\n"
				+ "  `heure` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,\n"
				+ "  `date` date NOT NULL,\n"
				+ "  PRIMARY KEY (`id`),\n"
				+ "  UNIQUE KEY `userId` (`userId`)\n"
				+ ") ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
		
		String rqLieu = "CREATE TABLE IF NOT EXISTS `lieu` (\n"
				+ "  `id` int(11) NOT NULL AUTO_INCREMENT,\n"
				+ "  `nom` varchar(255) COLLATE utf8_bin NOT NULL,\n"
				+ "  `lat` float NOT NULL,\n"
				+ "  `lng` float NOT NULL,\n"
				+ "  `adresse` varchar(255) COLLATE utf8_bin NOT NULL,\n"
				+ "  `ville` varchar(255) COLLATE utf8_bin NOT NULL,\n"
				+ "  PRIMARY KEY (`id`)\n"
				+ ") ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
		
		String rqVillesFr = "CREATE TABLE IF NOT EXISTS `villes_france_free` (\n"
				+ "  `ville_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,\n"
				+ "  `ville_departement` varchar(3) DEFAULT NULL,\n"
				+ "  `ville_slug` varchar(255) DEFAULT NULL,\n"
				+ "  `ville_nom` varchar(45) DEFAULT NULL,\n"
				+ "  `ville_nom_simple` varchar(45) DEFAULT NULL,\n"
				+ "  `ville_nom_reel` varchar(45) DEFAULT NULL,\n"
				+ "  `ville_nom_soundex` varchar(20) DEFAULT NULL,\n"
				+ "  `ville_nom_metaphone` varchar(22) DEFAULT NULL,\n"
				+ "  `ville_code_postal` varchar(255) DEFAULT NULL,\n"
				+ "  `ville_commune` varchar(3) DEFAULT NULL,\n"
				+ "  `ville_code_commune` varchar(5) NOT NULL,\n"
				+ "  `ville_arrondissement` smallint(3) UNSIGNED DEFAULT NULL,\n"
				+ "  `ville_canton` varchar(4) DEFAULT NULL,\n"
				+ "  `ville_amdi` smallint(5) UNSIGNED DEFAULT NULL,\n"
				+ "  `ville_population_2010` mediumint(11) UNSIGNED DEFAULT NULL,\n"
				+ "  `ville_population_1999` mediumint(11) UNSIGNED DEFAULT NULL,\n"
				+ "  `ville_population_2012` mediumint(10) UNSIGNED DEFAULT NULL COMMENT 'approximatif',\n"
				+ "  `ville_densite_2010` int(11) DEFAULT NULL,\n"
				+ "  `ville_surface` float DEFAULT NULL,\n"
				+ "  `ville_longitude_deg` float DEFAULT NULL,\n"
				+ "  `ville_latitude_deg` float DEFAULT NULL,\n"
				+ "  `ville_longitude_grd` varchar(9) DEFAULT NULL,\n"
				+ "  `ville_latitude_grd` varchar(8) DEFAULT NULL,\n"
				+ "  `ville_longitude_dms` varchar(9) DEFAULT NULL,\n"
				+ "  `ville_latitude_dms` varchar(8) DEFAULT NULL,\n"
				+ "  `ville_zmin` mediumint(4) DEFAULT NULL,\n"
				+ "  `ville_zmax` mediumint(4) DEFAULT NULL,\n"
				+ "  PRIMARY KEY (`ville_id`),\n"
				+ "  UNIQUE KEY `ville_code_commune_2` (`ville_code_commune`),\n"
				+ "  UNIQUE KEY `ville_slug` (`ville_slug`),\n"
				+ "  KEY `ville_departement` (`ville_departement`),\n"
				+ "  KEY `ville_nom` (`ville_nom`),\n"
				+ "  KEY `ville_nom_reel` (`ville_nom_reel`),\n"
				+ "  KEY `ville_code_commune` (`ville_code_commune`),\n"
				+ "  KEY `ville_code_postal` (`ville_code_postal`),\n"
				+ "  KEY `ville_longitude_latitude_deg` (`ville_longitude_deg`,`ville_latitude_deg`),\n"
				+ "  KEY `ville_nom_soundex` (`ville_nom_soundex`),\n"
				+ "  KEY `ville_nom_metaphone` (`ville_nom_metaphone`),\n"
				+ "  KEY `ville_population_2010` (`ville_population_2010`),\n"
				+ "  KEY `ville_nom_simple` (`ville_nom_simple`)\n"
				+ ") ENGINE=MyISAM AUTO_INCREMENT=36831 DEFAULT CHARSET=utf8;";
		String rqFriendshipIns = "INSERT INTO `friendship` (`id`, `userId1`, `userId2`, `status`, `createdAt`) VALUES\n"
				+ "(52, 17, 19, 2, '2022-01-08 17:19:25'),\n"
				+ "(53, 19, 17, 2, '2022-01-08 17:19:25'),\n"
				+ "(56, 22, 19, 2, '2022-01-08 17:20:01'),\n"
				+ "(57, 19, 22, 2, '2022-01-08 17:20:01'),\n"
				+ "(58, 23, 19, 1, '2022-01-08 17:20:14');";
		
		String rqStatusIns = "INSERT INTO `status` (`id`, `status`) VALUES\n"
				+ "(1, 'request send'),\n"
				+ "(2, 'friends'),\n"
				+ "(3, 'request cancelled');";
		
		String rqActIns = "INSERT INTO `activite` (`id`, `userId`, `adresse`, `nom`, `ville`, `date`, `debut`, `fin`) VALUES\n"
				+ "(2, 19, '52;54 Rue Jeanne d\\'Arc', 'boulangerie', 'Nancy', '2022-01-08', '22:22:00', '23:22:00'),\n"
				+ "(3, 17, '52;54 Rue Jeanne d\\'Arc', 'boulangerie', 'Nancy', '2022-01-08', '22:22:00', '23:22:00'),\n"
				+ "(4, 17, 'Avenue Nelson Mandela', 'parc', 'Tomblaine', '2022-01-07', '12:22:00', '13:43:00'),\n"
				+ "(5, 22, 'Avenue Foch', 'Av Foch', 'Nancy', '2022-01-07', '08:22:00', '12:43:00');";
		
		String rqCovidIns = "INSERT INTO `coviduser` (`id`, `userId`, `heure`, `date`) VALUES\n"
				+ "(5, 19, '2022-01-09 01:29:29', '2022-01-09');";
		
		String rqLieuIns = "INSERT INTO `lieu` (`id`, `nom`, `lat`, `lng`, `adresse`, `ville`) VALUES\n"
				+ "(1, 'alpa\\'n co', 48.7196, 6.1714, 'Avenue de Metz', 'Maxville'),\n"
				+ "(2, 'Av Foch', 48.6888, 6.17432, 'Avenue Foch', 'Nancy'),\n"
				+ "(3, 'boulangerie', 48.6863, 6.1714, '52;54 Rue Jeanne d\\'Arc', 'Nancy'),\n"
				+ "(4, 'parc', 48.6914, 6.21791, 'Avenue Nelson Mandela', 'Tomblaine'),\n"
				+ "(5, 'test', 48.6898, 6.17472, '', 'Nancy'),\n"
				+ "(6, 'test2', 48.6895, 6.17361, '3 Place Thiers', 'Nancy');";
		
		String rqVillesFrIns = "INSERT INTO `villes_france_free` (`ville_id`, `ville_departement`, `ville_slug`, `ville_nom`, `ville_nom_simple`, `ville_nom_reel`, `ville_nom_soundex`, `ville_nom_metaphone`, `ville_code_postal`, `ville_commune`, `ville_code_commune`, `ville_arrondissement`, `ville_canton`, `ville_amdi`, `ville_population_2010`, `ville_population_1999`, `ville_population_2012`, `ville_densite_2010`, `ville_surface`, `ville_longitude_deg`, `ville_latitude_deg`, `ville_longitude_grd`, `ville_latitude_grd`, `ville_longitude_dms`, `ville_latitude_dms`, `ville_zmin`, `ville_zmax`) VALUES\r\n"
				+ "(1, '01', 'ozan', 'OZAN', 'ozan', 'Ozan', 'O250', 'OSN', '01190', '284', '01284', 2, '26', 6, 618, 469, 500, 93, 6.6, 4.91667, 46.3833, '2866', '51546', '+45456', '462330', 170, 205),\r\n"
				+ "(2, '01', 'cormoranche-sur-saone', 'CORMORANCHE-SUR-SAONE', 'cormoranche sur saone', 'Cormoranche-sur-Saône', 'C65652625', 'KRMRNXSRSN', '01290', '123', '01123', 2, '27', 6, 1058, 903, 1000, 107, 9.85, 4.83333, 46.2333, '2772', '51379', '+44953', '461427', 168, 211),\r\n"
				+ "(3, '01', 'plagne-01', 'PLAGNE', 'plagne', 'Plagne', 'P425', 'PLKN', '01130', '298', '01298', 4, '03', 6, 129, 83, 100, 20, 6.2, 5.73333, 46.1833, '3769', '51324', '+54342', '461131', 560, 922),\r\n"
				+ "(4, '01', 'tossiat', 'TOSSIAT', 'tossiat', 'Tossiat', 'T230', 'TST', '01250', '422', '01422', 2, '25', 6, 1406, 1111, 1400, 138, 10.17, 5.31667, 46.1333, '3309', '51268', '+51854', '460828', 244, 501),\r\n"
				+ "(5, '01', 'pouillat', 'POUILLAT', 'pouillat', 'Pouillat', 'P430', 'PLT', '01250', '309', '01309', 2, '33', 6, 88, 58, 100, 14, 6.23, 5.43333, 46.3333, '3435', '51475', '+52542', '461938', 333, 770),\r\n"
				+ "(6, '01', 'torcieu', 'TORCIEU', 'torcieu', 'Torcieu', 'T620', 'TRS', '01230', '421', '01421', 1, '28', 6, 698, 643, 700, 65, 10.72, 5.4, 45.9167, '3398', '51025', '+52343', '455521', 257, 782),\r\n"
				+ "(7, '01', 'replonges', 'REPLONGES', 'replonges', 'Replonges', 'R1452', 'RPLNJS', '01620', '320', '01320', 2, '02', 6, 3500, 2841, 3300, 210, 16.6, 4.88333, 46.3, '2833', '51456', '+45310', '461837', 169, 207),\r\n"
				+ "(8, '01', 'corcelles', 'CORCELLES', 'corcelles', 'Corcelles', 'C6242', 'KRSLS', '01110', '119', '01119', 4, '06', 6, 243, 222, 200, 17, 14.16, 5.58333, 46.0333, '3597', '51151', '+53428', '460208', 780, 1081),\r\n"
				+ "(9, '01', 'peron', 'PERON', 'peron', 'Péron', 'P650', 'PRN', '01630', '288', '01288', 3, '12', 6, 2143, 1578, 1900, 82, 26.01, 5.93333, 46.2, '3989', '51322', '+55535', '461124', 411, 1501),\r\n"
				+ "(10, '01', 'relevant', 'RELEVANT', 'relevant', 'Relevant', 'R4153', 'RLFNT', '01990', '319', '01319', 2, '30', 6, 466, 367, 400, 37, 12.38, 4.95, 46.0833, '2903', '51211', '+45658', '460525', 235, 282),\r\n"
				+ "(11, '01', 'chaveyriat', 'CHAVEYRIAT', 'chaveyriat', 'Chaveyriat', 'C163', 'XFRT', '01660', '096', '01096', 2, '10', 6, 927, 810, 900, 54, 16.87, 5.06667, 46.1833, '3026', '51331', '+50338', '461152', 188, 260),\r\n"
				+ "(12, '01', 'vaux-en-bugey', 'VAUX-EN-BUGEY', 'vaux en bugey', 'Vaux-en-Bugey', 'V2512', 'FKSNBJ', '01150', '431', '01431', 1, '17', 6, 1169, 1003, 1100, 142, 8.22, 5.35, 45.9167, '3352', '51031', '+52113', '455541', 252, 681),\r\n"
				+ "(13, '01', 'maillat', 'MAILLAT', 'maillat', 'Maillat', 'M430', 'MLT', '01430', '228', '01228', 4, '22', 6, 668, 664, 700, 59, 11.31, 5.55, 46.1333, '3557', '51255', '+53217', '460745', 497, 825),\r\n"
				+ "(14, '01', 'faramans-01', 'FARAMANS', 'faramans', 'Faramans', 'F652', 'FRMNS', '01800', '156', '01156', 2, '19', 6, 681, 591, 600, 60, 11.22, 5.11667, 45.9, '3099', '51002', '+50732', '455407', 255, 306),\r\n"
				+ "(15, '01', 'beon-01', 'BEON', 'beon', 'Béon', 'B500', 'BN', '01350', '039', '01039', 1, '09', 6, 373, 364, 400, 36, 10.3, 5.75, 45.8333, '3798', '50950', '+54519', '455117', 228, 1412),\r\n"
				+ "(16, '01', 'saint-bernard-01', 'SAINT-BERNARD', 'saint bernard', 'Saint-Bernard', 'S5316563', 'SNTBRNRT', '01600', '339', '01339', 2, '34', 6, 1375, 1281, 1400, 436, 3.15, 4.73723, 45.945, '2667', '51050', '+44414', '455642', 167, 198),\r\n"
				+ "(17, '01', 'rossillon', 'ROSSILLON', 'rossillon', 'Rossillon', 'R245', 'RSLN', '01510', '329', '01329', 1, '36', 6, 148, 147, 100, 18, 8.07, 5.6, 45.8333, '3619', '50924', '+53537', '454955', 324, 1022),\r\n"
				+ "(18, '01', 'pont-d-ain', 'PONT-D\\'AIN', 'pont d ain', 'Pont-d\\'Ain', 'P535', 'PNTTN', '01160', '304', '01304', 2, '25', 5, 2627, 2309, 2500, 234, 11.22, 5.33333, 46.05, '3333', '51165', '+52011', '460254', 232, 314),\r\n"
				+ "(19, '01', 'nantua', 'NANTUA', 'nantua', 'Nantua', 'N300', 'NNT', '01460', '269', '01269', 4, '22', 4, 3713, 3922, 3600, 290, 12.79, 5.61667, 46.15, '3633', '51282', '+53622', '460912', 427, 1125),\r\n"
				+ "(20, '01', 'chavannes-sur-reyssouze', 'CHAVANNES-SUR-REYSSOUZE', 'chavannes sur reyssouze', 'Chavannes-sur-Reyssouze', 'C15262', 'XFNSSRRSS', '01190', '094', '01094', 2, '26', 6, 680, 580, 700, 41, 16.55, 5, 46.4333, '2952', '51590', '+45935', '462550', 175, 218),\r\n"
				+ "(21, '01', 'neuville-les-dames', 'NEUVILLE-LES-DAMES', 'neuville les dames', 'Neuville-les-Dames', 'N142352', 'NFLLSTMS', '01400', '272', '01272', 2, '10', 6, 1504, 1232, 1500, 56, 26.59, 5, 46.1667, '2963', '51291', '+50013', '460944', 210, 271),\r\n"
				+ "(22, '01', 'flaxieu', 'FLAXIEU', 'flaxieu', 'Flaxieu', 'F420', 'FLKS', '01350', '162', '01162', 1, '36', 6, 63, 50, 100, 22, 2.79, 5.73333, 45.8167, '3776', '50898', '+54407', '454830', 225, 385),\r\n"
				+ "(23, '01', 'hotonnes', 'HOTONNES', 'hotonnes', 'Hotonnes', 'H352', 'HTNS', '01260', '187', '01187', 4, '06', 6, 306, 295, 300, 10, 28.4, 5.68333, 46, '3730', '51109', '+54136', '455952', 636, 1338),\r\n"
				+ "(24, '01', 'saint-sorlin-en-bugey', 'SAINT-SORLIN-EN-BUGEY', 'saint sorlin en bugey', 'Saint-Sorlin-en-Bugey', 'S53264512', 'SNTSRLNNBJ', '01150', '386', '01386', 1, '17', 6, 1061, 938, 1100, 116, 9.07, 5.36667, 45.8833, '3371', '50983', '+52214', '455306', 196, 700),\r\n"
				+ "(25, '01', 'songieu', 'SONGIEU', 'songieu', 'Songieu', 'S520', 'SNJ', '01260', '409', '01409', 1, '09', 6, 130, 123, 100, 6, 20.58, 5.7, 45.9667, '3740', '51082', '+54208', '455824', 567, 1275),\r\n"
				+ "(26, '01', 'virieu-le-petit', 'VIRIEU-LE-PETIT', 'virieu le petit', 'Virieu-le-Petit', 'V6413', 'FRLPTT', '01260', '453', '01453', 1, '09', 6, 309, 281, 300, 18, 16.36, 5.71667, 45.9, '3764', '51010', '+54328', '455431', 419, 1524),\r\n"
				+ "(27, '01', 'saint-denis-en-bugey', 'SAINT-DENIS-EN-BUGEY', 'saint denis en bugey', 'Saint-Denis-en-Bugey', 'S5352512', 'SNTTNSNBJ', '01500', '345', '01345', 1, '01', 6, 2178, 1939, 2100, 834, 2.61, 5.33333, 45.95, '3325', '51058', '+51945', '455707', 234, 338),\r\n"
				+ "(28, '01', 'charnoz-sur-ain', 'CHARNOZ-SUR-AIN', 'charnoz sur ain', 'Charnoz-sur-Ain', 'C65265', 'XRNSSRN', '01800', '088', '01088', 2, '19', 6, 911, 808, 900, 137, 6.62, 5.21667, 45.8667, '3206', '50969', '+51318', '455220', 203, 244),\r\n"
				+ "(29, '01', 'chazey-sur-ain', 'CHAZEY-SUR-AIN', 'chazey sur ain', 'Chazey-sur-Ain', 'C650', 'XSSRN', '01150', '099', '01099', 1, '17', 6, 1464, 1200, 1400, 66, 21.95, 5.25, 45.9, '3242', '50992', '+51516', '455333', 202, 261),\r\n"
				+ "(30, '01', 'marchamp', 'MARCHAMP', 'marchamp', 'Marchamp', 'M6251', 'MRXMP', '01680', '233', '01233', 1, '18', 6, 118, 108, 100, 9, 13.11, 5.55, 45.7833, '3561', '50874', '+53230', '454712', 400, 940),\r\n"
				+ "(31, '01', 'culoz', 'CULOZ', 'culoz', 'Culoz', 'C420', 'KLS', '01350', '138', '01138', 1, '31', 6, 2909, 2620, 2900, 150, 19.36, 5.78333, 45.85, '3828', '50943', '+54654', '455055', 226, 1430),\r\n"
				+ "(32, '01', 'mantenay-montlin', 'MANTENAY-MONTLIN', 'mantenay montlin', 'Mantenay-Montlin', 'M35345', 'MNTNMNTLN', '01560', '230', '01230', 2, '29', 6, 288, 247, 300, 26, 10.8, 5.08333, 46.4167, '3068', '51583', '+50554', '462528', 180, 222),\r\n"
				+ "(33, '01', 'marboz', 'MARBOZ', 'marboz', 'Marboz', 'M612', 'MRBS', '01851', '232', '01232', 2, '11', 6, 2182, 2164, 2200, 54, 40.14, 5.25, 46.3333, '3246', '51492', '+51530', '462033', 194, 240),\r\n"
				+ "(34, '01', 'foissiat', 'FOISSIAT', 'foissiat', 'Foissiat', 'F230', 'FST', '01340', '163', '01163', 2, '21', 6, 1912, 1562, 1900, 47, 40.36, 5.18333, 46.3667, '3153', '51523', '+51029', '462213', 186, 228),\r\n"
				+ "(35, '01', 'treffort-cuisiat', 'TREFFORT-CUISIAT', 'treffort cuisiat', 'Treffort-Cuisiat', 'T616323', 'TRFRTKXT', '01370', '426', '01426', 2, '33', 5, 2204, 1908, 2100, 55, 39.41, 5.36834, 46.2714, '3369', '51413', '+52206', '461617', 221, 681),\r\n"
				+ "(36, '01', 'izieu', 'IZIEU', 'izieu', 'Izieu', 'I200', 'IS', '01300', '193', '01193', 1, '04', 6, 201, 178, 200, 26, 7.67, 5.63333, 45.65, '3674', '50727', '+53837', '453917', 211, 758),\r\n"
				+ "(37, '01', 'saint-etienne-du-bois-01', 'SAINT-ETIENNE-DU-BOIS', 'saint etienne du bois', 'Saint-Étienne-du-Bois', 'S535312', 'SNTTNTBS', '01370', '350', '01350', 2, '33', 6, 2441, 2045, 2400, 86, 28.38, 5.28333, 46.2833, '3285', '51431', '+51736', '461717', 213, 259),\r\n"
				+ "(38, '01', 'hauteville-lompnes', 'HAUTEVILLE-LOMPNES', 'hauteville lompnes', 'Hauteville-Lompnes', 'H3145152', 'HTFLLMPNS', '01110', '185', '01185', 1, '15', 5, 4044, 3653, 4200, 80, 50.34, 5.6, 45.9667, '3625', '51088', '+53558', '455844', 455, 1240),\r\n"
				+ "(39, '01', 'saint-trivier-sur-moignans', 'SAINT-TRIVIER-SUR-MOIGNANS', 'saint trivier sur moignans', 'Saint-Trivier-sur-Moignans', 'S53616265252', 'SNTTRFRSRMKNNS', '01990', '389', '01389', 2, '30', 5, 1877, 1537, 1900, 44, 41.99, 4.9, 46.0667, '2846', '51193', '+45354', '460424', 230, 289),\r\n"
				+ "(40, '01', 'peyriat', 'PEYRIAT', 'peyriat', 'Peyriat', 'P630', 'PRT', '01430', '293', '01293', 4, '16', 6, 171, 157, 200, 28, 5.96, 5.51667, 46.15, '3526', '51282', '+53037', '460915', 558, 825),\r\n"
				+ "(41, '01', 'evosges', 'EVOSGES', 'evosges', 'Évosges', 'E120', 'EFSJS', '01230', '155', '01155', 1, '28', 6, 140, 109, 100, 11, 12.08, 5.5, 45.9583, '3513', '51068', '+52953', '455739', 560, 1001),\r\n"
				+ "(42, '01', 'poncin', 'PONCIN', 'poncin', 'Poncin', 'P525', 'PNSN', '01450', '303', '01303', 4, '24', 5, 1644, 1371, 1600, 83, 19.77, 5.4, 46.0833, '3411', '51206', '+52424', '460506', 240, 540),\r\n"
				+ "(43, '01', 'crans-01', 'CRANS', 'crans', 'Crans', 'C652', 'KRNS', '01320', '129', '01129', 2, '08', 6, 269, 258, 300, 20, 13.23, 5.21667, 45.9667, '3171', '51072', '+51126', '455754', 249, 322),\r\n"
				+ "(44, '01', 'montreal-la-cluse', 'MONTREAL-LA-CLUSE', 'montreal la cluse', 'Montréal-la-Cluse', 'M364242', 'MNTRLLKLS', '01460', '265', '01265', 4, '22', 6, 3457, 3699, 3500, 269, 12.83, 5.57084, 46.1867, '3593', '51319', '+53415', '461112', 473, 960),\r\n"
				+ "(45, '01', 'cleyzieu', 'CLEYZIEU', 'cleyzieu', 'Cleyzieu', 'C420', 'KLS', '01230', '107', '01107', 1, '28', 6, 135, 116, 100, 17, 7.82, 5.43333, 45.9, '3438', '51009', '+52550', '455428', 440, 927),\r\n"
				+ "(46, '01', 'lompnieu', 'LOMPNIEU', 'lompnieu', 'Lompnieu', 'L515', 'LMPN', '01260', '221', '01221', 1, '09', 6, 122, 103, 100, 10, 11.35, 5.65, 45.9667, '3693', '51069', '+53939', '455742', 524, 1241),\r\n"
				+ "(47, '01', 'villereversure', 'VILLEREVERSURE', 'villereversure', 'Villereversure', 'V461626', 'FLRFRSR', '01250', '447', '01447', 2, '07', 6, 1208, 1102, 1200, 69, 17.45, 5.38333, 46.1833, '3400', '51324', '+52346', '461131', 279, 480),\r\n"
				+ "(48, '01', 'saint-martin-du-mont-01', 'SAINT-MARTIN-DU-MONT', 'saint martin du mont', 'Saint-Martin-du-Mont', 'S535635353', 'SNTMRTNTMNT', '01160', '374', '01374', 2, '25', 6, 1651, 1304, 1600, 58, 28.09, 5.33333, 46.1, '3324', '51224', '+51942', '460606', 246, 556),\r\n"
				+ "(49, '01', 'saint-genis-pouilly', 'SAINT-GENIS-POUILLY', 'saint genis pouilly', 'Saint-Genis-Pouilly', 'S5325214', 'SNTJNSPL', '01630', '354', '01354', 3, '13', 6, 8914, 6382, 8400, 912, 9.77, 6.01667, 46.25, '4094', '51382', '+60117', '461436', 419, 502),\r\n"
				+ "(50, '01', 'bolozon', 'BOLOZON', 'bolozon', 'Bolozon', 'B425', 'BLSN', '01450', '051', '01051', 4, '16', 6, 94, 94, 100, 19, 4.92, 5.48333, 46.2, '3486', '51325', '+52828', '461134', 261, 673),\r\n"
				+ "(51, '01', 'confrancon', 'CONFRANCON', 'confrancon', 'Confrançon', 'C516525', 'KNFRNKN', '01310', '115', '01115', 2, '21', 6, 1157, 862, 1100, 63, 18.17, 5.06667, 46.2667, '3032', '51408', '+50355', '461602', 192, 224),\r\n"
				+ "(52, '01', 'lochieu', 'LOCHIEU', 'lochieu', 'Lochieu', 'L200', 'LX', '01260', '218', '01218', 1, '09', 6, 91, 73, 100, 12, 7.07, 5.71667, 45.9333, '3768', '51034', '+54340', '455550', 479, 1426),\r\n"
				+ "(53, '01', 'chanoz-chatenay', 'CHANOZ-CHATENAY', 'chanoz chatenay', 'Chanoz-Châtenay', 'C5235', 'XNSXTN', '01400', '084', '01084', 2, '10', 6, 706, 492, 700, 52, 13.42, 5.03333, 46.1833, '2993', '51316', '+50148', '461103', 194, 268),\r\n"
				+ "(54, '01', 'villebois', 'VILLEBOIS', 'villebois', 'Villebois', 'V412', 'FLBS', '01150', '444', '01444', 1, '17', 6, 1153, 953, 1100, 79, 14.46, 5.43333, 45.85, '3443', '50942', '+52606', '455052', 195, 960),\r\n"
				+ "(55, '01', 'ceignes', 'CEIGNES', 'ceignes', 'Ceignes', 'C520', 'SKNS', '01430', '067', '01067', 4, '16', 6, 265, 229, 300, 26, 10.01, 5.5, 46.1167, '3514', '51245', '+52957', '460713', 580, 862),\r\n"
				+ "(56, '01', 'saint-didier-sur-chalaronne', 'SAINT-DIDIER-SUR-CHALARONNE', 'saint didier sur chalaronne', 'Saint-Didier-sur-Chalaronne', 'S536262465', 'SNTTTRSRXLRN', '01140', '348', '01348', 2, '32', 6, 2776, 2263, 2700, 111, 24.98, 4.81667, 46.1667, '2757', '51308', '+44904', '461039', 167, 223),\r\n"
				+ "(57, '01', 'revonnas', 'REVONNAS', 'revonnas', 'Revonnas', 'R152', 'RFNS', '01250', '321', '01321', 2, '07', 6, 788, 493, 700, 101, 7.75, 5.33333, 46.1667, '3326', '51291', '+51949', '460944', 255, 504),\r\n"
				+ "(58, '01', 'bourg-saint-christophe', 'BOURG-SAINT-CHRISTOPHE', 'bourg saint christophe', 'Bourg-Saint-Christophe', 'B625326231', 'BRKSNTXRSTF', '01800', '054', '01054', 2, '19', 6, 1173, 824, 1100, 130, 8.98, 5.16667, 45.8833, '3138', '50990', '+50938', '455326', 207, 305),\r\n"
				+ "(59, '01', 'condeissiat', 'CONDEISSIAT', 'condeissiat', 'Condeissiat', 'C5323', 'KNTST', '01400', '113', '01113', 2, '10', 6, 756, 649, 700, 34, 21.64, 5.08333, 46.1667, '3048', '51287', '+50448', '460930', 232, 268),\r\n"
				+ "(60, '01', 'pirajoux', 'PIRAJOUX', 'pirajoux', 'Pirajoux', 'P620', 'PRJKS', '01270', '296', '01296', 2, '11', 6, 360, 299, 300, 27, 12.99, 5.3, 46.3833, '3292', '51524', '+51757', '462217', 192, 237),\r\n"
				+ "(61, '01', 'chalamont', 'CHALAMONT', 'chalamont', 'Chalamont', 'C453', 'XLMNT', '01320', '074', '01074', 2, '08', 5, 2322, 1656, 2200, 70, 32.88, 5.16667, 46, '3149', '51107', '+51016', '455946', 269, 330),\r\n"
				+ "(62, '01', 'plantay', 'LE PLANTAY', 'le plantay', 'Le Plantay', 'L1453', 'LPLNT', '01330', '299', '01299', 2, '08', 6, 540, 416, 500, 27, 19.96, 5.08333, 46.0167, '3058', '51137', '+50520', '460123', 267, 286),\r\n"
				+ "(63, '01', 'versailleux', 'VERSAILLEUX', 'versailleux', 'Versailleux', 'V6242', 'FRSLKS', '01330', '434', '01434', 2, '08', 6, 332, 254, 300, 17, 18.77, 5.1, 45.9833, '3075', '51089', '+50614', '455849', 274, 303),\r\n"
				+ "(64, '01', 'montagnat', 'MONTAGNAT', 'montagnat', 'Montagnat', 'M3253', 'MNTKNT', '01250', '254', '01254', 2, '39', 6, 1646, 1421, 1600, 119, 13.75, 5.28333, 46.1667, '3275', '51301', '+51703', '461015', 229, 282),\r\n"
				+ "(65, '01', 'vieu', 'VIEU', 'vieu', 'Vieu', 'V000', 'F', '01260', '442', '01442', 1, '09', 6, 380, 311, 400, 58, 6.54, 5.68333, 45.9, '3717', '50990', '+54054', '455326', 280, 540),\r\n"
				+ "(66, '01', 'saint-andre-de-corcy', 'SAINT-ANDRE-DE-CORCY', 'saint andre de corcy', 'Saint-André-de-Corcy', 'S535363262', 'SNTNTRTKRS', '01390', '333', '01333', 2, '42', 6, 2991, 3098, 3000, 144, 20.73, 4.95, 45.9167, '2906', '51029', '+45708', '455535', 279, 306),\r\n"
				+ "(67, '01', 'bressolles-01', 'BRESSOLLES', 'bressolles', 'Bressolles', 'B6242', 'BRSLS', '01360', '062', '01062', 2, '20', 6, 709, 587, 700, 91, 7.73, 5.1, 45.8667, '3065', '50963', '+50544', '455201', 205, 292),\r\n"
				+ "(68, '01', 'peronnas', 'PERONNAS', 'peronnas', 'Péronnas', 'P652', 'PRNS', '01960', '289', '01289', 2, '39', 5, 6054, 5530, 6100, 344, 17.55, 5.2, 46.1833, '3184', '51309', '+51210', '461043', 223, 277),\r\n"
				+ "(69, '01', 'colomieu', 'COLOMIEU', 'colomieu', 'Colomieu', 'C450', 'KLM', '01300', '110', '01110', 1, '04', 6, 115, 128, 100, 19, 5.96, 5.61667, 45.7333, '3650', '50814', '+53719', '454359', 319, 476),\r\n"
				+ "(70, '01', 'monthieux', 'MONTHIEUX', 'monthieux', 'Monthieux', 'M320', 'MN0KS', '01390', '261', '01261', 2, '35', 6, 599, 579, 600, 55, 10.75, 4.93333, 45.95, '2893', '51064', '+45625', '455726', 281, 311),\r\n"
				+ "(71, '01', 'saint-jean-sur-reyssouze', 'SAINT-JEAN-SUR-REYSSOUZE', 'saint jean sur reyssouze', 'Saint-Jean-sur-Reyssouze', 'S5325262', 'SNTJNSRRSS', '01560', '364', '01364', 2, '29', 6, 744, 582, 700, 27, 27.48, 5.06667, 46.4, '3029', '51551', '+50346', '462346', 178, 218),\r\n"
				+ "(72, '01', 'garnerans', 'GARNERANS', 'garnerans', 'Garnerans', 'G65652', 'KRNRNS', '01140', '167', '01167', 2, '32', 6, 656, 565, 600, 76, 8.57, 4.83333, 46.2, '2783', '51340', '+45028', '461221', 168, 215),\r\n"
				+ "(73, '01', 'montrevel-en-bresse', 'MONTREVEL-EN-BRESSE', 'montrevel en bresse', 'Montrevel-en-Bresse', 'M36145162', 'MNTRFLNBRS', '01340', '266', '01266', 2, '21', 5, 2362, 1995, 2400, 229, 10.27, 5.13333, 46.3333, '3102', '51485', '+50742', '462012', 192, 220),\r\n"
				+ "(74, '01', 'conand', 'CONAND', 'conand', 'Conand', 'C530', 'KNNT', '01230', '111', '01111', 1, '28', 6, 104, 69, 100, 6, 15.28, 5.46667, 45.8833, '3483', '50992', '+52816', '455333', 351, 1021),\r\n"
				+ "(75, '01', 'challes-la-montagne', 'CHALLES-LA-MONTAGNE', 'challes la montagne', 'Challes-la-Montagne', 'C4245325', 'XLSLMNTKN', '01450', '077', '01077', 4, '24', 6, 179, 203, 200, 23, 7.65, 5.46667, 46.1333, '3475', '51250', '+52752', '460730', 440, 700),\r\n"
				+ "(76, '01', 'mogneneins', 'MOGNENEINS', 'mogneneins', 'Mogneneins', 'M252', 'MKNNNS', '01140', '252', '01252', 2, '32', 6, 727, 572, 700, 84, 8.57, 4.81667, 46.1333, '2750', '51265', '+44842', '460818', 168, 238),\r\n"
				+ "(77, '01', 'thoissey', 'THOISSEY', 'thoissey', 'Thoissey', 'T200', '0S', '01140', '420', '01420', 2, '32', 5, 1540, 1355, 1500, 1149, 1.34, 4.8, 46.1667, '2739', '51303', '+44807', '461021', 168, 178),\r\n"
				+ "(78, '01', 'chaleins', 'CHALEINS', 'chaleins', 'Chaleins', 'C452', 'XLNS', '01480', '075', '01075', 2, '30', 6, 1165, 1025, 1200, 68, 17, 4.8, 46.0333, '2742', '51145', '+44817', '460150', 193, 267),\r\n"
				+ "(79, '01', 'neuville-sur-ain', 'NEUVILLE-SUR-AIN', 'neuville sur ain', 'Neuville-sur-Ain', 'N14265', 'NFLSRN', '01160', '273', '01273', 2, '25', 6, 1571, 1237, 1500, 79, 19.79, 5.36667, 46.0833, '3373', '51203', '+52220', '460457', 242, 427),\r\n"
				+ "(80, '01', 'thil-01', 'THIL', 'thil', 'Thil', 'T400', '0L', '01120', '418', '01418', 2, '40', 6, 1070, 946, 1100, 207, 5.15, 5.01667, 45.8167, '2983', '50905', '+50118', '454851', 174, 183),\r\n"
				+ "(81, '01', 'jujurieux', 'JUJURIEUX', 'jujurieux', 'Jujurieux', 'J620', 'JJRKS', '01640', '199', '01199', 4, '24', 6, 2097, 1696, 2000, 136, 15.39, 5.41667, 46.0333, '3414', '51156', '+52432', '460224', 242, 633),\r\n"
				+ "(82, '01', 'oncieu', 'ONCIEU', 'oncieu', 'Oncieu', 'O520', 'ONS', '01230', '279', '01279', 1, '28', 6, 91, 78, 100, 11, 7.76, 5.46667, 45.95, '3485', '51066', '+52824', '455733', 300, 807),\r\n"
				+ "(83, '01', 'lurcy', 'LURCY', 'lurcy', 'Lurcy', 'L620', 'LRS', '01090', '225', '01225', 2, '30', 6, 393, 256, 400, 81, 4.81, 4.76667, 46.0667, '2716', '51181', '+44652', '460346', 169, 233),\r\n"
				+ "(84, '01', 'balan-01', 'BALAN', 'balan', 'Balan', 'B450', 'BLN', '01360', '027', '01027', 2, '20', 6, 2348, 1534, 2400, 130, 18.04, 5.1, 45.8333, '3069', '50927', '+50554', '455003', 178, 233),\r\n"
				+ "(85, '01', 'ambutrix', 'AMBUTRIX', 'ambutrix', 'Ambutrix', 'A51362', 'AMTRKS', '01500', '008', '01008', 1, '17', 6, 729, 586, 700, 139, 5.22, 5.33333, 45.9333, '3335', '51044', '+52017', '455621', 237, 370),\r\n"
				+ "(86, '01', 'sainte-croix-01', 'SAINTE-CROIX', 'sainte croix', 'Sainte-Croix', 'S53262', 'SNTKRKS', '01120', '342', '01342', 2, '20', 6, 534, 468, 500, 50, 10.62, 5.05195, 45.8942, '3017', '50994', '+50307', '455339', 229, 294),\r\n"
				+ "(87, '01', 'blyes', 'BLYES', 'blyes', 'Blyes', 'B420', 'BLYS', '01150', '047', '01047', 1, '17', 6, 886, 691, 900, 95, 9.32, 5.25, 45.85, '3236', '50941', '+51458', '455049', 199, 243),\r\n"
				+ "(88, '01', 'conzieu', 'CONZIEU', 'conzieu', 'Conzieu', 'C520', 'KNS', '01300', '117', '01117', 1, '04', 6, 135, 99, 100, 18, 7.2, 5.6, 45.7333, '3634', '50807', '+53626', '454334', 311, 1020),\r\n"
				+ "(89, '01', 'nievroz', 'NIEVROZ', 'nievroz', 'Niévroz', 'N162', 'NFRS', '01120', '276', '01276', 2, '20', 6, 1488, 1359, 1500, 142, 10.46, 5.06667, 45.8333, '3030', '50918', '+50350', '454935', 175, 197),\r\n"
				+ "(90, '01', 'nurieux-volognat', 'NURIEUX-VOLOGNAT', 'nurieux volognat', 'Nurieux-Volognat', 'N6214253', 'NRKSFLKNT', '01460', '267', '01267', 4, '16', 6, 1058, 952, 1100, 54, 19.34, 5.52667, 46.1856, '3544', '51317', '+53136', '461108', 448, 840),\r\n"
				+ "(91, '01', 'ambleon', 'AMBLEON', 'ambleon', 'Ambléon', 'A5145', 'AMLN', '01300', '006', '01006', 1, '04', 6, 116, 86, 100, 19, 5.88, 5.6, 45.75, '3627', '50833', '+53605', '454458', 330, 940),\r\n"
				+ "(92, '01', 'saint-maurice-de-gourdans', 'SAINT-MAURICE-DE-GOURDANS', 'saint maurice de gourdans', 'Saint-Maurice-de-Gourdans', 'S53562326352', 'SNTMRSTKRTNS', '01800', '378', '01378', 2, '19', 6, 2498, 1949, 2400, 98, 25.39, 5.2, 45.8167, '3176', '50913', '+51144', '454917', 182, 244),\r\n"
				+ "(93, '01', 'chezery-forens', 'CHEZERY-FORENS', 'chezery forens', 'Chézery-Forens', 'C61652', 'XSRFRNS', '01200', '104', '01104', 3, '12', 6, 434, 367, 400, 9, 46.57, 5.88333, 46.2167, '3922', '51357', '+55159', '461318', 435, 1692),\r\n"
				+ "(94, '01', 'sault-brenaz', 'SAULT-BRENAZ', 'sault brenaz', 'Sault-Brénaz', 'S431652', 'SLTBRNS', '01150', '396', '01396', 1, '17', 6, 1043, 974, 1100, 185, 5.61, 5.41667, 45.85, '3415', '50950', '+52436', '455119', 196, 660),\r\n"
				+ "(95, '01', 'murs-et-gelignieux', 'MURS-ET-GELIGNIEUX', 'murs et gelignieux', 'Murs-et-Gélignieux', 'M62324252', 'MRSTJLKNKS', '01300', '268', '01268', 1, '04', 6, 241, 204, 200, 37, 6.46, 5.66667, 45.6333, '3695', '50713', '+53943', '453829', 210, 460),\r\n"
				+ "(96, '01', 'petit-abergement', 'LE PETIT-ABERGEMENT', 'le petit abergement', 'Le Petit-Abergement', 'L1316253', 'LPTTBRJMNT', '01260', '292', '01292', 4, '06', 6, 138, 142, 100, 5, 26.95, 5.65, 46.0333, '3697', '51147', '+53949', '460157', 706, 1177),\r\n"
				+ "(97, '01', 'cormoz', 'CORMOZ', 'cormoz', 'Cormoz', 'C652', 'KRMS', '01560', '124', '01124', 2, '29', 6, 625, 512, 500, 31, 19.56, 5.23333, 46.45, '3217', '51610', '+51356', '462657', 187, 223),\r\n"
				+ "(98, '01', 'saint-martin-de-bavel', 'SAINT-MARTIN-DE-BAVEL', 'saint martin de bavel', 'Saint-Martin-de-Bavel', 'S535635314', 'SNTMRTNTBFL', '01510', '372', '01372', 1, '36', 6, 443, 333, 500, 52, 8.5, 5.68333, 45.85, '3712', '50944', '+54039', '455057', 249, 442),\r\n"
				+ "(99, '01', 'saint-trivier-de-courtes', 'SAINT-TRIVIER-DE-COURTES', 'saint trivier de courtes', 'Saint-Trivier-de-Courtes', 'S5361632632', 'SNTTRFRTKRTS', '01560', '388', '01388', 2, '29', 5, 1013, 963, 1000, 61, 16.53, 5.08333, 46.4667, '3050', '51622', '+50453', '462735', 184, 218),\r\n"
				+ "(100, '01', 'boyeux-saint-jerome', 'BOYEUX-SAINT-JEROME', 'boyeux saint jerome', 'Boyeux-Saint-Jérôme', 'B253265', 'BYKSSNTJRM', '01640', '056', '01056', 4, '24', 6, 321, 277, 300, 18, 16.94, 5.46667, 46.0333, '3467', '51144', '+52724', '460148', 329, 900),\r\n"
				
				+ "COMMIT;\r\n";
		
		try {
			stmt.executeUpdate(rqFriendship);
			stmt.executeUpdate(rqFriendshipIns);
			stmt.executeUpdate(rqStatus);
			stmt.executeUpdate(rqStatusIns);
			stmt.executeUpdate(rqUser);
			stmt.executeUpdate(rqNotif);
			stmt.executeUpdate(rqAct);
			stmt.executeUpdate(rqActIns);
			stmt.executeUpdate(rqCovid);
			stmt.executeUpdate(rqCovidIns);
			stmt.executeUpdate(rqLieu);
			stmt.executeUpdate(rqLieuIns);
			stmt.executeUpdate(rqVillesFr);
			stmt.executeUpdate(rqVillesFrIns);
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void insert() {
		
		
	}
}
