-- BSAMS database backup
-- Created: 2026-11-12 04:00:51

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
INSERT INTO `attendance_records` VALUES ('459','60','23','late','simulated','93.86',NULL,'31','2026-11-12 04:00:50');
INSERT INTO `attendance_records` VALUES ('462','60','25','present','manual',NULL,'Fingerprint not yet enrolled; ID card checked','31','2026-11-12 04:00:50');
INSERT INTO `attendance_records` VALUES ('463','60','24','absent','auto',NULL,NULL,NULL,'2026-11-12 04:00:50');

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

INSERT INTO `audit_logs` VALUES ('1','1','login_success','user','1',NULL,'::1','','2026-11-12 04:00:46');
INSERT INTO `audit_logs` VALUES ('2','1','login_failed','user','1','Attempt 1 of 5','::1','','2026-11-12 04:00:46');
INSERT INTO `audit_logs` VALUES ('3',NULL,'login_failed','user',NULL,'Unknown login: \' OR \'1\'=\'1\' --','::1','','2026-11-12 04:00:46');
INSERT INTO `audit_logs` VALUES ('4','4','login_failed','user','4','Attempt 1 of 5','::1','','2026-11-12 04:00:46');
INSERT INTO `audit_logs` VALUES ('5','4','login_failed','user','4','Attempt 2 of 5','::1','','2026-11-12 04:00:47');
INSERT INTO `audit_logs` VALUES ('6','4','login_failed','user','4','Attempt 3 of 5','::1','','2026-11-12 04:00:47');
INSERT INTO `audit_logs` VALUES ('7','4','login_failed','user','4','Attempt 4 of 5','::1','','2026-11-12 04:00:47');
INSERT INTO `audit_logs` VALUES ('8','4','account_locked','user','4','Locked after 5 failed attempts','::1','','2026-11-12 04:00:47');
INSERT INTO `audit_logs` VALUES ('9','4','login_locked','user','4',NULL,'::1','','2026-11-12 04:00:47');
INSERT INTO `audit_logs` VALUES ('10',NULL,'csrf_rejected',NULL,NULL,'Path: /bsams/login.php','::1','','2026-11-12 04:00:47');
INSERT INTO `audit_logs` VALUES ('11','1','csrf_rejected',NULL,NULL,'Path: /bsams/admin/departments.php','::1','','2026-11-12 04:00:47');
INSERT INTO `audit_logs` VALUES ('12','2','login_success','user','2',NULL,'::1','','2026-11-12 04:00:47');
INSERT INTO `audit_logs` VALUES ('13','5','login_success','user','5',NULL,'::1','','2026-11-12 04:00:47');
INSERT INTO `audit_logs` VALUES ('14','2','access_denied',NULL,NULL,'Role lecturer tried /bsams/admin/students.php','::1','','2026-11-12 04:00:47');
INSERT INTO `audit_logs` VALUES ('15','5','access_denied',NULL,NULL,'Role student tried /bsams/lecturer/sessions.php','::1','','2026-11-12 04:00:47');
INSERT INTO `audit_logs` VALUES ('16','5','access_denied',NULL,NULL,'Role student tried /bsams/admin/settings.php','::1','','2026-11-12 04:00:48');
INSERT INTO `audit_logs` VALUES ('17','1','department_created','department','3','ENG','::1','','2026-11-12 04:00:48');
INSERT INTO `audit_logs` VALUES ('18','1','department_created','department','5','XSS','::1','','2026-11-12 04:00:48');
INSERT INTO `audit_logs` VALUES ('19','1','course_created','course','4','DEE','::1','','2026-11-12 04:00:48');
INSERT INTO `audit_logs` VALUES ('20','1','class_created','class','4','DEE-2026-JAN','::1','','2026-11-12 04:00:48');
INSERT INTO `audit_logs` VALUES ('21','1','unit_created','unit','9','DEE101','::1','','2026-11-12 04:00:48');
INSERT INTO `audit_logs` VALUES ('22','1','student_created','student','23','DEE/001/2026','::1','','2026-11-12 04:00:48');
INSERT INTO `audit_logs` VALUES ('23','27','login_success','user','27',NULL,'::1','','2026-11-12 04:00:48');
INSERT INTO `audit_logs` VALUES ('24','27','password_changed','user','27',NULL,'::1','','2026-11-12 04:00:48');
INSERT INTO `audit_logs` VALUES ('25','1','student_created','student','24','DEE/002/2026','::1','','2026-11-12 04:00:49');
INSERT INTO `audit_logs` VALUES ('26','1','student_created','student','25','DEE/003/2026','::1','','2026-11-12 04:00:49');
INSERT INTO `audit_logs` VALUES ('27','1','students_imported','student',NULL,'2 imported, 1 failed','::1','','2026-11-12 04:00:49');
INSERT INTO `audit_logs` VALUES ('28','1','lecturer_created','lecturer','4','LEC900','::1','','2026-11-12 04:00:49');
INSERT INTO `audit_logs` VALUES ('29','1','allocation_created','unit_assignment','9','3 students registered','::1','','2026-11-12 04:00:49');
INSERT INTO `audit_logs` VALUES ('30','1','consent_recorded','student','23',NULL,'::1','','2026-11-12 04:00:49');
INSERT INTO `audit_logs` VALUES ('31','1','consent_recorded','student','24',NULL,'::1','','2026-11-12 04:00:49');
INSERT INTO `audit_logs` VALUES ('32','1','fingerprint_enrolled','student','23','Right index (simulated, quality 73)','::1','','2026-11-12 04:00:49');
INSERT INTO `audit_logs` VALUES ('33','1','fingerprint_enrolled','student','23','Left index (simulated, quality 96)','::1','','2026-11-12 04:00:49');
INSERT INTO `audit_logs` VALUES ('34','1','enrol_duplicate_rejected','student','24','Matched template of DEE/001/2026','::1','','2026-11-12 04:00:49');
INSERT INTO `audit_logs` VALUES ('35','1','fingerprint_enrolled','student','24','Right index (simulated, quality 84)','::1','','2026-11-12 04:00:49');
INSERT INTO `audit_logs` VALUES ('36','2','access_denied',NULL,NULL,'Role lecturer tried /bsams/api/enroll.php','::1','','2026-11-12 04:00:49');
INSERT INTO `audit_logs` VALUES ('37','31','login_success','user','31',NULL,'::1','','2026-11-12 04:00:50');
INSERT INTO `audit_logs` VALUES ('38','31','session_created','class_session','60',NULL,'::1','','2026-11-12 04:00:50');
INSERT INTO `audit_logs` VALUES ('39','31','session_opened','class_session','60',NULL,'::1','','2026-11-12 04:00:50');
INSERT INTO `audit_logs` VALUES ('40','31','scan_rejected','class_session','60','Best score 15.25 below threshold 80 (3 candidates)','::1','','2026-11-12 04:00:50');
INSERT INTO `audit_logs` VALUES ('41','31','scan_rejected','class_session','60','Best score 10.12 below threshold 80 (3 candidates)','::1','','2026-11-12 04:00:50');
INSERT INTO `audit_logs` VALUES ('42','31','scan_rejected','class_session','60','Best score 6.27 below threshold 80 (3 candidates)','::1','','2026-11-12 04:00:50');
INSERT INTO `audit_logs` VALUES ('43','2','access_denied','class_session','60','Scan for another lecturer\'s session','::1','','2026-11-12 04:00:50');
INSERT INTO `audit_logs` VALUES ('44','31','attendance_manual','class_session','60','Student #25 set to present: Fingerprint not yet enrolled; ID card checked','::1','','2026-11-12 04:00:50');
INSERT INTO `audit_logs` VALUES ('45','31','session_closed','class_session','60','1 student(s) marked absent automatically','::1','','2026-11-12 04:00:50');
INSERT INTO `audit_logs` VALUES ('46','1','report_exported','report',NULL,'unit: Unit attendance summary – DEE101 Electrical Principles (DEE-2026-JAN, 2026/2027 T1)','::1','','2026-11-12 04:00:51');
INSERT INTO `audit_logs` VALUES ('47','2','report_exported','report',NULL,'below: Students below the minimum attendance of 75%','::1','','2026-11-12 04:00:51');
INSERT INTO `audit_logs` VALUES ('48','1','announcement_sent','notification',NULL,'class:4: Welcome (3 recipients)','::1','','2026-11-12 04:00:51');
INSERT INTO `audit_logs` VALUES ('49','1','settings_updated','settings',NULL,'{\"institution_name\":\"Demo Technical Training Institute\",\"min_attendance_percent\":\"80\",\"late_grace_minutes\":\"10\",\"biometric_driver\":\"simulated\",\"match_threshold\":\"80\",\"min_quality\":\"50\",\"bridge_url\":\"http:\\/\\/127.0.0.1:8765\",\"consent_version\":\"1.0\"}','::1','','2026-11-12 04:00:51');

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

INSERT INTO `biometric_consents` VALUES ('1','1','1.0','2026-11-12 04:00:45','1',NULL);
INSERT INTO `biometric_consents` VALUES ('2','2','1.0','2026-11-12 04:00:45','1',NULL);
INSERT INTO `biometric_consents` VALUES ('3','3','1.0','2026-11-12 04:00:45','1',NULL);
INSERT INTO `biometric_consents` VALUES ('4','4','1.0','2026-11-12 04:00:45','1',NULL);
INSERT INTO `biometric_consents` VALUES ('5','5','1.0','2026-11-12 04:00:45','1',NULL);
INSERT INTO `biometric_consents` VALUES ('6','6','1.0','2026-11-12 04:00:45','1',NULL);
INSERT INTO `biometric_consents` VALUES ('7','7','1.0','2026-11-12 04:00:45','1',NULL);
INSERT INTO `biometric_consents` VALUES ('8','8','1.0','2026-11-12 04:00:45','1',NULL);
INSERT INTO `biometric_consents` VALUES ('9','11','1.0','2026-11-12 04:00:45','1',NULL);
INSERT INTO `biometric_consents` VALUES ('10','12','1.0','2026-11-12 04:00:45','1',NULL);
INSERT INTO `biometric_consents` VALUES ('11','13','1.0','2026-11-12 04:00:45','1',NULL);
INSERT INTO `biometric_consents` VALUES ('12','14','1.0','2026-11-12 04:00:45','1',NULL);
INSERT INTO `biometric_consents` VALUES ('13','17','1.0','2026-11-12 04:00:45','1',NULL);
INSERT INTO `biometric_consents` VALUES ('14','18','1.0','2026-11-12 04:00:45','1',NULL);
INSERT INTO `biometric_consents` VALUES ('15','19','1.0','2026-11-12 04:00:45','1',NULL);
INSERT INTO `biometric_consents` VALUES ('16','20','1.0','2026-11-12 04:00:45','1',NULL);
INSERT INTO `biometric_consents` VALUES ('17','23','1.0','2026-11-12 04:00:49','1',NULL);
INSERT INTO `biometric_consents` VALUES ('18','24','1.0','2026-11-12 04:00:49','1',NULL);

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

