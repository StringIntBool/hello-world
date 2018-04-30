-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Máquina: 127.0.0.1
-- Data de Criação: 09-Abr-2018 às 21:37
-- Versão do servidor: 5.5.10
-- versão do PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `livresc rp`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `cod_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome_cliente` varchar(30) NOT NULL,
  `idade` int(11) NOT NULL,
  `data_nascimento` date NOT NULL,
  `BI` int(11) NOT NULL,
  `email` varchar(35) NOT NULL,
  `password` varchar(40) NOT NULL,
  `tipo` varchar(3) NOT NULL,
  `foto` varchar(5000) NOT NULL,
  PRIMARY KEY (`cod_cliente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`cod_cliente`, `nome_cliente`, `idade`, `data_nascimento`, `BI`, `email`, `password`, `tipo`, `foto`) VALUES
(3, 'Miguel Silva', 17, '2000-05-13', 729847235, 'miguel@gmail.com', 'martins00', 'a', 'user1-128x128.jpg'),
(13, 'Tiago', 18, '2018-02-15', 123123213, 'tiago@gmail.com', 't123', 'u', 'user-tiago.jpg'),
(15, 'Catarina', 17, '2000-04-30', 1234567890, 'catarina@gmail.com', '1234', 'u', 'qwerty.jpg'),
(16, 'Diogo Alberto Santos Marques', 18, '2000-01-01', 2147483647, 'diogo@gmail.com', '12345', 'a', 'perfil.jpg'),
(17, 'Miguel Silva', 19, '1998-03-17', 2147483647, 'miguel1@gmail.com', '1234', 'u', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `det_requisicao`
--

CREATE TABLE IF NOT EXISTS `det_requisicao` (
  `isbn` int(11) NOT NULL,
  `cod_requisicao` int(11) NOT NULL,
  KEY `isbn` (`isbn`,`cod_requisicao`),
  KEY `cod_requisicao` (`cod_requisicao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `det_requisicao`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `doacao`
--

CREATE TABLE IF NOT EXISTS `doacao` (
  `cod_doacao` int(11) NOT NULL AUTO_INCREMENT,
  `cod_cliente` int(11) NOT NULL,
  `quant_doacao` int(11) NOT NULL,
  `cod_tp_doacao` int(11) NOT NULL,
  `isbn` int(11) NOT NULL,
  PRIMARY KEY (`cod_doacao`),
  KEY `cod_cliente` (`cod_cliente`),
  KEY `cod_tp_doacao` (`cod_tp_doacao`),
  KEY `isbn` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `doacao`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `editora`
--

CREATE TABLE IF NOT EXISTS `editora` (
  `cod_editora` int(11) NOT NULL AUTO_INCREMENT,
  `nome_editora` varchar(35) NOT NULL,
  PRIMARY KEY (`cod_editora`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `editora`
--

INSERT INTO `editora` (`cod_editora`, `nome_editora`) VALUES
(1, 'Porto Editora'),
(2, 'ASA (Grupo Leya)');

-- --------------------------------------------------------

--
-- Estrutura da tabela `eventos`
--

CREATE TABLE IF NOT EXISTS `eventos` (
  `cod_evento` int(11) NOT NULL AUTO_INCREMENT,
  `tema` varchar(30) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`cod_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `eventos`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `livros`
--

CREATE TABLE IF NOT EXISTS `livros` (
  `isbn` int(25) NOT NULL,
  `nome_livro` varchar(35) NOT NULL,
  `cod_tp_livro` int(11) NOT NULL,
  `cod_editora` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `quant` int(200) NOT NULL,
  PRIMARY KEY (`isbn`),
  KEY `cod_editora` (`cod_editora`),
  KEY `cod_tp_livro` (`cod_tp_livro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `livros`
--

INSERT INTO `livros` (`isbn`, `nome_livro`, `cod_tp_livro`, `cod_editora`, `foto`, `quant`) VALUES
(11223344, 'HistÃ³ria de Portugal II', 2, 1, '88897-historia-de-portugal.jpg', 9),
(111222333, 'MatemÃ¡tica - Novo EspaÃ§o', 2, 1, '18952-mat_11.jpg', 4),
(378127731, 'Matematica (Funcoes de Crescimento)', 1, 1, 'mat.jpg', 18),
(2147483647, 'MatemÃ¡tica A10', 1, 2, 'mat_a10.jpg', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacao_auto`
--

CREATE TABLE IF NOT EXISTS `notificacao_auto` (
  `cod_notificacao` int(11) NOT NULL AUTO_INCREMENT,
  `notificacao` varchar(1000) NOT NULL,
  `destinatario` int(11) NOT NULL,
  `cod_cliente` int(100) NOT NULL,
  `visto` varchar(11) NOT NULL,
  `manual` varchar(100) NOT NULL,
  PRIMARY KEY (`cod_notificacao`),
  KEY `cod_cliente` (`cod_cliente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Extraindo dados da tabela `notificacao_auto`
--

INSERT INTO `notificacao_auto` (`cod_notificacao`, `notificacao`, `destinatario`, `cod_cliente`, `visto`, `manual`) VALUES
(38, 'Por favor entregue o livro HistÃ³ria de Portugal II quando jÃ¡ nÃ£o precisar dele! Obrigado.', 15, 3, '0', 'HistÃ³ria de Portugal II'),
(39, 'Por favor entregue o livro MatemÃ¡tica - Novo EspaÃ§o quando jÃ¡ nÃ£o precisar dele! Obrigado.', 15, 3, '0', 'MatemÃ¡tica - Novo EspaÃ§o'),
(41, 'Por favor entregue o livro Matematica (Funcoes de Crescimento) quando jÃ¡ nÃ£o precisar dele! Obrigado.', 13, 16, '0', 'Matematica (Funcoes de Crescimento)'),
(44, 'Por favor entregue o livro MatemÃ¡tica A10 quando jÃ¡ nÃ£o precisar dele! Obrigado.', 13, 3, 'admin', 'MatemÃ¡tica A10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `requisicao`
--

CREATE TABLE IF NOT EXISTS `requisicao` (
  `cod_requesicao` int(11) NOT NULL AUTO_INCREMENT,
  `cod_cliente` int(11) NOT NULL,
  `cod_tp_requisicao` int(11) NOT NULL,
  `quant_requisicao` int(11) NOT NULL,
  `isbn` int(11) NOT NULL,
  `hora` varchar(200) NOT NULL,
  PRIMARY KEY (`cod_requesicao`),
  KEY `cod_cliente` (`cod_cliente`),
  KEY `cod_tp_requisicao` (`cod_tp_requisicao`),
  KEY `isbn` (`isbn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=66 ;

--
-- Extraindo dados da tabela `requisicao`
--

INSERT INTO `requisicao` (`cod_requesicao`, `cod_cliente`, `cod_tp_requisicao`, `quant_requisicao`, `isbn`, `hora`) VALUES
(55, 13, 2, 1, 11223344, '8:25 - 9:55'),
(56, 13, 2, 1, 378127731, '11:50 - 13:20'),
(57, 13, 2, 1, 111222333, '15:15 - 16:45'),
(58, 15, 2, 1, 11223344, '10:10 - 11:40'),
(61, 15, 1, 1, 378127731, '10:10 - 11:40'),
(62, 15, 2, 1, 111222333, '17:00 - 18:30');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tp_doacao`
--

CREATE TABLE IF NOT EXISTS `tp_doacao` (
  `cod_tp_doacao` int(11) NOT NULL AUTO_INCREMENT,
  `nome_tp_doacao` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_tp_doacao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tp_doacao`
--

INSERT INTO `tp_doacao` (`cod_tp_doacao`, `nome_tp_doacao`) VALUES
(1, 'Anónima'),
(2, 'Com Remetente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tp_livro`
--

CREATE TABLE IF NOT EXISTS `tp_livro` (
  `cod_tp_livro` int(11) NOT NULL AUTO_INCREMENT,
  `nome_tp_livro` varchar(35) NOT NULL,
  PRIMARY KEY (`cod_tp_livro`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tp_livro`
--

INSERT INTO `tp_livro` (`cod_tp_livro`, `nome_tp_livro`) VALUES
(1, 'Ensino Profissional'),
(2, 'Ensino Regular');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tp_requisicao`
--

CREATE TABLE IF NOT EXISTS `tp_requisicao` (
  `cod_tp_requisicao` int(11) NOT NULL AUTO_INCREMENT,
  `nome_tp_requisicao` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_tp_requisicao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tp_requisicao`
--

INSERT INTO `tp_requisicao` (`cod_tp_requisicao`, `nome_tp_requisicao`) VALUES
(1, 'Ano Letivo'),
(2, 'Aula');

-- --------------------------------------------------------

--
-- Estrutura da tabela `uploads`
--

CREATE TABLE IF NOT EXISTS `uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ficheiro` varchar(100) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `tamanho` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ficheiro` (`ficheiro`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Extraindo dados da tabela `uploads`
--

INSERT INTO `uploads` (`id`, `ficheiro`, `tipo`, `tamanho`) VALUES
(1, '33780-17574-koala.jpg', 'image/jpeg', 763),
(2, '17336-23997-penguins.jpg', 'image/jpeg', 760),
(3, '27792-23997-penguins.jpg', 'image/jpeg', 760),
(4, '93456-17574-koala.jpg', 'image/jpeg', 763),
(5, '12021-23516227_1520758227991547_484752304_o.jpg', 'image/jpeg', 69),
(6, '89039-23516227_1520758227991547_484752304_o.jpg', 'image/jpeg', 69),
(7, '6078-23516227_1520758227991547_484752304_o.jpg', 'image/jpeg', 69),
(8, '18952-mat_11.jpg', 'image/jpeg', 34),
(9, '29125-27792-23997-penguins.jpg', 'image/jpeg', 760),
(10, '2407-13668-lara-fabian.jpg', 'image/jpeg', 1209),
(11, '60781-13668-lara-fabian.jpg', 'image/jpeg', 1209),
(12, '38977-27792-23997-penguins.jpg', 'image/jpeg', 760),
(13, '4320-27792-23997-penguins.jpg', 'image/jpeg', 760),
(14, '50343-33780-17574-koala.jpg', 'image/jpeg', 763),
(16, '17556-27792-23997-penguins.jpg', 'image/jpeg', 760),
(17, '94713-27792-23997-penguins.jpg', 'image/jpeg', 760),
(18, '15777-27792-23997-penguins.jpg', 'image/jpeg', 760),
(19, '10837-27792-23997-penguins.jpg', 'image/jpeg', 760),
(20, '90067-27792-23997-penguins.jpg', 'image/jpeg', 760),
(21, '64827-27792-23997-penguins.jpg', 'image/jpeg', 760);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `det_requisicao`
--
ALTER TABLE `det_requisicao`
  ADD CONSTRAINT `det_requisicao_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `livros` (`isbn`),
  ADD CONSTRAINT `det_requisicao_ibfk_2` FOREIGN KEY (`cod_requisicao`) REFERENCES `requisicao` (`cod_requesicao`);

--
-- Limitadores para a tabela `doacao`
--
ALTER TABLE `doacao`
  ADD CONSTRAINT `doacao_ibfk_1` FOREIGN KEY (`cod_cliente`) REFERENCES `clientes` (`cod_cliente`),
  ADD CONSTRAINT `doacao_ibfk_2` FOREIGN KEY (`cod_tp_doacao`) REFERENCES `tp_doacao` (`cod_tp_doacao`),
  ADD CONSTRAINT `doacao_ibfk_3` FOREIGN KEY (`isbn`) REFERENCES `livros` (`isbn`);

--
-- Limitadores para a tabela `livros`
--
ALTER TABLE `livros`
  ADD CONSTRAINT `livros_ibfk_1` FOREIGN KEY (`cod_tp_livro`) REFERENCES `tp_livro` (`cod_tp_livro`),
  ADD CONSTRAINT `livros_ibfk_2` FOREIGN KEY (`cod_editora`) REFERENCES `editora` (`cod_editora`);

--
-- Limitadores para a tabela `notificacao_auto`
--
ALTER TABLE `notificacao_auto`
  ADD CONSTRAINT `notificacao_auto_ibfk_1` FOREIGN KEY (`cod_cliente`) REFERENCES `clientes` (`cod_cliente`);

--
-- Limitadores para a tabela `requisicao`
--
ALTER TABLE `requisicao`
  ADD CONSTRAINT `requisicao_ibfk_1` FOREIGN KEY (`cod_cliente`) REFERENCES `clientes` (`cod_cliente`),
  ADD CONSTRAINT `requisicao_ibfk_2` FOREIGN KEY (`cod_tp_requisicao`) REFERENCES `tp_requisicao` (`cod_tp_requisicao`),
  ADD CONSTRAINT `requisicao_ibfk_3` FOREIGN KEY (`isbn`) REFERENCES `livros` (`isbn`);
