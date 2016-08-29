/*
Navicat MySQL Data Transfer

Source Server         : 线下测试
Source Server Version : 50624
Source Host           : 172.16.2.187:33096
Source Database       : jjsapi

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-08-27 10:10:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
CREATE TABLE `comment` (
  `id` varchar(50) NOT NULL,
  `webpageId` varchar(50) NOT NULL,
  `content` varchar(200) NOT NULL,
  `userId` varchar(50) DEFAULT NULL,
  `parentId` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sequence` int(11) NOT NULL DEFAULT '0' COMMENT '排序，越大越靠前',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for datacenter
-- ----------------------------
CREATE TABLE `datacenter` (
  `id` varchar(255) NOT NULL,
  `createTime` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `canDelete` tinyint(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parentId` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of datacenter
-- ----------------------------
INSERT INTO `datacenter` VALUES ('dc92d9d2-267a-4418-9113-da58446e9752', '2016-08-27 09:05:53', '0', '0', '0', '吉农接口', '0', '', '', 'MODULE', 'http://172.16.2.86:8080');

-- ----------------------------
-- Table structure for error
-- ----------------------------
CREATE TABLE `error` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `errorCode` varchar(50) NOT NULL COMMENT '错误码编码',
  `errorMsg` varchar(128) NOT NULL COMMENT '错误码描述',
  `moduleId` varchar(50) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `sequence` int(11) NOT NULL DEFAULT '0' COMMENT '排序，越大越靠前',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of error
-- ----------------------------
INSERT INTO `error` VALUES ('0008a40d-b79c-4579-a9f9-f0a04dba1403', '205013', '获取收获地址出错', '9e6596c1-9fda-4cd2-b20a-1cce7e572a65', '2016-04-01 12:14:20', '1', '0');

-- ----------------------------
-- Table structure for interface
-- ----------------------------
CREATE TABLE `interface` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `url` varchar(100) NOT NULL COMMENT 'api链接',
  `method` varchar(30) NOT NULL COMMENT ' 请求方式',
  `param` text COMMENT '参数列表',
  `requestExam` text COMMENT '请求示例',
  `responseParam` text COMMENT '返回参数说明',
  `errorList` text COMMENT '接口错误码列表',
  `trueExam` text COMMENT '正确返回示例',
  `falseExam` text COMMENT '错误返回示例',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否可用;0不可用；1可用;-1 删除',
  `moduleId` varchar(50) NOT NULL COMMENT '所属模块ID',
  `interfaceName` varchar(100) NOT NULL COMMENT '接口名',
  `remark` text,
  `errors` text COMMENT '错误码、错误码信息',
  `updateBy` varchar(100) DEFAULT NULL,
  `updateTime` timestamp NOT NULL DEFAULT '2016-01-01 17:40:00',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `version` varchar(20) NOT NULL DEFAULT '1.0' COMMENT '版本号',
  `sequence` int(11) NOT NULL DEFAULT '0' COMMENT '排序，越大越靠前',
  `header` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of interface
-- ----------------------------
INSERT INTO `interface` VALUES ('137ca407-fa23-483c-ac23-525dab46993f', '/api/sendSms.json', 'POST,', 'form=[{\"name\":\"mobile\",\"necessary\":\"true\",\"type\":\"String\",\"def\":\"无\",\"remark\":\"手机号码\",\"inUrl\":\"false\"},{\"name\":\"templateCode\",\"necessary\":\"true\",\"type\":\"String\",\"def\":\"无\",\"remark\":\"模版编号\",\"inUrl\":\"false\"},{\"name\":\"bussinessCode\",\"necessary\":\"true\",\"type\":\"String\",\"def\":\"无\",\"remark\":\"应用方编号\",\"inUrl\":\"false\"}]', '请求地址:172.16.2.86:8080/api/sendSms.json\r\n请求头:\r\n请求参数:\r\n	mobile=无\r\n	templateCode=无\r\n	bussinessCode=无\r\n', '[]', '', '', '', '1', 'dc92d9d2-267a-4418-9113-da58446e9752', '短信发送', '<p>用于发送短信的接口</p>', '[]', 'userName：admin | trueName：超级管理员', '2016-08-27 10:01:00', '2016-08-27 09:08:48', '1.0', '0', '[]');

-- ----------------------------
-- Table structure for log
-- ----------------------------
CREATE TABLE `log` (
  `id` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sequence` int(11) NOT NULL DEFAULT '0' COMMENT '排序，越大越靠前',
  `modelClass` varchar(50) NOT NULL,
  `modelName` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `updateBy` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人',
  `remark` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `identy` varchar(50) NOT NULL COMMENT '数据唯一主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('21255e3c-73d9-4487-aefd-9f7b674ec21d', '0', '2016-08-27 09:12:08', '0', 'Interface', '接口', 'UPDATE', 'admin', '修改：短信发送', '{\"createTime\":\"2016-08-27 09:08:48.0\",\"errorList\":\"\",\"errors\":\"[]\",\"falseExam\":\"\",\"header\":\"[]\",\"id\":\"137ca407-fa23-483c-ac23-525dab46993f\",\"interfaceName\":\"短信发送\",\"logRemark\":\"短信发送\",\"method\":\"POST,\",\"moduleId\":\"dc92d9d2-267a-4418-9113-da58446e9752\",\"moduleName\":\"消息中心\",\"moduleUrl\":\"\",\"param\":\"form=[{\\\"name\\\":\\\"mobile\\\",\\\"necessary\\\":\\\"true\\\",\\\"type\\\":\\\"String\\\",\\\"def\\\":\\\"无\\\",\\\"remark\\\":\\\"手机号码\\\",\\\"inUrl\\\":\\\"false\\\"},{\\\"name\\\":\\\"templateCode\\\",\\\"necessary\\\":\\\"true\\\",\\\"type\\\":\\\"String\\\",\\\"def\\\":\\\"无\\\",\\\"remark\\\":\\\"模版编号\\\",\\\"inUrl\\\":\\\"false\\\"},{\\\"name\\\":\\\"bussinessCode\\\",\\\"necessary\\\":\\\"true\\\",\\\"type\\\":\\\"String\\\",\\\"def\\\":\\\"无\\\",\\\"remark\\\":\\\"应用方编号\\\",\\\"inUrl\\\":\\\"false\\\"}]\",\"remark\":\"\",\"requestExam\":\"请求地址:172.16.2.86:8080/api/sendSms.json\\r\\n请求头:\\r\\n请求参数:\\r\\n\\tmobile=无\\r\\n\\ttemplateCode=无\\r\\n\\tbussinessCode=无\\r\\n\",\"responseParam\":\"[]\",\"sequence\":0,\"status\":1,\"trueExam\":\"\",\"updateBy\":\"userName：admin | trueName：超级管理员\",\"updateTime\":\"2016-08-27 09:08:00.0\",\"url\":\"172.16.2.86:8080/api/sendSms.json\",\"version\":\"1.0\"}', '137ca407-fa23-483c-ac23-525dab46993f');
INSERT INTO `log` VALUES ('79cf7c72-6af5-4074-a8d7-5c012ce73bd9', '0', '2016-08-27 09:34:09', '0', 'Interface', '接口', 'UPDATE', 'admin', '修改：短信发送', '{\"createTime\":\"2016-08-27 09:08:48.0\",\"dubboService\":\"\",\"errorList\":\"\",\"errors\":\"[]\",\"falseExam\":\"\",\"header\":\"[]\",\"id\":\"137ca407-fa23-483c-ac23-525dab46993f\",\"interfaceName\":\"短信发送\",\"logRemark\":\"短信发送\",\"method\":\"POST,\",\"moduleId\":\"dc92d9d2-267a-4418-9113-da58446e9752\",\"moduleName\":\"消息中心\",\"moduleUrl\":\"\",\"param\":\"form=[{\\\"name\\\":\\\"mobile\\\",\\\"necessary\\\":\\\"true\\\",\\\"type\\\":\\\"String\\\",\\\"def\\\":\\\"无\\\",\\\"remark\\\":\\\"手机号码\\\",\\\"inUrl\\\":\\\"false\\\"},{\\\"name\\\":\\\"templateCode\\\",\\\"necessary\\\":\\\"true\\\",\\\"type\\\":\\\"String\\\",\\\"def\\\":\\\"无\\\",\\\"remark\\\":\\\"模版编号\\\",\\\"inUrl\\\":\\\"false\\\"},{\\\"name\\\":\\\"bussinessCode\\\",\\\"necessary\\\":\\\"true\\\",\\\"type\\\":\\\"String\\\",\\\"def\\\":\\\"无\\\",\\\"remark\\\":\\\"应用方编号\\\",\\\"inUrl\\\":\\\"false\\\"}]\",\"remark\":\"<p>用于发送短信的接口<\\/p>\",\"requestExam\":\"请求地址:172.16.2.86:8080/api/sendSms.json\\r\\n请求头:\\r\\n请求参数:\\r\\n\\tmobile=无\\r\\n\\ttemplateCode=无\\r\\n\\tbussinessCode=无\\r\\n\",\"responseParam\":\"[]\",\"retries\":\"\",\"sequence\":0,\"serviceMethod\":\"\",\"status\":1,\"timeout\":\"\",\"trueExam\":\"\",\"updateBy\":\"userName：admin | trueName：超级管理员\",\"updateTime\":\"2016-08-27 09:12:00.0\",\"url\":\"172.16.2.86:8080/api/sendSms.json\",\"version\":\"1.0\"}', '137ca407-fa23-483c-ac23-525dab46993f');
INSERT INTO `log` VALUES ('9e33b480-ad46-4fc0-b94a-4e562b5db717', '0', '2016-08-27 10:01:37', '0', 'Interface', '接口', 'UPDATE', 'admin', '修改：短信发送', '{\"createTime\":\"2016-08-27 09:08:48.0\",\"dubboService\":\"com.jjshome.platform.mc.service.IMessageService\",\"errorList\":\"\",\"errors\":\"[]\",\"falseExam\":\"\",\"header\":\"[]\",\"id\":\"137ca407-fa23-483c-ac23-525dab46993f\",\"interfaceName\":\"短信发送\",\"logRemark\":\"短信发送\",\"method\":\"POST,\",\"moduleId\":\"dc92d9d2-267a-4418-9113-da58446e9752\",\"moduleName\":\"消息中心\",\"moduleUrl\":\"172.16.2.86:8080\",\"param\":\"form=[{\\\"name\\\":\\\"mobile\\\",\\\"necessary\\\":\\\"true\\\",\\\"type\\\":\\\"String\\\",\\\"def\\\":\\\"无\\\",\\\"remark\\\":\\\"手机号码\\\",\\\"inUrl\\\":\\\"false\\\"},{\\\"name\\\":\\\"templateCode\\\",\\\"necessary\\\":\\\"true\\\",\\\"type\\\":\\\"String\\\",\\\"def\\\":\\\"无\\\",\\\"remark\\\":\\\"模版编号\\\",\\\"inUrl\\\":\\\"false\\\"},{\\\"name\\\":\\\"bussinessCode\\\",\\\"necessary\\\":\\\"true\\\",\\\"type\\\":\\\"String\\\",\\\"def\\\":\\\"无\\\",\\\"remark\\\":\\\"应用方编号\\\",\\\"inUrl\\\":\\\"false\\\"}]\",\"remark\":\"<p>用于发送短信的接口<\\/p>\",\"requestExam\":\"请求地址:172.16.2.86:8080/api/sendSms.json\\r\\n请求头:\\r\\n请求参数:\\r\\n\\tmobile=无\\r\\n\\ttemplateCode=无\\r\\n\\tbussinessCode=无\\r\\n\",\"responseParam\":\"[]\",\"retries\":0,\"sequence\":0,\"serviceMethod\":\"sendSms\",\"status\":1,\"timeout\":2000,\"trueExam\":\"\",\"updateBy\":\"userName：admin | trueName：超级管理员\",\"updateTime\":\"2016-08-27 09:34:00.0\",\"url\":\"172.16.2.86:8080/api/sendSms.json\",\"version\":\"1.0\"}', '137ca407-fa23-483c-ac23-525dab46993f');
INSERT INTO `log` VALUES ('e06d2848-daaf-4442-9b98-f21126ac5d17', '0', '2016-08-27 09:34:56', '0', 'Interface', '接口', 'UPDATE', 'admin', '修改：短信发送', '{\"createTime\":\"2016-08-27 09:08:48.0\",\"dubboService\":\"com.jjshome.platform.mc.service.IMessageService\",\"errorList\":\"\",\"errors\":\"[]\",\"falseExam\":\"\",\"header\":\"[]\",\"id\":\"137ca407-fa23-483c-ac23-525dab46993f\",\"interfaceName\":\"短信发送\",\"logRemark\":\"短信发送\",\"method\":\"POST,\",\"moduleId\":\"dc92d9d2-267a-4418-9113-da58446e9752\",\"moduleName\":\"消息中心\",\"moduleUrl\":\"\",\"param\":\"form=[{\\\"name\\\":\\\"mobile\\\",\\\"necessary\\\":\\\"true\\\",\\\"type\\\":\\\"String\\\",\\\"def\\\":\\\"无\\\",\\\"remark\\\":\\\"手机号码\\\",\\\"inUrl\\\":\\\"false\\\"},{\\\"name\\\":\\\"templateCode\\\",\\\"necessary\\\":\\\"true\\\",\\\"type\\\":\\\"String\\\",\\\"def\\\":\\\"无\\\",\\\"remark\\\":\\\"模版编号\\\",\\\"inUrl\\\":\\\"false\\\"},{\\\"name\\\":\\\"bussinessCode\\\",\\\"necessary\\\":\\\"true\\\",\\\"type\\\":\\\"String\\\",\\\"def\\\":\\\"无\\\",\\\"remark\\\":\\\"应用方编号\\\",\\\"inUrl\\\":\\\"false\\\"}]\",\"remark\":\"<p>用于发送短信的接口<\\/p>\",\"requestExam\":\"请求地址:172.16.2.86:8080/api/sendSms.json\\r\\n请求头:\\r\\n请求参数:\\r\\n\\tmobile=无\\r\\n\\ttemplateCode=无\\r\\n\\tbussinessCode=无\\r\\n\",\"responseParam\":\"[]\",\"retries\":\"0\",\"sequence\":0,\"serviceMethod\":\"sendSms\",\"status\":1,\"timeout\":\"2000\",\"trueExam\":\"\",\"updateBy\":\"userName：admin | trueName：超级管理员\",\"updateTime\":\"2016-08-27 09:34:00.0\",\"url\":\"172.16.2.86:8080/api/sendSms.json\",\"version\":\"1.0\"}', '137ca407-fa23-483c-ac23-525dab46993f');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
CREATE TABLE `menu` (
  `id` varchar(50) NOT NULL DEFAULT '导航菜单编号',
  `menuName` varchar(50) NOT NULL COMMENT '菜单名称',
  `menuUrl` varchar(100) DEFAULT NULL COMMENT '菜单链接',
  `roleIds` varchar(512) DEFAULT NULL COMMENT '角色可见集合  （ID之间以逗号分隔）',
  `parentId` varchar(50) DEFAULT '0',
  `iconRemark` varchar(100) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL COMMENT '前端菜单、后台菜单',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `sequence` int(11) NOT NULL DEFAULT '0' COMMENT '排序，越大越靠前',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('07d8d120-34ec-4293-ab93-995c513fc16a', '前端底部菜单列表', 'index.do#/menu/list/0/BOTTOM/一级菜单', '', '5358c830-7a24-46d8-924e-ff47f3e8fb01', '', '', '2016-04-10 17:56:17', '0', '0');
INSERT INTO `menu` VALUES ('097bde20-9ece-4033-8f81-118e962f791b', '模块&接口列表', 'index.do#/interface/list/0/无', '', '4a8eee1c-4863-41f3-9ba8-d11c255de46f', '', '', '2016-04-01 12:19:34', '1', '0');
INSERT INTO `menu` VALUES ('0a2e84c9-f097-409d-a568-3f4fcb8d7575', '错误码', '', '0,', '0', '<i class=\"iconfont\">&#xe60c;</i>', 'FRONT', '2016-04-01 12:19:34', '1', '0');
INSERT INTO `menu` VALUES ('0a57028b-8443-476b-a9dc-6cea8e934a5f', '文章列表', 'index.do#/webPage/list/ARTICLE', '', '5a459a29-0932-4ef3-b907-579931b432d5', '', '', '2016-04-10 17:32:48', '0', '0');
INSERT INTO `menu` VALUES ('17a0bc3b-7b61-44e6-810d-f86acf37f1d8', '错误码列表', 'web.do#/webError/list/9e6596c1-9fda-4cd2-b20a-1cce7e572a65', '', '0a2e84c9-f097-409d-a568-3f4fcb8d7575', '', null, '2016-04-01 12:19:34', '1', '0');
INSERT INTO `menu` VALUES ('19ca5c8d-bc19-44b1-bee9-432cdda5b95e', 'GitHub', 'https://github.com/EhsanTang/CrapApi', '', 'd1fb098c-d13a-494d-98f1-791bddaec1a7', '', '', '2016-04-10 01:53:25', '0', '0');
INSERT INTO `menu` VALUES ('1b35d3a5-57fc-4fc7-b458-918523c33042', '接口列表', '', '0,', '0', '<i class=\"iconfont\">&#xe614;</i>', 'FRONT', '2016-04-01 12:19:34', '1', '0');
INSERT INTO `menu` VALUES ('241f31ab-3dcb-4290-a485-644540d38433', '后台菜单列表', 'index.do#/menu/list/0/BACK/一级菜单', '', '5358c830-7a24-46d8-924e-ff47f3e8fb01', '', '', '2016-04-01 12:19:34', '1', '0');
INSERT INTO `menu` VALUES ('2539e1e5-bc0e-4dc4-a27c-57658ce3c892', '开源中国', 'http://www.oschina.net/p/crapapi', '', '0', '', 'BOTTOM', '2016-04-10 17:57:26', '0', '0');
INSERT INTO `menu` VALUES ('28e9c99c-c365-41df-8591-771c4301157e', 'CrapBlog', 'http://blog.crap.cn/wordpress/', '', '0', '', 'FRIEND', '2016-04-16 23:39:56', '0', '0');
INSERT INTO `menu` VALUES ('2b2292d5-0fb0-4d63-97cc-ce3a48d83fb0', '用户管理', '', 'b304b5c2-9186-4bd2-851f-2979e03b8f83,', '0', '<i class=\"iconfont\">&#xe603;</i>', 'BACK', '2016-04-01 12:19:34', '1', '0');
INSERT INTO `menu` VALUES ('2f107703-3e03-440c-8297-5ccccae8f8da', '', '', '', '', '', null, '2016-04-01 12:19:34', '1', '0');
INSERT INTO `menu` VALUES ('3384cd9c-ff39-41b4-b5fc-84044fad6d30', '角色管理', '', 'b304b5c2-9186-4bd2-851f-2979e03b8f83,', '0', '<i class=\"iconfont\">&#xe612;</i>', 'BACK', '2016-04-01 12:19:34', '1', '0');
INSERT INTO `menu` VALUES ('34439446-6014-45f3-9d30-f29180e0b4b6', '常用接口指南', 'web.do#/webWebPage/list/ARTICLE/常用接口', '', '0', '', 'TOP', '2016-04-10 22:43:13', '0', '0');
INSERT INTO `menu` VALUES ('4131c252-9925-4b2d-9541-e6a2da673b00', '消息中心', 'web.do#/webInterface/list/dc92d9d2-267a-4418-9113-da58446e9752/消息中心', '', '1b35d3a5-57fc-4fc7-b458-918523c33042', '', 'FRONT', '2016-08-27 09:09:35', '0', '0');
INSERT INTO `menu` VALUES ('4a8eee1c-4863-41f3-9ba8-d11c255de46f', '项目&模块&接口管理', '', 'bc1bbac0-68a4-4063-a216-c57c6da47c0d,', '0', '<i class=\"iconfont\">&#xe614;</i>', 'BACK', '2016-04-01 12:19:34', '1', '0');
INSERT INTO `menu` VALUES ('5358c830-7a24-46d8-924e-ff47f3e8fb01', '菜单管理', '', '', '0', '<i class=\"iconfont\">&#xe60f;</i>', 'BACK', '2016-04-01 12:19:34', '1', '0');
INSERT INTO `menu` VALUES ('5891d916-a05d-4864-8c05-f8a844e71dd9', '系统设置', '', '', '0', '<i class=\"iconfont\">&#xe61a;</i>', 'BACK', '2016-04-04 06:09:55', '0', '0');
INSERT INTO `menu` VALUES ('5a459a29-0932-4ef3-b907-579931b432d5', '网站页面&文章管理', '', '', '0', '<i class=\"iconfont\">&#xe61f;</i>', 'BACK', '2016-04-10 17:29:41', '0', '0');
INSERT INTO `menu` VALUES ('5aa11f29-7acc-4f93-9b51-6bf47d654007', '22222222', '22222222222', '2', '1', null, null, '2016-04-01 12:19:34', '1', '0');
INSERT INTO `menu` VALUES ('6417012b-ed74-49b5-aa93-c219832acb30', '前端主菜单列表', 'index.do#/menu/list/0/FRONT/一级菜单', '', '5358c830-7a24-46d8-924e-ff47f3e8fb01', '', '', '2016-04-10 17:55:41', '0', '0');
INSERT INTO `menu` VALUES ('87534e09-1636-45fd-92a2-b5b90f5da58b', '数据字典管理', '', '', '0', '<i class=\"iconfont\">&#xe61c;</i>', 'BACK', '2016-04-05 22:53:33', '0', '0');
INSERT INTO `menu` VALUES ('885df3f1-3476-4c87-b656-885bea1802f8', '菜单3', '1111111111', '2', '1', null, null, '2016-04-01 12:19:34', '1', '0');
INSERT INTO `menu` VALUES ('8c868bf7-e330-40bf-a377-5c3f8f5c1fd7', '1111', '1333', '0', '1', null, null, '2016-04-01 12:19:34', '1', '0');
INSERT INTO `menu` VALUES ('8d500f70-ea2a-46b8-a7a7-7013cb59e423', '数据字典列表', 'index.do#/webPage/list/DICTIONARY', '', '87534e09-1636-45fd-92a2-b5b90f5da58b', '', '', '2016-04-05 22:53:53', '0', '0');
INSERT INTO `menu` VALUES ('92d94fa5-b98b-4397-89e2-a12f6df66aa1', '项目帮助文档', 'web.do#/webWebPage/list/ARTICLE/帮助文档', '', '0', '', 'TOP', '2016-04-10 17:26:36', '0', '0');
INSERT INTO `menu` VALUES ('932c923a-aea3-44a2-ba03-0a97cffbc09a', '角色列表', 'index.do#/role/list', '', '3384cd9c-ff39-41b4-b5fc-84044fad6d30', '', '', '2016-04-01 12:19:34', '1', '0');
INSERT INTO `menu` VALUES ('9bb50876-abf1-46ec-8018-2ffe2510c83b', '系统设置列表', 'index.do#/setting/list', '', '5891d916-a05d-4864-8c05-f8a844e71dd9', '', '', '2016-04-04 06:35:17', '0', '0');
INSERT INTO `menu` VALUES ('a05ba495-e9b9-4433-92f2-d71f92bdac6a', '数据字典列表', 'web.do#/webWebPage/list/DICTIONARY/null', '', 'f8764c78-a281-4133-b19f-109123a49a5f', '', '', '2016-04-05 22:54:43', '0', '0');
INSERT INTO `menu` VALUES ('ad12d510-c62b-4b4e-8fd5-837aece1fe27', 'KL博客', 'http://www.kailing.pub/', '', '0', '', 'FRIEND', '2016-04-12 23:06:40', '0', '0');
INSERT INTO `menu` VALUES ('ba319708-1469-40a9-b09d-084ebd31c009', '联系我', 'web.do#/webWebPage/detail/PAGE/CONTACT', '', 'd1fb098c-d13a-494d-98f1-791bddaec1a7', '', '', '2016-04-10 23:39:32', '0', '0');
INSERT INTO `menu` VALUES ('c58fe99e-4050-477c-b60b-3513375e1996', '用户列表', 'index.do#/user/list', '', '2b2292d5-0fb0-4d63-97cc-ce3a48d83fb0', '', '', '2016-04-01 12:19:34', '1', '0');
INSERT INTO `menu` VALUES ('c61bec50-4cf9-41dd-9bd1-0fa8cf46ce38', 'ketayao博客', 'http://ketayao.com/', '', '0', '', 'FRIEND', '2016-04-09 17:08:33', '0', '0');
INSERT INTO `menu` VALUES ('d082ec96-1ac5-4429-99e3-e02183d25628', '前端顶部菜单列表', 'index.do#/menu/list/0/TOP/一级菜单', '', '5358c830-7a24-46d8-924e-ff47f3e8fb01', '', '', '2016-04-10 17:56:00', '0', '0');
INSERT INTO `menu` VALUES ('d1fb098c-d13a-494d-98f1-791bddaec1a7', '关于我', '', '', '0', '', 'TOP', '2016-04-10 01:53:12', '0', '0');
INSERT INTO `menu` VALUES ('de6f4d42-bf2e-4e1b-a0b8-a706cf24addb', '错误码管理', '', 'bc1bbac0-68a4-4063-a216-c57c6da47c0d,', '0', '<i class=\"iconfont\">&#xe608;</i>', 'BACK', '2016-04-01 12:19:34', '1', '0');
INSERT INTO `menu` VALUES ('ded3b50d-1591-41e7-b642-14bf08bb740b', '错误码列表', 'index.do#/error/list', 'c62a80c5-6064-4815-ac59-e507a8e22a6f,', 'de6f4d42-bf2e-4e1b-a0b8-a706cf24addb', '', '', '2016-04-01 12:19:34', '1', '0');
INSERT INTO `menu` VALUES ('e7250482-4fef-40e5-8cdf-09ec401290ce', '旧城博客', 'http://blog.jiucheng.org/?fr=apicrapcn', '', '0', '', 'FRIEND', '2016-04-15 13:13:53', '0', '0');
INSERT INTO `menu` VALUES ('f8233aa7-ccf9-48fe-9e31-60a1c6b34c4b', '网站页面列表', 'index.do#/webPage/list/PAGE', '', '5a459a29-0932-4ef3-b907-579931b432d5', '', '', '2016-04-10 17:32:27', '0', '0');
INSERT INTO `menu` VALUES ('f8764c78-a281-4133-b19f-109123a49a5f', '数据字典', '', '', '0', '<i class=\"iconfont\">&#xe61c;</i>', 'FRONT', '2016-04-05 22:54:12', '0', '0');

-- ----------------------------
-- Table structure for module
-- ----------------------------
CREATE TABLE `module` (
  `id` varchar(50) NOT NULL COMMENT '所属模块ID',
  `moduleName` varchar(100) NOT NULL COMMENT '所属模块名称',
  `parentId` varchar(50) DEFAULT NULL COMMENT '父级节点ID',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `password` varchar(20) DEFAULT NULL COMMENT '访问密码',
  `sequence` int(11) NOT NULL DEFAULT '0' COMMENT '排序，越大越靠前',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '模块地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('063578aa-785f-42b8-bd1b-e3061ef45a2f', '订单模块', '9e6596c1-9fda-4cd2-b20a-1cce7e572a65', '2016-04-01 12:21:03', '1', '123', '0', '');
INSERT INTO `module` VALUES ('189d073c-b4ea-4e50-a1c1-f66ec1da1dd4', '购物车模块', '9e6596c1-9fda-4cd2-b20a-1cce7e572a65', '2016-04-01 12:21:03', '1', '123', '0', '');
INSERT INTO `module` VALUES ('563d4de0-5afd-4448-bf9e-a1a30b197167', '用户模块', '9e6596c1-9fda-4cd2-b20a-1cce7e572a65', '2016-04-01 12:21:03', '1', null, '0', '');
INSERT INTO `module` VALUES ('62bde6e0-988b-475f-bfdf-76203455ec57', '免费常用接口', '0', '2016-04-01 12:21:03', '1', '', '0', '');
INSERT INTO `module` VALUES ('643b1586-6861-434b-b644-979bdd5f87ee', '11', '9e6596c1-9fda-4cd2-b20a-1cce7e572a65', '2016-04-12 21:56:36', '0', '', '0', '');
INSERT INTO `module` VALUES ('6462bd9d-db3f-48dd-abee-03bab9faa806', 'aaa', '9e6596c1-9fda-4cd2-b20a-1cce7e572a65', '2016-04-05 12:24:35', '0', '', '0', '');
INSERT INTO `module` VALUES ('9e6596c1-9fda-4cd2-b20a-1cce7e572a65', 'API模块', '0', '2016-04-01 12:21:03', '1', '123', '0', '');
INSERT INTO `module` VALUES ('bfdc49dd-4999-4ab4-a41a-1bda782d71fa', '短信模块', 'e634d522-aad8-4cdb-9c13-105ee7b17eab', '2016-04-01 12:21:03', '1', null, '0', '');
INSERT INTO `module` VALUES ('cf9f682a-fd76-4ab5-9300-9210164ae2ea', '订单模块', 'e634d522-aad8-4cdb-9c13-105ee7b17eab', '2016-04-01 12:21:03', '1', null, '0', '');
INSERT INTO `module` VALUES ('e634d522-aad8-4cdb-9c13-105ee7b17eab', 'AppApi模块', '0', '2016-04-01 12:21:03', '1', null, '0', '');
INSERT INTO `module` VALUES ('f86d375e-d1db-4eeb-84fa-9e9def04fc6d', '购物车模块', 'e634d522-aad8-4cdb-9c13-105ee7b17eab', '2016-04-01 12:21:03', '1', null, '0', '');

-- ----------------------------
-- Table structure for role
-- ----------------------------
CREATE TABLE `role` (
  `id` varchar(50) NOT NULL COMMENT '角色ID',
  `roleName` varchar(50) NOT NULL COMMENT '角色名称',
  `auth` text NOT NULL,
  `authName` text,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `sequence` int(11) NOT NULL DEFAULT '0' COMMENT '排序，越大越靠前',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('ee479a4b-f445-4130-a295-572e6126ec96', 'test', 'MODULE_9e6596c1-9fda-4cd2-b20a-1cce7e572a65,MODULE_e634d522-aad8-4cdb-9c13-105ee7b17eab,INTERFACE_62bde6e0-988b-475f-bfdf-76203455ec57,INTERFACE_9e6596c1-9fda-4cd2-b20a-1cce7e572a65,INTERFACE_e634d522-aad8-4cdb-9c13-105ee7b17eab,ERROR_62bde6e0-988b-475f-bfdf-76203455ec57,ERROR_9e6596c1-9fda-4cd2-b20a-1cce7e572a65,ERROR_e634d522-aad8-4cdb-9c13-105ee7b17eab,SETTING,DICTIONARY_9e6596c1-9fda-4cd2-b20a-1cce7e572a65,DICTIONARY_e634d522-aad8-4cdb-9c13-105ee7b17eab,5a459a29-0932-4ef3-b907-579931b432d5,87534e09-1636-45fd-92a2-b5b90f5da58b,5891d916-a05d-4864-8c05-f8a844e71dd9,2b2292d5-0fb0-4d63-97cc-ce3a48d83fb0,3384cd9c-ff39-41b4-b5fc-84044fad6d30,4a8eee1c-4863-41f3-9ba8-d11c255de46f,5358c830-7a24-46d8-924e-ff47f3e8fb01,de6f4d42-bf2e-4e1b-a0b8-a706cf24addb,', 'API模块【模块】,AppApi模块【模块】,免费常用接口【接口】,API模块【接口】,AppApi模块【接口】,免费常用接口【错误码】,API模块【错误码】,AppApi模块【错误码】,系统设置管理,API模块,AppApi模块,网站页面&文章管理【菜单】,数据字典管理【菜单】,系统设置【菜单】,用户管理【菜单】,角色管理【菜单】,项目&模块&接口管理【菜单】,菜单管理【菜单】,错误码管理【菜单】,', '2016-04-01 12:22:07', '1', '0');

-- ----------------------------
-- Table structure for setting
-- ----------------------------
CREATE TABLE `setting` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `mkey` varchar(20) NOT NULL,
  `value` varchar(500) NOT NULL,
  `remark` text,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `type` varchar(10) NOT NULL DEFAULT 'TEXT' COMMENT '设置类型（IMAGE,LINK,TEXT）',
  `canDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1：可删除，0：不可删除',
  `sequence` int(11) NOT NULL DEFAULT '0' COMMENT '排序，越大越靠前',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`mkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES ('062f01ae-e50b-4dd3-808b-b4a6d65eeadc', 'LOGO', 'http://api.crap.cn/resources/upload/images/2016-04-04/064741q2A4JA.png', '网站主logo，可以直接在value中填写绝对链接地址，也可以自行上传图片', '2016-04-01 12:23:18', '1', 'IMAGE', '0', '0');
INSERT INTO `setting` VALUES ('8a95bc2f-ea61-4dd6-8163-d9c520b28181', 'VISITCODE', 'true', '游客访问私密模块输入密码的同时是否需要输入图像验证码？true为需要，其他为不需要', '2016-04-03 18:07:14', '0', 'TEXT', '0', '0');
INSERT INTO `setting` VALUES ('98ecca1b-f762-4cd3-831a-4042b36419d8', 'VERIFICATIONCODE', 'fasle', '是否开启安全登录？ture为开启，其他为不开启，开启后登录将需要输入图片验证码', '2016-04-03 18:07:58', '0', 'TEXT', '0', '0');
INSERT INTO `setting` VALUES ('b97a3a75-c1c3-42cc-b944-8fb5ac5c5f49', 'SECRETKEY', 'crapApiKey', '秘钥，用于cookie加密等', '2016-04-03 01:04:40', '0', 'TEXT', '0', '0');
INSERT INTO `setting` VALUES ('de94c622-02fc-4b39-9cc5-0c24870ac21f', 'TITLE', 'CrapApi|Api接口管理系统', '站点标题', '2016-04-02 19:09:13', '1', 'TEXT', '0', '0');
INSERT INTO `setting` VALUES ('e0dec957-5043-4c6e-9225-960fbc401116', 'ICON', 'http://api.crap.cn/resources/upload/images/2016-04-04/063633hG35aC.ico', '站点ICON图标（浏览器标题栏图标）', '2016-04-02 19:49:41', '1', 'IMAGE', '0', '0');
INSERT INTO `setting` VALUES ('e0dec957-5043-4c6e-9225-960fbc401117', 'DOMAIN', 'http://api.crap.cn', '站点域名', '2016-04-02 19:09:13', '1', 'TEXT', '0', '0');
INSERT INTO `setting` VALUES ('ecd676c2-0b04-4b4a-a049-4a825221a6d0', 'BG_COLOR', '#ffffff', '前端显示背景颜色', '2016-05-01 21:07:37', '1', 'COLOR', '0', '0');
INSERT INTO `setting` VALUES ('ef157b7f-cc53-4a41-9679-d243d478023d', 'COMMENTCODE', 'true', '游客评论是否需要输入验证码', '2016-08-27 08:58:40', '1', 'TEXT', '0', '0');
INSERT INTO `setting` VALUES ('f1c8dc8b-9cd8-4839-b38a-1cea3ceb3942', 'MAX_WIDTH', '1200', '前端显示最大宽度（数字，建议：900-1200）', '2016-05-01 21:07:37', '1', 'TEXT', '0', '0');
INSERT INTO `setting` VALUES ('foc8dc8b-9cd8-4839-b38a-1cea3ceb3942', 'FOOTER_BG_COLOR', '#383942', '前端顶部、底部颜色', '2016-05-01 21:07:37', '1', 'COLOR', '0', '0');
INSERT INTO `setting` VALUES ('fpc8dc8b-9cd8-4839-b38a-1cea3ceb3942', 'FOOTER_COLOR', '#666666', '前端顶部、底部字体颜色', '2016-05-01 21:07:37', '1', 'COLOR', '0', '0');
INSERT INTO `setting` VALUES ('fpmbdc00-9cd8-4839-b38a-1cea3ceb3945', 'LUCENE_DIR', '/usr/local/crap/lucene', 'Lucene全文检索文件存储地址', '2016-06-09 21:07:37', '1', 'TEXT', '0', '0');
INSERT INTO `setting` VALUES ('fpmbdc8b-9cd8-4839-b38a-1cea3ceb3912', 'SOLR_URL', 'http://localhost:8983/solr/api', 'solr地址', '2016-06-19 07:07:37', '1', 'TEXT', '0', '22');
INSERT INTO `setting` VALUES ('fpmbdc8b-9cd8-4839-b38a-1cea3ceb3924', 'SEARCH_TYPE', 'luceneSearch', '搜索方式（luceneSearch或solrSearch）', '2016-06-09 13:07:37', '1', 'TEXT', '0', '2');
INSERT INTO `setting` VALUES ('fpmbdc8b-9cd8-4839-b38a-1cea3ceb3925', 'SOLR_QUEUESIZE', '5', 'SOLR队列大小', '2016-06-09 13:07:37', '1', 'TEXT', '0', '22');
INSERT INTO `setting` VALUES ('fpmbdc8b-9cd8-4839-b38a-1cea3ceb3926', 'SOLR_THREADCOUNT', '2', 'SOLR线程数', '2016-06-09 13:07:37', '1', 'TEXT', '0', '22');
INSERT INTO `setting` VALUES ('fpmbdc8b-9cd8-4839-b38a-1cea3ceb3942', 'MAIN_COLOR', '#B768A5', '网站主色调', '2016-05-01 21:07:37', '1', 'COLOR', '0', '0');
INSERT INTO `setting` VALUES ('fpmbdc8b-9cd8-4839-b38a-1cea3ceb3945', 'FONT_FAMILY', '\"Lantinghei SC\", \"Open Sans\", Arial, \"Hiragino Sans GB\", \"Microsoft YaHei\", \"STHeiti\", \"WenQuanYi Mi', '网站字体', '2016-06-09 21:07:37', '1', 'FONTFAMILY', '0', '0');
INSERT INTO `setting` VALUES ('fpmbdc8b-9cd8-4839-b38a-1cea3ceb3999', 'ADORN_COLOR', '#1c4c22', '装饰背景颜色:左侧导航条背景颜色 #1c2034', '2016-06-09 13:07:37', '1', 'COLOR', '0', '26');

-- ----------------------------
-- Table structure for source
-- ----------------------------
CREATE TABLE `source` (
  `id` varchar(50) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sequence` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `name` varchar(100) NOT NULL COMMENT '资源名称',
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `directoryId` varchar(50) NOT NULL DEFAULT '0' COMMENT '文件夹目录',
  `remark` varchar(5000) NOT NULL DEFAULT '' COMMENT '备注',
  `filePath` varchar(200) NOT NULL DEFAULT '' COMMENT '文件目录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of source
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE `user` (
  `id` varchar(50) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `trueName` varchar(50) DEFAULT NULL,
  `roleId` varchar(1024) DEFAULT NULL,
  `roleName` varchar(1024) DEFAULT NULL,
  `auth` varchar(1024) DEFAULT NULL,
  `authName` varchar(1024) DEFAULT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `sequence` int(11) NOT NULL DEFAULT '0' COMMENT '排序，越大越靠前',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('206a1218-5c81-48af-b8e4-25864ad5e929', 'super', 'e10adc3949ba59abbe56e057f20f883e', '测试用户', 'ee479a4b-f445-4130-a295-572e6126ec96,', 'test,', '', '', '2016-04-01 12:24:00', '1', '0');
INSERT INTO `user` VALUES ('6e8af9da-ed79-4342-9eca-591ccb4ea658', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员', 'super,', '超级管理员,', '', '', '2016-04-01 12:24:00', '1', '0');

-- ----------------------------
-- Table structure for webpage
-- ----------------------------
CREATE TABLE `webpage` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `brief` varchar(200) DEFAULT NULL,
  `content` text NOT NULL,
  `click` int(11) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT 'PAGE',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `moduleId` varchar(50) DEFAULT NULL,
  `mkey` varchar(20) DEFAULT NULL COMMENT 'key，唯一键，页面唯一标识',
  `canDelete` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否可删除，可修key，默认可以',
  `category` varchar(50) DEFAULT NULL,
  `canComment` tinyint(4) NOT NULL DEFAULT '1',
  `commentCount` int(11) NOT NULL DEFAULT '0',
  `sequence` int(11) NOT NULL DEFAULT '0' COMMENT '排序，越大越靠前',
  `password` varchar(45) NOT NULL DEFAULT '',
  `markdown` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mkey_UNIQUE` (`mkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webpage
-- ----------------------------
INSERT INTO `webpage` VALUES ('07bdc59d-e407-4ef0-8ff7-bf86449e7efd', '用户表，存储用户信息', '样例表：用户表，存储用户信息用户表，存储用户信息用户表，存储用户信息', '[{\"name\":\"id\",\"type\":\"int\",\"notNull\":\"false\",\"def\":\"\",\"remark\":\"主键，自增\"},{\"name\":\"userName\",\"type\":\"varchar(50)\",\"notNull\":\"false\",\"def\":\"\",\"remark\":\"用户名\"},{\"name\":\"password\",\"type\":\"varchar(50)\",\"notNull\":\"false\",\"def\":\"\",\"remark\":\"用户密码\"},{\"name\":\"email\",\"type\":\"varchar(20)\",\"notNull\":\"true\",\"def\":\"\",\"remark\":\"邮箱\"},{\"name\":\"gender\",\"type\":\"varchar(2)\",\"notNull\":\"false\",\"def\":\"男\",\"remark\":\"性别\"}]', '0', 'DICTIONARY', '0', '2016-04-05 22:52:41', '62bde6e0-988b-475f-bfdf-76203455ec57', null, '1', null, '1', '0', '0', '', '');
INSERT INTO `webpage` VALUES ('07bdc59d-e4073-4ef0-8ff7-bf86449e7efd', '用户表，存储用户信息', '样例表：用户表，存储用户信息用户表，存储用户信息用户表，存储用户信息', '[{\"name\":\"id\",\"type\":\"int\",\"notNull\":\"false\",\"def\":\"\",\"remark\":\"主键，自增\"},{\"name\":\"userName\",\"type\":\"varchar(50)\",\"notNull\":\"false\",\"def\":\"\",\"remark\":\"用户名\"},{\"name\":\"password\",\"type\":\"varchar(50)\",\"notNull\":\"false\",\"def\":\"\",\"remark\":\"用户密码\"},{\"name\":\"email\",\"type\":\"varchar(20)\",\"notNull\":\"true\",\"def\":\"\",\"remark\":\"邮箱\"},{\"name\":\"gender\",\"type\":\"varchar(2)\",\"notNull\":\"false\",\"def\":\"男\",\"remark\":\"性别\"}]', '0', 'DICTIONARY', '0', '2016-04-05 14:52:41', '62bde6e0-988b-475f-bfdf-762034535ec57', null, '1', null, '1', '0', '0', '', '');
INSERT INTO `webpage` VALUES ('19dc3d5c7-ff3d-4dff-ad72-2212869cd92a', '项目部署', '', '<p><br/></p><p>CrapApi接口管理项目中的pdf导出功能目前只支持windows服务器，在linux服务器上部署导出的pdf无法显示中文</p><p>如你更好的解决方案（html转pdf），可点击“联系我”或加群讨论</p><p><br/></p>', '0', 'ARTICLE', '0', '2016-04-10 09:51:53', '', null, '1', '帮助文档', '1', '0', '0', '', '');
INSERT INTO `webpage` VALUES ('2595b098-4e27-4e28-8a50-7241741f7619', '管理员帮助中心', '支持接口pdf文件下载\n支持发布文章，文章分类\n支持自定义网站页面', '<blockquote style=\"color: rgb(85, 85, 85);text-align: left;background-color: rgb(255, 255, 255);\"><p>   感谢使用CrapApi应用接口管理系统！</p><p>   如您发现好的免费常用API接口，可在后台管理，文章管理一栏添加相关文章，不胜感激！<br/></p></blockquote><p style=\"color: rgb(85, 85, 85);text-align: left;background-color: rgb(255, 255, 255);\"><br/></p><blockquote style=\"color: rgb(51, 51, 51);background-color: rgb(255, 255, 255);\"><p>  一个由anjularjs+bootstrap+springMVC搭建的免费开源的API接口管理系统。</p><p>  系统特点：</p><p></p><ul><li> 系统支持管理员管理、权限控制、角色管理</li><li>支持多项目、多模块划分，同时支持私密项目、模块密码访问</li><li>支持数据字典管理、支持数据字典密码访问<br/></li><li>支持项目错误码管理、支持接口拷贝等功能<br/></li><li>支持前端菜单自定义，支持管理员菜单自定义</li><li>支持接口pdf文件下载<br/></li><li>支持发布文章，文章分类<br/></li><li>支持自定义网站页面<br/></li></ul></blockquote><p style=\"color: rgb(85, 85, 85);text-align: left;background-color: rgb(255, 255, 255);\"><br/></p><p style=\"color: rgb(85, 85, 85);text-align: left;background-color: rgb(255, 255, 255);\">常见问题：</p><ol style=\"color: rgb(85, 85, 85);text-align: left;background-color: rgb(255, 255, 255);\"><li style=\"color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);\">什么是【游客图形验证码】？如果开启了【游客图形验证码】，则游客在访问私密模块时不仅需要输入访问密码，而且需要输入【游客图形验证码】，开启【游客图形验证码】能有效防止暴力破解模块访问密码。<br/></li><li style=\"color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);\">什么是【模块密码】？【模块密码】对后台管理没有任何影响，若为模块添加了密码，当游客访问该模块时需要输入访问密码才能浏览，【模块密码】只在当前模块有效，即子模块不能继承父模块的密码。故建议将【模块密码】设置在需要控制访问的接口所属的直接模块上。若多个模块密码一致，游客输入密码后无需再次输入，直接就可以访问。如没有开启游客图形验证码，则关闭浏览器后密码将自动失效。</li><li style=\"color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);\">为什么游客输入过访问密码后，再次访问依然需要再次输入访问密码？（1）系统只保留用户最后一次输入的访问密码，如果多个模块需要访问密码，则当用户交叉访问时，后一个密码将覆盖前一个密码，因此需要再次输入访问密码。</li><li style=\"color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);\">显示样式有问题？所有测试均使用Chrome浏览器，请优先使用Chrome、Firefox、Safari浏览器访问</li><li style=\"color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);\">GitHub地址：https://github.com/EhsanTang/CrapApi</li><li style=\"color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);\">QQ技术交流群：254450938</li></ol>', '9', 'PAGE', '0', '2016-04-10 00:22:32', '', 'ADMINHELP', '0', '', '1', '0', '0', '', '');
INSERT INTO `webpage` VALUES ('377d6580-657f-420b-88fd-d7d239f05cb5', '帮助中心', '', '<blockquote style=\"color: rgb(85, 85, 85);text-align: left;background-color: rgb(255, 255, 255);\"><p>   感谢使用CrapApi应用接口管理系统！</p><p>   如您发现好的免费常用API接口，可在后台管理，文章管理一栏添加相关文章，不胜感激！</p></blockquote><p style=\"color: rgb(85, 85, 85);text-align: left;background-color: rgb(255, 255, 255);\"><br/></p><blockquote style=\"color: rgb(85, 85, 85);text-align: left;background-color: rgb(255, 255, 255);\"><p><span>  一个由anjularjs+bootstrap+springMVC搭建的免费开源的API接口管理系统</span><span>。</span></p><p><span>  系统特点：</span></p><p></p><ul><li><span>系统</span><span>支持管理员管理、权限控制、角色管理</span></li><li><span>支持多项目、多模块划分，同时支持私密项目、模块密码访问</span></li><li><span>支持数据字典管理、支持数据字典密码访问<br/></span></li><li><span>支持项目错误码管理、支持接口拷贝等功能<br/></span></li><li><span>支持前端菜单自定义，支持管理员菜单自定义</span></li><li><span>支持接口pdf文件下载</span></li><li>支持发布文章，文章分类</li><li>支持自定义网站页面</li></ul></blockquote><p style=\"color: rgb(85, 85, 85);text-align: left;background-color: rgb(255, 255, 255);\"><br/></p><p style=\"color: rgb(85, 85, 85);text-align: left;background-color: rgb(255, 255, 255);\">常见问题：</p><ol style=\"color: rgb(85, 85, 85);text-align: left;background-color: rgb(255, 255, 255);\"><li>管理员账号：super 123456</li><li>私有接口访问密码：123</li><li>显示样式有问题：所有测试均使用Chrome浏览器，请优先使用Chrome、Firefox、Safari浏览器访问</li><li>页面加载异常：项目正在不断完善，可能是文件缓存导致，请刷新浏览器重试。</li><li>GitHub地址：https://github.com/EhsanTang/CrapApi</li><li>QQ技术交流群：254450938</li></ol>', '3', 'PAGE', '0', '2016-04-10 00:13:09', '', 'WELCOME', '0', '', '1', '0', '0', '', '');
INSERT INTO `webpage` VALUES ('395b13aa-920c-4697-b95e-8d8c00342001', '天气预报接口', '气象数据开放接口是中国气象局面向网络媒体、手机厂商、第三方气象服务机构等用户，\n通过web方式提供气象数据服务的官方载体。随着气象数据开放平台的逐渐完善，\n会面向广大用户提供更为丰富全面的气象数据，从而满足不同用户的不同需求。', '<p>气象数据开放平台：<a href=\"http://openweather.weather.com.cn/Home/Package/index.html\" target=\"\">http://openweather.weather.com.cn/Home/Package/index.html</a></p><p>1.常规气象数据接口</p><ul><li>包含国内全站2566个县级以上城市未来3天常规预报以及三个气象指数（穿衣指数，舒适度指数，晨练指数）等天气服务数据。 <br/></li><li>费用：每年300元</li></ul><p>2.基础气象数据接口</p><ul><li>包含国内369个地级市未来3天常规预报以及三个气象指数（穿衣指数，舒适度指数，晨练指数）等天气服务数据。<br/></li><li>费用：每年30元</li></ul><p><br/></p><p>直接通过气象局调用以上两个接口现阶段免费，未来可能需要收费，需要注册账号并完善资料后才能调用</p><p>目前气象局对外公开的直接可调用的接口如下：</p><ul><li><span class=\"s1\">http:</span>//www.weather.com.cn/data/sk/101010100.html</li><li><span class=\"s1\">http:</span>//www.weather.com.cn/data/cityinfo/101010100.html</li><li>101010100代表城市代码</li></ul><p class=\"p2\" style=\"color: rgb(51, 51, 51);text-align: left;background-color: rgb(255, 255, 255);\"><br/></p><p class=\"p2\" style=\"color: rgb(51, 51, 51);text-align: left;background-color: rgb(255, 255, 255);\">国外天气预报接口：<a href=\"https://www.wunderground.com/weather/api\" target=\"\">https://www.wunderground.com/weather/api</a></p><p class=\"p2\" style=\"color: rgb(51, 51, 51);text-align: left;background-color: rgb(255, 255, 255);\">城市代码可直接通过气象局官网查询，地址：<a href=\"http://openweather.weather.com.cn/Home/Help/area.html\" target=\"\">http://openweather.weather.com.cn/Home/Help/area.html</a></p>', '0', 'ARTICLE', '0', '2016-04-10 23:01:18', '', null, '1', '常用接口', '1', '0', '0', '', '');
INSERT INTO `webpage` VALUES ('63864a72-ab64-4350-a3d7-d25d5bfc88bf', '手机号码归属地查询接口大全（七种）', '淘宝、拍拍、财付通、百付宝等手机号码查询接口', '<p>淘宝网<br/>API地址： http://tcc.taobao.com/cc/json/mobile_tel_segment.htm?tel=15850781443<br/>参数：<br/>tel：手机号码<br/>返回：JSON</p><p><br/>拍拍<br/>API地址： http://virtual.paipai.com/extinfo/GetMobileProductInfo?mobile=15850781443&amp;amount=10000&amp;callname=getPhoneNumInfoExtCallback<br/>参数：<br/>mobile：手机号码<br/>callname：回调函数<br/>amount：未知（必须）<br/>返回：JSON</p><p><br/>财付通<br/>API地址： http://life.tenpay.com/cgi-bin/mobile/MobileQueryAttribution.cgi?chgmobile=15850781443<br/>参数：<br/>chgmobile：手机号码<br/>返回：xml</p><p><br/>百付宝<br/>API地址： https://www.baifubao.com/callback?cmd=1059&amp;callback=phone&amp;phone=15850781443<br/>参数：<br/>phone：手机号码<br/>callback：回调函数<br/>cmd：未知（必须）<br/>返回：JSON</p><p><br/>115<br/>API地址： http://cz.115.com/?ct=index&amp;ac=get_mobile_local&amp;callback=jsonp1333962541001&amp;mobile=15850781443<br/>参数：<br/>mobile：手机号码<br/>callback：回调函数<br/>返回：JSON<br/><br/>有道api接口<br/>接口地址：http://www.youdao.com/smartresult-xml/search.s?type=mobile&amp;q=13892101112<br/>参数说明：<br/>type ： 参数手机归属地固定为mobile<br/>q ： 手机号码<br/>返回XML格式：<br/>或者<br/>http://www.youdao.com/smartresult-xml/search.s?jsFlag=true&amp;type=mobile&amp;q=手机号码<br/>返回JSON格式：<br/>fYodaoCallBack(1, {‘product’:\'mobile’,\'phonenum’:’13892101112′,’location’:\'陕西 延安’} , ”);</p><p><br/>096.me api接口<br/>查询手机号码归属地：<br/>http://www.096.me/api.php?phone=手机号&amp;mode={txt,xml}<br/>举例：http://www.096.me/api.php?phone=13892101111&amp;mode=txt<br/>返回：<br/>13892101111||陕西延安移动全球通卡 ||吉凶参半，惟赖勇气，贯彻力行，始可成功 吉带凶||<br/>举例：http://www.096.me/api.php?phone=13892101111&amp;mode=xml<br/>返回：<br/>13892101111 陕西延安移动全球通卡 吉凶参半，惟赖勇气，贯彻力行，始可成功 吉带凶<br/><br/></p>', '0', 'ARTICLE', '0', '2016-04-12 23:34:31', '', null, '1', '常用接口', '1', '0', '0', '', '');
INSERT INTO `webpage` VALUES ('74987b7c-54bc-4043-aa6b-de949303b2a0', '联系我', '', '<blockquote><p>   热爱开源，梦想成为一名自由程序猿</p><p><i></i>   喜欢Java、bootstrap、angular的朋友一起交流、学习，如果有兴趣可以交换链接哦</p></blockquote><h2><br/></h2><h5><p><br/></p><p>联系方式：</p><ul><li><span>QQ技术交流群：254450938</span></li><li><span>Email：ehsantang@163.com</span></li><li><span>QQ：516452267</span></li></ul></h5>', '0', 'PAGE', '0', '2016-04-10 01:46:49', '', 'CONTACT', '1', null, '1', '0', '0', '', '');
INSERT INTO `webpage` VALUES ('8b4f67de-034ba-4a1a-b7c3-e3d5cd74e45b', '测试', '用于介绍test的一个demo', '[]', '0', 'DICTIONARY', '0', '2016-04-05 14:56:51', '9e6596c1-9fda-4cd2-b20a-1cce7e572a65', null, '1', '', '1', '0', '0', '', '');
INSERT INTO `webpage` VALUES ('8b4f67de-04ba-4a1a-b7c3-e3d5cd74e45b', '测试', '测试简介，测试简介，测试简介，测试简介测试简介测试简介测试简介测试简介测试简介测试简介', '[{\"name\":\"field1\",\"type\":\"int\",\"notNull\":\"true\",\"def\":\"无\",\"remark\":\"字段1\"},{\"name\":\"field2\",\"type\":\"varchar(20)\",\"notNull\":\"false\",\"def\":\"默认值\",\"remark\":\"字段2\"},{\"name\":\"field3\",\"type\":\"int\",\"notNull\":\"true\",\"def\":\"默认值22\",\"remark\":\"字段3\"}]', '0', 'DICTIONARY', '0', '2016-04-05 22:56:51', '9e6596c1-9fda-4cd2-b20a-1cce7e572a65', null, '1', null, '1', '0', '0', '', '');
INSERT INTO `webpage` VALUES ('9385500e-5dc2-4433-8a4b-47158620ef36', 'CrapApi接口管理系统菜单设置', 'CrapApi系统菜单目前分为后台菜单、前端菜单、底部菜单、顶部菜单、友情链接五大类，\n其中后台菜单、前端菜单、顶部菜单支持二级菜单', '<p style=\"color: rgb(51, 51, 51);text-align: left;background-color: rgb(255, 255, 255);\">1.菜单分类</p><p style=\"color: rgb(51, 51, 51);text-align: left;background-color: rgb(255, 255, 255);\"><span></span>CrapApi系统菜单目前分为后台菜单、前端菜单、底部菜单、顶部菜单、友情链接五大类，其中后台菜单、前端菜单、顶部菜单支持二级菜单</p><p style=\"color: rgb(51, 51, 51);text-align: left;background-color: rgb(255, 255, 255);\"><span>后台菜单</span>：后台菜单是管理员菜单，不同权限、角色可以个性化定制不同菜单，后台管理菜单只支持二级菜单，即使一级菜单设置了超链接，也不可点击，拥有【超级管理员】权限的账号等候后即使没有配置任何菜单，任然可以看到如图一的默认菜单，非【超级管理员】的普通管理员需要设置后台菜单</p><p style=\"color: rgb(51, 51, 51);text-align: left;background-color: rgb(255, 255, 255);\"><span></span>前端菜单：前端菜单是游客访问网站看到的主菜单（左侧菜单），该菜单也只支持二级分类，即使一级菜单设置了超链接，也不可点击</p><p style=\"color: rgb(51, 51, 51);text-align: left;background-color: rgb(255, 255, 255);\"><span></span>底部菜单：底部菜单在游客访问网站时的底部显示（倒数第二排），底部菜单只持此一级菜单，二级菜单不显示</p><p style=\"color: rgb(51, 51, 51);text-align: left;background-color: rgb(255, 255, 255);\"><span></span>顶部菜单：顶部菜单在游客访问网站是的顶部，支持一级和二级（没有二级一级可点击，如果有二级菜单，一级菜超链接无效）</p><p style=\"color: rgb(51, 51, 51);text-align: left;background-color: rgb(255, 255, 255);\"><span></span>友情链接：友情链接在游客访问网站的底部，至支持一次菜单，二级菜单不显示<span><br/></span><span></span></p><p style=\"color: rgb(51, 51, 51);text-align: left;background-color: rgb(255, 255, 255);\"><img src=\"http://img.blog.csdn.net/20160413230916372?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center\" alt=\"\"/><br/></p><p style=\"color: rgb(51, 51, 51);text-align: left;background-color: rgb(255, 255, 255);\"><img src=\"http://img.blog.csdn.net/20160413232535864?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center\" alt=\"\"/><br/></p><p style=\"color: rgb(51, 51, 51);text-align: left;background-color: rgb(255, 255, 255);\">2. 菜单修改</p><p style=\"color: rgb(51, 51, 51);text-align: left;background-color: rgb(255, 255, 255);\"><span></span>进入后台，点击菜单管理，超级管理员和拥有权限的普通管理员可以看到菜单对应的【修改】【删除】【查看子菜单】，点击修改即可修改对应的菜单，默认进入显示的是【前端菜单】，可以在菜单列表的右上根据类型或菜单名搜索菜单，如下图：在【类型】栏点击输入框即可选着类型，链接可以自己输入，也可点击【选着地址】按钮进行选择。</p><p style=\"color: rgb(51, 51, 51);text-align: left;background-color: rgb(255, 255, 255);\"><span></span>在链接下拉选着中，显示了站内通用的地址，主要包括【后台链接】（后台管理员相关的链接）和【前端链接】（游客相关的链接）两种类型，其中包括：前后台模块列表页面，前后台接口列表页面，前端文章分类页面，后台菜单分类列表页面，文章分类列表页面，网站页面等，一级菜单必须选择类型，二级菜单不需要选择类型</p><p style=\"color: rgb(51, 51, 51);text-align: left;background-color: rgb(255, 255, 255);\"><img src=\"http://img.blog.csdn.net/20160413233104437?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center\" alt=\"\"/><br/></p><p style=\"color: rgb(51, 51, 51);text-align: left;background-color: rgb(255, 255, 255);\">3.菜单图标设置</p><p style=\"color: rgb(51, 51, 51);text-align: left;background-color: rgb(255, 255, 255);\"><span></span>后台一级菜单，前端一级菜单支持显示图标，类容为:&lt;i class=&#34;iconfont&#34;&gt;<span style=\"color: rgb(204, 0, 0);\">&amp;#xxxxx;</span>&lt;i&gt;，红色部分请根据需要显示的图标填写，目前支持的图标及对应的代码如下：</p><p style=\"color: rgb(51, 51, 51);text-align: left;background-color: rgb(255, 255, 255);\"><img src=\"http://img.blog.csdn.net/20160413234255339?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center\" alt=\"\"/><br/></p><p style=\"color: rgb(51, 51, 51);text-align: left;background-color: rgb(255, 255, 255);\">CSDN文章地址：<a href=\"http://blog.csdn.net/torrytang/article/details/51147823\" target=\"\">http://blog.csdn.net/torrytang/article/details/51147823</a><br/></p>', '1', 'ARTICLE', '0', '2016-04-13 23:47:35', '', null, '1', '帮助文档', '1', '0', '0', '', '');
INSERT INTO `webpage` VALUES ('a6716dfc-0a0b-4c6f-932c-faf7b50a61b8', '131', '12312', '<p>123213<br/></p>', '0', 'ARTICLE', '0', '2016-04-12 17:21:34', '', null, '1', '13213', '1', '0', '0', '', '');
INSERT INTO `webpage` VALUES ('bd3fbc06-ef88-43d3-bf5b-1631c854efcd', '项目二次开发环境搭建', 'CrapApi接口管理系统，是一个基于maven构建的javaweb项目\n文章将以eclipse作为开发工具进行项目搭建介绍\n本开源项目源代码托管于GitHub', '<p>构建准备：</p><ol><li>下载eclipse开发工具</li><li><a href=\"http://blog.csdn.net/torrytang/article/details/51114134\" target=\"\">安装git插件（用于从github获取源码）</a></li><li><a href=\"http://blog.csdn.net/torrytang/article/details/51114155\" target=\"\">安装maven插件（本项目是基于maven构建的）</a></li><li>GitHub源码仓库地址：<a href=\"https://github.com/EhsanTang/CrapApi.git\" target=\"\">https://github.com/EhsanTang/CrapApi.git</a></li><li>安装mysql数据库，本项目使用springMVC+hibernate开发，你也可以使用其他数据库（使用其它数据库请修改连接池等信息）</li></ol><p>开始导入项目：</p><ol><li>安装好插件后关闭eclipse并重新打开</li><li>部署数据库（mysql），数据库脚本地址：<a href=\"https://github.com/EhsanTang/CrapApi/tree/master/api\" target=\"\"></a><a href=\"https://github.com/EhsanTang/CrapApi/blob/master/api/%E6%95%B0%E6%8D%AE%E5%BA%93%E8%84%9A%E6%9C%AC.sql\" target=\"\">https://github.com/EhsanTang/CrapApi/blob/master/api/%E6%95%B0%E6%8D%AE%E5%BA%93%E8%84%9A%E6%9C%AC.sql</a></li><li>导入项目后修改数据库配置，配置文件见项目目录：CrapApi/api/src/main/resources/jdbc.properties</li><li>导入项目</li></ol><p><br/></p><div class=\"tc\"><img src=\"resources/upload/images/2016-04-10/181857892iau.png\" style=\"width: 50%;\"/></div><p><br/></p><div class=\"tc\"><img src=\"resources/upload/images/2016-04-10/181932yGjG8w.png\" style=\"width: 50%;\"/></div><p><br/></p><div class=\"tc\"><img src=\"resources/upload/images/2016-04-10/182014Hf5iui.png\" style=\"width: 50%;\"/></div><p><br/></p><div class=\"tc\"><img src=\"resources/upload/images/2016-04-10/1820286j185H.png\" style=\"width: 50%;\"/></div><p><br/></p><p>            5.修改log4j日志文件输入地址：根据开发系统或部署的系统，修改日志文件输出地址（下图为mac日志输出地址）</p><div class=\"tc\"><img src=\"resources/upload/images/2016-04-17/0257599QKMcy.png\" style=\"height: 330px;width: 601px;\"/></div><p><br/></p><p>点击next即可导入项目，导入项目后如果项目报错，请查看文章：<a href=\"http://blog.csdn.net/torrytang/article/details/51072468\" target=\"\" style=\"color: rgb(51, 122, 183);text-align: left;background-color: rgb(255, 255, 255);\">http://blog.csdn.net/torrytang/article/details/51072468</a><br/></p>', '0', 'ARTICLE', '0', '2016-04-10 09:26:13', '', null, '1', '帮助文档', '1', '0', '0', '', '');
