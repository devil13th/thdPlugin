/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50510
Source Host           : localhost:3306
Source Database       : thdplugin

Target Server Type    : MYSQL
Target Server Version : 50510
File Encoding         : 65001

Date: 2015-10-11 00:31:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_org`
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `org_code` varchar(50) NOT NULL DEFAULT '',
  `org_name` varchar(50) DEFAULT NULL,
  `org_tree_code` varchar(500) DEFAULT NULL,
  `org_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`org_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO `sys_org` VALUES ('BJ', '社总部', null, '1');
INSERT INTO `sys_org` VALUES ('CQ', '重庆分社', null, '1');
INSERT INTO `sys_org` VALUES ('DL', '大连分社', null, '1');
INSERT INTO `sys_org` VALUES ('JS', '江苏分社', null, '1');
INSERT INTO `sys_org` VALUES ('SH', '上海分社', null, '1');
INSERT INTO `sys_org` VALUES ('TJ', '天津分社', null, '1');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_code` varchar(50) NOT NULL DEFAULT '',
  `role_name` varchar(50) DEFAULT NULL,
  `role_des` varchar(200) DEFAULT NULL,
  `role_level` varchar(50) DEFAULT NULL,
  `role_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`role_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` varchar(50) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_sex` int(11) DEFAULT NULL,
  `user_mail` varchar(100) DEFAULT NULL,
  `user_tel` varchar(50) DEFAULT NULL,
  `user_birthday` date DEFAULT NULL,
  `user_status` varchar(10) DEFAULT NULL,
  `org_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e0230001', 'devil13th_0', '0', 'devil13th_0@dev.org.cn', '13401020304', '2014-06-28', '0', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e1a30002', 'devil13th_1', '1', 'devil13th_1@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e1b90003', 'devil13th_2', '0', 'devil13th_2@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e1d00004', 'devil13th_3', '1', 'devil13th_3@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e1d60005', 'devil13th_4', '0', 'devil13th_4@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e1ed0006', 'devil13th_5', '1', 'devil13th_5@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e1f60007', 'devil13th_6', '0', null, null, '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e1ff0008', 'devil13th_7', '1', 'devil13th_7@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e2080009', 'devil13th_8', '0', 'devil13th_8@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e210000a', 'devil13th_9', '1', 'devil13th_9@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e218000b', 'devil13th_10', '0', 'devil13th_10@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e22d000c', 'devil13th_11', '1', 'devil13th_11@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e249000d', 'devil13th_12', '0', 'devil13th_12@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e252000e', 'devil13th_13', '1', 'devil13th_13@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e25f000f', 'devil13th_14', '0', 'devil13th_14@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e26d0010', 'devil13th_15', '1', 'devil13th_15@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e28d0011', 'devil13th_16', '0', 'devil13th_16@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e2940012', 'devil13th_17', '1', 'devil13th_17@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e29c0013', 'devil13th_18', '0', 'devil13th_18@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e2a80014', 'devil13th_19', '1', 'devil13th_19@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e2b50015', 'devil13th_20', '0', 'devil13th_20@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e2c20016', 'devil13th_21', '1', 'devil13th_21@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e2e00017', 'devil13th_22', '0', 'devil13th_22@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e2e90018', 'devil13th_23', '1', 'devil13th_23@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e2f00019', 'devil13th_24', '0', 'devil13th_24@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e30b001a', 'devil13th_25', '1', 'devil13th_25@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e314001b', 'devil13th_26', '0', 'devil13th_26@dev.org.cn', '13401020304', '2014-06-28', '0', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e320001c', 'devil13th_27', '1', 'devil13th_27@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e338001d', 'devil13th_28', '0', 'devil13th_28@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e346001e', 'devil13th_29', '1', 'devil13th_29@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e351001f', 'devil13th_30', '0', 'devil13th_30@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e3590020', 'devil13th_31', '1', 'devil13th_31@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e3660021', 'devil13th_32', '0', 'devil13th_32@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e3780022', 'devil13th_33', '1', 'devil13th_33@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e3870023', 'devil13th_34', '0', 'devil13th_34@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e3920024', 'devil13th_35', '1', 'devil13th_35@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e3b60025', 'devil13th_36', '0', 'devil13th_36@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e3c70026', 'devil13th_37', '1', 'devil13th_37@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e3dd0027', 'devil13th_38', '0', 'devil13th_38@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e3f70028', 'devil13th_39', '1', 'devil13th_39@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e40b0029', 'devil13th_40', '0', 'devil13th_40@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e413002a', 'devil13th_41', '1', 'devil13th_41@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e41f002b', 'devil13th_42', '0', 'devil13th_42@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e427002c', 'devil13th_43', '1', 'devil13th_43@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e42e002d', 'devil13th_44', '0', 'devil13th_44@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e436002e', 'devil13th_45', '1', 'devil13th_45@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e43d002f', 'devil13th_46', '0', 'devil13th_46@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e4470030', 'devil13th_47', '1', 'devil13th_47@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e44e0031', 'devil13th_48', '0', 'devil13th_48@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e4550032', 'devil13th_49', '1', 'devil13th_49@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e45f0033', 'devil13th_50', '0', 'devil13th_50@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e4670034', 'devil13th_51', '1', 'devil13th_51@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e46f0035', 'devil13th_52', '0', 'devil13th_52@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e4750036', 'devil13th_53', '1', 'devil13th_53@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e4800037', 'devil13th_54', '0', 'devil13th_54@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e4870038', 'devil13th_55', '1', 'devil13th_55@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e48c0039', 'devil13th_56', '0', 'devil13th_56@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e4ae003a', 'devil13th_57', '1', 'devil13th_57@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e4c9003b', 'devil13th_58', '0', 'devil13th_58@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e4df003c', 'devil13th_59', '1', 'devil13th_59@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e4f9003d', 'devil13th_60', '0', 'devil13th_60@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e502003e', 'devil13th_61', '1', 'devil13th_61@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e50f003f', 'devil13th_62', '0', 'devil13th_62@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e5170040', 'devil13th_63', '1', 'devil13th_63@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e5330041', 'devil13th_64', '0', 'devil13th_64@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e5410042', 'devil13th_65', '1', 'devil13th_65@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e54f0043', 'devil13th_66', '0', 'devil13th_66@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e5580044', 'devil13th_67', '1', 'devil13th_67@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e55f0045', 'devil13th_68', '0', 'devil13th_68@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e56c0046', 'devil13th_69', '1', 'devil13th_69@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e119dc0146e119e5780047', 'devil13th_70', '0', 'devil13th_70@dev.org.cn', '13401020304', '2014-06-28', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e139fa0146e13a4e840001', null, null, null, null, null, null, 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e139fa0146e13ca9730002', '2', '1', null, null, '2014-06-02', '1', 'TJ');
INSERT INTO `sys_user` VALUES ('402881e846e139fa0146e13cd2d50003', 'sb1', '1', null, null, '2014-06-11', '1', 'TJ');

-- ----------------------------
-- Table structure for `tp_datagrid`
-- ----------------------------
DROP TABLE IF EXISTS `tp_datagrid`;
CREATE TABLE `tp_datagrid` (
  `dg_id` varchar(32) NOT NULL DEFAULT '',
  `dg_name` varchar(64) DEFAULT NULL,
  `dg_sex` varchar(4) DEFAULT NULL,
  `dg_age` int(11) DEFAULT NULL,
  `dg_birthday` date DEFAULT NULL,
  `dg_nick_name` varchar(64) DEFAULT NULL,
  `dg_status` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`dg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_datagrid
