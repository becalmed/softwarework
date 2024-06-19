/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : 127.0.0.1:3306
 Source Schema         : softwarework

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 19/06/2024 13:42:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity_cost
-- ----------------------------
DROP TABLE IF EXISTS `activity_cost`;
CREATE TABLE `activity_cost`  (
                                  `id` int(11) NOT NULL AUTO_INCREMENT,
                                  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
                                  `activity_id` int(11) DEFAULT NULL COMMENT '活动id',
                                  `price` float(10, 2) DEFAULT NULL COMMENT '金额',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '费用说明',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动费用' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for activity_feedback
-- ----------------------------
DROP TABLE IF EXISTS `activity_feedback`;
CREATE TABLE `activity_feedback`  (
                                      `id` int(11) NOT NULL AUTO_INCREMENT,
                                      `activity_id` int(11) DEFAULT NULL COMMENT '活动id',
                                      `user_id` int(11) DEFAULT NULL COMMENT '用户id',
                                      `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '反馈内容',
                                      `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '反馈时间',
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动反馈' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for activity_schedule
-- ----------------------------
DROP TABLE IF EXISTS `activity_schedule`;
CREATE TABLE `activity_schedule`  (
                                      `id` int(11) NOT NULL AUTO_INCREMENT,
                                      `aid` int(11) DEFAULT NULL COMMENT '活动名称',
                                      `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '活动日程名称',
                                      `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                      `start_time` datetime(0) DEFAULT NULL COMMENT '开始时间',
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动日程' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for activity_user
-- ----------------------------
DROP TABLE IF EXISTS `activity_user`;
CREATE TABLE `activity_user`  (
                                  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                  `activity_id` int(11) DEFAULT NULL COMMENT '活动id',
                                  `user_id` int(11) DEFAULT NULL COMMENT '报名用户id',
                                  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '审核状态',
                                  `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '报名时间',
                                  `classify` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动人员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_user
-- ----------------------------
INSERT INTO `activity_user` VALUES (10, 20, 7, '通过', '2024-06-19 13:19:26', NULL);

-- ----------------------------
-- Table structure for code_column_config
-- ----------------------------
DROP TABLE IF EXISTS `code_column_config`;
CREATE TABLE `code_column_config`  (
                                       `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                                       `table_name` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                       `column_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                       `column_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                       `dict_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                       `extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                       `form_show` bit(1) DEFAULT NULL,
                                       `form_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                       `key_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                       `list_show` bit(1) DEFAULT NULL,
                                       `not_null` bit(1) DEFAULT NULL,
                                       `query_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                       `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                       `date_annotation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                       PRIMARY KEY (`column_id`) USING BTREE,
                                       INDEX `idx_table_name`(`table_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 376 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成字段信息存储' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of code_column_config
-- ----------------------------
INSERT INTO `code_column_config` VALUES (191, 'activity_data_sheet', 'activity_number', 'int', NULL, 'auto_increment', b'1', NULL, 'PRI', b'1', b'0', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (192, 'activity_data_sheet', 'activity_name', 'varchar', NULL, '', b'1', NULL, '', b'1', b'1', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (193, 'activity_data_sheet', 'activity_creator_number', 'int', NULL, '', b'1', NULL, '', b'1', b'1', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (194, 'activity_data_sheet', 'progress_of_activity', 'varchar', NULL, '', b'1', NULL, '', b'1', b'1', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (195, 'sys_activity', 'activity_id', 'int', NULL, 'auto_increment', b'0', NULL, 'PRI', b'0', b'0', NULL, '活动编号', NULL);
INSERT INTO `code_column_config` VALUES (196, 'sys_activity', 'activity_name', 'varchar', NULL, '', b'1', 'Input', '', b'1', b'1', 'Like', '活动名称', NULL);
INSERT INTO `code_column_config` VALUES (197, 'sys_activity', 'activity_progress', 'varchar', 'activity_status', '', b'1', 'Select', '', b'1', b'1', '=', '活动类型', NULL);
INSERT INTO `code_column_config` VALUES (198, 'sys_activity', 'create_by', 'int', NULL, '', b'1', NULL, '', b'1', b'1', '=', '创建者', NULL);
INSERT INTO `code_column_config` VALUES (199, 'sys_activity', 'update_by', 'int', NULL, '', b'0', NULL, '', b'0', b'0', '=', '更新者', NULL);
INSERT INTO `code_column_config` VALUES (200, 'sys_activity', 'create_time', 'datetime', NULL, '', b'0', NULL, '', b'1', b'0', NULL, '创建时间', 'CreationTimestamp');
INSERT INTO `code_column_config` VALUES (201, 'sys_activity', 'update_time', 'datetime', NULL, '', b'0', NULL, '', b'1', b'0', NULL, '更新时间', 'UpdateTimestamp');
INSERT INTO `code_column_config` VALUES (202, 'sys_activity', 'start_time', 'datetime', NULL, '', b'1', 'Input', '', b'1', b'1', NULL, '开始日期', NULL);
INSERT INTO `code_column_config` VALUES (204, 'sys_activity', 'end_time', 'datetime', NULL, '', b'1', 'Input', '', b'1', b'1', NULL, '结束日期', NULL);
INSERT INTO `code_column_config` VALUES (206, 'sys_activity', 'participants', 'varchar', NULL, '', b'1', 'Select', '', b'1', b'0', '=', '参与者列表', NULL);
INSERT INTO `code_column_config` VALUES (208, 'sys_activity_table', 'date', 'varchar', NULL, '', b'0', '', 'PRI', b'1', b'1', '=', '日期', NULL);
INSERT INTO `code_column_config` VALUES (229, 'sys_activity_table', 'activity8to9', 'varchar', NULL, '', b'0', NULL, '', b'1', b'0', NULL, '日程8:00-9:00', NULL);
INSERT INTO `code_column_config` VALUES (230, 'sys_activity_table', 'activity9to10', 'varchar', NULL, '', b'0', NULL, '', b'1', b'0', NULL, '日程9:00-10:00', NULL);
INSERT INTO `code_column_config` VALUES (231, 'sys_activity_table', 'activity10to11', 'varchar', NULL, '', b'0', NULL, '', b'1', b'0', NULL, '日程10:00-11:00', NULL);
INSERT INTO `code_column_config` VALUES (232, 'sys_activity_table', 'activity11to12', 'varchar', NULL, '', b'0', NULL, '', b'1', b'0', NULL, '日程11:00-12:00', NULL);
INSERT INTO `code_column_config` VALUES (233, 'sys_activity_table', 'activity12to13', 'varchar', NULL, '', b'0', NULL, '', b'1', b'0', NULL, '日程12:00-13:00', NULL);
INSERT INTO `code_column_config` VALUES (234, 'sys_activity_table', 'activity13to14', 'varchar', NULL, '', b'0', NULL, '', b'1', b'0', NULL, '日程13:00-14:00', NULL);
INSERT INTO `code_column_config` VALUES (235, 'sys_activity_table', 'activity14to15', 'varchar', NULL, '', b'0', NULL, '', b'1', b'0', NULL, '日程14:00-15:00', NULL);
INSERT INTO `code_column_config` VALUES (236, 'sys_activity_table', 'activity15to16', 'varchar', NULL, '', b'0', NULL, '', b'1', b'0', NULL, '日程5:00-16:00', NULL);
INSERT INTO `code_column_config` VALUES (237, 'sys_activity_table', 'activity16to17', 'varchar', NULL, '', b'0', NULL, '', b'1', b'0', NULL, '日程16:00-17:00', NULL);
INSERT INTO `code_column_config` VALUES (238, 'sys_activity_table', 'activity17to18', 'varchar', NULL, '', b'0', NULL, '', b'1', b'0', NULL, '日程17:00-18:00', NULL);
INSERT INTO `code_column_config` VALUES (239, 'resource_requirements', 'ID', 'int', NULL, 'auto_increment', b'1', NULL, 'PRI', b'1', b'0', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (240, 'resource_requirements', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nresource', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (241, 'resource_requirements', 'type', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (242, 'message', 'id', 'int', NULL, 'auto_increment', b'1', NULL, 'PRI', b'1', b'0', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (243, 'message', 'title', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '标题', NULL);
INSERT INTO `code_column_config` VALUES (244, 'message', 'content', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '内容', NULL);
INSERT INTO `code_column_config` VALUES (245, 'message', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '创建时间', NULL);
INSERT INTO `code_column_config` VALUES (246, 'message', 'create_user', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '发送用户', NULL);
INSERT INTO `code_column_config` VALUES (247, 'message', 'uid', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '接收用户', NULL);
INSERT INTO `code_column_config` VALUES (248, 'message', 'type', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '类型', NULL);
INSERT INTO `code_column_config` VALUES (249, 'discuss', 'id', 'int', NULL, 'auto_increment', b'1', NULL, 'PRI', b'1', b'0', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (250, 'discuss', 'user_id', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '用户id', NULL);
INSERT INTO `code_column_config` VALUES (251, 'discuss', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '创建时间', NULL);
INSERT INTO `code_column_config` VALUES (252, 'discuss', 'title', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '讨论标题', NULL);
INSERT INTO `code_column_config` VALUES (253, 'tool_qiniu_content', 'content_id', 'bigint', NULL, 'auto_increment', b'1', NULL, 'PRI', b'1', b'0', NULL, 'ID', NULL);
INSERT INTO `code_column_config` VALUES (254, 'tool_qiniu_content', 'bucket', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, 'Bucket 识别符', NULL);
INSERT INTO `code_column_config` VALUES (255, 'tool_qiniu_content', 'name', 'varchar', NULL, '', b'1', NULL, 'UNI', b'1', b'0', NULL, '文件名称', NULL);
INSERT INTO `code_column_config` VALUES (256, 'tool_qiniu_content', 'size', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '文件大小', NULL);
INSERT INTO `code_column_config` VALUES (257, 'tool_qiniu_content', 'type', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '文件类型：私有或公开', NULL);
INSERT INTO `code_column_config` VALUES (258, 'tool_qiniu_content', 'url', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '文件url', NULL);
INSERT INTO `code_column_config` VALUES (259, 'tool_qiniu_content', 'suffix', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '文件后缀', NULL);
INSERT INTO `code_column_config` VALUES (260, 'tool_qiniu_content', 'update_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '上传或同步的时间', NULL);
INSERT INTO `code_column_config` VALUES (261, 'tool_qiniu_config', 'config_id', 'bigint', NULL, '', b'1', NULL, 'PRI', b'1', b'1', NULL, 'ID', NULL);
INSERT INTO `code_column_config` VALUES (262, 'tool_qiniu_config', 'access_key', 'text', NULL, '', b'1', NULL, '', b'1', b'0', NULL, 'accessKey', NULL);
INSERT INTO `code_column_config` VALUES (263, 'tool_qiniu_config', 'bucket', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, 'Bucket 识别符', NULL);
INSERT INTO `code_column_config` VALUES (264, 'tool_qiniu_config', 'host', 'varchar', NULL, '', b'1', NULL, '', b'1', b'1', NULL, '外链域名', NULL);
INSERT INTO `code_column_config` VALUES (265, 'tool_qiniu_config', 'secret_key', 'text', NULL, '', b'1', NULL, '', b'1', b'0', NULL, 'secretKey', NULL);
INSERT INTO `code_column_config` VALUES (266, 'tool_qiniu_config', 'type', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '空间类型', NULL);
INSERT INTO `code_column_config` VALUES (267, 'tool_qiniu_config', 'zone', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '机房', NULL);
INSERT INTO `code_column_config` VALUES (268, 'activity_user', 'id', 'int', '', 'auto_increment', b'1', NULL, 'PRI', b'1', b'0', NULL, 'id', NULL);
INSERT INTO `code_column_config` VALUES (269, 'activity_user', 'activity_id', 'int', NULL, '', b'1', '', '', b'1', b'0', NULL, '活动id', NULL);
INSERT INTO `code_column_config` VALUES (270, 'activity_user', 'user_id', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '报名用户id', NULL);
INSERT INTO `code_column_config` VALUES (271, 'activity_user', 'status', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '审核状态', NULL);
INSERT INTO `code_column_config` VALUES (272, 'activity_user', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '报名时间', NULL);
INSERT INTO `code_column_config` VALUES (273, 'activity_user', 'classify', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '分类', NULL);
INSERT INTO `code_column_config` VALUES (274, 'activity_cost', 'id', 'int', NULL, 'auto_increment', b'1', NULL, 'PRI', b'1', b'0', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (275, 'activity_cost', 'user_id', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '用户id', NULL);
INSERT INTO `code_column_config` VALUES (276, 'activity_cost', 'activity_id', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '活动id', NULL);
INSERT INTO `code_column_config` VALUES (277, 'activity_cost', 'price', 'float', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '金额', NULL);
INSERT INTO `code_column_config` VALUES (278, 'activity_cost', 'content', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '费用说明', NULL);
INSERT INTO `code_column_config` VALUES (279, 'activity_cost', 'status', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '审核状态', NULL);
INSERT INTO `code_column_config` VALUES (280, 'reply', 'id', 'int', NULL, 'auto_increment', b'1', NULL, 'PRI', b'1', b'0', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (281, 'reply', 'did', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '讨论表id', NULL);
INSERT INTO `code_column_config` VALUES (282, 'reply', 'content', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '回复内容', NULL);
INSERT INTO `code_column_config` VALUES (283, 'reply', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '回复时间', NULL);
INSERT INTO `code_column_config` VALUES (284, 'reply', 'user_id', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '回复用户', NULL);
INSERT INTO `code_column_config` VALUES (285, 'message_template', 'id', 'int', NULL, 'auto_increment', b'1', NULL, 'PRI', b'1', b'0', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (286, 'message_template', 'title', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '模板标题', NULL);
INSERT INTO `code_column_config` VALUES (287, 'message_template', 'content', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '模板内容', NULL);
INSERT INTO `code_column_config` VALUES (288, 'message_template', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '创建时间', NULL);
INSERT INTO `code_column_config` VALUES (289, 'activity_feedback', 'id', 'int', NULL, 'auto_increment', b'1', NULL, 'PRI', b'1', b'0', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (290, 'activity_feedback', 'activity_id', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '活动id', NULL);
INSERT INTO `code_column_config` VALUES (291, 'activity_feedback', 'user_id', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '用户id', NULL);
INSERT INTO `code_column_config` VALUES (292, 'activity_feedback', 'content', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '反馈内容', NULL);
INSERT INTO `code_column_config` VALUES (293, 'activity_feedback', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '反馈时间', NULL);
INSERT INTO `code_column_config` VALUES (294, 'admin', 'id', 'int', NULL, '', b'1', NULL, 'PRI', b'1', b'1', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (295, 'admin', 'username', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (296, 'admin', 'password', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (297, 'answer_detail', 'id', 'int', NULL, '', b'1', NULL, 'PRI', b'1', b'1', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (298, 'answer_detail', 'aid', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '答题id', NULL);
INSERT INTO `code_column_config` VALUES (299, 'answer_detail', 'qid', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '问题id', NULL);
INSERT INTO `code_column_config` VALUES (300, 'answer_detail', 'options', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '选项冗余（避免原始题目修改）', NULL);
INSERT INTO `code_column_config` VALUES (301, 'answer_detail', 'solution', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '题目答案', NULL);
INSERT INTO `code_column_config` VALUES (302, 'answer_detail', 'option', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '学生选项', NULL);
INSERT INTO `code_column_config` VALUES (303, 'answer_detail', 'status', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '是否回答正确', NULL);
INSERT INTO `code_column_config` VALUES (304, 'answer', 'id', 'int', NULL, '', b'1', NULL, 'PRI', b'1', b'1', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (305, 'answer', 'student_id', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '学生id', NULL);
INSERT INTO `code_column_config` VALUES (306, 'answer', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '创建时间', NULL);
INSERT INTO `code_column_config` VALUES (307, 'answer', 'end_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '结束时间', NULL);
INSERT INTO `code_column_config` VALUES (308, 'answer', 'properly', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '正确题目数量', NULL);
INSERT INTO `code_column_config` VALUES (309, 'answer', 'incorrect', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '错误题目数量', NULL);
INSERT INTO `code_column_config` VALUES (310, 'ce_student', 'id', 'int', NULL, '', b'1', NULL, 'PRI', b'1', b'1', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (311, 'ce_student', 'ce_id', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '课程实验id', NULL);
INSERT INTO `code_column_config` VALUES (312, 'ce_student', 'student_id', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '学生id', NULL);
INSERT INTO `code_column_config` VALUES (313, 'ce_student', 'question', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '题目答案（json存储）', NULL);
INSERT INTO `code_column_config` VALUES (314, 'ce_student', 'score', 'float', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '评分', NULL);
INSERT INTO `code_column_config` VALUES (315, 'ce_student', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '开始时间', NULL);
INSERT INTO `code_column_config` VALUES (316, 'ce_student', 'end_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '结束时间', NULL);
INSERT INTO `code_column_config` VALUES (317, 'ce_student', 'duration', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '耗时（秒）', NULL);
INSERT INTO `code_column_config` VALUES (318, 'ce_student', 'option', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '学生答案（json存储）', NULL);
INSERT INTO `code_column_config` VALUES (319, 'classes', 'id', 'int', NULL, 'auto_increment', b'1', NULL, 'PRI', b'1', b'0', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (320, 'classes', 'period', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '届时', NULL);
INSERT INTO `code_column_config` VALUES (321, 'classes', 'name', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '期班名称', NULL);
INSERT INTO `code_column_config` VALUES (322, 'classes', 'create_time', 'datetime', NULL, 'DEFAULT_GENERATED', b'1', NULL, '', b'1', b'0', NULL, '创建时间', NULL);
INSERT INTO `code_column_config` VALUES (323, 'course_student', 'id', 'int', NULL, '', b'1', NULL, 'PRI', b'1', b'1', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (324, 'course_student', 'course_id', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '课程id', NULL);
INSERT INTO `code_column_config` VALUES (325, 'course_student', 'student_id', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '学生id', NULL);
INSERT INTO `code_column_config` VALUES (326, 'course_student', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '申请时间', NULL);
INSERT INTO `code_column_config` VALUES (327, 'course_student', 'status', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '审批状态', NULL);
INSERT INTO `code_column_config` VALUES (328, 'courses_classified', 'id', 'int', NULL, '', b'1', NULL, 'PRI', b'1', b'1', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (329, 'courses_classified', 'name', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '课程分类名称', NULL);
INSERT INTO `code_column_config` VALUES (330, 'courses_classified', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '创建时间', NULL);
INSERT INTO `code_column_config` VALUES (331, 'course', 'id', 'int', NULL, '', b'1', NULL, 'PRI', b'1', b'1', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (332, 'course', 'name', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '课程名称', NULL);
INSERT INTO `code_column_config` VALUES (333, 'course', 'cc_id', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '课程分类', NULL);
INSERT INTO `code_column_config` VALUES (334, 'course', 'synopsis', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '简介', NULL);
INSERT INTO `code_column_config` VALUES (335, 'course', 'teacher_id', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '教师', NULL);
INSERT INTO `code_column_config` VALUES (336, 'course', 'img', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '图片', NULL);
INSERT INTO `code_column_config` VALUES (337, 'course', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '创建时间', NULL);
INSERT INTO `code_column_config` VALUES (338, 'course_experiment', 'id', 'int', NULL, '', b'1', NULL, 'PRI', b'1', b'1', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (339, 'course_experiment', 'cid', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '课程id', NULL);
INSERT INTO `code_column_config` VALUES (340, 'course_experiment', 'eid', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '实验id', NULL);
INSERT INTO `code_column_config` VALUES (341, 'course_experiment', 'start_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '开始时间', NULL);
INSERT INTO `code_column_config` VALUES (342, 'course_experiment', 'end_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '结束时间', NULL);
INSERT INTO `code_column_config` VALUES (343, 'course_experiment', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '创建时间', NULL);
INSERT INTO `code_column_config` VALUES (344, 'dept', 'id', 'int', NULL, '', b'1', NULL, 'PRI', b'1', b'1', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (345, 'dept', 'name', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '部门名称', NULL);
INSERT INTO `code_column_config` VALUES (346, 'dept', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '创建时间', NULL);
INSERT INTO `code_column_config` VALUES (347, 'experiment', 'id', 'int', NULL, '', b'1', NULL, 'PRI', b'1', b'1', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (348, 'experiment', 'name', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '实验名称', NULL);
INSERT INTO `code_column_config` VALUES (349, 'experiment', 'synopsis', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '实验介绍', NULL);
INSERT INTO `code_column_config` VALUES (350, 'experiment', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '创建时间', NULL);
INSERT INTO `code_column_config` VALUES (351, 'question', 'id', 'int', NULL, '', b'1', NULL, 'PRI', b'1', b'1', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (352, 'question', 'title', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '题目名称', NULL);
INSERT INTO `code_column_config` VALUES (353, 'question', 'options', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '选项，使用json存储', NULL);
INSERT INTO `code_column_config` VALUES (354, 'question', 'solution', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '正确答案', NULL);
INSERT INTO `code_column_config` VALUES (355, 'question', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '创建时间', NULL);
INSERT INTO `code_column_config` VALUES (356, 'student', 'id', 'int', NULL, 'auto_increment', b'1', NULL, 'PRI', b'1', b'0', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (357, 'student', 'name', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '姓名', NULL);
INSERT INTO `code_column_config` VALUES (358, 'student', 'code', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '学号', NULL);
INSERT INTO `code_column_config` VALUES (359, 'student', 'class_id', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '班级ID', NULL);
INSERT INTO `code_column_config` VALUES (360, 'student', 'password', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '密码', NULL);
INSERT INTO `code_column_config` VALUES (361, 'student', 'create_time', 'datetime', NULL, 'DEFAULT_GENERATED', b'1', NULL, '', b'1', b'0', NULL, '创建时间', NULL);
INSERT INTO `code_column_config` VALUES (362, 'student', 'geder', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '性别', NULL);
INSERT INTO `code_column_config` VALUES (363, 'teacher', 'id', 'int', NULL, 'auto_increment', b'1', NULL, 'PRI', b'1', b'0', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (364, 'teacher', 'code', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '工号', NULL);
INSERT INTO `code_column_config` VALUES (365, 'teacher', 'name', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '姓名', NULL);
INSERT INTO `code_column_config` VALUES (366, 'teacher', 'dept_id', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '部门id', NULL);
INSERT INTO `code_column_config` VALUES (367, 'teacher', 'password', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '密码', NULL);
INSERT INTO `code_column_config` VALUES (368, 'teacher', 'create_time', 'datetime', NULL, 'DEFAULT_GENERATED', b'1', NULL, '', b'1', b'0', NULL, '创建时间', NULL);
INSERT INTO `code_column_config` VALUES (369, 'activity_schedule', 'id', 'int', NULL, '', b'1', NULL, 'PRI', b'1', b'1', NULL, '', NULL);
INSERT INTO `code_column_config` VALUES (370, 'activity_schedule', 'aid', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '活动名称', NULL);
INSERT INTO `code_column_config` VALUES (371, 'activity_schedule', 'title', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '活动日程名称', NULL);
INSERT INTO `code_column_config` VALUES (372, 'activity_schedule', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '创建时间', NULL);
INSERT INTO `code_column_config` VALUES (373, 'activity_schedule', 'start_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '开始时间', NULL);
INSERT INTO `code_column_config` VALUES (374, 'sys_activity', 'rid', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '资源需求列表', NULL);
INSERT INTO `code_column_config` VALUES (375, 'sys_activity', 'cost', 'decimal', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '活动预算', NULL);

-- ----------------------------
-- Table structure for code_gen_config
-- ----------------------------
DROP TABLE IF EXISTS `code_gen_config`;
CREATE TABLE `code_gen_config`  (
                                    `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                                    `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '表名',
                                    `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '作者',
                                    `cover` bit(1) DEFAULT NULL COMMENT '是否覆盖',
                                    `module_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '模块名称',
                                    `pack` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '至于哪个包下',
                                    `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '前端代码生成的路径',
                                    `api_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '前端Api文件路径',
                                    `prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '表前缀',
                                    `api_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '接口名称',
                                    PRIMARY KEY (`config_id`) USING BTREE,
                                    INDEX `idx_table_name`(`table_name`(100)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成器配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of code_gen_config
-- ----------------------------
INSERT INTO `code_gen_config` VALUES (7, 'sys_activity', 'fjw', b'1', 'eladmin-system', 'me.zhengjie.modules.system', 'system\\activity', 'system\\activity\\', NULL, 'api.activity');
INSERT INTO `code_gen_config` VALUES (8, 'sys_activity_table', 'fjw', b'0', 'eladmin-system', 'me.zhengjie.modules.system', 'system\\activityTable', 'system\\activityTable\\', NULL, 'api.activityTable');
INSERT INTO `code_gen_config` VALUES (9, 'activity_user', 'fjw', b'0', 'eladmin-system', 'me.zhengjie.modules.system', 'system\\activityUser', 'system\\activityUser\\', NULL, '活动用户');
INSERT INTO `code_gen_config` VALUES (10, 'activity_cost', 'fjw', b'0', 'eladmin-system', 'me.zhengjie.modules.system', 'system\\activityCost', 'system\\activityCost\\', NULL, '活动费用');
INSERT INTO `code_gen_config` VALUES (11, 'activity_feedback', 'fjw', b'0', 'eladmin-system', 'me.zhengjie.modules.system', 'system\\activityFeedback', 'system\\activityFeedback\\', NULL, '活动反馈');
INSERT INTO `code_gen_config` VALUES (12, 'discuss', 'fjw', b'0', 'eladmin-system', 'me.zhengjie.modules.system', 'system\\discuss', 'system\\discuss\\', NULL, '讨论');
INSERT INTO `code_gen_config` VALUES (13, 'message', 'fjw', b'0', 'eladmin-system', 'me.zhengjie.modules.system', 'system\\message', 'system\\message\\', NULL, '消息');
INSERT INTO `code_gen_config` VALUES (14, 'message_template', 'fjw', b'0', 'eladmin-system', 'me.zhengjie.modules.system', 'system\\messageTemplate', 'system\\messageTemplate\\', NULL, '消息模板');
INSERT INTO `code_gen_config` VALUES (15, 'reply', 'fjw', b'0', 'eladmin-system', 'me.zhengjie.modules.system', 'system\\reply', 'system\\reply\\', NULL, '讨论回复');
INSERT INTO `code_gen_config` VALUES (16, 'resource_requirements', 'fjw', b'0', 'eladmin-system', 'me.zhengjie.modules.system', 'system\\resourceRequirements', 'system\\resourceRequirements\\', NULL, '资源');
INSERT INTO `code_gen_config` VALUES (17, 'admin', '1', b'0', '1', '1', '1', '1\\', NULL, '1');
INSERT INTO `code_gen_config` VALUES (18, 'answer', '1', b'0', '1', '1', '1', '1\\', NULL, '1');
INSERT INTO `code_gen_config` VALUES (19, 'answer_detail', '1', b'0', '1', '1', '1', '1\\', '1', '1');
INSERT INTO `code_gen_config` VALUES (20, 'ce_student', '1', b'0', '1', '1', '1', '1\\', NULL, '1');
INSERT INTO `code_gen_config` VALUES (21, 'classes', '1', b'0', '1', '1', '1', '1\\', NULL, '1');
INSERT INTO `code_gen_config` VALUES (22, 'course_student', '1', b'0', '1', '1', '1', '1\\', NULL, '1');
INSERT INTO `code_gen_config` VALUES (23, 'courses_classified', '1', b'0', '1', '1', '1', '1\\', NULL, '1');
INSERT INTO `code_gen_config` VALUES (24, 'course', '1', b'0', '1', '1', '1', '1\\', NULL, '1');
INSERT INTO `code_gen_config` VALUES (25, 'course_experiment', '1', b'0', '1', '1', '1', '1\\', NULL, '1');
INSERT INTO `code_gen_config` VALUES (26, 'dept', '1', b'0', '1', '1', '1', '1\\', NULL, '1');
INSERT INTO `code_gen_config` VALUES (27, 'experiment', '1', b'0', '1', '1', '1', '1\\', NULL, '1');
INSERT INTO `code_gen_config` VALUES (28, 'question', '1', b'0', '1', '1', '1', '1\\', NULL, '1');
INSERT INTO `code_gen_config` VALUES (29, 'student', '1', b'0', '1', '1', '1', '1\\', NULL, '1');
INSERT INTO `code_gen_config` VALUES (30, 'teacher', '1', b'0', '1', '1', '1', '1\\', NULL, '1');
INSERT INTO `code_gen_config` VALUES (31, 'activity_schedule', 'fjw', b'0', 'eladmin-system', 'me.zhengjie.modules.system', 'system\\activityFeedback', 'system\\activityFeedback\\', NULL, '活动日程');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
                         `id` int(11) NOT NULL,
                         `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门名称',
                         `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for discuss
-- ----------------------------
DROP TABLE IF EXISTS `discuss`;
CREATE TABLE `discuss`  (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `user_id` int(11) DEFAULT NULL COMMENT '用户id',
                            `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
                            `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '讨论标题',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '讨论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discuss
-- ----------------------------
INSERT INTO `discuss` VALUES (1, NULL, NULL, '1231');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
                            `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容',
                            `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `create_user` int(11) DEFAULT NULL COMMENT '发送用户',
                            `uid` int(11) DEFAULT NULL COMMENT '接收用户',
                            `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for message_template
-- ----------------------------
DROP TABLE IF EXISTS `message_template`;
CREATE TABLE `message_template`  (
                                     `id` int(11) NOT NULL AUTO_INCREMENT,
                                     `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模板标题',
                                     `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模板内容',
                                     `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message_template
-- ----------------------------
INSERT INTO `message_template` VALUES (1, '活动即将开始', '亲爱的活动参与者们，活动即将开始。', NULL);
INSERT INTO `message_template` VALUES (2, '活动结束', '亲爱的参与者们，本次活动结束，感谢大家的参与', NULL);

-- ----------------------------
-- Table structure for mnt_app
-- ----------------------------
DROP TABLE IF EXISTS `mnt_app`;
CREATE TABLE `mnt_app`  (
                            `app_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                            `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '应用名称',
                            `upload_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '上传目录',
                            `deploy_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '部署路径',
                            `backup_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备份路径',
                            `port` int(11) DEFAULT NULL COMMENT '应用端口',
                            `start_script` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '启动脚本',
                            `deploy_script` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '部署脚本',
                            `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
                            `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
                            `create_time` datetime(0) DEFAULT NULL COMMENT '创建日期',
                            `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`app_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '应用管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mnt_database
-- ----------------------------
DROP TABLE IF EXISTS `mnt_database`;
CREATE TABLE `mnt_database`  (
                                 `db_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID',
                                 `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
                                 `jdbc_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'jdbc连接',
                                 `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
                                 `pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
                                 `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
                                 `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
                                 `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
                                 `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
                                 PRIMARY KEY (`db_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据库管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mnt_deploy
-- ----------------------------
DROP TABLE IF EXISTS `mnt_deploy`;
CREATE TABLE `mnt_deploy`  (
                               `deploy_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                               `app_id` bigint(20) DEFAULT NULL COMMENT '应用编号',
                               `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
                               `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
                               `create_time` datetime(0) DEFAULT NULL,
                               `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
                               PRIMARY KEY (`deploy_id`) USING BTREE,
                               INDEX `FK6sy157pseoxx4fmcqr1vnvvhy`(`app_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部署管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mnt_deploy_history
-- ----------------------------
DROP TABLE IF EXISTS `mnt_deploy_history`;
CREATE TABLE `mnt_deploy_history`  (
                                       `history_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID',
                                       `app_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用名称',
                                       `deploy_date` datetime(0) NOT NULL COMMENT '部署日期',
                                       `deploy_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部署用户',
                                       `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务器IP',
                                       `deploy_id` bigint(20) DEFAULT NULL COMMENT '部署编号',
                                       PRIMARY KEY (`history_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部署历史管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mnt_deploy_server
-- ----------------------------
DROP TABLE IF EXISTS `mnt_deploy_server`;
CREATE TABLE `mnt_deploy_server`  (
                                      `deploy_id` bigint(20) NOT NULL COMMENT '部署ID',
                                      `server_id` bigint(20) NOT NULL COMMENT '服务ID',
                                      PRIMARY KEY (`deploy_id`, `server_id`) USING BTREE,
                                      INDEX `FKeaaha7jew9a02b3bk9ghols53`(`server_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '应用与服务器关联' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mnt_server
-- ----------------------------
DROP TABLE IF EXISTS `mnt_server`;
CREATE TABLE `mnt_server`  (
                               `server_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                               `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '账号',
                               `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'IP地址',
                               `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '名称',
                               `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '密码',
                               `port` int(11) DEFAULT NULL COMMENT '端口',
                               `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
                               `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
                               `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
                               `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
                               PRIMARY KEY (`server_id`) USING BTREE,
                               INDEX `idx_ip`(`ip`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '服务器管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
                          `id` int(11) NOT NULL AUTO_INCREMENT,
                          `did` int(11) DEFAULT NULL COMMENT '讨论表id',
                          `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '回复内容',
                          `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '回复时间',
                          `user_id` int(11) DEFAULT NULL COMMENT '回复用户',
                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for resource_requirements
-- ----------------------------
DROP TABLE IF EXISTS `resource_requirements`;
CREATE TABLE `resource_requirements`  (
                                          `id` int(11) NOT NULL AUTO_INCREMENT,
                                          `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                          `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource_requirements
-- ----------------------------
INSERT INTO `resource_requirements` VALUES (1, '教室301', '小教室（80人）');
INSERT INTO `resource_requirements` VALUES (2, '教室302', '小教室（80人）');
INSERT INTO `resource_requirements` VALUES (7, '篮球场1', '篮球场');
INSERT INTO `resource_requirements` VALUES (12, '教室', '大教室（150人）');

-- ----------------------------
-- Table structure for sys_activity
-- ----------------------------
DROP TABLE IF EXISTS `sys_activity`;
CREATE TABLE `sys_activity`  (
                                 `activity_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动编号',
                                 `activity_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
                                 `activity_progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动类型',
                                 `start_time` datetime(0) DEFAULT NULL COMMENT '开始日期',
                                 `end_time` datetime(0) DEFAULT NULL,
                                 `participants` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '参与者列表',
                                 `rid` int(11) DEFAULT NULL COMMENT '资源需求列表',
                                 `create_by` int(11) NOT NULL COMMENT '创建者',
                                 `update_by` int(11) DEFAULT NULL COMMENT '更新者',
                                 `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
                                 `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
                                 `cost` decimal(10, 2) DEFAULT NULL COMMENT '活动预算',
                                 PRIMARY KEY (`activity_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_activity
-- ----------------------------
INSERT INTO `sys_activity` VALUES (1, '校运动会', '1', '2024-05-30 10:10:10', '2024-05-31 10:10:10', NULL, 12, 1, NULL, '2024-05-15 21:18:55', '2024-06-18 19:08:05', 1000.00);
INSERT INTO `sys_activity` VALUES (2, '高工诗词大会', '1', '2024-05-30 10:10:10', '2024-05-31 10:10:10', NULL, NULL, 1, NULL, '2024-05-16 21:23:33', '2024-05-31 03:06:56', 1000.00);
INSERT INTO `sys_activity` VALUES (3, '高工美食节', '1', '2024-05-30 10:10:10', '2024-05-31 10:10:10', NULL, NULL, 1, NULL, '2024-05-16 22:34:25', '2024-05-31 03:07:02', 1000.00);
INSERT INTO `sys_activity` VALUES (4, '校庆日', '3', '2024-05-30 14:10:10', '2024-05-30 16:10:10', NULL, NULL, 1, NULL, '2024-05-16 22:43:47', '2024-05-31 03:07:14', 1000.00);
INSERT INTO `sys_activity` VALUES (5, '教师节', '2', '2024-05-30 10:10:10', '2024-05-30 13:10:10', NULL, NULL, 1, NULL, '2024-05-17 09:51:09', '2024-05-31 03:06:19', 1000.00);
INSERT INTO `sys_activity` VALUES (18, '111', '1', '2024-05-30 00:00:00', '2024-05-31 00:00:00', NULL, 1, 1, NULL, '2024-05-31 18:50:38', NULL, 1000.00);
INSERT INTO `sys_activity` VALUES (19, '222', '1', '2024-05-30 00:00:00', '2024-05-31 00:00:00', NULL, 2, 1, NULL, '2024-05-31 18:50:53', NULL, 1000.00);
INSERT INTO `sys_activity` VALUES (20, '1231', '1', '2024-06-29 10:10:57', '2024-06-30 00:00:00', NULL, 12, 6, NULL, '2024-06-19 10:11:17', NULL, 123.00);

-- ----------------------------
-- Table structure for sys_activity_table
-- ----------------------------
DROP TABLE IF EXISTS `sys_activity_table`;
CREATE TABLE `sys_activity_table`  (
                                       `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日期',
                                       `activity8to9` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日程8:00-9:00',
                                       `activity9to10` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日程9:00-10:00',
                                       `activity10to11` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日程10:00-11:00',
                                       `activity11to12` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日程11:00-12:00',
                                       `activity12to13` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日程12:00-13:00',
                                       `activity13to14` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日程13:00-14:00',
                                       `activity14to15` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日程14:00-15:00',
                                       `activity15to16` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日程5:00-16:00',
                                       `activity16to17` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日程16:00-17:00',
                                       `activity17to18` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日程17:00-18:00',
                                       PRIMARY KEY (`date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_activity_table
-- ----------------------------
INSERT INTO `sys_activity_table` VALUES ('2024-05-24', '1', '1', '1', '1', '1', '1', '1', NULL, NULL, NULL);
INSERT INTO `sys_activity_table` VALUES ('2024-05-25', NULL, '2', '2', '2', '2', '2', '2', '2', NULL, NULL);
INSERT INTO `sys_activity_table` VALUES ('2024-05-26', NULL, NULL, '3', '3', '3', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_activity_table` VALUES ('2024-05-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4', '4');
INSERT INTO `sys_activity_table` VALUES ('2024-05-28', '5', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
                             `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                             `pid` bigint(20) DEFAULT NULL COMMENT '上级部门',
                             `sub_count` int(11) DEFAULT 0 COMMENT '子部门数目',
                             `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
                             `dept_sort` int(11) DEFAULT 999 COMMENT '排序',
                             `enabled` bit(1) NOT NULL COMMENT '状态',
                             `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
                             `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
                             `create_time` datetime(0) DEFAULT NULL COMMENT '创建日期',
                             `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
                             PRIMARY KEY (`dept_id`) USING BTREE,
                             INDEX `inx_pid`(`pid`) USING BTREE,
                             INDEX `inx_enabled`(`enabled`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (2, 7, 1, '研发部', 3, b'1', 'admin', 'admin', '2019-03-25 09:15:32', '2020-08-02 14:48:47');
INSERT INTO `sys_dept` VALUES (5, 7, 0, '运维部', 4, b'1', 'admin', 'admin', '2019-03-25 09:20:44', '2020-05-17 14:27:27');
INSERT INTO `sys_dept` VALUES (6, 8, 0, '测试部', 6, b'1', 'admin', 'admin', '2019-03-25 09:52:18', '2020-06-08 11:59:21');
INSERT INTO `sys_dept` VALUES (7, NULL, 2, '华南分部', 0, b'1', 'admin', 'admin', '2019-03-25 11:04:50', '2020-06-08 12:08:56');
INSERT INTO `sys_dept` VALUES (8, NULL, 2, '华北分部', 1, b'1', 'admin', 'admin', '2019-03-25 11:04:53', '2020-05-14 12:54:00');
INSERT INTO `sys_dept` VALUES (15, 8, 0, 'UI部门', 7, b'1', 'admin', 'admin', '2020-05-13 22:56:53', '2020-05-14 12:54:13');
INSERT INTO `sys_dept` VALUES (17, 2, 0, '研发一组', 999, b'1', 'admin', 'admin', '2020-08-02 14:49:07', '2020-08-02 14:49:07');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
                             `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                             `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典名称',
                             `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
                             `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
                             `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
                             `create_time` datetime(0) DEFAULT NULL COMMENT '创建日期',
                             `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
                             PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据字典' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, 'user_status', '用户状态', NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict` VALUES (4, 'dept_status', '部门状态', NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict` VALUES (5, 'job_status', '岗位状态', NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict` VALUES (6, 'activity_status', '活动状态', 'admin', 'admin', '2024-05-16 22:15:01', '2024-05-16 22:15:01');

-- ----------------------------
-- Table structure for sys_dict_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_detail`;
CREATE TABLE `sys_dict_detail`  (
                                    `detail_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                                    `dict_id` bigint(20) DEFAULT NULL COMMENT '字典id',
                                    `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典标签',
                                    `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典值',
                                    `dict_sort` int(11) DEFAULT NULL COMMENT '排序',
                                    `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
                                    `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
                                    `create_time` datetime(0) DEFAULT NULL COMMENT '创建日期',
                                    `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
                                    PRIMARY KEY (`detail_id`) USING BTREE,
                                    INDEX `FK5tpkputc6d9nboxojdbgnpmyb`(`dict_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据字典详情' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_detail
-- ----------------------------
INSERT INTO `sys_dict_detail` VALUES (1, 1, '激活', 'true', 1, NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict_detail` VALUES (2, 1, '禁用', 'false', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_detail` VALUES (3, 4, '启用', 'true', 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_detail` VALUES (4, 4, '停用', 'false', 2, NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict_detail` VALUES (5, 5, '启用', 'true', 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_detail` VALUES (6, 5, '停用', 'false', 2, NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict_detail` VALUES (7, 6, '筹备中', '1', 1, 'admin', 'admin', '2024-05-16 22:15:41', '2024-05-16 22:15:41');
INSERT INTO `sys_dict_detail` VALUES (8, 6, '进行中', '2', 2, 'admin', 'admin', '2024-05-16 22:15:50', '2024-05-16 22:15:50');
INSERT INTO `sys_dict_detail` VALUES (9, 6, '已取消', '3', 3, 'admin', 'admin', '2024-05-16 22:16:05', '2024-05-16 22:16:05');
INSERT INTO `sys_dict_detail` VALUES (10, 6, '已完成', '4', 4, 'admin', 'admin', '2024-05-16 22:16:15', '2024-05-16 22:16:15');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
                            `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                            `name` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
                            `enabled` bit(1) NOT NULL COMMENT '岗位状态',
                            `job_sort` int(11) DEFAULT NULL COMMENT '排序',
                            `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
                            `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
                            `create_time` datetime(0) DEFAULT NULL COMMENT '创建日期',
                            `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`job_id`) USING BTREE,
                            UNIQUE INDEX `uniq_name`(`name`) USING BTREE,
                            INDEX `inx_enabled`(`enabled`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (8, '人事专员', b'1', 3, NULL, NULL, '2019-03-29 14:52:28', NULL);
INSERT INTO `sys_job` VALUES (10, '产品经理', b'1', 4, NULL, NULL, '2019-03-29 14:55:51', NULL);
INSERT INTO `sys_job` VALUES (11, '全栈开发', b'1', 2, NULL, 'admin', '2019-03-31 13:39:30', '2020-05-05 11:33:43');
INSERT INTO `sys_job` VALUES (12, '软件测试', b'1', 5, NULL, 'admin', '2019-03-31 13:39:43', '2020-05-10 19:56:26');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
                            `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                            `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                            `log_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                            `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                            `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
                            `request_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                            `time` bigint(20) DEFAULT NULL,
                            `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                            `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                            `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                            `exception_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
                            `create_time` datetime(0) DEFAULT NULL,
                            PRIMARY KEY (`log_id`) USING BTREE,
                            INDEX `log_create_time_index`(`create_time`) USING BTREE,
                            INDEX `inx_log_type`(`log_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4578 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
                             `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                             `pid` bigint(20) DEFAULT NULL COMMENT '上级菜单ID',
                             `sub_count` int(11) DEFAULT 0 COMMENT '子菜单数目',
                             `type` int(11) DEFAULT NULL COMMENT '菜单类型',
                             `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '菜单标题',
                             `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '组件名称',
                             `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '组件',
                             `menu_sort` int(11) DEFAULT NULL COMMENT '排序',
                             `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图标',
                             `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '链接地址',
                             `i_frame` bit(1) DEFAULT NULL COMMENT '是否外链',
                             `cache` bit(1) DEFAULT b'0' COMMENT '缓存',
                             `hidden` bit(1) DEFAULT b'0' COMMENT '隐藏',
                             `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '权限',
                             `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
                             `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
                             `create_time` datetime(0) DEFAULT NULL COMMENT '创建日期',
                             `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
                             PRIMARY KEY (`menu_id`) USING BTREE,
                             UNIQUE INDEX `uniq_title`(`title`) USING BTREE,
                             UNIQUE INDEX `uniq_name`(`name`) USING BTREE,
                             INDEX `inx_pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 142 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统菜单' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, NULL, 7, 0, '系统管理', NULL, NULL, 1, 'system', 'system', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-18 15:11:29', NULL);
INSERT INTO `sys_menu` VALUES (2, 1, 3, 1, '用户管理', 'User', 'system/user/index', 82, 'peoples', 'user', b'0', b'0', b'0', 'user:list', NULL, 'admin', '2018-12-18 15:14:44', '2024-05-31 10:15:00');
INSERT INTO `sys_menu` VALUES (3, 1, 3, 1, '角色管理', 'Role', 'system/role/index', 80, 'role', 'role', b'0', b'0', b'0', 'roles:list', NULL, 'admin', '2018-12-18 15:16:07', '2024-05-31 10:23:52');
INSERT INTO `sys_menu` VALUES (5, 1, 3, 1, '菜单管理', 'Menu', 'system/menu/index', 81, 'menu', 'menu', b'0', b'0', b'0', 'menu:list', NULL, 'admin', '2018-12-18 15:17:28', '2024-05-31 10:24:02');
INSERT INTO `sys_menu` VALUES (6, NULL, 5, 0, '系统监控', NULL, NULL, 10, 'monitor', 'monitor', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-18 15:17:48', NULL);
INSERT INTO `sys_menu` VALUES (7, 6, 0, 1, '操作日志', 'Log', 'monitor/log/index', 11, 'log', 'logs', b'0', b'1', b'0', NULL, NULL, 'admin', '2018-12-18 15:18:26', '2020-06-06 13:11:57');
INSERT INTO `sys_menu` VALUES (9, 6, 0, 1, 'SQL监控', 'Sql', 'monitor/sql/index', 18, 'sqlMonitor', 'druid', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-18 15:19:34', NULL);
INSERT INTO `sys_menu` VALUES (10, NULL, 5, 0, '组件管理', NULL, NULL, 50, 'zujian', 'components', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-19 13:38:16', NULL);
INSERT INTO `sys_menu` VALUES (11, 10, 0, 1, '图标库', 'Icons', 'components/icons/index', 51, 'icon', 'icon', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-19 13:38:49', NULL);
INSERT INTO `sys_menu` VALUES (14, 36, 0, 1, '邮件工具', 'Email', 'tools/email/index', 35, 'email', 'email', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-27 10:13:09', NULL);
INSERT INTO `sys_menu` VALUES (15, 10, 0, 1, '富文本', 'Editor', 'components/Editor', 52, 'fwb', 'tinymce', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-27 11:58:25', NULL);
INSERT INTO `sys_menu` VALUES (18, 36, 3, 1, '存储管理', 'Storage', 'tools/storage/index', 34, 'qiniu', 'storage', b'0', b'0', b'0', 'storage:list', NULL, NULL, '2018-12-31 11:12:15', NULL);
INSERT INTO `sys_menu` VALUES (19, 36, 0, 1, '支付宝工具', 'AliPay', 'tools/aliPay/index', 37, 'alipay', 'aliPay', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-31 14:52:38', NULL);
INSERT INTO `sys_menu` VALUES (21, NULL, 2, 0, '多级菜单', NULL, '', 900, 'menu', 'nested', b'0', b'0', b'0', NULL, NULL, 'admin', '2019-01-04 16:22:03', '2020-06-21 17:27:35');
INSERT INTO `sys_menu` VALUES (22, 21, 2, 0, '二级菜单1', NULL, '', 999, 'menu', 'menu1', b'0', b'0', b'0', NULL, NULL, 'admin', '2019-01-04 16:23:29', '2020-06-21 17:27:20');
INSERT INTO `sys_menu` VALUES (23, 21, 0, 1, '二级菜单2', NULL, 'nested/menu2/index', 999, 'menu', 'menu2', b'0', b'0', b'0', NULL, NULL, NULL, '2019-01-04 16:23:57', NULL);
INSERT INTO `sys_menu` VALUES (24, 22, 0, 1, '三级菜单1', 'Test', 'nested/menu1/menu1-1', 999, 'menu', 'menu1-1', b'0', b'0', b'0', NULL, NULL, NULL, '2019-01-04 16:24:48', NULL);
INSERT INTO `sys_menu` VALUES (27, 22, 0, 1, '三级菜单2', NULL, 'nested/menu1/menu1-2', 999, 'menu', 'menu1-2', b'0', b'0', b'0', NULL, NULL, NULL, '2019-01-07 17:27:32', NULL);
INSERT INTO `sys_menu` VALUES (28, 1, 3, 1, '任务调度', 'Timing', 'system/timing/index', 999, 'timing', 'timing', b'0', b'0', b'0', 'timing:list', NULL, NULL, '2019-01-07 20:34:40', NULL);
INSERT INTO `sys_menu` VALUES (30, 36, 0, 1, '代码生成', 'GeneratorIndex', 'generator/index', 32, 'dev', 'generator', b'0', b'1', b'0', NULL, NULL, NULL, '2019-01-11 15:45:55', NULL);
INSERT INTO `sys_menu` VALUES (32, 6, 0, 1, '异常日志', 'ErrorLog', 'monitor/log/errorLog', 12, 'error', 'errorLog', b'0', b'0', b'0', NULL, NULL, NULL, '2019-01-13 13:49:03', NULL);
INSERT INTO `sys_menu` VALUES (33, 10, 0, 1, 'Markdown', 'Markdown', 'components/MarkDown', 53, 'markdown', 'markdown', b'0', b'0', b'0', NULL, NULL, NULL, '2019-03-08 13:46:44', NULL);
INSERT INTO `sys_menu` VALUES (34, 10, 0, 1, 'Yaml编辑器', 'YamlEdit', 'components/YamlEdit', 54, 'dev', 'yaml', b'0', b'0', b'0', NULL, NULL, NULL, '2019-03-08 15:49:40', NULL);
INSERT INTO `sys_menu` VALUES (35, 1, 3, 1, '部门管理', 'Dept', 'system/dept/index', 83, 'dept', 'dept', b'0', b'0', b'0', 'dept:list', NULL, 'admin', '2019-03-25 09:46:00', '2024-05-31 10:24:24');
INSERT INTO `sys_menu` VALUES (36, NULL, 7, 0, '系统工具', NULL, '', 30, 'sys-tools', 'sys-tools', b'0', b'0', b'0', NULL, NULL, NULL, '2019-03-29 10:57:35', NULL);
INSERT INTO `sys_menu` VALUES (37, 1, 3, 1, '岗位管理', 'Job', 'system/job/index', 84, 'Steve-Jobs', 'job', b'0', b'0', b'0', 'job:list', NULL, 'admin', '2019-03-29 13:51:18', '2024-05-31 10:25:08');
INSERT INTO `sys_menu` VALUES (38, 36, 0, 1, '接口文档', 'Swagger', 'tools/swagger/index', 36, 'swagger', 'swagger2', b'0', b'0', b'0', NULL, NULL, NULL, '2019-03-29 19:57:53', NULL);
INSERT INTO `sys_menu` VALUES (39, 1, 3, 1, '字典管理', 'Dict', 'system/dict/index', 85, 'dictionary', 'dict', b'0', b'0', b'0', 'dict:list', NULL, 'admin', '2019-04-10 11:49:04', '2024-05-31 10:25:16');
INSERT INTO `sys_menu` VALUES (41, 6, 0, 1, '在线用户', 'OnlineUser', 'monitor/online/index', 10, 'Steve-Jobs', 'online', b'0', b'0', b'0', NULL, NULL, NULL, '2019-10-26 22:08:43', NULL);
INSERT INTO `sys_menu` VALUES (44, 2, 0, 2, '用户新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'user:add', NULL, NULL, '2019-10-29 10:59:46', NULL);
INSERT INTO `sys_menu` VALUES (45, 2, 0, 2, '用户编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'user:edit', NULL, NULL, '2019-10-29 11:00:08', NULL);
INSERT INTO `sys_menu` VALUES (46, 2, 0, 2, '用户删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'user:del', NULL, NULL, '2019-10-29 11:00:23', NULL);
INSERT INTO `sys_menu` VALUES (48, 3, 0, 2, '角色创建', NULL, '', 2, '', '', b'0', b'0', b'0', 'roles:add', NULL, NULL, '2019-10-29 12:45:34', NULL);
INSERT INTO `sys_menu` VALUES (49, 3, 0, 2, '角色修改', NULL, '', 3, '', '', b'0', b'0', b'0', 'roles:edit', NULL, NULL, '2019-10-29 12:46:16', NULL);
INSERT INTO `sys_menu` VALUES (50, 3, 0, 2, '角色删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'roles:del', NULL, NULL, '2019-10-29 12:46:51', NULL);
INSERT INTO `sys_menu` VALUES (52, 5, 0, 2, '菜单新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'menu:add', NULL, NULL, '2019-10-29 12:55:07', NULL);
INSERT INTO `sys_menu` VALUES (53, 5, 0, 2, '菜单编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'menu:edit', NULL, NULL, '2019-10-29 12:55:40', NULL);
INSERT INTO `sys_menu` VALUES (54, 5, 0, 2, '菜单删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'menu:del', NULL, NULL, '2019-10-29 12:56:00', NULL);
INSERT INTO `sys_menu` VALUES (56, 35, 0, 2, '部门新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'dept:add', NULL, NULL, '2019-10-29 12:57:09', NULL);
INSERT INTO `sys_menu` VALUES (57, 35, 0, 2, '部门编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'dept:edit', NULL, NULL, '2019-10-29 12:57:27', NULL);
INSERT INTO `sys_menu` VALUES (58, 35, 0, 2, '部门删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'dept:del', NULL, NULL, '2019-10-29 12:57:41', NULL);
INSERT INTO `sys_menu` VALUES (60, 37, 0, 2, '岗位新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'job:add', NULL, NULL, '2019-10-29 12:58:27', NULL);
INSERT INTO `sys_menu` VALUES (61, 37, 0, 2, '岗位编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'job:edit', NULL, NULL, '2019-10-29 12:58:45', NULL);
INSERT INTO `sys_menu` VALUES (62, 37, 0, 2, '岗位删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'job:del', NULL, NULL, '2019-10-29 12:59:04', NULL);
INSERT INTO `sys_menu` VALUES (64, 39, 0, 2, '字典新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'dict:add', NULL, NULL, '2019-10-29 13:00:17', NULL);
INSERT INTO `sys_menu` VALUES (65, 39, 0, 2, '字典编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'dict:edit', NULL, NULL, '2019-10-29 13:00:42', NULL);
INSERT INTO `sys_menu` VALUES (66, 39, 0, 2, '字典删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'dict:del', NULL, NULL, '2019-10-29 13:00:59', NULL);
INSERT INTO `sys_menu` VALUES (73, 28, 0, 2, '任务新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'timing:add', NULL, NULL, '2019-10-29 13:07:28', NULL);
INSERT INTO `sys_menu` VALUES (74, 28, 0, 2, '任务编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'timing:edit', NULL, NULL, '2019-10-29 13:07:41', NULL);
INSERT INTO `sys_menu` VALUES (75, 28, 0, 2, '任务删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'timing:del', NULL, NULL, '2019-10-29 13:07:54', NULL);
INSERT INTO `sys_menu` VALUES (77, 18, 0, 2, '上传文件', NULL, '', 2, '', '', b'0', b'0', b'0', 'storage:add', NULL, NULL, '2019-10-29 13:09:09', NULL);
INSERT INTO `sys_menu` VALUES (78, 18, 0, 2, '文件编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'storage:edit', NULL, NULL, '2019-10-29 13:09:22', NULL);
INSERT INTO `sys_menu` VALUES (79, 18, 0, 2, '文件删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'storage:del', NULL, NULL, '2019-10-29 13:09:34', NULL);
INSERT INTO `sys_menu` VALUES (80, 6, 0, 1, '服务监控', 'ServerMonitor', 'monitor/server/index', 14, 'codeConsole', 'server', b'0', b'0', b'0', 'monitor:list', NULL, 'admin', '2019-11-07 13:06:39', '2020-05-04 18:20:50');
INSERT INTO `sys_menu` VALUES (82, 36, 0, 1, '生成配置', 'GeneratorConfig', 'generator/config', 33, 'dev', 'generator/config/:tableName', b'0', b'1', b'1', '', NULL, NULL, '2019-11-17 20:08:56', NULL);
INSERT INTO `sys_menu` VALUES (83, 10, 0, 1, '图表库', 'Echarts', 'components/Echarts', 50, 'chart', 'echarts', b'0', b'1', b'0', '', NULL, NULL, '2019-11-21 09:04:32', NULL);
INSERT INTO `sys_menu` VALUES (90, NULL, 5, 1, '运维管理', 'Mnt', '', 20, 'mnt', 'mnt', b'0', b'0', b'0', NULL, NULL, NULL, '2019-11-09 10:31:08', NULL);
INSERT INTO `sys_menu` VALUES (92, 90, 3, 1, '服务器', 'ServerDeploy', 'mnt/server/index', 22, 'server', 'mnt/serverDeploy', b'0', b'0', b'0', 'serverDeploy:list', NULL, NULL, '2019-11-10 10:29:25', NULL);
INSERT INTO `sys_menu` VALUES (93, 90, 3, 1, '应用管理', 'App', 'mnt/app/index', 23, 'app', 'mnt/app', b'0', b'0', b'0', 'app:list', NULL, NULL, '2019-11-10 11:05:16', NULL);
INSERT INTO `sys_menu` VALUES (94, 90, 3, 1, '部署管理', 'Deploy', 'mnt/deploy/index', 24, 'deploy', 'mnt/deploy', b'0', b'0', b'0', 'deploy:list', NULL, NULL, '2019-11-10 15:56:55', NULL);
INSERT INTO `sys_menu` VALUES (97, 90, 1, 1, '部署备份', 'DeployHistory', 'mnt/deployHistory/index', 25, 'backup', 'mnt/deployHistory', b'0', b'0', b'0', 'deployHistory:list', NULL, NULL, '2019-11-10 16:49:44', NULL);
INSERT INTO `sys_menu` VALUES (98, 90, 3, 1, '数据库管理', 'Database', 'mnt/database/index', 26, 'database', 'mnt/database', b'0', b'0', b'0', 'database:list', NULL, NULL, '2019-11-10 20:40:04', NULL);
INSERT INTO `sys_menu` VALUES (102, 97, 0, 2, '删除', NULL, '', 999, '', '', b'0', b'0', b'0', 'deployHistory:del', NULL, NULL, '2019-11-17 09:32:48', NULL);
INSERT INTO `sys_menu` VALUES (103, 92, 0, 2, '服务器新增', NULL, '', 999, '', '', b'0', b'0', b'0', 'serverDeploy:add', NULL, NULL, '2019-11-17 11:08:33', NULL);
INSERT INTO `sys_menu` VALUES (104, 92, 0, 2, '服务器编辑', NULL, '', 999, '', '', b'0', b'0', b'0', 'serverDeploy:edit', NULL, NULL, '2019-11-17 11:08:57', NULL);
INSERT INTO `sys_menu` VALUES (105, 92, 0, 2, '服务器删除', NULL, '', 999, '', '', b'0', b'0', b'0', 'serverDeploy:del', NULL, NULL, '2019-11-17 11:09:15', NULL);
INSERT INTO `sys_menu` VALUES (106, 93, 0, 2, '应用新增', NULL, '', 999, '', '', b'0', b'0', b'0', 'app:add', NULL, NULL, '2019-11-17 11:10:03', NULL);
INSERT INTO `sys_menu` VALUES (107, 93, 0, 2, '应用编辑', NULL, '', 999, '', '', b'0', b'0', b'0', 'app:edit', NULL, NULL, '2019-11-17 11:10:28', NULL);
INSERT INTO `sys_menu` VALUES (108, 93, 0, 2, '应用删除', NULL, '', 999, '', '', b'0', b'0', b'0', 'app:del', NULL, NULL, '2019-11-17 11:10:55', NULL);
INSERT INTO `sys_menu` VALUES (109, 94, 0, 2, '部署新增', NULL, '', 999, '', '', b'0', b'0', b'0', 'deploy:add', NULL, NULL, '2019-11-17 11:11:22', NULL);
INSERT INTO `sys_menu` VALUES (110, 94, 0, 2, '部署编辑', NULL, '', 999, '', '', b'0', b'0', b'0', 'deploy:edit', NULL, NULL, '2019-11-17 11:11:41', NULL);
INSERT INTO `sys_menu` VALUES (111, 94, 0, 2, '部署删除', NULL, '', 999, '', '', b'0', b'0', b'0', 'deploy:del', NULL, NULL, '2019-11-17 11:12:01', NULL);
INSERT INTO `sys_menu` VALUES (112, 98, 0, 2, '数据库新增', NULL, '', 999, '', '', b'0', b'0', b'0', 'database:add', NULL, NULL, '2019-11-17 11:12:43', NULL);
INSERT INTO `sys_menu` VALUES (113, 98, 0, 2, '数据库编辑', NULL, '', 999, '', '', b'0', b'0', b'0', 'database:edit', NULL, NULL, '2019-11-17 11:12:58', NULL);
INSERT INTO `sys_menu` VALUES (114, 98, 0, 2, '数据库删除', NULL, '', 999, '', '', b'0', b'0', b'0', 'database:del', NULL, NULL, '2019-11-17 11:13:14', NULL);
INSERT INTO `sys_menu` VALUES (116, 36, 0, 1, '生成预览', 'Preview', 'generator/preview', 999, 'java', 'generator/preview/:tableName', b'0', b'1', b'1', NULL, NULL, NULL, '2019-11-26 14:54:36', NULL);
INSERT INTO `sys_menu` VALUES (121, NULL, 5, 0, '活动管理', NULL, NULL, 1, 'education', 'activity', b'0', b'0', b'0', NULL, 'admin', 'admin', '2018-12-18 15:11:29', '2020-06-21 17:27:35');
INSERT INTO `sys_menu` VALUES (122, 121, 10, 1, '活动列表', NULL, 'system/activity/index', 1, 'error', 'avtivity', b'0', b'0', b'0', NULL, 'admin', 'admin', '2018-12-18 15:11:29', '2020-06-21 17:27:35');
INSERT INTO `sys_menu` VALUES (124, NULL, 1, 0, '资源管理', NULL, NULL, 999, 'app', 'resource', b'0', b'0', b'0', NULL, 'admin', 'admin', '2018-12-18 15:11:29', '2020-06-21 17:27:35');
INSERT INTO `sys_menu` VALUES (125, 124, 1, 1, '资源列表', NULL, 'system/resourceRequirements/index', 999, 'sqlMonitor', 'index', b'0', b'0', b'0', NULL, 'admin', 'admin', '2018-12-18 15:11:29', '2020-06-21 17:27:35');
INSERT INTO `sys_menu` VALUES (126, NULL, 1, 0, '活动反馈', NULL, NULL, 999, 'chain', 'feedback', b'0', b'0', b'1', NULL, 'admin', 'admin', '2018-12-18 15:11:29', '2020-06-21 17:27:35');
INSERT INTO `sys_menu` VALUES (127, 126, 1, 1, '反馈列表', 'index', 'system/activityFeedback/index', 999, 'exit-fullscreen', '/index', b'0', b'0', b'0', NULL, 'admin', 'admin', '2018-12-18 15:11:29', '2020-06-21 17:27:35');
INSERT INTO `sys_menu` VALUES (128, NULL, 2, 0, '通知管理', NULL, NULL, 999, 'gonggao', 'message', b'0', b'0', b'0', NULL, 'admin', 'admin', '2018-12-18 15:11:29', '2020-06-21 17:27:35');
INSERT INTO `sys_menu` VALUES (129, 128, 1, 1, '通知列表', 'list', 'system/message/index', 999, 'list', 'list', b'0', b'0', b'0', NULL, 'admin', 'admin', '2018-12-18 15:11:29', '2020-06-21 17:27:35');
INSERT INTO `sys_menu` VALUES (130, 128, 1, 1, '通知模板', 'messageTemplate', 'system/messageTemplate/index', 999, 'deploy', 'messageTemplate', b'0', b'0', b'0', NULL, 'admin', 'admin', '2018-12-18 15:11:29', '2020-06-21 17:27:35');
INSERT INTO `sys_menu` VALUES (131, NULL, 3, 0, '交流中心', NULL, NULL, 999, 'develop', 'discuss', b'0', b'0', b'1', NULL, 'admin', 'admin', '2024-06-18 19:32:26', '2024-06-18 19:32:26');
INSERT INTO `sys_menu` VALUES (132, 131, 0, 1, '交流列表', 'discuss', 'system/discuss/index', 999, NULL, 'discuss', b'0', b'0', b'0', NULL, 'admin', 'admin', '2024-06-18 19:33:10', '2024-06-18 19:33:10');
INSERT INTO `sys_menu` VALUES (133, 131, 0, 1, '我的发布', 'my', 'system/discuss/my', 999, 'fwb', 'my', b'0', b'0', b'0', NULL, 'admin', 'admin', '2024-06-18 19:41:01', '2024-06-18 19:41:01');
INSERT INTO `sys_menu` VALUES (134, 131, 0, 1, '交流详情', 'reply', 'system/reply/index', 999, 'list', 'reply', b'0', b'0', b'0', NULL, 'admin', 'admin', '2024-06-18 19:41:45', '2024-06-18 19:41:45');
INSERT INTO `sys_menu` VALUES (135, NULL, 2, 0, '费用管理', NULL, NULL, 999, 'icon', 'cost', b'0', b'0', b'1', NULL, 'admin', 'admin', '2024-06-18 19:43:12', '2024-06-18 19:43:12');
INSERT INTO `sys_menu` VALUES (136, 135, 0, 1, '费用审核', 'activityCost', 'system/activityCost/index', 999, NULL, 'activityCost', b'0', b'0', b'0', NULL, 'admin', 'admin', '2024-06-18 19:43:52', '2024-06-18 19:43:52');
INSERT INTO `sys_menu` VALUES (137, 135, 0, 1, '费用申报', 'myCost', 'system/activityCost/my', 999, 'money', 'myCost', b'0', b'0', b'0', NULL, 'admin', 'admin', '2024-06-18 19:43:52', '2024-06-18 19:43:52');
INSERT INTO `sys_menu` VALUES (138, 121, 0, 1, '我创建的活动', 'create', 'system/activity/create', 3, 'monitor', 'create', b'0', b'0', b'0', NULL, 'admin', 'admin', '2024-06-19 06:24:36', '2024-06-19 06:24:36');
INSERT INTO `sys_menu` VALUES (139, 121, 0, 1, '我加入的活动', 'myactivity', 'system/activity/my', 2, 'tab', 'myactivity', b'0', b'0', b'0', NULL, 'admin', 'admin', '2024-06-19 06:26:12', '2024-06-19 06:26:12');
INSERT INTO `sys_menu` VALUES (140, 121, 0, 1, '活动详情', 'activityDetail', 'system/activityDetail/index', 999, 'education', 'activityDetail', b'0', b'0', b'1', NULL, 'admin', 'admin', '2024-06-19 06:59:43', '2024-06-19 06:59:43');
INSERT INTO `sys_menu` VALUES (141, 121, 0, 1, '活动日程', 'activitySchedule', 'system/activitySchedule/index', 999, 'dictionary', 'activitySchedule', b'0', b'0', b'1', NULL, 'admin', 'admin', '2024-06-19 07:33:57', '2024-06-19 07:33:57');

-- ----------------------------
-- Table structure for sys_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_quartz_job`;
CREATE TABLE `sys_quartz_job`  (
                                   `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                                   `bean_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Spring Bean名称',
                                   `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'cron 表达式',
                                   `is_pause` bit(1) DEFAULT NULL COMMENT '状态：1暂停、0启用',
                                   `job_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务名称',
                                   `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '方法名称',
                                   `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '参数',
                                   `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
                                   `person_in_charge` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '负责人',
                                   `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '报警邮箱',
                                   `sub_task` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '子任务ID',
                                   `pause_after_failure` bit(1) DEFAULT NULL COMMENT '任务失败后是否暂停',
                                   `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
                                   `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
                                   `create_time` datetime(0) DEFAULT NULL COMMENT '创建日期',
                                   `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
                                   PRIMARY KEY (`job_id`) USING BTREE,
                                   INDEX `inx_is_pause`(`is_pause`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_quartz_job
-- ----------------------------
INSERT INTO `sys_quartz_job` VALUES (2, 'testTask', '0/5 * * * * ?', b'1', '测试1', 'run1', 'test', '带参测试，多参使用json', '测试', NULL, NULL, NULL, NULL, 'admin', '2019-08-22 14:08:29', '2020-05-24 13:58:33');
INSERT INTO `sys_quartz_job` VALUES (3, 'testTask', '0/5 * * * * ?', b'1', '测试', 'run', '', '不带参测试', 'Zheng Jie', '', '5,6', b'1', NULL, 'admin', '2019-09-26 16:44:39', '2020-05-24 14:48:12');
INSERT INTO `sys_quartz_job` VALUES (5, 'Test', '0/5 * * * * ?', b'1', '任务告警测试', 'run', NULL, '测试', 'test', '', NULL, b'1', 'admin', 'admin', '2020-05-05 20:32:41', '2020-05-05 20:36:13');
INSERT INTO `sys_quartz_job` VALUES (6, 'testTask', '0/5 * * * * ?', b'1', '测试3', 'run2', NULL, '测试3', 'Zheng Jie', '', NULL, b'1', 'admin', 'admin', '2020-05-05 20:35:41', '2020-05-05 20:36:07');

-- ----------------------------
-- Table structure for sys_quartz_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_quartz_log`;
CREATE TABLE `sys_quartz_log`  (
                                   `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                                   `bean_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                   `create_time` datetime(0) DEFAULT NULL,
                                   `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                   `exception_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
                                   `is_success` bit(1) DEFAULT NULL,
                                   `job_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                   `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                   `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                   `time` bigint(20) DEFAULT NULL,
                                   PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 152 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_quartz_log
-- ----------------------------
INSERT INTO `sys_quartz_log` VALUES (151, 'testTask', '2024-05-30 14:54:48', '0/5 * * * * ?', NULL, b'1', '测试3', 'run2', NULL, 2);
INSERT INTO `sys_quartz_log` VALUES (152, 'testTask', '2024-05-30 14:54:52', '0/5 * * * * ?', NULL, b'1', '测试3', 'run2', NULL, 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
                             `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                             `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
                             `level` int(11) DEFAULT NULL COMMENT '角色级别',
                             `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
                             `data_scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '数据权限',
                             `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
                             `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
                             `create_time` datetime(0) DEFAULT NULL COMMENT '创建日期',
                             `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
                             PRIMARY KEY (`role_id`) USING BTREE,
                             UNIQUE INDEX `uniq_name`(`name`) USING BTREE,
                             INDEX `role_name_index`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 1, '-', '全部', NULL, 'admin', '2018-11-23 11:04:37', '2024-05-24 02:19:56');
INSERT INTO `sys_role` VALUES (2, '普通用户', 2, '-', '本级', NULL, 'admin', '2018-11-23 13:09:06', '2024-05-16 22:48:02');

-- ----------------------------
-- Table structure for sys_roles_depts
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_depts`;
CREATE TABLE `sys_roles_depts`  (
                                    `role_id` bigint(20) NOT NULL,
                                    `dept_id` bigint(20) NOT NULL,
                                    PRIMARY KEY (`role_id`, `dept_id`) USING BTREE,
                                    INDEX `FK7qg6itn5ajdoa9h9o78v9ksur`(`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色部门关联' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_menus`;
CREATE TABLE `sys_roles_menus`  (
                                    `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
                                    `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                    PRIMARY KEY (`menu_id`, `role_id`) USING BTREE,
                                    INDEX `FKcngg2qadojhi3a651a5adkvbq`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色菜单关联' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_roles_menus
-- ----------------------------
INSERT INTO `sys_roles_menus` VALUES (1, 1);
INSERT INTO `sys_roles_menus` VALUES (2, 1);
INSERT INTO `sys_roles_menus` VALUES (3, 1);
INSERT INTO `sys_roles_menus` VALUES (5, 1);
INSERT INTO `sys_roles_menus` VALUES (39, 1);
INSERT INTO `sys_roles_menus` VALUES (44, 1);
INSERT INTO `sys_roles_menus` VALUES (45, 1);
INSERT INTO `sys_roles_menus` VALUES (46, 1);
INSERT INTO `sys_roles_menus` VALUES (48, 1);
INSERT INTO `sys_roles_menus` VALUES (49, 1);
INSERT INTO `sys_roles_menus` VALUES (50, 1);
INSERT INTO `sys_roles_menus` VALUES (52, 1);
INSERT INTO `sys_roles_menus` VALUES (53, 1);
INSERT INTO `sys_roles_menus` VALUES (54, 1);
INSERT INTO `sys_roles_menus` VALUES (64, 1);
INSERT INTO `sys_roles_menus` VALUES (65, 1);
INSERT INTO `sys_roles_menus` VALUES (66, 1);
INSERT INTO `sys_roles_menus` VALUES (121, 1);
INSERT INTO `sys_roles_menus` VALUES (122, 1);
INSERT INTO `sys_roles_menus` VALUES (124, 1);
INSERT INTO `sys_roles_menus` VALUES (125, 1);
INSERT INTO `sys_roles_menus` VALUES (126, 1);
INSERT INTO `sys_roles_menus` VALUES (127, 1);
INSERT INTO `sys_roles_menus` VALUES (128, 1);
INSERT INTO `sys_roles_menus` VALUES (129, 1);
INSERT INTO `sys_roles_menus` VALUES (130, 1);
INSERT INTO `sys_roles_menus` VALUES (131, 1);
INSERT INTO `sys_roles_menus` VALUES (132, 1);
INSERT INTO `sys_roles_menus` VALUES (133, 1);
INSERT INTO `sys_roles_menus` VALUES (134, 1);
INSERT INTO `sys_roles_menus` VALUES (135, 1);
INSERT INTO `sys_roles_menus` VALUES (136, 1);
INSERT INTO `sys_roles_menus` VALUES (138, 1);
INSERT INTO `sys_roles_menus` VALUES (139, 1);
INSERT INTO `sys_roles_menus` VALUES (140, 1);
INSERT INTO `sys_roles_menus` VALUES (141, 1);
INSERT INTO `sys_roles_menus` VALUES (121, 2);
INSERT INTO `sys_roles_menus` VALUES (122, 2);
INSERT INTO `sys_roles_menus` VALUES (126, 2);
INSERT INTO `sys_roles_menus` VALUES (127, 2);
INSERT INTO `sys_roles_menus` VALUES (128, 2);
INSERT INTO `sys_roles_menus` VALUES (129, 2);
INSERT INTO `sys_roles_menus` VALUES (130, 2);
INSERT INTO `sys_roles_menus` VALUES (131, 2);
INSERT INTO `sys_roles_menus` VALUES (132, 2);
INSERT INTO `sys_roles_menus` VALUES (133, 2);
INSERT INTO `sys_roles_menus` VALUES (134, 2);
INSERT INTO `sys_roles_menus` VALUES (135, 2);
INSERT INTO `sys_roles_menus` VALUES (136, 2);
INSERT INTO `sys_roles_menus` VALUES (137, 2);
INSERT INTO `sys_roles_menus` VALUES (138, 2);
INSERT INTO `sys_roles_menus` VALUES (139, 2);
INSERT INTO `sys_roles_menus` VALUES (140, 2);
INSERT INTO `sys_roles_menus` VALUES (141, 2);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
                             `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                             `dept_id` bigint(20) DEFAULT NULL COMMENT '部门名称',
                             `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户名',
                             `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '昵称',
                             `gender` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '性别',
                             `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '手机号码',
                             `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮箱',
                             `avatar_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '头像地址',
                             `avatar_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '头像真实路径',
                             `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '密码',
                             `is_admin` bit(1) DEFAULT b'0' COMMENT '是否为admin账号',
                             `enabled` bit(1) DEFAULT NULL COMMENT '状态：1启用、0禁用',
                             `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
                             `added_activity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '加入的活动',
                             `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
                             `pwd_reset_time` datetime(0) DEFAULT NULL COMMENT '修改密码的时间',
                             `create_time` datetime(0) DEFAULT NULL COMMENT '创建日期',
                             `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
                             `message_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '通知方式',
                             PRIMARY KEY (`user_id`) USING BTREE,
                             UNIQUE INDEX `UK_kpubos9gc2cvtkb0thktkbkes`(`email`) USING BTREE,
                             UNIQUE INDEX `username`(`username`) USING BTREE,
                             UNIQUE INDEX `uniq_username`(`username`) USING BTREE,
                             UNIQUE INDEX `uniq_email`(`email`) USING BTREE,
                             INDEX `FK5rwmryny6jthaaxkogownknqp`(`dept_id`) USING BTREE,
                             INDEX `inx_enabled`(`enabled`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 2, 'admin', '管理员', '男', '18888888888', '201507802@qq.com', 'avatar-20200806032259161.png', '/Users/jie/Documents/work/me/admin/eladmin/~/avatar/avatar-20200806032259161.png', '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'1', b'1', NULL, NULL, 'admin', '2020-05-03 16:38:31', '2018-08-23 09:11:56', '2020-09-05 10:43:31', '站内消息');
INSERT INTO `sys_user` VALUES (2, 2, 'test', '测试', '男', '19999999999', '231@qq.com', NULL, NULL, '$2a$10$4XcyudOYTSz6fue6KFNMHeUQnCX5jbBQypLEnGk1PmekXt5c95JcK', b'0', b'1', 'admin', NULL, 'admin', NULL, '2020-05-05 11:15:49', '2024-05-16 20:49:04', '站内消息');
INSERT INTO `sys_user` VALUES (4, 7, '123', '123', '男', '14444444444', '123@qq.com', NULL, NULL, '$2a$10$cLP9LylFY.1y.FebK1834uqWxE0468A7e/V1B8sUQy1Oxrpbhi4Qu', b'0', b'1', 'admin', NULL, 'admin', NULL, '2024-06-18 11:06:56', '2024-06-18 11:06:56', '站内消息');
INSERT INTO `sys_user` VALUES (5, 7, '123487', NULL, '', '1888888888', '1233312@qq.com', NULL, NULL, '$2a$10$Uyyq0cW69XMLwb.yGbeMTeF4OMD6S6Pw/O.nah9ehmluB.JJjJKUe', b'0', b'1', 'System', NULL, 'System', NULL, '2024-06-18 11:30:52', '2024-06-18 11:53:46', '站内消息');
INSERT INTO `sys_user` VALUES (6, 7, '666666', NULL, '', '6666666666', '666666@qq.com', NULL, NULL, '$2a$10$boStdghtoI.nAaLuj9Pcsuj3GjL6BoQ37nnsEKd9pDAVVAxKZqLIS', b'0', b'1', 'System', NULL, 'System', NULL, '2024-06-19 08:35:11', '2024-06-19 08:35:11', '站内消息');
INSERT INTO `sys_user` VALUES (7, 7, '444444', NULL, '', '18888888887', '10411250@qq.com', NULL, NULL, '$2a$10$Oa1vfD0Q52rl7JLzdURA8.sPrwMeou8qeev7A9ieIOYdEQGLdqoKK', b'0', b'1', 'System', NULL, 'System', NULL, '2024-06-19 13:12:48', '2024-06-19 13:12:48', '站内消息');

-- ----------------------------
-- Table structure for sys_users_jobs
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_jobs`;
CREATE TABLE `sys_users_jobs`  (
                                   `user_id` bigint(20) NOT NULL COMMENT '用户ID',
                                   `job_id` bigint(20) NOT NULL COMMENT '岗位ID',
                                   PRIMARY KEY (`user_id`, `job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_users_jobs
-- ----------------------------
INSERT INTO `sys_users_jobs` VALUES (1, 11);
INSERT INTO `sys_users_jobs` VALUES (2, 12);
INSERT INTO `sys_users_jobs` VALUES (3, 11);
INSERT INTO `sys_users_jobs` VALUES (4, 11);
INSERT INTO `sys_users_jobs` VALUES (5, 11);
INSERT INTO `sys_users_jobs` VALUES (6, 11);
INSERT INTO `sys_users_jobs` VALUES (7, 11);

-- ----------------------------
-- Table structure for sys_users_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_roles`;
CREATE TABLE `sys_users_roles`  (
                                    `user_id` bigint(20) NOT NULL COMMENT '用户ID',
                                    `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                    PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
                                    INDEX `FKq4eq273l04bpu4efj0jd0jb98`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户角色关联' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_users_roles
-- ----------------------------
INSERT INTO `sys_users_roles` VALUES (1, 1);
INSERT INTO `sys_users_roles` VALUES (2, 2);
INSERT INTO `sys_users_roles` VALUES (3, 2);
INSERT INTO `sys_users_roles` VALUES (4, 2);
INSERT INTO `sys_users_roles` VALUES (5, 2);
INSERT INTO `sys_users_roles` VALUES (6, 2);
INSERT INTO `sys_users_roles` VALUES (7, 2);

-- ----------------------------
-- Table structure for tool_alipay_config
-- ----------------------------
DROP TABLE IF EXISTS `tool_alipay_config`;
CREATE TABLE `tool_alipay_config`  (
                                       `config_id` bigint(20) NOT NULL COMMENT 'ID',
                                       `app_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '应用ID',
                                       `charset` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '编码',
                                       `format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '类型 固定格式json',
                                       `gateway_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '网关地址',
                                       `notify_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '异步回调',
                                       `private_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '私钥',
                                       `public_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '公钥',
                                       `return_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '回调地址',
                                       `sign_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '签名方式',
                                       `sys_service_provider_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商户号',
                                       PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '支付宝配置类' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tool_alipay_config
-- ----------------------------
INSERT INTO `tool_alipay_config` VALUES (1, '2016091700532697', 'utf-8', 'JSON', 'https://openapi.alipaydev.com/gateway.do', 'http://api.auauz.net/api/aliPay/notify', 'MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC5js8sInU10AJ0cAQ8UMMyXrQ+oHZEkVt5lBwsStmTJ7YikVYgbskx1YYEXTojRsWCb+SH/kDmDU4pK/u91SJ4KFCRMF2411piYuXU/jF96zKrADznYh/zAraqT6hvAIVtQAlMHN53nx16rLzZ/8jDEkaSwT7+HvHiS+7sxSojnu/3oV7BtgISoUNstmSe8WpWHOaWv19xyS+Mce9MY4BfseFhzTICUymUQdd/8hXA28/H6osUfAgsnxAKv7Wil3aJSgaJczWuflYOve0dJ3InZkhw5Cvr0atwpk8YKBQjy5CdkoHqvkOcIB+cYHXJKzOE5tqU7inSwVbHzOLQ3XbnAgMBAAECggEAVJp5eT0Ixg1eYSqFs9568WdetUNCSUchNxDBu6wxAbhUgfRUGZuJnnAll63OCTGGck+EGkFh48JjRcBpGoeoHLL88QXlZZbC/iLrea6gcDIhuvfzzOffe1RcZtDFEj9hlotg8dQj1tS0gy9pN9g4+EBH7zeu+fyv+qb2e/v1l6FkISXUjpkD7RLQr3ykjiiEw9BpeKb7j5s7Kdx1NNIzhkcQKNqlk8JrTGDNInbDM6inZfwwIO2R1DHinwdfKWkvOTODTYa2MoAvVMFT9Bec9FbLpoWp7ogv1JMV9svgrcF9XLzANZ/OQvkbe9TV9GWYvIbxN6qwQioKCWO4GPnCAQKBgQDgW5MgfhX8yjXqoaUy/d1VjI8dHeIyw8d+OBAYwaxRSlCfyQ+tieWcR2HdTzPca0T0GkWcKZm0ei5xRURgxt4DUDLXNh26HG0qObbtLJdu/AuBUuCqgOiLqJ2f1uIbrz6OZUHns+bT/jGW2Ws8+C13zTCZkZt9CaQsrp3QOGDx5wKBgQDTul39hp3ZPwGNFeZdkGoUoViOSd5Lhowd5wYMGAEXWRLlU8z+smT5v0POz9JnIbCRchIY2FAPKRdVTICzmPk2EPJFxYTcwaNbVqL6lN7J2IlXXMiit5QbiLauo55w7plwV6LQmKm9KV7JsZs5XwqF7CEovI7GevFzyD3w+uizAQKBgC3LY1eRhOlpWOIAhpjG6qOoohmeXOphvdmMlfSHq6WYFqbWwmV4rS5d/6LNpNdL6fItXqIGd8I34jzql49taCmi+A2nlR/E559j0mvM20gjGDIYeZUz5MOE8k+K6/IcrhcgofgqZ2ZED1ksHdB/E8DNWCswZl16V1FrfvjeWSNnAoGAMrBplCrIW5xz+J0Hm9rZKrs+AkK5D4fUv8vxbK/KgxZ2KaUYbNm0xv39c+PZUYuFRCz1HDGdaSPDTE6WeWjkMQd5mS6ikl9hhpqFRkyh0d0fdGToO9yLftQKOGE/q3XUEktI1XvXF0xyPwNgUCnq0QkpHyGVZPtGFxwXiDvpvgECgYA5PoB+nY8iDiRaJNko9w0hL4AeKogwf+4TbCw+KWVEn6jhuJa4LFTdSqp89PktQaoVpwv92el/AhYjWOl/jVCm122f9b7GyoelbjMNolToDwe5pF5RnSpEuDdLy9MfE8LnE3PlbE7E5BipQ3UjSebkgNboLHH/lNZA5qvEtvbfvQ==', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAut9evKRuHJ/2QNfDlLwvN/S8l9hRAgPbb0u61bm4AtzaTGsLeMtScetxTWJnVvAVpMS9luhEJjt+Sbk5TNLArsgzzwARgaTKOLMT1TvWAK5EbHyI+eSrc3s7Awe1VYGwcubRFWDm16eQLv0k7iqiw+4mweHSz/wWyvBJVgwLoQ02btVtAQErCfSJCOmt0Q/oJQjj08YNRV4EKzB19+f5A+HQVAKy72dSybTzAK+3FPtTtNen/+b5wGeat7c32dhYHnGorPkPeXLtsqqUTp1su5fMfd4lElNdZaoCI7osZxWWUo17vBCZnyeXc9fk0qwD9mK6yRAxNbrY72Xx5VqIqwIDAQAB', 'http://api.auauz.net/api/aliPay/return', 'RSA2', '2088102176044281');

-- ----------------------------
-- Table structure for tool_email_config
-- ----------------------------
DROP TABLE IF EXISTS `tool_email_config`;
CREATE TABLE `tool_email_config`  (
                                      `config_id` bigint(20) NOT NULL COMMENT 'ID',
                                      `from_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '收件人',
                                      `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮件服务器SMTP地址',
                                      `pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '密码',
                                      `port` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '端口',
                                      `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '发件者用户名',
                                      PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '邮箱配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tool_email_config
-- ----------------------------
INSERT INTO `tool_email_config` VALUES (1, '2970617302@qq.com', 'smtp.qq.com', 'B766303C342A65BAC799760CAAEEDFFC5A26EE9F26A21A8D', '465', 'admin');

-- ----------------------------
-- Table structure for tool_local_storage
-- ----------------------------
DROP TABLE IF EXISTS `tool_local_storage`;
CREATE TABLE `tool_local_storage`  (
                                       `storage_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                                       `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件真实的名称',
                                       `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件名',
                                       `suffix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '后缀',
                                       `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '路径',
                                       `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '类型',
                                       `size` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '大小',
                                       `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
                                       `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
                                       `create_time` datetime(0) DEFAULT NULL COMMENT '创建日期',
                                       `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
                                       PRIMARY KEY (`storage_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '本地存储' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tool_qiniu_config
-- ----------------------------
DROP TABLE IF EXISTS `tool_qiniu_config`;
CREATE TABLE `tool_qiniu_config`  (
                                      `config_id` bigint(20) NOT NULL COMMENT 'ID',
                                      `access_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'accessKey',
                                      `bucket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Bucket 识别符',
                                      `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '外链域名',
                                      `secret_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'secretKey',
                                      `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '空间类型',
                                      `zone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '机房',
                                      PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '七牛云配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tool_qiniu_content
-- ----------------------------
DROP TABLE IF EXISTS `tool_qiniu_content`;
CREATE TABLE `tool_qiniu_content`  (
                                       `content_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                                       `bucket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Bucket 识别符',
                                       `name` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件名称',
                                       `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件大小',
                                       `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件类型：私有或公开',
                                       `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件url',
                                       `suffix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件后缀',
                                       `update_time` datetime(0) DEFAULT NULL COMMENT '上传或同步的时间',
                                       PRIMARY KEY (`content_id`) USING BTREE,
                                       UNIQUE INDEX `uniq_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '七牛云文件存储' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
