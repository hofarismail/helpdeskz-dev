-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Waktu pembuatan: 10 Sep 2023 pada 22.17
-- Versi server: 8.0.31
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helpdeskz`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `hdz_api`
--

DROP TABLE IF EXISTS `hdz_api`;
CREATE TABLE IF NOT EXISTS `hdz_api` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date` int NOT NULL DEFAULT '0',
  `last_update` int NOT NULL,
  `permissions` text,
  `ip_address` mediumtext,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hdz_articles`
--

DROP TABLE IF EXISTS `hdz_articles`;
CREATE TABLE IF NOT EXISTS `hdz_articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` text,
  `category` int DEFAULT '0',
  `staff_id` int NOT NULL DEFAULT '0',
  `date` int NOT NULL,
  `last_update` int NOT NULL DEFAULT '0',
  `views` int NOT NULL DEFAULT '0',
  `public` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `hdz_articles`
--

INSERT INTO `hdz_articles` (`id`, `title`, `content`, `category`, `staff_id`, `date`, `last_update`, `views`, `public`) VALUES
(1, 'Test', 'Test 123', 1, 1, 1693663518, 0, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hdz_attachments`
--

DROP TABLE IF EXISTS `hdz_attachments`;
CREATE TABLE IF NOT EXISTS `hdz_attachments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `enc` varchar(200) NOT NULL,
  `filetype` varchar(200) DEFAULT NULL,
  `article_id` int NOT NULL DEFAULT '0',
  `ticket_id` int NOT NULL DEFAULT '0',
  `msg_id` int NOT NULL DEFAULT '0',
  `filesize` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `msg_id` (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hdz_canned_response`
--

DROP TABLE IF EXISTS `hdz_canned_response`;
CREATE TABLE IF NOT EXISTS `hdz_canned_response` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `message` mediumtext,
  `position` int NOT NULL DEFAULT '1',
  `date` int NOT NULL DEFAULT '0',
  `last_update` int NOT NULL DEFAULT '0',
  `staff_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hdz_config`
--

DROP TABLE IF EXISTS `hdz_config`;
CREATE TABLE IF NOT EXISTS `hdz_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `windows_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `page_size` int NOT NULL DEFAULT '0',
  `date_format` varchar(100) DEFAULT NULL,
  `timezone` varchar(100) DEFAULT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance_message` text,
  `recaptcha` tinyint(1) NOT NULL DEFAULT '0',
  `recaptcha_sitekey` varchar(255) DEFAULT NULL,
  `recaptcha_privatekey` varchar(255) DEFAULT NULL,
  `login_attempt` int NOT NULL DEFAULT '0',
  `login_attempt_minutes` int NOT NULL DEFAULT '1',
  `reply_order` enum('asc','desc') NOT NULL DEFAULT 'asc',
  `tickets_page` int NOT NULL DEFAULT '1',
  `tickets_replies` int NOT NULL DEFAULT '1',
  `overdue_time` int NOT NULL DEFAULT '48',
  `ticket_autoclose` int NOT NULL DEFAULT '96',
  `ticket_attachment` tinyint(1) NOT NULL DEFAULT '0',
  `ticket_attachment_number` int NOT NULL DEFAULT '1',
  `ticket_file_size` double NOT NULL DEFAULT '2',
  `ticket_file_type` mediumtext,
  `kb_articles` int NOT NULL DEFAULT '4',
  `kb_maxchar` int NOT NULL DEFAULT '200',
  `kb_popular` int NOT NULL DEFAULT '4',
  `kb_latest` int NOT NULL DEFAULT '4',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `hdz_config`
--

INSERT INTO `hdz_config` (`id`, `logo`, `site_name`, `windows_title`, `page_size`, `date_format`, `timezone`, `maintenance`, `maintenance_message`, `recaptcha`, `recaptcha_sitekey`, `recaptcha_privatekey`, `login_attempt`, `login_attempt_minutes`, `reply_order`, `tickets_page`, `tickets_replies`, `overdue_time`, `ticket_autoclose`, `ticket_attachment`, `ticket_attachment_number`, `ticket_file_size`, `ticket_file_type`, `kb_articles`, `kb_maxchar`, `kb_popular`, `kb_latest`) VALUES
(1, '', 'Localhost', 'Localhost', 25, 'd F Y h:i a', 'America/Lima', 0, NULL, 0, '', '', 3, 5, 'desc', 15, 15, 48, 96, 1, 3, 2.5, 'a:3:{i:0;s:3:\"jpg\";i:1;s:3:\"png\";i:2;s:3:\"gif\";}', 2, 200, 3, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hdz_custom_fields`
--

DROP TABLE IF EXISTS `hdz_custom_fields`;
CREATE TABLE IF NOT EXISTS `hdz_custom_fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `departments` mediumtext,
  `display` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hdz_departments`
--

DROP TABLE IF EXISTS `hdz_departments`;
CREATE TABLE IF NOT EXISTS `hdz_departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dep_order` int NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `private` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `hdz_departments`
--

