/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : module_database

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2020-12-21 13:23:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add permission', '1', 'add_permission');
INSERT INTO `auth_permission` VALUES ('2', 'Can change permission', '1', 'change_permission');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete permission', '1', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('4', 'Can view permission', '1', 'view_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can add group', '2', 'add_group');
INSERT INTO `auth_permission` VALUES ('6', 'Can change group', '2', 'change_group');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete group', '2', 'delete_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can view group', '2', 'view_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can add user', '3', 'add_user');
INSERT INTO `auth_permission` VALUES ('10', 'Can change user', '3', 'change_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete user', '3', 'delete_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can view user', '3', 'view_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add auths', '6', 'add_auths');
INSERT INTO `auth_permission` VALUES ('22', 'Can change auths', '6', 'change_auths');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete auths', '6', 'delete_auths');
INSERT INTO `auth_permission` VALUES ('24', 'Can view auths', '6', 'view_auths');
INSERT INTO `auth_permission` VALUES ('25', 'Can add member', '7', 'add_member');
INSERT INTO `auth_permission` VALUES ('26', 'Can change member', '7', 'change_member');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete member', '7', 'delete_member');
INSERT INTO `auth_permission` VALUES ('28', 'Can view member', '7', 'view_member');
INSERT INTO `auth_permission` VALUES ('29', 'Can add roles', '8', 'add_roles');
INSERT INTO `auth_permission` VALUES ('30', 'Can change roles', '8', 'change_roles');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete roles', '8', 'delete_roles');
INSERT INTO `auth_permission` VALUES ('32', 'Can view roles', '8', 'view_roles');
INSERT INTO `auth_permission` VALUES ('33', 'Can add roles to authos', '9', 'add_rolestoauthos');
INSERT INTO `auth_permission` VALUES ('34', 'Can change roles to authos', '9', 'change_rolestoauthos');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete roles to authos', '9', 'delete_rolestoauthos');
INSERT INTO `auth_permission` VALUES ('36', 'Can view roles to authos', '9', 'view_rolestoauthos');
INSERT INTO `auth_permission` VALUES ('37', 'Can add demo data', '10', 'add_demodata');
INSERT INTO `auth_permission` VALUES ('38', 'Can change demo data', '10', 'change_demodata');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete demo data', '10', 'delete_demodata');
INSERT INTO `auth_permission` VALUES ('40', 'Can view demo data', '10', 'view_demodata');
INSERT INTO `auth_permission` VALUES ('41', 'Can add excute record', '11', 'add_excuterecord');
INSERT INTO `auth_permission` VALUES ('42', 'Can change excute record', '11', 'change_excuterecord');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete excute record', '11', 'delete_excuterecord');
INSERT INTO `auth_permission` VALUES ('44', 'Can view excute record', '11', 'view_excuterecord');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('1', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('6', 'web', 'auths');
INSERT INTO `django_content_type` VALUES ('10', 'web', 'demodata');
INSERT INTO `django_content_type` VALUES ('11', 'web', 'excuterecord');
INSERT INTO `django_content_type` VALUES ('7', 'web', 'member');
INSERT INTO `django_content_type` VALUES ('8', 'web', 'roles');
INSERT INTO `django_content_type` VALUES ('9', 'web', 'rolestoauthos');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2020-12-17 14:33:19.168561');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2020-12-17 14:33:19.255296');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2020-12-17 14:33:19.517593');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2020-12-17 14:33:20.008312');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2020-12-17 14:33:20.024238');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2020-12-17 14:33:20.030223');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2020-12-17 14:33:20.088099');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2020-12-17 14:33:20.090063');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2020-12-17 14:33:20.097045');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2020-12-17 14:33:20.138932');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2020-12-17 14:33:20.190812');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0010_alter_group_name_max_length', '2020-12-17 14:33:20.209742');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0011_update_proxy_permissions', '2020-12-17 14:33:20.216723');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0012_alter_user_first_name_max_length', '2020-12-17 14:33:20.256618');
INSERT INTO `django_migrations` VALUES ('15', 'sessions', '0001_initial', '2020-12-17 14:33:20.290557');
INSERT INTO `django_migrations` VALUES ('16', 'web', '0001_initial', '2020-12-17 14:33:20.417212');
INSERT INTO `django_migrations` VALUES ('17', 'web', '0002_member_roleskey', '2020-12-17 16:48:13.784011');
INSERT INTO `django_migrations` VALUES ('18', 'web', '0003_member_info_datetime', '2020-12-17 16:56:23.255741');
INSERT INTO `django_migrations` VALUES ('19', 'web', '0004_demodata', '2020-12-17 17:17:53.671465');
INSERT INTO `django_migrations` VALUES ('20', 'web', '0005_excuterecord', '2020-12-19 09:41:10.238255');
INSERT INTO `django_migrations` VALUES ('21', 'web', '0006_demodata_state', '2020-12-19 10:13:33.535879');
INSERT INTO `django_migrations` VALUES ('22', 'web', '0007_auto_20201219_1139', '2020-12-19 11:39:57.812585');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('1p2ps5mof5khdsbbmz70boqlc66fa9j7', '.eJyrViotTi3KS8xNVbJSMrSAAyUdsER8ZoqSlWEtAOF2C0I:1kqC5Z:uhPc-jray8ozGHBb4gR0vwKmozkdT8mLsJt1HOJK7Ro', '2021-01-01 17:30:17.346465');
INSERT INTO `django_session` VALUES ('bql9fr7e5s41nt51l6j0njqzf0kgls37', '.eJyrViotTi3KS8xNVbJSMrSAAyUdsER8ZoqSlWEtAOF2C0I:1kqBxs:CB3tPYJeRQ6oH6GXwT-2tnCO_cRZNGi7sx9cLgYFwqU', '2021-01-01 17:22:20.375858');
INSERT INTO `django_session` VALUES ('d9o45sgrt848yg3gs7irvrovhln9fvuf', '.eJyrViotTi3KS8xNVbJSMrSAAyUdsER8ZoqSlWEtAOF2C0I:1krDGt:GqAjerHzPUugd9RdJCtnNaOmjZ_NOLxjvFCc8NPFTEA', '2021-01-04 12:58:11.637690');
INSERT INTO `django_session` VALUES ('tnkr8zkcegljviuqkx3tpcx1idhut5k6', '.eJyrViotTi3KS8xNVbJSMrSAAyUdsER8ZoqSlWEtAOF2C0I:1kqTOn:xrdx9viT7ILbGYIfIRZJYUyb_H8yuOWDiGIJTW-Y_9g', '2021-01-02 11:59:17.030479');

