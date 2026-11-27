-- BSAMS database backup
-- Created: 2026-11-12 03:59:49

CREATE DATABASE IF NOT EXISTS `bsams` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `bsams`;
SET FOREIGN_KEY_CHECKS=0;
SET NAMES utf8mb4;

DROP TABLE IF EXISTS `attendance_records`;
CREATE TABLE `attendance_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int(10) unsigned NOT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `status` enum('present','late','absent') NOT NULL,
  `method` enum('simulated','hardware','manual','auto') NOT NULL,
  `match_score` decimal(6,2) DEFAULT NULL,
  `manual_reason` varchar(255) DEFAULT NULL,
  `recorded_by` int(10) unsigned DEFAULT NULL,
  `recorded_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_attendance_session_student` (`session_id`,`student_id`),
  KEY `idx_attendance_student` (`student_id`,`status`),
  KEY `fk_att_user` (`recorded_by`),
  CONSTRAINT `fk_att_session` FOREIGN KEY (`session_id`) REFERENCES `class_sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_att_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_att_user` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=464 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `attendance_records` VALUES ('1','1','1','present','simulated','95.72',NULL,'2','2026-10-20 11:03:00');
INSERT INTO `attendance_records` VALUES ('2','1','2','present','simulated','96.89',NULL,'2','2026-10-20 11:00:00');
INSERT INTO `attendance_records` VALUES ('3','1','3','absent','auto',NULL,NULL,NULL,'2026-10-20 13:00:00');
INSERT INTO `attendance_records` VALUES ('4','1','4','present','simulated','93.72',NULL,'2','2026-10-20 11:03:00');
INSERT INTO `attendance_records` VALUES ('5','1','5','absent','auto',NULL,NULL,NULL,'2026-10-20 13:00:00');
INSERT INTO `attendance_records` VALUES ('6','1','6','present','simulated','96.07',NULL,'2','2026-10-20 11:05:00');
INSERT INTO `attendance_records` VALUES ('7','1','7','absent','auto',NULL,NULL,NULL,'2026-10-20 13:00:00');
INSERT INTO `attendance_records` VALUES ('8','1','8','present','simulated','96.82',NULL,'2','2026-10-20 11:05:00');
INSERT INTO `attendance_records` VALUES ('9','1','9','present','simulated','97.55',NULL,'2','2026-10-20 11:03:00');
INSERT INTO `attendance_records` VALUES ('10','1','10','present','simulated','96.74',NULL,'2','2026-10-20 11:09:00');
INSERT INTO `attendance_records` VALUES ('11','2','1','present','simulated','95.92',NULL,'2','2026-10-22 11:08:00');
INSERT INTO `attendance_records` VALUES ('12','2','2','present','simulated','96.01',NULL,'2','2026-10-22 11:00:00');
INSERT INTO `attendance_records` VALUES ('13','2','3','present','simulated','95.22',NULL,'2','2026-10-22 11:07:00');
INSERT INTO `attendance_records` VALUES ('14','2','4','absent','auto',NULL,NULL,NULL,'2026-10-22 13:00:00');
INSERT INTO `attendance_records` VALUES ('15','2','5','absent','auto',NULL,NULL,NULL,'2026-10-22 13:00:00');
INSERT INTO `attendance_records` VALUES ('16','2','6','present','simulated','95.30',NULL,'2','2026-10-22 11:04:00');
INSERT INTO `attendance_records` VALUES ('17','2','7','present','simulated','93.68',NULL,'2','2026-10-22 11:07:00');
INSERT INTO `attendance_records` VALUES ('18','2','8','present','simulated','97.85',NULL,'2','2026-10-22 11:04:00');
INSERT INTO `attendance_records` VALUES ('19','2','9','present','simulated','98.69',NULL,'2','2026-10-22 11:08:00');
INSERT INTO `attendance_records` VALUES ('20','2','10','present','simulated','98.90',NULL,'2','2026-10-22 11:11:00');
INSERT INTO `attendance_records` VALUES ('21','3','1','present','simulated','96.15',NULL,'2','2026-10-27 11:12:00');
INSERT INTO `attendance_records` VALUES ('22','3','2','present','simulated','96.91',NULL,'2','2026-10-27 11:04:00');
INSERT INTO `attendance_records` VALUES ('23','3','3','present','simulated','97.58',NULL,'2','2026-10-27 11:04:00');
INSERT INTO `attendance_records` VALUES ('24','3','4','present','simulated','96.96',NULL,'2','2026-10-27 11:01:00');
INSERT INTO `attendance_records` VALUES ('25','3','5','late','simulated','93.33',NULL,'2','2026-10-27 11:32:00');
INSERT INTO `attendance_records` VALUES ('26','3','6','late','simulated','95.29',NULL,'2','2026-10-27 11:18:00');
INSERT INTO `attendance_records` VALUES ('27','3','7','absent','auto',NULL,NULL,NULL,'2026-10-27 13:00:00');
INSERT INTO `attendance_records` VALUES ('28','3','8','present','simulated','96.84',NULL,'2','2026-10-27 11:07:00');
INSERT INTO `attendance_records` VALUES ('29','3','9','present','simulated','94.32',NULL,'2','2026-10-27 11:01:00');
INSERT INTO `attendance_records` VALUES ('30','3','10','present','simulated','94.18',NULL,'2','2026-10-27 11:01:00');
INSERT INTO `attendance_records` VALUES ('31','4','1','present','simulated','93.36',NULL,'2','2026-10-29 11:02:00');
INSERT INTO `attendance_records` VALUES ('32','4','2','present','simulated','97.07',NULL,'2','2026-10-29 11:05:00');
INSERT INTO `attendance_records` VALUES ('33','4','3','present','simulated','95.60',NULL,'2','2026-10-29 11:04:00');
INSERT INTO `attendance_records` VALUES ('34','4','4','present','simulated','94.75',NULL,'2','2026-10-29 11:06:00');
INSERT INTO `attendance_records` VALUES ('35','4','5','absent','auto',NULL,NULL,NULL,'2026-10-29 13:00:00');
INSERT INTO `attendance_records` VALUES ('36','4','6','present','simulated','98.94',NULL,'2','2026-10-29 11:01:00');
INSERT INTO `attendance_records` VALUES ('37','4','7','absent','auto',NULL,NULL,NULL,'2026-10-29 13:00:00');
INSERT INTO `attendance_records` VALUES ('38','4','8','present','simulated','97.77',NULL,'2','2026-10-29 11:04:00');
INSERT INTO `attendance_records` VALUES ('39','4','9','present','simulated','94.77',NULL,'2','2026-10-29 11:04:00');
INSERT INTO `attendance_records` VALUES ('40','4','10','present','simulated','97.05',NULL,'2','2026-10-29 11:02:00');
INSERT INTO `attendance_records` VALUES ('41','5','1','present','simulated','96.97',NULL,'2','2026-11-03 11:03:00');
INSERT INTO `attendance_records` VALUES ('42','5','2','absent','auto',NULL,NULL,NULL,'2026-11-03 13:00:00');
INSERT INTO `attendance_records` VALUES ('43','5','3','present','simulated','95.63',NULL,'2','2026-11-03 11:08:00');
INSERT INTO `attendance_records` VALUES ('44','5','4','present','simulated','94.96',NULL,'2','2026-11-03 11:06:00');
INSERT INTO `attendance_records` VALUES ('45','5','5','present','simulated','93.69',NULL,'2','2026-11-03 11:09:00');
INSERT INTO `attendance_records` VALUES ('46','5','6','present','simulated','97.04',NULL,'2','2026-11-03 11:07:00');
INSERT INTO `attendance_records` VALUES ('47','5','7','absent','auto',NULL,NULL,NULL,'2026-11-03 13:00:00');
INSERT INTO `attendance_records` VALUES ('48','5','8','absent','auto',NULL,NULL,NULL,'2026-11-03 13:00:00');
INSERT INTO `attendance_records` VALUES ('49','5','9','late','simulated','95.55',NULL,'2','2026-11-03 11:27:00');
INSERT INTO `attendance_records` VALUES ('50','5','10','present','simulated','93.43',NULL,'2','2026-11-03 11:00:00');
INSERT INTO `attendance_records` VALUES ('51','6','1','present','simulated','97.21',NULL,'2','2026-11-05 11:05:00');
INSERT INTO `attendance_records` VALUES ('52','6','2','present','simulated','93.93',NULL,'2','2026-11-05 11:11:00');
INSERT INTO `attendance_records` VALUES ('53','6','3','present','simulated','94.34',NULL,'2','2026-11-05 11:12:00');
INSERT INTO `attendance_records` VALUES ('54','6','4','present','simulated','94.30',NULL,'2','2026-11-05 11:06:00');
INSERT INTO `attendance_records` VALUES ('55','6','5','absent','auto',NULL,NULL,NULL,'2026-11-05 13:00:00');
INSERT INTO `attendance_records` VALUES ('56','6','6','present','simulated','93.95',NULL,'2','2026-11-05 11:05:00');
INSERT INTO `attendance_records` VALUES ('57','6','7','present','simulated','95.23',NULL,'2','2026-11-05 11:01:00');
INSERT INTO `attendance_records` VALUES ('58','6','8','present','simulated','96.63',NULL,'2','2026-11-05 11:03:00');
INSERT INTO `attendance_records` VALUES ('59','6','9','present','simulated','95.60',NULL,'2','2026-11-05 11:08:00');
INSERT INTO `attendance_records` VALUES ('60','6','10','late','simulated','94.31',NULL,'2','2026-11-05 11:29:00');
INSERT INTO `attendance_records` VALUES ('61','7','1','present','simulated','95.59',NULL,'2','2026-11-10 11:10:00');
INSERT INTO `attendance_records` VALUES ('62','7','2','present','simulated','96.25',NULL,'2','2026-11-10 11:02:00');
INSERT INTO `attendance_records` VALUES ('63','7','3','present','simulated','98.44',NULL,'2','2026-11-10 11:01:00');
INSERT INTO `attendance_records` VALUES ('64','7','4','present','simulated','96.90',NULL,'2','2026-11-10 11:03:00');
INSERT INTO `attendance_records` VALUES ('65','7','5','present','simulated','93.30',NULL,'2','2026-11-10 11:03:00');
INSERT INTO `attendance_records` VALUES ('66','7','6','present','simulated','97.30',NULL,'2','2026-11-10 11:07:00');
INSERT INTO `attendance_records` VALUES ('67','7','7','absent','auto',NULL,NULL,NULL,'2026-11-10 13:00:00');
INSERT INTO `attendance_records` VALUES ('68','7','8','present','simulated','96.55',NULL,'2','2026-11-10 11:07:00');
INSERT INTO `attendance_records` VALUES ('69','7','9','present','simulated','98.25',NULL,'2','2026-11-10 11:02:00');
INSERT INTO `attendance_records` VALUES ('70','7','10','absent','auto',NULL,NULL,NULL,'2026-11-10 13:00:00');
INSERT INTO `attendance_records` VALUES ('71','8','1','present','simulated','97.41',NULL,'2','2026-10-20 11:07:00');
INSERT INTO `attendance_records` VALUES ('72','8','2','present','simulated','95.36',NULL,'2','2026-10-20 11:03:00');
INSERT INTO `attendance_records` VALUES ('73','8','3','absent','auto',NULL,NULL,NULL,'2026-10-20 13:00:00');
INSERT INTO `attendance_records` VALUES ('74','8','4','present','simulated','97.53',NULL,'2','2026-10-20 11:11:00');
INSERT INTO `attendance_records` VALUES ('75','8','5','present','simulated','95.12',NULL,'2','2026-10-20 11:05:00');
INSERT INTO `attendance_records` VALUES ('76','8','6','absent','auto',NULL,NULL,NULL,'2026-10-20 13:00:00');
INSERT INTO `attendance_records` VALUES ('77','8','7','absent','auto',NULL,NULL,NULL,'2026-10-20 13:00:00');
INSERT INTO `attendance_records` VALUES ('78','8','8','present','simulated','94.32',NULL,'2','2026-10-20 11:07:00');
INSERT INTO `attendance_records` VALUES ('79','8','9','present','simulated','96.00',NULL,'2','2026-10-20 11:06:00');
INSERT INTO `attendance_records` VALUES ('80','8','10','present','simulated','97.29',NULL,'2','2026-10-20 11:11:00');
INSERT INTO `attendance_records` VALUES ('81','9','1','present','simulated','96.28',NULL,'2','2026-10-22 11:10:00');
INSERT INTO `attendance_records` VALUES ('82','9','2','present','simulated','98.96',NULL,'2','2026-10-22 11:07:00');
INSERT INTO `attendance_records` VALUES ('83','9','3','present','simulated','98.52',NULL,'2','2026-10-22 11:03:00');
INSERT INTO `attendance_records` VALUES ('84','9','4','absent','auto',NULL,NULL,NULL,'2026-10-22 13:00:00');
INSERT INTO `attendance_records` VALUES ('85','9','5','absent','auto',NULL,NULL,NULL,'2026-10-22 13:00:00');
INSERT INTO `attendance_records` VALUES ('86','9','6','late','simulated','94.65',NULL,'2','2026-10-22 11:17:00');
INSERT INTO `attendance_records` VALUES ('87','9','7','late','simulated','97.82',NULL,'2','2026-10-22 11:17:00');
INSERT INTO `attendance_records` VALUES ('88','9','8','present','simulated','98.00',NULL,'2','2026-10-22 11:03:00');
INSERT INTO `attendance_records` VALUES ('89','9','9','late','simulated','95.30',NULL,'2','2026-10-22 11:23:00');
INSERT INTO `attendance_records` VALUES ('90','9','10','absent','auto',NULL,NULL,NULL,'2026-10-22 13:00:00');
INSERT INTO `attendance_records` VALUES ('91','10','1','late','simulated','95.25',NULL,'2','2026-10-27 11:38:00');
INSERT INTO `attendance_records` VALUES ('92','10','2','present','simulated','93.62',NULL,'2','2026-10-27 11:10:00');
INSERT INTO `attendance_records` VALUES ('93','10','3','present','simulated','97.30',NULL,'2','2026-10-27 11:09:00');
INSERT INTO `attendance_records` VALUES ('94','10','4','present','simulated','94.87',NULL,'2','2026-10-27 11:11:00');
INSERT INTO `attendance_records` VALUES ('95','10','5','present','simulated','93.71',NULL,'2','2026-10-27 11:12:00');
INSERT INTO `attendance_records` VALUES ('96','10','6','present','simulated','97.62',NULL,'2','2026-10-27 11:03:00');
INSERT INTO `attendance_records` VALUES ('97','10','7','present','simulated','93.18',NULL,'2','2026-10-27 11:08:00');
INSERT INTO `attendance_records` VALUES ('98','10','8','present','simulated','94.23',NULL,'2','2026-10-27 11:02:00');
INSERT INTO `attendance_records` VALUES ('99','10','9','absent','auto',NULL,NULL,NULL,'2026-10-27 13:00:00');
INSERT INTO `attendance_records` VALUES ('100','10','10','present','simulated','94.05',NULL,'2','2026-10-27 11:12:00');
INSERT INTO `attendance_records` VALUES ('101','11','1','present','simulated','94.40',NULL,'2','2026-10-29 11:03:00');
INSERT INTO `attendance_records` VALUES ('102','11','2','present','simulated','94.82',NULL,'2','2026-10-29 11:11:00');
INSERT INTO `attendance_records` VALUES ('103','11','3','present','simulated','98.92',NULL,'2','2026-10-29 11:06:00');
INSERT INTO `attendance_records` VALUES ('104','11','4','present','simulated','98.80',NULL,'2','2026-10-29 11:05:00');
INSERT INTO `attendance_records` VALUES ('105','11','5','present','simulated','98.78',NULL,'2','2026-10-29 11:08:00');
INSERT INTO `attendance_records` VALUES ('106','11','6','present','simulated','96.56',NULL,'2','2026-10-29 11:07:00');
INSERT INTO `attendance_records` VALUES ('107','11','7','present','simulated','96.69',NULL,'2','2026-10-29 11:03:00');
INSERT INTO `attendance_records` VALUES ('108','11','8','present','simulated','94.88',NULL,'2','2026-10-29 11:04:00');
INSERT INTO `attendance_records` VALUES ('109','11','9','present','simulated','99.00',NULL,'2','2026-10-29 11:05:00');
INSERT INTO `attendance_records` VALUES ('110','11','10','present','simulated','96.88',NULL,'2','2026-10-29 11:11:00');
INSERT INTO `attendance_records` VALUES ('111','12','1','late','simulated','94.05',NULL,'2','2026-11-03 11:35:00');
INSERT INTO `attendance_records` VALUES ('112','12','2','present','simulated','96.99',NULL,'2','2026-11-03 11:06:00');
INSERT INTO `attendance_records` VALUES ('113','12','3','present','simulated','96.15',NULL,'2','2026-11-03 11:03:00');
INSERT INTO `attendance_records` VALUES ('114','12','4','present','simulated','94.19',NULL,'2','2026-11-03 11:00:00');
INSERT INTO `attendance_records` VALUES ('115','12','5','present','simulated','98.95',NULL,'2','2026-11-03 11:12:00');
INSERT INTO `attendance_records` VALUES ('116','12','6','present','simulated','95.18',NULL,'2','2026-11-03 11:08:00');
INSERT INTO `attendance_records` VALUES ('117','12','7','present','simulated','93.18',NULL,'2','2026-11-03 11:07:00');
INSERT INTO `attendance_records` VALUES ('118','12','8','present','simulated','94.63',NULL,'2','2026-11-03 11:11:00');
INSERT INTO `attendance_records` VALUES ('119','12','9','present','simulated','97.25',NULL,'2','2026-11-03 11:00:00');
INSERT INTO `attendance_records` VALUES ('120','12','10','present','simulated','94.33',NULL,'2','2026-11-03 11:07:00');
INSERT INTO `attendance_records` VALUES ('121','13','1','present','simulated','96.44',NULL,'2','2026-11-05 11:10:00');
INSERT INTO `attendance_records` VALUES ('122','13','2','present','simulated','95.35',NULL,'2','2026-11-05 11:03:00');
INSERT INTO `attendance_records` VALUES ('123','13','3','present','simulated','93.35',NULL,'2','2026-11-05 11:00:00');
INSERT INTO `attendance_records` VALUES ('124','13','4','present','simulated','96.46',NULL,'2','2026-11-05 11:09:00');
INSERT INTO `attendance_records` VALUES ('125','13','5','present','simulated','96.29',NULL,'2','2026-11-05 11:12:00');
INSERT INTO `attendance_records` VALUES ('126','13','6','absent','auto',NULL,NULL,NULL,'2026-11-05 13:00:00');
INSERT INTO `attendance_records` VALUES ('127','13','7','absent','auto',NULL,NULL,NULL,'2026-11-05 13:00:00');
INSERT INTO `attendance_records` VALUES ('128','13','8','late','simulated','94.27',NULL,'2','2026-11-05 11:19:00');
INSERT INTO `attendance_records` VALUES ('129','13','9','absent','auto',NULL,NULL,NULL,'2026-11-05 13:00:00');
INSERT INTO `attendance_records` VALUES ('130','13','10','present','simulated','96.62',NULL,'2','2026-11-05 11:00:00');
INSERT INTO `attendance_records` VALUES ('131','14','1','present','simulated','96.87',NULL,'2','2026-11-10 11:10:00');
INSERT INTO `attendance_records` VALUES ('132','14','2','present','simulated','96.73',NULL,'2','2026-11-10 11:08:00');
INSERT INTO `attendance_records` VALUES ('133','14','3','present','simulated','93.62',NULL,'2','2026-11-10 11:03:00');
INSERT INTO `attendance_records` VALUES ('134','14','4','present','simulated','97.80',NULL,'2','2026-11-10 11:00:00');
INSERT INTO `attendance_records` VALUES ('135','14','5','absent','auto',NULL,NULL,NULL,'2026-11-10 13:00:00');
INSERT INTO `attendance_records` VALUES ('136','14','6','present','simulated','97.07',NULL,'2','2026-11-10 11:04:00');
INSERT INTO `attendance_records` VALUES ('137','14','7','absent','auto',NULL,NULL,NULL,'2026-11-10 13:00:00');
INSERT INTO `attendance_records` VALUES ('138','14','8','present','simulated','96.83',NULL,'2','2026-11-10 11:10:00');
INSERT INTO `attendance_records` VALUES ('139','14','9','present','simulated','94.46',NULL,'2','2026-11-10 11:11:00');
INSERT INTO `attendance_records` VALUES ('140','14','10','present','simulated','93.62',NULL,'2','2026-11-10 11:08:00');
INSERT INTO `attendance_records` VALUES ('141','15','1','late','simulated','97.12',NULL,'3','2026-10-20 11:17:00');
INSERT INTO `attendance_records` VALUES ('142','15','2','present','simulated','96.10',NULL,'3','2026-10-20 11:01:00');
INSERT INTO `attendance_records` VALUES ('143','15','3','present','simulated','96.88',NULL,'3','2026-10-20 11:05:00');
INSERT INTO `attendance_records` VALUES ('144','15','4','late','simulated','98.45',NULL,'3','2026-10-20 11:29:00');
INSERT INTO `attendance_records` VALUES ('145','15','5','present','simulated','97.05',NULL,'3','2026-10-20 11:09:00');
INSERT INTO `attendance_records` VALUES ('146','15','6','absent','auto',NULL,NULL,NULL,'2026-10-20 13:00:00');
INSERT INTO `attendance_records` VALUES ('147','15','7','absent','auto',NULL,NULL,NULL,'2026-10-20 13:00:00');
INSERT INTO `attendance_records` VALUES ('148','15','8','present','simulated','97.32',NULL,'3','2026-10-20 11:04:00');
INSERT INTO `attendance_records` VALUES ('149','15','9','present','simulated','96.28',NULL,'3','2026-10-20 11:10:00');
INSERT INTO `attendance_records` VALUES ('150','15','10','present','simulated','94.53',NULL,'3','2026-10-20 11:04:00');
INSERT INTO `attendance_records` VALUES ('151','16','1','present','simulated','96.90',NULL,'3','2026-10-22 11:06:00');
INSERT INTO `attendance_records` VALUES ('152','16','2','present','simulated','98.74',NULL,'3','2026-10-22 11:08:00');
INSERT INTO `attendance_records` VALUES ('153','16','3','present','simulated','97.53',NULL,'3','2026-10-22 11:11:00');
INSERT INTO `attendance_records` VALUES ('154','16','4','present','simulated','96.30',NULL,'3','2026-10-22 11:04:00');
INSERT INTO `attendance_records` VALUES ('155','16','5','absent','auto',NULL,NULL,NULL,'2026-10-22 13:00:00');
INSERT INTO `attendance_records` VALUES ('156','16','6','present','simulated','95.59',NULL,'3','2026-10-22 11:03:00');
INSERT INTO `attendance_records` VALUES ('157','16','7','absent','auto',NULL,NULL,NULL,'2026-10-22 13:00:00');
INSERT INTO `attendance_records` VALUES ('158','16','8','present','simulated','97.15',NULL,'3','2026-10-22 11:00:00');
INSERT INTO `attendance_records` VALUES ('159','16','9','present','simulated','98.58',NULL,'3','2026-10-22 11:06:00');
INSERT INTO `attendance_records` VALUES ('160','16','10','absent','auto',NULL,NULL,NULL,'2026-10-22 13:00:00');
INSERT INTO `attendance_records` VALUES ('161','17','1','present','simulated','94.71',NULL,'3','2026-10-27 11:05:00');
INSERT INTO `attendance_records` VALUES ('162','17','2','absent','auto',NULL,NULL,NULL,'2026-10-27 13:00:00');
INSERT INTO `attendance_records` VALUES ('163','17','3','present','simulated','96.93',NULL,'3','2026-10-27 11:05:00');
INSERT INTO `attendance_records` VALUES ('164','17','4','present','simulated','97.14',NULL,'3','2026-10-27 11:03:00');
INSERT INTO `attendance_records` VALUES ('165','17','5','present','simulated','98.13',NULL,'3','2026-10-27 11:12:00');
INSERT INTO `attendance_records` VALUES ('166','17','6','present','simulated','93.66',NULL,'3','2026-10-27 11:04:00');
INSERT INTO `attendance_records` VALUES ('167','17','7','present','simulated','96.74',NULL,'3','2026-10-27 11:01:00');
INSERT INTO `attendance_records` VALUES ('168','17','8','present','simulated','98.77',NULL,'3','2026-10-27 11:10:00');
INSERT INTO `attendance_records` VALUES ('169','17','9','present','simulated','97.29',NULL,'3','2026-10-27 11:06:00');
INSERT INTO `attendance_records` VALUES ('170','17','10','present','simulated','97.18',NULL,'3','2026-10-27 11:09:00');
INSERT INTO `attendance_records` VALUES ('171','18','1','present','simulated','96.47',NULL,'3','2026-10-29 11:02:00');
INSERT INTO `attendance_records` VALUES ('172','18','2','present','simulated','97.83',NULL,'3','2026-10-29 11:09:00');
INSERT INTO `attendance_records` VALUES ('173','18','3','present','simulated','94.85',NULL,'3','2026-10-29 11:01:00');
INSERT INTO `attendance_records` VALUES ('174','18','4','present','simulated','96.33',NULL,'3','2026-10-29 11:10:00');
INSERT INTO `attendance_records` VALUES ('175','18','5','present','simulated','98.37',NULL,'3','2026-10-29 11:08:00');
INSERT INTO `attendance_records` VALUES ('176','18','6','present','simulated','96.35',NULL,'3','2026-10-29 11:06:00');
INSERT INTO `attendance_records` VALUES ('177','18','7','present','simulated','96.80',NULL,'3','2026-10-29 11:00:00');
INSERT INTO `attendance_records` VALUES ('178','18','8','present','simulated','97.79',NULL,'3','2026-10-29 11:05:00');
INSERT INTO `attendance_records` VALUES ('179','18','9','present','simulated','93.87',NULL,'3','2026-10-29 11:10:00');
INSERT INTO `attendance_records` VALUES ('180','18','10','late','simulated','94.48',NULL,'3','2026-10-29 11:27:00');
INSERT INTO `attendance_records` VALUES ('181','19','1','present','simulated','97.21',NULL,'3','2026-11-03 11:09:00');
INSERT INTO `attendance_records` VALUES ('182','19','2','present','simulated','94.95',NULL,'3','2026-11-03 11:02:00');
INSERT INTO `attendance_records` VALUES ('183','19','3','present','simulated','95.99',NULL,'3','2026-11-03 11:12:00');
INSERT INTO `attendance_records` VALUES ('184','19','4','late','simulated','97.10',NULL,'3','2026-11-03 11:21:00');
INSERT INTO `attendance_records` VALUES ('185','19','5','absent','auto',NULL,NULL,NULL,'2026-11-03 13:00:00');
INSERT INTO `attendance_records` VALUES ('186','19','6','present','simulated','97.75',NULL,'3','2026-11-03 11:09:00');
INSERT INTO `attendance_records` VALUES ('187','19','7','absent','auto',NULL,NULL,NULL,'2026-11-03 13:00:00');
INSERT INTO `attendance_records` VALUES ('188','19','8','present','simulated','97.42',NULL,'3','2026-11-03 11:12:00');
INSERT INTO `attendance_records` VALUES ('189','19','9','late','simulated','98.99',NULL,'3','2026-11-03 11:35:00');
INSERT INTO `attendance_records` VALUES ('190','19','10','present','simulated','96.63',NULL,'3','2026-11-03 11:07:00');
INSERT INTO `attendance_records` VALUES ('191','20','1','present','simulated','94.10',NULL,'3','2026-11-05 11:08:00');
INSERT INTO `attendance_records` VALUES ('192','20','2','present','simulated','98.00',NULL,'3','2026-11-05 11:11:00');
INSERT INTO `attendance_records` VALUES ('193','20','3','absent','auto',NULL,NULL,NULL,'2026-11-05 13:00:00');
INSERT INTO `attendance_records` VALUES ('194','20','4','present','simulated','98.81',NULL,'3','2026-11-05 11:03:00');
INSERT INTO `attendance_records` VALUES ('195','20','5','present','simulated','93.75',NULL,'3','2026-11-05 11:06:00');
INSERT INTO `attendance_records` VALUES ('196','20','6','absent','auto',NULL,NULL,NULL,'2026-11-05 13:00:00');
INSERT INTO `attendance_records` VALUES ('197','20','7','present','simulated','97.22',NULL,'3','2026-11-05 11:05:00');
INSERT INTO `attendance_records` VALUES ('198','20','8','present','simulated','93.61',NULL,'3','2026-11-05 11:11:00');
INSERT INTO `attendance_records` VALUES ('199','20','9','absent','auto',NULL,NULL,NULL,'2026-11-05 13:00:00');
INSERT INTO `attendance_records` VALUES ('200','20','10','absent','auto',NULL,NULL,NULL,'2026-11-05 13:00:00');
INSERT INTO `attendance_records` VALUES ('201','21','1','present','simulated','96.34',NULL,'3','2026-11-10 11:11:00');
INSERT INTO `attendance_records` VALUES ('202','21','2','present','simulated','96.40',NULL,'3','2026-11-10 11:06:00');
INSERT INTO `attendance_records` VALUES ('203','21','3','present','simulated','95.91',NULL,'3','2026-11-10 11:04:00');
INSERT INTO `attendance_records` VALUES ('204','21','4','present','simulated','97.04',NULL,'3','2026-11-10 11:12:00');
INSERT INTO `attendance_records` VALUES ('205','21','5','present','simulated','98.53',NULL,'3','2026-11-10 11:01:00');
INSERT INTO `attendance_records` VALUES ('206','21','6','present','simulated','93.89',NULL,'3','2026-11-10 11:05:00');
INSERT INTO `attendance_records` VALUES ('207','21','7','present','simulated','95.00',NULL,'3','2026-11-10 11:07:00');
INSERT INTO `attendance_records` VALUES ('208','21','8','present','simulated','96.24',NULL,'3','2026-11-10 11:06:00');
INSERT INTO `attendance_records` VALUES ('209','21','9','present','simulated','95.74',NULL,'3','2026-11-10 11:02:00');
INSERT INTO `attendance_records` VALUES ('210','21','10','present','simulated','95.28',NULL,'3','2026-11-10 11:08:00');
INSERT INTO `attendance_records` VALUES ('211','22','1','present','simulated','93.08',NULL,'3','2026-10-19 08:02:00');
INSERT INTO `attendance_records` VALUES ('212','22','2','present','simulated','98.40',NULL,'3','2026-10-19 08:02:00');
INSERT INTO `attendance_records` VALUES ('213','22','3','absent','auto',NULL,NULL,NULL,'2026-10-19 10:00:00');
INSERT INTO `attendance_records` VALUES ('214','22','4','present','simulated','95.60',NULL,'3','2026-10-19 08:11:00');
INSERT INTO `attendance_records` VALUES ('215','22','5','present','simulated','97.47',NULL,'3','2026-10-19 08:11:00');
INSERT INTO `attendance_records` VALUES ('216','22','6','absent','auto',NULL,NULL,NULL,'2026-10-19 10:00:00');
INSERT INTO `attendance_records` VALUES ('217','22','7','absent','auto',NULL,NULL,NULL,'2026-10-19 10:00:00');
INSERT INTO `attendance_records` VALUES ('218','22','8','present','simulated','94.15',NULL,'3','2026-10-19 08:07:00');
INSERT INTO `attendance_records` VALUES ('219','22','9','present','simulated','98.97',NULL,'3','2026-10-19 08:08:00');
INSERT INTO `attendance_records` VALUES ('220','22','10','present','simulated','93.63',NULL,'3','2026-10-19 08:07:00');
INSERT INTO `attendance_records` VALUES ('221','23','1','late','simulated','94.89',NULL,'3','2026-10-21 08:35:00');
INSERT INTO `attendance_records` VALUES ('222','23','2','present','simulated','96.55',NULL,'3','2026-10-21 08:12:00');
INSERT INTO `attendance_records` VALUES ('223','23','3','present','simulated','97.96',NULL,'3','2026-10-21 08:05:00');
INSERT INTO `attendance_records` VALUES ('224','23','4','present','simulated','95.27',NULL,'3','2026-10-21 08:04:00');
INSERT INTO `attendance_records` VALUES ('225','23','5','present','simulated','93.52',NULL,'3','2026-10-21 08:00:00');
INSERT INTO `attendance_records` VALUES ('226','23','6','absent','auto',NULL,NULL,NULL,'2026-10-21 10:00:00');
INSERT INTO `attendance_records` VALUES ('227','23','7','present','simulated','97.29',NULL,'3','2026-10-21 08:01:00');
INSERT INTO `attendance_records` VALUES ('228','23','8','present','simulated','98.25',NULL,'3','2026-10-21 08:10:00');
INSERT INTO `attendance_records` VALUES ('229','23','9','late','simulated','93.48',NULL,'3','2026-10-21 08:33:00');
INSERT INTO `attendance_records` VALUES ('230','23','10','present','simulated','93.39',NULL,'3','2026-10-21 08:07:00');
INSERT INTO `attendance_records` VALUES ('231','24','1','late','simulated','94.12',NULL,'3','2026-10-26 08:21:00');
INSERT INTO `attendance_records` VALUES ('232','24','2','present','simulated','94.39',NULL,'3','2026-10-26 08:11:00');
INSERT INTO `attendance_records` VALUES ('233','24','3','present','simulated','94.27',NULL,'3','2026-10-26 08:05:00');
INSERT INTO `attendance_records` VALUES ('234','24','4','present','simulated','95.25',NULL,'3','2026-10-26 08:10:00');
INSERT INTO `attendance_records` VALUES ('235','24','5','present','simulated','98.67',NULL,'3','2026-10-26 08:01:00');
INSERT INTO `attendance_records` VALUES ('236','24','6','present','simulated','94.54',NULL,'3','2026-10-26 08:10:00');
INSERT INTO `attendance_records` VALUES ('237','24','7','present','simulated','97.64',NULL,'3','2026-10-26 08:10:00');
INSERT INTO `attendance_records` VALUES ('238','24','8','present','simulated','93.48',NULL,'3','2026-10-26 08:04:00');
INSERT INTO `attendance_records` VALUES ('239','24','9','present','simulated','96.11',NULL,'3','2026-10-26 08:02:00');
INSERT INTO `attendance_records` VALUES ('240','24','10','present','simulated','95.10',NULL,'3','2026-10-26 08:05:00');
INSERT INTO `attendance_records` VALUES ('241','25','1','present','simulated','98.03',NULL,'3','2026-10-28 08:05:00');
INSERT INTO `attendance_records` VALUES ('242','25','2','late','simulated','95.15',NULL,'3','2026-10-28 08:27:00');
INSERT INTO `attendance_records` VALUES ('243','25','3','absent','auto',NULL,NULL,NULL,'2026-10-28 10:00:00');
INSERT INTO `attendance_records` VALUES ('244','25','4','present','simulated','97.97',NULL,'3','2026-10-28 08:12:00');
INSERT INTO `attendance_records` VALUES ('245','25','5','present','simulated','95.11',NULL,'3','2026-10-28 08:10:00');
INSERT INTO `attendance_records` VALUES ('246','25','6','present','simulated','95.12',NULL,'3','2026-10-28 08:06:00');
INSERT INTO `attendance_records` VALUES ('247','25','7','present','simulated','93.27',NULL,'3','2026-10-28 08:11:00');
INSERT INTO `attendance_records` VALUES ('248','25','8','present','simulated','94.19',NULL,'3','2026-10-28 08:01:00');
INSERT INTO `attendance_records` VALUES ('249','25','9','absent','auto',NULL,NULL,NULL,'2026-10-28 10:00:00');
INSERT INTO `attendance_records` VALUES ('250','25','10','present','simulated','93.93',NULL,'3','2026-10-28 08:05:00');
INSERT INTO `attendance_records` VALUES ('251','26','1','present','simulated','93.37',NULL,'3','2026-11-02 08:02:00');
INSERT INTO `attendance_records` VALUES ('252','26','2','present','simulated','98.43',NULL,'3','2026-11-02 08:00:00');
INSERT INTO `attendance_records` VALUES ('253','26','3','present','simulated','95.75',NULL,'3','2026-11-02 08:03:00');
INSERT INTO `attendance_records` VALUES ('254','26','4','present','simulated','97.04',NULL,'3','2026-11-02 08:11:00');
INSERT INTO `attendance_records` VALUES ('255','26','5','present','simulated','98.17',NULL,'3','2026-11-02 08:02:00');
INSERT INTO `attendance_records` VALUES ('256','26','6','late','simulated','94.36',NULL,'3','2026-11-02 08:31:00');
INSERT INTO `attendance_records` VALUES ('257','26','7','present','simulated','95.59',NULL,'3','2026-11-02 08:03:00');
INSERT INTO `attendance_records` VALUES ('258','26','8','present','simulated','97.97',NULL,'3','2026-11-02 08:04:00');
INSERT INTO `attendance_records` VALUES ('259','26','9','present','simulated','98.84',NULL,'3','2026-11-02 08:07:00');
INSERT INTO `attendance_records` VALUES ('260','26','10','absent','auto',NULL,NULL,NULL,'2026-11-02 10:00:00');
INSERT INTO `attendance_records` VALUES ('261','27','1','late','simulated','96.57',NULL,'3','2026-11-04 08:30:00');
INSERT INTO `attendance_records` VALUES ('262','27','2','present','simulated','98.55',NULL,'3','2026-11-04 08:09:00');
INSERT INTO `attendance_records` VALUES ('263','27','3','present','simulated','98.93',NULL,'3','2026-11-04 08:05:00');
INSERT INTO `attendance_records` VALUES ('264','27','4','present','simulated','96.94',NULL,'3','2026-11-04 08:06:00');
INSERT INTO `attendance_records` VALUES ('265','27','5','present','simulated','96.34',NULL,'3','2026-11-04 08:12:00');
INSERT INTO `attendance_records` VALUES ('266','27','6','present','simulated','96.45',NULL,'3','2026-11-04 08:03:00');
INSERT INTO `attendance_records` VALUES ('267','27','7','absent','auto',NULL,NULL,NULL,'2026-11-04 10:00:00');
INSERT INTO `attendance_records` VALUES ('268','27','8','present','simulated','93.73',NULL,'3','2026-11-04 08:03:00');
INSERT INTO `attendance_records` VALUES ('269','27','9','present','simulated','93.08',NULL,'3','2026-11-04 08:01:00');
INSERT INTO `attendance_records` VALUES ('270','27','10','present','simulated','98.01',NULL,'3','2026-11-04 08:10:00');
INSERT INTO `attendance_records` VALUES ('271','28','1','present','simulated','95.21',NULL,'3','2026-11-09 08:11:00');
INSERT INTO `attendance_records` VALUES ('272','28','2','present','simulated','96.93',NULL,'3','2026-11-09 08:03:00');
INSERT INTO `attendance_records` VALUES ('273','28','3','late','simulated','94.13',NULL,'3','2026-11-09 08:28:00');
INSERT INTO `attendance_records` VALUES ('274','28','4','present','simulated','95.49',NULL,'3','2026-11-09 08:01:00');
INSERT INTO `attendance_records` VALUES ('275','28','5','present','simulated','94.96',NULL,'3','2026-11-09 08:01:00');
INSERT INTO `attendance_records` VALUES ('276','28','6','present','simulated','98.97',NULL,'3','2026-11-09 08:03:00');
INSERT INTO `attendance_records` VALUES ('277','28','7','absent','auto',NULL,NULL,NULL,'2026-11-09 10:00:00');
INSERT INTO `attendance_records` VALUES ('278','28','8','present','simulated','95.38',NULL,'3','2026-11-09 08:09:00');
INSERT INTO `attendance_records` VALUES ('279','28','9','absent','auto',NULL,NULL,NULL,'2026-11-09 10:00:00');
INSERT INTO `attendance_records` VALUES ('280','28','10','absent','auto',NULL,NULL,NULL,'2026-11-09 10:00:00');
INSERT INTO `attendance_records` VALUES ('281','29','1','present','simulated','97.41',NULL,'3','2026-11-11 08:10:00');
INSERT INTO `attendance_records` VALUES ('282','29','2','present','simulated','95.58',NULL,'3','2026-11-11 08:08:00');
INSERT INTO `attendance_records` VALUES ('283','29','3','present','simulated','97.60',NULL,'3','2026-11-11 08:07:00');
INSERT INTO `attendance_records` VALUES ('284','29','4','present','simulated','94.22',NULL,'3','2026-11-11 08:03:00');
INSERT INTO `attendance_records` VALUES ('285','29','5','present','simulated','98.74',NULL,'3','2026-11-11 08:11:00');
INSERT INTO `attendance_records` VALUES ('286','29','6','present','simulated','97.97',NULL,'3','2026-11-11 08:12:00');
INSERT INTO `attendance_records` VALUES ('287','29','7','absent','auto',NULL,NULL,NULL,'2026-11-11 10:00:00');
INSERT INTO `attendance_records` VALUES ('288','29','8','present','simulated','96.68',NULL,'3','2026-11-11 08:07:00');
INSERT INTO `attendance_records` VALUES ('289','29','9','late','simulated','95.49',NULL,'3','2026-11-11 08:33:00');
INSERT INTO `attendance_records` VALUES ('290','29','10','present','simulated','93.49',NULL,'3','2026-11-11 08:04:00');
INSERT INTO `attendance_records` VALUES ('291','30','11','present','simulated','98.89',NULL,'3','2026-10-20 11:11:00');
INSERT INTO `attendance_records` VALUES ('292','30','12','present','simulated','98.91',NULL,'3','2026-10-20 11:03:00');
INSERT INTO `attendance_records` VALUES ('293','30','13','present','simulated','98.89',NULL,'3','2026-10-20 11:02:00');
INSERT INTO `attendance_records` VALUES ('294','30','14','late','simulated','94.44',NULL,'3','2026-10-20 11:30:00');
INSERT INTO `attendance_records` VALUES ('295','30','15','absent','auto',NULL,NULL,NULL,'2026-10-20 13:00:00');
INSERT INTO `attendance_records` VALUES ('296','30','16','present','simulated','95.31',NULL,'3','2026-10-20 11:03:00');
INSERT INTO `attendance_records` VALUES ('297','31','11','present','simulated','93.75',NULL,'3','2026-10-22 11:11:00');
INSERT INTO `attendance_records` VALUES ('298','31','12','present','simulated','95.11',NULL,'3','2026-10-22 11:11:00');
INSERT INTO `attendance_records` VALUES ('299','31','13','present','simulated','98.16',NULL,'3','2026-10-22 11:00:00');
INSERT INTO `attendance_records` VALUES ('300','31','14','present','simulated','96.11',NULL,'3','2026-10-22 11:06:00');
INSERT INTO `attendance_records` VALUES ('301','31','15','absent','auto',NULL,NULL,NULL,'2026-10-22 13:00:00');
INSERT INTO `attendance_records` VALUES ('302','31','16','present','simulated','94.63',NULL,'3','2026-10-22 11:02:00');
INSERT INTO `attendance_records` VALUES ('303','32','11','present','simulated','96.50',NULL,'3','2026-10-27 11:02:00');
INSERT INTO `attendance_records` VALUES ('304','32','12','present','simulated','96.50',NULL,'3','2026-10-27 11:03:00');
INSERT INTO `attendance_records` VALUES ('305','32','13','present','simulated','94.64',NULL,'3','2026-10-27 11:07:00');
INSERT INTO `attendance_records` VALUES ('306','32','14','present','simulated','97.20',NULL,'3','2026-10-27 11:05:00');
INSERT INTO `attendance_records` VALUES ('307','32','15','late','simulated','98.45',NULL,'3','2026-10-27 11:16:00');
INSERT INTO `attendance_records` VALUES ('308','32','16','present','simulated','95.82',NULL,'3','2026-10-27 11:09:00');
INSERT INTO `attendance_records` VALUES ('309','33','11','present','simulated','95.88',NULL,'3','2026-10-29 11:02:00');
INSERT INTO `attendance_records` VALUES ('310','33','12','present','simulated','93.05',NULL,'3','2026-10-29 11:06:00');
INSERT INTO `attendance_records` VALUES ('311','33','13','present','simulated','93.50',NULL,'3','2026-10-29 11:08:00');
INSERT INTO `attendance_records` VALUES ('312','33','14','present','simulated','96.88',NULL,'3','2026-10-29 11:04:00');
INSERT INTO `attendance_records` VALUES ('313','33','15','present','simulated','97.49',NULL,'3','2026-10-29 11:06:00');
INSERT INTO `attendance_records` VALUES ('314','33','16','present','simulated','97.99',NULL,'3','2026-10-29 11:11:00');
INSERT INTO `attendance_records` VALUES ('315','34','11','present','simulated','97.03',NULL,'3','2026-11-03 11:06:00');
INSERT INTO `attendance_records` VALUES ('316','34','12','present','simulated','94.57',NULL,'3','2026-11-03 11:06:00');
INSERT INTO `attendance_records` VALUES ('317','34','13','present','simulated','98.88',NULL,'3','2026-11-03 11:10:00');
INSERT INTO `attendance_records` VALUES ('318','34','14','present','simulated','97.77',NULL,'3','2026-11-03 11:02:00');
INSERT INTO `attendance_records` VALUES ('319','34','15','late','simulated','94.37',NULL,'3','2026-11-03 11:18:00');
INSERT INTO `attendance_records` VALUES ('320','34','16','present','simulated','97.75',NULL,'3','2026-11-03 11:12:00');
INSERT INTO `attendance_records` VALUES ('321','35','11','present','simulated','97.79',NULL,'3','2026-11-05 11:00:00');
INSERT INTO `attendance_records` VALUES ('322','35','12','present','simulated','93.81',NULL,'3','2026-11-05 11:03:00');
INSERT INTO `attendance_records` VALUES ('323','35','13','present','simulated','94.30',NULL,'3','2026-11-05 11:08:00');
INSERT INTO `attendance_records` VALUES ('324','35','14','present','simulated','98.69',NULL,'3','2026-11-05 11:08:00');
INSERT INTO `attendance_records` VALUES ('325','35','15','present','simulated','93.73',NULL,'3','2026-11-05 11:10:00');
INSERT INTO `attendance_records` VALUES ('326','35','16','present','simulated','98.63',NULL,'3','2026-11-05 11:03:00');
INSERT INTO `attendance_records` VALUES ('327','36','11','present','simulated','94.99',NULL,'3','2026-11-10 11:05:00');
INSERT INTO `attendance_records` VALUES ('328','36','12','present','simulated','96.18',NULL,'3','2026-11-10 11:04:00');
INSERT INTO `attendance_records` VALUES ('329','36','13','late','simulated','97.89',NULL,'3','2026-11-10 11:31:00');
INSERT INTO `attendance_records` VALUES ('330','36','14','present','simulated','98.45',NULL,'3','2026-11-10 11:05:00');
INSERT INTO `attendance_records` VALUES ('331','36','15','present','simulated','97.80',NULL,'3','2026-11-10 11:04:00');
INSERT INTO `attendance_records` VALUES ('332','36','16','present','simulated','97.84',NULL,'3','2026-11-10 11:11:00');
INSERT INTO `attendance_records` VALUES ('333','37','11','present','simulated','97.24',NULL,'2','2026-10-20 11:11:00');
INSERT INTO `attendance_records` VALUES ('334','37','12','present','simulated','94.44',NULL,'2','2026-10-20 11:12:00');
INSERT INTO `attendance_records` VALUES ('335','37','13','present','simulated','98.47',NULL,'2','2026-10-20 11:08:00');
INSERT INTO `attendance_records` VALUES ('336','37','14','present','simulated','96.19',NULL,'2','2026-10-20 11:03:00');
INSERT INTO `attendance_records` VALUES ('337','37','15','absent','auto',NULL,NULL,NULL,'2026-10-20 13:00:00');
INSERT INTO `attendance_records` VALUES ('338','37','16','present','simulated','96.49',NULL,'2','2026-10-20 11:02:00');
INSERT INTO `attendance_records` VALUES ('339','38','11','present','simulated','93.21',NULL,'2','2026-10-22 11:03:00');
INSERT INTO `attendance_records` VALUES ('340','38','12','absent','auto',NULL,NULL,NULL,'2026-10-22 13:00:00');
INSERT INTO `attendance_records` VALUES ('341','38','13','absent','auto',NULL,NULL,NULL,'2026-10-22 13:00:00');
INSERT INTO `attendance_records` VALUES ('342','38','14','present','simulated','97.18',NULL,'2','2026-10-22 11:05:00');
INSERT INTO `attendance_records` VALUES ('343','38','15','present','simulated','96.28',NULL,'2','2026-10-22 11:08:00');
INSERT INTO `attendance_records` VALUES ('344','38','16','present','simulated','95.05',NULL,'2','2026-10-22 11:01:00');
INSERT INTO `attendance_records` VALUES ('345','39','11','absent','auto',NULL,NULL,NULL,'2026-10-27 13:00:00');
INSERT INTO `attendance_records` VALUES ('346','39','12','present','simulated','98.65',NULL,'2','2026-10-27 11:10:00');
INSERT INTO `attendance_records` VALUES ('347','39','13','present','simulated','95.75',NULL,'2','2026-10-27 11:09:00');
INSERT INTO `attendance_records` VALUES ('348','39','14','present','simulated','93.92',NULL,'2','2026-10-27 11:07:00');
INSERT INTO `attendance_records` VALUES ('349','39','15','absent','auto',NULL,NULL,NULL,'2026-10-27 13:00:00');
INSERT INTO `attendance_records` VALUES ('350','39','16','present','simulated','95.13',NULL,'2','2026-10-27 11:00:00');
INSERT INTO `attendance_records` VALUES ('351','40','11','present','simulated','96.06',NULL,'2','2026-10-29 11:10:00');
INSERT INTO `attendance_records` VALUES ('352','40','12','late','simulated','96.55',NULL,'2','2026-10-29 11:27:00');
INSERT INTO `attendance_records` VALUES ('353','40','13','absent','auto',NULL,NULL,NULL,'2026-10-29 13:00:00');
INSERT INTO `attendance_records` VALUES ('354','40','14','absent','auto',NULL,NULL,NULL,'2026-10-29 13:00:00');
INSERT INTO `attendance_records` VALUES ('355','40','15','absent','auto',NULL,NULL,NULL,'2026-10-29 13:00:00');
INSERT INTO `attendance_records` VALUES ('356','40','16','present','simulated','96.17',NULL,'2','2026-10-29 11:12:00');
INSERT INTO `attendance_records` VALUES ('357','41','11','present','simulated','96.04',NULL,'2','2026-11-03 11:09:00');
INSERT INTO `attendance_records` VALUES ('358','41','12','present','simulated','97.57',NULL,'2','2026-11-03 11:11:00');
INSERT INTO `attendance_records` VALUES ('359','41','13','late','simulated','95.37',NULL,'2','2026-11-03 11:32:00');
INSERT INTO `attendance_records` VALUES ('360','41','14','present','simulated','94.59',NULL,'2','2026-11-03 11:04:00');
INSERT INTO `attendance_records` VALUES ('361','41','15','absent','auto',NULL,NULL,NULL,'2026-11-03 13:00:00');
INSERT INTO `attendance_records` VALUES ('362','41','16','present','simulated','94.74',NULL,'2','2026-11-03 11:09:00');
INSERT INTO `attendance_records` VALUES ('363','42','11','present','simulated','97.97',NULL,'2','2026-11-05 11:05:00');
INSERT INTO `attendance_records` VALUES ('364','42','12','absent','auto',NULL,NULL,NULL,'2026-11-05 13:00:00');
INSERT INTO `attendance_records` VALUES ('365','42','13','present','simulated','93.59',NULL,'2','2026-11-05 11:01:00');
INSERT INTO `attendance_records` VALUES ('366','42','14','present','simulated','95.48',NULL,'2','2026-11-05 11:09:00');
INSERT INTO `attendance_records` VALUES ('367','42','15','absent','auto',NULL,NULL,NULL,'2026-11-05 13:00:00');
INSERT INTO `attendance_records` VALUES ('368','42','16','present','simulated','98.01',NULL,'2','2026-11-05 11:09:00');
INSERT INTO `attendance_records` VALUES ('369','43','11','present','simulated','97.93',NULL,'2','2026-11-10 11:06:00');
INSERT INTO `attendance_records` VALUES ('370','43','12','present','simulated','94.17',NULL,'2','2026-11-10 11:11:00');
INSERT INTO `attendance_records` VALUES ('371','43','13','present','simulated','97.50',NULL,'2','2026-11-10 11:06:00');
INSERT INTO `attendance_records` VALUES ('372','43','14','present','simulated','95.35',NULL,'2','2026-11-10 11:11:00');
INSERT INTO `attendance_records` VALUES ('373','43','15','absent','auto',NULL,NULL,NULL,'2026-11-10 13:00:00');
INSERT INTO `attendance_records` VALUES ('374','43','16','present','simulated','94.33',NULL,'2','2026-11-10 11:02:00');
INSERT INTO `attendance_records` VALUES ('375','44','17','late','simulated','93.48',NULL,'4','2026-10-20 11:26:00');
INSERT INTO `attendance_records` VALUES ('376','44','18','present','simulated','93.52',NULL,'4','2026-10-20 11:02:00');
INSERT INTO `attendance_records` VALUES ('377','44','19','present','simulated','98.34',NULL,'4','2026-10-20 11:04:00');
INSERT INTO `attendance_records` VALUES ('378','44','20','present','simulated','96.36',NULL,'4','2026-10-20 11:06:00');
INSERT INTO `attendance_records` VALUES ('379','44','21','absent','auto',NULL,NULL,NULL,'2026-10-20 13:00:00');
INSERT INTO `attendance_records` VALUES ('380','44','22','present','simulated','95.24',NULL,'4','2026-10-20 11:08:00');
INSERT INTO `attendance_records` VALUES ('381','45','17','absent','auto',NULL,NULL,NULL,'2026-10-22 13:00:00');
INSERT INTO `attendance_records` VALUES ('382','45','18','absent','auto',NULL,NULL,NULL,'2026-10-22 13:00:00');
INSERT INTO `attendance_records` VALUES ('383','45','19','present','simulated','96.49',NULL,'4','2026-10-22 11:02:00');
INSERT INTO `attendance_records` VALUES ('384','45','20','present','simulated','98.74',NULL,'4','2026-10-22 11:09:00');
INSERT INTO `attendance_records` VALUES ('385','45','21','absent','auto',NULL,NULL,NULL,'2026-10-22 13:00:00');
INSERT INTO `attendance_records` VALUES ('386','45','22','present','simulated','98.98',NULL,'4','2026-10-22 11:07:00');
INSERT INTO `attendance_records` VALUES ('387','46','17','present','simulated','95.87',NULL,'4','2026-10-27 11:03:00');
INSERT INTO `attendance_records` VALUES ('388','46','18','absent','auto',NULL,NULL,NULL,'2026-10-27 13:00:00');
INSERT INTO `attendance_records` VALUES ('389','46','19','present','simulated','96.74',NULL,'4','2026-10-27 11:02:00');
INSERT INTO `attendance_records` VALUES ('390','46','20','present','simulated','98.70',NULL,'4','2026-10-27 11:10:00');
INSERT INTO `attendance_records` VALUES ('391','46','21','present','simulated','97.72',NULL,'4','2026-10-27 11:12:00');
INSERT INTO `attendance_records` VALUES ('392','46','22','present','simulated','97.48',NULL,'4','2026-10-27 11:07:00');
INSERT INTO `attendance_records` VALUES ('393','47','17','present','simulated','95.75',NULL,'4','2026-10-29 11:09:00');
INSERT INTO `attendance_records` VALUES ('394','47','18','present','simulated','96.92',NULL,'4','2026-10-29 11:00:00');
INSERT INTO `attendance_records` VALUES ('395','47','19','absent','auto',NULL,NULL,NULL,'2026-10-29 13:00:00');
INSERT INTO `attendance_records` VALUES ('396','47','20','present','simulated','94.13',NULL,'4','2026-10-29 11:12:00');
INSERT INTO `attendance_records` VALUES ('397','47','21','absent','auto',NULL,NULL,NULL,'2026-10-29 13:00:00');
INSERT INTO `attendance_records` VALUES ('398','47','22','present','simulated','95.63',NULL,'4','2026-10-29 11:03:00');
INSERT INTO `attendance_records` VALUES ('399','48','17','present','simulated','97.18',NULL,'4','2026-11-03 11:10:00');
INSERT INTO `attendance_records` VALUES ('400','48','18','present','simulated','95.34',NULL,'4','2026-11-03 11:12:00');
INSERT INTO `attendance_records` VALUES ('401','48','19','present','simulated','96.71',NULL,'4','2026-11-03 11:06:00');
INSERT INTO `attendance_records` VALUES ('402','48','20','present','simulated','94.49',NULL,'4','2026-11-03 11:02:00');
INSERT INTO `attendance_records` VALUES ('403','48','21','present','simulated','97.69',NULL,'4','2026-11-03 11:01:00');
INSERT INTO `attendance_records` VALUES ('404','48','22','present','simulated','98.05',NULL,'4','2026-11-03 11:08:00');
INSERT INTO `attendance_records` VALUES ('405','49','17','present','simulated','94.89',NULL,'4','2026-11-05 11:02:00');
INSERT INTO `attendance_records` VALUES ('406','49','18','present','simulated','94.02',NULL,'4','2026-11-05 11:00:00');
INSERT INTO `attendance_records` VALUES ('407','49','19','present','simulated','93.25',NULL,'4','2026-11-05 11:06:00');
INSERT INTO `attendance_records` VALUES ('408','49','20','present','simulated','96.67',NULL,'4','2026-11-05 11:02:00');
INSERT INTO `attendance_records` VALUES ('409','49','21','present','simulated','95.76',NULL,'4','2026-11-05 11:04:00');
INSERT INTO `attendance_records` VALUES ('410','49','22','present','simulated','96.25',NULL,'4','2026-11-05 11:11:00');
INSERT INTO `attendance_records` VALUES ('411','50','17','present','simulated','97.31',NULL,'4','2026-11-10 11:03:00');
INSERT INTO `attendance_records` VALUES ('412','50','18','present','simulated','93.14',NULL,'4','2026-11-10 11:04:00');
INSERT INTO `attendance_records` VALUES ('413','50','19','present','simulated','97.95',NULL,'4','2026-11-10 11:12:00');
INSERT INTO `attendance_records` VALUES ('414','50','20','present','simulated','95.23',NULL,'4','2026-11-10 11:11:00');
INSERT INTO `attendance_records` VALUES ('415','50','21','absent','auto',NULL,NULL,NULL,'2026-11-10 13:00:00');
INSERT INTO `attendance_records` VALUES ('416','50','22','present','simulated','97.50',NULL,'4','2026-11-10 11:11:00');
INSERT INTO `attendance_records` VALUES ('417','51','17','present','simulated','97.19',NULL,'4','2026-10-20 11:09:00');
INSERT INTO `attendance_records` VALUES ('418','51','18','present','simulated','96.89',NULL,'4','2026-10-20 11:08:00');
INSERT INTO `attendance_records` VALUES ('419','51','19','present','simulated','94.90',NULL,'4','2026-10-20 11:12:00');
INSERT INTO `attendance_records` VALUES ('420','51','20','present','simulated','93.25',NULL,'4','2026-10-20 11:01:00');
INSERT INTO `attendance_records` VALUES ('421','51','21','present','simulated','97.69',NULL,'4','2026-10-20 11:05:00');
INSERT INTO `attendance_records` VALUES ('422','51','22','present','simulated','98.70',NULL,'4','2026-10-20 11:12:00');
INSERT INTO `attendance_records` VALUES ('423','52','17','present','simulated','98.08',NULL,'4','2026-10-22 11:03:00');
INSERT INTO `attendance_records` VALUES ('424','52','18','late','simulated','97.95',NULL,'4','2026-10-22 11:16:00');
INSERT INTO `attendance_records` VALUES ('425','52','19','present','simulated','93.04',NULL,'4','2026-10-22 11:01:00');
INSERT INTO `attendance_records` VALUES ('426','52','20','present','simulated','94.92',NULL,'4','2026-10-22 11:10:00');
INSERT INTO `attendance_records` VALUES ('427','52','21','present','simulated','93.83',NULL,'4','2026-10-22 11:05:00');
INSERT INTO `attendance_records` VALUES ('428','52','22','present','simulated','96.23',NULL,'4','2026-10-22 11:06:00');
INSERT INTO `attendance_records` VALUES ('429','53','17','present','simulated','94.19',NULL,'4','2026-10-27 11:10:00');
INSERT INTO `attendance_records` VALUES ('430','53','18','present','simulated','93.81',NULL,'4','2026-10-27 11:07:00');
INSERT INTO `attendance_records` VALUES ('431','53','19','present','simulated','95.96',NULL,'4','2026-10-27 11:11:00');
INSERT INTO `attendance_records` VALUES ('432','53','20','present','simulated','96.72',NULL,'4','2026-10-27 11:03:00');
INSERT INTO `attendance_records` VALUES ('433','53','21','present','simulated','94.53',NULL,'4','2026-10-27 11:09:00');
INSERT INTO `attendance_records` VALUES ('434','53','22','present','simulated','97.11',NULL,'4','2026-10-27 11:07:00');
INSERT INTO `attendance_records` VALUES ('435','54','17','present','simulated','95.62',NULL,'4','2026-10-29 11:05:00');
INSERT INTO `attendance_records` VALUES ('436','54','18','present','simulated','93.13',NULL,'4','2026-10-29 11:03:00');
INSERT INTO `attendance_records` VALUES ('437','54','19','present','simulated','97.35',NULL,'4','2026-10-29 11:05:00');
INSERT INTO `attendance_records` VALUES ('438','54','20','absent','auto',NULL,NULL,NULL,'2026-10-29 13:00:00');
INSERT INTO `attendance_records` VALUES ('439','54','21','present','simulated','95.33',NULL,'4','2026-10-29 11:06:00');
INSERT INTO `attendance_records` VALUES ('440','54','22','present','simulated','97.35',NULL,'4','2026-10-29 11:08:00');
INSERT INTO `attendance_records` VALUES ('441','55','17','present','simulated','98.25',NULL,'4','2026-11-03 11:10:00');
INSERT INTO `attendance_records` VALUES ('442','55','18','absent','auto',NULL,NULL,NULL,'2026-11-03 13:00:00');
INSERT INTO `attendance_records` VALUES ('443','55','19','present','simulated','95.39',NULL,'4','2026-11-03 11:12:00');
INSERT INTO `attendance_records` VALUES ('444','55','20','present','simulated','96.28',NULL,'4','2026-11-03 11:10:00');
INSERT INTO `attendance_records` VALUES ('445','55','21','present','simulated','95.31',NULL,'4','2026-11-03 11:12:00');
INSERT INTO `attendance_records` VALUES ('446','55','22','late','simulated','97.62',NULL,'4','2026-11-03 11:39:00');
INSERT INTO `attendance_records` VALUES ('447','56','17','present','simulated','95.48',NULL,'4','2026-11-05 11:04:00');
INSERT INTO `attendance_records` VALUES ('448','56','18','late','simulated','97.29',NULL,'4','2026-11-05 11:26:00');
INSERT INTO `attendance_records` VALUES ('449','56','19','present','simulated','95.56',NULL,'4','2026-11-05 11:10:00');
INSERT INTO `attendance_records` VALUES ('450','56','20','present','simulated','97.67',NULL,'4','2026-11-05 11:01:00');
INSERT INTO `attendance_records` VALUES ('451','56','21','present','simulated','95.69',NULL,'4','2026-11-05 11:12:00');
INSERT INTO `attendance_records` VALUES ('452','56','22','present','simulated','97.01',NULL,'4','2026-11-05 11:04:00');
INSERT INTO `attendance_records` VALUES ('453','57','17','present','simulated','93.08',NULL,'4','2026-11-10 11:11:00');
INSERT INTO `attendance_records` VALUES ('454','57','18','present','simulated','94.87',NULL,'4','2026-11-10 11:07:00');
INSERT INTO `attendance_records` VALUES ('455','57','19','present','simulated','97.03',NULL,'4','2026-11-10 11:11:00');
INSERT INTO `attendance_records` VALUES ('456','57','20','present','simulated','95.96',NULL,'4','2026-11-10 11:06:00');
INSERT INTO `attendance_records` VALUES ('457','57','21','present','simulated','95.46',NULL,'4','2026-11-10 11:05:00');
INSERT INTO `attendance_records` VALUES ('458','57','22','present','simulated','95.81',NULL,'4','2026-11-10 11:06:00');
INSERT INTO `attendance_records` VALUES ('459','60','23','late','simulated','95.64',NULL,'31','2026-11-12 03:59:48');
INSERT INTO `attendance_records` VALUES ('462','60','25','present','manual',NULL,'Fingerprint not yet enrolled; ID card checked','31','2026-11-12 03:59:49');
INSERT INTO `attendance_records` VALUES ('463','60','24','absent','auto',NULL,NULL,NULL,'2026-11-12 03:59:49');

DROP TABLE IF EXISTS `audit_logs`;
CREATE TABLE `audit_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `action` varchar(60) NOT NULL,
  `entity_type` varchar(40) DEFAULT NULL,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `details` varchar(1000) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_audit_created` (`created_at`),
  KEY `idx_audit_user` (`user_id`),
  KEY `idx_audit_action` (`action`),
  CONSTRAINT `fk_audit_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `audit_logs` VALUES ('1','1','login_success','user','1',NULL,'::1','','2026-11-12 03:59:44');
