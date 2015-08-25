-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 25, 2015 at 06:23 AM
-- Server version: 5.5.44-0ubuntu0.14.04.1
-- PHP Version: 5.5.27-1+deb.sury.org~trusty+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `images`
--

-- --------------------------------------------------------

--
-- Table structure for table `4images_categories`
--

CREATE TABLE IF NOT EXISTS `4images_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `cat_description` text NOT NULL,
  `cat_parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_order` int(10) unsigned NOT NULL DEFAULT '0',
  `auth_viewcat` tinyint(2) NOT NULL DEFAULT '0',
  `auth_viewimage` tinyint(2) NOT NULL DEFAULT '0',
  `auth_download` tinyint(2) NOT NULL DEFAULT '0',
  `auth_upload` tinyint(2) NOT NULL DEFAULT '0',
  `auth_directupload` tinyint(2) NOT NULL DEFAULT '0',
  `auth_vote` tinyint(2) NOT NULL DEFAULT '0',
  `auth_sendpostcard` tinyint(2) NOT NULL DEFAULT '0',
  `auth_readcomment` tinyint(2) NOT NULL DEFAULT '0',
  `auth_postcomment` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  KEY `cat_parent_id` (`cat_parent_id`),
  KEY `cat_order` (`cat_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `4images_categories`
--