-- ----------------------------
-- Table structure for `web_auths`
-- ----------------------------
DROP TABLE IF EXISTS `web_auths`;
CREATE TABLE `web_auths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_type` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `auth_flag` varchar(50) DEFAULT NULL,
  `req_url` varchar(250) DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `component` varchar(50) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `web_auths_parent_id_6fa674f3_fk_web_auths_id` (`parent_id`),
  CONSTRAINT `web_auths_parent_id_6fa674f3_fk_web_auths_id` FOREIGN KEY (`parent_id`) REFERENCES `web_auths` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_auths
-- ----------------------------
INSERT INTO `web_auths` VALUES ('1', '0', '系统管理', 'authManage', '/authManage', null, null, 'el-icon-s-tools', null);
INSERT INTO `web_auths` VALUES ('2', '1', '帐号管理', 'member', '/authManage/member', null, null, 'el-icon-user-solid', '1');
INSERT INTO `web_auths` VALUES ('3', '1', '角色管理', 'roles', '/authManage/roles', null, null, 'el-icon-s-custom', '1');
INSERT INTO `web_auths` VALUES ('4', '1', '权限配置', 'auth', '/authManage/auth', null, null, 'el-icon-menu', '1');
INSERT INTO `web_auths` VALUES ('5', '1', '示例菜单', 'demo', '/demo', null, null, 'el-icon-guide', null);

