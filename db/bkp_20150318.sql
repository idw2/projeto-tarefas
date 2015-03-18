-- phpMyAdmin SQL Dump
-- version 3.3.10.4
-- http://www.phpmyadmin.net
--
-- Servidor: mysql.designlab.com.br
-- Tempo de Geração: Mar 18, 2015 as 09:45 AM
-- Versão do Servidor: 5.1.56
-- Versão do PHP: 5.4.37

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Banco de Dados: `dlab_tarefas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('250df04ec1e9ef0dc5dd7fe87b04aefa', '192.168.0.132', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36', 1426691678, 'a:4:{s:9:"user_data";s:0:"";s:6:"logged";b:1;s:4:"user";s:1:"1";s:5:"level";s:1:"1";}'),
('243858155a06c0a16c67159a559c70d5', '177.142.180.77', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36', 1426696839, 'a:4:{s:9:"user_data";s:0:"";s:4:"user";s:1:"7";s:5:"level";s:1:"1";s:6:"logged";b:1;}'),
('bfc0a0fc0e07dd2dc55c5617147ec5aa', '177.142.180.77', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2334.0 Safari/537.36', 1426695092, 'a:3:{s:9:"user_data";s:0:"";s:4:"user";s:1:"6";s:5:"level";s:1:"5";}'),
('936feafc0fe425e7b43a3898646dd1c8', '177.142.180.77', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36', 1426696926, 'a:4:{s:9:"user_data";s:0:"";s:6:"logged";b:1;s:4:"user";s:1:"3";s:5:"level";s:1:"4";}'),
('9cc976a72425ae23ede48d42f4c26067', '177.142.180.77', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36', 1426696930, 'a:4:{s:9:"user_data";s:0:"";s:6:"logged";b:1;s:4:"user";s:1:"8";s:5:"level";s:1:"6";}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `project`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `setting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(50) DEFAULT NULL,
  `setting_value` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`setting_id`),
  UNIQUE KEY `setting_name` (`setting_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `settings`
--

INSERT INTO `settings` (`setting_id`, `setting_name`, `setting_value`) VALUES
(1, 'database_version', '1.7'),
(2, 'stb_install_date', '2015-03-17 20:52:08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `task`
--

CREATE TABLE IF NOT EXISTS `task` (
  `task_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `code` int(10) unsigned NOT NULL,
  `status` tinyint(4) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `priority` tinyint(4) unsigned NOT NULL,
  `description` text NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `due_date` date NOT NULL,
  PRIMARY KEY (`task_id`),
  KEY `status` (`project_id`,`status`),
  KEY `parent` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `task`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `task_comments`
--

CREATE TABLE IF NOT EXISTS `task_comments` (
  `task_comments_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `comment` text NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`task_comments_id`),
  KEY `task` (`task_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `task_comments`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `task_history`
--

CREATE TABLE IF NOT EXISTS `task_history` (
  `task_history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `status` tinyint(4) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_finished` datetime DEFAULT NULL,
  `duration` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`task_history_id`),
  KEY `task` (`task_id`,`status`),
  KEY `user` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Extraindo dados da tabela `task_history`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `links` text,
  `photo` varchar(255) DEFAULT NULL,
  `github_username` varchar(100) DEFAULT NULL,
  `github_token` varchar(40) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(40) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id`, `name`, `links`, `photo`, `github_username`, `github_token`, `email`, `password`, `level`, `date_created`) VALUES
(1, 'Rogerio Pontes', '[]', '2014-05-26_13.10_.02_.jpg', NULL, NULL, 'rogerio@designlab.com.br', '0b48b9bb51f7c243b2649c0863db78bfcf467d98', 4, '2015-03-17 12:50:58'),
(2, 'João Ahmad', '[]', '1525288_575964552503025_3994935429064183375_n.jpg', NULL, NULL, 'joao@designlab.com.br', '0c42d89623139a57050289206d104ffd99a0e417', 3, '2015-03-17 12:52:48'),
(3, 'Thiago Lima', '[]', NULL, NULL, NULL, 'thiago@designlab.com.br', '95c654514430f72edc3a837acf605b4f8abbe058', 4, '2015-03-17 12:53:12'),
(4, 'Luiz Gustavo', '[]', 'gustavo.png', NULL, NULL, 'gustavo@designlab.com.br', '0c42d89623139a57050289206d104ffd99a0e417', 2, '2015-03-17 13:28:42'),
(5, 'Daniel Lessa', '[]', 'daniel.png', NULL, NULL, 'daniel@designlab.com.br', '0c42d89623139a57050289206d104ffd99a0e417', 2, '2015-03-17 13:34:16'),
(6, 'Karina Sant''Anna', '[]', '10300499_674885992547084_996493686296065792_n.jpg', NULL, NULL, 'karina@designlab.com.br', '0c42d89623139a57050289206d104ffd99a0e417', 5, '2015-03-18 09:12:07'),
(7, 'DesignLab', '[]', 'dl.png', NULL, NULL, 'contato@designlab.com.br', '768592297878d038b957ab4e56b5f248a5896e35', 1, '2015-03-18 09:14:35'),
(8, 'Cássio Lemos', '[]', '67322_135266669859301_6970921_n.jpg', NULL, NULL, 'cassio@designlab.com.br', '0c42d89623139a57050289206d104ffd99a0e417', 6, '2015-03-18 09:15:19');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_project`
--

CREATE TABLE IF NOT EXISTS `user_project` (
  `user` int(10) unsigned NOT NULL,
  `project` int(10) unsigned NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user`,`project`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `user_project`
--

INSERT INTO `user_project` (`user`, `project`, `date_created`) VALUES
(1, 4, '2015-03-17 14:38:05'),
(1, 5, '2015-03-18 06:58:45'),
(1, 6, '2015-03-18 07:00:28'),
(2, 5, '2015-03-18 06:58:45'),
(2, 6, '2015-03-18 07:00:28'),
(3, 5, '2015-03-18 06:58:45'),
(3, 6, '2015-03-18 07:00:28'),
(4, 5, '2015-03-18 06:58:45'),
(4, 6, '2015-03-18 07:00:28'),
(5, 5, '2015-03-18 06:58:45'),
(5, 6, '2015-03-18 07:00:28');

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_stbfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `task_stbfk_2` FOREIGN KEY (`parent_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para a tabela `task_comments`
--
ALTER TABLE `task_comments`
  ADD CONSTRAINT `task_comments_stbfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para a tabela `task_history`
--
ALTER TABLE `task_history`
  ADD CONSTRAINT `task_history_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `task_history_stbfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