INSERT INTO `audit_logs` VALUES ('2','1','login_failed','user','1','Attempt 1 of 5','::1','','2026-11-12 03:59:44');
INSERT INTO `audit_logs` VALUES ('3',NULL,'login_failed','user',NULL,'Unknown login: \' OR \'1\'=\'1\' --','::1','','2026-11-12 03:59:45');
INSERT INTO `audit_logs` VALUES ('4','4','login_failed','user','4','Attempt 1 of 5','::1','','2026-11-12 03:59:45');
INSERT INTO `audit_logs` VALUES ('5','4','login_failed','user','4','Attempt 2 of 5','::1','','2026-11-12 03:59:45');
INSERT INTO `audit_logs` VALUES ('6','4','login_failed','user','4','Attempt 3 of 5','::1','','2026-11-12 03:59:45');
INSERT INTO `audit_logs` VALUES ('7','4','login_failed','user','4','Attempt 4 of 5','::1','','2026-11-12 03:59:45');
INSERT INTO `audit_logs` VALUES ('8','4','account_locked','user','4','Locked after 5 failed attempts','::1','','2026-11-12 03:59:45');
INSERT INTO `audit_logs` VALUES ('9','4','login_locked','user','4',NULL,'::1','','2026-11-12 03:59:45');
INSERT INTO `audit_logs` VALUES ('10',NULL,'csrf_rejected',NULL,NULL,'Path: /bsams/login.php','::1','','2026-11-12 03:59:45');
INSERT INTO `audit_logs` VALUES ('11','1','csrf_rejected',NULL,NULL,'Path: /bsams/admin/departments.php','::1','','2026-11-12 03:59:45');
INSERT INTO `audit_logs` VALUES ('12','2','login_success','user','2',NULL,'::1','','2026-11-12 03:59:45');
INSERT INTO `audit_logs` VALUES ('13','5','login_success','user','5',NULL,'::1','','2026-11-12 03:59:45');
INSERT INTO `audit_logs` VALUES ('14','2','access_denied',NULL,NULL,'Role lecturer tried /bsams/admin/students.php','::1','','2026-11-12 03:59:46');
INSERT INTO `audit_logs` VALUES ('15','5','access_denied',NULL,NULL,'Role student tried /bsams/lecturer/sessions.php','::1','','2026-11-12 03:59:46');
INSERT INTO `audit_logs` VALUES ('16','5','access_denied',NULL,NULL,'Role student tried /bsams/admin/settings.php','::1','','2026-11-12 03:59:46');
INSERT INTO `audit_logs` VALUES ('17','1','department_created','department','3','ENG','::1','','2026-11-12 03:59:46');
INSERT INTO `audit_logs` VALUES ('18','1','department_created','department','5','XSS','::1','','2026-11-12 03:59:46');
INSERT INTO `audit_logs` VALUES ('19','1','course_created','course','4','DEE','::1','','2026-11-12 03:59:46');
INSERT INTO `audit_logs` VALUES ('20','1','class_created','class','4','DEE-2026-JAN','::1','','2026-11-12 03:59:46');
INSERT INTO `audit_logs` VALUES ('21','1','unit_created','unit','9','DEE101','::1','','2026-11-12 03:59:46');
INSERT INTO `audit_logs` VALUES ('22','1','student_created','student','23','DEE/001/2026','::1','','2026-11-12 03:59:46');
INSERT INTO `audit_logs` VALUES ('23','27','login_success','user','27',NULL,'::1','','2026-11-12 03:59:46');
INSERT INTO `audit_logs` VALUES ('24','27','password_changed','user','27',NULL,'::1','','2026-11-12 03:59:47');
INSERT INTO `audit_logs` VALUES ('25','1','student_created','student','24','DEE/002/2026','::1','','2026-11-12 03:59:47');
INSERT INTO `audit_logs` VALUES ('26','1','student_created','student','25','DEE/003/2026','::1','','2026-11-12 03:59:47');
INSERT INTO `audit_logs` VALUES ('27','1','students_imported','student',NULL,'2 imported, 1 failed','::1','','2026-11-12 03:59:47');
INSERT INTO `audit_logs` VALUES ('28','1','lecturer_created','lecturer','4','LEC900','::1','','2026-11-12 03:59:47');
INSERT INTO `audit_logs` VALUES ('29','1','allocation_created','unit_assignment','9','3 students registered','::1','','2026-11-12 03:59:47');
INSERT INTO `audit_logs` VALUES ('30','1','consent_recorded','student','23',NULL,'::1','','2026-11-12 03:59:47');
INSERT INTO `audit_logs` VALUES ('31','1','consent_recorded','student','24',NULL,'::1','','2026-11-12 03:59:47');
INSERT INTO `audit_logs` VALUES ('32','1','fingerprint_enrolled','student','23','Right index (simulated, quality 91)','::1','','2026-11-12 03:59:47');
INSERT INTO `audit_logs` VALUES ('33','1','fingerprint_enrolled','student','23','Left index (simulated, quality 67)','::1','','2026-11-12 03:59:47');
INSERT INTO `audit_logs` VALUES ('34','1','enrol_duplicate_rejected','student','24','Matched template of DEE/001/2026','::1','','2026-11-12 03:59:47');
INSERT INTO `audit_logs` VALUES ('35','1','fingerprint_enrolled','student','24','Right index (simulated, quality 96)','::1','','2026-11-12 03:59:48');
INSERT INTO `audit_logs` VALUES ('36','2','access_denied',NULL,NULL,'Role lecturer tried /bsams/api/enroll.php','::1','','2026-11-12 03:59:48');
INSERT INTO `audit_logs` VALUES ('37','31','login_success','user','31',NULL,'::1','','2026-11-12 03:59:48');
INSERT INTO `audit_logs` VALUES ('38','31','session_created','class_session','60',NULL,'::1','','2026-11-12 03:59:48');
INSERT INTO `audit_logs` VALUES ('39','31','session_opened','class_session','60',NULL,'::1','','2026-11-12 03:59:48');
INSERT INTO `audit_logs` VALUES ('40','31','scan_rejected','class_session','60','Best score 21.21 below threshold 80 (3 candidates)','::1','','2026-11-12 03:59:48');
INSERT INTO `audit_logs` VALUES ('41','31','scan_rejected','class_session','60','Best score 1.83 below threshold 80 (3 candidates)','::1','','2026-11-12 03:59:48');
INSERT INTO `audit_logs` VALUES ('42','31','scan_rejected','class_session','60','Best score 17.44 below threshold 80 (3 candidates)','::1','','2026-11-12 03:59:48');
INSERT INTO `audit_logs` VALUES ('43','2','access_denied','class_session','60','Scan for another lecturer\'s session','::1','','2026-11-12 03:59:48');
INSERT INTO `audit_logs` VALUES ('44','31','attendance_manual','class_session','60','Student #25 set to present: Fingerprint not yet enrolled; ID card checked','::1','','2026-11-12 03:59:49');
INSERT INTO `audit_logs` VALUES ('45','31','session_closed','class_session','60','1 student(s) marked absent automatically','::1','','2026-11-12 03:59:49');
INSERT INTO `audit_logs` VALUES ('46','1','report_exported','report',NULL,'unit: Unit attendance summary – DEE101 Electrical Principles (DEE-2026-JAN, 2026/2027 T1)','::1','','2026-11-12 03:59:49');
INSERT INTO `audit_logs` VALUES ('47','2','report_exported','report',NULL,'below: Students below the minimum attendance of 75%','::1','','2026-11-12 03:59:49');
INSERT INTO `audit_logs` VALUES ('48','1','announcement_sent','notification',NULL,'class:4: Welcome (3 recipients)','::1','','2026-11-12 03:59:49');
INSERT INTO `audit_logs` VALUES ('49','1','settings_updated','settings',NULL,'{\"institution_name\":\"Demo Technical Training Institute\",\"min_attendance_percent\":\"80\",\"late_grace_minutes\":\"10\",\"biometric_driver\":\"simulated\",\"match_threshold\":\"80\",\"min_quality\":\"50\",\"bridge_url\":\"http:\\/\\/127.0.0.1:8765\",\"consent_version\":\"1.0\"}','::1','','2026-11-12 03:59:49');