-- ----------------------------
-- Table structure for `web_demodata`
-- ----------------------------
DROP TABLE IF EXISTS `web_demodata`;
CREATE TABLE `web_demodata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c1` varchar(50) DEFAULT NULL,
  `c2` varchar(50) DEFAULT NULL,
  `c3` varchar(50) DEFAULT NULL,
  `c4` varchar(50) DEFAULT NULL,
  `c5` varchar(50) DEFAULT NULL,
  `c6` varchar(50) DEFAULT NULL,
  `c7` varchar(50) DEFAULT NULL,
  `c8` varchar(50) DEFAULT NULL,
  `c9` varchar(50) DEFAULT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_demodata
-- ----------------------------
INSERT INTO `web_demodata` VALUES ('2', '1', '2', '3', '4', '5', '6', '7', '8', '9', '2');
INSERT INTO `web_demodata` VALUES ('3', '11', '22', '33', '44', '55', '66', '77', '88', '99', '2');
INSERT INTO `web_demodata` VALUES ('7', '1', '1', '1', '1', '1', '1', '2', '2', '2', '2');
INSERT INTO `web_demodata` VALUES ('8', '11', '22', '33', '44', '55', '66', '77', '88', '99', '0');

-- ----------------------------
-- Table structure for `web_excuterecord`
-- ----------------------------
DROP TABLE IF EXISTS `web_excuterecord`;
CREATE TABLE `web_excuterecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext,
  `endDateTime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_excuterecord
