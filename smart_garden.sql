/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50635
 Source Host           : localhost:3306
 Source Schema         : smart_garden

 Target Server Type    : MySQL
 Target Server Version : 50635
 File Encoding         : 65001

 Date: 05/05/2018 20:49:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for disease
-- ----------------------------
DROP TABLE IF EXISTS `disease`;
CREATE TABLE `disease` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `plant_id` int(11) NOT NULL COMMENT '植物id',
  `disease_name` varchar(511) NOT NULL COMMENT '病虫害名称',
  `disease_part` varchar(511) DEFAULT NULL COMMENT '发病部位',
  `disease_period` varchar(511) DEFAULT NULL COMMENT '发病时期',
  `disease_type` int(11) NOT NULL COMMENT '0->病害 1->虫害',
  `disease_option_rel` varchar(255) DEFAULT NULL COMMENT '病虫害推理选项、疾病对应关系，不同id以#隔开',
  `disease_description` text COMMENT '概述',
  `disease_symptom` text COMMENT '症状',
  `disease_character` text COMMENT '形态特征',
  `disease_law` text COMMENT '规律',
  `disease_prevention` text COMMENT '防治技术',
  `disease_image` text COMMENT '图片，多个图片路径以#隔开',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(11) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for disease_option
-- ----------------------------
DROP TABLE IF EXISTS `disease_option`;
CREATE TABLE `disease_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `plant_id` int(11) NOT NULL COMMENT '植物id',
  `question_id` int(11) NOT NULL COMMENT '对应问题id',
  `option_description` text NOT NULL COMMENT '形状描述',
  `option_image` text COMMENT '图片，多个图片路径以#隔开',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(11) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for disease_question
-- ----------------------------
DROP TABLE IF EXISTS `disease_question`;
CREATE TABLE `disease_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `plant_id` int(11) NOT NULL COMMENT '植物id',
  `question_name` text NOT NULL COMMENT '问题名称',
  `question_sequence` text NOT NULL COMMENT '第几题',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(11) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for plant
-- ----------------------------
DROP TABLE IF EXISTS `plant`;
CREATE TABLE `plant` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `plant_name` varchar(511) NOT NULL COMMENT '植物名称',
  `plant_alias` text COMMENT '植物别名，多个别名以#隔开',
  `plant_latin_name` text COMMENT '植物拉丁文',
  `plant_image` text COMMENT '图片，多个图片路径以#隔开',
  `plant_family` varchar(511) DEFAULT NULL COMMENT '科',
  `plant_genus` varchar(511) DEFAULT NULL COMMENT '属',
  `plant_feature` text COMMENT '株',
  `plant_branch` text COMMENT '枝',
  `plant_leaf` text COMMENT '叶',
  `plant_flower` text COMMENT '花',
  `plant_seed` text COMMENT '果',
  `plant_grow` text COMMENT '花果期',
  `plant_place` text COMMENT '产地',
  `plant_distribution` text COMMENT '分布',
  `plant_function` text COMMENT '功能',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(11) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for question_game
-- ----------------------------
DROP TABLE IF EXISTS `question_game`;
CREATE TABLE `question_game` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `question` text NOT NULL COMMENT '问题',
  `question_image` text NOT NULL COMMENT '问题图片',
  `option_a` text NOT NULL COMMENT '选项A',
  `option_a_image` text NOT NULL COMMENT '选项A图片',
  `option_b` text NOT NULL COMMENT '选项B',
  `option_b_image` text NOT NULL COMMENT '选项B图片',
  `option_c` text COMMENT '选项C',
  `option_c_image` text COMMENT '选项C图片',
  `option_d` text COMMENT '选项D',
  `option_d_image` text COMMENT '选项D图片',
  `answer` int(1) DEFAULT NULL COMMENT '答案 0->A 1->B 2->C 3->D',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(11) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for request_time
-- ----------------------------
DROP TABLE IF EXISTS `request_time`;
CREATE TABLE `request_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `request_type` int(11) DEFAULT '0' COMMENT '0->植物 1->病虫害',
  `plant_id` int(11) DEFAULT '0' COMMENT '植物id',
  `disease_id` int(11) DEFAULT '0' COMMENT '病虫害id',
  `request_time` int(11) DEFAULT '1' COMMENT '请求次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for search
-- ----------------------------
DROP TABLE IF EXISTS `search`;
CREATE TABLE `search` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `search_type` int(11) DEFAULT '0' COMMENT '0->查询植物 1->查询病虫害',
  `search_name` text NOT NULL COMMENT '查询内容',
  `search_time` int(11) DEFAULT '1' COMMENT '查询次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tour
-- ----------------------------
DROP TABLE IF EXISTS `tour`;
CREATE TABLE `tour` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` text NOT NULL COMMENT '名称',
  `area_name` text COMMENT '地区',
  `introduce` text COMMENT '介绍',
  `telephone` text COMMENT '电话',
  `price_desc` text COMMENT '价格',
  `suitable` text COMMENT '旅游时节',
  `big_img` text COMMENT '长图，多个图片路径以#隔开',
  `pic_img` text COMMENT '方图',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(11) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(100) NOT NULL COMMENT '用户名 不重复',
  `user_nickname` varchar(100) DEFAULT NULL COMMENT '用户昵称',
  `user_role` int(11) DEFAULT '99' COMMENT '用户角色 0->超级管理员 1->人流量监测管理员 2->后台数据管理员 99->普通用户',
  `user_password` varchar(30) NOT NULL COMMENT '用户密码',
  `user_mobile` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `user_email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `user_avatar` text COMMENT '用户头像',
  `state` int(11) DEFAULT '-1' COMMENT '用户状态 用户封号',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(11) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