-- ----------------------------
INSERT INTO `tp_datagrid` VALUES ('402881e844ed0bbb0144ed1780300001', 'user_22', '0', '25', '2014-03-18', '十三妖', '0');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6a5e0001', 'xxx', '0', '0', '2013-01-18', 'nickname_0', '0');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6aa50002', 'user_1', '1', '1', '2013-01-18', 'nickname_1', '0');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6aba0003', 'user_2', '0', '2', '2013-01-18', 'nickname_2', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6acf0004', 'user_3', '1', '3', '2013-01-18', 'nickname_3', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6ae10005', 'user_4', '0', '4', '2013-01-18', 'nickname_4', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6af80006', 'user_5', '1', '5', '2013-01-18', 'nickname_5', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6b0b0007', 'user_6', '0', '6', '2013-01-18', 'nickname_6', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6b220008', 'user_7', '1', '7', '2013-01-18', 'nickname_7', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6b380009', 'user_8', '0', '8', '2013-01-18', 'nickname_8', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6b55000a', 'user_0-', '0', '9', '2013-01-18', 'nickname_9', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6b8a000b', 'user_10', '0', '10', '2013-01-18', 'nickname_10', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6bac000c', 'user_11', '1', '11', '2013-01-18', 'nickname_11', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6bc8000d', 'user_12', '0', '12', '2013-01-18', 'nickname_12', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6bdc000e', 'user_13', '1', '13', '2013-01-18', 'nickname_13', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6bf2000f', 'user_14', '0', '14', '2013-01-18', 'nickname_14', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6c070010', 'user_15', '1', '15', '2013-01-18', 'nickname_15', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6c240011', 'user_16', '0', '16', '2013-01-18', 'nickname_16', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6c390012', 'user_17', '1', '17', '2013-01-18', 'nickname_17', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6c560013', 'user_18', '0', '18', '2013-01-18', 'nickname_18', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6c680014', 'user_19', '1', '19', '2013-01-18', 'nickname_19', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6c800015', 'user_20', '0', '20', '2013-01-18', 'nickname_20', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6c920016', 'user_21', '1', '21', '2013-01-18', 'nickname_21', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6ca90017', 'user_22', '0', '22', '2013-01-18', 'nickname_22', '0');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6cbf0018', 'user_23', '1', '23', '2013-01-18', 'nickname_23', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6cdc0019', 'user_24', '0', '24', '2013-01-18', 'nickname_24', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6dbc001a', 'user_25', '1', '25', '2013-01-18', 'nickname_25', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6ddf001b', 'user_26', '0', '26', '2013-01-18', 'nickname_26', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6df6001c', 'user_27', '1', '27', '2013-01-18', 'nickname_27', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6e09001d', 'user_28', '0', '28', '2013-01-18', 'nickname_28', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6e20001e', 'user_29', '1', '29', '2013-01-18', 'nickname_29', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6e32001f', 'user_30', '0', '30', '2013-01-18', 'nickname_30', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6e490020', 'user_31', '1', '31', '2013-01-18', 'nickname_31', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6e5c0021', 'user_32', '0', '32', '2013-01-18', 'nickname_32', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6e730022', 'user_33', '1', '33', '2013-01-18', 'nickname_33', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6e880023', 'user_34', '0', '34', '2013-01-18', 'nickname_34', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6ea50024', 'user_35', '1', '35', '2013-01-18', 'nickname_35', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6eb70025', 'user_36', '0', '36', '2013-01-18', 'nickname_36', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6ece0026', 'user_37', '1', '37', '2013-01-18', 'nickname_37', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6ee10027', 'user_38', '0', '38', '2013-01-18', 'nickname_38', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6ef90028', 'user_39', '1', '39', '2013-01-18', 'nickname_39', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6f0e0029', 'user_40', '0', '40', '2013-01-18', 'nickname_40', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6f2a002a', 'user_41', '1', '41', '2013-01-18', 'nickname_41', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6f3d002b', 'user_42', '0', '42', '2013-01-18', 'nickname_42', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6f54002c', 'user_43', '1', '43', '2013-01-18', 'nickname_43', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6f67002d', 'user_44', '0', '44', '2013-01-18', 'nickname_44', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6f7d002e', 'user_45', '1', '45', '2013-01-18', 'nickname_45', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6f93002f', 'user_46', '0', '46', '2013-01-18', 'nickname_46', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6faf0030', 'user_47', '1', '47', '2013-01-18', 'nickname_47', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6fc20031', 'user_48', '0', '48', '2013-01-18', 'nickname_48', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6fd90032', 'user_49', '1', '49', '2013-01-18', 'nickname_49', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba6fec0033', 'user_50', '0', '50', '2013-01-18', 'nickname_50', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba70030034', 'user_51', '1', '51', '2013-01-18', 'nickname_51', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba70150035', 'user_52', '0', '52', '2013-01-18', 'nickname_52', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba702c0036', 'user_53', '1', '53', '2013-01-18', 'nickname_53', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba70410037', 'user_54', '0', '54', '2013-01-18', 'nickname_54', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba705e0038', 'user_55', '1', '55', '2013-01-18', 'nickname_55', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba70710039', 'user_56', '0', '56', '2013-01-18', 'nickname_56', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba7087003a', 'user_57', '1', '57', '2013-01-18', 'nickname_57', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba709a003b', 'user_58', '0', '58', '2013-01-18', 'nickname_58', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba70b1003c', 'user_59', '1', '59', '2013-01-18', 'nickname_59', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba70c4003d', 'user_60', '0', '60', '2013-01-18', 'nickname_60', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba70db003e', 'user_61', '1', '61', '2013-01-18', 'nickname_61', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba70ed003f', 'user_62', '0', '62', '2013-01-18', 'nickname_62', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba71040040', 'user_63', '1', '63', '2013-01-18', 'nickname_63', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba71170041', 'user_64', '0', '64', '2013-01-18', 'nickname_64', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba712e0042', 'user_65', '1', '65', '2013-01-18', 'nickname_65', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba71410043', 'user_66', '0', '66', '2013-01-18', 'nickname_66', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba71580044', 'user_67', '1', '67', '2013-01-18', 'nickname_67', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba716b0045', 'user_68', '0', '68', '2013-01-18', 'nickname_68', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba718c0046', 'user_69', '1', '69', '2013-01-18', 'nickname_69', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba71a50047', 'user_70', '0', '70', '2013-01-18', 'nickname_70', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba71bc0048', 'user_71', '1', '71', '2013-01-18', 'nickname_71', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba71ce0049', 'user_72', '0', '72', '2013-01-18', 'nickname_72', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba71e6004a', 'user_73', '1', '73', '2013-01-18', 'nickname_73', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba71fb004b', 'user_74', '0', '74', '2013-01-18', 'nickname_74', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba7217004c', 'user_75', '1', '75', '2013-01-18', 'nickname_75', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba722a004d', 'user_76', '0', '76', '2013-01-18', 'nickname_76', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba7241004e', 'user_77', '1', '77', '2013-01-18', 'nickname_77', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba7254004f', 'user_78', '0', '78', '2013-01-18', 'nickname_78', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba726a0050', 'user_79', '1', '79', '2013-01-18', 'nickname_79', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba72800051', 'user_80', '0', '80', '2013-01-18', 'nickname_80', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba729d0052', 'user_81', '1', '81', '2013-01-18', 'nickname_81', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba72af0053', 'user_82', '0', '82', '2013-01-18', 'nickname_82', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba72c60054', 'user_83', '1', '83', '2013-01-18', 'nickname_83', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba72d90055', 'user_84', '0', '84', '2013-01-18', 'nickname_84', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba72f00056', 'user_85', '1', '85', '2013-01-18', 'nickname_85', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba73050057', 'user_86', '0', '86', '2013-01-18', 'nickname_86', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba73210058', 'user_87', '1', '87', '2013-01-18', 'nickname_87', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba73340059', 'user_88', '0', '88', '2013-01-18', 'nickname_88', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba734b005a', 'user_89', '1', '89', '2013-01-18', 'nickname_89', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba735d005b', 'user_90', '0', '90', '2013-01-18', 'nickname_90', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba7375005c', 'user_91', '1', '91', '2013-01-18', 'nickname_91', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba7388005d', 'user_92', '0', '92', '2013-01-18', 'nickname_92', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba739f005e', 'user_93', '1', '93', '2013-01-18', 'nickname_93', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba73b1005f', 'user_94', '0', '94', '2013-01-18', 'nickname_94', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba73c80060', 'user_95', '1', '95', '2013-01-18', 'nickname_95', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba73da0061', 'user_96', '0', '96', '2013-01-18', 'nickname_96', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba73f10062', 'user_97', '1', '97', '2013-01-18', 'nickname_97', '1');
INSERT INTO `tp_datagrid` VALUES ('8a808af13c4cba69013c4cba74810063', 'user_98', '0', '98', '2013-01-18', 'nickname_98', '1');