-- ----------------------------
INSERT INTO `web_excuterecord` VALUES ('1', '[\'\\r\\n\', \'正在 Ping www.a.shifen.com [180.101.49.11] 具有 32 字节的数据:\\r\\n\', \'来自 180.101.49.11 的回复: 字节=32 时间=9ms TTL=53\\r\\n\', \'来自 180.101.49.11 的回复: 字节=32 时间=11ms TTL=53\\r\\n\', \'来自 180.101.49.11 的回复: 字节=32 时间=13ms TTL=53\\r\\n\', \'来自 180.101.49.11 的回复: 字节=32 时间=12ms TTL=53\\r\\n\', \'\\r\\n\', \'180.101.49.11 的 Ping 统计信息:\\r\\n\', \'    数据包: 已发送 = 4，已接收 = 4，丢失 = 0 (0% 丢失)，\\r\\n\', \'往返行程的估计时间(以毫秒为单位):\\r\\n\', \'    最短 = 9ms，最长 = 13ms，平均 = 11ms\\r\\n\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'命令执行完成<===>id=2\']', '2020-12-19 11:45:35.185942');
INSERT INTO `web_excuterecord` VALUES ('2', '[\'\\r\\n\', \'正在 Ping www.a.shifen.com [180.101.49.12] 具有 32 字节的数据:\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=11ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=11ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=12ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=12ms TTL=53\\r\\n\', \'\\r\\n\', \'180.101.49.12 的 Ping 统计信息:\\r\\n\', \'    数据包: 已发送 = 4，已接收 = 4，丢失 = 0 (0% 丢失)，\\r\\n\', \'往返行程的估计时间(以毫秒为单位):\\r\\n\', \'    最短 = 11ms，最长 = 12ms，平均 = 11ms\\r\\n\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'命令执行完成<===>id=3\']', '2020-12-19 11:52:32.766938');
INSERT INTO `web_excuterecord` VALUES ('3', '[\'\\r\\n\', \'正在 Ping www.a.shifen.com [180.101.49.12] 具有 32 字节的数据:\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=9ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=10ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=12ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=11ms TTL=53\\r\\n\', \'\\r\\n\', \'180.101.49.12 的 Ping 统计信息:\\r\\n\', \'    数据包: 已发送 = 4，已接收 = 4，丢失 = 0 (0% 丢失)，\\r\\n\', \'往返行程的估计时间(以毫秒为单位):\\r\\n\', \'    最短 = 9ms，最长 = 12ms，平均 = 10ms\\r\\n\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'命令执行完成<===>id=4\']', '2020-12-19 11:53:33.229284');
INSERT INTO `web_excuterecord` VALUES ('4', '[\'\\r\\n\', \'正在 Ping www.a.shifen.com [180.101.49.12] 具有 32 字节的数据:\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=10ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=10ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=11ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=10ms TTL=53\\r\\n\', \'\\r\\n\', \'180.101.49.12 的 Ping 统计信息:\\r\\n\', \'    数据包: 已发送 = 4，已接收 = 4，丢失 = 0 (0% 丢失)，\\r\\n\', \'往返行程的估计时间(以毫秒为单位):\\r\\n\', \'    最短 = 10ms，最长 = 11ms，平均 = 10ms\\r\\n\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'命令执行完成<===>id=4\']', '2020-12-19 11:55:55.758005');
INSERT INTO `web_excuterecord` VALUES ('5', '[\'\\r\\n\', \'正在 Ping www.a.shifen.com [180.101.49.12] 具有 32 字节的数据:\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=10ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=10ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=11ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=10ms TTL=53\\r\\n\', \'\\r\\n\', \'180.101.49.12 的 Ping 统计信息:\\r\\n\', \'    数据包: 已发送 = 4，已接收 = 4，丢失 = 0 (0% 丢失)，\\r\\n\', \'往返行程的估计时间(以毫秒为单位):\\r\\n\', \'    最短 = 10ms，最长 = 11ms，平均 = 10ms\\r\\n\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'命令执行完成<===>id=6\']', '2020-12-19 12:21:09.615731');
INSERT INTO `web_excuterecord` VALUES ('6', '[\'\\r\\n\', \'正在 Ping www.a.shifen.com [180.101.49.12] 具有 32 字节的数据:\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=47ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=12ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=16ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=29ms TTL=53\\r\\n\', \'\\r\\n\', \'180.101.49.12 的 Ping 统计信息:\\r\\n\', \'    数据包: 已发送 = 4，已接收 = 4，丢失 = 0 (0% 丢失)，\\r\\n\', \'往返行程的估计时间(以毫秒为单位):\\r\\n\', \'    最短 = 12ms，最长 = 47ms，平均 = 26ms\\r\\n\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'命令执行完成<===>id=6\']', '2020-12-19 12:21:47.786602');
INSERT INTO `web_excuterecord` VALUES ('7', '[\'\\r\\n\', \'正在 Ping www.a.shifen.com [180.101.49.12] 具有 32 字节的数据:\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=15ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=18ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=11ms TTL=53\\r\\n\', \'请求超时。\\r\\n\', \'\\r\\n\', \'180.101.49.12 的 Ping 统计信息:\\r\\n\', \'    数据包: 已发送 = 4，已接收 = 3，丢失 = 1 (25% 丢失)，\\r\\n\', \'往返行程的估计时间(以毫秒为单位):\\r\\n\', \'    最短 = 11ms，最长 = 18ms，平均 = 14ms\\r\\n\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'命令执行完成<===>id=6\']', '2020-12-19 12:25:29.042821');
INSERT INTO `web_excuterecord` VALUES ('8', '[\'\\r\\n\', \'正在 Ping www.a.shifen.com [180.101.49.12] 具有 32 字节的数据:\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=13ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=14ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=11ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=12ms TTL=53\\r\\n\', \'\\r\\n\', \'180.101.49.12 的 Ping 统计信息:\\r\\n\', \'    数据包: 已发送 = 4，已接收 = 4，丢失 = 0 (0% 丢失)，\\r\\n\', \'往返行程的估计时间(以毫秒为单位):\\r\\n\', \'    最短 = 11ms，最长 = 14ms，平均 = 12ms\\r\\n\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'命令执行完成<===>id=6\']', '2020-12-19 12:25:41.688715');
INSERT INTO `web_excuterecord` VALUES ('9', '[\'\\r\\n\', \'正在 Ping www.a.shifen.com [180.101.49.12] 具有 32 字节的数据:\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=10ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=11ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=11ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=11ms TTL=53\\r\\n\', \'\\r\\n\', \'180.101.49.12 的 Ping 统计信息:\\r\\n\', \'    数据包: 已发送 = 4，已接收 = 4，丢失 = 0 (0% 丢失)，\\r\\n\', \'往返行程的估计时间(以毫秒为单位):\\r\\n\', \'    最短 = 10ms，最长 = 11ms，平均 = 10ms\\r\\n\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'命令执行完成<===>id=4\']', '2020-12-19 12:25:50.537470');
INSERT INTO `web_excuterecord` VALUES ('10', '[\'\\r\\n\', \'正在 Ping www.a.shifen.com [180.101.49.11] 具有 32 字节的数据:\\r\\n\', \'来自 180.101.49.11 的回复: 字节=32 时间=11ms TTL=53\\r\\n\', \'来自 180.101.49.11 的回复: 字节=32 时间=11ms TTL=53\\r\\n\', \'来自 180.101.49.11 的回复: 字节=32 时间=11ms TTL=53\\r\\n\', \'来自 180.101.49.11 的回复: 字节=32 时间=11ms TTL=53\\r\\n\', \'\\r\\n\', \'180.101.49.11 的 Ping 统计信息:\\r\\n\', \'    数据包: 已发送 = 4，已接收 = 4，丢失 = 0 (0% 丢失)，\\r\\n\', \'往返行程的估计时间(以毫秒为单位):\\r\\n\', \'    最短 = 11ms，最长 = 11ms，平均 = 11ms\\r\\n\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'命令执行完成<===>id=6\']', '2020-12-19 12:28:30.273577');
INSERT INTO `web_excuterecord` VALUES ('11', '[\'\\r\\n\', \'正在 Ping www.a.shifen.com [180.101.49.11] 具有 32 字节的数据:\\r\\n\', \'来自 180.101.49.11 的回复: 字节=32 时间=12ms TTL=53\\r\\n\', \'来自 180.101.49.11 的回复: 字节=32 时间=10ms TTL=53\\r\\n\', \'来自 180.101.49.11 的回复: 字节=32 时间=13ms TTL=53\\r\\n\', \'来自 180.101.49.11 的回复: 字节=32 时间=67ms TTL=53\\r\\n\', \'\\r\\n\', \'180.101.49.11 的 Ping 统计信息:\\r\\n\', \'    数据包: 已发送 = 4，已接收 = 4，丢失 = 0 (0% 丢失)，\\r\\n\', \'往返行程的估计时间(以毫秒为单位):\\r\\n\', \'    最短 = 10ms，最长 = 67ms，平均 = 25ms\\r\\n\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'命令执行完成<===>id=7\']', '2020-12-19 12:34:01.324738');
INSERT INTO `web_excuterecord` VALUES ('12', '[\'\\r\\n\', \'正在 Ping www.a.shifen.com [180.101.49.12] 具有 32 字节的数据:\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=10ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=11ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=11ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=10ms TTL=53\\r\\n\', \'\\r\\n\', \'180.101.49.12 的 Ping 统计信息:\\r\\n\', \'    数据包: 已发送 = 4，已接收 = 4，丢失 = 0 (0% 丢失)，\\r\\n\', \'往返行程的估计时间(以毫秒为单位):\\r\\n\', \'    最短 = 10ms，最长 = 11ms，平均 = 10ms\\r\\n\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'命令执行完成<===>id=7\']', '2020-12-19 13:05:35.394553');
INSERT INTO `web_excuterecord` VALUES ('13', '[\'\\r\\n\', \'正在 Ping www.a.shifen.com [180.101.49.12] 具有 32 字节的数据:\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=15ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=12ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=11ms TTL=53\\r\\n\', \'来自 180.101.49.12 的回复: 字节=32 时间=10ms TTL=53\\r\\n\', \'\\r\\n\', \'180.101.49.12 的 Ping 统计信息:\\r\\n\', \'    数据包: 已发送 = 4，已接收 = 4，丢失 = 0 (0% 丢失)，\\r\\n\', \'往返行程的估计时间(以毫秒为单位):\\r\\n\', \'    最短 = 10ms，最长 = 15ms，平均 = 12ms\\r\\n\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'命令执行完成<===>id=7\']', '2020-12-19 13:06:05.033755');
INSERT INTO `web_excuterecord` VALUES ('14', '[\'\\r\\n\', \'正在 Ping www.a.shifen.com [180.101.49.11] 具有 32 字节的数据:\\r\\n\', \'来自 180.101.49.11 的回复: 字节=32 时间=18ms TTL=53\\r\\n\', \'来自 180.101.49.11 的回复: 字节=32 时间=10ms TTL=53\\r\\n\', \'来自 180.101.49.11 的回复: 字节=32 时间=11ms TTL=53\\r\\n\', \'来自 180.101.49.11 的回复: 字节=32 时间=13ms TTL=53\\r\\n\', \'\\r\\n\', \'180.101.49.11 的 Ping 统计信息:\\r\\n\', \'    数据包: 已发送 = 4，已接收 = 4，丢失 = 0 (0% 丢失)，\\r\\n\', \'往返行程的估计时间(以毫秒为单位):\\r\\n\', \'    最短 = 10ms，最长 = 18ms，平均 = 13ms\\r\\n\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'命令执行完成<===>id=7\']', '2020-12-21 11:47:36.770659');

