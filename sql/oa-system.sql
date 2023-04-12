/*
 Navicat Premium Data Transfer

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : oa-system

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 09/04/2023 17:52:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_attendance
-- ----------------------------
DROP TABLE IF EXISTS `sys_attendance`;
CREATE TABLE `sys_attendance` (
  `attendance_id` bigint NOT NULL AUTO_INCREMENT COMMENT '考勤id',
  `attendance_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '考勤类型（1 打卡 2事假 3病假 ）',
  `status` int DEFAULT NULL COMMENT '考勤状态（1正常  2迟到  3早退 4请假 5迟到并早退  0旷工）',
  `on_line` datetime DEFAULT NULL COMMENT '打卡上班时间',
  `off_line` datetime DEFAULT NULL COMMENT '打卡下班时间',
  `duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '工作时长',
  `user_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户ID',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`attendance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='考勤信息表';

-- ----------------------------
-- Records of sys_attendance
-- ----------------------------
BEGIN;
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (1, '1', 1, '2023-03-01 08:54:48', '2023-03-25 19:54:50', '12小时', 'admin', '2023-03-01 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (2, '1', 1, '2023-03-02 08:54:48', '2023-03-25 19:54:50', '12小时', 'admin', '2023-03-02 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (3, '1', 2, '2023-03-03 09:54:48', '2023-03-25 19:54:50', '10小时', 'admin', '2023-03-03 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (4, '1', 2, '2023-03-04 09:54:48', '2023-03-25 19:54:50', '10小时', 'admin', '2023-03-04 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (6, '2', 4, NULL, NULL, NULL, 'admin', '2023-03-06 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (7, '1', 1, '2023-03-07 02:54:48', '2023-03-25 02:54:50', '12小时', 'admin', '2023-03-07 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (8, '1', 1, '2023-03-08 02:54:48', '2023-03-25 02:54:50', '12小时', 'admin', '2023-03-08 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (9, '1', 1, '2023-03-09 02:54:48', '2023-03-25 02:54:50', '12小时', 'admin', '2023-03-09 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (10, '1', 1, '2023-03-10 02:54:48', '2023-03-25 02:54:50', '12小时', 'admin', '2023-03-10 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (13, '2', 4, NULL, NULL, NULL, 'admin', '2023-03-13 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (14, '2', 4, NULL, NULL, NULL, 'admin', '2023-03-14 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (15, '2', 4, NULL, NULL, NULL, 'admin', '2023-03-15 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (16, '2', 4, NULL, NULL, NULL, 'admin', '2023-03-16 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (17, '2', 4, NULL, NULL, NULL, 'admin', '2023-03-17 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (18, '1', 3, '2023-03-18 08:54:48', '2023-03-18 17:54:50', '9小时', 'admin', '2023-03-18 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (19, '1', 3, '2023-03-19 08:54:48', '2023-03-19 14:54:50', '9小时', 'admin', '2023-03-19 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (20, '1', 1, '2023-03-20 02:54:48', '2023-03-20 02:54:50', '12小时', 'admin', '2023-03-20 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (21, '1', 1, '2023-03-21 02:54:48', '2023-03-21 02:54:50', '12小时', 'admin', '2023-03-21 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (22, '1', 5, '2023-03-22 10:54:48', '2023-03-22 16:54:50', '8小时', 'admin', '2023-03-22 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (23, '1', 1, '2023-03-23 02:54:48', '2023-03-23 02:54:50', '12小时', 'admin', '2023-03-23 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (24, '1', 1, '2023-03-24 02:54:48', '2023-03-24 02:54:50', '12小时', 'admin', '2023-03-24 02:55:05', NULL);
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (110, '1', 5, '2023-03-26 02:25:55', '2023-03-26 11:30:47', '9小时4分钟', 'admin', '2023-03-26 02:25:55', '2023-03-26 11:30:47');
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (117, '1', 1, '2023-03-27 23:36:41', '2023-03-27 23:51:01', '0小时14分钟', 'admin', '2023-03-27 23:36:41', '2023-03-27 23:51:01');
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (119, '1', 2, '2023-03-28 00:56:19', '2023-03-28 23:40:25', '22小时44分钟', 'admin', '2023-03-28 00:56:19', '2023-03-28 23:40:25');
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (120, '1', 2, '2023-03-28 23:44:36', '2023-03-28 23:44:51', '0小时0分钟', 'zs', '2023-03-28 23:44:36', '2023-03-28 23:44:51');
INSERT INTO `sys_attendance` (`attendance_id`, `attendance_type`, `status`, `on_line`, `off_line`, `duration`, `user_name`, `create_time`, `update_time`) VALUES (121, '1', 2, '2023-04-01 18:46:09', '2023-04-01 18:46:28', '0小时0分钟', 'admin', '2023-04-01 18:46:09', '2023-04-01 18:46:28');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-03-22 22:23:27', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-03-22 22:23:27', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-03-22 22:23:27', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-03-22 22:23:27', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-03-22 22:23:27', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-03-22 22:23:27', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (100, 0, '0', '强盛集团', 0, '高启强', '15888888888', '123123@qq.com', '0', '0', 'admin', '2023-03-22 19:13:00', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (101, 100, '0,100', '深圳分公司', 4, '高启强', '15888888888', '123123@qq.com', '0', '0', 'admin', '2023-03-22 19:13:00', 'admin', '2023-03-23 23:01:57');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (102, 100, '0,100', '北京分公司', 1, '高启强', '15888888888', '123123@qq.com', '0', '0', 'admin', '2023-03-22 19:13:00', 'admin', '2023-03-22 20:53:43');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (103, 101, '0,100,101', '研发部门', 1, '高启强', '15888888888', '123123@qq.com', '0', '0', 'admin', '2023-03-22 19:13:00', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (104, 101, '0,100,101', '市场部门', 2, '高启强', '15888888888', '123123@qq.com', '0', '0', 'admin', '2023-03-22 19:13:00', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (105, 101, '0,100,101', '测试部门', 3, '高启强', '15888888888', '123123@qq.com', '0', '0', 'admin', '2023-03-22 19:13:00', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (106, 101, '0,100,101', '财务部门', 4, '高启强', '15888888888', '123123@qq.com', '0', '0', 'admin', '2023-03-22 19:13:00', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (107, 101, '0,100,101', '运维部门', 5, '高启强', '15888888888', '123123@qq.com', '0', '0', 'admin', '2023-03-22 19:13:00', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (108, 102, '0,100,102', '市场部门', 1, '高启强', '15888888888', '123123@qq.com', '0', '0', 'admin', '2023-03-22 19:13:00', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (109, 102, '0,100,102', '财务部门', 2, '高启强', '15888888888', '123123@qq.com', '0', '0', 'admin', '2023-03-22 19:13:00', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (200, 100, '0,100', '上海分公司', 2, '老默', '15012312313', '123123@qq.com', '0', '0', 'admin', '2023-03-22 20:43:47', 'admin', '2023-03-22 20:53:51');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (201, 100, '0,100', '广州分公司', 3, '高启强', '13012312312', '123@qq.com', '0', '0', 'admin', '2023-03-22 20:53:32', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (202, 200, '0,100,200', '技术部门', 1, '高启盛', '13012312312', '123123123@qq.com', '0', '0', 'admin', '2023-03-22 21:13:53', 'admin', '2023-03-22 21:14:18');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (203, 202, '0,100,200,202', '大润发测试1组', 1, '老默', '15012312311', '123@163.com', '0', '2', 'admin', '2023-03-22 21:14:59', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (204, 203, '0,100,200,202,203', 'test22222', 1, 'test', '15012312312', '12@123.com', '0', '2', 'admin', '2023-03-22 21:15:48', 'admin', '2023-03-22 21:15:56');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '性别男');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '性别女');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '通知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '公告');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (30, 0, '进行中', '0', 'sys_timeline_status', ' ', 'success', 'N', '0', 'admin', '2023-03-23 22:34:55', '', NULL, '进行中');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (31, 1, '未开始', '1', 'sys_timeline_status', ' ', 'warning', 'Y', '0', 'admin', '2023-03-23 22:37:45', '', NULL, '未开始');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (32, 2, '已完成', '2', 'sys_timeline_status', '', 'primary', 'N', '0', 'admin', '2023-03-23 22:37:48', '', NULL, '已完成');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (33, 1, '正常', '1', 'sys_attendance_status', ' ', 'success', 'Y', '0', 'admin', '2023-03-24 23:36:02', '', NULL, '正常');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (102, 2, '迟到', '2', 'sys_attendance_status', ' ', 'warning', 'N', '0', 'admin', '2023-03-24 23:39:40', '', NULL, '迟到');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (103, 3, '早退', '3', 'sys_attendance_status', ' ', 'warning', 'N', '0', 'admin', '2023-03-24 23:39:42', '', NULL, '早退');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (104, 4, '事假', '4', 'sys_attendance_status', ' ', 'warning', 'N', '0', 'admin', '2023-03-24 23:39:48', '', NULL, '请假');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (105, 5, '迟到+早退', '5', 'sys_attendance_status', ' ', 'danger', 'N', '0', 'admin', '2023-03-24 23:39:45', '', NULL, '迟到&早退');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (106, 6, '旷工', '0', 'sys_attendance_status', ' ', 'danger', 'N', '0', 'admin', '2023-03-24 23:39:51', '', NULL, '旷工');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (107, 1, '考勤', '1', 'sys_attendance_type', ' ', 'primary', 'Y', '0', 'admin', '2023-03-24 23:42:10', '', NULL, '考勤');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (108, 2, '请假', '2', 'sys_attendance_type', ' ', 'warning', 'N', '0', 'admin', '2023-03-24 23:42:14', '', NULL, '事假');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (109, 3, '病假', '3', 'sys_attendance_type', ' ', 'warning', 'N', '1', 'admin', '2023-03-24 23:42:17', '', NULL, '病假');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (11, '时间线状态', 'sys_timeline_status', '0', 'admin', '2023-03-23 22:41:15', '', NULL, '流程状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (12, '出勤状态', 'sys_attendance_status', '0', 'admin', '2023-03-24 23:34:48', '', NULL, '出勤状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (13, '考勤类型', 'sys_attendance_type', '0', 'admin', '2023-03-24 23:35:08', '', NULL, '考勤类型列表');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '考勤管理', 0, 2, 'system/calendar', 'system/calendar/index', NULL, 1, 0, 'C', '0', '0', 'system:calendar:list', 'date', 'admin', '2023-03-23 21:22:45', 'zs', '2023-03-28 23:49:39', '考勤管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '流程管理', 0, 3, 'system/timeline', 'system/timeline/index', NULL, 1, 0, 'C', '0', '0', 'system:timeline:list', 'time-range', 'admin', '2023-03-23 22:04:32', '', NULL, '流程管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '通知公告', 0, 4, 'system/notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-03-22 19:13:00', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '资产管理', 0, 5, 'system/money', 'system/money/index', NULL, 1, 0, 'C', '0', '1', 'system:money:list', 'money', 'admin', '2023-03-23 21:43:03', 'admin', '2023-03-25 14:30:20', '资产管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '用户管理', 0, 6, 'system/user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-03-22 19:13:00', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, '角色管理', 0, 6, 'system/role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-03-22 19:13:00', 'admin', '2023-03-28 20:22:00', '角色管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, '岗位管理', 0, 7, 'system/post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-03-22 19:13:00', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, '部门管理', 0, 8, 'system/dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-03-22 19:13:00', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, '菜单管理', 0, 9, 'system/menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-03-22 19:13:00', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-03-22 19:13:00', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (19, '张勇启动阿里组织变革：设立六大业务集团，全面独立经营', '1', 0x3C703E33E69C883238E697A5EFBC8CE998BFE9878CE5B7B4E5B7B4E99B86E59BA2E891A3E4BA8BE4BC9AE4B8BBE5B8ADE585BCE9A696E5B8ADE689A7E8A18CE5AE98E5BCA0E58B87E58F91E5B883E585A8E59198E4BFA1E3808AE594AFE69C89E887AAE68891E58F98E99DA9EFBC8CE6898DE883BDE5BC80E5889BE69CAAE69DA5E3808BEFBC8CE590AFE58AA8E696B0E4B880E8BDAEE585ACE58FB8E6B2BBE79086E58F98E99DA9E380823C2F703E3C703E3C62723E3C2F703E3C703EE6A0B9E68DAEE696B9E6A188EFBC8CE59CA8E998BFE9878CE5B7B4E5B7B4E99B86E59BA2E4B98BE4B88BEFBC8CE5B086E8AEBEE7AB8BE998BFE9878CE4BA91E699BAE883BDE38081E6B798E5AE9DE5A4A9E78CABE59586E4B89AE38081E69CACE59CB0E7949FE6B4BBE38081E88F9CE9B89FE38081E59BBDE99985E695B0E5AD97E59586E4B89AE38081E5A4A7E69687E5A8B1E7AD89E585ADE5A4A7E4B89AE58AA1E99B86E59BA2E5928CE5A49AE5AEB6E4B89AE58AA1E585ACE58FB8E38082E4B89AE58AA1E99B86E59BA2E5928CE4B89AE58AA1E585ACE58FB8E5B086E58886E588ABE68890E7AB8BE891A3E4BA8BE4BC9AEFBC8CE5AE9EE8A18CE59084E4B89AE58AA1E99B86E59BA2E5928CE4B89AE58AA1E585ACE58FB8E891A3E4BA8BE4BC9AE9A286E5AFBCE4B88BE79A8443454FE8B49FE8B4A3E588B6EFBC8CE998BFE9878CE5B7B4E5B7B4E99B86E59BA2E58899E5B086E585A8E99DA2E5AE9EE8A18CE68EA7E882A1E585ACE58FB8E7AEA1E79086E380823C2F703E3C703EE4BFA1E4B8ADEFBC8CE5BCA0E58B87E5B88CE69C9BE6AF8FE4B880E4BD8DE998BFE9878CE4BABAE59B9EE5BD92E5889BE4B89AE88085E78AB6E68081E5868DE587BAE58F91EFBC8CE2809CE4B88DE68BA5E68AB1E58F98E58C96E5B0B1E4BC9AE58F98E5BE97E583B5E58C96EFBC8CE4B88DE694B9E58F98E887AAE8BAABE5B0B1E4BC9AE8A2ABE697B6E4BBA3E68993E8B4A5E2809DE380823C2F703E3C703EE6A0B9E68DAEE585A8E59198E4BFA1EFBC8CE5BCA0E58B87E59CA8E68B85E4BBBBE998BFE9878CE5B7B4E5B7B4E99B86E59BA2E891A3E4BA8BE995BFE585BC43454FE79A84E5908CE697B6EFBC8CE585BCE4BBBBE998BFE9878CE4BA91E699BAE883BDE99B86E59BA243454FEFBC9BE688B4E78F8AE4BBBBE6B798E5AE9DE5A4A9E78CABE59586E4B89AE99B86E59BA243454FEFBC9BE4BF9EE6B0B8E7A68FE4BBBBE69CACE59CB0E7949FE6B4BBE99B86E59BA243454FEFBC9BE4B887E99C96E7BBA7E7BBADE68B85E4BBBBE88F9CE9B89FE99B86E59BA243454FEFBC9BE8928BE587A1E4BBBBE59BBDE99985E695B0E5AD97E59586E4B89AE99B86E59BA243454FEFBC9BE6A88AE8B7AFE8BF9CE4BBBBE5A4A7E69687E5A8B1E99B86E59BA243454FE38082E585B6E4BB96E585ACE58FB8E4B99FE5B086E78BACE7AB8BE7BB8FE890A5E7AEA1E79086E380823C2F703E3C703EE69CACE6ACA1E7BB84E7BB87E6B2BBE79086E58F98E99DA9E794B1E5BCA0E58B87E58F91E8B5B7EFBC8CE5B7B2E58886E588ABE7BB8FE99B86E59BA2E59088E4BC99E4BABAE4B88EE891A3E4BA8BE4BC9AE4B880E887B4E9809AE8BF87E38082E8BF99E8BDAEE58F98E99DA9E4BB8EE99B86E59BA2E9A1B6E5B182E585A5E6898BEFBC8CE9878DE696B0E5AE9AE4B989E5928CE69E84E980A0E998BFE9878CE5B7B4E5B7B4E99B86E59BA2E4B88EE59084E4B89AE58AA1E79A84E6B2BBE79086E585B3E7B3BBEFBC8CE8A2ABE8AEA4E4B8BAE698AFE2809CE998BFE9878CE5B7B4E5B7B43234E5B9B4E69DA5E69C80E9878DE8A681E79A84E4B880E6ACA1E7BB84E7BB87E58F98E99DA9E2809DE380823C2F703E3C703E3C62723E3C2F703E3C703EE59CA8E585A8E59198E4BFA1E4B8ADE5BCA0E58B87E8A1A8E7A4BAEFBC8CE2809CE8A7A3E586B3E7949FE4BAA7E58A9BE79A84E58F91E5B195E5928CE5889BE980A0E4B88DE5908CEFBC8CE9A696E58588E5BF85E9A1BBE4BB8EE7949FE4BAA7E585B3E7B3BBE79A84E58F98E99DA9E585A5E6898BE2809DE38082E8BF99E4B99FE698AFE998BFE9878CE5B7B4E5B7B4E7BB84E7BB87E58F98E99DA9E4B880E79BB4E4BBA5E69DA5E79A84E587BAE58F91E782B9E3808232303135E5B9B4EFBC8CE998BFE9878CE68EA8E58AA8E2809CE4B8ADE58FB0E68898E795A5E2809DEFBC8CE4B880E5BAA6E68890E4B8BAE4BA92E88194E7BD91E7A791E68A80E8A18CE4B89AE585ACE58FB8E6B2BBE79086E6A087E69D86EFBC9B32303230E5B9B4EFBC8CE5BCA0E58B87E68EA8E58AA8E7BB8FE890A5E8B4A3E4BBBBE588B6E694B9E99DA9EFBC8CE58F88E4BBA5E59B9BE5A4A7E69DBFE59D97E58886E7AB8BE5AE9EE78EB0E998BFE9878CE5B7B4E5B7B4E5A49AE58583E58C96E6B2BBE79086EFBC8CE68890E7AB8BE5A49AE5AEB6E78BACE7AB8BE7BB8FE890A5E79A84E78EAFE8B7AFE585ACE58FB8E380823C2F703E3C703EE4BB8EE998BFE9878CE5B7B4E5B7B4E58F91E5B195E58E86E7A88BE69DA5E79C8BEFBC8CE7BB84E7BB87E79A84E6B7B1E5BAA6E8B083E695B4E59CA8E4B88DE696ADE6BF80E58F91E9878DE5A4A7E68A80E69CAFE5928CE4B89AE58AA1E5889BE696B0E38082E6AF94E5A682EFBC8C32303131E5B9B4E4B880E4B8AAE6B798E5AE9DE58F98E4B8BAE2809CE4B889E4B8AAE6B798E5AE9DE2809DEFBC8CE995BFE587BAE4BA86E5A4A9E78CABE380823C2F703E3C703EE6ADA4E6ACA1E58F98E58C96E79A84E4B880E4B8AAE585B3E994AEE58AA8E4BD9CE698AFEFBC8CE59084E4B89AE58AA1E99B86E59BA2E58886E588ABE68890E7AB8BE891A3E4BA8BE4BC9AEFBC8CE5AE9EE8A18CE891A3E4BA8BE4BC9AE9A286E5AFBCE4B88BE79A8443454FE8B49FE8B4A3E588B6EFBC8CE998BFE9878CE5B7B4E5B7B4E99B86E59BA2E58899E585A8E99DA2E5AE9EE78EB0E68EA7E882A1E585ACE58FB8E7AEA1E79086E38082E5AFB9E59084E4B89AE58AA1E8808CE8A880EFBC8CE6B2BBE79086E69EB6E69E84E78BACE7AB8BE6848FE591B3E79D80E79BB4E99DA2E5B882E59CBAE6B497E7A4BCEFBC8CE4B88EE4B98BE5AFB9E5BA94E79A84E698AFE5889BE696B0E6BF80E58AB1E79A84E58FAFE883BDE680A7E38082E59CA8E585ACE5BC80E4BFA1E4B8ADEFBC8CE5BCA0E58B87E7A7B0EFBC8CE2809CE5B882E59CBAE698AFE69C80E5A5BDE79A84E8AF95E98791E79FB3EFBC8CE69CAAE69DA5EFBC8CE585B7E5A487E69DA1E4BBB6E79A84E4B89AE58AA1E99B86E59BA2E5928CE585ACE58FB8EFBC8CE983BDE5B086E69C89E78BACE7AB8BE89E8DE8B584E5928CE4B88AE5B882E79A84E58FAFE883BDE680A7E2809DE380823C2F703E3C703EE79BAEE5898DEFBC8CE998BFE9878CE69797E4B88BE998BFE9878CE4BA91E38081E88F9CE9B89FE7AD89E5A49AE4B8AAE4B89AE58AA1E5B7B2E698AFE5B882E59CBAE5A4B4E983A8E4BC81E4B89AEFBC8CE79B92E9A9ACE38081E5B9B3E5A4B4E593A5E7AD89E4B89AE58AA1E89E8DE8B584E4B88AE5B882E4BCA0E997BBE4B88DE696ADE38082E5AFB9E585ADE5A4A7E4B89AE58AA1E99B86E59BA2E5928CE4B89AE58AA1E585ACE58FB8E8808CE8A880EFBC8CE585A8E99DA2E78BACE7AB8BE7BB8FE890A5E69C89E588A9E4BA8EE5B882E59CBAE69BB4E5A5BDE5AFB9E4BBB7E580BCE7A7B0E9878DEFBC8CE2809CE8AEA9E59198E5B7A5E79C9FE6ADA3E8B5B0E59091E4B8BAE887AAE5B7B1E79A84E4B89AE58AA1E8808CE68898E2809DE380823C2F703E3C703EE8BF91E4B8A4E5B9B4EFBC8CE5BCA0E58B87E59CA8E58685E5A496E983A8E5A49AE6ACA1E5BCBAE8B083EFBC8CE6958FE68DB7E7BB84E7BB87E698AFE5AE9EE78EB0E5A49AE4B89AE58AA1E5A49AE4B89AE68081E8B685E5A4A7E59E8BE4BC81E4B89AE9AB98E69588E6B2BBE79086E79A84E8B7AFE5BE84E38082E6ADA4E6ACA1E5BDA2E68890E2809C312B362B4EE2809DE7BB84E7BB87E69EB6E69E84EFBC8CE58DB3E698AFE6958FE68DB7E7BB84E7BB87E79086E5BFB5E8BF9BE4B880E6ADA5E6B7B1E58C96E79A84E887AAE784B6E7BB93E69E9CEFBC8CE6848FE591B3E79D80E998BFE9878CE8B5B0E59091E7BB84E7BB87E6B2BBE79086E585A8E696B0E998B6E6AEB5E380823C2F703E3C703EE5908CE697B6EFBC8CE998BFE9878CE99B86E59BA2E79A84E8818CE883BDE983A8E997A8E4B99FE5B086E8BF8EE69DA5E69C89E5BA8FE58F98E58C96E38082E6A0B9E68DAEE585A8E59198E4BFA1EFBC8CE99B86E59BA2E4B8ADE5908EE58FB0E5B086E585A8E99DA2E5819AE8BDBBE38081E5819AE89684EFBC8CE8BF99E6848FE591B3E79D80E998BFE9878CE5B7B4E5B7B4E4BB8E32303135E5B9B4E4BBA5E69DA5E5BBBAE7AB8BE79A84E2809CE5A4A7E4B8ADE58FB0E2809DE883BDE58A9BE4BC9AE98090E6ADA5E8A2ABE69BB4E5BCBAE69C89E58A9BE79A84E5898DE58FB0E590B8E694B6EFBC8CE4BBA5E69BB4E6958FE68DB7E79A84E696B9E5BC8FE69C8DE58AA1E69BB4E5A49AE58583E58C96E79A84E58F91E5B195E99C80E8A681E380823C2F703E, '0', 'admin', '2023-03-28 23:16:03', 'admin', '2023-03-28 23:18:38', NULL);
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (20, '附全员信：', '1', 0x3C703EE594AFE69C89E887AAE68891E58F98E99DA9EFBC8CE6898DE883BDE5BC80E5889BE69CAAE69DA5E28094E28094E585B3E4BA8EE998BFE9878CE5B7B4E5B7B4E99B86E59BA2E7BB84E7BB87E6B2BBE79086E58F98E99DA9E79A84E586B3E5AE9A3C2F703E3C703EE59084E4BD8DE998BFE9878CE4BABAEFBC9A3C2F703E3C703EE59CA8E58DB3E5B086E8BF88E585A5E696B0E8B4A2E5B9B4E4B98BE99985EFBC8CE9A696E58588E68891E8A681E6849FE8B0A2E8BF87E58EBBE4B880E5B9B4E997B4EFBC8CE99DA2E5AFB9E5BE88E5A49AE585A8E696B0E68C91E68898E4B98BE4B88BE4BDA0E4BBACE5A78BE7BB88E5A682E4B880E79A84E58AAAE58A9BE5928CE8B4A1E78CAEE380823C2F703E3C703EE887AAE68891E58F98E99DA9E6B0B8E8BF9CE698AFE4BF9DE68C81E5889DE5BF83E38081E5BC80E5889BE69CAAE69DA5E79A84E69C80E5A5BDE98089E68BA9E38082E998BFE9878CE5B7B4E5B7B4E4BB8E31393939E5B9B4E68890E7AB8BE4BC8AE5A78BEFBC8CE5B0B1E4B88DE696ADE59CA8E5889BE696B0E5928CE58F98E99DA9E4B8ADE6BC94E8BF9BE5928CE8BFADE4BBA3EFBC8CE5A78BE7BB88E794A8E7949FE4BAA7E585B3E7B3BBE79A84E58588E8BF9BE680A7E69DA5E9A9B1E58AA8E58588E8BF9BE7949FE4BAA7E58A9BE79A84E9878AE694BEE38081E5889BE980A0E4BBB7E580BCE38081E5BC95E9A286E58F91E5B195E38082E4BB8AE5A4A9EFBC8CE68891E4BBACE4B99FE5B086E8BF8EE69DA5E998BFE9878CE5B7B4E5B7B4E5889BE58A9E3234E5B9B4E69DA5E69C80E9878DE8A681E79A84E4B880E6ACA1E7BB84E7BB87E58F98E99DA9E380823C2F703E3C703EE4BB8AE5A4A9E79A84E998BFE9878CE5B7B4E5B7B4EFBC8CE5B7B2E68890E995BFE4B8BAE5A49AE4B89AE58AA1E38081E5A49AE4B89AE68081E79A84E8B685E5A4A7E59E8BE7BB84E7BB87EFBC8CE8BF99E4BA9BE4B89AE58AA1E789B9E8B4A8E4B88DE5908CEFBC8CE99DA2E4B8B4E79A84E5B882E59CBAE78EAFE5A283E4B88DE5908CE38081E5AEA2E688B7E4B88DE5908CE38081E58F91E5B195E998B6E6AEB5E4B99FE4B88DE5908CE38082E696B0E8B4A2E5B9B4E4BC8AE5A78BEFBC8CE68891E4BBACE585A8E58A9BE5938DE5BA94E59BBDE5AEB6E2809CE68BBCE7BB8FE6B58EE2809DE79A84E58FB7E58FACEFBC8CE4BBA5E58D8FE58AA9E4B8ADE5B08FE4BC81E4B89AE585A8E99DA2E695B0E5AD97E58C96E58D87E7BAA7EFBC8CE68993E980A0E78EB0E4BBA3E59586E4B89AE695B0E5AD97E59FBAE7A180E8AEBEE696BDE4B8BAE79BAEE6A087E8808CE7A7AFE69E81E8A18CE58AA8E8B5B7E69DA5E38082E68EA8E58AA8E7949FE4BAA7E58A9BE79A84E58F91E5B195E5B9B6E5889BE980A0E4B88DE5908CEFBC8CE9A696E58588E5BF85E9A1BBE4BB8EE7949FE4BAA7E585B3E7B3BBE79A84E58F98E99DA9E585A5E6898BEFBC8CE8808CE58F98E99DA9E58F88E5BF85E9A1BBE4BB8EE99B86E59BA2E9A1B6E5B182E5BC80E5A78BE380823C2F703E3C703EE585ABE5B9B4E5898DE79A8432303135E5B9B4EFBC8CE99B86E59BA2E585A8E99DA2E68F90E587BAE4B8ADE58FB0E68898E795A5EFBC8CE5BDA2E68890E4BA86E2809CE5A4A7E4B8ADE58FB0E38081E5B08FE5898DE58FB0E2809DE6B2BBE79086E6A8A1E5BC8FE4B88BE79A844F6E6520436F6D70616E79E38082E4BB8E32303230E5B9B4E5BC80E5A78BEFBC8CE99B86E59BA2E7A7AFE69E81E580A1E8A18CE68993E980A0E6958FE68DB7E7BB84E7BB87EFBC8CE68EA8E8A18CE5A49AE58583E58C96E6B2BBE79086E7BB93E69E84E4B88BE79A84E7BB8FE890A5E8B4A3E4BBBBE588B6EFBC8CE79BAEE5898DE5B7B2E7BB8FE8AEBEE7AB8BE4BA86E5A49AE5AEB6E78BACE7AB8BE7BB8FE890A5E79A84E78EAFE8B7AFE585ACE58FB8E38082E4BB8AE5A4A9E59CA8E6ADA4E59FBAE7A180E4B88AEFBC8CE68891E4BBACE5B086E8BF9BE4B880E6ADA5E6B7B1E58C96E58F98E99DA9EFBC8CE8B5B0E59091E7BB84E7BB87E6B2BBE79086E79A84E585A8E696B0E998B6E6AEB5E28094E28094E69E84E5BBBAE2809C312B362B4EE2809DE79A84E7BB84E7BB87E7BB93E69E84EFBC8CE58DB3E59CA8E998BFE9878CE5B7B4E5B7B4E99B86E59BA2E4B98BE4B88BEFBC8CE8AEBEE7AB8BE998BFE9878CE4BA91E699BAE883BDE38081E6B798E5AE9DE5A4A9E78CABE59586E4B89AE38081E69CACE59CB0E7949FE6B4BBE38081E88F9CE9B89FE38081E59BBDE99985E695B0E5AD97E59586E4B89AE38081E5A4A7E69687E5A8B1E7AD89E585ADE5A4A7E4B89AE58AA1E99B86E59BA2E5928CE5A49AE5AEB6E4B89AE58AA1E585ACE58FB8EFBC8CE5B9B6E58886E588ABE5BBBAE7AB8BE59084E4B89AE58AA1E99B86E59BA2E5928CE4B89AE58AA1E585ACE58FB8E79A84E891A3E4BA8BE4BC9AEFBC8CE5AE9EE8A18CE59084E4B89AE58AA1E99B86E59BA2E5928CE4B89AE58AA1E585ACE58FB8E891A3E4BA8BE4BC9AE9A286E5AFBCE4B88BE79A8443454FE8B49FE8B4A3E588B6EFBC8CE5AFB9E59084E887AAE7BB8FE890A5E7BB93E69E9CE8B49FE680BBE8B4A3E38082E585B7E4BD93E8AEA1E58892E5A682E4B88BEFBC9A3C2F703E3C703EE68890E7AB8BE4BA91E699BAE883BDE99B86E59BA2EFBC8CE794B1E68891E585BCE4BBBB43454FEFBC9B3C2F703E3C703EE68890E7AB8BE6B798E5AE9DE5A4A9E78CABE59586E4B89AE99B86E59BA2EFBC8CE688B4E78F8AEFBC88E88B8FE88D83EFBC89E4BBBB43454FEFBC9B3C2F703E3C703EE68890E7AB8BE69CACE59CB0E7949FE6B4BBE99B86E59BA2EFBC8CE4BF9EE6B0B8E7A68FE68B85E4BBBB43454FEFBC9B3C2F703E3C703EE88F9CE9B89FE99B86E59BA2E7BBA7E7BBADE794B1E4B887E99C96E68B85E4BBBB43454FEFBC9B3C2F703E3C703EE68890E7AB8BE59BBDE99985E695B0E5AD97E59586E4B89AE99B86E59BA2EFBC8CE8928BE587A1E4BBBB43454FEFBC9B3C2F703E3C703EE68890E7AB8BE5A4A7E69687E5A8B1E99B86E59BA2EFBC8CE6A88AE8B7AFE8BF9CEFBC88E69CA8E58D8EE9BB8EEFBC89E68B85E4BBBB43454FE380823C2F703E3C703EE6ADA4E5A496EFBC8CE585B6E4BB96E585B7E5A487E69DA1E4BBB6E79A84E4B89AE58AA1E7BB84E7BB87E5B086E8AEBEE7AB8BE5A49AE5AEB6E4B89AE58AA1E585ACE58FB8EFBC8CE585A8E99DA2E5AE9EE8A18CE585ACE58FB8E58C96E7AEA1E79086E380823C2F703E3C703EE8AEA9E7BB84E7BB87E58F98E6958FE68DB7EFBC8CE8AEA9E586B3E7AD96E993BEE8B7AFE58F98E79FADEFBC8CE8AEA9E5938DE5BA94E58F98E5BFABEFBC8CE698AFE69CACE6ACA1E58F98E99DA9E79A84E5889DE8A1B7E5928CE6A0B9E69CACE79BAEE79A84E38082E6ADA4E6ACA1E8B083E695B4E5908EEFBC8CE999A4E6BBA1E8B6B3E4B88AE5B882E585ACE58FB8E59088E8A784E8A681E6B182E5A496EFBC8CE998BFE9878CE5B7B4E5B7B4E99B86E59BA2E79A84E4B8ADE5908EE58FB0E8818CE883BDE983A8E997A8E5B086E585A8E99DA2E5819AE8BDBBE38081E5819AE89684EFBC8CE99B86E59BA2E5B086E585A8E99DA2E5AE9EE8A18CE68EA7E882A1E585ACE58FB8E7AEA1E79086E38082E8808CE68891E4BBACE5A49AE5B9B4E4BBA5E69DA5E7A7AFE7B4AFE79A84E4B8ADE5908EE58FB0E883BDE58A9BEFBC8CE5B086E69C89E5BA8FE8BF9BE585A5E588B0E79BB8E585B3E4B89AE58AA1E99B86E59BA2E5928CE585ACE58FB8EFBC8CE4B8BAE5898DE58FB0E4B89AE58AA1E58F91E5B195E7BBA7E7BBADE58F91E68CA5E9878DE8A681E4BBB7E580BCE38082E5A49AE4B8AAE4B89AE58AA1E99B86E59BA2E5928CE585ACE58FB8E68980E5BF85E99C80E79A84E585B1E4BAABE4B8ADE5908EE58FB0E69C8DE58AA1EFBC8CE5B086E9809AE8BF87E4B893E4B89AE69C8DE58AA1E585ACE58FB8E79A84E6A8A1E5BC8FE68F90E4BE9BE38082E59CA8E6ADA4E4B99FE789B9E588ABE6849FE8B0A2E99B86E59BA2E4B8ADE5908EE58FB0E59BA2E9989FE585ABE5B9B4E69DA5E79A84E889B0E88BA6E58AAAE58A9BEFBC8CE6ADA3E59BA0E4B8BAE69C89E4BA86E4BDA0E4BBACE79A84E5AE9DE8B4B5E6B289E6B780EFBC8CE6898DE69C89E5AE9EE696BDE8BF99E6ACA1E58F98E99DA9E79A84E59D9AE5AE9EE59FBAE7A180E380823C2F703E3C703EE99DA2E59091E69CAAE69DA5EFBC8CE6AF8FE4B8AAE4B89AE58AA1E99B86E59BA2E5928CE585ACE58FB8EFBC8CE983BDE5BF85E9A1BBE7A7AFE69E81E99DA2E5AFB9E5B882E59CBAE79A84E79EACE681AFE4B887E58F98E5928CE68A80E69CAFE79A84E697A5E696B0E69C88E5BC82EFBC8CE5BDA2E68890E59084E887AAE79A84E58F91E5B195E68898E795A5EFBC8CE5BFABE9809FE586B3E7AD96E38081E58AAAE58A9BE8BF9BE58F96E38081E58B87E4BA8EE5889BE696B0EFBC8CE79BB4E99DA2E5B882E59CBAE79A84E88083E9AA8CE38082E6AF8FE4B880E4BD8DE998BFE9878CE4BABAEFBC8CE4B88DE8AEBAE4BDA0E8BAABE5A484E593AAE4B8AAE4B89AE58AA1E99B86E59BA2E68896E88085E4B89AE58AA1E585ACE58FB8EFBC8CE983BDE5BF85E9A1BBE8AEA9E887AAE5B7B1E59B9EE5BD92E588B0E4B880E4B8AAE5889BE4B89AE88085E79A84E78AB6E68081E5868DE587BAE58F91EFBC8CE4BBA5E887AAE8BAABE79A84E6BF80E68385E5928CE5AE9EE58A9BE68EA5E58F97E5B882E59CBAE79A84E6B497E7A4BCEFBC8CE5889BE980A0E5B19EE4BA8EE887AAE5B7B1E79A84E6988EE5A4A9E38082E68891E4BBACE79BB8E4BFA1EFBC8CE5B882E59CBAE698AFE69C80E5A5BDE79A84E8AF95E98791E79FB3EFBC8CE69CAAE69DA5EFBC8CE585B7E5A487E69DA1E4BBB6E79A84E4B89AE58AA1E99B86E59BA2E5928CE585ACE58FB8EFBC8CE983BDE5B086E69C89E78BACE7AB8BE89E8DE8B584E5928CE4B88AE5B882E79A84E58FAFE883BDE680A7E380823C2F703E3C703EE5B882E59CBAE79A84E58F98E58C96E6B0B8E4B88DE5819CE6ADA2EFBC8CE696B0E4B880E4BBA3E68A80E69CAFE6B5AAE6BDAEE4B88DE696ADE6B68CE78EB0EFBC8CE4B88DE68BA5E68AB1E58F98E58C96E5B0B1E4BC9AE58F98E5BE97E583B5E58C96EFBC8CE4B88DE694B9E58F98E887AAE8BAABE5B0B1E4BC9AE8A2ABE697B6E4BBA3E68993E8B4A5E38082E4BC9AE5BD93E6B0B4E587BBE4B889E58D83E9878CEFBC8C3234E5B281E998BFE9878CE6ADA3E8BF8EE69DA5E696B0E79A84E58F91E5B195E5A591E69CBAE38082E68891E4BBACE69C89E58F98E99DA9E79A84E58B87E6B094E5928CE4BDBFE591BDE6849FEFBC8CE69BB4E69C89E58F98E99DA9E79A84E883BDE58A9BE5928CE5BA95E6B094E38082E8A681E68890E4B8BAE4B880E5AEB6E6B4BB313032E5B9B4E79A84E5A5BDE585ACE58FB8EFBC8CE8A681E59D9AE68C81E8AEA9E5A4A9E4B88BE6B2A1E69C89E99ABEE5819AE79A84E7949FE6848FEFBC8CE5B0B1E5BF85E9A1BBE5A78BE7BB88E887AAE68891E9A9B1E58AA8EFBC8CE5BF85E9A1BBE585B7E5A487E887AAE68891E58F98E99DA9E79A84E58B87E6B094EFBC8CE5BF85E9A1BBE59D9AE68C81E8B5B0E59CA8E887AAE68891E58F98E99DA9E79A84E8B7AFE4B88AE380823C2F703E3C703EE69CAAE69DA5E5B19EE4BA8EE69BB4E59D9AE5AE9AE38081E69BB4E6958FE68DB7E38081E69BB4E68BA5E68AB1E69CAAE69DA5E79A84E4BABAEFBC813C2F703E3C703EE998BFE9878CE5B7B4E5B7B4E99B86E59BA2E891A3E4BA8BE4BC9AE4B8BBE5B8ADE585BCE9A696E5B8ADE689A7E8A18CE5AE983C2F703E3C703EE5BCA0E58B87EFBC88E9808DE981A5E5AD90EFBC893C2F703E3C703E32303233E5B9B433E69C883238E697A53C2F703E3C703E3C62723E3C2F703E, '0', 'admin', '2023-03-28 23:25:20', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-03-22 19:13:00', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, 'clean', '扫地僧', 5, '1', 'admin', '2023-03-23 23:03:13', 'admin', '2023-03-23 23:04:20', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-03-22 19:13:00', '', NULL, '超级管理员');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-03-22 19:13:00', 'admin', '2023-03-22 23:31:05', '普通角色');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, 'test2', 'test2', 3, '1', 1, 1, '0', '2', 'admin', '2023-03-22 23:02:17', 'admin', '2023-03-22 23:02:24', NULL);
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (101, '经理', 'manager', 3, '1', 1, 1, '0', '0', 'admin', '2023-03-28 23:44:03', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES (2, 100);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES (2, 101);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES (2, 105);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 100);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 101);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 102);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 103);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 104);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 107);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1017);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1018);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1019);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1020);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1021);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1022);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1023);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1035);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1036);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1037);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1038);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 3);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 4);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 5);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 6);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 7);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 8);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 9);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 10);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1017);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1018);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1019);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1020);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1021);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1022);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1023);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1035);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1036);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1037);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 1038);
COMMIT;

-- ----------------------------
-- Table structure for sys_timeline
-- ----------------------------
DROP TABLE IF EXISTS `sys_timeline`;
CREATE TABLE `sys_timeline` (
  `timeline_id` bigint NOT NULL AUTO_INCREMENT COMMENT '流程id',
  `parent_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '父流程id',
  `timeline_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '流程名称',
  `timeline_content` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '流程列表',
  `timeline_comment` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '评论',
  `leader` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `creator` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '流程状态（0未开始 1进行中 2已完成）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`timeline_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='流程信息表';

-- ----------------------------
-- Records of sys_timeline
-- ----------------------------
BEGIN;
INSERT INTO `sys_timeline` (`timeline_id`, `parent_id`, `timeline_name`, `timeline_content`, `timeline_comment`, `leader`, `creator`, `status`, `del_flag`, `create_time`, `update_by`, `update_time`) VALUES (100, NULL, 'sss', 'sss', NULL, 'sss', 'sss', '0', NULL, '2023-03-28 00:19:53', NULL, NULL);
INSERT INTO `sys_timeline` (`timeline_id`, `parent_id`, `timeline_name`, `timeline_content`, `timeline_comment`, `leader`, `creator`, `status`, `del_flag`, `create_time`, `update_by`, `update_time`) VALUES (101, NULL, '嘎嘎嘎', '收到罚单', NULL, '速度是多少', '是的是的', '0', NULL, '2023-03-28 00:25:36', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8mb4_general_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 103, 'admin', 'admin', '00', '123123@qq.com', '15012312312', '0', '/profile/avatar/2023/03/22/blob_20230322224838A001.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-04-01 20:44:02', 'admin', '2023-03-22 19:13:00', '', '2023-04-01 20:44:01', '管理员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 100, 'gaoqiqiang', '高启强', '00', '123121673@qq.com', '18012312312', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-03-22 19:13:00', 'admin', '2023-03-22 19:13:00', 'admin', '2023-03-22 22:52:35', 'CEO');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, 102, 'gaoqishegn', '高启盛', '00', '12@qq.com', '15022323123', '0', '', '$2a$10$5e11ED796Vss7spfuYg54OScULlkOQSjunDRjtQulEqUwkrELAXRy', '0', '0', '', NULL, 'admin', '2023-03-22 22:51:22', 'admin', '2023-03-22 22:52:45', '...');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (101, 101, 'gaoqilan', '高启兰', '00', '12343@163.com', '15012341234', '1', '', '$2a$10$HD6cBAwMhnJuHvITmD5/Ze9h7hhY8B52eaZgvwL.QA9zTD20nNfpu', '0', '0', '', NULL, 'admin', '2023-03-22 22:53:46', '', NULL, '。。');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (102, 101, '11111', 'test22222', '00', '12312312@qq.com', '13012312343', '0', '', '$2a$10$y8shN6I8cdqc9OrTKByKCOdx1vrJbNtNllGd1FJMsPn4t2XA1OSTK', '1', '2', '', NULL, 'admin', '2023-03-22 22:54:41', 'admin', '2023-03-22 22:54:49', '1212312');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (103, 200, 'zhangsan', 'zhangsan', '00', '34132@qq.com', '15012414212', '0', '', '$2a$10$Dz7K5/jBFDE54nbotgY9IOydDFWkPHUns331IPKD3s2zqbI/cIVsW', '0', '0', '127.0.0.1', '2023-03-22 23:24:33', '', '2023-03-22 23:21:01', 'admin', '2023-03-22 23:24:32', 'eeee');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (104, 100, 'zs', 'zs', '00', '', '', '0', '', '$2a$10$ir8Hlwljq5OzkdlSkDI/iewsctvzEPQosVjxJLwjkm8aeilclAkfG', '0', '0', '127.0.0.1', '2023-03-28 23:46:36', '', '2023-03-28 23:41:52', 'admin', '2023-03-28 23:46:36', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (1, 1);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (2, 1);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (100, 2);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (101, 2);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (103, 3);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (104, 4);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (1, 1);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (2, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (100, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (101, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (103, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (104, 101);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