INSERT INTO `hdz_departments` (`id`, `dep_order`, `name`, `private`) VALUES
(1, 3, 'General', 0),
(2, 1, 'Advertising', 0),
(3, 2, 'Sales', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hdz_emails`
--

DROP TABLE IF EXISTS `hdz_emails`;
CREATE TABLE IF NOT EXISTS `hdz_emails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `department_id` int NOT NULL DEFAULT '0',
  `created` int NOT NULL DEFAULT '0',
  `last_update` int NOT NULL DEFAULT '0',
  `outgoing_type` enum('php','smtp') NOT NULL,
  `smtp_host` varchar(200) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT NULL,
  `smtp_encryption` varchar(10) DEFAULT NULL,
  `smtp_username` varchar(200) DEFAULT NULL,
  `smtp_password` varchar(200) DEFAULT NULL,
  `incoming_type` varchar(10) DEFAULT NULL,
  `imap_host` varchar(200) DEFAULT NULL,
  `imap_port` varchar(10) DEFAULT NULL,
  `imap_username` varchar(200) DEFAULT NULL,
  `imap_password` varchar(200) DEFAULT NULL,
  `imap_minutes` double NOT NULL DEFAULT '5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `hdz_emails`
--

INSERT INTO `hdz_emails` (`id`, `default`, `name`, `email`, `department_id`, `created`, `last_update`, `outgoing_type`, `smtp_host`, `smtp_port`, `smtp_encryption`, `smtp_username`, `smtp_password`, `incoming_type`, `imap_host`, `imap_port`, `imap_username`, `imap_password`, `imap_minutes`) VALUES
(1, 1, 'Localhost', 'support@localhost', 1, 1693642796, 0, 'php', 'mail.gmail.com', '587', 'tls', 'username@gmail.com', '', '', '', '', '', '', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hdz_emails_tpl`
--

DROP TABLE IF EXISTS `hdz_emails_tpl`;
CREATE TABLE IF NOT EXISTS `hdz_emails_tpl` (
  `id` varchar(255) NOT NULL,
  `position` smallint NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` mediumtext NOT NULL,
  `last_update` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `hdz_emails_tpl`
--

INSERT INTO `hdz_emails_tpl` (`id`, `position`, `name`, `subject`, `message`, `last_update`, `status`) VALUES
('autoresponse', 4, 'New Message Autoresponse', '[#%ticket_id%] %ticket_subject%', '<p>Dear %client_name%,</p>\r\n<p>Your reply to support request #%ticket_id% has been noted.</p>\r\n<p>Ticket Details <br />--------------------<br />Ticket ID: %ticket_id% <br />Department: %ticket_department% <br />Status: %ticket_status% <br />Priority: %ticket_priority% <br />Helpdesk: %support_url%</p>', 0, 0),
('lost_password', 2, 'Lost password confirmation', 'Password recovery for %company_name%', '<p>We have received a request to reset your account password for the %company_name% helpdesk (%helpdesk_url%).</p>\r\n<p>Your new passsword is: %client_password%</p>\r\n<p>Thank you, <br />%company_name% <br />Helpdesk: %support_url%</p>', 0, 2),
('new_ticket', 3, 'New ticket creation', '[#%ticket_id%] %ticket_subject%', '<p>Dear %client_name%,</p>\r\n<p>Thank you for contacting us. This is an automated response confirming the receipt of your ticket. One of our agents will get back to you as soon as possible.</p>\r\n<p>For your records, the details of the ticket are listed below. When replying, please make sure that the ticket ID is kept in the subject line to ensure that your replies are tracked appropriately.</p>\r\n<p>Ticket ID: %ticket_id% <br />Subject: %ticket_subject% <br />Department: %ticket_department% <br />Status: %ticket_status% <br />Priority: %ticket_priority%</p>\r\n<p>You can check the status of or reply to this ticket online at: %support_url%</p>\r\n<p>Regards, <br />%company_name%</p>', 0, 1),
('new_user', 1, 'Welcome email registration', 'Welcome to %company_name% helpdesk', '<p>Hello,</p>\r\n<p>This email is confirmation that you are now registered at our helpdesk.</p>\r\n<p><strong>Registered email:</strong> %client_email% <br /><strong>Password:</strong> %client_password%</p>\r\n<p>You can visit the helpdesk to browse articles and contact us at any time:</p>\r\n<p>%support_url%</p>\r\n<p>Thank you for registering!</p>\r\n<p>%company_name%<br />Helpdesk: %support_url%</p>', 0, 1),
('staff_reply', 5, 'Staff Reply', 'Re: [#%ticket_id%] %ticket_subject%', '<p>%message% </p>\r\n<p>-------------------------------------------------------------<br />Ticket Details<br />-------------------------------------------------------------<br /><strong>Ticket ID:</strong> %ticket_id% <br /><strong>Department:</strong> %ticket_department% <br /><strong>Status:</strong> %ticket_status% <br /><strong>Priority:</strong> %ticket_priority% <br /><strong>Helpdesk:</strong> %support_url%</p>', 0, 2),
('staff_ticketnotification', 6, 'New ticket notification to staff', 'New ticket notification', '<p>Dear %staff_name%,</p>\r\n<p>A new ticket has been created in department assigned for you, please login to staff panel to answer it.</p>\r\n<p>Ticket Details<br />-------------------<br />Ticket ID: %ticket_id% <br />Department: %ticket_department% <br />Status: %ticket_status% <br />Priority: %ticket_priority% <br />Helpdesk: %support_url%</p>', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hdz_kb_category`
--

DROP TABLE IF EXISTS `hdz_kb_category`;
CREATE TABLE IF NOT EXISTS `hdz_kb_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `position` int NOT NULL,
  `parent` int NOT NULL DEFAULT '0',
  `public` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `hdz_kb_category`
--

INSERT INTO `hdz_kb_category` (`id`, `name`, `position`, `parent`, `public`) VALUES
(1, 'Test', 1, 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hdz_login_attempt`
--

DROP TABLE IF EXISTS `hdz_login_attempt`;
CREATE TABLE IF NOT EXISTS `hdz_login_attempt` (
  `ip` varchar(200) NOT NULL,
  `attempts` int NOT NULL DEFAULT '0',
  `date` int NOT NULL DEFAULT '0',
  UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hdz_login_log`
--

DROP TABLE IF EXISTS `hdz_login_log`;
CREATE TABLE IF NOT EXISTS `hdz_login_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` int NOT NULL,
  `staff_id` int NOT NULL DEFAULT '0',
  `ip` varchar(255) NOT NULL,
  `agent` varchar(255) NOT NULL,
  `success` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `hdz_login_log`
--

INSERT INTO `hdz_login_log` (`id`, `date`, `staff_id`, `ip`, `agent`, `success`) VALUES
(1, 1693642827, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.62', 1),
(2, 1693660803, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.62', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hdz_priority`
--

DROP TABLE IF EXISTS `hdz_priority`;
CREATE TABLE IF NOT EXISTS `hdz_priority` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(10) NOT NULL DEFAULT '#000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `hdz_priority`
--

INSERT INTO `hdz_priority` (`id`, `name`, `color`) VALUES
(1, 'Low', '#8A8A8A'),
(2, 'Medium', '#000000'),
(3, 'High', '#F07D18'),
(4, 'Urgent', '#E826C6'),
(5, 'Emergency', '#E06161'),
(6, 'Critical', '#FF0000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hdz_staff`
--

DROP TABLE IF EXISTS `hdz_staff`;
CREATE TABLE IF NOT EXISTS `hdz_staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `registration` int NOT NULL DEFAULT '0',
  `login` int NOT NULL DEFAULT '0',
  `last_login` int NOT NULL DEFAULT '0',
  `department` mediumtext,
  `timezone` varchar(255) DEFAULT NULL,
  `signature` longtext,
  `avatar` varchar(200) DEFAULT NULL,
  `two_factor` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `hdz_staff`
--

INSERT INTO `hdz_staff` (`id`, `username`, `password`, `fullname`, `email`, `token`, `registration`, `login`, `last_login`, `department`, `timezone`, `signature`, `avatar`, `two_factor`, `admin`, `active`) VALUES
(1, 'admin', '$2y$10$/Bhn4d/hkmZAB74tGv/svevDPSZE7JCNs4Iw/codCFGYCU27pjYbu', 'Administrator', 'admin@gmail.com', '88dec71db9ad7cdc0fdcdf5c9740e45f6cb71a8e', 1693642796, 1693660803, 1693642827, NULL, NULL, NULL, NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hdz_tickets`
--

DROP TABLE IF EXISTS `hdz_tickets`;
CREATE TABLE IF NOT EXISTS `hdz_tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `department_id` int NOT NULL DEFAULT '0',
  `priority_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `date` int NOT NULL DEFAULT '0',
  `last_update` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL DEFAULT '1',
  `replies` int NOT NULL DEFAULT '0',
  `last_replier` tinyint(1) DEFAULT '0',
  `custom_vars` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hdz_tickets_messages`
--

DROP TABLE IF EXISTS `hdz_tickets_messages`;
CREATE TABLE IF NOT EXISTS `hdz_tickets_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int NOT NULL DEFAULT '0',
  `date` int NOT NULL DEFAULT '0',
  `customer` int NOT NULL DEFAULT '1',
  `staff_id` int NOT NULL DEFAULT '0',
  `message` text,
  `ip` varchar(255) DEFAULT NULL,
  `email` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hdz_ticket_notes`
--

DROP TABLE IF EXISTS `hdz_ticket_notes`;
CREATE TABLE IF NOT EXISTS `hdz_ticket_notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int NOT NULL,
  `staff_id` int NOT NULL,
  `date` int NOT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hdz_users`
--

DROP TABLE IF EXISTS `hdz_users`;
CREATE TABLE IF NOT EXISTS `hdz_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(250) NOT NULL DEFAULT 'Guest',
  `email` varchar(250) NOT NULL,
  `password` varchar(150) NOT NULL,
  `registration` int NOT NULL DEFAULT '0',
  `last_login` int NOT NULL DEFAULT '0',
  `token` varchar(255) DEFAULT NULL,
  `timezone` varchar(200) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