INSERT INTO `4images_categories` (`cat_id`, `cat_name`, `cat_description`, `cat_parent_id`, `cat_hits`, `cat_order`, `auth_viewcat`, `auth_viewimage`, `auth_download`, `auth_upload`, `auth_directupload`, `auth_vote`, `auth_sendpostcard`, `auth_readcomment`, `auth_postcomment`) VALUES
(1, 'images', '', 0, 0, 10, 0, 0, 2, 2, 9, 0, 0, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `4images_comments`
--

CREATE TABLE IF NOT EXISTS `4images_comments` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(100) NOT NULL DEFAULT '',
  `comment_headline` varchar(255) NOT NULL DEFAULT '',
  `comment_text` text NOT NULL,
  `comment_ip` varchar(20) NOT NULL DEFAULT '',
  `comment_date` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `image_id` (`image_id`),
  KEY `user_id` (`user_id`),
  KEY `comment_date` (`comment_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `4images_groupaccess`
--

CREATE TABLE IF NOT EXISTS `4images_groupaccess` (
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_id` int(10) unsigned NOT NULL DEFAULT '0',
  `auth_viewcat` tinyint(1) NOT NULL DEFAULT '0',
  `auth_viewimage` tinyint(1) NOT NULL DEFAULT '0',
  `auth_download` tinyint(1) NOT NULL DEFAULT '0',
  `auth_upload` tinyint(1) NOT NULL DEFAULT '0',
  `auth_directupload` tinyint(1) NOT NULL DEFAULT '0',
  `auth_vote` tinyint(1) NOT NULL DEFAULT '0',
  `auth_sendpostcard` tinyint(1) NOT NULL DEFAULT '0',
  `auth_readcomment` tinyint(1) NOT NULL DEFAULT '0',
  `auth_postcomment` tinyint(1) NOT NULL DEFAULT '0',
  KEY `group_id` (`group_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `4images_groupmatch`
--

CREATE TABLE IF NOT EXISTS `4images_groupmatch` (
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `groupmatch_startdate` int(11) unsigned NOT NULL DEFAULT '0',
  `groupmatch_enddate` int(11) unsigned NOT NULL DEFAULT '0',
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `4images_groups`
--

CREATE TABLE IF NOT EXISTS `4images_groups` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL DEFAULT '',
  `group_type` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `4images_images`
--

CREATE TABLE IF NOT EXISTS `4images_images` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `image_name` varchar(255) NOT NULL DEFAULT '',
  `image_description` text NOT NULL,
  `image_keywords` text NOT NULL,
  `image_date` int(11) unsigned NOT NULL DEFAULT '0',
  `image_active` tinyint(1) NOT NULL DEFAULT '1',
  `image_media_file` varchar(255) NOT NULL DEFAULT '',
  `image_thumb_file` varchar(255) NOT NULL DEFAULT '',
  `image_download_url` varchar(255) NOT NULL DEFAULT '',
  `image_allow_comments` tinyint(1) NOT NULL DEFAULT '1',
  `image_comments` int(10) unsigned NOT NULL DEFAULT '0',
  `image_downloads` int(10) unsigned NOT NULL DEFAULT '0',
  `image_votes` int(10) unsigned NOT NULL DEFAULT '0',
  `image_rating` decimal(4,2) NOT NULL DEFAULT '0.00',
  `image_hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`image_id`),
  KEY `cat_id` (`cat_id`),
  KEY `user_id` (`user_id`),
  KEY `image_date` (`image_date`),
  KEY `image_active` (`image_active`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `4images_images_temp`
--

CREATE TABLE IF NOT EXISTS `4images_images_temp` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `image_name` varchar(255) NOT NULL DEFAULT '',
  `image_description` text NOT NULL,
  `image_keywords` text NOT NULL,
  `image_date` int(11) unsigned NOT NULL DEFAULT '0',
  `image_media_file` varchar(255) NOT NULL DEFAULT '',
  `image_thumb_file` varchar(255) NOT NULL DEFAULT '',
  `image_download_url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`image_id`),
  KEY `cat_id` (`cat_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `4images_lightboxes`
--

CREATE TABLE IF NOT EXISTS `4images_lightboxes` (
  `lightbox_id` varchar(32) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `lightbox_lastaction` int(11) unsigned NOT NULL DEFAULT '0',
  `lightbox_image_ids` text,
  KEY `lightbox_id` (`lightbox_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `4images_lightboxes`
--

INSERT INTO `4images_lightboxes` (`lightbox_id`, `user_id`, `lightbox_lastaction`, `lightbox_image_ids`) VALUES
('a80c4f9e1a84163fc17a99aa87c6d3f5', 1, 1440507262, '');

-- --------------------------------------------------------

--
-- Table structure for table `4images_postcards`
--

CREATE TABLE IF NOT EXISTS `4images_postcards` (
  `postcard_id` varchar(32) NOT NULL DEFAULT '',
  `image_id` int(10) unsigned NOT NULL DEFAULT '0',
  `postcard_date` int(11) unsigned NOT NULL DEFAULT '0',
  `postcard_bg_color` varchar(100) NOT NULL DEFAULT '',
  `postcard_border_color` varchar(100) NOT NULL DEFAULT '',
  `postcard_font_color` varchar(100) NOT NULL DEFAULT '',
  `postcard_font_face` varchar(100) NOT NULL DEFAULT '',
  `postcard_sender_name` varchar(255) NOT NULL DEFAULT '',
  `postcard_sender_email` varchar(255) NOT NULL DEFAULT '',
  `postcard_recipient_name` varchar(255) NOT NULL DEFAULT '',
  `postcard_recipient_email` varchar(255) NOT NULL DEFAULT '',
  `postcard_headline` varchar(255) NOT NULL DEFAULT '',
  `postcard_message` text NOT NULL,
  PRIMARY KEY (`postcard_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `4images_sessions`
--

CREATE TABLE IF NOT EXISTS `4images_sessions` (
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `session_user_id` int(11) NOT NULL DEFAULT '0',
  `session_lastaction` int(11) unsigned NOT NULL DEFAULT '0',
  `session_location` varchar(255) NOT NULL DEFAULT '',
  `session_ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `session_user_id` (`session_user_id`),
  KEY `session_id_ip_user_id` (`session_id`,`session_ip`,`session_user_id`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

--
-- Dumping data for table `4images_sessions`
--

INSERT INTO `4images_sessions` (`session_id`, `session_user_id`, `session_lastaction`, `session_location`, `session_ip`) VALUES
('fbb383d17c0831913830ad6f82fda2c2', 1, 1440508416, 'member.php', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `4images_sessionvars`
--

CREATE TABLE IF NOT EXISTS `4images_sessionvars` (
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `sessionvars_name` varchar(30) NOT NULL DEFAULT '',
  `sessionvars_value` text,
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `4images_settings`
--

CREATE TABLE IF NOT EXISTS `4images_settings` (
  `setting_name` varchar(255) NOT NULL DEFAULT '',
  `setting_value` mediumtext NOT NULL,
  PRIMARY KEY (`setting_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `4images_settings`
--

INSERT INTO `4images_settings` (`setting_name`, `setting_value`) VALUES
('site_name', '4images - Image Gallery Management System'),
('site_email', 'admin@yourdomain.com'),
('use_smtp', '0'),
('smtp_host', ''),
('smtp_username', ''),
('smtp_password', ''),
('template_dir', 'default_960px'),
('language_dir', 'english'),
('date_format', 'd.m.Y'),
('time_format', 'H:i'),
('convert_tool', 'gd'),
('convert_tool_path', ''),
('gz_compress', '0'),
('gz_compress_level', '6'),
('cat_cells', '2'),
('cat_table_width', '100%'),
('cat_table_cellspacing', '1'),
('cat_table_cellpadding', '3'),
('num_subcats', '3'),
('image_order', 'image_name'),
('image_sort', 'ASC'),
('new_cutoff', '10'),
('image_border', '1'),
('image_cells', '3'),
('default_image_rows', '3'),
('custom_row_steps', '10'),
('image_table_width', '100%'),
('image_table_cellspacing', '1'),
('image_table_cellpadding', '3'),
('upload_mode', '2'),
('allowed_mediatypes', 'jpg,gif,png,aif,au,avi,mid,mov,mp3,mpg,swf,wav,ra,rm,zip,pdf'),
('max_thumb_width', '300'),
('max_thumb_height', '300'),
('max_thumb_size', '100'),
('max_image_width', '1024'),
('max_image_height', '1024'),
('max_media_size', '2000'),
('upload_notify', '0'),
('upload_emails', ''),
('auto_thumbnail', '1'),
('auto_thumbnail_dimension', '100'),
('auto_thumbnail_resize_type', '1'),
('auto_thumbnail_quality', '75'),
('badword_list', 'fuck {fuck}'),
('badword_replace_char', '*'),
('wordwrap_comments', '50'),
('html_comments', '0'),
('bb_comments', '1'),
('bb_img_comments', '0'),
('category_separator', '&nbsp;/&nbsp;'),
('paging_range', '5'),
('user_edit_image', '1'),
('user_delete_image', '1'),
('user_edit_comments', '1'),
('user_delete_comments', '1'),
('account_activation', '1'),
('activation_time', '14'),
('session_timeout', '15'),
('display_whosonline', '1'),
('highlight_admin', '1');

-- --------------------------------------------------------

--
-- Table structure for table `4images_users`
--

CREATE TABLE IF NOT EXISTS `4images_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_level` int(11) NOT NULL DEFAULT '1',
  `user_name` varchar(255) NOT NULL DEFAULT '',
  `user_password` varchar(255) NOT NULL DEFAULT '',
  `user_email` varchar(255) NOT NULL DEFAULT '',
  `user_showemail` tinyint(1) NOT NULL DEFAULT '0',
  `user_allowemails` tinyint(1) NOT NULL DEFAULT '1',
  `user_invisible` tinyint(1) NOT NULL DEFAULT '0',
  `user_joindate` int(11) unsigned NOT NULL DEFAULT '0',
  `user_activationkey` varchar(32) NOT NULL DEFAULT '',
  `user_lastaction` int(11) unsigned NOT NULL DEFAULT '0',
  `user_location` varchar(255) NOT NULL DEFAULT '',
  `user_lastvisit` int(11) unsigned NOT NULL DEFAULT '0',
  `user_comments` int(10) unsigned NOT NULL DEFAULT '0',
  `user_homepage` varchar(255) NOT NULL DEFAULT '',
  `user_icq` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`),
  KEY `user_lastaction` (`user_lastaction`),
  KEY `user_name` (`user_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `4images_users`
--

INSERT INTO `4images_users` (`user_id`, `user_level`, `user_name`, `user_password`, `user_email`, `user_showemail`, `user_allowemails`, `user_invisible`, `user_joindate`, `user_activationkey`, `user_lastaction`, `user_location`, `user_lastvisit`, `user_comments`, `user_homepage`, `user_icq`) VALUES
(-1, -1, 'Guest', '0493984f537120be0b8d96bc9b69cdd2', '', 0, 0, 0, 0, '', 0, '', 0, 0, '', ''),
(1, 9, 'admin', '37de5cb5d:bfb0bd531af5b91694c94c9ca361db06', 'admin@yourdomain.com', 1, 1, 0, 1440507248, '1e3457c0b2052a9633b886fd75ef91e0', 1440508416, 'member.php', 1440507248, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `4images_wordlist`
--

CREATE TABLE IF NOT EXISTS `4images_wordlist` (
  `word_text` varchar(50) NOT NULL DEFAULT '',
  `word_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`word_id`),
  UNIQUE KEY `word_text` (`word_text`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `4images_wordmatch`
--

CREATE TABLE IF NOT EXISTS `4images_wordmatch` (
  `image_id` int(10) unsigned NOT NULL DEFAULT '0',
  `word_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name_match` tinyint(1) NOT NULL DEFAULT '0',
  `desc_match` tinyint(1) NOT NULL DEFAULT '0',
  `keys_match` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `image_word_id` (`image_id`,`word_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