-- ----------------------------
-- Table structure for `tp_tree`
-- ----------------------------
DROP TABLE IF EXISTS `tp_tree`;
CREATE TABLE `tp_tree` (
  `tree_id` varchar(32) NOT NULL DEFAULT '',
  `tree_name` varchar(64) DEFAULT NULL,
  `tree_code` varchar(512) DEFAULT NULL,
  `tree_status` varchar(4) DEFAULT NULL,
  `tree_is_leaf` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`tree_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_tree
-- ----------------------------
INSERT INTO `tp_tree` VALUES ('8a808af13c1e45d4013c1e608e890001', '1', 'root.00001', '', '0');
INSERT INTO `tp_tree` VALUES ('8a808af13c1e45d4013c1e60a5090002', '11', 'root.00001.00001', '', '0');
INSERT INTO `tp_tree` VALUES ('8a808af13c1e45d4013c1e60b7b00003', '111', 'root.00001.00001.00001', '', '1');
INSERT INTO `tp_tree` VALUES ('8a808af13c1e45d4013c1e78c68a0004', '2', 'root.00002', '', '0');
INSERT INTO `tp_tree` VALUES ('8a808af13c1e45d4013c1e78d9210005', '21', 'root.00002.00001', '', '0');
INSERT INTO `tp_tree` VALUES ('8a808af13c1e45d4013c1e78fd940006', '211', 'root.00002.00001.00001', '', '1');
INSERT INTO `tp_tree` VALUES ('8a808af13c1e45d4013c1e791a7a0007', '3', 'root.00003', '', '0');
INSERT INTO `tp_tree` VALUES ('8a808af13c1e45d4013c1e7928020008', '31', 'root.00003.00001', '', '0');
INSERT INTO `tp_tree` VALUES ('8a808af13c1e45d4013c1e7937930009', '311', 'root.00003.00001.00001', '', '1');
INSERT INTO `tp_tree` VALUES ('8a808af13c2218b1013c221a03f40001', '新增子节点', 'root.00001.00002', null, '1');