-- ----------------------------
-- Table structure for `web_member`
-- ----------------------------
DROP TABLE IF EXISTS `web_member`;
CREATE TABLE `web_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `rolesKey_id` int(11) DEFAULT NULL,
  `info_datetime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_member_rolesKey_id_ba1f9be6_fk_web_roles_id` (`rolesKey_id`),
  CONSTRAINT `web_member_rolesKey_id_ba1f9be6_fk_web_roles_id` FOREIGN KEY (`rolesKey_id`) REFERENCES `web_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_member
-- ----------------------------
INSERT INTO `web_member` VALUES ('1', '18888888888', '111111', '管理员', '1', '2020-12-17 16:56:23.164024');

-- ----------------------------
-- Table structure for `web_roles`
-- ----------------------------
DROP TABLE IF EXISTS `web_roles`;
CREATE TABLE `web_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_roles
-- ----------------------------
INSERT INTO `web_roles` VALUES ('1', '管理员', null);

-- ----------------------------
-- Table structure for `web_rolestoauthos`
-- ----------------------------
DROP TABLE IF EXISTS `web_rolestoauthos`;
CREATE TABLE `web_rolestoauthos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authosKey_id` int(11) DEFAULT NULL,
  `rolesKey_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `web_rolestoauthos_authosKey_id_ed621251_fk_web_auths_id` (`authosKey_id`),
  KEY `web_rolestoauthos_rolesKey_id_c22abd27_fk_web_roles_id` (`rolesKey_id`),
  CONSTRAINT `web_rolestoauthos_authosKey_id_ed621251_fk_web_auths_id` FOREIGN KEY (`authosKey_id`) REFERENCES `web_auths` (`id`),
  CONSTRAINT `web_rolestoauthos_rolesKey_id_c22abd27_fk_web_roles_id` FOREIGN KEY (`rolesKey_id`) REFERENCES `web_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_rolestoauthos
-- ----------------------------
INSERT INTO `web_rolestoauthos` VALUES ('7', '1', '1');
INSERT INTO `web_rolestoauthos` VALUES ('8', '2', '1');
INSERT INTO `web_rolestoauthos` VALUES ('9', '3', '1');
INSERT INTO `web_rolestoauthos` VALUES ('10', '4', '1');
INSERT INTO `web_rolestoauthos` VALUES ('11', '5', '1');
