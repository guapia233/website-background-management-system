/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50709
 Source Host           : localhost:3306
 Source Schema         : guapi

 Target Server Type    : MySQL
 Target Server Version : 50709
 File Encoding         : 65001

 Date: 17/05/2023 18:33:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('user', 'el-icon-user', 'icon');
INSERT INTO `sys_dict` VALUES ('house', 'el-icon-house', 'icon');
INSERT INTO `sys_dict` VALUES ('menu', 'el-icon-menu', 'icon');
INSERT INTO `sys_dict` VALUES ('s-custom', 'el-icon-s-custom', 'icon');
INSERT INTO `sys_dict` VALUES ('s-grid', 'el-icon-s-grid', 'icon');
INSERT INTO `sys_dict` VALUES ('document', 'el-icon-document', 'icon');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` bigint(20) NULL DEFAULT NULL COMMENT '文件大小',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '下载链接',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否禁用链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_md5`(`md5`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (1, '100k.jpg', 'jpg', 95, 'http://localhost:9090/file/e9e648e87c1643a9934c4f6b5c1b0f90.jpg', 0, 1, '4a80e490c4db30d19bfc224718e26041');
INSERT INTO `sys_file` VALUES (2, '刘畅.jpg', 'jpg', 48, 'http://localhost:9090/file/084e626621af419fab97aa2a668a5045.jpg', 0, 1, 'a5549846623f2d3c8a3af7da91a4e785');
INSERT INTO `sys_file` VALUES (7, '证件照.jpg', 'jpg', 389, 'http://localhost:9090/file/96d55155528243388c2200df9f4b69a6.jpg', 0, 1, '2b4dadca470dcd86c2dbabff8a5851ae');
INSERT INTO `sys_file` VALUES (8, '学生证.jpg', 'jpg', 468, 'http://localhost:9090/file/95f7496a1b0843378aa8d220048a7d55.jpg', 0, 1, '77fb6c421dac3945eaddf3384876736e');
INSERT INTO `sys_file` VALUES (11, 'brick1.png', 'png', 2, 'http://localhost:9090/file/0b47d9e6bb7b4585901243c2017f2ef9.png', 0, 1, 'c8ab0f16b464c91162e2da334d431071');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级关系',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sort_num` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (5, '主页', '/home', 'el-icon-house', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (7, '系统管理', '', 'el-icon-s-grid', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (8, '用户管理', '/user', 'el-icon-user', NULL, 7, NULL, NULL);
INSERT INTO `sys_menu` VALUES (9, '菜单管理', '/menu', 'el-icon-menu', NULL, 7, NULL, NULL);
INSERT INTO `sys_menu` VALUES (10, '文件管理', '/file', 'el-icon-document', NULL, 7, NULL, NULL);
INSERT INTO `sys_menu` VALUES (11, '角色管理', '/role', 'el-icon-s-custom', NULL, 7, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', '管理员', 'ROLE_ADMIN');
INSERT INTO `sys_role` VALUES (2, '普通用户', '普通用户', 'ROLE_USER');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 7);
INSERT INTO `sys_role_menu` VALUES (2, 8);
INSERT INTO `sys_role_menu` VALUES (2, 9);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'admin', '吕瓜皮', 'admin@qq.com', '1398997788', '山东聊城', '2023-08-22 21:44:30', 'http://localhost:9090/file/e9e648e87c1643a9934c4f6b5c1b0f90.jpg', NULL);
INSERT INTO `sys_user` VALUES (2, 'zhu', '123456', '猪八戒', 'zhu@163.com', '13677889900', '花果山水帘洞', '2023-04-22 14:30:45', 'http://localhost:9090/file/0b47d9e6bb7b4585901243c2017f2ef9.png', NULL);
INSERT INTO `sys_user` VALUES (3, 'sun', 'd3424', 'asdas', 'fej90929e@qq.com', '12399863937', '山东青岛', '2023-04-22 21:42:59', NULL, NULL);
INSERT INTO `sys_user` VALUES (4, 'aaa', '321324', '张三', '213@163.com', '32432345435', '山东日照', '2023-04-22 21:41:30', NULL, NULL);
INSERT INTO `sys_user` VALUES (6, 'ccc', '64747', '花少北', '23134214@123.com', '543535234234', '山东日照', '2023-04-22 21:41:39', NULL, NULL);
INSERT INTO `sys_user` VALUES (7, 'ddd', '345345', '莉丝', 'qqqq@198.com', '432425346', '浙江杭州', '2023-11-22 21:41:48', NULL, NULL);
INSERT INTO `sys_user` VALUES (9, 'tang', '34234', '唐僧', '7438247238@qq.com', '42434234', 'tang', '2023-04-25 21:17:12', 'asdasdsa', NULL);
INSERT INTO `sys_user` VALUES (12, 'ooo', '546464', '哦哦哦', '4535gdgd@163.com', '453534', '山东日照', '2023-04-22 21:54:12', NULL, NULL);
INSERT INTO `sys_user` VALUES (13, 'yyy', '343242', '摇一摇', '4324234@qq.com', '19928838828', '河南郑州', '2023-04-22 22:00:24', NULL, 'ROLE_USER');
INSERT INTO `sys_user` VALUES (21, 'zy', '123', '赵云', '3424@qq.com', '139827788', '河北邯郸', '2023-04-25 22:38:55', '543534tredf', 'ROLE_USER');
INSERT INTO `sys_user` VALUES (22, 'dj', '456', '妲己', 'z355@163.com', '136739900', '山西大同', '2023-12-25 22:38:55', 'fewr3454', 'ROLE_USER');

SET FOREIGN_KEY_CHECKS = 1;
