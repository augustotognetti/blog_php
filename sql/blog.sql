-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.28-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para blog
CREATE DATABASE IF NOT EXISTS `blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `blog`;

-- Copiando estrutura para tabela blog.conteudo
CREATE TABLE IF NOT EXISTS `conteudo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `corpo` varchar(750) DEFAULT NULL,
  `titulo` varchar(125) DEFAULT NULL,
  `subtitulo` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela blog.conteudo: ~4 rows (aproximadamente)
DELETE FROM `conteudo`;
INSERT INTO `conteudo` (`id`, `corpo`, `titulo`, `subtitulo`) VALUES
	(1, 'Pesquisa do Datafolha divulgada na manhã deste domingo (17) mostra que 88% dos paulistanos são a favor do uso de câmeras por policiais em seus uniformes. Apenas 8% dos entrevistados na cidade de São Paulo foram contrários às câmeras, e 3% responderam que são indiferentes em relação ao tema.\r\nA pesquisa entrevistou 1.090 pessoas entre 7 e 8 de março deste ano. A margem de erro é de três pontos percentuais para mais ou para menos.', 'Datafolha: 88% dos paulistanos são a favor do uso de câmera corporal no uniforme de policiais', 'Pesquisa do Datafolha ouviu 1.090 pessoas entre os dias 7 e 8 de março, e tem margem de erro de três pontos percentuais para mais ou para menos.'),
	(2, 'Uma idosa de 103 anos foi flagrada por policiais dirigindo à noite com a carteira de habilitação vencida, segundo comunicado da polícia recebido pela agência AFP nesta quinta-feira (14). O caso aconteceu na Itália e a mulher teve seu carro apreendido. É #FATO. Na madrugada de segunda-feira (11), a polícia recebeu uma denúncia alertando sobre um veículo que circulava de maneira perigosa no centro de Bondeno, uma cidade de 13 mil habitantes no norte da Itália, a cerca de 440 quilômetros da capital Roma.', 'É #FATO: Polícia flagra idosa de 103 anos dirigindo à noite com a habilitação vencida na Itália', 'Com o documento vencido há dois anos, Giuseppina Molinari foi multada e teve seu carro apreendido, segundo a imprensa local. '),
	(3, 'Anthony Joubert, 37, pulou no rio para tentar tirar o enrosco de uma linha de pesca e acabou atacado pelo crocodilo. Segundo o jornal britânico The Mirror, o réptil tinha cerca de quatro metros de comprimento.\n\nAnnalisa, esposa de Anthony, pulou no lago e começou a duelar com o animal até que o crocodilo soltasse seu marido. "Salvei a vida dele e não sei como fiz isso. Eu estava em choque severo. Metade do meu marido estava dentro de um crocodilo gigante", disse ao Mirror.\n\nAnthony foi levado às pressas para um pronto-socorro público, e em seguida conduzido a um hospital particular. Segundo os médicos, seu quadro é estável.', 'Mulher luta com crocodilo de 4 metros e salva marido na África do Sul', 'Um homem foi salvo de ser devorado por um crocodilo graças à reação de sua esposa, que lutou com o animal em um lago na África'),
	(4, 'O Brasil passou de 1,8 milhão de casos (prováveis e confirmados) de dengue em 2024. Segundo dados do Painel de Arboviroses do Ministério da Saúde atualizados nesta segunda-feira (18), o país registrou 1.889.206 casos nas primeiras onze semanas deste ano, uma taxa inédita.\r\nEste é o maior número desde o início da série histórica, em 2000. O recorde anterior de casos prováveis ocorreu em 2015, com 1.688.688. Já o terceiro ano com maior número foi 2023 com 1.658.816.', 'Brasil bate recorde histórico de casos de dengue em 2024', 'Este ano, foram registrados 1.889.206 casos prováveis da doença, maior número desde o início da série histórica, em 2000.');

-- Copiando estrutura para tabela blog.data
CREATE TABLE IF NOT EXISTS `data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela blog.data: ~3 rows (aproximadamente)
DELETE FROM `data`;
INSERT INTO `data` (`id`, `data`) VALUES
	(1, '2024-03-17'),
	(2, '2024-03-14'),
	(3, '2024-03-18');

-- Copiando estrutura para tabela blog.imagem
CREATE TABLE IF NOT EXISTS `imagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caminho` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela blog.imagem: ~4 rows (aproximadamente)
DELETE FROM `imagem`;
INSERT INTO `imagem` (`id`, `caminho`) VALUES
	(1, 'idosa.png'),
	(2, 'policial.png'),
	(3, 'crocodilo.png'),
	(4, 'aedes.png');

-- Copiando estrutura para tabela blog.noticia
CREATE TABLE IF NOT EXISTS `noticia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_data` int(11) DEFAULT NULL,
  `id_conteudo` int(11) DEFAULT NULL,
  `id_imagem` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_data` (`id_data`),
  KEY `id_conteudo` (`id_conteudo`),
  KEY `id_imagem` (`id_imagem`),
  CONSTRAINT `id_conteudo` FOREIGN KEY (`id_conteudo`) REFERENCES `conteudo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_data` FOREIGN KEY (`id_data`) REFERENCES `data` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_imagem` FOREIGN KEY (`id_imagem`) REFERENCES `imagem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela blog.noticia: ~4 rows (aproximadamente)
DELETE FROM `noticia`;
INSERT INTO `noticia` (`id`, `id_data`, `id_conteudo`, `id_imagem`) VALUES
	(1, 2, 3, 3),
	(2, 1, 2, 1),
	(3, 1, 1, 2),
	(4, 3, 4, 4);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
