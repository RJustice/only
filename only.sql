/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : only

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2013-07-26 17:27:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `acl`
-- ----------------------------
DROP TABLE IF EXISTS `acl`;
CREATE TABLE `acl` (
  `acl_id` int(11) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY  (`acl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl
-- ----------------------------

-- ----------------------------
-- Table structure for `articles`
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `title_alias` varchar(255) NOT NULL,
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(4) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `tags` text NOT NULL,
  `created_by_alias` varchar(100) NOT NULL,
  `sectionid` int(11) unsigned NOT NULL,
  `catid` int(11) unsigned NOT NULL,
  `medias` text NOT NULL,
  `ordering` int(11) unsigned NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL,
  `hits` int(11) unsigned NOT NULL,
  `metadata` text NOT NULL,
  `publish_up` datetime NOT NULL,
  `publish_down` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_by_alias` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articles
-- ----------------------------

-- ----------------------------
-- Table structure for `article_history`
-- ----------------------------
DROP TABLE IF EXISTS `article_history`;
CREATE TABLE `article_history` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `article_id` int(11) NOT NULL,
  `text` longtext NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `created_by_alias` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_history
-- ----------------------------
INSERT INTO `article_history` VALUES ('7', '1', '7', '2013-07-25 13:22:55', '0', '');
INSERT INTO `article_history` VALUES ('8', '1', '8', '2013-07-25 13:22:57', '0', '');
INSERT INTO `article_history` VALUES ('9', '1', '9', '2013-07-25 13:22:59', '0', '');
INSERT INTO `article_history` VALUES ('10', '1', '10', '2013-07-25 13:23:01', '0', '');
INSERT INTO `article_history` VALUES ('11', '1', '11', '2013-07-25 13:23:04', '0', '');
INSERT INTO `article_history` VALUES ('12', '1', '12', '2013-07-25 13:23:06', '0', '');
INSERT INTO `article_history` VALUES ('13', '1', '13', '2013-07-25 13:23:08', '0', '');
INSERT INTO `article_history` VALUES ('14', '2', '14', '2013-07-25 13:23:10', '0', '');
INSERT INTO `article_history` VALUES ('1', '1', '1', '2013-07-21 13:20:59', '1', '');
INSERT INTO `article_history` VALUES ('2', '2', '2', '2013-07-21 14:21:15', '0', '');
INSERT INTO `article_history` VALUES ('3', '1', '3', '2013-07-22 13:21:26', '0', '');
INSERT INTO `article_history` VALUES ('4', '1', '4', '2013-07-25 13:22:45', '0', '');
INSERT INTO `article_history` VALUES ('5', '1', '5', '2013-07-25 13:22:49', '0', '');
INSERT INTO `article_history` VALUES ('6', '1', '6', '2013-07-25 13:22:52', '0', '');

-- ----------------------------
-- Table structure for `article_meta`
-- ----------------------------
DROP TABLE IF EXISTS `article_meta`;
CREATE TABLE `article_meta` (
  `meta_id` int(11) unsigned NOT NULL auto_increment,
  `article_id` int(11) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_value` text NOT NULL,
  PRIMARY KEY  (`meta_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_meta
-- ----------------------------

-- ----------------------------
-- Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `section` int(11) NOT NULL,
  `state` tinyint(4) NOT NULL default '1',
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) NOT NULL default '0',
  `level` tinyint(3) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------

-- ----------------------------
-- Table structure for `groups`
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `parent_id` int(11) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of groups
-- ----------------------------

-- ----------------------------
-- Table structure for `media`
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `type` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `state` tinyint(4) NOT NULL default '1',
  `size` varchar(11) NOT NULL default '0',
  `is_image` tinyint(1) NOT NULL default '0',
  `file_ext` varchar(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of media
-- ----------------------------

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `menutype` varchar(75) NOT NULL,
  `link` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `tid` int(11) unsigned NOT NULL,
  `parent_id` int(11) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `published` tinyint(1) NOT NULL,
  `ordering` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------

-- ----------------------------
-- Table structure for `menu_type`
-- ----------------------------
DROP TABLE IF EXISTS `menu_type`;
CREATE TABLE `menu_type` (
  `id` int(11) NOT NULL auto_increment,
  `menutype` varchar(75) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_type
-- ----------------------------

-- ----------------------------
-- Table structure for `sections`
-- ----------------------------
DROP TABLE IF EXISTS `sections`;
CREATE TABLE `sections` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `state` tinyint(4) NOT NULL default '1',
  `ordering` int(11) NOT NULL default '0',
  `image` text NOT NULL,
  `access` tinyint(3) NOT NULL default '0',
  `create_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sections
-- ----------------------------

-- ----------------------------
-- Table structure for `tags`
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL default '0',
  `count` int(11) unsigned NOT NULL default '0',
  `weight` int(8) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags
-- ----------------------------

-- ----------------------------
-- Table structure for `templates`
-- ----------------------------
DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `state` tinyint(3) unsigned NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of templates
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `username` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `create_time` datetime NOT NULL,
  `state` tinyint(4) NOT NULL default '1',
  `group_id` int(11) unsigned NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `salt` char(4) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for `user_meta`
-- ----------------------------
DROP TABLE IF EXISTS `user_meta`;
CREATE TABLE `user_meta` (
  `meta_id` int(11) unsigned NOT NULL auto_increment,
  `user_id` int(11) unsigned NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` longtext NOT NULL,
  PRIMARY KEY  (`meta_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_meta
-- ----------------------------