INSERT INTO `biometric_templates` VALUES ('1','1','R_INDEX','simulated',0xd489de35759d51cdb8beb07d17280214718f6a8a52a263a9fa534e5a5325116899f90f92219c0572413e8e0429983e3d7380e1a644c96314d4b7cf1eefb83a9a27011a19a245392d95216d17a2fb73d3337d50b398cb19ecf20fb86befc0b310479fbc33e98da240d5a2935cea9acdcfb23b642ed2aeabf9eb57e85f349d52e532dd9bc530a2ea1c210d0cdc7264767d2e016a214dbad7573ebf26378aa043cd64c4a0317e6a56e1dcef5100595fc23b4f7387dd50c03d9f93d5a11fc075098b5a8d804a5f114b47c3ebd01291cf5c5675f339d834eb2c9e8c0028ca8d800cd60cd1046fb16e9e52a97550505243cd55b71d9426ff09bafa63f0f12149bf6cb5e264d73bf6a73b360996bd6feb6d8307ee77c35e1aad1612e97ec32e721311403f0590cdcd9b9d4da9bc55c88ef6a49f5a1aa3965880c24c8acefcb9c8e7ee39c1ca4d6c41deefa778cdf33c0f71f81e616ddfed49564de0cd2d3584917863966b54deb4e328a56502a84d4354848576e4cf5c1718627cc221678a44b1516e4b3e82c9ced454e526a14b7c67c4d57f485dd90056767163095466ff831209fa2db10f71e912256386d5214f3500569f390441b4c2b04c186271a5cf395a67e971762f9e6258261d04bdbc8b84364da787a3ee1b4cd72717161bb8345d0b1c07954081d4d22a01f3fbe93875858eb33c5adeaf6e5aa7,0xb9de5acf73fd7920fbcf6b4c,0x1a9bd06ad4ad8472454a3a15a6bed3a0,'a2b288eb896b832c706311509c504eb2a86a9413a8565565c444c81902ccd4bf','68','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('2','1','L_INDEX','simulated',0x89661ad7b90525ed836233b544c4e60fe2cd2e1d2df59de2b54dd69c471e1b54470bf7d28cb9c4ac7a0220cef647e25f34a72f8ddf7f99b99bdc839e56e780a888449c9c5e0a5b745255ec1d33d1ef7166467f78a901767f30428f8c31ffd1fa5b5302e2572e40e2f44d9766c5070c301efde4a8108688c16f8ddfde085ffb74926135e74bfd3fac1ffcf0c8a580b9caa237a037c872098aec0db339e649a3e79831deca29d4f9074c9baaa1e6f462b9e52cba849b689c2f3ee9c0c9b1c3efcc461eb43f445817842251d92c9ee1d482668346bb805c00e587df1af318245597b2f87d9d6199751cb51c5ac3f21a418942a3588634b7768fea138ce75bf317813772d3a2acafe06ea9f4a069275caab1d916f60396f71e8cef5fcdf9d690deaccd600f659813207da8c07e79243da733018d064d66ee76f9c78772f242675b43903f5374366c1181d7f67888b57999740d6c104596d5b97faa7761f25673611957b387e17fc504bee62e61d15b294d8dc2ea776a8804e33fc5f90d2e4baa699150847e28c5f547a7b703925c9a37eb4686968ea09663facc28f6a42592767be6c9f1d40121a8e844e1972917addb26f00a7b4b6e0dbf953fb7918f114f6448af2c841267b4a9a37f6f0bdd6d56cfc8a62561163ad10fcb9aa6f54762c19a2a0a83921cf70047689f58bb1ebdd3e5c51df9abefcd,0x2819a6584fe0c5bc8f6a4e6f,0xea4d7e25e151bf6886ea9527ff83f1d2,'e2e46f108bb4c085bd9e5410d4ced6b8c59bf590e59339d5d1405fea5a4e054e','64','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('3','2','R_INDEX','simulated',0xe0765d720f0e0b2614348a902d6b893781185efbab080dd4deefa0a86ba0f0f60797169690afa18f482feba469c2302fc5f2b7e8fd32d842ee88146af4a8572fe13b8141f8f598bc295733a9e2a46bb53cd533f7f5c47bc04a5f6ecf76839bf56df5f4cd5bb1bfa432c797636b439eeca29236061d4d5cc638327d7cb8216149510a9090860f4bfbda2407b81d76f926296f168ce1f737cf7c09b9cfade3826fb09c5e762a1ed0782333e2190e73fe479525d10914d6370041f09d64575234b7bc68a3340f19268e43e12442397bdee00eba517acbe479f2edf83774b75bcd6f897e2058896b899bce8c38dbb01b213321a56d6a5ae8c3fe08336a9c173fbf8add3de470d2ee6681d39375b5b4c8d27e7aedec86b70ea3832d7361fd284dcf54ab236b194891c4ae56edccf86e718ab1eb7931beb65666115c48587ba61aa48c403c7cf70358f236818b6c9220ffd9766356f9c99f56c45e6f41527c53f70d58eb0171c4eaa14c306dc6a445b141f228a6a60b6761e174eb1c044b3bc360e5ce3328d906d88a067728171da6da68e6cd64c160885da2c65778287b03cb2052e4bd0e2d06fe3d625706adde6644d116203c7fbdbc0b09a56e5a0402a33d763f306c149acc34939b132dd42230aae7517733d692c548ab40ae0108e120da5d7d3289d59c8ab2856cbd22fd1fc84e8a6949c48f999a9711b707,0x1cb8f725d7dd1111da0f6589,0x52152b2e0439b9f8f7712f7a864192d5,'c59e0c23f6fd70acd5c35d6fb348b100552718a601c9f1e002d3cd14a0ba0302','70','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('4','2','L_INDEX','simulated',0xf1cb01aa00cffd72bbafd6aab0ae1464d13c0caf3a1637c6713418489d0922d4e66b73ce917d0233f1311a2b166d2e318cc40fe6bf1039977e93947893db34f77289be61e558e1e567d79516099916a3a31a994ceafdb86f3dcbb2b282b85d0a2fb7a1b986fe1a745a0f109ac8f252cfa7f76b790cb110f6ba24764c2daf08678048821a0eadbb428278d8c241384b118cb490c16ca9a6efeebea5e83503a3a7a4c18425fe417ffbfe9404b6fe96615007d44333e51adba514d9fbee06502f7e5bb7916391837c7e66b173077102b56e47b2bd82b5ffa19a1287997146b2ddada81c2ad0d07b053376c367407c3848b64364d92fd18a9108cc77717e38ae7f9ab952776ef38ba0a632ffecc16a3a61b015fc0828459a4ee9e2a116f1568904edfdcbcf9cf385625632a885ed2c2015114ecab33784099cf429174896b4f9131f2c5675b25b635b1d03c26f970fbbebf891d0662e5a51d26977e3496f25db9d728ead1bbdf20fb98c527e572be88b66769baba351e7095b5fdd0afe95f4d1f2d6f3f4fb04e81f8fd93861eb940af2e03382a55a195c16c75920ed6aa8e699af89aeaaeeb803cdf6c9bf742d235696a3954f4e961111e1d61d43f9c7fcf1a166c8c042c255b438d93773bf64d5c3ec180e25c60c68a981534671cae6120a14a42c95954bd3e7bfc383e35f52224245b1c7f297a74f80d03b188108,0x64bb4cc97311b77049afce19,0xd64969bd049077891508601db47e427d,'0a752b94f403045e158e04166fc9c92b5ae67ecb0046eeb8f1a11ca460e6e732','93','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('5','3','R_INDEX','simulated',0x763fac4af13145c6c2fe5c25f2a3283d6efc0d92cb064974b52efba21e1010e21f9077654ae1072aacdb748909fd104dd94b4a14ca75678272dd8cdfbbe0a059f1787048fe3313aa96d0a2109309aa54c98f3bf55af09a36c26687cc9fd6520a65fe8511d929cef09856174df1ae4afa14975f70e28969f37c27c83a257c0a5cac5c66a7bc2d0de05995a5dcdce29465994c496681a2a21dbc8dd23bd1e8b31d8a7f4b6d0196212770ef2805d0bba49b3246b785002d94128b165ad91ce034e7adfacd59a326e41e5368c648e588bba55f58cf90e6fba92aa149b9ee524e01bbad832bd8e4aa8755d4c64eae17cb6a8947a2db0e8618be569d15389e29d81fd6bb9ec3cf1d52aa905b710f27bce0ea9ef3c78f1a47b65bd761372a898d3fe340bf4bced154dabbe5dc8fa4d0bd2dc57ca5a8e6e4622d888099ec65aeaf40f05b31d4f35975e21f81f77b677a228c85b0e4e9e5f7b38b1e29c35a65a7cb2242cc031662b2ced23c1cebf3ca11114b35750cb98a7dc2c2a4c12aa4948e307aee7a2a12f0d533c74b8c6c9179565e6766737a0c7c18a177aa87d975c48d3d02cc928799ae7e9c57d03cdf82d9b71e9dd88d9877f3661e76be559130e3d2b38394b1ea347b8dbf9ddc93181a122f7bcd944f1d623da586093cf1ddad501c5527d5af43684fb715e0da4f11c94da7b65c770840b3b45909a0d404f82443f7,0xce91d3d8a9f57c1a83b066d8,0xdc9f522deaef1c6f8993989a8f633ee6,'c9bfbfdd9b0c72068962ae60c2e94894d7bf998b2cd7549f62e4c776ae1b2056','85','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('6','3','L_INDEX','simulated',0x575e020619a383c07864d481c539933b47d3b7b8c1e25c379b0f3e7cdcfc919f259784e999faa89f2881b678a49bf91b165c7c5693461d1845c2abdc15ca0b82695489d7a082e2e78731fac82ffd91056bbddd2cd17592ba87665a68b5dcae59131f5f8110e465f10d3723811ee652bce731fa74b8ec4836e18ab8cab86e41644a5a7d70cf8f11e47bf8eca918b84a0b9ba25eea74f19ff5e79cadd3cdf05953f3c91263179407ed87be0917d02a6ea21598e8b44a5215d74badcc0e812a9dffc5077e63126cf8f4ecdca7cdd5bed1a7e913e7d8223f1d86175088886dafcbe0b47e393c28ce6ebf11a806ce8873ff5232c1be83026294d396f622e9441db1e2d44f6930e3cb722fa05d2692dd14cdd4e9ed5787cfe2bfe1287c76ea160caee2220cc8d6793ccad236fcbb58ed758faa9f9db5f84b79b8ef33fdca47ae6a9aa2749651fcfe670e050d9743d2686941c54a8ecc735796f5fc57a49c61ff31720c83ccccb575bc3c0a4e533b5c6fe20db19ab007ca592049074ffc8a13e71c6a87559ea486fbea50a1ae23133c12f627555944c60567c3d70f5029a8eaac758076d8ccffd40a4fa6ffae43c03799a72e0f1d0f956029f8142d348c3bd745e056c09931ff72b445b4ed6c0009a99d7f3853d6a28e5c27a89f2f5c3e5d1b7404807403f6d6f05590765d483fc655839a21ee,0x1403e547237eadd6ccbb9bf4,0x10bdb5229f0d983a8b2cbcd3fc0570a9,'c083631d52321a651ba54986f83694c761622c66fceae73b30eeb3d7e3981ca9','79','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('7','4','R_INDEX','simulated',0x40b667b9e19376d81d5d7e2028b14911f78552a3c5d260a565b5220028a08b160b151f50d98829cceafdd707c5238e71b5ed0c64e906408aab935704de985a7c59a7d9e0619910d6ddaaa44e2d9eba21ff32d96925d7b8c0fde5b6e606f507374166df9b579c623cf73480cdbe426dfdac483999dae3e955c58461ed742985733e6548fecc74aac7735470e74c6cddf9db26be9ac93d88b2b74a21387c427a7de2adff5d8bf7678140a12293db5b435fbf2bef4a9c79a9dc8dc0b200a6fe4c1ece79237ccaf185e369065eebf7d2d9c627e925aeb53950e70495512e9a1aad1a4c358b8983fd1dadb7d553c981d5352a1698d041b053c2efcbd0d44e64641218987127e7e32bb2eed9586193a79ce7f3c2323e910d4399c48c8a324765f1fbce9e5e0f9be211ba7de9b966a3725a1817fb7774f8c263cdd795459d099ee55c48f842140c6d367106afa4710a9b21a45eae02dc81e90eadd4d61375cb46a664b1e9dd4cb6a357c7a67ff33e1f5f59968b5681177e54f2e35aac88833248b757677ddcf14e348c1ed52c933fabb0f3a555175931b81bd84d4e489582f8f9797a6e47ede909cdcbd69b4a7f1d1035b0e5bfa3d70b874e0336eee3a974acecfd99c41ca89943a7f984f042e881928e08cd5cbda9fba59c5144dffa7dab54b380fe88dddeb4737c9c6c8f10ce92aa331cbfb13cbd,0xd7bec1a599cdb08e2c8db1af,0xa87c153856e4898083205b6837fe15a7,'3394555821fd78172ceffda27057747280f2b9f98393883a4425da6f402c6267','91','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('8','4','L_INDEX','simulated',0xcb333305ffb7ca222f17387cc4dcab86f0437fa09fc8898da5ad92dfb6f40674ce81eaacca08dd9d7e7f16253129af6a2f9dcb3e26602789e5d8d67b582abd58572c260d645f799107824af3f0e7d82995416a50de852c1dd2dfc0e47cd7da7a5258c5828efbead34efa1704246add4c6e9d59ff9c48b72958cf2a6a05b7c84bfb476174678f97fa988fbded87612bff5a7a2767e9ab2b804faf24ab8f9df8b1a678dff0999d710fd0522b8f036d319e8f8e9ee1c792c0814f336a5b2eca2f73ac87b8845ca092e2642df9deff09aeca0882f6b2d54a312d70bf6591c984dd441db2513b7755e0d2c448c6bd1017ab606224b7afde15535400603401917b69a6191e218e27cf3b722d9f744d4e617e1ca50eb019ac948f849da66ce786b5344b6574f4efd4d569ee9b20d35ca5951fbce3dc093c366639d64b3a2248e1bf716c450821cac57d7730ad3063364447f236b1f6e66e4683c4f2e54ad5cdbdff849d8d34fdf5f0cf247d9955d0972606fd14b1a2449fa7747c26218c7aa2d200a52c9eba0d0b4f2161b02219aa5aee16c2308202670519bf774d81ab3a3827a15a806520144c28da19eb0dff9389476f84db3004b09669383233012a50a468fa4f0f243ed3d1dbd8681db8e4255e3cbda8670541c113c9eba29c532ed704dc9d01a7fb318e26ea4ef55f320efe536902dc9d63f3,0x68ec27fde42a9d87ab2db126,0x7fb2ffdcb85bafb38387ae462daf51b6,'a50e73674752afbc4ccc4f2e662dfde11ec73f6129572f90b80a9d0e12f907cc','93','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('9','5','R_INDEX','simulated',0xa7773e1e14287159e6bf29addbe162589e876650686c93acb1a419101d131a9b30f4bffba7f472c1b7fc6ef7d29cd2ec923b022a3879ecfa66c30cda81cd5b2b6122f640a65de5e22c851f189ae77585964a7484d9e0c9277ca4cfd4cefb4f5bb682430a506ff2468431f57fb9b73294b780bb73d5a24cbf2c69726f0ff5e6f00685c1f928dcef13b078a7068032f72093de799b9367c055d151fd2c3177eecd513a77e4625ba0a85c6c1800addcd2ba8d56c8fd005ac7569356c0a820c155941c6d1c89969cbbfaeaa75070e2e05634cb4408a05b451dd0bec92e7cce0a4cf5e1a298c03ee2eaf3373e67850fdc4d1953666a0265e312e81d9a1fe7f746fd8cea7f409ec8a56c1b07317e380262b8f9e1b2f9fe345e1fdef550801024eeaa0a109862349fe538738eb563c9009079d57a4c9ebe6d3079c4bce21fff23a1f8820cf1c5e53fb4f35a6f8b4b387b2747d76844f50c464db8fe45c87f9ec1c63f67a9dab4a1cad83bfc0de3d6c552c41ea42bc3385ef0927064fe144c1565a13ebdb67bf4c94a13e8f43bd5d85353bc679a7ee4b0938473d80fd7bb74a813c1c0cca69f82a70fa4183658ae5d037f9b172bed074871d1a24daec8f717e320fe085f523d308c4a686f72167668bd2c0a80a3de2f8ce6962467a9f791631a7d0ddb7827878b507720799c61aa6f0e941124f8956a1e2fb3,0x0e1cff084b14d7f28f40fdd7,0x5401e09ebfccf793e54fe152f21d84cf,'efd6d65f99b57cd47ab4acbcc6a30906e5771944fe585afc5e91672c6e2ff177','79','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('10','5','L_INDEX','simulated',0x817dbb915c076439ffe1815ee0e453c418bcfb98440ea0f48f75cdece4eef3043db24cc050469f52a3f68e7a322118a660de257486f4b9ab6e23c4e7c5b8cc425ca3dfe5e0cd78fe4613622ca9a10e41984b739c329f08ec770c2a156f5d702d1d5e95c360bc3ba19b433acea72bb6e84eaffc93fca57b50c23396cf95d1fa1152db50282007d171cb9ca7dd391ba5e80c700285e60c1f36969b1f8e52b9960d32c56d701da3a1b8f797cd2bfbcf101839fb21665e2b1bba32470646c5d2f6db9c75384bd9dc3b485a7871593806c14fb6c38bbde555342b02f9d99830c3e7fb46823dcaeb4c2646299e1391b16cd1337e2fd60e8e732133df7bd4b6d3706a93b2420b554b34101cad8e7fee7ac70dbd71addfdebbf919eba141aad8f8c844d66c8ac8b29456c6a7413c7d9fba833175568454de8167bc0eda5b29976455b70d31c2e17f604d179252256324f399e5ddd1f654e0332ae148e12ee770ceace80c2f067ec3206d1b98f735d631ae27a35b3d52d45d279cd7a7f4422bf3aca03be713db95ede928284948e35a0d64310645eb80a0959dc2ef90b57e2311d0aeb466afcf297478ce23ea3b6db1baa020f6bc771f6bef20774b094d79014f9b84b702b41dae673171414d40f1c051fb4ab36e4f4a1bde97f817f3daa7cafdd4d8b0384c6cc7d029ba6c2e05704dba3878c22e7e,0x3b7fdcdadc5861ca22f13e70,0xb05cd88099995b36ae93d09e43e294eb,'ca307716610ff7e8d14559ba463a86d70999b1033fa25017b1525950ffbd8bf7','67','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('11','6','R_INDEX','simulated',0x66aeada00d2df4b8b8e6463ddf5d08ab9bed587dce37944fcf4d6502e848602e33a9d4011481f6215ae49d6f2ddb7770c4865f9fbd6993c085bf857378d346db5052c20a7d17081204e3b4d326239785fa281360e5deb07d859f9285e11b0386a0335209917fff1f0389ee214cdddf30f1903b81208056c22337eb67dc386a94d6e5bfe4d1ca5347e9404cedc5380d766ccd6f983962312109d1f4e5c105989e1a97f329c6fad00efa03b38fa05d9d03cebaccd882d6b04be061265f150c2a2b5d5851e0763c573d9c164d40995d52036b9b7076a44527761dc3222fcd0108cb622f339cb585645f37fdd85daefa08d48dee2a24c4d721f721c33c386bb749cd2077a6f11c6e40c17539abe8a0f23d36495168bd0ece4437c9c7169a278e96c7626bb1e1200899234aeef0f5ed32f67c285544d82ce18e24448ee512d938f38b356d026d38de7cd3c7b82806c640aa99be8f2b939089f74f182e3531ae9052337aa0e14b2792ef55b8e25b3bd6ac17069f2f1b75fd41b32756e88ca5662c3f4aaceaae5d29a136b3a115089c373e4a717bbcb288bac55e37e376e95b8db92b9ab102a86d362eea7dc0b08caa11accc8e22fda11e383baeeeabd11e0b1e6309c6c53026b8a405b5310db31b8c084cfdb6ef89b09dce3463fb6cdd02eee926a52147851e1eb78062776be5d3e62c,0xe75fa79d094e68e24aa3ef5f,0xcb5efc7ebf954b08766df43b8651dce8,'8de7069df58dfb9824aac1e96ba41cc5eaee3cfa205cc419efd32646fd23bc74','93','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('12','6','L_INDEX','simulated',0xd4cbc58ce14585fe3e5b00688b14dc797a8f51806f7a87a0bf5bb41c4e9f9ad2d6cdd2cb2c91b79eebcf6dcc9475c3f4a382fb928a77a372e9293cc3b2b1c7dc13d03b232b6eb5aa5973e81e4e07bbfa049bb8680efd8562257f16905ce607c6aa9188d82647fecd1aa8ae8d287f53f0636aa32e4dbaadee40d14113e8d95089f59d29d17882866351eefb6b9829ca588f4eea338046369983a3495fcf982d9cdd27443e18702fb0c956492cc33f836a56d6053a26128807860f89b56615d45faa8a6b1be03966b42b93d3b21894094d30245da910293cd6a1068a44f7e3e67ff39a9f5608870fd6b670f9a48e9a90a73c6837a051bc44202bb77376c445a6e77485886ac2169cbe1df57d980c43ce1d91830cc0080bab5d3e07cf5271bb1839a7ba3061f19efb9b5c8d2986aebb2e0d195343041a7108a3f69ac6eaaa659b0d2ca6c9fb0086ff0216c956032b38c24d976b34e7c5e93b41b61e8f2a29d10da5eb2fcf8f4930d5a358a038e5bb31ee7314685d44214409d34a2db4c29da94467f6df55a65a58c351a3ae0584d12d9c857918dc8832004c672cfe61f0640aefe1b0e1e9c72df9df2fd4aab43bbce76901b6ee629d7c522aa08d13a0af14e9b1894c28b344acdc30371a2bf77dcaddf7a96d36a471e78493cf671ab47d7b2aa90dfb0c7c71599b336cdc16753790169b2ed5cb59,0x6ff022e281bebfe7348f4e04,0xe087651635a9bfe81e26c2a5e22b542f,'9bc4e918e8aeab19c6e88580dcb2123f75a998c9e0e3c2983e0467f3f39e2f5b','63','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('13','7','R_INDEX','simulated',0x6470551ca7541e4254dedd4c695de1543c31a0038332cc209fd5ba39a20137b1c7f58f9712335e0fbe4cb0cdf6ef525509fa0f871e148ed30bd584b9312cd62d5950517d23d7a23a6082e738dbf02f1749c64967fd67ae1e8fe41ffeb3a37ceb9ff7662cc834b83e82526d3f36427354e4cf18f6f641384c4e2cea79ce5843f493045c59fdc98a739159d4209d38ac513ce4013d11f19b72052e0701330ad36f99d8b67a9417c11fc25b8a9db0609f97b2c0d4382e6f79dea33b78b70f6a0f3f4bd71835e8427f54fd7d4219697bf46edfcf337da0c40b8a96cad7ac48ef8f0e575facc54a1ec60a015a812e05343b101cbee3ccf79be3267121aabe403c8eb038eec2cfeed56dc264ea7bf85b7fa0cf53457a3e0421bfe4e038e2aeb65ee22039fb2bbbc4049eb9402a6de78ab6d0113424be148454fa94ce1d934efac9fb9b3abc0b529aaa4f5d200113c9dc53d08371a424e0800e3ec40d9c271112a4ef03430d7f196d22ab30947546efc635b299225ecbf12bfb5d0af55b6b42e183a27ff46387951794b459ad3d109ea8c7171db09e6d3c863d2e38e2d0fff6495e976825866c071841ffee75cc3714231d458aace8bcf657e600588db993ae16aed4ece8181c7882e8ff3cb4a7ccfc2a7141a2d1ef57ee6b039f249fadb96c606d6b2ccf73052f278bbf6ba3e230784e31191cc5163e23,0x7af527648de83efe05d439e2,0x621a0a8b14223dd3881c6497db960ce5,'aac517702f1cb307be6a77e9e4f9618dd985bf1ac336f236ace9b9ff32662bb9','89','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('14','7','L_INDEX','simulated',0x98c000c58ffa584e9fe82ce4a07955c5d3897f3c1d3864218b7e00480957774f57886ab2751483e273e0913e392f64414f4d54dc73a119d27fbe44d7827e01325da1acfb874bb1dcc4f4d60d5668e6e53739973d19de52e08b362726756006a05ef2a051a8db0a70a04adc53d8642d5e7683c2b4fdf54534edcd64cf92577f3705b4cafaf1171f8d7491d4bdb0715afbd9e15365f4ba483d8100bf2771e3c4e43f9695d63882722a9d8a7b3fa9665e03ae84ad12c480db6ed3970d2cc612816f81ca806305b807db7c74333dc94af61819af0040dd62a713f50a7c9a7e200e1c1f5fd2ee888da7e0ad68f469ccebe61145a340789133c2584b66b72312fcf146bf0b9a73574e065186ef9fa6e5ceed45687e2f7c4a5f79c7164be9fd454f8f08d9c41d617e783724d1969c7b30cc73063fa5c911fd0fe8c9b3feb70457c816a42fbc8d06f741ec154abb16dbf5674940641527a921114e159d9e35b2b75ea7e7c7f96a132f5141d223e38e06313a774ca01477a20b0278b18de52d4981d6835c97bfc9bc8b544cd19ef8ab53ba48964b8d9c5f00bf9dac1b8b9cfc0bd6ffeaeca8c738708a9fbaf1b56cb04b25399bdf2755b71e03beec6d6857539eb2d80eb2e1492a1bc3fac6535bc3e5ec61a6506531ea24ac17b5faec8bf218074c69e57effa8c83ec23263bdcc3a354b81602b99ee4055677bffa0,0x4076317fa4554bb33a095047,0x6fbc1dbc0e285920626b1330016d8fa6,'6400270641b5850c9f424a973da21fe606883ffd323d47784e59540af02b9296','73','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('15','8','R_INDEX','simulated',0xf2d31dcbfdb6b5a1e140a896d0801e11b182de13806a0bd745b38223e1b404fba4cbb4ab9d76ca1b0bc547475023b73ef3d914cd89fbeea49733bcbcbc26bc82e4de3dccfdce61a188da9cfe1478b92bc6bb7f80adc2b409f13678d2d37e7387a7c365d7ee5e08f61d53c795b6090a2035c8ab07d9d9a0cea9c6e7f423c955a4211f5a9379cff65312165ebee49a57cab04df120f02eb11f466beb95d0bdbdc0d375eb49fab2bdecd272d881325f2d6db22986c026401befe58adc5d7ae697f36a33417c33dfb6e3034ed57e26bbe1cf1698d6d1373a8062b4b95afaa5c35898983b2912d5ec175b2c14f841cebe8b196871a245d06a8af243ff2a0feb6c3150f2a6ab91663fc8b33e906ecf259748ae4a4443244b17c4b59850859f5ec83af503467e7222703df84b40e876daa847da6df6a34a359484a5f20dd20486da81f0f8f6f93430118f30f0c2eca39c87b1e648e9b643b041f50317ef2879372d6d2c35f00dca433f1e27098b995fcdb229383422621ab2736b6fe8c0ef5b36a4a39c4d3c8257ab3d7d99483309b2c29eedbdb1e753b22849b5c4788ef48276d4144dbf250bcf64684d06b7fcabccdbe957b65c4e17cb6978d6a5c2dda4e2c55e5c48fcefc36592e8a13d7f39478fc9b5ee136eb083266ab0cb8c045ad45663628a6f9e1cfb220b3938efb17dc753657701f7d7c7ebd533c6,0xf57d1f2995439d19b91c280b,0xf2149d89555ed4d626a3b44f8a57549f,'e1701305b520838dc70484e01cac762531cbbc30ab4c3c378ae9dbdb7d5b4009','65','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('16','8','L_INDEX','simulated',0x12a1db033b3a29cdfd5bb153c579ed01b2cf62c77981a9deece9dc70ed366e14b6f3aead72500f638ec83e74b56edb2adaf55f8a333131b8a78e92d32f9d818887ab8bbe0b78fb9b415304f86bd3ed5656143686ae727cd451a6d44ce84deb13fde441c584df320bd4ecc0fda2e61f6d3fb491bf45883f9b6d2fc9f30a5948591a58c809bf3b9d5ea79815a60033cf0eeeff3836f7234e2976903dff83cca086832c167597186e3020bb0593996cdaa10b60dd72e232bd6bcebe3f3175967302686fd67143b1915ddedbc77f2980320c4ef88aefdad82c9797092344178265b8a7ba5389a296dc0e3a4770a0dab660cb5e75d49373e86719528e45872a2cf30dca4534450550a72a1ec35045fa6113fc6e0b1fc7cb6b902ed91542081a743aed33d8ccf90a1f5dd03c825297ab073968a9bda4dcb891218ebfefdffa77b510bb881da355a39574bbd873463235c61da46235b046ffa37353422db8bdea6496264f7ad21915d1b92e353120bc3375f6d8580f203cf825b83829d5c9c428216f6dfdea2bdc85c46b04967e9f852411b413a610ddb3a3392b602e378fbe39ad7050d758ff05f8946583993dad79707190d7f04990893a5ff3f0cc932bec5472750d6221b68c8a8675a65c50055e54ab2cc65eacbbacb9eca5fa24ea6523560e64ba189dcd54db73513e74f181d5becbbc9f453aa4aa24dc8a88e3,0xda3141076c4ae8bf49149975,0x1916e4252e9ce189362dba595455c16f,'ec9da313f04048519a8160c23f5141c8d19c076a2ee9d68e8c4faa01187f2741','65','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('17','11','R_INDEX','simulated',0x9b3b5f3cc37738f955b6565eee4928ee4b3a1786dcfc367bc35fb9c65a2049c458bc51fb895ca3d8b84057fd585d30d648c18e3036583f2098f80757dae6c7b0784b0723a2a600cd7d8f40691d4a0cfa52a613c64e91b87dca7de14db910253e1de077c8cb448ccbb26cd10cb704c962747887b10d3fbb1008d9e0c9c40488f2519813719747856422bafcc22d94830f418010269e3823329f1fae197819432a6d2dc7ff6727bf24eb9667e77cf27e0adb85564bb13b9a5c23985ca6ad923516437da5719eb7bb6843837fb092f3f02217b08f5f910bcf30243ee171c1b29929993d2254492d0114622dcfb6f0f875b76769849b6dce76af6eb89bef6691e2ed2f0e7b93896d5724b6a0ff545c0eec5762016b055ee450a640d4130a729e1afa6fa00c035bef8a2ee24049e9e6acea27e4f63835fead8dd46a281c7e2e85bb4c1ba5b7260cc40312743b2b8aed93d1f8af32d2d364364a52a414b4fb6bdb470fd24b378138181305d5eab2f1114807739fa6f68f55c1505fa63f15d0f54a8833b956367b1852eddc62eaa4cbe0506b5f6d23f6df8e57dfb14fe6c45b5d5f32464f934deabd29c58bc0bac363e6333fa0daf4359e7f6cf91eeeaecac70188b83bc80a47b7b4b96964abd394851df1614ea955981b5e959397d2d5dd7aedc8286b8429b41af5d8c25e700b0f34f21f0015c954701efad1e555e04f,0x0c44d1c7702c43fc7f0f9364,0x94a2a2826378b1e593a664b115033588,'95b690a137721658d56fc94ef06dd17a61a777171a9acda85cf0ac61bf1c5262','62','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('18','11','L_INDEX','simulated',0xf7503b2ef71744320e8baec2528e2df481a936a55a1810e6d7be2b1515352f70418bcffe8fb53406dd32c7c259793fcc97c455c24eb7956490b08107ed4c507b3d594c0c744a585fd2598a79a6eed3c4ee01e90cd878aa6a5e96e8b7402132ccbbe592d03f2eb7c8eafa544204c1253c75cb8dcb57dcc4918146003d9f3e239b12ff13dd7e32f0ca41ee71d3315cb88a671a7a3e258e0833360253acd9c585f71aa8759c7deb7990943c13cf1664ff3ca59cc13905ba07caf0b794f8499582edc20f5932bfea7a381395c7d2f75d82c933a3296bcafc8ecb1dddefa38f8f349d89feae4bb562e1a50c172ff292bf0a698d718698fa800a31284406456ff10d1abf44854882f411012a7e61fe3c102872851e6e7933bc5c2734ca0a60dec361e892009b8f18315cdc72efd59ce5f9f0fe3bd12816a14630c763d7b9c4cfd0a7814b77d4ceba854854e099e0a50a6c320c3820551f4def4819e9d8b025fd047ffc43d09a1df7037161f4b4c76a0d43d3ef75f5ed4122b2e2eaa619f3813d8e5c3c4125ec0736ceadf78a304a02468b931518fce9fdd6f87bf5ffeea11f573bbb30a424b5a567ccfcccbf9336058fab7a5533e128601aa387de9fe7e5a36aaf1f9ca8e686f3f427f12cc77a0e57b2207d11cc8a0b281d2b4334cea7a19e361c21187466eda7e6b8f2da8142bdcd5eb7c75f75d67f3772738f,0x45e97dfd2a5dd1e4a042c19c,0xecba1c1d0c6725baf45b1aad5dd27cae,'4d25573374ec0f1ad8ff8bd3d9d2aa22e6da6856904f97877ead8efbb8d0398d','78','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('19','12','R_INDEX','simulated',0x17a78abbd35b012b09384f2c5866a3eed247dde6e0de9ea6ee868feb5eee97d4c84608e6f84159af72f18d5788512c880080b9ef5e981e8bfa66ceb1709be44f4d119605ea7fef472a5815c55385eba1a2bd730c4f6d2b972646fb7bcdabe653b571d931189f2b305677eb90286d295159fdd9a8de97ef12c9a7b999d56f6d00f8f2e9076a9709b9f34ad34aa768974f911c4cd4054476e33b59d490c933cb8e729160b4da72282cff7cd4cf83dc3bab362b107075fc31c429286c2877d6dfb161042313cdc48484d256beb87819f9a2c20eea265bc929ab2d4ac4c9d223fcf302574c6a8592168b55cf257ceea45b1dffd0146ec63a615108efecf451842c1ca987f86614f3d31ef8e814bb217868146253af45ad56088a5befd0d9897646e293ece130f568d194bb470612c7dcaf3b5ba80c0793842fb203455e01fa67aaa10bf341f5886458466010b010350e398692081188e82c5cb9114174d4b0ce0bc61e8036dd815996ac54813248b0c69730c53fd101efe5e22750f154e573c55252cfe970bd2fabb1828efebfdffa03859029131e7badc1d25159d59da8b5d502ad0b98193b51eeb0623fd66014b1d0bc5c505981d126c93b30c292f93d4a86c01684dc6543adf55435a771291ea326a8609dbc3a31ae79c2644aeb2badf5306024d751d0e48105713f890fc489be012d67d7ed0c810b1a977bb7a4,0xba19118cf61a1aeae5be5cff,0x4d254ba361a54ffbbddab9a27febb454,'b5a767af8a33542a8ab93c5d3e0357ea9e9ed45f308725fa788ee3c76cfb8dad','86','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('20','12','L_INDEX','simulated',0xdbab3bc3eb2f8ba84eccde66e448fe072671ff85a09a8520deb46593228029afab4dff3b42234bdab82f6c780005620488d499c9be3cfdc52129790d49a16a0e1f583299094602747f93dc31753a3cbf03497dc596147e2485b57589cb3f57bbbe5c0166fba96f66f709340c27642b8f3d22d201034487b0bcf7cf7907c966ff5fd2fed94bfc02a9a3a0ba283f95a680b10d25351cb58f28df897dcab2c9e548e41aee512198f8efb518e373c870d580f83f20b13a9cd92903d3ab9e4d4af12310c54efa1112f8b74de1dbb58d384ae685fd9df58bc126b20678f344041a3f92f122975924fde56960fe116c124aa4887cbd7ce59a77287e11c1126f07302bb9cc03c10bc513520e1ceb26f98960d1165fc280a7a3bc8202189311efb4676fade737b2255dcc29cc0eea5d4ab51e123b5ae55f9844b311507b1e7232c9c448d29a98b1bb669c0c123d2c177cf276d457164f7eefe23f9963f042381daa574df080bb2514af1b76db102982fde4179333b60d4a7069a315a597ab377ee212b5af13e537ce9d0126d9802b38c6548eb4a05ee762f70f12160090bf5398dfafe35e334c18f59ce1c4f4b76398bfef9865caa69fd54a6eabed31327ba55456327c0ffef3373b93b966bcff480f8f134b95acafbcdf2bece9672845e71668a291fd31ea73a484cf64872889,0x945e08ec09a5c865d35c8196,0xc372e2abf26313a3c0ff6c8a50c8de0c,'601c6548e6734845538eb9c470db26f59984727c240548cd81ff901613561dac','92','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('21','13','R_INDEX','simulated',0xd7f1cc9582a2415409a9530afd4ff969e98ab34b8f99de98e442aae8d6af2359824c50b21c8f69e1ea41403efc9fc3b36217357ef3d814db319bb5664dd73a7d633b7a1caa379d713ef99cc384618bc5df54d43c76a4abdb14feaed9a11a2ffd0a8b9ff58a04f4a6b949ff21c7bb6db7fd000c2adf35084851e85fbe18fa04748f03b267c2cf616d90e6b065c8c0655ce4693746f0ef349b78286e46d878ba906c7527ae73a1f292455b3d1683e361a3eec483304d3399e0333dc74eb19422c11e24fa6c7b2152850f789e4139ba8777263c5484d6a724400ab94f29c94c56a6a40896ad54aa7ad93c57b5e87b942edb8f2f90e695b52da9e8a2600668aac6e698f801efff7daa43fa06001ff9165dc2bdbe8942b9f5d2efcce8d9d369111b5f4d81ab9ad013cff38e0f6e845365b10f32f206c8d94fea7a9b9c0cbf171b91b388f3a7d7330aa80e8308b789a782757c8b80d772124ff677dd42473c1216030a78ffafb4e38d93a8d59617de093c0d5099c9bd4a92d50655d4fe67fbd0df488ea2327b2328f445cf033b4085f694224440ef2cb37773baf6b4e5b19fb5437234a28e91753c59c0a520dc60108da0c2e259ba89230e5927da190d79a41a44d38e21aae9748afe5cba4032d8019883675157b6d050d8c5a1f78a8f938aeb2436baf61c,0x292abc750d8e334314606035,0xa86cefc9fd694d263226ba3e28568455,'1b77a4b0047a45ada8869d60924dfdaf72934c59916485ba5a782a442494541c','93','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('22','13','L_INDEX','simulated',0x64be4cc6eba55947318f588ec4152974cd1d9ec1e52c23e025ad619f78545df3310217def7315a56090a67bf11ed5d09f88d7067fa74171065b7cf2b69279ed5a7a803f09741ef5f3c79d1b6792d60dbb656973aed0d819c81b4c7529fb84c72931848b1e092cabf162d666d3d7f5474dea02c9958d54314ba4ae2e2fe986a1ea9493015f9e73977084694d8ad7ab750277d5cefb571f4001d85396265ccc24a0b1f6e4a42e94c3dbc51c5b8c2829ceba00165352489140a32a86d7b1d5d1a3a30e7c5c4db54bb3af2da6b805af0baa081918b631b759dfdbb9d523a1eb3dcce39a051e1cb0cb2561f71c1e29471cef65f9fe7500b52ef7d1f34e2a7af9c986623228755151daffe81dbb04d0bf4295317339bcab4f43fad59baefad4d4f6d6968d554021db25ab3afd2c30eed837b3ea1e67ef0addf293339ce5b199ed2cc03789706738c34f82205e1bf0029c4088c45e7b02fb762465e394825d3a7e502cbee0bf6b78a929b397d837659a2b15902ba7e451b0a6004ca7e5d985da1b34217854d4659e1f22e3de6a737da275e40cf2126e5aca8c57da0af6b29f8877d0ba765bf5bd74769aa7fdeb923cf5e204e47b5f2414eab2fc9042587d5040a972193a84c14954790347a83f93eb183d0240b74a6089a6fc6184700bc492bd4cc22159b70d3d25165ef48006d36f97fe18ec591,0x6375c50d5bcb925dba965f19,0x39ae32284341022c2120f35b0df87b1b,'d291b89c57afca352993b45eb0b4124ba4d94bb02d17b964206e113d896d2ab2','74','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('23','14','R_INDEX','simulated',0x33e1e8a8cee73a5cb6a0603d666532b37d751a7dc64a5ac67345de6a8a6fb34c0be1546e1221f3f84b538a162040db55301629040d32512daf8fec9c8505536af3f696ba576315ebe47bfe2184217e8f26e47722d33627b08a260b9ed5ed34ab653f722efb0c747bd2789ddadbad3fc7a0173cb133c02cbd48c50ca2b5221fa2b73bee61e70c12abd6a6f1922e030a481d40c734895892637926c51d24f1d32628e15098b545a13468025e3eda00afe47eab8c4991f2e96eaa7c615877b6925c941bc0a6e169dc82f915cd3975b464a3ad6b3576adad432c075b55abe2e5e686912780021cabbbc16dfbc198c479e33da1370c016115d3cc670e7c4d422124cccbc2604188f455417b183b6b8a4e204872fd5a1271678fd0d2d1d125ed2e257d183ae0e78ba204960ed9f948428c0354b54566b7b46df6f470990fe7ec4bbb92a3c6fa6454a1bb5e167a2129166549c22ab1cc3ec0988b81aee7d9db95e9f6c4902d6edbf3f9e643b801c4c7598ac5d0b2dc3029d1ca46d92f5bb2a751ab651986a8e918fa2907a4a0de211903b25b9ac2ae1d179cd0b389cef63f3421313bbfd8044cafc30f424d6e56a99a8bb50bd67ad808a7487cac4f528ab8203a3a9957cd511ea85af75ae86262920157327f8081a1f5cafa9d61615140e54456d077cd72f49dc2f19fde58ab711121bc151aa7b2288f039185ed5b66,0x4fe198c6a79a959194f37cb6,0xc860b7eaf0609c05f8ac0ea3348cf49d,'eeb069c19838d77f17900df01cd93c52a6d8fd6f6d210753a6e462acaa556831','64','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('24','14','L_INDEX','simulated',0xa2092b42ce260e1777ac3a868dcbaea437db2c5187844c549da41cce0e85a34eb1f5c7b403001a89347be76d37bef7c2e05c2b65f70f0e7cf651cfa24eb29a18ab615ff9e906fb120b7616c0004493557ac83424fe370b60cabd9bd0c3a2adc72e8ab2677ae4467a6c4802634459e6c97db612dc8c66cb1586bad51e616fe7d96c88b2fd35d649396e834f64d87fe1f804bcbaa6ada1049def9f8489dcb4b5217f3ff430b8f680db522e2fe824576f8696819f0c74c6e031104d0705840ce8b91da3e7da7fea85f6b65bb917aaa35cd615516ccbcb4a9b4486527528f533ab306f5f0d6d2c4893a94f14d79bf9ef4785e6625534436dc05ffd0df226f8d153c19b704c293e28858378f496297d07201b4b5ae8531c6474dcd8de98489f45652a203a115042fc691c7dde509304af9fdadd8b4631d5a1794521c6fc56fd8e543ccc84f3e2b513aca63f45ab7c0052b4d7efc7f94d73bc76290872ad59a6dabb95a2ffe0a9771c5e8a8e1fe952b7a3ae5746470614a3688b95a8570ef4296f040d876b58f8afcdcf908d6e70fa5960f21592f6b594c13586b359417bf1ae9157f3b0edd81efdff474e83d6be25763ec8063c8ed2f56f152cb5529e53aed41faa751e04c2a14b4273a721688f2f4fb0d67977070a5a193278a939dce8761efdaf590a9de6f4624bda43cd857d9fd1e4c1b329171a3b7fd2f28b,0xf38b02e96df4295b1cc4da0e,0x05f15ec1fcba29c61204fdbe40147a37,'81d74ae0866c2571d3b7ba7e933956272d2fff1f02e38e5af753dbd0fc7edac9','92','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('25','17','R_INDEX','simulated',0x2cf28e67980f7019a97852089307393fc4962fedc67f6ca70afcfc4b2a1ee4c143f4a1e61d86c0c475e7cdb0703c05d942a68edd2bfb9cd824dbc7a69d781d5ad4f90c3796e1c359a054f56922f024390a9548255aa2b494d5edb842cae4fff557cc6a6a8dbef7cc92debc49d38ce35b0d2b39da87b7b0dde1f8412cc238ce43221ed58b834242cea47279da63bd20045d9ebef48277011997cb86d508194efad582e7afbfea0822ae0f2d086111efa3bc8211e8d1471ed26e2dc49c67a69f52da6eef9df7cf8868cf0e863f735a34019844ec3a8d7b715bc55613390442f138512b439608cd6801166405181529e2e5aa0f7f4f24a97c4cef184194f6232c21f2c45d7af30ba9644893ff9c2120bf0f9c8f8fe5bd8d1dd2eefdb1ed02c999a65349b19752e8fbeb7acaa2cf9a3519aecb56d77a148cb224416d866c95f6158c8a52a83accc5201eefbd444efab6ed93ff05100016e1a3189cb0e27f7ffee6e6fb3d3a938f846ae1804a696c9991b692df764823c2f72eb4b5c361b9f034004ecf557bea3729e40eb80f259bbd4f6bb473e6399766c5b88606ad3723875f0ea5a200152fc5e381d0d5f23595bd24c9b25f9216493a9352871efc3010ee97eb6c9550e86ca1c51c9445fad82eb9dc20ea73a50e9fd1d2ff98415b2e431321bf71f4e58b3655a7b9fe14aaa0e748e7d1db74a162ad4c,0xaf0da8740f74634f1cc32474,0xc5572b260e7cc304c4b2919537522045,'67ad657d53e7a321ae36cd06412c6864d188fcee70917e0c8919c62702e1477e','85','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('26','17','L_INDEX','simulated',0xbd7f4209d606914b0c06f79af075a3de64a8d4a97e04ea38b7703effe7ee62a75b8c7e6b629987fca9ac5c6d7743b46334c0a01e3004952db2189aab85b6558b375ce2fd61b71eb05195132c87132fabb0cad32b837036f564ff7f7982ae7946071389beea389a0da19994b1ca3b44dd25bb12055929679a3724796a3b8047b58fb2d82442b77870752f7fde08665d0940b14f905c2252da4e8f5963a98d2121024da07069cc61781621d65f3b936d206549d818341d7deacd67adde5ec4ea59e9d7ccc00e52a25fab8ef0d3211130ea3042b65ef5f45ea07fc4efbf0ffbd0646eae0a10d3ee44b31db5fde8c0bf39c1b630849bc6eefc8759522553b5e66f39c4c3b18ff610665a96bb8db7a7b9200fd1b020e9debaa0c3aadf490453062e1469df558a2134cdb33c4d6a178460a169861e1e6b8c9ae9259fed36f079975472ac6198e60acc87b9ee527f22c7b11b77ef1a64b4903a9d9ae7a0457acaca6d92639552c3bc736ec9043605917c3c2d28ddc0528286e1ee50f6e46620f56f5e876b8faf2c90b66e08d84ff5fc56b692ea31d75287f7ddf0760836d996dc2c603aa90eaa6babbff57adce2d0ded3185d0bfbc40f92d6b4cf25ecbda135491777b72b605891538f357652e89984cebdbe18772e44ec74571e0ff1b272fe7b63cf43a76abcb953ccdbc8baf7e9961e9b2ca90855087e6d3c4cebfb,0x71ee14ad9790c27f6e586250,0xbc3902b4a39f25897da12eb18945a502,'613bf73c0d7a47e8046146446bb873489a7ca04dc239e927b7db85e0a758b1aa','82','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('27','18','R_INDEX','simulated',0x75a7f197f0e7d5e1a68a5489bd5e9b56b7d644bde53504655308b0f20b1ecdf8d9f3d9e67a117a1de22ec2e64df6224c7eeac76e5f094c1ea738f62802b4038f9e0b469c8ba1f30d7ad0be929851667f508d362c155375573d8832299c0ca44a543da884aabe90ad3c2b812e6220e5ee35de98c80b4b61e9b7912e4ce434e8bac1ebd633119eab66686917164bd6f66b915a2773fbd03e2536ccec8f69991dc7ce4ed173146d70d9f4912e0df596b57e6a8929bb9ea163a2c2f69f5652d8a0ea1a1afbf87f9b825d3089bd48b29f59e102c7135209de7155948c8aa88744373e9621f35e89a601800138a7a021b8c18a93ba3361e5d8aa0f56c2044d1b94bab9d8598ec2410893eec65c801a46cae31dc5681e00b157392bc6b0bf8bd1895715adcff56e0e925a71915a672077ea63b9118060a8b054f0ee66b2b4fd681fe82b2a09875473fec346b3553d2e77f031110382a22516ee25a65017e28089c300737c231362badc19ff80b90d5977401f5041407b3d62e66f66410370a9e3840587443bd166e10f20b04b240a71977da6f71fe3a6793e11efa7675657ab043a2ea23bbcb77a5bd9065543c822cfde8d219369f06ab9873b47aef0623456d01d0de89dfc3117b122110493a9097dd6b7ace5d2c7173d4a01693456edf42c6e1b76760eef22a4e78dee97419209d9033d080f46e5a7e7f57e7bdaa2e7,0x983c4d4fb64b213305129cb2,0x07b586554a36e351a1922d784b680796,'d216dfca9f3ad5828c9adf9efd91dbb2e9bc85270a7eb94ff3b1141785490e9d','67','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('28','18','L_INDEX','simulated',0xd156727f09e6a5d55057ae7fb757c55b156fbbc68059ef199f9a07f8737778b606570c5f4b56439c8d91f3d3bb76a7bbcb81e3f0ab81fc4c10e8d6b2677c6c045c29f049311bbe33d664343d983c4727c83e12613a55d6b5c60bc4efeae6dc2a44ab5b982bdf74ee644da024df8e15211f8bab83b62d9bc677f29785ba757078910df6514c021f832d2453d19ca493c5f5b4b9b5d0a7b3d35ebd79db6d4918318bbfab8352b71e93fff7d4161a299ae358fdcd668dd4174a544a7bfa002a5578ee6ccf1e2cbec05bb7bcdbf3e8f9ff2a2d6d48e36cdc447fef7145167d6329727afd04449d6193a706bd21f13307c8a3d3c5ae42414faae94786f12823d9a706eaed5a325ebaa060d1bdd3a78303390f62912bb25e9fabec4b16411cc2b0b5601a2ac9125dd07b19f8101c74f0f9a0536b74849c279d88dd83f0a5d1cb772c20eecbfe93abf05a17876be4b8e9fff463f4a55dc542b510accbbe26f100500bc96d790c2e8976d3c737222e49cc4e3cf6ce26e64f960f5be58bfa3367ddd987c8f7ca051b01dc8eea6b5058de14e14b50b3a59283e6d5b9ce3e0711d4d80145612edce52cf78d6cfde562b0a214d0a1306ff67724eecf166b5b2813fb2242ee4f515cb93eb47f231ad1292630054720fdbc0169e872ad514885566f5dfef33d47f67af09b4a840b9c6719f06d92fb36df61f6b20f151d,0x159a1b326986c31a7125fe26,0x0deda7ce744788538a5f4c2f54d225c9,'9a7b0be52e3635368d05fcb82e31368f23ea5552128f6e47e5a0d1833e636f7f','79','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('29','19','R_INDEX','simulated',0xcfc61751c11341b645a9cbe065f009fdd87a76afd5163bd7ed38a74032996fd3513974fe35a54321ca5030fd5e54d848fa0816eea3e84884d9779bb239ddd0b3d2883b9304d66deb2c03b7e909b113b5cdf198e869362e917ed20b5c38d6a0b3d4a69e7a967ba7a7a132d4198458948e5e871a525dad8a9ce7a1a5c31a9c0d25c4403f7aad670a66c600840912d995bcbd40b6af1a9322682eae10b432c8c4a561056650991bdb0ff3144cdb9dfcd0c2bc58bd1ef0696ea45a0b192b448464edad201779f4a53db1cf5386e85497faca8ea7c3e5997f29c5f84d2e786335480ba97df6b7237c47795703ca6e3e54587c6a5ecaf266163f537b8f04ed2d478104ffd1511e50be00a73d461d0cb4d9a2391de8c74dd90120237716be26b5547ce61126333043f12052a3baa189e10b927aceff4c2a23de15c936417eebec892429585debf7230972e7ded028244f4abd1d474d4feb8d2b24781162cb9d0fcc3f2ed3b884a4c6878592b173834d547edad5bbfe52d0682a237e45ff6f464c59b2eece640cb257521c8749d2ceb6920edee8e7f8abed1f92ec60cbb7869d3f42e9f210b9cbb33f25f5f05158848ae934686f5e262bc5ca47cb17e87e03239c05fada83cbafc739bbf860300109b586375522e37b4167fc40c83a461eef31253d0459784b0314b727b28d58f6938e863f1c67,0x44d3d40b5a076acf42ed53e3,0xa16be7cdfe1742e764c474dd3e2c63a5,'c41aec089976fb0fb22b693c9f32f7a967f16af249f10d8aebbd23d49e2fedd5','78','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('30','19','L_INDEX','simulated',0xc7c3b3f4e34c978809bb2f2a62f9d52c25a6da71ac2cf1bb538963c55d59dd921f17f5c19046abe11bc11ea40f986f936506cdf92605078b4b2961a8e590170163e42f2ab0782a2c91d400cded8112ce598e87685ea31ede1a9b15dfb76954029ae32b604f0fad70071d6a2a6f52aa7d91ad6a8425eb99971b2b11995d00dd6129777bfa1b4511576085b575cfdf80276ecb5d30816fb9cdef07c58ee7fc908b8b049d454575c50f94d7c1626c21ef05832c5cf147af81dd5fa581c080f57eb968b88c9ef08b39cdf7f25149fb21d7df4e210482c50487d36488b5039d1563018807cbf866b43d5a309a00d90191a101879364664b627d08d391e44bafc91fc9ce6685f5b28bee56ca788b0c770100604c42755e925e2c30c400fc9208b351ac63a1e1b381e546452a729c451546fd93e43fefa7bc7dd7d57de56fdf2c2fd2d45a5044a546d48f45d30bbdfbd6ca441d58d89c825f47ab3e288c5cf94dc37fe43a848852754c18d4de0f2c1b80e98d5685f8938536bc553a62c672330839c8902c6c86c0150c5dafe22e3b95507ac4803de2b96755a1925a67bbda907f12fef881014e7d863afa4f67b7486e36d3acfb97891dd0d85672fd66e44b574428dd97b9c2dfafb5b5fe74e3351991c3e90ecfc585a6fd5dda349dacb78ef6981f633a7a65f3f2cc456eab,0x9ce3eabbd604e1bcf043fa7b,0xc860f8a3559d740ee8759f3352b8fa4a,'a5eca6ae94f0abf21db8a0de65b8b9219405385df32cc96a4954339bb602984b','86','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('31','20','R_INDEX','simulated',0xb74aa026c5b48306c3773d1d0dff1b68bdb759c326daaacdeb5e0904c9b061337f186323f9ca4060b323d8dd138b6e97468ffedfae1ad252d5d43ebd60d26de57639d6af7c19a85261aabfbef29cc08ea027ec9f259a9d386475de535496114c9745d71a837ae469add381eb685db7a41a5fb2efc6815692a1706fc1f0c39a868af6e941b29ab81c56d481f383f6a101349b50b52bee4d7be41b5f2eac6161c0f8d1108cee3ed6996e90d819a6a71fd0e794ca51c9d557529829d3e2a7c4e047c0661e32d8a54111283bd916df07ce5a6f031f525f555943471502c10393657d19b8eca3e8be226fa5f9e7e453541dfc5c169475746fae0e07f26b8d749046802f4696f473f5870dbe452f919142f749109894742d12ac5eed25768642cafb2a2d6b92105ea4eab669bf9e2be24e89fee7e0df2b0bf8a6b8c494d8b0f3b4472276c8278a9b902bed4fff165cfbb062613b9efbd172394019d0b3db8c333261765b963dc647edfe93baff4df2c5fbc291944d3bfc7a889e81fca6967b53d8bb469432b3267a6356a1f4771b1fb2589f29850aa5f843d047928cd61601dff15ecb29f36f0b1155f8e1f03d49953c5f1e0598d9793ef1ce481b03da0fb49394727b8c5a4874e8fbeee2fdaf90c1434328b74be3864e50d8d5894a5fddce50360fb03856c832d6e7fcc8105ec161925167c09f,0x3fafb9593f587e299c95f4d1,0x44460cd8024deb2783d9b2c17c959dc0,'3e8f872fcaca12667058414ce5aeb781b14bd36b7c0f2d9989c78e01a8a5bb6f','69','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('32','20','L_INDEX','simulated',0x4e85baf83bbf1e85cb512d1eb34aea1144d85fb9a6a92ea1d4781b7e495dfab2b226d0179d371adefd9739443ae9eb8e09d5d3da5df4f9da6d35495109fe60ec98779c7ed3ef6a707842854972b7cf7d3025b29addeafa5d7a107ee9fadf9e9867d7b67d1bc29a184e075d9a2da4d7d8e50b534b774eda0508a31bf45afcb063e633c5057ca54932daaff0ba5a23ffbf9818a03f8ae5634a6e23956bce521144dad54610a0c4d3994a7d793977bf10f79e90db30543034186c3aa155c904cbefb274c61930a3203e974935c691892c0f63eff7c4ceee23eb651bbd82a00d93ea08ecf3fce7ad2c3575118647b69e97d3d4b82d0a3ea65ddb75b31f99f2d9938889da51b299b465b9ab6175acd3a201f7679d1676af46af6efc81ff2a01c7a3c3c6d1a96ad3a416ef1690910d15b9a8189cc91d6e97aab683ed3c4166038f93b6235dcce986a7a09580249b681c081339a95f015620071a1b34a306dfbe57015ef6bd72e2a9dcf6a3b372151a30616b3c349923980cdbe148ffe104e89d548d5928f73bd0b7cb927cc08960a2d4cd5c7d0a4c8eb3b18ec56cfbd58a7170b23e97056c822c11be64bb05fc272058eda79c34c007c793e923f3b456af7a3a1e4fde7e773bd3a9dd86651992698d65e9af6164e1eb76ec56629fd7e2d3d370179cce50337e18481851bdc8b7e604a54d41ab0425c3ac,0xbb49705376a5a3604512fb69,0x4fc93deea7ed495f22e3c31d4a06e832,'45e8dd53c3f73ea4ae546ea1231f48903c00cab84d62c9f345150da0cbcaffab','62','1','2026-11-12 04:00:45');
INSERT INTO `biometric_templates` VALUES ('33','23','R_INDEX','simulated',0x6c6a6b40171d6d725fc5fe77779aafaf012ea2654e39e25493823596669c6ce8ad65eaa20c6cc421d765213b1379cb9634d16aa99edc2e9d9c03a548a4c0d2efecf2d8cab7281b75ce915cc2e09dbca96a24dd555ea3e438901504ac2f6e5783cbfc3e773fc268f70ddec3a7f6a39600d8e06808fccc939941982f45cabdd89f9d1a99411608c0a642981b10dcd8111ba8fc4ca1359ddf1ffe7e1152a169e4183a58585113783da51a2d5acf4eb8268b9279e3f857e29527ca5aa7ce483bfd0a0ef2256439b709043d03720adaba823b8f58a384f176d19aed846184076f3931c1859d0e7634d4430fd47e220ad3d5db3e3710ba976f9b6928b818c32519f1576a82b9e5467891dd650391e7ebf0681487e65ed44419973bab6e5b5a8dbf3e1e016493b165df73b19924805f13f3ca3b02e68892c3f0058864942555f0dd18a9711dc6f5a98472a0aadfef32adbc6fc272482afabd33bec01a1d33244addcdbf9a32efc4c8e97d8d13820f196b1e8e91434ec29d5b8e31155ac44457f7856588dd87dc4c5bc952c183a509580e14903e4a6f62936ea44e5086aee560ca1038ed5f4d21b95379d375aafdeb4d42f8b1b2cb6b256e614a4e1e6b18b098ad4546626df1443132bebf016274ef7b584d66b2b22626021adca5158f5c54c386bac7a304362eae18ade352116e1d52feb224628b02921a69,0xed8f4bfa62a664c644ac7cf2,0xdec6604c87b85085a42a9cc8f584b67e,'d196e4692ce0a865bd56df57b099b83ba3f39485e988d60a1fe4efa4ea33593e','73','1','2026-11-12 04:00:49');
INSERT INTO `biometric_templates` VALUES ('34','23','L_INDEX','simulated',0x2822b6591ba2b098d28b3ae2f749d31e1e675966ebd5da2f26344801c6caf719ffa97d888e002e53e3cadcbb8e7bd8ed30e88fb6bec5d26966708caee30c4675df2474ce3b49298aac5ce8976c0f6b390ce4c85001871905aa3e0b4cd76e97cfb81dcb0b0dc6a41439eeadd2eb07a3be4c204976354405e197a11f53790f83b6803ba8be8e146cb3e8256c95126dda8f2f2e050fe9bdbc25195662c93daf6382ec763bd108c356ed1a697a30969bea3d095c09e055338380f52ecbe502c9e5b77d27cab4442961926c5be2559ca1b2bc2bcb6c42e100230264b2b96d075035550644d75ceb20683bd2415aede5c28f8c49cc859cb887d7fef01d9cbbabae030177be466f87eb7e21f708dad5687fe468bbd60a4680c39c1f0b3a0e01cc707de29069c6cdcc876fbf912acdfae1acfdeee30f3fa63294c83e53d9f52615ad9b21d0a25465d4f805c21b0b4c9cc46946ec7bb1977508fe77155f01107abfdca9d279ce83d9297b84fa4b2e91d2561eb5672d762a0a0bb95232e9754a26ad0edff6714a41dbc15231928fe08f367dbed459d256ffb5ec46606b1a42a11fd0f377dba32b2d3108c0b624dbfe9504c0bcbdfdffb1fa2c44fed54c7f4a43ee084868774180cd699ec439891d4d5888a0aeb58719f5338ab9b8a0b0e24f0f10f873767b53c9ad23fc112cb996faad05ab624758838326,0x97c919cf42901ce3981ec43c,0x1815581dba1ec703659859bde3bfb0e0,'f4bea5d67b42d03d3eefb21449f236aa28258aa59967f46768497c4e10382802','96','1','2026-11-12 04:00:49');
INSERT INTO `biometric_templates` VALUES ('35','24','R_INDEX','simulated',0xa3afe9778b6a0b30b5917ddc755bc5bf9b2863fb6254cd90fcbc181dc14830ffffb9b92fb0d73ffd0c21ee4d61f0416214ba33c95b8b992182fb9ddc98b2cae31b09ebbabd3467edc7fa0192e34ad34b6dc342f9ab2dc1ed37789ffe0c5291201271835fa895f88c2f1b485c8469bf297e30b28f07a43ff7303cd49fb6103228e30ed351792d5e1077b80604c83890d85ddd41e740b0160dd49274e384ded23b3c87772114018768ad977ed785cd2b58cc1e0004eb2afbf8de15c5fc7b27b07bb705be7876208bdf2bdb169f02d63f048930251c98280e6999e19bb94de38a17434806b04052878976258f946d4fcedca579e60baef1c98ee4107843a7e93a21a6f4fa8f19a8f755aec5696cb1bdb02aabc23726a50556a1a791a56b5144980479c934f817209b9efd66604ecf0539b02d955a3340ec7254e1ae959a072081586bbe09881be619c6b882e6b4d4fbb6737a43666cddfb7fadcde69988b59c1fb526f811ef0578040f968204ac147efda5e845f257af8f606de898b9f6c05fad283eedecf6a53056e9c7032ed540d8f7516d8b1a6b78f7dd8d29aa8977a69195b9bcf995472f8fe299f5d2f6d3d56b93e459ce317aa7b66d1d6765cc412a5f6003482ec63b63a8a137e2afe078f329ccba1959798b5e532721c6bf6abf1e3c530345538cb7c85ec14fefa40a63,0xde4cf9d0761eeacf60a72492,0x13c3bb520420d3c0ed2418f633af866e,'e20313f0de9053bea66ea4ba58e074cf2201e0b808ec1eb63450737357230c5c','84','1','2026-11-12 04:00:49');

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

INSERT INTO `class_sessions` VALUES ('1','1','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 1','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('2','1','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 2','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('3','1','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 3','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('4','1','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 4','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('5','1','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 5','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('6','1','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 6','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('7','1','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 7','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('8','2','2026-10-20','11:00:00','13:00:00','Lab 1','Lesson 8','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('9','2','2026-10-22','11:00:00','13:00:00','Lab 1','Lesson 9','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('10','2','2026-10-27','11:00:00','13:00:00','Lab 1','Lesson 10','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('11','2','2026-10-29','11:00:00','13:00:00','Lab 1','Lesson 11','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('12','2','2026-11-03','11:00:00','13:00:00','Lab 1','Lesson 12','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('13','2','2026-11-05','11:00:00','13:00:00','Lab 1','Lesson 13','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('14','2','2026-11-10','11:00:00','13:00:00','Lab 1','Lesson 14','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('15','3','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 15','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('16','3','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 16','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('17','3','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 17','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('18','3','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 18','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('19','3','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 19','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('20','3','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 20','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('21','3','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 21','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('22','4','2026-10-19','08:00:00','10:00:00','Lab 2','Lesson 22','closed','2026-10-19 08:00:00','2026-10-19 10:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('23','4','2026-10-21','08:00:00','10:00:00','Lab 2','Lesson 23','closed','2026-10-21 08:00:00','2026-10-21 10:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('24','4','2026-10-26','08:00:00','10:00:00','Lab 2','Lesson 24','closed','2026-10-26 08:00:00','2026-10-26 10:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('25','4','2026-10-28','08:00:00','10:00:00','Lab 2','Lesson 25','closed','2026-10-28 08:00:00','2026-10-28 10:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('26','4','2026-11-02','08:00:00','10:00:00','Lab 2','Lesson 26','closed','2026-11-02 08:00:00','2026-11-02 10:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('27','4','2026-11-04','08:00:00','10:00:00','Lab 2','Lesson 27','closed','2026-11-04 08:00:00','2026-11-04 10:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('28','4','2026-11-09','08:00:00','10:00:00','Lab 2','Lesson 28','closed','2026-11-09 08:00:00','2026-11-09 10:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('29','4','2026-11-11','08:00:00','10:00:00','Lab 2','Lesson 29','closed','2026-11-11 08:00:00','2026-11-11 10:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('30','5','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 30','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('31','5','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 31','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('32','5','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 32','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('33','5','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 33','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('34','5','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 34','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('35','5','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 35','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('36','5','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 36','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','3','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('37','6','2026-10-20','11:00:00','13:00:00','Lab 1','Lesson 37','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('38','6','2026-10-22','11:00:00','13:00:00','Lab 1','Lesson 38','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('39','6','2026-10-27','11:00:00','13:00:00','Lab 1','Lesson 39','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('40','6','2026-10-29','11:00:00','13:00:00','Lab 1','Lesson 40','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('41','6','2026-11-03','11:00:00','13:00:00','Lab 1','Lesson 41','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('42','6','2026-11-05','11:00:00','13:00:00','Lab 1','Lesson 42','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('43','6','2026-11-10','11:00:00','13:00:00','Lab 1','Lesson 43','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','2','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('44','7','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 44','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','4','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('45','7','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 45','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','4','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('46','7','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 46','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','4','2026-11-12 04:00:45');
INSERT INTO `class_sessions` VALUES ('47','7','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 47','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','4','2026-11-12 04:00:46');
INSERT INTO `class_sessions` VALUES ('48','7','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 48','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','4','2026-11-12 04:00:46');
INSERT INTO `class_sessions` VALUES ('49','7','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 49','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','4','2026-11-12 04:00:46');
INSERT INTO `class_sessions` VALUES ('50','7','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 50','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','4','2026-11-12 04:00:46');
INSERT INTO `class_sessions` VALUES ('51','8','2026-10-20','11:00:00','13:00:00','Lab 1','Lesson 51','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','4','2026-11-12 04:00:46');
INSERT INTO `class_sessions` VALUES ('52','8','2026-10-22','11:00:00','13:00:00','Lab 1','Lesson 52','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','4','2026-11-12 04:00:46');
INSERT INTO `class_sessions` VALUES ('53','8','2026-10-27','11:00:00','13:00:00','Lab 1','Lesson 53','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','4','2026-11-12 04:00:46');
INSERT INTO `class_sessions` VALUES ('54','8','2026-10-29','11:00:00','13:00:00','Lab 1','Lesson 54','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','4','2026-11-12 04:00:46');
INSERT INTO `class_sessions` VALUES ('55','8','2026-11-03','11:00:00','13:00:00','Lab 1','Lesson 55','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','4','2026-11-12 04:00:46');
INSERT INTO `class_sessions` VALUES ('56','8','2026-11-05','11:00:00','13:00:00','Lab 1','Lesson 56','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','4','2026-11-12 04:00:46');
INSERT INTO `class_sessions` VALUES ('57','8','2026-11-10','11:00:00','13:00:00','Lab 1','Lesson 57','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','4','2026-11-12 04:00:46');
INSERT INTO `class_sessions` VALUES ('58','2','2026-11-12','08:00:00','17:00:00','Lab 2','Demo session for today','scheduled',NULL,NULL,'2','2026-11-12 04:00:46');
INSERT INTO `class_sessions` VALUES ('59','3','2026-11-12','09:00:00','17:30:00','Lab 2','Demo session for today','scheduled',NULL,NULL,'3','2026-11-12 04:00:46');
INSERT INTO `class_sessions` VALUES ('60','9','2026-11-12','00:00:00','23:59:00','Workshop','Test session','closed','2026-11-12 04:00:50','2026-11-12 04:00:50','31','2026-11-12 04:00:50');

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

INSERT INTO `classes` VALUES ('1','1','DIT-2025-SEP','Diploma IT – September 2025 intake','2025','2026-11-12 04:00:44');
INSERT INTO `classes` VALUES ('2','2','CIT-2026-JAN','Certificate IT – January 2026 intake','2026','2026-11-12 04:00:44');
INSERT INTO `classes` VALUES ('3','3','DBM-2025-SEP','Diploma Business Mgt – September 2025 intake','2025','2026-11-12 04:00:44');
INSERT INTO `classes` VALUES ('4','4','DEE-2026-JAN','DEE Jan 2026','2026','2026-11-12 04:00:48');

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

INSERT INTO `courses` VALUES ('1','1','DIT','Diploma in Information Technology','Diploma','2026-11-12 04:00:44');
INSERT INTO `courses` VALUES ('2','1','CIT','Certificate in Information Technology','Certificate','2026-11-12 04:00:44');
INSERT INTO `courses` VALUES ('3','2','DBM','Diploma in Business Management','Diploma','2026-11-12 04:00:44');
INSERT INTO `courses` VALUES ('4','3','DEE','Diploma in Electrical Engineering','Diploma','2026-11-12 04:00:48');

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

INSERT INTO `departments` VALUES ('1','ICT','Information and Communication Technology','2026-11-12 04:00:44');
INSERT INTO `departments` VALUES ('2','BUS','Business Studies','2026-11-12 04:00:44');
INSERT INTO `departments` VALUES ('3','ENG','Engineering','2026-11-12 04:00:48');
INSERT INTO `departments` VALUES ('5','XSS','<script>alert(1)</script>','2026-11-12 04:00:48');

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

INSERT INTO `enrollments` VALUES ('1','1','1','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('2','2','1','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('3','3','1','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('4','4','1','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('5','5','1','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('6','6','1','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('7','7','1','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('8','8','1','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('9','9','1','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('10','10','1','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('11','1','2','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('12','2','2','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('13','3','2','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('14','4','2','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('15','5','2','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('16','6','2','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('17','7','2','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('18','8','2','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('19','9','2','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('20','10','2','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('21','1','3','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('22','2','3','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('23','3','3','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('24','4','3','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('25','5','3','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('26','6','3','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('27','7','3','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('28','8','3','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('29','9','3','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('30','10','3','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('31','1','4','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('32','2','4','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('33','3','4','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('34','4','4','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('35','5','4','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('36','6','4','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('37','7','4','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('38','8','4','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('39','9','4','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('40','10','4','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('41','11','5','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('42','12','5','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('43','13','5','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('44','14','5','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('45','15','5','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('46','16','5','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('47','11','6','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('48','12','6','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('49','13','6','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('50','14','6','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('51','15','6','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('52','16','6','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('53','17','7','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('54','18','7','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('55','19','7','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('56','20','7','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('57','21','7','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('58','22','7','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('59','17','8','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('60','18','8','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('61','19','8','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('62','20','8','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('63','21','8','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('64','22','8','2026-11-12 04:00:45');
INSERT INTO `enrollments` VALUES ('65','23','9','2026-11-12 04:00:49');
INSERT INTO `enrollments` VALUES ('66','24','9','2026-11-12 04:00:49');
INSERT INTO `enrollments` VALUES ('67','25','9','2026-11-12 04:00:49');

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

INSERT INTO `lecturers` VALUES ('1','2','LEC001','1','Female','2026-11-12 04:00:44');
INSERT INTO `lecturers` VALUES ('2','3','LEC002','1','Male','2026-11-12 04:00:44');
INSERT INTO `lecturers` VALUES ('3','4','LEC003','2','Female','2026-11-12 04:00:44');
INSERT INTO `lecturers` VALUES ('4','31','LEC900','3','Male','2026-11-12 04:00:49');

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

INSERT INTO `notifications` VALUES ('1','11','warning','Low attendance: DIT101','Your attendance in DIT101 Computer Applications is 28.6% (2 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:00:46');
INSERT INTO `notifications` VALUES ('2','9','warning','Low attendance: DIT101','Your attendance in DIT101 Computer Applications is 42.9% (3 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:00:46');
INSERT INTO `notifications` VALUES ('3','13','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:00:46');
INSERT INTO `notifications` VALUES ('4','11','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 57.1% (4 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:00:46');
INSERT INTO `notifications` VALUES ('5','10','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:00:46');
INSERT INTO `notifications` VALUES ('6','9','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:00:46');
INSERT INTO `notifications` VALUES ('7','14','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:00:46');
INSERT INTO `notifications` VALUES ('8','11','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 57.1% (4 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:00:46');
INSERT INTO `notifications` VALUES ('9','10','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:00:46');
INSERT INTO `notifications` VALUES ('10','9','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:00:46');
INSERT INTO `notifications` VALUES ('11','11','warning','Low attendance: DIT104','Your attendance in DIT104 Programming in Java is 50.0% (4 of 8 sessions). The minimum required is 75%.','0','2026-11-12 04:00:46');
INSERT INTO `notifications` VALUES ('12','19','warning','Low attendance: CIT101','Your attendance in CIT101 Computer Fundamentals is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:00:46');
INSERT INTO `notifications` VALUES ('13','19','warning','Low attendance: CIT102','Your attendance in CIT102 Networking Basics is 14.3% (1 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:00:46');
INSERT INTO `notifications` VALUES ('14','17','warning','Low attendance: CIT102','Your attendance in CIT102 Networking Basics is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:00:46');
INSERT INTO `notifications` VALUES ('15','16','warning','Low attendance: CIT102','Your attendance in CIT102 Networking Basics is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:00:46');
INSERT INTO `notifications` VALUES ('16','25','warning','Low attendance: DBM101','Your attendance in DBM101 Principles of Management is 42.9% (3 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:00:46');
INSERT INTO `notifications` VALUES ('17','22','warning','Low attendance: DBM101','Your attendance in DBM101 Principles of Management is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:00:46');
INSERT INTO `notifications` VALUES ('18','29','warning','Low attendance: DEE101','Your attendance in DEE101 Electrical Principles is 0.0% (0 of 1 sessions). The minimum required is 75%.','0','2026-11-12 04:00:50');
INSERT INTO `notifications` VALUES ('19','27','info','Welcome','Welcome to DEE101','0','2026-11-12 04:00:51');
INSERT INTO `notifications` VALUES ('20','29','info','Welcome','Welcome to DEE101','0','2026-11-12 04:00:51');
INSERT INTO `notifications` VALUES ('21','30','info','Welcome','Welcome to DEE101','0','2026-11-12 04:00:51');

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `setting_key` varchar(50) NOT NULL,
  `setting_value` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `settings` VALUES ('biometric_driver','simulated','2026-11-12 04:00:44');
INSERT INTO `settings` VALUES ('bridge_url','http://127.0.0.1:8765','2026-11-12 04:00:44');
INSERT INTO `settings` VALUES ('consent_version','1.0','2026-11-12 04:00:44');
INSERT INTO `settings` VALUES ('institution_name','Demo Technical Training Institute','2026-11-12 04:00:44');
INSERT INTO `settings` VALUES ('late_grace_minutes','15','2026-11-12 04:00:51');
INSERT INTO `settings` VALUES ('match_threshold','80','2026-11-12 04:00:44');
INSERT INTO `settings` VALUES ('min_attendance_percent','75','2026-11-12 04:00:51');
INSERT INTO `settings` VALUES ('min_quality','50','2026-11-12 04:00:44');

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

INSERT INTO `students` VALUES ('1','5','DIT/001/2025','1','Male',NULL,'active','2026-11-12 04:00:44');
INSERT INTO `students` VALUES ('2','6','DIT/002/2025','1','Female',NULL,'active','2026-11-12 04:00:44');
INSERT INTO `students` VALUES ('3','7','DIT/003/2025','1','Male',NULL,'active','2026-11-12 04:00:44');
INSERT INTO `students` VALUES ('4','8','DIT/004/2025','1','Female',NULL,'active','2026-11-12 04:00:44');
INSERT INTO `students` VALUES ('5','9','DIT/005/2025','1','Male',NULL,'active','2026-11-12 04:00:44');
INSERT INTO `students` VALUES ('6','10','DIT/006/2025','1','Female',NULL,'active','2026-11-12 04:00:45');
INSERT INTO `students` VALUES ('7','11','DIT/007/2025','1','Male',NULL,'active','2026-11-12 04:00:45');
INSERT INTO `students` VALUES ('8','12','DIT/008/2025','1','Female',NULL,'active','2026-11-12 04:00:45');
INSERT INTO `students` VALUES ('9','13','DIT/009/2025','1','Male',NULL,'active','2026-11-12 04:00:45');
INSERT INTO `students` VALUES ('10','14','DIT/010/2025','1','Female',NULL,'active','2026-11-12 04:00:45');
INSERT INTO `students` VALUES ('11','15','CIT/001/2026','2','Male',NULL,'active','2026-11-12 04:00:45');
INSERT INTO `students` VALUES ('12','16','CIT/002/2026','2','Female',NULL,'active','2026-11-12 04:00:45');
INSERT INTO `students` VALUES ('13','17','CIT/003/2026','2','Male',NULL,'active','2026-11-12 04:00:45');
INSERT INTO `students` VALUES ('14','18','CIT/004/2026','2','Female',NULL,'active','2026-11-12 04:00:45');
INSERT INTO `students` VALUES ('15','19','CIT/005/2026','2','Male',NULL,'active','2026-11-12 04:00:45');
INSERT INTO `students` VALUES ('16','20','CIT/006/2026','2','Female',NULL,'active','2026-11-12 04:00:45');
INSERT INTO `students` VALUES ('17','21','DBM/001/2025','3','Male',NULL,'active','2026-11-12 04:00:45');
INSERT INTO `students` VALUES ('18','22','DBM/002/2025','3','Female',NULL,'active','2026-11-12 04:00:45');
INSERT INTO `students` VALUES ('19','23','DBM/003/2025','3','Male',NULL,'active','2026-11-12 04:00:45');
INSERT INTO `students` VALUES ('20','24','DBM/004/2025','3','Female',NULL,'active','2026-11-12 04:00:45');
INSERT INTO `students` VALUES ('21','25','DBM/005/2025','3','Male',NULL,'active','2026-11-12 04:00:45');
INSERT INTO `students` VALUES ('22','26','DBM/006/2025','3','Female',NULL,'active','2026-11-12 04:00:45');
INSERT INTO `students` VALUES ('23','27','DEE/001/2026','4','Female',NULL,'active','2026-11-12 04:00:48');
INSERT INTO `students` VALUES ('24','29','DEE/002/2026','4','Male',NULL,'active','2026-11-12 04:00:49');
INSERT INTO `students` VALUES ('25','30','DEE/003/2026','4','Female',NULL,'active','2026-11-12 04:00:49');

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

INSERT INTO `unit_assignments` VALUES ('1','1','1','1','2026/2027','1','2026-11-12 04:00:45');
INSERT INTO `unit_assignments` VALUES ('2','2','1','1','2026/2027','1','2026-11-12 04:00:45');
INSERT INTO `unit_assignments` VALUES ('3','3','1','2','2026/2027','1','2026-11-12 04:00:45');
INSERT INTO `unit_assignments` VALUES ('4','4','1','2','2026/2027','1','2026-11-12 04:00:45');
INSERT INTO `unit_assignments` VALUES ('5','5','2','2','2026/2027','1','2026-11-12 04:00:45');
INSERT INTO `unit_assignments` VALUES ('6','6','2','1','2026/2027','1','2026-11-12 04:00:45');
INSERT INTO `unit_assignments` VALUES ('7','7','3','3','2026/2027','1','2026-11-12 04:00:45');
INSERT INTO `unit_assignments` VALUES ('8','8','3','3','2026/2027','1','2026-11-12 04:00:45');
INSERT INTO `unit_assignments` VALUES ('9','9','4','4','2026/2027','1','2026-11-12 04:00:49');

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

INSERT INTO `units` VALUES ('1','1','DIT101','Computer Applications','2026-11-12 04:00:44');
INSERT INTO `units` VALUES ('2','1','DIT102','Web Design and Development','2026-11-12 04:00:44');
INSERT INTO `units` VALUES ('3','1','DIT103','Database Systems','2026-11-12 04:00:44');
INSERT INTO `units` VALUES ('4','1','DIT104','Programming in Java','2026-11-12 04:00:44');
INSERT INTO `units` VALUES ('5','2','CIT101','Computer Fundamentals','2026-11-12 04:00:44');
INSERT INTO `units` VALUES ('6','2','CIT102','Networking Basics','2026-11-12 04:00:44');
INSERT INTO `units` VALUES ('7','3','DBM101','Principles of Management','2026-11-12 04:00:44');
INSERT INTO `units` VALUES ('8','3','DBM102','Business Communication','2026-11-12 04:00:44');
INSERT INTO `units` VALUES ('9','4','DEE101','Electrical Principles','2026-11-12 04:00:48');

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

INSERT INTO `users` VALUES ('1','admin','admin','admin@example.ac.ke',NULL,'System Administrator','$2y$10$7IwxKhp8qvKcQoY4z/zq5.tOnwIQpOijU7BctrT6sY.ZGjlLzOXz2','1','0','1',NULL,'2026-11-12 04:00:46','2026-11-12 04:00:44','2026-11-12 04:00:46');
INSERT INTO `users` VALUES ('2','lecturer','LEC001','lec001@example.ac.ke','0700000010','Grace Wanjiru','$2y$10$Z/D2tYbuDUCTdkrPXOiYHOQT3NeBlSf6YXFUtENNBysO.fFrRttua','1','0','0',NULL,'2026-11-12 04:00:47','2026-11-12 04:00:44','2026-11-12 04:00:47');
INSERT INTO `users` VALUES ('3','lecturer','LEC002','lec002@example.ac.ke','0700000011','Peter Otieno','$2y$10$Z/D2tYbuDUCTdkrPXOiYHOQT3NeBlSf6YXFUtENNBysO.fFrRttua','1','0','0',NULL,NULL,'2026-11-12 04:00:44','2026-11-12 04:00:44');
INSERT INTO `users` VALUES ('4','lecturer','LEC003','lec003@example.ac.ke','0700000012','Mary Achieng','$2y$10$Z/D2tYbuDUCTdkrPXOiYHOQT3NeBlSf6YXFUtENNBysO.fFrRttua','1','0','0',NULL,NULL,'2026-11-12 04:00:44','2026-11-12 04:00:47');
INSERT INTO `users` VALUES ('5','student','DIT/001/2025','brian.kamau@student.example.ac.ke','0711100000','Brian Kamau','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,'2026-11-12 04:00:47','2026-11-12 04:00:44','2026-11-12 04:00:47');
INSERT INTO `users` VALUES ('6','student','DIT/002/2025','faith.njeri@student.example.ac.ke','0711100001','Faith Njeri','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:44','2026-11-12 04:00:44');
INSERT INTO `users` VALUES ('7','student','DIT/003/2025','kevin.mutua@student.example.ac.ke','0711100002','Kevin Mutua','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:44','2026-11-12 04:00:44');
INSERT INTO `users` VALUES ('8','student','DIT/004/2025','mercy.chebet@student.example.ac.ke','0711100003','Mercy Chebet','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:44','2026-11-12 04:00:44');
INSERT INTO `users` VALUES ('9','student','DIT/005/2025','dennis.omondi@student.example.ac.ke','0711100004','Dennis Omondi','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:44','2026-11-12 04:00:44');
INSERT INTO `users` VALUES ('10','student','DIT/006/2025','joy.wambui@student.example.ac.ke','0711100005','Joy Wambui','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:44','2026-11-12 04:00:44');
INSERT INTO `users` VALUES ('11','student','DIT/007/2025','collins.kiprop@student.example.ac.ke','0711100006','Collins Kiprop','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:45','2026-11-12 04:00:45');
INSERT INTO `users` VALUES ('12','student','DIT/008/2025','sharon.atieno@student.example.ac.ke','0711100007','Sharon Atieno','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:45','2026-11-12 04:00:45');
INSERT INTO `users` VALUES ('13','student','DIT/009/2025','victor.mwangi@student.example.ac.ke','0711100008','Victor Mwangi','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:45','2026-11-12 04:00:45');
INSERT INTO `users` VALUES ('14','student','DIT/010/2025','esther.jepkosgei@student.example.ac.ke','0711100009','Esther Jepkosgei','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:45','2026-11-12 04:00:45');
INSERT INTO `users` VALUES ('15','student','CIT/001/2026','ian.barasa@student.example.ac.ke','0711100010','Ian Barasa','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:45','2026-11-12 04:00:45');
INSERT INTO `users` VALUES ('16','student','CIT/002/2026','diana.nyambura@student.example.ac.ke','0711100011','Diana Nyambura','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:45','2026-11-12 04:00:45');
INSERT INTO `users` VALUES ('17','student','CIT/003/2026','moses.kibet@student.example.ac.ke','0711100012','Moses Kibet','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:45','2026-11-12 04:00:45');
INSERT INTO `users` VALUES ('18','student','CIT/004/2026','ruth.akinyi@student.example.ac.ke','0711100013','Ruth Akinyi','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:45','2026-11-12 04:00:45');
INSERT INTO `users` VALUES ('19','student','CIT/005/2026','allan.mutiso@student.example.ac.ke','0711100014','Allan Mutiso','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:45','2026-11-12 04:00:45');
INSERT INTO `users` VALUES ('20','student','CIT/006/2026','naomi.wairimu@student.example.ac.ke','0711100015','Naomi Wairimu','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:45','2026-11-12 04:00:45');
INSERT INTO `users` VALUES ('21','student','DBM/001/2025','felix.ochieng@student.example.ac.ke','0711100016','Felix Ochieng','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:45','2026-11-12 04:00:45');
INSERT INTO `users` VALUES ('22','student','DBM/002/2025','purity.jeptoo@student.example.ac.ke','0711100017','Purity Jeptoo','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:45','2026-11-12 04:00:45');
INSERT INTO `users` VALUES ('23','student','DBM/003/2025','samuel.karanja@student.example.ac.ke','0711100018','Samuel Karanja','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:45','2026-11-12 04:00:45');
INSERT INTO `users` VALUES ('24','student','DBM/004/2025','linet.auma@student.example.ac.ke','0711100019','Linet Auma','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:45','2026-11-12 04:00:45');
INSERT INTO `users` VALUES ('25','student','DBM/005/2025','eric.rotich@student.example.ac.ke','0711100020','Eric Rotich','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:45','2026-11-12 04:00:45');
INSERT INTO `users` VALUES ('26','student','DBM/006/2025','agnes.moraa@student.example.ac.ke','0711100021','Agnes Moraa','$2y$10$8HHSP6ihgyxCQF11LhXEsumQAK0RZybF7ZE81pm32SrvQqqPFE6E6','1','0','0',NULL,NULL,'2026-11-12 04:00:45','2026-11-12 04:00:45');
INSERT INTO `users` VALUES ('27','student','DEE/001/2026','tso@example.com','0712000001','Test Student One','$2y$10$W2ZAGrFSKHtvhPMkg25t.ume6WkDlbgGDFK7WDoKXe.SLNeXLe7dq','1','0','0',NULL,'2026-11-12 04:00:48','2026-11-12 04:00:48','2026-11-12 04:00:48');
INSERT INTO `users` VALUES ('29','student','DEE/002/2026',NULL,'0712000002','Csv Student Two','$2y$10$gyvd07DD30VzO8nSFalmr.wATLtPks/AieYr4bkb9gUuHuQJ.aqxu','1','1','0',NULL,NULL,'2026-11-12 04:00:49','2026-11-12 04:00:49');
INSERT INTO `users` VALUES ('30','student','DEE/003/2026',NULL,NULL,'Csv Student Three','$2y$10$yG2aUXzJ7y6e6/4X.UCbMuE0J0e6t9w.GTidK8jidRoqrEMFsxiWe','1','1','0',NULL,NULL,'2026-11-12 04:00:49','2026-11-12 04:00:49');
INSERT INTO `users` VALUES ('31','lecturer','LEC900','lec900@example.com','0712000900','Test Lecturer','$2y$10$kzTfUrkNbZmBqscaV2KAz.8bPK/ORCQb9hbiEnHlPNCkW2MYAudqC','1','0','0',NULL,'2026-11-12 04:00:50','2026-11-12 04:00:49','2026-11-12 04:00:50');

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
