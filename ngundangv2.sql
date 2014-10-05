/*
Navicat MySQL Data Transfer

Source Server         : bekt
Source Server Version : 50619
Source Host           : localhost:3306
Source Database       : ngundangv2

Target Server Type    : MYSQL
Target Server Version : 50619
File Encoding         : 65001

Date: 2014-10-05 10:53:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for backend_access_log
-- ----------------------------
DROP TABLE IF EXISTS `backend_access_log`;
CREATE TABLE `backend_access_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of backend_access_log
-- ----------------------------
INSERT INTO `backend_access_log` VALUES ('1', '1', '::1', '2014-10-05 17:46:57', '2014-10-05 17:46:57');

-- ----------------------------
-- Table structure for backend_users
-- ----------------------------
DROP TABLE IF EXISTS `backend_users`;
CREATE TABLE `backend_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `backend_users_login_unique` (`login`),
  UNIQUE KEY `backend_users_email_unique` (`email`),
  KEY `backend_users_activation_code_index` (`activation_code`),
  KEY `backend_users_reset_password_code_index` (`reset_password_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of backend_users
-- ----------------------------
INSERT INTO `backend_users` VALUES ('1', 'Admin', 'Person', 'admin', 'admin@admin.admin', '$2y$10$quU.i8NR5maAXGhRIWWX1O9yGG72X7ALa.ZESWQI9M6yeK7zLlnIa', null, '$2y$10$TF8BMue5WUKkUH4Dngzh.uBtkmjRRXZ1Pws2g9e3u99ma7LMX5oL2', null, '{\"superuser\":1}', '1', null, '2014-10-05 17:46:57', '2014-10-05 17:39:03', '2014-10-05 17:46:57');

-- ----------------------------
-- Table structure for backend_users_groups
-- ----------------------------
DROP TABLE IF EXISTS `backend_users_groups`;
CREATE TABLE `backend_users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of backend_users_groups
-- ----------------------------
INSERT INTO `backend_users_groups` VALUES ('1', '1');

-- ----------------------------
-- Table structure for backend_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `backend_user_groups`;
CREATE TABLE `backend_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `backend_user_groups_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of backend_user_groups
-- ----------------------------
INSERT INTO `backend_user_groups` VALUES ('1', 'Admins', null, '2014-10-05 17:39:02', '2014-10-05 17:39:02');

-- ----------------------------
-- Table structure for backend_user_preferences
-- ----------------------------
DROP TABLE IF EXISTS `backend_user_preferences`;
CREATE TABLE `backend_user_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of backend_user_preferences
-- ----------------------------
INSERT INTO `backend_user_preferences` VALUES ('1', '1', 'backend', 'backend', 'preferences', '{\"locale\":\"en\",\"user_id\":\"1\"}');
INSERT INTO `backend_user_preferences` VALUES ('2', '1', 'backend', 'editor', 'preferences', '{\"font_size\":\"12\",\"word_wrap\":\"fluid\",\"code_folding\":\"manual\",\"tab_size\":\"4\",\"theme\":\"twilight\",\"show_invisibles\":true,\"highlight_active_line\":true,\"use_hard_tabs\":false,\"show_gutter\":true,\"user_id\":\"1\"}');

-- ----------------------------
-- Table structure for backend_user_throttle
-- ----------------------------
DROP TABLE IF EXISTS `backend_user_throttle`;
CREATE TABLE `backend_user_throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of backend_user_throttle
-- ----------------------------
INSERT INTO `backend_user_throttle` VALUES ('1', '1', '::1', '0', null, '0', null, '0', null);

-- ----------------------------
-- Table structure for cron_queue
-- ----------------------------
DROP TABLE IF EXISTS `cron_queue`;
CREATE TABLE `cron_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `delay` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `retries` int(11) NOT NULL DEFAULT '0',
  `payload` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cron_queue
-- ----------------------------

-- ----------------------------
-- Table structure for deferred_bindings
-- ----------------------------
DROP TABLE IF EXISTS `deferred_bindings`;
CREATE TABLE `deferred_bindings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `master_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `master_field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `deferred_bindings_master_type_index` (`master_type`),
  KEY `deferred_bindings_master_field_index` (`master_field`),
  KEY `deferred_bindings_slave_type_index` (`slave_type`),
  KEY `deferred_bindings_slave_id_index` (`slave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of deferred_bindings
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2013_10_01_000001_Db_Deferred_Bindings', '1');
INSERT INTO `migrations` VALUES ('2013_10_01_000002_Db_System_Files', '1');
INSERT INTO `migrations` VALUES ('2013_10_01_000003_Db_System_Plugin_Versions', '1');
INSERT INTO `migrations` VALUES ('2013_10_01_000004_Db_System_Plugin_History', '1');
INSERT INTO `migrations` VALUES ('2013_10_01_000005_Db_System_Settings', '1');
INSERT INTO `migrations` VALUES ('2013_10_01_000006_Db_System_Parameters', '1');
INSERT INTO `migrations` VALUES ('2013_10_01_000007_Db_System_Add_Disabled_Flag', '1');
INSERT INTO `migrations` VALUES ('2013_10_01_000008_Db_System_Mail_Templates', '1');
INSERT INTO `migrations` VALUES ('2013_10_01_000009_Db_System_Mail_Layouts', '1');
INSERT INTO `migrations` VALUES ('2013_10_01_000010_Db_Cron_Queue', '1');
INSERT INTO `migrations` VALUES ('2014_10_01_000011_Db_System_Event_Logs', '1');
INSERT INTO `migrations` VALUES ('2014_10_01_000012_Db_System_Request_Logs', '1');
INSERT INTO `migrations` VALUES ('2014_10_01_000013_Db_System_Sessions', '1');
INSERT INTO `migrations` VALUES ('2013_10_01_000001_Db_Backend_Users', '2');
INSERT INTO `migrations` VALUES ('2013_10_01_000002_Db_Backend_User_Groups', '2');
INSERT INTO `migrations` VALUES ('2013_10_01_000003_Db_Backend_Users_Groups', '2');
INSERT INTO `migrations` VALUES ('2013_10_01_000004_Db_Backend_User_Throttle', '2');
INSERT INTO `migrations` VALUES ('2014_01_04_000005_Db_Backend_User_Preferences', '2');
INSERT INTO `migrations` VALUES ('2014_10_01_000006_Db_Backend_Access_Log', '2');

-- ----------------------------
-- Table structure for rainlab_user_countries
-- ----------------------------
DROP TABLE IF EXISTS `rainlab_user_countries`;
CREATE TABLE `rainlab_user_countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_user_countries_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rainlab_user_countries
-- ----------------------------
INSERT INTO `rainlab_user_countries` VALUES ('1', '1', 'United States', 'US');
INSERT INTO `rainlab_user_countries` VALUES ('2', '1', 'Canada', 'CA');
INSERT INTO `rainlab_user_countries` VALUES ('3', '1', 'Australia', 'AU');
INSERT INTO `rainlab_user_countries` VALUES ('4', '0', 'France', 'FR');
INSERT INTO `rainlab_user_countries` VALUES ('5', '0', 'Germany', 'DE');
INSERT INTO `rainlab_user_countries` VALUES ('6', '0', 'Iceland', 'IS');
INSERT INTO `rainlab_user_countries` VALUES ('7', '0', 'Ireland', 'IE');
INSERT INTO `rainlab_user_countries` VALUES ('8', '0', 'Italy', 'IT');
INSERT INTO `rainlab_user_countries` VALUES ('9', '0', 'Spain', 'ES');
INSERT INTO `rainlab_user_countries` VALUES ('10', '0', 'Sweden', 'SE');
INSERT INTO `rainlab_user_countries` VALUES ('11', '0', 'Austria', 'AT');
INSERT INTO `rainlab_user_countries` VALUES ('12', '0', 'Belgium', 'BE');
INSERT INTO `rainlab_user_countries` VALUES ('13', '0', 'Finland', 'FI');
INSERT INTO `rainlab_user_countries` VALUES ('14', '0', 'Czech Republic', 'CZ');
INSERT INTO `rainlab_user_countries` VALUES ('15', '0', 'Denmark', 'DK');
INSERT INTO `rainlab_user_countries` VALUES ('16', '0', 'Norway', 'NO');
INSERT INTO `rainlab_user_countries` VALUES ('17', '0', 'United Kingdom', 'GB');
INSERT INTO `rainlab_user_countries` VALUES ('18', '0', 'Switzerland', 'CH');
INSERT INTO `rainlab_user_countries` VALUES ('19', '0', 'New Zealand', 'NZ');
INSERT INTO `rainlab_user_countries` VALUES ('20', '0', 'Russian Federation', 'RU');
INSERT INTO `rainlab_user_countries` VALUES ('21', '0', 'Portugal', 'PT');
INSERT INTO `rainlab_user_countries` VALUES ('22', '0', 'Netherlands', 'NL');
INSERT INTO `rainlab_user_countries` VALUES ('23', '0', 'Isle of Man', 'IM');
INSERT INTO `rainlab_user_countries` VALUES ('24', '0', 'Afghanistan', 'AF');
INSERT INTO `rainlab_user_countries` VALUES ('25', '0', 'Aland Islands ', 'AX');
INSERT INTO `rainlab_user_countries` VALUES ('26', '0', 'Albania', 'AL');
INSERT INTO `rainlab_user_countries` VALUES ('27', '0', 'Algeria', 'DZ');
INSERT INTO `rainlab_user_countries` VALUES ('28', '0', 'American Samoa', 'AS');
INSERT INTO `rainlab_user_countries` VALUES ('29', '0', 'Andorra', 'AD');
INSERT INTO `rainlab_user_countries` VALUES ('30', '0', 'Angola', 'AO');
INSERT INTO `rainlab_user_countries` VALUES ('31', '0', 'Anguilla', 'AI');
INSERT INTO `rainlab_user_countries` VALUES ('32', '0', 'Antarctica', 'AQ');
INSERT INTO `rainlab_user_countries` VALUES ('33', '0', 'Antigua and Barbuda', 'AG');
INSERT INTO `rainlab_user_countries` VALUES ('34', '0', 'Argentina', 'AR');
INSERT INTO `rainlab_user_countries` VALUES ('35', '0', 'Armenia', 'AM');
INSERT INTO `rainlab_user_countries` VALUES ('36', '0', 'Aruba', 'AW');
INSERT INTO `rainlab_user_countries` VALUES ('37', '0', 'Azerbaijan', 'AZ');
INSERT INTO `rainlab_user_countries` VALUES ('38', '0', 'Bahamas', 'BS');
INSERT INTO `rainlab_user_countries` VALUES ('39', '0', 'Bahrain', 'BH');
INSERT INTO `rainlab_user_countries` VALUES ('40', '0', 'Bangladesh', 'BD');
INSERT INTO `rainlab_user_countries` VALUES ('41', '0', 'Barbados', 'BB');
INSERT INTO `rainlab_user_countries` VALUES ('42', '0', 'Belarus', 'BY');
INSERT INTO `rainlab_user_countries` VALUES ('43', '0', 'Belize', 'BZ');
INSERT INTO `rainlab_user_countries` VALUES ('44', '0', 'Benin', 'BJ');
INSERT INTO `rainlab_user_countries` VALUES ('45', '0', 'Bermuda', 'BM');
INSERT INTO `rainlab_user_countries` VALUES ('46', '0', 'Bhutan', 'BT');
INSERT INTO `rainlab_user_countries` VALUES ('47', '0', 'Bolivia, Plurinational State of', 'BO');
INSERT INTO `rainlab_user_countries` VALUES ('48', '0', 'Bonaire, Sint Eustatius and Saba', 'BQ');
INSERT INTO `rainlab_user_countries` VALUES ('49', '0', 'Bosnia and Herzegovina', 'BA');
INSERT INTO `rainlab_user_countries` VALUES ('50', '0', 'Botswana', 'BW');
INSERT INTO `rainlab_user_countries` VALUES ('51', '0', 'Bouvet Island', 'BV');
INSERT INTO `rainlab_user_countries` VALUES ('52', '0', 'Brazil', 'BR');
INSERT INTO `rainlab_user_countries` VALUES ('53', '0', 'British Indian Ocean Territory', 'IO');
INSERT INTO `rainlab_user_countries` VALUES ('54', '0', 'Brunei Darussalam', 'BN');
INSERT INTO `rainlab_user_countries` VALUES ('55', '0', 'Bulgaria', 'BG');
INSERT INTO `rainlab_user_countries` VALUES ('56', '0', 'Burkina Faso', 'BF');
INSERT INTO `rainlab_user_countries` VALUES ('57', '0', 'Burundi', 'BI');
INSERT INTO `rainlab_user_countries` VALUES ('58', '0', 'Cambodia', 'KH');
INSERT INTO `rainlab_user_countries` VALUES ('59', '0', 'Cameroon', 'CM');
INSERT INTO `rainlab_user_countries` VALUES ('60', '0', 'Cape Verde', 'CV');
INSERT INTO `rainlab_user_countries` VALUES ('61', '0', 'Cayman Islands', 'KY');
INSERT INTO `rainlab_user_countries` VALUES ('62', '0', 'Central African Republic', 'CF');
INSERT INTO `rainlab_user_countries` VALUES ('63', '0', 'Chad', 'TD');
INSERT INTO `rainlab_user_countries` VALUES ('64', '0', 'Chile', 'CL');
INSERT INTO `rainlab_user_countries` VALUES ('65', '0', 'China', 'CN');
INSERT INTO `rainlab_user_countries` VALUES ('66', '0', 'Christmas Island', 'CX');
INSERT INTO `rainlab_user_countries` VALUES ('67', '0', 'Cocos (Keeling) Islands', 'CC');
INSERT INTO `rainlab_user_countries` VALUES ('68', '0', 'Colombia', 'CO');
INSERT INTO `rainlab_user_countries` VALUES ('69', '0', 'Comoros', 'KM');
INSERT INTO `rainlab_user_countries` VALUES ('70', '0', 'Congo', 'CG');
INSERT INTO `rainlab_user_countries` VALUES ('71', '0', 'Congo, the Democratic Republic of the', 'CD');
INSERT INTO `rainlab_user_countries` VALUES ('72', '0', 'Cook Islands', 'CK');
INSERT INTO `rainlab_user_countries` VALUES ('73', '0', 'Costa Rica', 'CR');
INSERT INTO `rainlab_user_countries` VALUES ('74', '0', 'Cote d\'Ivoire', 'CI');
INSERT INTO `rainlab_user_countries` VALUES ('75', '0', 'Croatia', 'HR');
INSERT INTO `rainlab_user_countries` VALUES ('76', '0', 'Cuba', 'CU');
INSERT INTO `rainlab_user_countries` VALUES ('77', '0', 'Curaçao', 'CW');
INSERT INTO `rainlab_user_countries` VALUES ('78', '0', 'Cyprus', 'CY');
INSERT INTO `rainlab_user_countries` VALUES ('79', '0', 'Djibouti', 'DJ');
INSERT INTO `rainlab_user_countries` VALUES ('80', '0', 'Dominica', 'DM');
INSERT INTO `rainlab_user_countries` VALUES ('81', '0', 'Dominican Republic', 'DO');
INSERT INTO `rainlab_user_countries` VALUES ('82', '0', 'Ecuador', 'EC');
INSERT INTO `rainlab_user_countries` VALUES ('83', '0', 'Egypt', 'EG');
INSERT INTO `rainlab_user_countries` VALUES ('84', '0', 'El Salvador', 'SV');
INSERT INTO `rainlab_user_countries` VALUES ('85', '0', 'Equatorial Guinea', 'GQ');
INSERT INTO `rainlab_user_countries` VALUES ('86', '0', 'Eritrea', 'ER');
INSERT INTO `rainlab_user_countries` VALUES ('87', '0', 'Estonia', 'EE');
INSERT INTO `rainlab_user_countries` VALUES ('88', '0', 'Ethiopia', 'ET');
INSERT INTO `rainlab_user_countries` VALUES ('89', '0', 'Falkland Islands (Malvinas)', 'FK');
INSERT INTO `rainlab_user_countries` VALUES ('90', '0', 'Faroe Islands', 'FO');
INSERT INTO `rainlab_user_countries` VALUES ('91', '0', 'Fiji', 'FJ');
INSERT INTO `rainlab_user_countries` VALUES ('92', '0', 'French Guiana', 'GF');
INSERT INTO `rainlab_user_countries` VALUES ('93', '0', 'French Polynesia', 'PF');
INSERT INTO `rainlab_user_countries` VALUES ('94', '0', 'French Southern Territories', 'TF');
INSERT INTO `rainlab_user_countries` VALUES ('95', '0', 'Gabon', 'GA');
INSERT INTO `rainlab_user_countries` VALUES ('96', '0', 'Gambia', 'GM');
INSERT INTO `rainlab_user_countries` VALUES ('97', '0', 'Georgia', 'GE');
INSERT INTO `rainlab_user_countries` VALUES ('98', '0', 'Ghana', 'GH');
INSERT INTO `rainlab_user_countries` VALUES ('99', '0', 'Gibraltar', 'GI');
INSERT INTO `rainlab_user_countries` VALUES ('100', '0', 'Greece', 'GR');
INSERT INTO `rainlab_user_countries` VALUES ('101', '0', 'Greenland', 'GL');
INSERT INTO `rainlab_user_countries` VALUES ('102', '0', 'Grenada', 'GD');
INSERT INTO `rainlab_user_countries` VALUES ('103', '0', 'Guadeloupe', 'GP');
INSERT INTO `rainlab_user_countries` VALUES ('104', '0', 'Guam', 'GU');
INSERT INTO `rainlab_user_countries` VALUES ('105', '0', 'Guatemala', 'GT');
INSERT INTO `rainlab_user_countries` VALUES ('106', '0', 'Guernsey', 'GG');
INSERT INTO `rainlab_user_countries` VALUES ('107', '0', 'Guinea', 'GN');
INSERT INTO `rainlab_user_countries` VALUES ('108', '0', 'Guinea-Bissau', 'GW');
INSERT INTO `rainlab_user_countries` VALUES ('109', '0', 'Guyana', 'GY');
INSERT INTO `rainlab_user_countries` VALUES ('110', '0', 'Haiti', 'HT');
INSERT INTO `rainlab_user_countries` VALUES ('111', '0', 'Heard Island and McDonald Islands', 'HM');
INSERT INTO `rainlab_user_countries` VALUES ('112', '0', 'Holy See (Vatican City State)', 'VA');
INSERT INTO `rainlab_user_countries` VALUES ('113', '0', 'Honduras', 'HN');
INSERT INTO `rainlab_user_countries` VALUES ('114', '0', 'Hong Kong', 'HK');
INSERT INTO `rainlab_user_countries` VALUES ('115', '0', 'Hungary', 'HU');
INSERT INTO `rainlab_user_countries` VALUES ('116', '0', 'India', 'IN');
INSERT INTO `rainlab_user_countries` VALUES ('117', '0', 'Indonesia', 'ID');
INSERT INTO `rainlab_user_countries` VALUES ('118', '0', 'Iran, Islamic Republic of', 'IR');
INSERT INTO `rainlab_user_countries` VALUES ('119', '0', 'Iraq', 'IQ');
INSERT INTO `rainlab_user_countries` VALUES ('120', '0', 'Israel', 'IL');
INSERT INTO `rainlab_user_countries` VALUES ('121', '0', 'Jamaica', 'JM');
INSERT INTO `rainlab_user_countries` VALUES ('122', '0', 'Japan', 'JP');
INSERT INTO `rainlab_user_countries` VALUES ('123', '0', 'Jersey', 'JE');
INSERT INTO `rainlab_user_countries` VALUES ('124', '0', 'Jordan', 'JO');
INSERT INTO `rainlab_user_countries` VALUES ('125', '0', 'Kazakhstan', 'KZ');
INSERT INTO `rainlab_user_countries` VALUES ('126', '0', 'Kenya', 'KE');
INSERT INTO `rainlab_user_countries` VALUES ('127', '0', 'Kiribati', 'KI');
INSERT INTO `rainlab_user_countries` VALUES ('128', '0', 'Korea, Democratic People\'s Republic of', 'KP');
INSERT INTO `rainlab_user_countries` VALUES ('129', '0', 'Korea, Republic of', 'KR');
INSERT INTO `rainlab_user_countries` VALUES ('130', '0', 'Kuwait', 'KW');
INSERT INTO `rainlab_user_countries` VALUES ('131', '0', 'Kyrgyzstan', 'KG');
INSERT INTO `rainlab_user_countries` VALUES ('132', '0', 'Lao People\'s Democratic Republic', 'LA');
INSERT INTO `rainlab_user_countries` VALUES ('133', '0', 'Latvia', 'LV');
INSERT INTO `rainlab_user_countries` VALUES ('134', '0', 'Lebanon', 'LB');
INSERT INTO `rainlab_user_countries` VALUES ('135', '0', 'Lesotho', 'LS');
INSERT INTO `rainlab_user_countries` VALUES ('136', '0', 'Liberia', 'LR');
INSERT INTO `rainlab_user_countries` VALUES ('137', '0', 'Libyan Arab Jamahiriya', 'LY');
INSERT INTO `rainlab_user_countries` VALUES ('138', '0', 'Liechtenstein', 'LI');
INSERT INTO `rainlab_user_countries` VALUES ('139', '0', 'Lithuania', 'LT');
INSERT INTO `rainlab_user_countries` VALUES ('140', '0', 'Luxembourg', 'LU');
INSERT INTO `rainlab_user_countries` VALUES ('141', '0', 'Macao', 'MO');
INSERT INTO `rainlab_user_countries` VALUES ('142', '0', 'Macedonia', 'MK');
INSERT INTO `rainlab_user_countries` VALUES ('143', '0', 'Madagascar', 'MG');
INSERT INTO `rainlab_user_countries` VALUES ('144', '0', 'Malawi', 'MW');
INSERT INTO `rainlab_user_countries` VALUES ('145', '0', 'Malaysia', 'MY');
INSERT INTO `rainlab_user_countries` VALUES ('146', '0', 'Maldives', 'MV');
INSERT INTO `rainlab_user_countries` VALUES ('147', '0', 'Mali', 'ML');
INSERT INTO `rainlab_user_countries` VALUES ('148', '0', 'Malta', 'MT');
INSERT INTO `rainlab_user_countries` VALUES ('149', '0', 'Marshall Islands', 'MH');
INSERT INTO `rainlab_user_countries` VALUES ('150', '0', 'Martinique', 'MQ');
INSERT INTO `rainlab_user_countries` VALUES ('151', '0', 'Mauritania', 'MR');
INSERT INTO `rainlab_user_countries` VALUES ('152', '0', 'Mauritius', 'MU');
INSERT INTO `rainlab_user_countries` VALUES ('153', '0', 'Mayotte', 'YT');
INSERT INTO `rainlab_user_countries` VALUES ('154', '0', 'Mexico', 'MX');
INSERT INTO `rainlab_user_countries` VALUES ('155', '0', 'Micronesia, Federated States of', 'FM');
INSERT INTO `rainlab_user_countries` VALUES ('156', '0', 'Moldova, Republic of', 'MD');
INSERT INTO `rainlab_user_countries` VALUES ('157', '0', 'Monaco', 'MC');
INSERT INTO `rainlab_user_countries` VALUES ('158', '0', 'Mongolia', 'MN');
INSERT INTO `rainlab_user_countries` VALUES ('159', '0', 'Montenegro', 'ME');
INSERT INTO `rainlab_user_countries` VALUES ('160', '0', 'Montserrat', 'MS');
INSERT INTO `rainlab_user_countries` VALUES ('161', '0', 'Morocco', 'MA');
INSERT INTO `rainlab_user_countries` VALUES ('162', '0', 'Mozambique', 'MZ');
INSERT INTO `rainlab_user_countries` VALUES ('163', '0', 'Myanmar', 'MM');
INSERT INTO `rainlab_user_countries` VALUES ('164', '0', 'Namibia', 'NA');
INSERT INTO `rainlab_user_countries` VALUES ('165', '0', 'Nauru', 'NR');
INSERT INTO `rainlab_user_countries` VALUES ('166', '0', 'Nepal', 'NP');
INSERT INTO `rainlab_user_countries` VALUES ('167', '0', 'New Caledonia', 'NC');
INSERT INTO `rainlab_user_countries` VALUES ('168', '0', 'Nicaragua', 'NI');
INSERT INTO `rainlab_user_countries` VALUES ('169', '0', 'Niger', 'NE');
INSERT INTO `rainlab_user_countries` VALUES ('170', '0', 'Nigeria', 'NG');
INSERT INTO `rainlab_user_countries` VALUES ('171', '0', 'Niue', 'NU');
INSERT INTO `rainlab_user_countries` VALUES ('172', '0', 'Norfolk Island', 'NF');
INSERT INTO `rainlab_user_countries` VALUES ('173', '0', 'Northern Mariana Islands', 'MP');
INSERT INTO `rainlab_user_countries` VALUES ('174', '0', 'Oman', 'OM');
INSERT INTO `rainlab_user_countries` VALUES ('175', '0', 'Pakistan', 'PK');
INSERT INTO `rainlab_user_countries` VALUES ('176', '0', 'Palau', 'PW');
INSERT INTO `rainlab_user_countries` VALUES ('177', '0', 'Palestinian Territory, Occupied', 'PS');
INSERT INTO `rainlab_user_countries` VALUES ('178', '0', 'Panama', 'PA');
INSERT INTO `rainlab_user_countries` VALUES ('179', '0', 'Papua New Guinea', 'PG');
INSERT INTO `rainlab_user_countries` VALUES ('180', '0', 'Paraguay', 'PY');
INSERT INTO `rainlab_user_countries` VALUES ('181', '0', 'Peru', 'PE');
INSERT INTO `rainlab_user_countries` VALUES ('182', '0', 'Philippines', 'PH');
INSERT INTO `rainlab_user_countries` VALUES ('183', '0', 'Pitcairn', 'PN');
INSERT INTO `rainlab_user_countries` VALUES ('184', '0', 'Poland', 'PL');
INSERT INTO `rainlab_user_countries` VALUES ('185', '0', 'Puerto Rico', 'PR');
INSERT INTO `rainlab_user_countries` VALUES ('186', '0', 'Qatar', 'QA');
INSERT INTO `rainlab_user_countries` VALUES ('187', '0', 'Reunion', 'RE');
INSERT INTO `rainlab_user_countries` VALUES ('188', '0', 'Romania', 'RO');
INSERT INTO `rainlab_user_countries` VALUES ('189', '0', 'Rwanda', 'RW');
INSERT INTO `rainlab_user_countries` VALUES ('190', '0', 'Saint Barthélemy', 'BL');
INSERT INTO `rainlab_user_countries` VALUES ('191', '0', 'Saint Helena', 'SH');
INSERT INTO `rainlab_user_countries` VALUES ('192', '0', 'Saint Kitts and Nevis', 'KN');
INSERT INTO `rainlab_user_countries` VALUES ('193', '0', 'Saint Lucia', 'LC');
INSERT INTO `rainlab_user_countries` VALUES ('194', '0', 'Saint Martin (French part)', 'MF');
INSERT INTO `rainlab_user_countries` VALUES ('195', '0', 'Saint Pierre and Miquelon', 'PM');
INSERT INTO `rainlab_user_countries` VALUES ('196', '0', 'Saint Vincent and the Grenadines', 'VC');
INSERT INTO `rainlab_user_countries` VALUES ('197', '0', 'Samoa', 'WS');
INSERT INTO `rainlab_user_countries` VALUES ('198', '0', 'San Marino', 'SM');
INSERT INTO `rainlab_user_countries` VALUES ('199', '0', 'Sao Tome and Principe', 'ST');
INSERT INTO `rainlab_user_countries` VALUES ('200', '0', 'Saudi Arabia', 'SA');
INSERT INTO `rainlab_user_countries` VALUES ('201', '0', 'Senegal', 'SN');
INSERT INTO `rainlab_user_countries` VALUES ('202', '0', 'Serbia', 'RS');
INSERT INTO `rainlab_user_countries` VALUES ('203', '0', 'Seychelles', 'SC');
INSERT INTO `rainlab_user_countries` VALUES ('204', '0', 'Sierra Leone', 'SL');
INSERT INTO `rainlab_user_countries` VALUES ('205', '0', 'Singapore', 'SG');
INSERT INTO `rainlab_user_countries` VALUES ('206', '0', 'Sint Maarten (Dutch part)', 'SX');
INSERT INTO `rainlab_user_countries` VALUES ('207', '0', 'Slovakia', 'SK');
INSERT INTO `rainlab_user_countries` VALUES ('208', '0', 'Slovenia', 'SI');
INSERT INTO `rainlab_user_countries` VALUES ('209', '0', 'Solomon Islands', 'SB');
INSERT INTO `rainlab_user_countries` VALUES ('210', '0', 'Somalia', 'SO');
INSERT INTO `rainlab_user_countries` VALUES ('211', '0', 'South Africa', 'ZA');
INSERT INTO `rainlab_user_countries` VALUES ('212', '0', 'South Georgia and the South Sandwich Islands', 'GS');
INSERT INTO `rainlab_user_countries` VALUES ('213', '0', 'Sri Lanka', 'LK');
INSERT INTO `rainlab_user_countries` VALUES ('214', '0', 'Sudan', 'SD');
INSERT INTO `rainlab_user_countries` VALUES ('215', '0', 'Suriname', 'SR');
INSERT INTO `rainlab_user_countries` VALUES ('216', '0', 'Svalbard and Jan Mayen', 'SJ');
INSERT INTO `rainlab_user_countries` VALUES ('217', '0', 'Swaziland', 'SZ');
INSERT INTO `rainlab_user_countries` VALUES ('218', '0', 'Syrian Arab Republic', 'SY');
INSERT INTO `rainlab_user_countries` VALUES ('219', '0', 'Taiwan, Province of China', 'TW');
INSERT INTO `rainlab_user_countries` VALUES ('220', '0', 'Tajikistan', 'TJ');
INSERT INTO `rainlab_user_countries` VALUES ('221', '0', 'Tanzania, United Republic of', 'TZ');
INSERT INTO `rainlab_user_countries` VALUES ('222', '0', 'Thailand', 'TH');
INSERT INTO `rainlab_user_countries` VALUES ('223', '0', 'Timor-Leste', 'TL');
INSERT INTO `rainlab_user_countries` VALUES ('224', '0', 'Togo', 'TG');
INSERT INTO `rainlab_user_countries` VALUES ('225', '0', 'Tokelau', 'TK');
INSERT INTO `rainlab_user_countries` VALUES ('226', '0', 'Tonga', 'TO');
INSERT INTO `rainlab_user_countries` VALUES ('227', '0', 'Trinidad and Tobago', 'TT');
INSERT INTO `rainlab_user_countries` VALUES ('228', '0', 'Tunisia', 'TN');
INSERT INTO `rainlab_user_countries` VALUES ('229', '0', 'Turkey', 'TR');
INSERT INTO `rainlab_user_countries` VALUES ('230', '0', 'Turkmenistan', 'TM');
INSERT INTO `rainlab_user_countries` VALUES ('231', '0', 'Turks and Caicos Islands', 'TC');
INSERT INTO `rainlab_user_countries` VALUES ('232', '0', 'Tuvalu', 'TV');
INSERT INTO `rainlab_user_countries` VALUES ('233', '0', 'Uganda', 'UG');
INSERT INTO `rainlab_user_countries` VALUES ('234', '0', 'Ukraine', 'UA');
INSERT INTO `rainlab_user_countries` VALUES ('235', '0', 'United Arab Emirates', 'AE');
INSERT INTO `rainlab_user_countries` VALUES ('236', '0', 'United States Minor Outlying Islands', 'UM');
INSERT INTO `rainlab_user_countries` VALUES ('237', '0', 'Uruguay', 'UY');
INSERT INTO `rainlab_user_countries` VALUES ('238', '0', 'Uzbekistan', 'UZ');
INSERT INTO `rainlab_user_countries` VALUES ('239', '0', 'Vanuatu', 'VU');
INSERT INTO `rainlab_user_countries` VALUES ('240', '0', 'Venezuela, Bolivarian Republic of', 'VE');
INSERT INTO `rainlab_user_countries` VALUES ('241', '0', 'Viet Nam', 'VN');
INSERT INTO `rainlab_user_countries` VALUES ('242', '0', 'Virgin Islands, British', 'VG');
INSERT INTO `rainlab_user_countries` VALUES ('243', '0', 'Virgin Islands, U.S.', 'VI');
INSERT INTO `rainlab_user_countries` VALUES ('244', '0', 'Wallis and Futuna', 'WF');
INSERT INTO `rainlab_user_countries` VALUES ('245', '0', 'Western Sahara', 'EH');
INSERT INTO `rainlab_user_countries` VALUES ('246', '0', 'Yemen', 'YE');
INSERT INTO `rainlab_user_countries` VALUES ('247', '0', 'Zambia', 'ZM');
INSERT INTO `rainlab_user_countries` VALUES ('248', '0', 'Zimbabwe', 'ZW');

-- ----------------------------
-- Table structure for rainlab_user_mail_blockers
-- ----------------------------
DROP TABLE IF EXISTS `rainlab_user_mail_blockers`;
CREATE TABLE `rainlab_user_mail_blockers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `rainlab_user_mail_blockers_email_index` (`email`),
  KEY `rainlab_user_mail_blockers_template_index` (`template`),
  KEY `rainlab_user_mail_blockers_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rainlab_user_mail_blockers
-- ----------------------------

-- ----------------------------
-- Table structure for rainlab_user_states
-- ----------------------------
DROP TABLE IF EXISTS `rainlab_user_states`;
CREATE TABLE `rainlab_user_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_user_states_country_id_index` (`country_id`),
  KEY `rainlab_user_states_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rainlab_user_states
-- ----------------------------
INSERT INTO `rainlab_user_states` VALUES ('1', '1', 'Alabama', 'AL');
INSERT INTO `rainlab_user_states` VALUES ('2', '1', 'Alaska', 'AK');
INSERT INTO `rainlab_user_states` VALUES ('3', '1', 'American Samoa', 'AS');
INSERT INTO `rainlab_user_states` VALUES ('4', '1', 'Arizona', 'AZ');
INSERT INTO `rainlab_user_states` VALUES ('5', '1', 'Arkansas', 'AR');
INSERT INTO `rainlab_user_states` VALUES ('6', '1', 'California', 'CA');
INSERT INTO `rainlab_user_states` VALUES ('7', '1', 'Colorado', 'CO');
INSERT INTO `rainlab_user_states` VALUES ('8', '1', 'Connecticut', 'CT');
INSERT INTO `rainlab_user_states` VALUES ('9', '1', 'Delaware', 'DE');
INSERT INTO `rainlab_user_states` VALUES ('10', '1', 'Dist. of Columbia', 'DC');
INSERT INTO `rainlab_user_states` VALUES ('11', '1', 'Florida', 'FL');
INSERT INTO `rainlab_user_states` VALUES ('12', '1', 'Georgia', 'GA');
INSERT INTO `rainlab_user_states` VALUES ('13', '1', 'Guam', 'GU');
INSERT INTO `rainlab_user_states` VALUES ('14', '1', 'Hawaii', 'HI');
INSERT INTO `rainlab_user_states` VALUES ('15', '1', 'Idaho', 'ID');
INSERT INTO `rainlab_user_states` VALUES ('16', '1', 'Illinois', 'IL');
INSERT INTO `rainlab_user_states` VALUES ('17', '1', 'Indiana', 'IN');
INSERT INTO `rainlab_user_states` VALUES ('18', '1', 'Iowa', 'IA');
INSERT INTO `rainlab_user_states` VALUES ('19', '1', 'Kansas', 'KS');
INSERT INTO `rainlab_user_states` VALUES ('20', '1', 'Kentucky', 'KY');
INSERT INTO `rainlab_user_states` VALUES ('21', '1', 'Louisiana', 'LA');
INSERT INTO `rainlab_user_states` VALUES ('22', '1', 'Maine', 'ME');
INSERT INTO `rainlab_user_states` VALUES ('23', '1', 'Maryland', 'MD');
INSERT INTO `rainlab_user_states` VALUES ('24', '1', 'Marshall Islands', 'MH');
INSERT INTO `rainlab_user_states` VALUES ('25', '1', 'Massachusetts', 'MA');
INSERT INTO `rainlab_user_states` VALUES ('26', '1', 'Michigan', 'MI');
INSERT INTO `rainlab_user_states` VALUES ('27', '1', 'Micronesia', 'FM');
INSERT INTO `rainlab_user_states` VALUES ('28', '1', 'Minnesota', 'MN');
INSERT INTO `rainlab_user_states` VALUES ('29', '1', 'Mississippi', 'MS');
INSERT INTO `rainlab_user_states` VALUES ('30', '1', 'Missouri', 'MO');
INSERT INTO `rainlab_user_states` VALUES ('31', '1', 'Montana', 'MT');
INSERT INTO `rainlab_user_states` VALUES ('32', '1', 'Nebraska', 'NE');
INSERT INTO `rainlab_user_states` VALUES ('33', '1', 'Nevada', 'NV');
INSERT INTO `rainlab_user_states` VALUES ('34', '1', 'New Hampshire', 'NH');
INSERT INTO `rainlab_user_states` VALUES ('35', '1', 'New Jersey', 'NJ');
INSERT INTO `rainlab_user_states` VALUES ('36', '1', 'New Mexico', 'NM');
INSERT INTO `rainlab_user_states` VALUES ('37', '1', 'New York', 'NY');
INSERT INTO `rainlab_user_states` VALUES ('38', '1', 'North Carolina', 'NC');
INSERT INTO `rainlab_user_states` VALUES ('39', '1', 'North Dakota', 'ND');
INSERT INTO `rainlab_user_states` VALUES ('40', '1', 'Northern Marianas', 'MP');
INSERT INTO `rainlab_user_states` VALUES ('41', '1', 'Ohio', 'OH');
INSERT INTO `rainlab_user_states` VALUES ('42', '1', 'Oklahoma', 'OK');
INSERT INTO `rainlab_user_states` VALUES ('43', '1', 'Oregon', 'OR');
INSERT INTO `rainlab_user_states` VALUES ('44', '1', 'Palau', 'PW');
INSERT INTO `rainlab_user_states` VALUES ('45', '1', 'Pennsylvania', 'PA');
INSERT INTO `rainlab_user_states` VALUES ('46', '1', 'Puerto Rico', 'PR');
INSERT INTO `rainlab_user_states` VALUES ('47', '1', 'Rhode Island', 'RI');
INSERT INTO `rainlab_user_states` VALUES ('48', '1', 'South Carolina', 'SC');
INSERT INTO `rainlab_user_states` VALUES ('49', '1', 'South Dakota', 'SD');
INSERT INTO `rainlab_user_states` VALUES ('50', '1', 'Tennessee', 'TN');
INSERT INTO `rainlab_user_states` VALUES ('51', '1', 'Texas', 'TX');
INSERT INTO `rainlab_user_states` VALUES ('52', '1', 'Utah', 'UT');
INSERT INTO `rainlab_user_states` VALUES ('53', '1', 'Vermont', 'VT');
INSERT INTO `rainlab_user_states` VALUES ('54', '1', 'Virginia', 'VA');
INSERT INTO `rainlab_user_states` VALUES ('55', '1', 'Virgin Islands', 'VI');
INSERT INTO `rainlab_user_states` VALUES ('56', '1', 'Washington', 'WA');
INSERT INTO `rainlab_user_states` VALUES ('57', '1', 'West Virginia', 'WV');
INSERT INTO `rainlab_user_states` VALUES ('58', '1', 'Wisconsin', 'WI');
INSERT INTO `rainlab_user_states` VALUES ('59', '1', 'Wyoming', 'WY');
INSERT INTO `rainlab_user_states` VALUES ('60', '2', 'Alberta', 'AB');
INSERT INTO `rainlab_user_states` VALUES ('61', '2', 'British Columbia', 'BC');
INSERT INTO `rainlab_user_states` VALUES ('62', '2', 'Manitoba', 'MB');
INSERT INTO `rainlab_user_states` VALUES ('63', '2', 'New Brunswick', 'NB');
INSERT INTO `rainlab_user_states` VALUES ('64', '2', 'Newfoundland and Labrador', 'NL');
INSERT INTO `rainlab_user_states` VALUES ('65', '2', 'Northwest Territories', 'NT');
INSERT INTO `rainlab_user_states` VALUES ('66', '2', 'Nova Scotia', 'NS');
INSERT INTO `rainlab_user_states` VALUES ('67', '2', 'Nunavut', 'NU');
INSERT INTO `rainlab_user_states` VALUES ('68', '2', 'Ontario', 'ON');
INSERT INTO `rainlab_user_states` VALUES ('69', '2', 'Prince Edward Island', 'PE');
INSERT INTO `rainlab_user_states` VALUES ('70', '2', 'Quebec', 'QC');
INSERT INTO `rainlab_user_states` VALUES ('71', '2', 'Saskatchewan', 'SK');
INSERT INTO `rainlab_user_states` VALUES ('72', '2', 'Yukon', 'YT');
INSERT INTO `rainlab_user_states` VALUES ('73', '3', 'New South Wales', 'NSW');
INSERT INTO `rainlab_user_states` VALUES ('74', '3', 'Queensland', 'QLD');
INSERT INTO `rainlab_user_states` VALUES ('75', '3', 'South Australia', 'SA');
INSERT INTO `rainlab_user_states` VALUES ('76', '3', 'Tasmania', 'TAS');
INSERT INTO `rainlab_user_states` VALUES ('77', '3', 'Victoria', 'VIC');
INSERT INTO `rainlab_user_states` VALUES ('78', '3', 'Western Australia', 'WA');
INSERT INTO `rainlab_user_states` VALUES ('79', '3', 'Northern Territory', 'NT');
INSERT INTO `rainlab_user_states` VALUES ('80', '3', 'Australian Capital Territory', 'ACT');
INSERT INTO `rainlab_user_states` VALUES ('81', '5', 'Baden-Württemberg', 'BW');
INSERT INTO `rainlab_user_states` VALUES ('82', '5', 'Bavaria', 'BY');
INSERT INTO `rainlab_user_states` VALUES ('83', '5', 'Berlin', 'BE');
INSERT INTO `rainlab_user_states` VALUES ('84', '5', 'Brandenburg', 'BB');
INSERT INTO `rainlab_user_states` VALUES ('85', '5', 'Bremen', 'HB');
INSERT INTO `rainlab_user_states` VALUES ('86', '5', 'Hamburg', 'HH');
INSERT INTO `rainlab_user_states` VALUES ('87', '5', 'Hesse', 'HE');
INSERT INTO `rainlab_user_states` VALUES ('88', '5', 'Mecklenburg-Vorpommern', 'MV');
INSERT INTO `rainlab_user_states` VALUES ('89', '5', 'Lower Saxony', 'NI');
INSERT INTO `rainlab_user_states` VALUES ('90', '5', 'North Rhine-Westphalia', 'NW');
INSERT INTO `rainlab_user_states` VALUES ('91', '5', 'Rhineland-Palatinate', 'RP');
INSERT INTO `rainlab_user_states` VALUES ('92', '5', 'Saarland', 'SL');
INSERT INTO `rainlab_user_states` VALUES ('93', '5', 'Saxony', 'SN');
INSERT INTO `rainlab_user_states` VALUES ('94', '5', 'Saxony-Anhalt', 'ST');
INSERT INTO `rainlab_user_states` VALUES ('95', '5', 'Schleswig-Holstein', 'SH');
INSERT INTO `rainlab_user_states` VALUES ('96', '5', 'Thuringia', 'TH');
INSERT INTO `rainlab_user_states` VALUES ('97', '7', 'Dublin', 'D');
INSERT INTO `rainlab_user_states` VALUES ('98', '7', 'Wicklow', 'WW');
INSERT INTO `rainlab_user_states` VALUES ('99', '7', 'Wexford', 'WX');
INSERT INTO `rainlab_user_states` VALUES ('100', '7', 'Carlow', 'CW');
INSERT INTO `rainlab_user_states` VALUES ('101', '7', 'Kildare', 'KE');
INSERT INTO `rainlab_user_states` VALUES ('102', '7', 'Meath', 'MH');
INSERT INTO `rainlab_user_states` VALUES ('103', '7', 'Louth', 'LH');
INSERT INTO `rainlab_user_states` VALUES ('104', '7', 'Monaghan', 'MN');
INSERT INTO `rainlab_user_states` VALUES ('105', '7', 'Cavan', 'CN');
INSERT INTO `rainlab_user_states` VALUES ('106', '7', 'Longford', 'LD');
INSERT INTO `rainlab_user_states` VALUES ('107', '7', 'Westmeath', 'WH');
INSERT INTO `rainlab_user_states` VALUES ('108', '7', 'Offaly', 'OY');
INSERT INTO `rainlab_user_states` VALUES ('109', '7', 'Laois', 'LS');
INSERT INTO `rainlab_user_states` VALUES ('110', '7', 'Kilkenny', 'KK');
INSERT INTO `rainlab_user_states` VALUES ('111', '7', 'Waterford', 'WD');
INSERT INTO `rainlab_user_states` VALUES ('112', '7', 'Cork', 'C');
INSERT INTO `rainlab_user_states` VALUES ('113', '7', 'Kerry', 'KY');
INSERT INTO `rainlab_user_states` VALUES ('114', '7', 'Limerick', 'LK');
INSERT INTO `rainlab_user_states` VALUES ('115', '7', 'North Tipperary', 'TN');
INSERT INTO `rainlab_user_states` VALUES ('116', '7', 'South Tipperary', 'TS');
INSERT INTO `rainlab_user_states` VALUES ('117', '7', 'Clare', 'CE');
INSERT INTO `rainlab_user_states` VALUES ('118', '7', 'Galway', 'G');
INSERT INTO `rainlab_user_states` VALUES ('119', '7', 'Mayo', 'MO');
INSERT INTO `rainlab_user_states` VALUES ('120', '7', 'Roscommon', 'RN');
INSERT INTO `rainlab_user_states` VALUES ('121', '7', 'Sligo', 'SO');
INSERT INTO `rainlab_user_states` VALUES ('122', '7', 'Leitrim', 'LM');
INSERT INTO `rainlab_user_states` VALUES ('123', '7', 'Donegal', 'DL');
INSERT INTO `rainlab_user_states` VALUES ('124', '22', 'Drenthe', 'DR');
INSERT INTO `rainlab_user_states` VALUES ('125', '22', 'Flevoland', 'FL');
INSERT INTO `rainlab_user_states` VALUES ('126', '22', 'Friesland', 'FR');
INSERT INTO `rainlab_user_states` VALUES ('127', '22', 'Gelderland', 'GE');
INSERT INTO `rainlab_user_states` VALUES ('128', '22', 'Groningen', 'GR');
INSERT INTO `rainlab_user_states` VALUES ('129', '22', 'Limburg', 'LI');
INSERT INTO `rainlab_user_states` VALUES ('130', '22', 'Noord-Brabant', 'NB');
INSERT INTO `rainlab_user_states` VALUES ('131', '22', 'Noord-Holland', 'NH');
INSERT INTO `rainlab_user_states` VALUES ('132', '22', 'Overijssel', 'OV');
INSERT INTO `rainlab_user_states` VALUES ('133', '22', 'Utrecht', 'UT');
INSERT INTO `rainlab_user_states` VALUES ('134', '22', 'Zeeland', 'ZE');
INSERT INTO `rainlab_user_states` VALUES ('135', '22', 'Zuid-Holland', 'ZH');
INSERT INTO `rainlab_user_states` VALUES ('136', '17', 'Aberdeenshire', 'ABE');
INSERT INTO `rainlab_user_states` VALUES ('137', '17', 'Anglesey', 'ALY');
INSERT INTO `rainlab_user_states` VALUES ('138', '17', 'Angus', 'ANG');
INSERT INTO `rainlab_user_states` VALUES ('139', '17', 'Argyll', 'ARG');
INSERT INTO `rainlab_user_states` VALUES ('140', '17', 'Ayrshire', 'AYR');
INSERT INTO `rainlab_user_states` VALUES ('141', '17', 'Banffshire', 'BAN');
INSERT INTO `rainlab_user_states` VALUES ('142', '17', 'Bedfordshire', 'BED');
INSERT INTO `rainlab_user_states` VALUES ('143', '17', 'Berkshire', 'BER');
INSERT INTO `rainlab_user_states` VALUES ('144', '17', 'Berwickshire', 'BWS');
INSERT INTO `rainlab_user_states` VALUES ('145', '17', 'Brecknockshire', 'BRE');
INSERT INTO `rainlab_user_states` VALUES ('146', '17', 'Buckinghamshire', 'BUC');
INSERT INTO `rainlab_user_states` VALUES ('147', '17', 'Bute', 'BUT');
INSERT INTO `rainlab_user_states` VALUES ('148', '17', 'Caernarfonshire', 'CAE');
INSERT INTO `rainlab_user_states` VALUES ('149', '17', 'Caithness', 'CAI');
INSERT INTO `rainlab_user_states` VALUES ('150', '17', 'Cambridgeshire', 'CAM');
INSERT INTO `rainlab_user_states` VALUES ('151', '17', 'Cardiganshire', 'CAR');
INSERT INTO `rainlab_user_states` VALUES ('152', '17', 'Carmarthenshire', 'CMS');
INSERT INTO `rainlab_user_states` VALUES ('153', '17', 'Cheshire', 'CHE');
INSERT INTO `rainlab_user_states` VALUES ('154', '17', 'Clackmannanshire', 'CLA');
INSERT INTO `rainlab_user_states` VALUES ('155', '17', 'Cleveland', 'CLE');
INSERT INTO `rainlab_user_states` VALUES ('156', '17', 'Cornwall', 'COR');
INSERT INTO `rainlab_user_states` VALUES ('157', '17', 'Cromartyshire', 'CRO');
INSERT INTO `rainlab_user_states` VALUES ('158', '17', 'Cumberland', 'CBR');
INSERT INTO `rainlab_user_states` VALUES ('159', '17', 'Cumbria', 'CUM');
INSERT INTO `rainlab_user_states` VALUES ('160', '17', 'Denbighshire', 'DEN');
INSERT INTO `rainlab_user_states` VALUES ('161', '17', 'Derbyshire', 'DER');
INSERT INTO `rainlab_user_states` VALUES ('162', '17', 'Devon', 'DEV');
INSERT INTO `rainlab_user_states` VALUES ('163', '17', 'Dorset', 'DOR');
INSERT INTO `rainlab_user_states` VALUES ('164', '17', 'Dumbartonshire', 'DBS');
INSERT INTO `rainlab_user_states` VALUES ('165', '17', 'Dumfriesshire', 'DUM');
INSERT INTO `rainlab_user_states` VALUES ('166', '17', 'Durham', 'DUR');
INSERT INTO `rainlab_user_states` VALUES ('167', '17', 'East Lothian', 'ELO');
INSERT INTO `rainlab_user_states` VALUES ('168', '17', 'Essex', 'ESS');
INSERT INTO `rainlab_user_states` VALUES ('169', '17', 'Flintshire', 'FLI');
INSERT INTO `rainlab_user_states` VALUES ('170', '17', 'Fife', 'FIF');
INSERT INTO `rainlab_user_states` VALUES ('171', '17', 'Glamorgan', 'GLA');
INSERT INTO `rainlab_user_states` VALUES ('172', '17', 'Gloucestershire', 'GLO');
INSERT INTO `rainlab_user_states` VALUES ('173', '17', 'Hampshire', 'HAM');
INSERT INTO `rainlab_user_states` VALUES ('174', '17', 'Herefordshire', 'HER');
INSERT INTO `rainlab_user_states` VALUES ('175', '17', 'Hertfordshire', 'HTF');
INSERT INTO `rainlab_user_states` VALUES ('176', '17', 'Huntingdonshire', 'HUN');
INSERT INTO `rainlab_user_states` VALUES ('177', '17', 'Inverness', 'INV');
INSERT INTO `rainlab_user_states` VALUES ('178', '17', 'Kent', 'KEN');
INSERT INTO `rainlab_user_states` VALUES ('179', '17', 'Kincardineshire', 'KCD');
INSERT INTO `rainlab_user_states` VALUES ('180', '17', 'Kinross-shire', 'KIN');
INSERT INTO `rainlab_user_states` VALUES ('181', '17', 'Kirkcudbrightshire', 'KIR');
INSERT INTO `rainlab_user_states` VALUES ('182', '17', 'Lanarkshire', 'LKS');
INSERT INTO `rainlab_user_states` VALUES ('183', '17', 'Lancashire', 'LAN');
INSERT INTO `rainlab_user_states` VALUES ('184', '17', 'Leicestershire', 'LEI');
INSERT INTO `rainlab_user_states` VALUES ('185', '17', 'Lincolnshire', 'LIN');
INSERT INTO `rainlab_user_states` VALUES ('186', '17', 'London', 'LON');
INSERT INTO `rainlab_user_states` VALUES ('187', '17', 'Manchester', 'MAN');
INSERT INTO `rainlab_user_states` VALUES ('188', '17', 'Merionethshire', 'MER');
INSERT INTO `rainlab_user_states` VALUES ('189', '17', 'Merseyside', 'MER');
INSERT INTO `rainlab_user_states` VALUES ('190', '17', 'Middlesex', 'MDX');
INSERT INTO `rainlab_user_states` VALUES ('191', '17', 'Midlands', 'MID');
INSERT INTO `rainlab_user_states` VALUES ('192', '17', 'Midlothian', 'MLT');
INSERT INTO `rainlab_user_states` VALUES ('193', '17', 'Monmouthshire', 'MON');
INSERT INTO `rainlab_user_states` VALUES ('194', '17', 'Montgomeryshire', 'MGY');
INSERT INTO `rainlab_user_states` VALUES ('195', '17', 'Moray', 'MOR');
INSERT INTO `rainlab_user_states` VALUES ('196', '17', 'Nairnshire', 'NAI');
INSERT INTO `rainlab_user_states` VALUES ('197', '17', 'Norfolk', 'NOR');
INSERT INTO `rainlab_user_states` VALUES ('198', '17', 'Northamptonshire', 'NMP');
INSERT INTO `rainlab_user_states` VALUES ('199', '17', 'Northumberland', 'NUM');
INSERT INTO `rainlab_user_states` VALUES ('200', '17', 'Nottinghamshire', 'NOT');
INSERT INTO `rainlab_user_states` VALUES ('201', '17', 'Orkney', 'ORK');
INSERT INTO `rainlab_user_states` VALUES ('202', '17', 'Oxfordshire', 'OXF');
INSERT INTO `rainlab_user_states` VALUES ('203', '17', 'Peebleshire', 'PEE');
INSERT INTO `rainlab_user_states` VALUES ('204', '17', 'Pembrokeshire', 'PEM');
INSERT INTO `rainlab_user_states` VALUES ('205', '17', 'Perthshire', 'PER');
INSERT INTO `rainlab_user_states` VALUES ('206', '17', 'Radnorshire', 'RAD');
INSERT INTO `rainlab_user_states` VALUES ('207', '17', 'Renfrewshire', 'REN');
INSERT INTO `rainlab_user_states` VALUES ('208', '17', 'Ross & Cromarty', 'ROS');
INSERT INTO `rainlab_user_states` VALUES ('209', '17', 'Roxburghshire', 'ROX');
INSERT INTO `rainlab_user_states` VALUES ('210', '17', 'Rutland', 'RUT');
INSERT INTO `rainlab_user_states` VALUES ('211', '17', 'Selkirkshire', 'SEL');
INSERT INTO `rainlab_user_states` VALUES ('212', '17', 'Shetland', 'SHE');
INSERT INTO `rainlab_user_states` VALUES ('213', '17', 'Shropshire', 'SHR');
INSERT INTO `rainlab_user_states` VALUES ('214', '17', 'Somerset', 'SOM');
INSERT INTO `rainlab_user_states` VALUES ('215', '17', 'Staffordshire', 'STA');
INSERT INTO `rainlab_user_states` VALUES ('216', '17', 'Stirlingshire', 'STI');
INSERT INTO `rainlab_user_states` VALUES ('217', '17', 'Suffolk', 'SUF');
INSERT INTO `rainlab_user_states` VALUES ('218', '17', 'Surrey', 'SUR');
INSERT INTO `rainlab_user_states` VALUES ('219', '17', 'Sussex', 'SUS');
INSERT INTO `rainlab_user_states` VALUES ('220', '17', 'Sutherland', 'SUT');
INSERT INTO `rainlab_user_states` VALUES ('221', '17', 'Tyne & Wear', 'TYN');
INSERT INTO `rainlab_user_states` VALUES ('222', '17', 'Warwickshire', 'WAR');
INSERT INTO `rainlab_user_states` VALUES ('223', '17', 'West Lothian', 'WLO');
INSERT INTO `rainlab_user_states` VALUES ('224', '17', 'Westmorland', 'WES');
INSERT INTO `rainlab_user_states` VALUES ('225', '17', 'Wigtownshire', 'WIG');
INSERT INTO `rainlab_user_states` VALUES ('226', '17', 'Wiltshire', 'WIL');
INSERT INTO `rainlab_user_states` VALUES ('227', '17', 'Worcestershire', 'WOR');
INSERT INTO `rainlab_user_states` VALUES ('228', '17', 'Yorkshire', 'YOR');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci,
  `last_activity` int(11) DEFAULT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sessions
-- ----------------------------

-- ----------------------------
-- Table structure for system_event_logs
-- ----------------------------
DROP TABLE IF EXISTS `system_event_logs`;
CREATE TABLE `system_event_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `details` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `system_event_logs_level_index` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_event_logs
-- ----------------------------

-- ----------------------------
-- Table structure for system_files
-- ----------------------------
DROP TABLE IF EXISTS `system_files`;
CREATE TABLE `system_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `system_files_field_index` (`field`),
  KEY `system_files_attachment_id_index` (`attachment_id`),
  KEY `system_files_attachment_type_index` (`attachment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_files
-- ----------------------------

-- ----------------------------
-- Table structure for system_mail_layouts
-- ----------------------------
DROP TABLE IF EXISTS `system_mail_layouts`;
CREATE TABLE `system_mail_layouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `content_css` text COLLATE utf8_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_mail_layouts
-- ----------------------------
INSERT INTO `system_mail_layouts` VALUES ('1', 'Default', 'default', '<html>\n    <head>\n        <style type=\"text/css\" media=\"screen\">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ message|raw }}\n    </body>\n</html>', '{{ message|raw }}', 'a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}', '1', '2014-10-05 17:39:02', '2014-10-05 17:39:02');
INSERT INTO `system_mail_layouts` VALUES ('2', 'System', 'system', '<html>\n    <head>\n        <style type=\"text/css\" media=\"screen\">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ message|raw }}\n        <hr />\n        <p>This is an automatic message. Please do not reply to it.</p>\n    </body>\n</html>', '{{ message|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', 'a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}', '1', '2014-10-05 17:39:02', '2014-10-05 17:39:02');

-- ----------------------------
-- Table structure for system_mail_templates
-- ----------------------------
DROP TABLE IF EXISTS `system_mail_templates`;
CREATE TABLE `system_mail_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `system_mail_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_mail_templates
-- ----------------------------

-- ----------------------------
-- Table structure for system_parameters
-- ----------------------------
DROP TABLE IF EXISTS `system_parameters`;
CREATE TABLE `system_parameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item_index` (`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_parameters
-- ----------------------------
INSERT INTO `system_parameters` VALUES ('1', 'system', 'update', 'count', '1');
INSERT INTO `system_parameters` VALUES ('2', 'system', 'core', 'hash', '\"76390a98d23349e9219b232504fc2de7\"');
INSERT INTO `system_parameters` VALUES ('3', 'system', 'core', 'build', '\"151\"');
INSERT INTO `system_parameters` VALUES ('4', 'system', 'update', 'retry', '1412617630');

-- ----------------------------
-- Table structure for system_plugin_history
-- ----------------------------
DROP TABLE IF EXISTS `system_plugin_history`;
CREATE TABLE `system_plugin_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `detail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `system_plugin_history_code_index` (`code`),
  KEY `system_plugin_history_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_plugin_history
-- ----------------------------
INSERT INTO `system_plugin_history` VALUES ('1', 'RainLab.User', 'script', '1.0.1', 'create_users_table.php', '2014-10-05 17:38:37');
INSERT INTO `system_plugin_history` VALUES ('2', 'RainLab.User', 'script', '1.0.1', 'create_throttle_table.php', '2014-10-05 17:38:38');
INSERT INTO `system_plugin_history` VALUES ('3', 'RainLab.User', 'script', '1.0.1', 'create_states_table.php', '2014-10-05 17:38:41');
INSERT INTO `system_plugin_history` VALUES ('4', 'RainLab.User', 'script', '1.0.1', 'create_countries_table.php', '2014-10-05 17:38:42');
INSERT INTO `system_plugin_history` VALUES ('5', 'RainLab.User', 'comment', '1.0.1', 'Initialize plugin', '2014-10-05 17:38:42');
INSERT INTO `system_plugin_history` VALUES ('6', 'RainLab.User', 'script', '1.0.2', 'seed_all_tables.php', '2014-10-05 17:38:55');
INSERT INTO `system_plugin_history` VALUES ('7', 'RainLab.User', 'comment', '1.0.2', 'Add seed data for countries and states', '2014-10-05 17:38:55');
INSERT INTO `system_plugin_history` VALUES ('8', 'RainLab.User', 'comment', '1.0.3', 'Translated hard-coded text to language strings', '2014-10-05 17:38:55');
INSERT INTO `system_plugin_history` VALUES ('9', 'RainLab.User', 'comment', '1.0.4', 'Improvements to user-interface for Location manager', '2014-10-05 17:38:55');
INSERT INTO `system_plugin_history` VALUES ('10', 'RainLab.User', 'script', '1.0.5', 'users_add_contact_details.php', '2014-10-05 17:38:57');
INSERT INTO `system_plugin_history` VALUES ('11', 'RainLab.User', 'comment', '1.0.5', 'Added contact details for users', '2014-10-05 17:38:57');
INSERT INTO `system_plugin_history` VALUES ('12', 'RainLab.User', 'script', '1.0.6', 'create_mail_blockers_table.php', '2014-10-05 17:38:59');
INSERT INTO `system_plugin_history` VALUES ('13', 'RainLab.User', 'comment', '1.0.6', 'Added Mail Blocker utility so users can block specific mail templates', '2014-10-05 17:38:59');
INSERT INTO `system_plugin_history` VALUES ('14', 'RainLab.User', 'comment', '1.0.7', 'Adds default country and state fields to Settings page', '2014-10-05 17:38:59');
INSERT INTO `system_plugin_history` VALUES ('15', 'RainLab.User', 'comment', '1.0.8', 'Updated the Settings page', '2014-10-05 17:38:59');
INSERT INTO `system_plugin_history` VALUES ('16', 'RainLab.User', 'comment', '1.0.9', 'Adds new welcome mail message for users and administrators.', '2014-10-05 17:38:59');
INSERT INTO `system_plugin_history` VALUES ('17', 'RainLab.User', 'comment', '1.0.10', 'Adds administrator-only activation mode.', '2014-10-05 17:38:59');
INSERT INTO `system_plugin_history` VALUES ('18', 'RainLab.User', 'script', '1.0.11', 'users_add_login_column.php', '2014-10-05 17:39:02');
INSERT INTO `system_plugin_history` VALUES ('19', 'RainLab.User', 'comment', '1.0.11', 'Users now have an optional login field that defaults to the email field.', '2014-10-05 17:39:02');

-- ----------------------------
-- Table structure for system_plugin_versions
-- ----------------------------
DROP TABLE IF EXISTS `system_plugin_versions`;
CREATE TABLE `system_plugin_versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `system_plugin_versions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_plugin_versions
-- ----------------------------
INSERT INTO `system_plugin_versions` VALUES ('1', 'RainLab.User', '1.0.11', '2014-10-05 17:39:02', '0');

-- ----------------------------
-- Table structure for system_request_logs
-- ----------------------------
DROP TABLE IF EXISTS `system_request_logs`;
CREATE TABLE `system_request_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_request_logs
-- ----------------------------
INSERT INTO `system_request_logs` VALUES ('1', '404', 'http://localhost:88/demo', null, '1', '2014-10-05 17:52:25', '2014-10-05 17:52:25');

-- ----------------------------
-- Table structure for system_settings
-- ----------------------------
DROP TABLE IF EXISTS `system_settings`;
CREATE TABLE `system_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `system_settings_item_index` (`item`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_settings
-- ----------------------------
INSERT INTO `system_settings` VALUES ('1', 'user_settings', '{\"require_activation\":true,\"activate_mode\":\"auto\",\"use_throttle\":true,\"default_country\":\"1\",\"default_state\":\"1\",\"welcome_template\":\"rainlab.user::mail.welcome\"}');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `state_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_addr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_login_unique` (`login`),
  KEY `users_activation_code_index` (`activation_code`),
  KEY `users_reset_password_code_index` (`reset_password_code`),
  KEY `users_country_id_index` (`country_id`),
  KEY `users_state_id_index` (`state_id`),
  KEY `users_login_index` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'bekt', 'subekti.cahyo@gmail.com', '$2y$10$acoo9DjzzvKC5U6.0Vi99uYUkhDYuufx4CQzxIGpUpUqd2VsVyKc2', null, null, null, null, '1', '2014-10-05 17:49:58', null, null, null, '2014-10-05 17:49:52', '2014-10-05 17:49:58', '', '', '', '', '', 'subekticahyow');

-- ----------------------------
-- Table structure for user_throttle
-- ----------------------------
DROP TABLE IF EXISTS `user_throttle`;
CREATE TABLE `user_throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_throttle
-- ----------------------------
