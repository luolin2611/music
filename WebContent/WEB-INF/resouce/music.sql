/*
 Navicat Premium Data Transfer

 Source Server         : local_connection
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost
 Source Database       : music

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : utf-8

 Date: 03/06/2020 10:30:32 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `music`
-- ----------------------------
DROP TABLE IF EXISTS `music`;
CREATE TABLE `music` (
  `music_id` varchar(50) NOT NULL,
  `author` varchar(50) DEFAULT NULL COMMENT '歌曲作者',
  `file_duration` varchar(20) DEFAULT NULL COMMENT '歌曲时长',
  `title` varchar(50) DEFAULT NULL COMMENT '歌曲标题',
  `add_sys_user_id` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '歌曲名称',
  `update_time` datetime DEFAULT NULL,
  `music_img_path` varchar(255) DEFAULT NULL COMMENT '歌曲简要图片',
  `status` varchar(2) DEFAULT NULL COMMENT '00 在用，01不可用',
  `music_dict_id` varchar(50) DEFAULT NULL,
  `music_file_path` varchar(255) DEFAULT NULL COMMENT '音乐文件路径',
  `singer_id` varchar(50) DEFAULT NULL COMMENT '演唱者ID',
  PRIMARY KEY (`music_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `music`
-- ----------------------------
BEGIN;
INSERT INTO `music` VALUES ('1b95f9b68061452284b44da1dd7b9f79619489a0501b4', '凤凰传奇', '03:41', '郎的诱惑 - 凤凰传奇', '13031415', '郎的诱惑', '2020-03-06 02:20:02', 'upload/title_file/1b95f9b68061452284b44da1dd7b9f79619489a0501b4.jpg', '00', '14933fc33cc0459488b57ace90c64aa8bd16bd404a664', 'upload/music_file/1b95f9b68061452284b44da1dd7b9f79619489a0501b4.wav', '868124de244e485f8c8c0edf5887df38e56a798e50984'), ('698f87c26abd453cbe0d75b750292cd86864864b5e214', '花粥', '03:06', '纸短情长 - 花粥', '13031415', '纸短情长', '2020-03-05 19:28:12', 'title_file/698f87c26abd453cbe0d75b750292cd86864864b5e214.jpg', '00', '14933fc33cc0459488b57ace90c64aa8bd16bd404a664', 'music_file/698f87c26abd453cbe0d75b750292cd86864864b5e214.flac', '868124de244e485f8c8c0edf5887df38e56a798e50984'), ('e814c7421205449c97b2d8066f0db34f14e732667cd44', '孟颖', '03:21', '一个人挺好 - 孟颖', '13031415', '一个人挺好', '2020-03-05 19:53:30', 'title_file/e814c7421205449c97b2d8066f0db34f14e732667cd44.jpg', '00', '14933fc33cc0459488b57ace90c64aa8bd16bd404a664', 'music_file/e814c7421205449c97b2d8066f0db34f14e732667cd44.flac', 'e81186521cfc4aabbd0d2ff9baa35252f972bd8d488f4');
COMMIT;

-- ----------------------------
--  Table structure for `music_dict`
-- ----------------------------
DROP TABLE IF EXISTS `music_dict`;
CREATE TABLE `music_dict` (
  `music_dict_id` varchar(50) NOT NULL,
  `dict_name` varchar(50) DEFAULT NULL COMMENT '专辑名称',
  `update_time` timestamp NULL DEFAULT NULL,
  `add_user_name` varchar(50) DEFAULT NULL,
  `dict_img_path` varchar(500) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL COMMENT '00在用 01不可使用',
  PRIMARY KEY (`music_dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `music_dict`
-- ----------------------------
BEGIN;
INSERT INTO `music_dict` VALUES ('14933fc33cc0459488b57ace90c64aa8bd16bd404a664', '抖音红曲', '2020-03-02 07:52:41', 'luolin', 'C:\\Users\\Administrator\\Desktop\\music\\dict_img14933fc33cc0459488b57ace90c64aa8bd16bd404a664.jpg', '00'), ('c31f6fb1d5c049529bb55b80181f519f8a2d4b9569034', '搞笑歌曲', '2019-04-21 11:23:16', 'dan47', 'C:\\Users\\Administrator\\Desktop\\music\\dict_imgc31f6fb1d5c049529bb55b80181f519f8a2d4b9569034.gif', '00'), ('ec360c087ba94ab8aa95354afa19f958b830a97226d44', '粤语歌曲集', '2019-04-20 23:03:58', 'rollin', 'C:\\Users\\Administrator\\Desktop\\music\\dict_imgec360c087ba94ab8aa95354afa19f958b830a97226d44.png', '00');
COMMIT;

-- ----------------------------
--  Table structure for `singer`
-- ----------------------------
DROP TABLE IF EXISTS `singer`;
CREATE TABLE `singer` (
  `singer_id` varchar(50) NOT NULL COMMENT '歌星ID',
  `singer_name` varchar(50) DEFAULT NULL COMMENT '歌星名字',
  `singer_cover_path` varchar(255) DEFAULT NULL COMMENT '歌星封面',
  `update_time` datetime DEFAULT NULL COMMENT '添加时间',
  `status` varchar(10) DEFAULT NULL COMMENT '00在用 01不可使用',
  `add_sys_user_id` varchar(50) DEFAULT NULL COMMENT '添加的用户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
--  Records of `singer`
-- ----------------------------
BEGIN;
INSERT INTO `singer` VALUES ('92364da599394359bfc8b4692a2b4aad824b4ff230554', null, 'upload/cover_file/92364da599394359bfc8b4692a2b4aad824b4ff230554.jpg', null, null, null), ('a1b6a646c8a04712a83248f26b0b540ee5860bc3ce3e4', null, 'upload/cover_file/a1b6a646c8a04712a83248f26b0b540ee5860bc3ce3e4.jpg', null, null, null), ('868124de244e485f8c8c0edf5887df38e56a798e50984', '花粥', 'upload/cover_file/868124de244e485f8c8c0edf5887df38e56a798e50984.jpg', '2020-03-05 23:05:54', '00', '13031415'), ('e81186521cfc4aabbd0d2ff9baa35252f972bd8d488f4', '凤凰传奇', 'upload/cover_file/e81186521cfc4aabbd0d2ff9baa35252f972bd8d488f4.jpg', '2020-03-06 01:53:53', '00', '13031415');
COMMIT;

-- ----------------------------
--  Table structure for `singer_img`
-- ----------------------------
DROP TABLE IF EXISTS `singer_img`;
CREATE TABLE `singer_img` (
  `img_id` varchar(50) NOT NULL DEFAULT '',
  `img_path` varchar(255) DEFAULT NULL,
  `singer_id` varchar(50) DEFAULT NULL COMMENT '所属歌星ID',
  `update_time` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL COMMENT '00在用 01不可使用',
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `singer_img`
-- ----------------------------
BEGIN;
INSERT INTO `singer_img` VALUES ('0228e4d1226b42899ffb4b3ba72ac308d29b0d7163954', 'upload/photo_file/868124de244e485f8c8c0edf5887df38e56a798e50984.jpg', '868124de244e485f8c8c0edf5887df38e56a798e50984', '2020-03-05 23:05:52', '00'), ('087d4792a8b24c9087c9051c1e38a6fad1356075b59c4', 'upload/photo_file/e81186521cfc4aabbd0d2ff9baa35252f972bd8d488f4.jpg', 'e81186521cfc4aabbd0d2ff9baa35252f972bd8d488f4', '2020-03-06 01:53:22', '00'), ('182d1e1800054dc0af7edf138692113490270816e9574', '/Users/luolin/Public/Project/JavaProject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/music/music_imgs_file/c2f0b8f04fac4fdcbf78cfa73f89f2a490bed9b3e2054.jpg', 'c2f0b8f04fac4fdcbf78cfa73f89f2a490bed9b3e2054', null, null), ('1b5c23086d8e459ea68686f243722dbaaac6986402c04', '/Users/luolin/Public/Project/JavaProject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/music/music_imgs_file/a01c63b1468d494095a40a7f2d96ca9fc318224357d54.jpg', 'a01c63b1468d494095a40a7f2d96ca9fc318224357d54', null, null), ('289b462cb038410ea1e69cfdff0ace277ba96aece2224', 'upload/photo_file/8c37c7d6b2aa4561ad9253436bbd59c0f66222a330084.jpg', '8c37c7d6b2aa4561ad9253436bbd59c0f66222a330084', '2020-03-05 22:24:31', '00'), ('3628b39d2b5542c6a43f66c05a882b9c4d5ae4f279a04', 'upload/photo_file/e81186521cfc4aabbd0d2ff9baa35252f972bd8d488f4.jpg', 'e81186521cfc4aabbd0d2ff9baa35252f972bd8d488f4', '2020-03-06 01:53:27', '00'), ('3761c58622164c3490f3adc7d55cc633dec123b41d1b4', '/Users/luolin/Public/Project/JavaProject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/music/music_imgs_file/e2361bebca62bb50f85ce31abe79f496_6083466409a14b95ad1f219881e3fd80593f04b681f04.jpg', '6083466409a14b95ad1f219881e3fd80593f04b681f04', null, null), ('64f38f0352db47bea6ab40aa1130dd7950464c6489444', 'music_imgs_file/698f87c26abd453cbe0d75b750292cd86864864b5e214.jpg', '698f87c26abd453cbe0d75b750292cd86864864b5e214', null, null), ('69601471218f445cb8b7c131ff2fe63b2c3c41f7c2684', '/Users/luolin/Public/Project/JavaProject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/music/music_imgs_file/111b9220162c7325303c886ba6fa1849_8d2d2cfa3cf7411cb08cc07b229d0c5f5380e7a1adf44.jpg', '8d2d2cfa3cf7411cb08cc07b229d0c5f5380e7a1adf44', null, null), ('6bb8e39a3b1e44c0964095c9a228f031b104aea1912b4', '/Users/luolin/Public/Project/JavaProject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/music/music_imgs_file/c889c6d40da273a69e6b91dd6e2f536d_8d2d2cfa3cf7411cb08cc07b229d0c5f5380e7a1adf44.jpg', '8d2d2cfa3cf7411cb08cc07b229d0c5f5380e7a1adf44', null, null), ('8e2d083720e94a869673eb4c13b14a77a0051be9d6724', '/Users/luolin/Public/Project/JavaProject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/music/music_imgs_file/c889c6d40da273a69e6b91dd6e2f536d_d2e264123d6c48af93b90e922c5ee46ed2777ba76c1d4.jpg', 'd2e264123d6c48af93b90e922c5ee46ed2777ba76c1d4', null, null), ('9a816ee55c9b48faa9aaa004438b24538eff3267efa94', 'upload/photo_file/a1b6a646c8a04712a83248f26b0b540ee5860bc3ce3e4.jpg', 'a1b6a646c8a04712a83248f26b0b540ee5860bc3ce3e4', '2020-03-05 23:02:35', '00'), ('9d654c978358402298bdd86d584d84ef0cc86a2c5ac34', '/Users/luolin/Public/Project/JavaProject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/music/music_imgs_file/1b4f8cb7e4ba4b388b4ad586abf8103f18e7cda9ce4e4.jpg', '1b4f8cb7e4ba4b388b4ad586abf8103f18e7cda9ce4e4', null, null), ('b99ec59383044a228093520efc268a59acb28b67fc784', 'upload/photo_file/a1b6a646c8a04712a83248f26b0b540ee5860bc3ce3e4.jpg', 'a1b6a646c8a04712a83248f26b0b540ee5860bc3ce3e4', '2020-03-05 23:02:39', '00'), ('bf53f20428254b1db7e4171e5d872490b19b268100f84', 'upload/photo_file/e81186521cfc4aabbd0d2ff9baa35252f972bd8d488f4.jpg', 'e81186521cfc4aabbd0d2ff9baa35252f972bd8d488f4', '2020-03-06 01:53:38', '00'), ('c44213ab894544d2b7938483545249b24bb1f03f775f4', 'upload/photo_file/e81186521cfc4aabbd0d2ff9baa35252f972bd8d488f4.jpg', 'e81186521cfc4aabbd0d2ff9baa35252f972bd8d488f4', '2020-03-06 01:53:33', '00'), ('d1feac3bd20e4dcfa008d5db4cf8d8ac54bc3c290e444', 'music_imgs_file/e814c7421205449c97b2d8066f0db34f14e732667cd44.jpg', 'e814c7421205449c97b2d8066f0db34f14e732667cd44', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` varchar(50) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(2) DEFAULT NULL COMMENT '用户是否可用 ：00 在用，01不可用',
  `user_level` varchar(2) DEFAULT NULL COMMENT '用户级别：01 拥有一切权限、 02 拥有上传、删除歌曲 、03 拥有上传歌曲 、04拥有删除歌曲、05游客',
  `real_name` varchar(20) DEFAULT NULL COMMENT '管理员昵称',
  `add_user_name` varchar(50) DEFAULT NULL COMMENT '添加者',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('13031415', 'rollin', '202CB962AC59075B964B07152D234B70', '2019-04-20 23:00:24', '00', '01', '黑腹内', '管理员'), ('8abdbd9711654b1a8166b9e59a4d9d2b0d0bd3068e104', 'dan47', '202CB962AC59075B964B07152D234B70', '2019-04-21 11:22:16', '00', '01', '哎呀我去', 'rollin'), ('d4ca5c0e111e49b4a044802ee60cf58fc0c03e0934bf4', 'luolin', '69215793FAFEC162B250B7525D1F65CB', '2020-03-02 07:37:57', '00', '02', '寒江孤影', 'rollin');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