DROP TABLE IF EXISTS `biometric_consents`;
CREATE TABLE `biometric_consents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL,
  `consent_version` varchar(10) NOT NULL,
  `given_at` datetime NOT NULL DEFAULT current_timestamp(),
  `recorded_by` int(10) unsigned NOT NULL,
  `withdrawn_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_consent_student` (`student_id`),
  KEY `fk_consent_user` (`recorded_by`),
  CONSTRAINT `fk_consent_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_consent_user` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `biometric_consents` VALUES ('1','1','1.0','2026-11-12 03:59:43','1',NULL);
INSERT INTO `biometric_consents` VALUES ('2','2','1.0','2026-11-12 03:59:43','1',NULL);
INSERT INTO `biometric_consents` VALUES ('3','3','1.0','2026-11-12 03:59:43','1',NULL);
INSERT INTO `biometric_consents` VALUES ('4','4','1.0','2026-11-12 03:59:43','1',NULL);
INSERT INTO `biometric_consents` VALUES ('5','5','1.0','2026-11-12 03:59:43','1',NULL);
INSERT INTO `biometric_consents` VALUES ('6','6','1.0','2026-11-12 03:59:43','1',NULL);
INSERT INTO `biometric_consents` VALUES ('7','7','1.0','2026-11-12 03:59:43','1',NULL);
INSERT INTO `biometric_consents` VALUES ('8','8','1.0','2026-11-12 03:59:43','1',NULL);
INSERT INTO `biometric_consents` VALUES ('9','11','1.0','2026-11-12 03:59:43','1',NULL);
INSERT INTO `biometric_consents` VALUES ('10','12','1.0','2026-11-12 03:59:43','1',NULL);
INSERT INTO `biometric_consents` VALUES ('11','13','1.0','2026-11-12 03:59:43','1',NULL);
INSERT INTO `biometric_consents` VALUES ('12','14','1.0','2026-11-12 03:59:43','1',NULL);
INSERT INTO `biometric_consents` VALUES ('13','17','1.0','2026-11-12 03:59:43','1',NULL);
INSERT INTO `biometric_consents` VALUES ('14','18','1.0','2026-11-12 03:59:43','1',NULL);
INSERT INTO `biometric_consents` VALUES ('15','19','1.0','2026-11-12 03:59:43','1',NULL);
INSERT INTO `biometric_consents` VALUES ('16','20','1.0','2026-11-12 03:59:43','1',NULL);
INSERT INTO `biometric_consents` VALUES ('17','23','1.0','2026-11-12 03:59:47','1',NULL);
INSERT INTO `biometric_consents` VALUES ('18','24','1.0','2026-11-12 03:59:47','1',NULL);

DROP TABLE IF EXISTS `biometric_templates`;
CREATE TABLE `biometric_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL,
  `finger` enum('R_THUMB','R_INDEX','R_MIDDLE','R_RING','R_LITTLE','L_THUMB','L_INDEX','L_MIDDLE','L_RING','L_LITTLE') NOT NULL,
  `driver` enum('simulated','hardware') NOT NULL,
  `template_enc` blob NOT NULL,
  `iv` varbinary(12) NOT NULL,
  `auth_tag` varbinary(16) NOT NULL,
  `template_hash` char(64) NOT NULL,
  `quality` tinyint(3) unsigned NOT NULL,
  `enrolled_by` int(10) unsigned NOT NULL,
  `enrolled_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_template_student_finger` (`student_id`,`finger`),
  KEY `fk_template_user` (`enrolled_by`),
  CONSTRAINT `fk_template_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_template_user` FOREIGN KEY (`enrolled_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `biometric_templates` VALUES ('1','1','R_INDEX','simulated',0x5811f7e9224f4a8322224531bf75551f35046fc596c52462f775c57810623852b00ddc27f98d70d13aa959b3854b616be30fa661c980aef6a6fbc2f31313c7fddb8f80c67e014a6348d8447eed4896209966af9ba1c231a7aef301e6dd1e8a22c189a78370c6d30cf2a3c9e863b3b8cfd209a4cf7051cb8988e09a55f36100d92c69f5f2fbc101f4001a3c9c2590d61a4d8b9280aa7a0a085cc22ae071b85411060994eeaec020867d11ee6fecf1281d531736b74c26b6d8b54d8cc4e59f124d8a38a72cc3daf73c820445ffc0a789a4ec4b665a0bc597a4b9a3c2993837d55522cbd91fdb2b39a71b57f28f7ffe805abbc55600e13db08e3efdc7524ab9f07b7839ea875731ec8695bcac65a365d23550df49b0baf710e2fc54b7448e5d0ea122d8f5da60999de5a99c44f147920490dbde5fd11e987e2831b1dae06856afe92ba91192a291ad943916b9bc4ac9a0e6d043c9d8cfa6496952b5cc010b6f9701f617be272f7c21490b47a7a7cb5e9ec0fd546949780c10e71352035909875e5a4d9d60727704a1e8d01ea1eb700baa9982eddc21d4a7e9e3163afb82495b9a2aef964bb29cfbc709ae013081c9161ce0d0b245d52ccb8d575c531bd128cc6577c6d0cec257f66ffa35502cb96ff800f465cc634fe6297122c8328e5a900c9543aca9b01806bb09794b4275cf300c1248c2cb9cf7af,0x7f7dfbcf9cf3995184aac7fb,0x6098749c3c38ed6bbfb914d7c773a7b4,'a2b288eb896b832c706311509c504eb2a86a9413a8565565c444c81902ccd4bf','72','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('2','1','L_INDEX','simulated',0x533a233d53c2a096089a2ac4afdd99b90566bb2dcad4cc44fd4eb38adba4092c8ade021244300321bc13deef6100470658b2fe35e5fac70a1942b018fbd16acd45d0acfea249a1f91ba400adaac0bb35cfe63817ac358ab532390a987e821b6190da550abc97796eaee8623bc487faa3c06516ea385f8307e4429033977ffad81fce1fea8b4a578a7975ad601423acdb16b944f6f118565ff24ee96dc78ba3ee3e579d182c5e7a748c4d4e00a0c55ece7a1969d6abe410073bda016f41ebb987af77e2867775cd5b3a74507915c0c743f50c9a3b2662f20af5e8e9ab9ae61d1507fd3ddf102d9b0167abe39d61976987b2c75f18ab5ad50ab9623e594b84450f5b8192be49b3be5f8e1ed3049a8618c8b57e2e2ea222042856a027fba8db189758fcb45c8547fe238432508d90aeeb6e7ea8743785a09c99d778e45d5baaed5cbf3a00bff84c634345375ef076a23b0bea3a870a3cae165df49c3ee9327debc7087eea2dab8da95e93d18c66f5f8d557534fd3a50b4793bed5b968ff320a0872dcf64566cca7d1dde89e4c15af663a109ec04655988577dd43e6eb2ec63b16f1a2cbfad2599ac15903841f83a850a12a3fbdee1f9ea076060bffa4d5de98dace448381dab88e558b13d670146ee8e38784fc6581a3cc077efe7514990c9fadba1d9ce51bf29f1e24f293001ac7129dcae99072f1,0x87be656210d166a156fc018d,0xb556dd699d3b7b68f03aebd8547a048c,'e2e46f108bb4c085bd9e5410d4ced6b8c59bf590e59339d5d1405fea5a4e054e','67','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('3','2','R_INDEX','simulated',0xaa87bb73396e550b633b85e5afd0eb21d270a57c44fc65f3d0884c6198d4a570bd0bb8a586579a69c815ff3a0b366bbb7a861e469031486288a8a4776bd77ad9f5cfd95825c7554f22e16ce68ec1e22110e35aacc57d6e0a7ec51e609d4b5a97801e09e16bbd82c17a95699d8db01e9d1017afa1797fc08a0f30fa3456219cfbf307b39fed5a32b4b40dbf8feb50f9993745207d8e4d8bd38fc53758154edafce5c50bf727e2355a906a89e5e67c6a4cacd8d0109eb12e2213c8c81d45f78e5c7f8b99bbe88f19bdaa6aae5495fd57f201a0083821f541ba550a64acc88d3aeee62c1977d16b6a885235b0cfd13f1a8c8e6c8774ce0f34f7190c82c419ab3697c53eab921fcf012753ea30c1593c1d517a2242550447c8e58e48105a69d4c2e751a1104911f97bea5d6dfe9eb42ba669de13ae5889ab52af605e035508ade793c6c1dac00600305d27b6e45f610135f3139ab0ef1da2280574a086e811b24d7bd4920ca262ceddd44623e5244c231239285ee87629bd4968274c1d94fb20f5d5888303173df176b9cc2233d56d6f8064510f2d90f47cb8e21be8b15eeaa83e6d5ff7f91d9fff48edc64396bfe8e624c10de12792986d41be3fe8a3f35dd1150bcb29d37e66c736c5506e54022050f68ab0823c2919745427cbdb8710b6b533fb5958cef1c5e2f401b29d5ccc6019af902dbe4846f273d201,0xf7116a92dca52e9bacb43353,0xf9d630b1c625af6373725415fe501b08,'c59e0c23f6fd70acd5c35d6fb348b100552718a601c9f1e002d3cd14a0ba0302','83','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('4','2','L_INDEX','simulated',0xc0afdcd9351f52dc16a2acd1e48f0b73a8a99cb16ba3051208d5967ec0b3acfac8e9b43e74067503d940c2f7bca5a9dee72405546f47b09e5135d5a220e3bce066236b045341b80de5d7c3c4085a8c33764b810309470d8fc23f796cc018f640f06d4ff917f02f3fa21476d8960eaedb184f6e9cc5cbf91d95b441a5d3c013a59b6f5ad2bc2eb9571d2732eab2e83ed5469fa0333c299fad7d5bf80d6729a7a503f730f1684b75ad50de24a7271a135606c8a0b9055e2e7d2a16ada46a47a6f9839714e7669163f2d182ece8f1aa9b32d54248e2c1f0731009d87f6deef54a84d1c77d66882ca4913f4678a628611f3a6a211b8863068d89cc7816dc865e87eea999ea107f3b00342933d2bd4b89d35fa4352dfffb012c1003d6e99bc27f0292528a93386ba0015177f39503edf1f269e810429fad836bef11a01364acff92da10734672037de123af5fcdbeb67182081e9af28d9b6ddd155ded49094aead135d45d485d1f3c0f7b4179a7384ae5d712db2e6fbc4fface40ffdcfbb1639644a51505ec8b00861410a02608564cc07881dc40dc08ee7832b1fef5bee5e092d9399fbab142afa76fc1604b2a1905d87b0b09ef3900e3765046a7324dd971286b06d967d7ccf73a2fd9877469ace50f2335abfcff836a3ce18d17b3bdcd19dc3c2a62a89c172fe9b27e6ab430d68f9206a3d719d2af9f1b1666060a,0x745b7318677ac5fcad0abae3,0xd829981bb62faf40f9fd5aaa84c64310,'0a752b94f403045e158e04166fc9c92b5ae67ecb0046eeb8f1a11ca460e6e732','81','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('5','3','R_INDEX','simulated',0xb58976b3d0cf00527002cda9bd81bdbd5067af034254d67d952d65425782d43e2ccf342220c52c6d048dd6d38a093ddf8912d0c28e6e090f80f14027daa3f5b145a9f4091e083edb91559c3222ceecb227e174efb1efed841482bbb68b8a481cdb40786e21c953289b9a1ee97ab7b02bf3fda726f552c3035aef3af3cecaeccbba365aae20a6c3dd1c72d52f44f00e08b8d8d083340d290bfa50e5d96afc5a89a9e72cf5a5d71b95f912664e40f03b36b5b9d15c9bd39e819126c4e2084254ac6177c9ce276e42a92f45f78022b80695f6a10d877d26bc03501bcbb3d383f52c29c331a550cfcc5a29dd9f97ba7127b575e038595e108311b8c0de45afa3d554217bcdb2b9e2d14f0c39daaf6bce0f7ef336bbdb70c5afe87797cbfee90eec13373b9391026738d92fb2d61d286a3ae81a54a91cd020c6dc1df3cffa6df1d6a559028a09a8e1adb009cd207b17cfbcaa31f804402d04a77ef68ac4a1f0030db0d46e2fae5b160d828c8e490c021116a273b6b39072a4a100ad1900ec841035ff0c5b9787bb58af677c2903060cb847a8f54bfaa6d92c798d8096d4b0f10aaed9b9b509228e2eb6e573989b7da0b9a829a2a83550f803cfc653643a9e87e7342a978b5462f1df63415f8f90996d4aa50f32c6a3cc95697ced4c52f42c9af301c9dee79bbe36886e414b2b98e66edc6bac0d4ea31b1521a914dc32dbc8,0x427d9fe08337b822c340e28c,0xdb0d0a19b48de01122677a5c44daf22a,'c9bfbfdd9b0c72068962ae60c2e94894d7bf998b2cd7549f62e4c776ae1b2056','95','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('6','3','L_INDEX','simulated',0x3d5c95c0644de194985a059b58ae7450eeebda6ab8a79e4e1eef2fddcd52b189664a19e1895b9dbd6353896d87e20c289f41710634df2a82b1f5ac31e531733fbb71b5e54ed248a5ded757c2846478dcc7e99f5ef594d0df1956010c4d2f08f5a559636dfc60ba6b8f8e29c9b145426f93ddb94478d42b182b5242cf876001179b8146db3e3a1cb49deaba66b0f464c148680a966b821e5044dd61b7753ab28338e04690c2464c04667ea4cb4cf37866021f00bfa78d3dc7507a7b6b062191564ae3cebee3a7cf20cc4418343ddd0f96145781bf074c043ff636d45eddcb1f0ce880057ec701d71b454f9e5181bdca269d2fed6e8bfb3c878ca74c08d80c1b3825476d1eedbc4adf7db427c0222a386f8dfe3badec041419167078c096fcfa874404916a7da14dda460e1d8aa3580718ff4c80935bb2d69148f451b2663253344fa94d5c0c9887842c88cedb3b818a2c8aa2ad2af24bbe039ad4b9289b479ea09201a96a49354bd512fb883f660e85dcd0f4c0f997843a128294eb99972e4a25d8da4f1376a2d36caea5d207779f02b36b1313725f6158b71264891e876096fed707ef3250a806b926ee97b03db2a4714074012c567e4e587cbca4529072f05c518644d16bf6770f523f7189e6cb230c7f47c0caed4d9c130a5cb1e5e4079f39b507e091e50a137cd1c63034a74b3ba4,0xb531b8e15bd851171b60282e,0xc0c3a0de5e7b7612b87a30b3ae95b9c0,'c083631d52321a651ba54986f83694c761622c66fceae73b30eeb3d7e3981ca9','78','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('7','4','R_INDEX','simulated',0x38704c46d520cd3288ef86dc5951431dbcbedd8b5f9a58de0b8715eaec9d19d074082073f311980c02fb0fdee6f58238c7d4939a226c0689613a0831c05e0161e1cbe92f6f5bb098dbd55b8e6994c067e5a2a50791e6168f6a92b6afd22d13a6d45a15083159d51bf1f6d365d67031f5a3207a917c88eb0e5896234c6d6fb7fa6782940e0232a73029f1b2b2670d5b28b496e29d5057ee4cb25d67950e1d18d0699f093758c1c6e319f095453d58f491c51e9623fc0131e8be96c8d5657d03ced1910c635c834edfbbe17be351416a1a95bb5e52ecead280af8fc4225458d35ed4c8ec28b947a13a30d3ab55e5fc8923da0d2217c9c5236f42652d0b72b86ee33310bb19fbf93b6eaf298995c64a179357fc5809992dc08e78c62a82f17545a21fa2c8efc38ada1ea4204ce26e4c7cd343292c5c391979462b06356b7e78f0f5bb5373e6e3a30e4ec1e94ebebad0ede61d8b86c5a0f9b4ad8f16ff60e4df1c9f99ae7f8c49e390980c4e491feca7cfcf71d404dc8dce9eef2fe58cb858727dd391aea364693b34469d0c4761134f67d40c5f51258e55d1cff764c92128efb575a75dca18fed7b5c3c98a3a732771a279b43064e2bbea90b268488820293462e460572f2b621549214159da4e0768651b017969aa952a7ee256d00f3d9f68337c455c3853e9b6a097e996162dbc62e17a2b61,0x6127f2de2434b6a022318a01,0xcf1b5e1e9c103b3db72d5bb1bee589fe,'3394555821fd78172ceffda27057747280f2b9f98393883a4425da6f402c6267','68','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('8','4','L_INDEX','simulated',0x600b7feefeb057221f173430f99305060deb78c61598af6b9db3e51ef717a4b316f964fb0169ed7cf1545cff97ceeb881c732a542e0af15414a68397617b1fe643f09ca79b9d4d30215f20216851c680ed490752b465f186cb627bfe60024dddd851b5c99122904796573b8a9ea409ae0306facb0bede861b1267e1d829977ba21570990cc1e052c2dfe2535e873da370b76b6f9a96a3498145b54e1ba97729bd2ac2d6b2ad7340c0378e3514b1c215a081a05849290ca2d69a95daf5079c8ec8f0021b6410575c74c502642ced716cce8528b81627b1c4f847033d19481501d65e41ef1547738fd1285102ce83c96b8e3be0af3d8c8ab60f5de751fa0307f8766c541e0aa65669dfa3d4142fd06f5e4863735025bbc2f1793f9773d5c60b4244babb3a0b1c3b8cfb61ae4d204fe495135b7912f818b28d60d7df0203e58c812c74db9e25f937d135a205d92ff6781cc0b635f5b5eecb52ee4232fe505847823cbac1a6a070203ca74f057b1dc3a10030389e37e2b889b8d2cffa9a07991bf5f5deb60a492b94b0f999e474c82c0c5af9147c018c43bee40b8971bcbadf5720b550073988eddc6517f2c2555266101cdddd84cab53ce5f9932389432167ecf5731e2596ba9eaee4af4e98bcf52667263a2ab14bfb474f4a20e8ab523cb15b111c6a7b767a2cc17418d5783132de09ef9bcf5,0x7ee718cb3ec67d348d8682b0,0xca688af8748b12d1e8c87005148e2729,'a50e73674752afbc4ccc4f2e662dfde11ec73f6129572f90b80a9d0e12f907cc','74','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('9','5','R_INDEX','simulated',0x0669650995f777d0f675ae9cb321411a4402f956244fa16b1e6e11a2a4fbc8be8065bc8dd4df250724c5818d1be7e83a35de2a461c329f03c07a2a2f433fdcaf1a4ece1d20ff7817ba5286c2537f3360397fad68ade5de5986645074b0f3d42feba3b06d27894665dffb11c37b87cc3212d47d580cd069bd6a89dd2ff9f6a769a381ce8da91a0065dc42aa6838b85e3966d7a546e71ff87fae613b7c49bb2d7676824faf3ceff6591265fd6635bddf770d98f586b5fbe925ece18b5a90c68f6d4a05eb4c971c7c7e962d218e3fcd52ee6c237f0ee361c3ae21f6f8b9d73cdbca1c878dc0c1a5fb79b0d4da3ec22c9456c61443d6579c7ea355c2c560cd03a8b08e6a5eb1d33235ecda176e04a59278f2f673836cef7872121d4e162ace0949a3c67cf38bfa57435a71d452806f5046516e1405ccba49dd68075bf99fd6d9fce14ad3f7d81e74e2d6c36a5f2efb21e29758765f3358158d05efb60b3328aca094cbecf197c03b54798ecdd973b2343e910a127282da7028d6edb327cc1de0828f56b9eec40d72de79abaca377d4860c7843e985c90bb1f750a21aa3363ebdab457ac7da003e6bb72270f4d407031dd84ac8b7efa5ba2fd29a078d044fc8e93db33c0a864ece1e88a7f2fcc2472f3adab6213e2f183aaf887ac286bfcab9eaeeac70f1cddabd7fe94d883e70901d075d52841bbdf50e,0x66ba17e78ba797a1a136cf59,0xbe172a87b28c5dad18bd015b9b23f533,'efd6d65f99b57cd47ab4acbcc6a30906e5771944fe585afc5e91672c6e2ff177','76','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('10','5','L_INDEX','simulated',0x55b43ff022b3f14ec9804c9d5952ef7270e2ca7db4da4e6757ee86468f4bfc61a0936dcf5b5b07919ba7d5c9cd2aa74d1cb87c1fdd352a55e37637896572bd14d3797fc6ac7c741ee5f2ae356b1cc799f4fb629a07c1e339f11d1383d152a7cd9bd3914d3f0069d5ef576ce7e23dd23ad11edb4f7ae4a8c15cfb77c1d97837d76032e01f9636a57b038e2fd704e64a2fdd1c2587bfa4718cad89991e3020aac9c16d6369a0bc9e369d102a0207b8bec9c56c465324f6d96bde35f1766cb2f74ab55756c45adff3ce40dc62d07a9d58e6dc39c0e70c4370b7fab771fbd65dda69f40c8888051f653c8276f48b00d09ada02d709d1cbce2810cc5ad7297debe073f147cc5f6cd78773e961c2a6a402c6ec31a4edc38b3a83ed8f3ed8dc3207c2621efd35176864eaaf689636304d923c451b1586f0aa4de0f3342f3bf98dda8e9b9b6da5db1c23429cb0dc37c6c1965389aa87f5db53d19f4e32e5a9cea07bb2f65bcd91b58ec0e068aaece41b541f2434e7740f7445b05c7080a975cb00779c8326ff379bdb1813f333388f6d3fd72ed44fe3afd6268317e71f6d4b772da51e5aeed54e54307dafb6af54efa626e657340425d69051c0892627aad1b8e473b0dcae73f9ad2838fc1169a0118170813e854d79909c98e34829f422817447e9662f1508119f85f981e76ab5d3f341b63ecf38,0x4715a3e7026af2fc6dfba4d1,0x314a4261710564e611f41caeba69ede7,'ca307716610ff7e8d14559ba463a86d70999b1033fa25017b1525950ffbd8bf7','77','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('11','6','R_INDEX','simulated',0x08158a2d8be6e3cd276b99f6e4cfe19d69e34a2a155667b2db7eaa7cc21e65e88b557ebc6a90b504c0a676b2e034c80321a3b5337ecd498cecd7d34bfaba8bba5903fb90802b05e5beda706da04e334744bc6c3daec6f584e8f968ab96a353c3294bf2fa92457fb668c896348ad67a3d7b134b5c12c1310b03abb1f23d3378bdd73f8d7484c8293a50cd35d768768fe80a24662928cc58daa25d1886239c44e591030f9c0be921922c24cd0287f559bab6cea9552559ed5052caf7beb90f919abf15c82346b2eb0d8c0ffd85671b5e3c2ca49b7e9e62a29976f0ea2b8b89ff6cd5f30e28fc3d9b4d4ffb0c1a1f663db0940a044f20539e93fca2f85bf6bce7b1ee8203b859221c8ea6d5b0971902d08256aeddcee3c158d6fc3515cab0635f80725a3767592bedeb6afde7545e9029efcf83e98fc7709754631977e2cdb23156d4665d9214b116171e8c552620d947c779fad7bc3839a988d374c827ce4d843f69ff27f6a1bab3e6e13dce384b24984f5354d5c6683d0cbdf5ffe123dbf0ffe4f2287b36c14284160f15b6c2009704c0b0d6fca66d59f0065d1d714c594d3b687a3303fbc897ea703f9dcb6d8bf89bc448f25b14326f98ecfb170deb2b701de539ac5414e56b4e784f771a2dfbc55886cc1b61c61e78323e40afd21a8bc700d933f9f0532b6821f0ca5a237514,0x72b4912162aa7aa8b4f35384,0x0753012418cb43cea76e6823e7202e81,'8de7069df58dfb9824aac1e96ba41cc5eaee3cfa205cc419efd32646fd23bc74','75','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('12','6','L_INDEX','simulated',0x09c8b2a47d50853954845f3bcce094633bd3b1866f4cc4a1436e9775e32deb8c2ba64541c64c249e4a1c82322d5b794eb362e83427bbe327f81ace4425c2c902dd2bc1e36c2c9f719d2ca1eabc83fd92bc63bb4189ccba86dee55539a02eb918af4fa19a8d8499425cfd1228dd7f85940eb3b277e372abc9dd87a109a528b9a895a82b8929b7ef2e2cad7289f4905164facb6843e5211d013215c23e72457d515ee72ec0d61990e199416c114e16d38ffc69c4511c3b6af65d3c69046005bfe191d1f8161897cbbf63d99c87ad2f86f318a671d2201bce6a43b7400aac100ef83a71db008c3278b099a0467d56a9596c39a7c10a0d845025d0a8391efd731cd7e339b0db038e7163a7621520b9a3969b9108ec2571059003ff5a638b0fc4fd28fda29ff38f41e5f12600477c261f537fbc6cb9dd8fb44ad29c80c20cb06a4a790104ba77cfc4403bc726b988b0d3a8cc032c1f2092510a3a1c76afeb320ed8dab7e39cd60c240c10655d545a395c64804993e4e88ea8e12c80f520476754f8b7e76d2a6b1a35166f3e3ff522d227f6de43eb65a7371e56904606a02b3efaf3828fb0387de3747c2a15056a39abaa359d6665ea3592c5d97c6ff8c046b525bc825a25d4dbb75605c26d3b922c81471c86821480c8df8966723c893e42b53f445b0e2ad52fa42aa8347b36d31f18be2c82d47760,0x6f45da171159fbe174745319,0xd1766d6f52b27a4e72f6f555a6acea59,'9bc4e918e8aeab19c6e88580dcb2123f75a998c9e0e3c2983e0467f3f39e2f5b','82','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('13','7','R_INDEX','simulated',0x8907893b0ee2569f9bcad29b0b85f5fe2033f109a1217c0854b5dee5628abf505697e985e0b54076f742c7d044bcb078f1eea7002be71659e5494ac98c1027a066790b684828ac8baf8993cc0e3568111ba5327bfc73ebc71373f640b27117a4412efb94c6963cb2cfbe03645b4de0428d86c8f532cc1ff1ae3c65d5d759e3746042659e1d4005381cc7f36666fb52a715413cf34eaa3248d6c9fbdde6e723ecce1bb22d379c43031fa3b094d9cbcefe4b2b4f163cdd3052456877a341ed38b520772b30baa3a8b9bc412f378e05c4d9fb02c44f56589dee735d2d5ed2319d49163011ceda32baab1345664de5203786810fe2c6ad2e94630920891e41e3878706104ec80efb0111e41f277f5e95c4e8ec7cccda028a90615c5f616a720d34d86c90dcb643a75bbf450fd5914b59c21a8dae10ab655a0c69c01b7d5ff84964c7166eee8c723da61feb07bf94ae227da3781b141197a1e156914f42e9baed06112c23a90955540dc3cad6036c049f955b941158e944951c566d8f6f4011c89e0a06be532b525aef5c35e9d089f4c68e545a4c571ead23538bf69ed7f32f3d5281378563ef7ecd80693b1be056a0c3d3fe93b4d05f4b7f9351a0a61b53ec6d8935319373abf25fc6fbf243ad4bb86fcf1924094aee47ea32c65f1580ab03dc280821e462da3d8ccf1d771c6a834a87eb3c308b7723,0x162b6684ef8f230c8495ae47,0x06f3f97b5cb954a0df05ee926892293c,'aac517702f1cb307be6a77e9e4f9618dd985bf1ac336f236ace9b9ff32662bb9','90','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('14','7','L_INDEX','simulated',0x858b8fbc625eb516ccee6da9f40849ceca267ab193562f73a8921f92e38da31692c13d4776d0511bd56ac27a692b62800420e894f6b1ae99e698562152c767b8e202c28e5bdcffc49acae253696ab1a253880c5886c5597f54e4ffeb55f05e2fa60416e5de7a8e7bface7189ea16875d061d67dd0b908cbbab1b8cd294248fdff89c791263a21ed1dc4d0552a17b40e2851cd5a874d98ed08ae439ef92be7c9dfd2ed05e5a5aeaef57ce587ba70ea392b65e261e2b9dc40077815abb199e812a932ff7190f92f7ca034c4edd36fdfbbbaa56d43f1387ab0826497aa1f1db420052e3b653f2662b7445f66c0da64222196ec45bc18b7196168bc76f23772a793f25fb96064382e16068adfb807915e051f013f17c4dc9fee9924f6314d59980f99d06c976f85babdbdcb67835ed05f7b30d33172f004a78f475b2fdc8239601ebcdff3c51631a1352f89d562aa841dd21824b3a46609ae7ff6d67e9d713c11adf12908ed6850cb4bed92aa76a6b81b402a8bc16d7d8d54c2cba6ce7f29d72f721c192598a3fe3a24a6254726a5165f7b32f0de4233f7f9893171b9a990041ec4740abb61dbc6843e335066317401fdccf43def1d9f2dfd84af1b997b8f692a52ca6554d451a7ec89f90e3c3720f0ebd501e334e61eb63b55166ffb008efbf259a6d283f0ffc5efbfc2002507bcf14ee33241b25e71f9a3d,0x6e22bbc901e34d79edd2a77c,0xab388677e17d12aa72d7eb4c96fafc8c,'6400270641b5850c9f424a973da21fe606883ffd323d47784e59540af02b9296','85','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('15','8','R_INDEX','simulated',0xfb161ce483f4fae27908616359c524ee3f1c0ebe73d76499a6d7a46f1b09ed3a7ce072fa5805983aa37391bc48bfb6f4916047dc63779c0b3aee4ca475470ea43b0182858455c1da697cf14afc9070f9bbb7b1ba91e3d1e357224042da691e2da99f2b967613d9318b9cc6a5fd4140283252d02af97fe085b11be74c8ddad327db1bb6cdda549e1e1c509b04f5ee5257b99742bacc41c0dd1671cf814323f290c63406600510be38a284664c8c072da1d5d3be0b95bd6d451df1857d30a9b2af2a5d9bba356287caf11df071908acf2aa7f06bcd41579968da9d6c1bcb855b9576dca7bb7854e0deab37d045d7772a4deba77ac0e0b80e6aaa66ff02ecfd38ddbb9726a2593935f9cb26eb6fa36eaaa1b0082757632f94f67097c83b2f1919230976f83913fa602f266d4c54eb388420dc67d01cbcf4b12d207de81734c45fb8ca1441e7269708fc68a2dd2f25dd124faf8578efcfb16d34e1dc712624dcbcfb6ab300885c4b0bbfbd574b915f563763d6382d330047c894d56e8e747797d1d7f22e595e72f5c79e636997cb7a06a0a64f09e862b40bbf34e06164a9b158e68b985273fa00ce1a8647842af33222a69ac6fea02395170ef037bace1d10542aad99779df11ef391b7852f374165f357ea6d8d2d0463af2d01d710829e32932d6568e26a52a732013bf1f4579fdbfdaf07c6e2f1d49c20,0xf6a06c7325da7664ef98279b,0xe42015f890e89ceeb0d141da71de2c5f,'e1701305b520838dc70484e01cac762531cbbc30ab4c3c378ae9dbdb7d5b4009','85','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('16','8','L_INDEX','simulated',0xc1e5794b4593df7897d6a2af465b557ae253782aca6b1251f69623d8642f0e70115be6b47adcbb2ed54d94d93d26b1f47c3943067c0bac01b128d4a042efde04a714433d7066aacbed7cf5e9243e31cbf33303521df6f56c4872faf785779bc434199ba6fc92d5a1fa146c7fcdd9a76cabf2d763ca54d3452b4d9a1a202b158807f37a6a377461e7452e52bcfe3a9873612fe9dbfcd4d03d90a505ea1c5c562224af6fb89f3b19958099f3427933cce24ae2fe6830bb37b9f5a41c1848b8ee9dcbc0b4f482d6e35726bc912ca35415a54bdd0865bf4e74de12148cf682555dab6e0eb4a979c86d7ec0a760469175241c273b9ec265695a1c50bd48ef297d50358b9bf7534a0d169b68776f2e02e1a5a605a340b26cd0eb1434541cfd66dbcb305803ade85a0f8c46a2d29c4d34e51390c7a47bd216363f4bcd7c94fecc3eb009183a46de51c59963ce06775d25adee8f4d78a6512ad0b7b247041153819802e807e467e7be9e7b50a35a360aa4e40a08ee6f8564d38fd086620791b53acb3972b47b43ad52f6d8834c94a4a590d888e5b6c64275dcd80208abc78eebae0c96bd499f891e02e16270482a2079ee16d2cf105a9670bc20fd45dc48ea81234f129e149474d69b954f2bdaa681f7c80e0e072e2bb92b7d75294a63a04c2b7030b348f6584cb620c2c79137c3892febc565508a028faea5620b2a75,0xa9351260420e5a26bd06d805,0x1570ddab1083cd9090383a8e1e3d73d1,'ec9da313f04048519a8160c23f5141c8d19c076a2ee9d68e8c4faa01187f2741','86','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('17','11','R_INDEX','simulated',0x73c93cef408a45d5a4236ffa547b9cd26cd18c5b07cf45629271c8723aed581187f7c87c6cd73b2420f242a89a312dfc714836fceceac2618cd081dc021b4dea0e567b56a752617b3c42b67ba4b33103a91159a4116baad4c4045b6dceff59c096d3f350fa19b5fe801a9f563d27094a14d0cd8da1950856d528c44a029ede4ecce56656ba15594a84a47ba5ec5acc7f06e68b618b02aab8fb3ff663558de460800fb0ded263a50130f2ab30960248caca90278cff42ff23ad2fc4a7bbff29bd1553133dc524b7cda82365a5fccbd07a1c8841210291497778fccda9b08b2fc81f3913d7bae358de2d8a3cfd688f72823b30bcdccbbe44887b30f7539ac4ae234e6d16afad2c733a81ee1421aff157b91c54801a489ab49fad7d313bb16bdb5333dc2b3d173139bf4f7c96d20d49b27a9e3fe628ff193209d4d505b3536b9b0b2aadd55d90525b517eb649daca6f39b98cef5c6de938838b55122a7910e4f47fb3410ede3e6fd3513b55d19527ffd644f7e3df34b1f7c2a01efa4ff42fe3bcb6d1711d87cd10a5c1a966ef5b80bd9de3fec7120164c5e1c3ba10b4249690103197900a6824531ccd1b47333f0f4d93aa3d9a02177877aaf63834b6f1efe1deaf322a66deb3dfe66f95121837c7d137705934bc81e4ecff6ed8cdbc0025dfc1abe5f3c3b62fbf97bc0d317b2bf2fb12c26eb1de9c8bf28fc80fa4,0x6b56cac65d37695f187c9554,0x2ef61f183c3befb02bdef5258f344cde,'95b690a137721658d56fc94ef06dd17a61a777171a9acda85cf0ac61bf1c5262','79','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('18','11','L_INDEX','simulated',0xf637d60c494734fd2889c38bf00d6f82c8df13191967c3dc94dc520232216186f0e8eaf6c3e86958e69dbf7439303bce95aeee4c34e3bb9a6940e0bdb5a0698bd62c9e96bc496787fcc4530b8f8f3da6d5aac4c48a6ac3458231fa5bdc9aaa7098f58b7a9c7612e72dc12ff709dff48ea392c6e7912920b3ef7a8b868c8c0cf464d95c29a256984f0417cc0807be9a7a81d9dcc92d92adeff2083a510e8abe40e13da4490327c58ced8c35bb98a28041b15d44b0f87ea73df9d20da75facca7169132d0715b3eb3984bfac8f7510d744dd935e031152ed3cbcf859a0a45f93f6ea74aa262069fee7e8145ef4b9da63522b043725a3e026ce786f95b3bce7105ba595549e98e9450096121098db5147950430a3ba60ae2cc0b3386cedbdcfdb064563a0448588b8d437730b065a242edbd915a607f89829abf907186b5c923c7536a3c0ffe0cbe286bc7122d664978a096a2016cd967ef503a7a47898abe9b65d045f1a677423380765763c5ae1b723ff2066604c0bf5fc847b3f48d81a5837ed3f372384ab0624c59ac9321af3870dc1d44fee8ba44943b19e14731250395f1ef54ee7a616802cd0bf495689e58add7144cf0b9caa8dddff928bccbd28e488d6f2df46a34599720cd84ffd12500b3e81d076e459bfd6553d558143d0a68a76f667b9e327d3a69fe5626f72ebb6202f7cf85a41d4644561,0x801fe83f382cd2c8f08810a7,0xd01e3e935de6ae0c8eefd0a0519c2bcf,'4d25573374ec0f1ad8ff8bd3d9d2aa22e6da6856904f97877ead8efbb8d0398d','67','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('19','12','R_INDEX','simulated',0xdb23240bef1d62b7f72947e9731dfadcf097cd57509896da9c6077d6423fb1b47a288716c36bcf78d0bd101935072e72f88312cac5de3b3a09bc0490a61d6b7861d6cc363e2904dedaefd4370a1f16d8d1dc98b424f7918f3161b6ab1bea8c014e3a66ccf92abf5fe40bc7144448bacf8cfb38544bface9823972f2d406e3d622d046f753d49179d96c6312a8285aca638dd99520680d362e1f00aae805127ceb7a701eacc8c92d45c6e8ae9a5725be2dd1c6805f1427c1ceb2907da912424823061bf7a1dc592b023de14ac07f68ab21f0128063ba6f71d5434f9c92c15a2aaa2c21b5afb8366b5d57a646d8d9901a880ac55ac7d453ad5a40572c4a44af5319a95a64d5e9cb4db75e4b596d6de70b7b1d78c56ddf7640afab2669e69980e0c2cb99814fb88503ed142445c141e8980f7eebcc18c17ef216462689133e1cdb6572e3ccefaa935cfa29d3b2f9fc89978d8dd98f21f61efbde46616ec8e1d0a425280a1b6b810d003e3b9b3f661cd5b94c5715f6876ad0e559688287b0defe281c87b0f65ffd431b3c32a317869939ad18aaa2aa3f1b52396279f3456cd964565eab01ec5390c81922fb9e1cc77828aab60075e2921b0a140140c6f9d67f0bca910738d45371edebdac1aa57a697b5290f420e2d1eeadacf1e670d76d626a16f53fc6b07feb6d83e98b407c3f0b43be8e6ffe2a21cdcedca9a9f6,0x000a4e1ecbe2a40b83ebf633,0x21585fdfb0c31e377dc7bb666413ec7b,'b5a767af8a33542a8ab93c5d3e0357ea9e9ed45f308725fa788ee3c76cfb8dad','74','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('20','12','L_INDEX','simulated',0xab66fd943a8213a8df09995561bb9df5f9a8b9585246f903d7f20211115fd8ebfa7de4026e35579c60b7d3de2561b9acca4c05d6ee889e13d048bd5aa7c2e693a1c5d183333aaa1241c937af06e755cd1c4fdd214a33ee35bf08bfb2a3ff9dc844689696227019753b7f9cb85bc79c7298ad57f2abbc5f157b112bc7ee684663a990145545c9afd9c3fabe52688f6f3080f0f62c1abac718979594174fa40977ef863775cba7b1a155fd3d2dc39b67cb506b9aa3df608389ddc866f3bbddc2a33bee97ee365060080ef7f8bec74152d24d5fe427ed958d4b254a2587c960973491f0f1536159aad10b48a7864cbf33a436a09da5ef1f0bf43fa1561ee9387d698822392d5f7391b3ce8242ef5c3092ac15a674201824f5bffae5735db6da6b6dea8b68f11f4a727f25ce2aa62c4912ef818c03c7bd356477df11411ac1987a1c68419118bdf1082a6ed8c6d3cba62d839836cedc4b477c867ffd3c2525ab0f287bc76f583dc88543a87ee113c408d5ea150b13c67f230b6adff99deb57e0741c118ae67e83090600d2549e2951b8daab165ba3490b8b93757f55fd60c16094837107f4175e62b220dbcb7bf3fa26c332b49a99e44ed67a4e48c85f861e873c1ed4fac23471f3e2252934bd658a71562b42ddb5338d2d9e18861d0a7055ddb6f54f53e28e9d0145bff2,0x69784e8ecb06d50afd024844,0x61ed8d3016c2576eee8d249d41933a8a,'601c6548e6734845538eb9c470db26f59984727c240548cd81ff901613561dac','79','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('21','13','R_INDEX','simulated',0xc1c855602f0753d8e164d6cc42bd6ceacd07ad5b450c9ad4f7cda6379f65089569396b3d2fe79b176e141799f5fa260852a5bf510a8e83de2ecc8535c6988727e3f0a383eb8a92321aea644ebbaeaf61550a6a3288b4963426faa0d95050e16fea98a174e2e8bb7dfa30826b2813d9812f0784ca32601910483e645af44b6c5368ac69156c159a5ae54a34b3ebf7f4cb9f7f1d67f37008b79040189e1c7cf4185b7d7951e1fa216c4ab46fa56f38cd8ed2358cdb88f1643bae8a9fabe40b10e0f90ba6f80179af3d26f5deaa6f077e4bdca94de30a7eb69a4b26a73f827bd092b1e4371f0d0c34081519e0587e83a95a58a7672291bb71d97bc60fc1fcc704dd736d258340de6fbc7e7cd91d4ffdea8efb05f30663ae535f8f4125657edc25ee4823ee55c72028fa4bc473d76b58b81bc6b862b6ca162f5aaea0cf01630a5f8432d4e7ea6c2160128626e138746763651281226feaf3c0899409df1af5c52c69f829d3b53a881efc8cbeeb848621d10669415b85d90c963f62da8b127de1d913b1e8b42438bf769578786b469ae9ed0db2d987f404cacb8a09ae8256f4733e3fda098dc06c069e771e2454f61e9cc03aeece8487240922692835f188f8c0f0dc6db718722fd71101235f4ddde73f73dffa25c6469fc8acbb089e7c3c5b3fe314aace,0xef74bef087523b679966fe41,0xb4f392e6f9af6f30478c2b878872d6de,'1b77a4b0047a45ada8869d60924dfdaf72934c59916485ba5a782a442494541c','85','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('22','13','L_INDEX','simulated',0x6823181be90be7f46f59465b6d441c340c017c03e752c09251db32594b3d7e98ad6c01949608949988a8303994ac698376b554c4f6fb619c44d52cdf6de465c053cdf58526a5c2d93ad556b069dcc7989f99091910b71e4cdc01a237cb34b1775e76d0ed7e45d9a88508edd5396a830ded8984ddbe5ac56346271132856631a23bb5379df22b19f039df5bc6532116e0533a3dcbeda0135c7ac135e3b200d8840b7ba2fc844bc7ce98fa7375a6565c36c48ff81d89f77effdeefdae26e0b8b819a32b41a9332348c04dc9c53b8e58b499560c2fb31690064b769fb074f2e91df24331de9ce56e245600c4be7e437c93bdf53b5bedf5ec7ee5680d75623c30949f44300305e12830a0a9ee73de2f1aae4fccd8bc8cc37526a57553b1b1431b12e9f26efec637d8b8b2325519d8f3aa73447677d4c76be0df71f3c3707a3a6bce2b6d67646f5938527ab0d267e571a5ae467ad3bf20b35fb5389b16171e6a1c75ca4ae7a95ac0032fdb365bf3ed46dc9092491aa14fcdc2e8a1bc47d775303dbb55e2ba6a1d017df6a7983d00961ffd256f936afbc7e0fd25786906e4f60bb9279724d1339831092564604ca64a044808b6f15990fa6e483f363a1a757416099f0fd4c6ab6e50637f9476750c47ace29141804b0212de57c12c851939253a13f16484cace069a87b02d78468832b15e2b87f,0x5d630fdbe9b30766c1480a9d,0xf66c02731c8b32175f584eea85a1c84f,'d291b89c57afca352993b45eb0b4124ba4d94bb02d17b964206e113d896d2ab2','85','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('23','14','R_INDEX','simulated',0xbb2ef9a695e0df0acd9cbbf0b34e1d0bee4ea62ae9261101758d21d8569fc4325b23d28a3ee17d2714bd5b75558a18f6f7969ec7d9f2e74f2a12a7c748972d170257e26bafced48e2fea66d849af0a61855a6caedead4698c80cbf83e9835a8e383933f2176b42dc94fd14c70021a40cec915f37c170aee9679f209bf183e0bf2e68dcb6a5d8b1887e1c5544dd9548595455f32527209942e51eb2e25b0e93be946278ecca6775bf65fbb5731bd67c2b984a973c9de40b05d55415f0cc29b77197018b53f3f597734f9b2309ffe4046b8912ac2e25c56eaec8db55f48b426ddff4e3f4d23c71e234834717ad779efcf4a15f66d151ebef8e1607fea8b3a0af9c1082252de89fc178e6dce3d193812643288c6b937826837e84c31403ccf0c59ccb1afc032528a56e650352e10a494197093f655ce49de676fd2d91356bce37737ff6548974bd0fec1b298ec331520935e239899eed85600c21e6611d5c1dbd723f9fb2ccec3124272a9b959edbccd8979bc98a28ac6cdcd69fc571f9fbc25e022348e5f144aa345a890434777600246e01f8408c723aa20b57ed2c14c94571ce12ca26e82192e6b518c6acbe51ea310f27e81c575baa949006c09a05368e702214542e7fb8de64a02e22c402a8586022160efd3886feec885a32020ed1c26e23c386d5407902542f3ce69a2aa4492559ea469fbad20b36ae9b,0x4b3c458d5024cc2f139e447d,0xa7da49909e1bd6b71d8ffa1e0d1bb333,'eeb069c19838d77f17900df01cd93c52a6d8fd6f6d210753a6e462acaa556831','84','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('24','14','L_INDEX','simulated',0x713e97fa9ad6cd8905397212ebb7091b6a14924c91275ee2df4e966334a50ac13dcbc019907d206d261175f29b340baece86e635dfd1549db536d26f84fc52221c9c41d21777dcdf4a1586a4fe3eade15125fefa34932244e9b7d5d11be73b5be6fb0eb5387f9a5f6bb7034d50516a8822cbc2bb55f83d80a0e21af8074a60d18ea9fc4752b27f779be5c007eb67f14bd273512cc933d7dc5c177ec7a15df837fa98ca3be81d39051f46f990f0768d83e28c5f5eab0ea54cb780ceef5edc0d292e96e450cfc1de26790aa99839d24e14e791c1d88fbec48ccc3d1572b5ab962ee7463f854ea0922f07811fe9b3d75328b381b4d305f79b36d01461cf9c0b4d20c4069537f88a6bd9adc80eafc790a5cb32cc8c6203d635c36055e7a8f579926cfdb65535391127c23f5785864c2530381504ee6985153bef2dc4d24d409c40aebde5801879a973c17c13580caf6873028893b28f6d0219708cbcb3277a7ece641fb219a2c65a3b8e2d6c29807b60c5f560d18bcaa0134d86f1d9b1cd015ae4ba80154f08ec69d8d06aa9831ce1ba72b107c728cbee0ede9d3285f978aa869987d50f43fac5968a40fd4c847e5b6f412b2feca99cd49387611775c8f0f844c216cd4c2add143e4a4925256c03e2fcdb9aaf999ac822bf1b2411c91be1e9875afbf530410373da6837bb843c0e2429ab7dabf7ed98acee5ec2,0xbaaa7f115bda35d795f3afec,0x15e02fe0b9b53830e77d7a8732600b7b,'81d74ae0866c2571d3b7ba7e933956272d2fff1f02e38e5af753dbd0fc7edac9','86','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('25','17','R_INDEX','simulated',0x9c25630ed096ed66caf30d33b2da6c1ff75672c57f13ee5627b302fda9239c78b58955749efd745d0b7ece5852cf4dc3c5efcfb65a15aa3fccefff112301fe758abe5c5da461f6772d198a5a741817f009c2e003d3d96a05686cfbfd3b55619dfc72831502472b3139140e7fbe669d749c008b637a79b7c9b346cc48257f3f98196905ed37fc252c1031f588b7540b4f073604fb8e39def8a2796c5316255684dca193d403744cfea3b5dd44d0c1ab2bc4883951e3d3e18eb1fcfdfeb51e99873d3a83aef20266be94280f9544ebc962815bff75842f039113fac85e7df0c4639421a07ceeb77a026a18dc0d82a89d35386602e43a7abebd030e79c8bf7c234d460ce7e753b9a3d45e59d07b6ffc53fb0e544c78ec935eacfd6f26c535775b2327f036ce17b3d8106f8ea10c4dcec9dd50f8e1fae610ca33671118a0d095cf6da2f36826fd70068dacc66a83e32c4cd791dfc315813c64d06b9aebc637330707b273a876b76161ba29ff9f796d93bce7399072cb83c4462ba2b96d7c3602b0ccedc7bfe65b3a09614a17cbcaa93e518ec3c5ff2442cfed37728bd3fe869b3f2dd02390121b5bd4843b3beccaac4ca48276d88133e0125e6750a7216f2649aeebe0664bc32564b2b12b13e8ea14dc0c2f88af24190fea4d6d1e85baba582865f2f310bba9601c747aafe1d3df5b5597affcc6931b1e,0x49b0c5ac29f0f3644c51e01f,0x7dd32f655c7935b7694c97638617fb54,'67ad657d53e7a321ae36cd06412c6864d188fcee70917e0c8919c62702e1477e','91','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('26','17','L_INDEX','simulated',0xda74055cb872d1e289c8111e80e57e4efdb35d20070bd0dc5fea2c59323221c93f7998423609bd68845a4d304397654e4cf6d62510f5bc5dd4919289b3af83185f65cca948e89778c8e93b4c6dc55e8a7ae51f2783df13720462c4374207ffb560a42b7aca92e737931db0c329c9b66e2546a1903d50b7b1be4f14db94ca7011c7cf802f9579f9e3ffdc6ccd8ecdf4be8a929e692d28dc141e060532a879dbfa8f9c41eaf270a01a7697eaa634fe334af43be964dd5338c193eb682dd288c54ccd51e0ad969d91c56c4e8a63700210313e3e6b086b67376b4dba0b64fe0286fadd2fd4f22039de0ae321f4b8ec93609de8b563ce8a18484f5cc0583376f1a53a155d6c6f4f65275ce3d311a1f3d2310288c278f24d133d1b9f21b9cbfb3e564108881c1a2b6e3d3a5ff7232446e791eb6d547e4ed995102fda2bb553d5345371d2613ad77e9182994e89ef9332fb0ff7cfdf66e13c16529bf7bcfc8d07e9bad3693ae2f6edd53c1bd0f4100832634798e809d39aacb2a6eb2fd537f239e3a119e2439bc7bb67207d159429bfc31f02b1751312c519caef5f91a49eb30f5589e5cf1cd57ea0d23aac9cc3943d136a6f9145ac2247029d5c09c7c6e451a082c45e7f82c9c8a790e8de9f84564ade4be80d9ac9955521ff86e6c6288342f1187b0704dde06354f6be5cc98e7baadac54d29fadb42078c45528f84,0x5c206c515dfd26b8b625fe88,0x9fba21e617838a35356fd02af7d5e0e4,'613bf73c0d7a47e8046146446bb873489a7ca04dc239e927b7db85e0a758b1aa','94','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('27','18','R_INDEX','simulated',0x52a6cc197289dea1576d46d809fb49fb7251779598d2e1d68f4b64440b94be9b25539636891e205912eac5f5d2659e8ce24d723b29a5f26cb0f482876e683098b544cc7dcbb0a4c211d1e64b4d0b61b64b02beaf4ce1de5a8fdb839e1dce56c8d91efaefdfeca8f1e9b0f1940de13d3ead6ba18d6ab6f413da5c2d70f053a1f092460e65b59ac48ba5328aec0ddd54414a322e4a280093834e4f4d2955705a0d9139c44dfef21747dfe54e6c995481b757890a2495de27c553e7a186a4cb06b592ec0d780e0129923988055deb085a0c8827f7f5361fcc108c2590afb2fd5c2d41f8631d15160f51699b3ffb54afa70c731a5c614031efff2158082e9228ddc23cc3bd287cf660c25c5ad693595f0c9dcfa28f8d11a35c41823656fd002c56b76e8027adaed9e5924a91000ba02b52f0ca9addc94055475e20bc05cd285d1f813abcd46d66a1e89320b82df55f696cc137a50c5b2ba4f92592bccdaf5571caf2973bbe3377f4e3b4565f86646e2a5bce819bd6f7bf22b3ab3eef937f0728d2c51362a8445536559d2646a0b91cb6b27044f17327d8784a4e756c9eed761991cbdb6e2b5f51eb20fa1160bc0e7c48809b56a6d90a9094acff16c64c4710aa42806df5a5e53bc219bef48987d2487198f25f8bf886297e6953d60effa3aeac3032799a0a36b31e1d35eeeba092fe975e5993abc2854ac9cf6d6aa3,0xa5166f8e16a2ff542dc898cb,0xe2530a7e8cc383f70ef74a0eb152b62c,'d216dfca9f3ad5828c9adf9efd91dbb2e9bc85270a7eb94ff3b1141785490e9d','82','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('28','18','L_INDEX','simulated',0x24bb47e8e581683271e5e770e2d402573c93c38c4eb36424b6b3861fbb5db23cd78a909ae368bc8ffb1c7e5d86d5596953e76b16f87e5139cdb56a7aa486c05ea075da88b06f606d0f02a0bbf89215228085b348ab05622f7eba4fa019c3361aea5eac187340b30f2c49bdc9a70daa38940574d85f807c6c9bb910e6b4692833a218dfe50534c267868ace1d51afb2f703972af20adeb6e05a11fea02fee813f63c8366d83d0a9a0e09d7f11e8be3a3a245d7284150432ac063a1a4478e16ea142069e2439d2c55e8d66a6e344510620500d5534b01439bbf71d68c91ea3d1f4825477e8e6c167a557fea716276c9c3801d743e8df42850779f942ccd175dc941dce4b05f703a8ecb73e65447f50bce1e07533ef20f6534403de8d50af180d973d24c753db92fba41454bfb817e4a0e250bb57626b5ae250e7492ecba255a2771782e76f4bc89aea3ac0c686d4b0cdaeef8ad7c17600880d327a536536b87820b7c9d217fa3c6470bdccdc81cf946d0796402b4782411915dc4d836b74a017dfcb25c811a32be111225ddc8534e9f773b462c0ac45eec8c1e3af22835a3083b2868e099fe704444d395e216c2b7856dc6763f04a034095302d614e2317e56e39ce738c4e59d3aec87a6ad61774daf2b65b29cff9d01e1840b0c5f4abec81b5cdc2abf4c9ea94fc89a5687ab1307d279af68cf912f417,0xe27d0c2be2690d953073f151,0x84f063e04570a9e8fef0c8496ec0a0a5,'9a7b0be52e3635368d05fcb82e31368f23ea5552128f6e47e5a0d1833e636f7f','73','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('29','19','R_INDEX','simulated',0xb752e11c1a338220f2890e248dc7216bec3663b9acbf1ef00ccb86df383e9b05fa888b3708376b9e0c6b7bf16ad0cf69fb7a44bb9bc6a580d14cba98d47507b249bebb2ab15329972aaa13a9449668ad0991b3dd34ae76ee9f82d84186b677afb1e293da63f13acaf88b0d587cd7fc87ccd8de1376d9457c9017e0ea9b326d67e5f05dce80f786efd707ea0e30680688395df1be546fe1db5c6edc285abc42e02b9194f9f902a9629b5cf51d889a61088034613c4d16f30d92884971e2bd8a429d04fa8f54b39ac617260124766128835bc92258f92bda3906f428b16424996abf6d526e2b291bd0c903644b1faa8b1bb68386f40a4feaec7d7bf370321f8e5446f491ec0b9e68764424aa8a538e120afe4820ebcc0f8f967e14229a88b895548cc841c49183d5eda72f324c94f2fe4f6ae1b476054ea48be477399178e903d75ba42dff90cb874a4eefb42e3d66a9f1cc5ff81cb42b7870c888861c9af16929fd5fb706da42272a495e3731bcbbbf6e48f3c6e52acf62355a9c8f203883e7171bdfa3516462b06bf6fea0fc57e8dab1bb99a8b98b641c6f9272ec19f5dc202cf1c0271de35e51d9d463b9b1f169320d9ef57565cf3315da7a7c040ef202eadbc3155e7b1b4002bfe27f6556bac7dd738249e6142d970ee4df33d1fb30450d4bfba77359365afbff6f6ff3fae886a77a,0xc8f583694e8bfd8806c0010f,0xf868c916d628e6f128d6c8c9961d40e3,'c41aec089976fb0fb22b693c9f32f7a967f16af249f10d8aebbd23d49e2fedd5','77','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('30','19','L_INDEX','simulated',0x43c63a1cbc1e98808bd15b13573c38fb29af93f6a71130428cb83ae0def9dcda6593d49200df924bf459df777a9f789310f0d8a04cdc7340eb457ed2fb7fb3456b1866106ae21dfdef9d37e03b248b602a4b7fd4495abc0b0077880e14228ca002c778c4331f7115be1493a2e0c970bbf2a8e44a1a09564f450399a2cc43968b68538d59aa86fac2deebfb4066e949927284a5615d22433ca232ee9c6684caa64d439519f73a7557ff0918aa762a8a77a98d4adbf0e59d9854a245baf35cdd2ce6fb2ed9adc3a326dde34ca03919b3da10bed75988a2f17b78e7d054f1a84104cea4daf428d8e3ec3aa5ef1229fb858be535a693488287638575c6f777833fd16604ae16113308e6614389fcdd5571bde7211c8374deff37545d1e9590c40ff52b59fc7942d538c691c6a2e6945aadd7a65a00a6fce2e5728f399e89892c54c3588fa15869f8f0f47f2fec999022c31a5b9fe64f4abef22afb892633096ac182a0d926ff95e37e8d94b3c186cb39fa5c8b71c25dab8a375f03c98888ca06c3a2e5848aa52c3d31cc7f20c001ca97ec97ba4bc23e36d3cfea8b7e190ca15ebe28592924ff027428e88faaacb000919f016b731f5f871ac34f4fa0d306906a5a50bf75aef30c1870350659d210ec06ed877ff99b37ebe3666c99dd26e40b29e98a685b7626b7687e23,0xba4ab2dbc859fa0df3cc9550,0x072a5dd291b0761e362dc3d6df1901a2,'a5eca6ae94f0abf21db8a0de65b8b9219405385df32cc96a4954339bb602984b','87','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('31','20','R_INDEX','simulated',0xd20e88da963270d4aad1669d282a1a5ca4160eb386a679a0f4f9e9b0c31b234e870cfb139c8ae18ef005901e8861c689752adedd05afc6f6ae62bb43ef20187108f18c68a2f23d53ddd4d0f8477a026914d7e6304a595e775c981b96fb7b37f62dd72f819e802d2103d1faff7fe3bb0aa0f84302d5aeded78dcd3c17902e148fe54d1d10dc9556f0635e55c41455309b34abad4049c8c20fe26111fc797cfd6fb912b303e5bff9492923af87c845f0662fb6c9cb4f2fbdefa2c28a5a5e35d6d9b5dc3c92f647661f525d69c63b8018e6826eecaae40cffd514490e42b30710f63c3609c6273a4e498146000edd3670f2e5d69221ece74be766332bce746ffd79b65284864da3e9f569d5db3a9a14d10a40b1713aa43702151e28da8214a41ad5ca9233e7a12676f3863580a58cd4b73ce915bcb9c1c81c194a9ba1002ce73ffd959200913279b46af2835472c687ec5f45610ee9b97f0c81c2fcecbe40b480743ea6a6a9b7049755bb7640d33f6b7e296aba2f99ce88d5e690f757eafeed670af9cc213ab109e77b248759be1a837f31a50ca34bc2744d8f0d8c0eae9d0b78781d6e087877910454326af58c3e8dd67cbc8558803746da88467698fc2ab6ed39051c934fe18755892fae92048898bf2edd585c220f18cc171b1085264fe39af803d88ea1a76740d1c7c525d1a87b0670a2,0x9d36cc3e336eff9abe687239,0x56edead49b1dda6a1471c8624f4f6466,'3e8f872fcaca12667058414ce5aeb781b14bd36b7c0f2d9989c78e01a8a5bb6f','68','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('32','20','L_INDEX','simulated',0x1752d13bb95da6b63fa9150686a7173851b12991074b6444fad8ec0197721185f0b51d83d60e5bdb7c2ff3be0e8862c4a7b60ddc49b7c0c368408a3a23208ad41ef45387487cb17c7d21054e2197ef9dca8578402fea044ffc0ac6c4617002ffab149ec6723fb469f412b7abc96f5da794975e989b20c6012024adc5d375b9236d5a1e86bfbf080d5755f2091457ee2d01e89d2e541dde6857f46d868832b9f4962ca528d92247a09a60a0380fb74118ca257616925c59d36b7a72c008799e7cd2e95276402ef3cc1905fa9e5fd7d2e393b4f3acc1c6f62907dcfbeed5d0c79d426f46462fa01c61cabfd11737b35a694eef1562580e57d2941f5317fcc523fe7e5fb816228e8bbe95a80a9bc4156e21fe307b32030a3472500af33539f26d4ce0bf5f2075829e2c6df6005b31b206f8d6bd98ee3638315bb8edc9e58e3a2f62da1ab7afe3a39d63ed4ece744220c0993fe11f98754332871a9afb171790e11d62f7fd537444512791417a7e20224673871e33be87271710eac8eb9626c26d981a1a5387dc2e5b2bd4c213e1f15dd2a985ac5224408ce8fc888cbcb163eaaec80aab42674031e8be5db613feb725ed3c79b253fffdbe335df1a861d82b47d610c8a4bfa505c9c0e610a7f20656ed6b8ccd05be695af5ec85f729411c63f87ce710742cf2217fef9670f347f4634f5cfee01477fd,0x6587bc788bcf882a25890c9c,0x1acd46c62df5316bf7255b1ed357e064,'45e8dd53c3f73ea4ae546ea1231f48903c00cab84d62c9f345150da0cbcaffab','74','1','2026-11-12 03:59:43');
INSERT INTO `biometric_templates` VALUES ('33','23','R_INDEX','simulated',0x8fe313105ef4c685984add834d7492b3a999ac620bb6c8eb594445b292cc59c4144ac56c49fefd02b4874640ee822fa615577ad02c2acf708e06103da7169ddbdc0e44cb8bfa9d680023502ab76b9dc8c38a219ffd0ef97647161cc37d1ebf7159dbae2cc27afe0404ffa2f59ddbb226d506162017e6c44d43fb3772b307d491890cf4d2778127ae74d3635b11d5ba8d9592d28cb6c63550eed3d47cd79ada7f16232f15ce47dce27562ea0a4771cdde9d40c4bc8b8c1abcda698c0a37ab275837f5ae52398c47c36566521feb53010abe17e4eef14b61680bb52742cb7672da6ef128101c51c95174ee70e823523851dcae94a12c1e29327f825f21c3629e837ff2fa6a6e73a0b5a19fc4cfdbca44c54b35f6719f35ccae9a4c9cb21b135a795b899cc9feb64b3e5e399eccc8c48029b7eb5934c68dbe5477c2d32543e6d034edc036c9589695f683ca19bd975ddbeb35a50679c0bd7e6a096c6d65013b215427cec6bc33abe6a355b20fc356bfb99a7185093e0b10d09f2314abd3cb691537ec765d2e9cba0d8269fccbeee292c724a0a6e532ccd1087b0198e956a26d75be9c22bb2f691bcc286e49cbeecedf3e884b972bf08918b7ceddcd7a7841371080820aad1eccc98d4829fa80ffe9bb49bdbfc7eaa732d858975f3d21aaa0af81e6a5e95c1d69d56f436804f9923a089c36169a9a,0xc2e7ffb486bda561c0368fbd,0xdf93d92ef1c4efc6f61ed84c3486dc6a,'fd3e541407df38bc4c1d25e1c59b6ba84c79842cc2efc6897e3f047b27ad77f1','91','1','2026-11-12 03:59:47');
INSERT INTO `biometric_templates` VALUES ('34','23','L_INDEX','simulated',0x0d8d565963e2b3f6b5a6b93a79f4f38c37eaf0ae1d225d733fd67606050bb428ae95d811b75f150ab7e278bcd656bfc271db5bc0c54954397d908e0a180e30957b8e59ec67098cffdf923b5203137bb9ea4a4484cd527e0129eff7c8acda58332c25056e6aa15980c418ebe1e44815e6c12b40e2f4fbb59756278e6e8a54aea965e6df447e633922d93d9f205db6a895f7dc6849b38e6d25e16571567962711789782322bd607cabbe54738e719f298236b717c6a4a9f2adbddc5d5b620b78982238e04cf139159436946da442e54f46db87fe84a564cce0e09c49de99bc8245cc9dd463cb1675266fda5d6bf26411ea2aef6731ea8603019f0acb4662521602fdd5ea5f2e5e3021072a468347a5aaca41a43f482a89e04adbe054b2c0d4de9eaa30b02195cf2c48c6d20b918e2710a9d49e69a97f80d9ffdd9bb16e1f390dd093276af02070431e1a6947b5a26bde936b7eac6fdf6d476fd6946da9bd56245ff3e9850abc7bf3e4ddd9d9d4b6749e1758a96fcee8f740150a82c9fb2377fc0b450694ed96426e450b23aeae146be37cb0c7f2a4b2b0c907d1ac85038f7947be69d03017084fa7626af479ffb250b98023e697ec6656ec49f5f93e8f93595778b054f2c4211b0f3978726bb0d6651e922d5e076f6e0d648afed591171907fa91207038666463d638421119d55bce9a0e29ba7613,0x16b378e0eb48b37d57eb635e,0x67201eeb233e2504162854b1c8a096dc,'ea3ab8d14e002292bd145f1402b8f5d6124fa3f5ca6aace98b5aa414a4c077c1','67','1','2026-11-12 03:59:47');
INSERT INTO `biometric_templates` VALUES ('35','24','R_INDEX','simulated',0x78b34b9c902467e6b5463b28c27ce70fff98220c54abbbc1452f23e71322c439eebb93bbd0b2e2519511014e8a60b59026c260336e9e02718d82b2651cd00e95780d5210afe356fa47c7212c366b5e5aa62dd1c1e1b787d91a04ac8ab38dc30c3f433dedabde635ba0a99997817fccc525c82189a0bbb2793595891590ce560c93ab6fe04607f9143c7309996b4a01ef2fd7168fb576737c41eea90f8928074ce95137ad1ddeab1735d1b2d9de09eca4d18d7e341f637f7f4cc1b5117deb8a989f29c1aabdc8f2d43e73d1e6dbfba740e82e64c75af79fdea0773cb0abf12070afb8f1804c6c7f75a4f1f509593babcedb71de8cf90e6e6fb56483db67d14e9fddf518b688a6001e67071b9dd252aaf07389dcddae319e33468d58cab50707ba14145a9db29c837d2ca2858e51d5f34669f7bd43e3811146a21f461e83586e034573e6a311caaa90e12fe1dfe2719d8878a304e9fe2f40c566b1e8d6339b8c90a2b17b1a4aa7dd43ab76c7348a51172dc5034c4f4a367481066b7a9001ff9cce0100ca47c2429b2c6d369f158609c9b76f4d7822df0efceb83946979f6be57482becd879fc2a8dfdd3c109d7450eae9611f99659e2f9c5e7041232b6a839711db0dc52dd84c3425e3e346e34808f8a1c4e4c612831041deea5cf9f1f4f9b3ccee6b96bb1de87430771f1d5,0xb40201cea772acb489a13131,0xed2c782ef1a9df2a42e9ee9917eb2b61,'7eed5a5d58cd56c0748f87d2b1af47a39aca146ec38f9184da5d69066bd592f9','96','1','2026-11-12 03:59:48');

DROP TABLE IF EXISTS `class_sessions`;
CREATE TABLE `class_sessions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `assignment_id` int(10) unsigned NOT NULL,
  `session_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `venue` varchar(60) DEFAULT NULL,
  `topic` varchar(200) DEFAULT NULL,
  `status` enum('scheduled','open','closed','cancelled') NOT NULL DEFAULT 'scheduled',
  `opened_at` datetime DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_sessions_assignment_date` (`assignment_id`,`session_date`),
  KEY `idx_sessions_status` (`status`),
  KEY `fk_sessions_creator` (`created_by`),
  CONSTRAINT `fk_sessions_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `unit_assignments` (`id`),
  CONSTRAINT `fk_sessions_creator` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `chk_session_times` CHECK (`end_time` > `start_time`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `class_sessions` VALUES ('1','1','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 1','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','2','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('2','1','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 2','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','2','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('3','1','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 3','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','2','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('4','1','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 4','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','2','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('5','1','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 5','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','2','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('6','1','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 6','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','2','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('7','1','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 7','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','2','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('8','2','2026-10-20','11:00:00','13:00:00','Lab 1','Lesson 8','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','2','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('9','2','2026-10-22','11:00:00','13:00:00','Lab 1','Lesson 9','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','2','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('10','2','2026-10-27','11:00:00','13:00:00','Lab 1','Lesson 10','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','2','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('11','2','2026-10-29','11:00:00','13:00:00','Lab 1','Lesson 11','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','2','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('12','2','2026-11-03','11:00:00','13:00:00','Lab 1','Lesson 12','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','2','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('13','2','2026-11-05','11:00:00','13:00:00','Lab 1','Lesson 13','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','2','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('14','2','2026-11-10','11:00:00','13:00:00','Lab 1','Lesson 14','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','2','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('15','3','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 15','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','3','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('16','3','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 16','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','3','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('17','3','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 17','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','3','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('18','3','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 18','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','3','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('19','3','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 19','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','3','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('20','3','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 20','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','3','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('21','3','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 21','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','3','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('22','4','2026-10-19','08:00:00','10:00:00','Lab 2','Lesson 22','closed','2026-10-19 08:00:00','2026-10-19 10:00:00','3','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('23','4','2026-10-21','08:00:00','10:00:00','Lab 2','Lesson 23','closed','2026-10-21 08:00:00','2026-10-21 10:00:00','3','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('24','4','2026-10-26','08:00:00','10:00:00','Lab 2','Lesson 24','closed','2026-10-26 08:00:00','2026-10-26 10:00:00','3','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('25','4','2026-10-28','08:00:00','10:00:00','Lab 2','Lesson 25','closed','2026-10-28 08:00:00','2026-10-28 10:00:00','3','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('26','4','2026-11-02','08:00:00','10:00:00','Lab 2','Lesson 26','closed','2026-11-02 08:00:00','2026-11-02 10:00:00','3','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('27','4','2026-11-04','08:00:00','10:00:00','Lab 2','Lesson 27','closed','2026-11-04 08:00:00','2026-11-04 10:00:00','3','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('28','4','2026-11-09','08:00:00','10:00:00','Lab 2','Lesson 28','closed','2026-11-09 08:00:00','2026-11-09 10:00:00','3','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('29','4','2026-11-11','08:00:00','10:00:00','Lab 2','Lesson 29','closed','2026-11-11 08:00:00','2026-11-11 10:00:00','3','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('30','5','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 30','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','3','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('31','5','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 31','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','3','2026-11-12 03:59:43');
INSERT INTO `class_sessions` VALUES ('32','5','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 32','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','3','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('33','5','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 33','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','3','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('34','5','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 34','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','3','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('35','5','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 35','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','3','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('36','5','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 36','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','3','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('37','6','2026-10-20','11:00:00','13:00:00','Lab 1','Lesson 37','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','2','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('38','6','2026-10-22','11:00:00','13:00:00','Lab 1','Lesson 38','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','2','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('39','6','2026-10-27','11:00:00','13:00:00','Lab 1','Lesson 39','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','2','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('40','6','2026-10-29','11:00:00','13:00:00','Lab 1','Lesson 40','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','2','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('41','6','2026-11-03','11:00:00','13:00:00','Lab 1','Lesson 41','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','2','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('42','6','2026-11-05','11:00:00','13:00:00','Lab 1','Lesson 42','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','2','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('43','6','2026-11-10','11:00:00','13:00:00','Lab 1','Lesson 43','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','2','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('44','7','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 44','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','4','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('45','7','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 45','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','4','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('46','7','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 46','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','4','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('47','7','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 47','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','4','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('48','7','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 48','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','4','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('49','7','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 49','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','4','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('50','7','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 50','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','4','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('51','8','2026-10-20','11:00:00','13:00:00','Lab 1','Lesson 51','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','4','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('52','8','2026-10-22','11:00:00','13:00:00','Lab 1','Lesson 52','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','4','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('53','8','2026-10-27','11:00:00','13:00:00','Lab 1','Lesson 53','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','4','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('54','8','2026-10-29','11:00:00','13:00:00','Lab 1','Lesson 54','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','4','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('55','8','2026-11-03','11:00:00','13:00:00','Lab 1','Lesson 55','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','4','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('56','8','2026-11-05','11:00:00','13:00:00','Lab 1','Lesson 56','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','4','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('57','8','2026-11-10','11:00:00','13:00:00','Lab 1','Lesson 57','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','4','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('58','2','2026-11-12','08:00:00','17:00:00','Lab 2','Demo session for today','scheduled',NULL,NULL,'2','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('59','3','2026-11-12','09:00:00','17:30:00','Lab 2','Demo session for today','scheduled',NULL,NULL,'3','2026-11-12 03:59:44');
INSERT INTO `class_sessions` VALUES ('60','9','2026-11-12','00:00:00','23:59:00','Workshop','Test session','closed','2026-11-12 03:59:48','2026-11-12 03:59:49','31','2026-11-12 03:59:48');

DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(10) unsigned NOT NULL,
  `code` varchar(30) NOT NULL,
  `name` varchar(120) NOT NULL,
  `intake_year` smallint(5) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_classes_code` (`code`),
  KEY `fk_classes_course` (`course_id`),
  CONSTRAINT `fk_classes_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `classes` VALUES ('1','1','DIT-2025-SEP','Diploma IT – September 2025 intake','2025','2026-11-12 03:59:43');
INSERT INTO `classes` VALUES ('2','2','CIT-2026-JAN','Certificate IT – January 2026 intake','2026','2026-11-12 03:59:43');
INSERT INTO `classes` VALUES ('3','3','DBM-2025-SEP','Diploma Business Mgt – September 2025 intake','2025','2026-11-12 03:59:43');
INSERT INTO `classes` VALUES ('4','4','DEE-2026-JAN','DEE Jan 2026','2026','2026-11-12 03:59:46');

DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(10) unsigned NOT NULL,
  `code` varchar(15) NOT NULL,
  `name` varchar(150) NOT NULL,
  `level` enum('Artisan','Certificate','Diploma','Higher Diploma','Degree') NOT NULL DEFAULT 'Diploma',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_courses_code` (`code`),
  KEY `fk_courses_department` (`department_id`),
  CONSTRAINT `fk_courses_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `courses` VALUES ('1','1','DIT','Diploma in Information Technology','Diploma','2026-11-12 03:59:43');
INSERT INTO `courses` VALUES ('2','1','CIT','Certificate in Information Technology','Certificate','2026-11-12 03:59:43');
INSERT INTO `courses` VALUES ('3','2','DBM','Diploma in Business Management','Diploma','2026-11-12 03:59:43');
INSERT INTO `courses` VALUES ('4','3','DEE','Diploma in Electrical Engineering','Diploma','2026-11-12 03:59:46');

DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(120) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_departments_code` (`code`),
  UNIQUE KEY `uq_departments_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `departments` VALUES ('1','ICT','Information and Communication Technology','2026-11-12 03:59:43');
INSERT INTO `departments` VALUES ('2','BUS','Business Studies','2026-11-12 03:59:43');
INSERT INTO `departments` VALUES ('3','ENG','Engineering','2026-11-12 03:59:46');
INSERT INTO `departments` VALUES ('5','XSS','<script>alert(1)</script>','2026-11-12 03:59:46');

DROP TABLE IF EXISTS `enrollments`;
CREATE TABLE `enrollments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL,
  `assignment_id` int(10) unsigned NOT NULL,
  `enrolled_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_enrollment` (`student_id`,`assignment_id`),
  KEY `idx_enroll_assignment` (`assignment_id`),
  CONSTRAINT `fk_enroll_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `unit_assignments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_enroll_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `enrollments` VALUES ('1','1','1','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('2','2','1','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('3','3','1','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('4','4','1','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('5','5','1','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('6','6','1','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('7','7','1','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('8','8','1','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('9','9','1','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('10','10','1','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('11','1','2','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('12','2','2','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('13','3','2','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('14','4','2','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('15','5','2','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('16','6','2','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('17','7','2','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('18','8','2','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('19','9','2','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('20','10','2','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('21','1','3','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('22','2','3','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('23','3','3','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('24','4','3','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('25','5','3','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('26','6','3','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('27','7','3','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('28','8','3','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('29','9','3','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('30','10','3','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('31','1','4','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('32','2','4','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('33','3','4','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('34','4','4','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('35','5','4','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('36','6','4','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('37','7','4','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('38','8','4','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('39','9','4','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('40','10','4','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('41','11','5','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('42','12','5','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('43','13','5','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('44','14','5','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('45','15','5','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('46','16','5','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('47','11','6','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('48','12','6','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('49','13','6','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('50','14','6','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('51','15','6','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('52','16','6','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('53','17','7','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('54','18','7','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('55','19','7','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('56','20','7','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('57','21','7','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('58','22','7','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('59','17','8','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('60','18','8','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('61','19','8','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('62','20','8','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('63','21','8','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('64','22','8','2026-11-12 03:59:43');
INSERT INTO `enrollments` VALUES ('65','23','9','2026-11-12 03:59:47');
INSERT INTO `enrollments` VALUES ('66','24','9','2026-11-12 03:59:47');
INSERT INTO `enrollments` VALUES ('67','25','9','2026-11-12 03:59:47');

DROP TABLE IF EXISTS `lecturers`;
CREATE TABLE `lecturers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `staff_no` varchar(30) NOT NULL,
  `department_id` int(10) unsigned NOT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_lecturers_user` (`user_id`),
  UNIQUE KEY `uq_lecturers_staff_no` (`staff_no`),
  KEY `fk_lecturers_department` (`department_id`),
  CONSTRAINT `fk_lecturers_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_lecturers_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `lecturers` VALUES ('1','2','LEC001','1','Female','2026-11-12 03:59:43');
INSERT INTO `lecturers` VALUES ('2','3','LEC002','1','Male','2026-11-12 03:59:43');
INSERT INTO `lecturers` VALUES ('3','4','LEC003','2','Female','2026-11-12 03:59:43');
INSERT INTO `lecturers` VALUES ('4','31','LEC900','3','Male','2026-11-12 03:59:47');

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` enum('info','warning','success','danger') NOT NULL DEFAULT 'info',
  `title` varchar(120) NOT NULL,
  `message` varchar(500) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_notifications_user` (`user_id`,`is_read`),
  CONSTRAINT `fk_notification_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `notifications` VALUES ('1','11','warning','Low attendance: DIT101','Your attendance in DIT101 Computer Applications is 28.6% (2 of 7 sessions). The minimum required is 75%.','0','2026-11-12 03:59:44');
INSERT INTO `notifications` VALUES ('2','9','warning','Low attendance: DIT101','Your attendance in DIT101 Computer Applications is 42.9% (3 of 7 sessions). The minimum required is 75%.','0','2026-11-12 03:59:44');
INSERT INTO `notifications` VALUES ('3','13','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 03:59:44');
INSERT INTO `notifications` VALUES ('4','11','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 57.1% (4 of 7 sessions). The minimum required is 75%.','0','2026-11-12 03:59:44');
INSERT INTO `notifications` VALUES ('5','10','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 03:59:44');
INSERT INTO `notifications` VALUES ('6','9','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 03:59:44');
INSERT INTO `notifications` VALUES ('7','14','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 03:59:44');
INSERT INTO `notifications` VALUES ('8','11','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 57.1% (4 of 7 sessions). The minimum required is 75%.','0','2026-11-12 03:59:44');
INSERT INTO `notifications` VALUES ('9','10','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 03:59:44');
INSERT INTO `notifications` VALUES ('10','9','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 03:59:44');
INSERT INTO `notifications` VALUES ('11','11','warning','Low attendance: DIT104','Your attendance in DIT104 Programming in Java is 50.0% (4 of 8 sessions). The minimum required is 75%.','0','2026-11-12 03:59:44');
INSERT INTO `notifications` VALUES ('12','19','warning','Low attendance: CIT101','Your attendance in CIT101 Computer Fundamentals is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 03:59:44');
INSERT INTO `notifications` VALUES ('13','19','warning','Low attendance: CIT102','Your attendance in CIT102 Networking Basics is 14.3% (1 of 7 sessions). The minimum required is 75%.','0','2026-11-12 03:59:44');
INSERT INTO `notifications` VALUES ('14','17','warning','Low attendance: CIT102','Your attendance in CIT102 Networking Basics is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 03:59:44');
INSERT INTO `notifications` VALUES ('15','16','warning','Low attendance: CIT102','Your attendance in CIT102 Networking Basics is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 03:59:44');
INSERT INTO `notifications` VALUES ('16','25','warning','Low attendance: DBM101','Your attendance in DBM101 Principles of Management is 42.9% (3 of 7 sessions). The minimum required is 75%.','0','2026-11-12 03:59:44');
INSERT INTO `notifications` VALUES ('17','22','warning','Low attendance: DBM101','Your attendance in DBM101 Principles of Management is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 03:59:44');
INSERT INTO `notifications` VALUES ('18','29','warning','Low attendance: DEE101','Your attendance in DEE101 Electrical Principles is 0.0% (0 of 1 sessions). The minimum required is 75%.','0','2026-11-12 03:59:49');
INSERT INTO `notifications` VALUES ('19','27','info','Welcome','Welcome to DEE101','0','2026-11-12 03:59:49');
INSERT INTO `notifications` VALUES ('20','29','info','Welcome','Welcome to DEE101','0','2026-11-12 03:59:49');
INSERT INTO `notifications` VALUES ('21','30','info','Welcome','Welcome to DEE101','0','2026-11-12 03:59:49');

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `setting_key` varchar(50) NOT NULL,
  `setting_value` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `settings` VALUES ('biometric_driver','simulated','2026-11-12 03:59:42');
INSERT INTO `settings` VALUES ('bridge_url','http://127.0.0.1:8765','2026-11-12 03:59:42');
INSERT INTO `settings` VALUES ('consent_version','1.0','2026-11-12 03:59:42');
INSERT INTO `settings` VALUES ('institution_name','Demo Technical Training Institute','2026-11-12 03:59:43');
INSERT INTO `settings` VALUES ('late_grace_minutes','15','2026-11-12 03:59:49');
INSERT INTO `settings` VALUES ('match_threshold','80','2026-11-12 03:59:42');
INSERT INTO `settings` VALUES ('min_attendance_percent','75','2026-11-12 03:59:49');
INSERT INTO `settings` VALUES ('min_quality','50','2026-11-12 03:59:42');

DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `admission_no` varchar(30) NOT NULL,
  `class_id` int(10) unsigned NOT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `status` enum('active','suspended','completed','withdrawn') NOT NULL DEFAULT 'active',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_students_user` (`user_id`),
  UNIQUE KEY `uq_students_admission` (`admission_no`),
  KEY `idx_students_class` (`class_id`),
  CONSTRAINT `fk_students_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `fk_students_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `students` VALUES ('1','5','DIT/001/2025','1','Male',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('2','6','DIT/002/2025','1','Female',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('3','7','DIT/003/2025','1','Male',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('4','8','DIT/004/2025','1','Female',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('5','9','DIT/005/2025','1','Male',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('6','10','DIT/006/2025','1','Female',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('7','11','DIT/007/2025','1','Male',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('8','12','DIT/008/2025','1','Female',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('9','13','DIT/009/2025','1','Male',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('10','14','DIT/010/2025','1','Female',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('11','15','CIT/001/2026','2','Male',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('12','16','CIT/002/2026','2','Female',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('13','17','CIT/003/2026','2','Male',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('14','18','CIT/004/2026','2','Female',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('15','19','CIT/005/2026','2','Male',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('16','20','CIT/006/2026','2','Female',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('17','21','DBM/001/2025','3','Male',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('18','22','DBM/002/2025','3','Female',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('19','23','DBM/003/2025','3','Male',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('20','24','DBM/004/2025','3','Female',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('21','25','DBM/005/2025','3','Male',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('22','26','DBM/006/2025','3','Female',NULL,'active','2026-11-12 03:59:43');
INSERT INTO `students` VALUES ('23','27','DEE/001/2026','4','Female',NULL,'active','2026-11-12 03:59:46');
INSERT INTO `students` VALUES ('24','29','DEE/002/2026','4','Male',NULL,'active','2026-11-12 03:59:47');
INSERT INTO `students` VALUES ('25','30','DEE/003/2026','4','Female',NULL,'active','2026-11-12 03:59:47');

DROP TABLE IF EXISTS `unit_assignments`;
CREATE TABLE `unit_assignments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` int(10) unsigned NOT NULL,
  `class_id` int(10) unsigned NOT NULL,
  `lecturer_id` int(10) unsigned NOT NULL,
  `academic_year` varchar(9) NOT NULL,
  `term` tinyint(3) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_assignment` (`unit_id`,`class_id`,`academic_year`,`term`),
  KEY `idx_assign_lecturer` (`lecturer_id`),
  KEY `fk_assign_class` (`class_id`),
  CONSTRAINT `fk_assign_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `fk_assign_lecturer` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`id`),
  CONSTRAINT `fk_assign_unit` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `unit_assignments` VALUES ('1','1','1','1','2026/2027','1','2026-11-12 03:59:43');
INSERT INTO `unit_assignments` VALUES ('2','2','1','1','2026/2027','1','2026-11-12 03:59:43');
INSERT INTO `unit_assignments` VALUES ('3','3','1','2','2026/2027','1','2026-11-12 03:59:43');
INSERT INTO `unit_assignments` VALUES ('4','4','1','2','2026/2027','1','2026-11-12 03:59:43');
INSERT INTO `unit_assignments` VALUES ('5','5','2','2','2026/2027','1','2026-11-12 03:59:43');
INSERT INTO `unit_assignments` VALUES ('6','6','2','1','2026/2027','1','2026-11-12 03:59:43');
INSERT INTO `unit_assignments` VALUES ('7','7','3','3','2026/2027','1','2026-11-12 03:59:43');
INSERT INTO `unit_assignments` VALUES ('8','8','3','3','2026/2027','1','2026-11-12 03:59:43');
INSERT INTO `unit_assignments` VALUES ('9','9','4','4','2026/2027','1','2026-11-12 03:59:47');

DROP TABLE IF EXISTS `units`;
CREATE TABLE `units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(10) unsigned NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_units_code` (`code`),
  KEY `fk_units_course` (`course_id`),
  CONSTRAINT `fk_units_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `units` VALUES ('1','1','DIT101','Computer Applications','2026-11-12 03:59:43');
INSERT INTO `units` VALUES ('2','1','DIT102','Web Design and Development','2026-11-12 03:59:43');
INSERT INTO `units` VALUES ('3','1','DIT103','Database Systems','2026-11-12 03:59:43');
INSERT INTO `units` VALUES ('4','1','DIT104','Programming in Java','2026-11-12 03:59:43');
INSERT INTO `units` VALUES ('5','2','CIT101','Computer Fundamentals','2026-11-12 03:59:43');
INSERT INTO `units` VALUES ('6','2','CIT102','Networking Basics','2026-11-12 03:59:43');
INSERT INTO `units` VALUES ('7','3','DBM101','Principles of Management','2026-11-12 03:59:43');
INSERT INTO `units` VALUES ('8','3','DBM102','Business Communication','2026-11-12 03:59:43');
INSERT INTO `units` VALUES ('9','4','DEE101','Electrical Principles','2026-11-12 03:59:46');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` enum('admin','lecturer','student') NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(120) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `full_name` varchar(120) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `must_change_password` tinyint(1) NOT NULL DEFAULT 1,
  `failed_attempts` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `locked_until` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_users_username` (`username`),
  UNIQUE KEY `uq_users_email` (`email`),
  KEY `idx_users_role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` VALUES ('1','admin','admin','admin@example.ac.ke',NULL,'System Administrator','$2y$10$/5K2jtvNN6hOKO4enu9YFuMEEnxlD3KBNOMa9CFtH.G6E/DTiI.1G','1','0','1',NULL,'2026-11-12 03:59:44','2026-11-12 03:59:43','2026-11-12 03:59:44');
INSERT INTO `users` VALUES ('2','lecturer','LEC001','lec001@example.ac.ke','0700000010','Grace Wanjiru','$2y$10$tXkLLh8ZqlPfkEL5YU23Uezb5rshdXxcOBsH5nkmEBB3M8YTDrBpO','1','0','0',NULL,'2026-11-12 03:59:45','2026-11-12 03:59:43','2026-11-12 03:59:45');
INSERT INTO `users` VALUES ('3','lecturer','LEC002','lec002@example.ac.ke','0700000011','Peter Otieno','$2y$10$tXkLLh8ZqlPfkEL5YU23Uezb5rshdXxcOBsH5nkmEBB3M8YTDrBpO','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('4','lecturer','LEC003','lec003@example.ac.ke','0700000012','Mary Achieng','$2y$10$tXkLLh8ZqlPfkEL5YU23Uezb5rshdXxcOBsH5nkmEBB3M8YTDrBpO','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:45');
INSERT INTO `users` VALUES ('5','student','DIT/001/2025','brian.kamau@student.example.ac.ke','0711100000','Brian Kamau','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,'2026-11-12 03:59:45','2026-11-12 03:59:43','2026-11-12 03:59:45');
INSERT INTO `users` VALUES ('6','student','DIT/002/2025','faith.njeri@student.example.ac.ke','0711100001','Faith Njeri','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('7','student','DIT/003/2025','kevin.mutua@student.example.ac.ke','0711100002','Kevin Mutua','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('8','student','DIT/004/2025','mercy.chebet@student.example.ac.ke','0711100003','Mercy Chebet','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('9','student','DIT/005/2025','dennis.omondi@student.example.ac.ke','0711100004','Dennis Omondi','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('10','student','DIT/006/2025','joy.wambui@student.example.ac.ke','0711100005','Joy Wambui','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('11','student','DIT/007/2025','collins.kiprop@student.example.ac.ke','0711100006','Collins Kiprop','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('12','student','DIT/008/2025','sharon.atieno@student.example.ac.ke','0711100007','Sharon Atieno','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('13','student','DIT/009/2025','victor.mwangi@student.example.ac.ke','0711100008','Victor Mwangi','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('14','student','DIT/010/2025','esther.jepkosgei@student.example.ac.ke','0711100009','Esther Jepkosgei','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('15','student','CIT/001/2026','ian.barasa@student.example.ac.ke','0711100010','Ian Barasa','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('16','student','CIT/002/2026','diana.nyambura@student.example.ac.ke','0711100011','Diana Nyambura','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('17','student','CIT/003/2026','moses.kibet@student.example.ac.ke','0711100012','Moses Kibet','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('18','student','CIT/004/2026','ruth.akinyi@student.example.ac.ke','0711100013','Ruth Akinyi','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('19','student','CIT/005/2026','allan.mutiso@student.example.ac.ke','0711100014','Allan Mutiso','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('20','student','CIT/006/2026','naomi.wairimu@student.example.ac.ke','0711100015','Naomi Wairimu','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('21','student','DBM/001/2025','felix.ochieng@student.example.ac.ke','0711100016','Felix Ochieng','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('22','student','DBM/002/2025','purity.jeptoo@student.example.ac.ke','0711100017','Purity Jeptoo','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('23','student','DBM/003/2025','samuel.karanja@student.example.ac.ke','0711100018','Samuel Karanja','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('24','student','DBM/004/2025','linet.auma@student.example.ac.ke','0711100019','Linet Auma','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('25','student','DBM/005/2025','eric.rotich@student.example.ac.ke','0711100020','Eric Rotich','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('26','student','DBM/006/2025','agnes.moraa@student.example.ac.ke','0711100021','Agnes Moraa','$2y$10$vjGbzOrrqbL0denCiOgSguy0BKbK49po4ORBMQK5rWZuZbeL4GxQy','1','0','0',NULL,NULL,'2026-11-12 03:59:43','2026-11-12 03:59:43');
INSERT INTO `users` VALUES ('27','student','DEE/001/2026','tso@example.com','0712000001','Test Student One','$2y$10$cdZvQEfpXdwPHgLwYtPr7OEDDGEGvB5hNkmMkGCcVjFKGrZbo/zLm','1','0','0',NULL,'2026-11-12 03:59:46','2026-11-12 03:59:46','2026-11-12 03:59:47');
INSERT INTO `users` VALUES ('29','student','DEE/002/2026',NULL,'0712000002','Csv Student Two','$2y$10$vMOYmlRF0D8HuogcEpWOgeV92JugQLELcK240oYcfKFphUT1EY2eu','1','1','0',NULL,NULL,'2026-11-12 03:59:47','2026-11-12 03:59:47');
INSERT INTO `users` VALUES ('30','student','DEE/003/2026',NULL,NULL,'Csv Student Three','$2y$10$5zzJXXKDlCsB9s2vpPtwpuxUwYvBLpVvzLSwBAuKgxnXkFDmD1Msq','1','1','0',NULL,NULL,'2026-11-12 03:59:47','2026-11-12 03:59:47');
INSERT INTO `users` VALUES ('31','lecturer','LEC900','lec900@example.com','0712000900','Test Lecturer','$2y$10$4SPaexRYKwxlvQtUc30rlOay7r7IAfGYLsS5Vd0vLOAj7OvKwY1Xu','1','0','0',NULL,'2026-11-12 03:59:48','2026-11-12 03:59:47','2026-11-12 03:59:48');

DROP VIEW IF EXISTS `v_attendance_summary`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_attendance_summary` AS select `e`.`student_id` AS `student_id`,`e`.`assignment_id` AS `assignment_id`,count(`cs`.`id`) AS `sessions_held`,sum(case when `ar`.`status` in ('present','late') then 1 else 0 end) AS `sessions_attended`,sum(case when `ar`.`status` = 'late' then 1 else 0 end) AS `sessions_late`,round(100 * sum(case when `ar`.`status` in ('present','late') then 1 else 0 end) / nullif(count(`cs`.`id`),0),1) AS `attendance_percent` from ((`enrollments` `e` left join `class_sessions` `cs` on(`cs`.`assignment_id` = `e`.`assignment_id` and `cs`.`status` = 'closed')) left join `attendance_records` `ar` on(`ar`.`session_id` = `cs`.`id` and `ar`.`student_id` = `e`.`student_id`)) group by `e`.`student_id`,`e`.`assignment_id`;

DELIMITER //
DROP TRIGGER IF EXISTS `trg_audit_no_update`//
CREATE TRIGGER trg_audit_no_update BEFORE UPDATE ON audit_logs FOR EACH ROW
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'audit_logs is append-only'//
DROP TRIGGER IF EXISTS `trg_audit_no_delete`//
CREATE TRIGGER trg_audit_no_delete BEFORE DELETE ON audit_logs FOR EACH ROW
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'audit_logs is append-only'//
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
