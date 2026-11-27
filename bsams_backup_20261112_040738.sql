-- BSAMS database backup
-- Created: 2026-11-12 04:07:38

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
INSERT INTO `attendance_records` VALUES ('459','60','23','late','simulated','95.98',NULL,'31','2026-11-12 04:07:37');
INSERT INTO `attendance_records` VALUES ('462','60','25','present','manual',NULL,'Fingerprint not yet enrolled; ID card checked','31','2026-11-12 04:07:37');
INSERT INTO `attendance_records` VALUES ('463','60','24','absent','auto',NULL,NULL,NULL,'2026-11-12 04:07:37');

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

INSERT INTO `audit_logs` VALUES ('1','1','login_success','user','1',NULL,'::1','','2026-11-12 04:07:33');
INSERT INTO `audit_logs` VALUES ('2','1','login_failed','user','1','Attempt 1 of 5','::1','','2026-11-12 04:07:33');
INSERT INTO `audit_logs` VALUES ('3',NULL,'login_failed','user',NULL,'Unknown login: \' OR \'1\'=\'1\' --','::1','','2026-11-12 04:07:33');
INSERT INTO `audit_logs` VALUES ('4','4','login_failed','user','4','Attempt 1 of 5','::1','','2026-11-12 04:07:33');
INSERT INTO `audit_logs` VALUES ('5','4','login_failed','user','4','Attempt 2 of 5','::1','','2026-11-12 04:07:34');
INSERT INTO `audit_logs` VALUES ('6','4','login_failed','user','4','Attempt 3 of 5','::1','','2026-11-12 04:07:34');
INSERT INTO `audit_logs` VALUES ('7','4','login_failed','user','4','Attempt 4 of 5','::1','','2026-11-12 04:07:34');
INSERT INTO `audit_logs` VALUES ('8','4','account_locked','user','4','Locked after 5 failed attempts','::1','','2026-11-12 04:07:34');
INSERT INTO `audit_logs` VALUES ('9','4','login_locked','user','4',NULL,'::1','','2026-11-12 04:07:34');
INSERT INTO `audit_logs` VALUES ('10',NULL,'csrf_rejected',NULL,NULL,'Path: /bsams/login.php','::1','','2026-11-12 04:07:34');
INSERT INTO `audit_logs` VALUES ('11','1','csrf_rejected',NULL,NULL,'Path: /bsams/admin/departments.php','::1','','2026-11-12 04:07:34');
INSERT INTO `audit_logs` VALUES ('12','2','login_success','user','2',NULL,'::1','','2026-11-12 04:07:34');
INSERT INTO `audit_logs` VALUES ('13','5','login_success','user','5',NULL,'::1','','2026-11-12 04:07:34');
INSERT INTO `audit_logs` VALUES ('14','2','access_denied',NULL,NULL,'Role lecturer tried /bsams/admin/students.php','::1','','2026-11-12 04:07:34');
INSERT INTO `audit_logs` VALUES ('15','5','access_denied',NULL,NULL,'Role student tried /bsams/lecturer/sessions.php','::1','','2026-11-12 04:07:34');
INSERT INTO `audit_logs` VALUES ('16','5','access_denied',NULL,NULL,'Role student tried /bsams/admin/settings.php','::1','','2026-11-12 04:07:34');
INSERT INTO `audit_logs` VALUES ('17','1','department_created','department','3','ENG','::1','','2026-11-12 04:07:34');
INSERT INTO `audit_logs` VALUES ('18','1','department_created','department','5','XSS','::1','','2026-11-12 04:07:34');
INSERT INTO `audit_logs` VALUES ('19','1','course_created','course','4','DEE','::1','','2026-11-12 04:07:35');
INSERT INTO `audit_logs` VALUES ('20','1','class_created','class','4','DEE-2026-JAN','::1','','2026-11-12 04:07:35');
INSERT INTO `audit_logs` VALUES ('21','1','unit_created','unit','9','DEE101','::1','','2026-11-12 04:07:35');
INSERT INTO `audit_logs` VALUES ('22','1','student_created','student','23','DEE/001/2026','::1','','2026-11-12 04:07:35');
INSERT INTO `audit_logs` VALUES ('23','27','login_success','user','27',NULL,'::1','','2026-11-12 04:07:35');
INSERT INTO `audit_logs` VALUES ('24','27','password_changed','user','27',NULL,'::1','','2026-11-12 04:07:35');
INSERT INTO `audit_logs` VALUES ('25','1','student_created','student','24','DEE/002/2026','::1','','2026-11-12 04:07:35');
INSERT INTO `audit_logs` VALUES ('26','1','student_created','student','25','DEE/003/2026','::1','','2026-11-12 04:07:35');
INSERT INTO `audit_logs` VALUES ('27','1','students_imported','student',NULL,'2 imported, 1 failed','::1','','2026-11-12 04:07:35');
INSERT INTO `audit_logs` VALUES ('28','1','lecturer_created','lecturer','4','LEC900','::1','','2026-11-12 04:07:36');
INSERT INTO `audit_logs` VALUES ('29','1','allocation_created','unit_assignment','9','3 students registered','::1','','2026-11-12 04:07:36');
INSERT INTO `audit_logs` VALUES ('30','1','consent_recorded','student','23',NULL,'::1','','2026-11-12 04:07:36');
INSERT INTO `audit_logs` VALUES ('31','1','consent_recorded','student','24',NULL,'::1','','2026-11-12 04:07:36');
INSERT INTO `audit_logs` VALUES ('32','1','fingerprint_enrolled','student','23','Right index (simulated, quality 63)','::1','','2026-11-12 04:07:36');
INSERT INTO `audit_logs` VALUES ('33','1','fingerprint_enrolled','student','23','Left index (simulated, quality 65)','::1','','2026-11-12 04:07:36');
INSERT INTO `audit_logs` VALUES ('34','1','enrol_duplicate_rejected','student','24','Matched template of DEE/001/2026','::1','','2026-11-12 04:07:36');
INSERT INTO `audit_logs` VALUES ('35','1','fingerprint_enrolled','student','24','Right index (simulated, quality 69)','::1','','2026-11-12 04:07:36');
INSERT INTO `audit_logs` VALUES ('36','2','access_denied',NULL,NULL,'Role lecturer tried /bsams/api/enroll.php','::1','','2026-11-12 04:07:36');
INSERT INTO `audit_logs` VALUES ('37','31','login_success','user','31',NULL,'::1','','2026-11-12 04:07:36');
INSERT INTO `audit_logs` VALUES ('38','31','session_created','class_session','60',NULL,'::1','','2026-11-12 04:07:36');
INSERT INTO `audit_logs` VALUES ('39','31','session_opened','class_session','60',NULL,'::1','','2026-11-12 04:07:36');
INSERT INTO `audit_logs` VALUES ('40','31','scan_rejected','class_session','60','Best score 0.00 below threshold 80 (3 candidates)','::1','','2026-11-12 04:07:37');
INSERT INTO `audit_logs` VALUES ('41','31','scan_rejected','class_session','60','Best score 5.07 below threshold 80 (3 candidates)','::1','','2026-11-12 04:07:37');
INSERT INTO `audit_logs` VALUES ('42','31','scan_rejected','class_session','60','Best score 8.82 below threshold 80 (3 candidates)','::1','','2026-11-12 04:07:37');
INSERT INTO `audit_logs` VALUES ('43','2','access_denied','class_session','60','Scan for another lecturer\'s session','::1','','2026-11-12 04:07:37');
INSERT INTO `audit_logs` VALUES ('44','31','attendance_manual','class_session','60','Student #25 set to present: Fingerprint not yet enrolled; ID card checked','::1','','2026-11-12 04:07:37');
INSERT INTO `audit_logs` VALUES ('45','31','session_closed','class_session','60','1 student(s) marked absent automatically','::1','','2026-11-12 04:07:37');
INSERT INTO `audit_logs` VALUES ('46','1','report_exported','report',NULL,'unit: Unit attendance summary – DEE101 Electrical Principles (DEE-2026-JAN, 2026/2027 T1)','::1','','2026-11-12 04:07:37');
INSERT INTO `audit_logs` VALUES ('47','2','report_exported','report',NULL,'below: Students below the minimum attendance of 75%','::1','','2026-11-12 04:07:37');
INSERT INTO `audit_logs` VALUES ('48','1','announcement_sent','notification',NULL,'class:4: Welcome (3 recipients)','::1','','2026-11-12 04:07:38');
INSERT INTO `audit_logs` VALUES ('49','1','settings_updated','settings',NULL,'{\"institution_name\":\"Demo Technical Training Institute\",\"min_attendance_percent\":\"80\",\"late_grace_minutes\":\"10\",\"biometric_driver\":\"simulated\",\"match_threshold\":\"80\",\"min_quality\":\"50\",\"bridge_url\":\"http:\\/\\/127.0.0.1:8765\",\"consent_version\":\"1.0\"}','::1','','2026-11-12 04:07:38');

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

INSERT INTO `biometric_consents` VALUES ('1','1','1.0','2026-11-12 04:07:32','1',NULL);
INSERT INTO `biometric_consents` VALUES ('2','2','1.0','2026-11-12 04:07:32','1',NULL);
INSERT INTO `biometric_consents` VALUES ('3','3','1.0','2026-11-12 04:07:32','1',NULL);
INSERT INTO `biometric_consents` VALUES ('4','4','1.0','2026-11-12 04:07:32','1',NULL);
INSERT INTO `biometric_consents` VALUES ('5','5','1.0','2026-11-12 04:07:32','1',NULL);
INSERT INTO `biometric_consents` VALUES ('6','6','1.0','2026-11-12 04:07:32','1',NULL);
INSERT INTO `biometric_consents` VALUES ('7','7','1.0','2026-11-12 04:07:32','1',NULL);
INSERT INTO `biometric_consents` VALUES ('8','8','1.0','2026-11-12 04:07:32','1',NULL);
INSERT INTO `biometric_consents` VALUES ('9','11','1.0','2026-11-12 04:07:32','1',NULL);
INSERT INTO `biometric_consents` VALUES ('10','12','1.0','2026-11-12 04:07:32','1',NULL);
INSERT INTO `biometric_consents` VALUES ('11','13','1.0','2026-11-12 04:07:32','1',NULL);
INSERT INTO `biometric_consents` VALUES ('12','14','1.0','2026-11-12 04:07:32','1',NULL);
INSERT INTO `biometric_consents` VALUES ('13','17','1.0','2026-11-12 04:07:32','1',NULL);
INSERT INTO `biometric_consents` VALUES ('14','18','1.0','2026-11-12 04:07:32','1',NULL);
INSERT INTO `biometric_consents` VALUES ('15','19','1.0','2026-11-12 04:07:32','1',NULL);
INSERT INTO `biometric_consents` VALUES ('16','20','1.0','2026-11-12 04:07:32','1',NULL);
INSERT INTO `biometric_consents` VALUES ('17','23','1.0','2026-11-12 04:07:36','1',NULL);
INSERT INTO `biometric_consents` VALUES ('18','24','1.0','2026-11-12 04:07:36','1',NULL);

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

INSERT INTO `biometric_templates` VALUES ('1','1','R_INDEX','simulated',0x4cb7f3cf34dcd88a5a177831d220097347ca954124e6629f8b381bcbeb829cb108c7438132b57cf86cb681c65faaaa385e371dd0610c1d616d22d08d507a4cb45d7abe0b15042e89f8972220ae95951ce5404e65ff3b4253fe13b76abbdc49b34e02e1d17b41c1d5ebf8dcb4bf88a86d0086fd0df8bf230ab924dc5970c906549b11dea3913fb552e7c400e6d8ddfffe3381062c3101adcf5641811625f7da47331952605adaad29096fb910f0d0045597c71394c68ab5c69fff373eae35292cf6d78d1a98ca0452b2c3bedd36c315b2f706850a2ca15d803d658ec512407ca338543c8332a9dc2c8db4161ceb2666220184fa4f9039d298ddc39a0102c502843833afe64e05e969054a09b20286db56eaeec511548a8192942b174fa478d0cd9abf1c1060cb9655c6b320d7c5c447c5c84502a462ac0ba6c40ae211a5d566e489d9619e372698c5f387b30b31245c30cc6b46a71f9426ae67cf63de31183a10872b3d39eb05ea6cd3e38fee836dacb63971faaf85abd29c70afa1a7a7138c0425abfdd80ad3060273d6f401a64bae361e7d8b57b57578de1b47c610c12aa18f63e2cb4cf0e11dd99acbe0fd1c161a3d6ab66b8653c9dccc6a2ec59a330671f28849da2d3a35113b3435ce9b72ebddd49f6128f552abf39985c2a42d388de0773d71a7ce755e210ad0a1805125cd043052e4d8434b,0x5bdb792a7b06b59405e3a56a,0xf68f4bdab5c1384dd07de2d94de17296,'a2b288eb896b832c706311509c504eb2a86a9413a8565565c444c81902ccd4bf','63','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('2','1','L_INDEX','simulated',0x48d5b4f77ce85aec9197d45ccc1c77665d2724b54cba665d54baf6b37c970eec07fb99f9aced5b5f155feaad9d65f434122d2cd9ee2ff3f516dd93c599abd9fb74b5685390981eba4e17a2c0435cd1d98e17c93561fdc74f5d2c8c431001cfe5c45dbcb53b9d56ab532df3be5fa27f7bd14a20111b728516f85ce92620b46fd81479993e40218f1270b73ca575f101de13b82db3f3db2c75c9eccb2cfbadeba684f95f3f65e31020326fde24d7db2d54cbb32ba07b219933edbee8917571494fc5ef621ef97de616a25e4084b2625a735836cdcbd3bd02da82e0e6ab0b3ea5527ec258ab12fe72e77972c42db61f64143f37f90f263a7e8442c40b6d04ec3920ab09730a2315c4f780419052c010ce63b22ff2e53ed7ffcbd7d38bfc8fbe9fa2f6ddac374a63abd8421d3a30d5634479f7c3962903075fd8074bbd0470d224c578bef1d83eb0c1897a62e27f2b953a7091521593c3d3bc1c9aac8a5a580d9a408453eef069d8f966b5fb44b62390e4b3a4f8f5ad893ee1ec601bdcc616f65dc3f09c52ca87d8755f943eab6a7c561832baf25d12e4ec164dfaf2d9129c83ce945b24abfbd6c60e063782b6c35afabb846709ae81dfa0c6576ac7780a0b44b0f42acfbf9a8d672978e90553ebf094c92c2c45ab05632f6cd025536da596b1e48807c3888b54571ac444be8e5458e7a9151c0cdebd,0xf9f4849c055fe820d3a2cdb0,0xf3a85dfce4da0d248a07c3b805dafc01,'e2e46f108bb4c085bd9e5410d4ced6b8c59bf590e59339d5d1405fea5a4e054e','68','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('3','2','R_INDEX','simulated',0x0a2de053accee800887bf3e4002ccca7643bfbe8341bf61ba037a14b362652b128fdf7eecca664fc0e82f0f1d1debf8ad34595fa8bd6053155856f8fa38e975bace3a78ec8e8db3fa97b0147c98c0ef43473d1184a71c309b4b08ebea458d3a26426a99c9246f0dd1fcc6d1674327c7569d25ab5311140e721f8c3d66d22bee4c0d14c61ece96c7b66d20b9cfdcafb6b00071685d079cc2cd4790c8756f11572491a2e484bb4ca89de8e7ae71d8c83b2dedbe44835b7ffcb9705df4e6f3ec2d43015519471cf9c6a0898a4b1e6025f54e1e2bb8afc07ce7fa6628563532787a4fa3fa375453527f2148afe2f3163e25109a9394cc690c719507d4aa1d5519d31a5ab2559f146d4ca28cb5f4e039d3a3d332bb1b39772ce76e2a76498863de6a794d9e40d2b1eb63fea2818433fbe43ec84c6bbcfbfe889f676ae0d1d91da8be0af45bb5ddcb1d3f2d7b62482e9a8199b4e3d73175777695e845aa2b4c0cf654a2eb56f18170bcf9b6fc3b449b1c92cd811e7d9aef47bf1797233eba1d668230c193996fb5627cb348cedcc351194fffc0c3d46793cc22b9ce766ce5c7857d8e7815c6bf8e1803d8340c3b5b7f9085cbc13f8f64da1cde83d06737c9a415e8c1937ee666c16000946a115bd22f7045b1fe371b7ac27c252172414d4cffea388283aa6a1f01a3d614f122c8fd452888e44a6b6a0305a6b76b0,0x4d92873218648d870cf6639f,0x03277d617b2016a98e791f35ba756b2c,'c59e0c23f6fd70acd5c35d6fb348b100552718a601c9f1e002d3cd14a0ba0302','90','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('4','2','L_INDEX','simulated',0x5c7d93ccc542aa85db0ac6aa313ea7fbe568470f913d33af4ea58018adfc72613a0017487263be3bada1ebc8035f26b4400918e1ccf27343d7a30d48e31d7f7ca0c755ae91757065b2fb8a4e0327c9f970d9b9346f852dffd01641c3cad2f00be2713233543cc4d146cb05fb18db8e53bcfd5fd247eb33108a4fe427dc7eb6ab7374da995039bd77e140aa527cf88fe14d98a7241b33dfefa0835cbc40218c784504d3d71e4fb3d17084716db43372b8d1203393c2c6fda8dad4261752b903b4b675036a47661c5c6eeaebb68814ceef8ff1d479dccb6b544eb0ceaadaf431f55813d2a744db84c4f956c01d67f188725fa526c0b38316315b74d78bf2cf5c866b10b4a777d006ce67f7da747392aaea81bba54202b6988b365723b669f43ddd6ca783fd845b60b344a37215d5c5be5b496e7e0dfde3debdeb27af9dfa11806cc05e688ec8beef51c2ecfe3610c461905b52d4b250519997c46d852bd9125e18168539a735cc73fc349898c515515b4785d3ac067d5283d73f25c84e7732595517c295bca03133b40d29d4551c6469bcd155d1b2be327cce56612f68450b6d11e6c1152d242031ac4857f1e71be43b956dabc429e7c99961544fd45f57acdecbd9c3de70e40c8fe903d7e359b27d80db31beeabfa42ede651188e3c3fdbde3bffa0729fa706554876c6783153d0a341e5c1300a07f5f7d037bf9,0x3712026f1effbbb4cf9677f6,0x973457a72f94f71bcd594f89f2a89457,'0a752b94f403045e158e04166fc9c92b5ae67ecb0046eeb8f1a11ca460e6e732','94','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('5','3','R_INDEX','simulated',0xc06060421a2eaa0a96feb4ee89a45f1c97bbd9e5604058b26ea796b334898f41133ce2ae2a2d0187603e3d730ab0d80d28df1fa7fb291e643028186145505577ec867a8417fdd724fb3abef1701acee316d559273b5fc0a64101a6b0dbdee6bb7a6afaebd86963dc930d61ade26d06c2beb413e68ad94e07d947bf2303d4f145c2809c715c9eb41fa60b8cf271e44e48c6cd66411f9823c6d7df833f48c07c894482e97b3834c547ecd3ff971651c27148e1d44da912c4c63551a1ad3b30f76a3c28cb6b7be01d7f2d3ab49345321705674f7ea255d1dc8d3b4b8979e05fb09b3c01e65bfab5dfab2aa959ea49eefb6cdd092bb9d8a044fae9f4e0f7238511ca30dfbe35eb4654701a5f0446134f96e2217ef36c547767dc569f9f4e1af53abee90d2e1f7922f3fd3b65fa92177ffab1680392535b1ba1349e04f289bcc14658a5ea67a40345ce95515d12b2df3ef07276fbefe5b99aeebd09feb005021053157da4e10a15e2683273cd50f4644a93ab045946b946c3079cbe22449562a75862bbe0ba577463b69e7a76ddb9525c343f98959b79f9b2b2102c778dba45d114a14c251f4f69d38ba69579397e619c283bf7d8e67e760d0ee45ab7f4bc3a5d2a104d9be41b504dd186502e5f7a39c0795baae9ed09615a506012b6036e86d5755d618f36415107f6a4f439aca06ba12a99cbf69a0d85a850a601164260,0x0d8d1ce03dfcb0b271b896c6,0x2b012f646f9203eeae476612a018c35d,'c9bfbfdd9b0c72068962ae60c2e94894d7bf998b2cd7549f62e4c776ae1b2056','66','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('6','3','L_INDEX','simulated',0xef5b9693a7fdc0210c67b9cd89ce21031c1fcb2204189d6b9931ec60b6fa035a7478ce68a9ca85c99f93dd06820950a51a6cf42394e4a285f2cc912fa3e5d252fb8b1a4e9f4a335f078559ef374c695758c3ede0c1b64d74090be8d9501d2566462d81b769b3aeabd4197842a4edda5eed60a6185f14dcbbd25fbccb6f3c8d122ce263a4274f34639424cbf70878117e967a4a8f906eef388a43aff497d362fa7a4ad54fd34eb45a793d26d361d9c6239a68312b72c162d15fcce86a3f8dec9f0bbe513a68b30d28e63734b51fe0b01d82ce30509e776b96231c6f70bc5047acb9a3d3b0479469c86059ca1b4ee9d3b9d5d0f64e0e73a24088ec89429f96cae5dfadac33ca540ba2162af70ba05e2dd8de8b719b083e8423762a95d3a02442c43f0d55cc50edd9d96e5a11045787c82ef9ab3d19063b69fd409df9903d2f680f18ca16f83b9a8b3ff1cf43526b2f3623464e7841b7ca376c69e2e0c4a34c5ce32a3101c2aeb77224b83cc1ad0c859df5b2108717fca95cc52bfd5f1839d783e5c07cb2d9469883f8e8402af93f33f7aefaf85c28c6370bf82f33eb204975764d73f23441c6e26eb79015abf7f6caad640ae004f3443b6accc8b13e0938534c3968249e68b31fa9a4fc05353754c3c2b1830b29a8998d465c4f62eba628dfd8eb17a6e8b6d22ebfa57e846d154d3a382c,0xc7ef017fa1ceb5bef41cca32,0xce02e065a9a342ffa44b04deff836868,'c083631d52321a651ba54986f83694c761622c66fceae73b30eeb3d7e3981ca9','78','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('7','4','R_INDEX','simulated',0x5ab13752117407546371c6cff9d5e6905abe5a67619266064fb09456d7b08ec802b3bfea04bc0eecf83514ef5021fa700b7bc9a953c092113a56b4333e22cc1ba78e968719820a976566047875d827ac332a792ae82e4c1deddcd13b9c09a0b8471f7c61745f921b792473e051e3b084d40fdd0989378a6019e31f8bab6b1edf7c1771021bd9177dd82c774b74a1c19631c62bb280a12395438cd12349483e92893c88332d5059e3827e6f93de4609357b107e7bb8f3bb80f72725a5d329f5a371a21d53550a0529d40d9b98fab90738430b7f7c17e257d61b5591c87386c99acab29ae67581e68bf2d9746f946ac01fd8e71ecc0876dcdf731e78850d870d4b04eb8aa43352aa3bce243fb8fe1a86f9daa64923ce30b52d744a2cb461fb672d62a9422256d06cffcc8c9cd97d3e5b0bb5328b78136a48e7eb9563d8f80f05be89e1735040f5ac8c2f79cdd897d3ec5ab086c1a8117d5bf44aca662522fc39e293bf1debe83f7d674c46ff6a09abdb5de250ed930081861e8889a96177c1f6c02af85461c52d3737cf1d908573949a50d3ff1798997d02f71406c4f7ce5978422bd53a29ae117892944e40aac5f463f19dcb1245935edb2c178a8d38d24a5b6026a1ac993db4f31d3be02410005fae3d5fac631c4078988a742cc06a12839b8cd6c64ebdb7a3ac368433742b96123a2668ea,0x804f65e5613fdd37f67177a0,0x6f3d5db7571d1d5088870430a946dbbe,'3394555821fd78172ceffda27057747280f2b9f98393883a4425da6f402c6267','90','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('8','4','L_INDEX','simulated',0xffff374da48d35e6773ece74038143f3bd16bcf825d008ce8f269ebb8bc0d70da66a031b126f19bddc12224311a8a03c77f1d65af6b4bc072ea6d2637068e8a5a3f2d36dcfa7d8654a4a254a93d80c08520b4dcdc4387b0bc6837b97d1c0ff3e75e8ac84890d3c31a3e482cc2f9c8f5bfd17d11e32f5e51a4bb31aac2c7337012e33dac73b0f11e8005ca42c5d44a698863de28ae8acd2b02498325a525deee62f6f2c2c5cc33bf3533ae4161538931611541ec42f2145739d207c6c2bcb8a229a10ba52216f864579d78addc8cee89dc98b1411650ac05f8185117e5711df5a603cf863c054f8cb5b5d5d55ee978977c17634a6ce6e824b156f99c4bd367f7f2d5c552b3e2e94871e9443e19138ece7147795ed0deeb20d72b242552ef54a1033fe73f756937e253c4e661fb9d5833a7e4944a7f42dd0381d860f493939c3125f51838171fbc412a8068e00d1675e80d823e522a862a5de5a248bc5f89ef74c4cbbfc576ded8fad07b2e45e513ac5ce3ebdfe6b32ec3829e324600b8b6acc39e844434e6aadf43635b6d1117b12bc585203cc40142127c8376f733ef3ab699a02cc5f0bcf1aef4386582c71ba0fa8191f0c466e21f2637f110f3a5a6c517b51027642dd199cfa544aef60df0fd8d0e03fd6544249571470d14575fa38a28fd6056b64f9c1001831a153c344ba8c63c315fc,0x849e1c9019d814b9ac402333,0xdba609ad0bcd963cbd8c4d7f84a02a9d,'a50e73674752afbc4ccc4f2e662dfde11ec73f6129572f90b80a9d0e12f907cc','63','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('9','5','R_INDEX','simulated',0xc1170e718b143f6c62705c6bdccdb03c66cfb1b2e014ae36b6bc3198198f5797505f163e55029e48584c42c7b627319254acb8b150d758c3cba7d1fb26365c8625b1d1a7d60b72b3b6a28e4130437a3c5111f43ab4502bba452429b5e5c56c43276317bbe89e8effa3ab3111c3da6b89151d19f6936458496bf46117ef2c710cd2861b2784ce471e9568c02f0d6ddbf9b5d478a926426ab2d88290076af0f2b827c248e1a8129930fea3dc0b7418ae2342b9894adca88f049ed94cb342e9f244f574742ae5e6b8fd0832b96f69c7e3992697b5b8a4291ab268e757466ea7d3bd0736818b19d50274914cdb58e9fa36d9cd98b80e2cb4a7f1d057126fea75deb51c2b2a7c73110cc4d6ae2d063cab09c3933d7ebe3d72a01921712f1556def3655e367e841b34b62d3be32e747cb2e196792a37dfda35f296e8bce5fc4e798c51620efc9e6e0ed90c14fbd4d7211433f9b07501f35aed0999f80171cbe8a56f3018c2bd7343cde5f996d3df9e883388e50a34b38ab378f128ce2682b8fc77cb1d73b796a5d25861269b9040f6417317c0c5a794ce94636ba1fe69540586929c3903c7a8482cc8388d9547a2b30e354502c07346bb68dea1a9a619c7c8e31ddd63b652ba8ce90fcfa93defd34fe0f578e1f39912f919bb40b3e3937aac1174060dbaa7e036ef24b90050746b753d9cc90f88140ab6fe,0xb66ac65bdc9478bd753d7ba2,0x553b409e91d63f9812576d67332e8ac1,'efd6d65f99b57cd47ab4acbcc6a30906e5771944fe585afc5e91672c6e2ff177','85','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('10','5','L_INDEX','simulated',0xcd9205e3387c351eee374ab2cb9a44b30e8a6263b87a80b5e82531b9224ecdeb131c143fdc921e8416ed6b0778868c1c00be687ff5c90380f0910b4f46b092bc5598f123f00cbb7e28bddbb74f6c2edc54616f902815f50e34469dd7ec2cb64a6e13fab1e8fa150fe1e2c2b35b243b8280db2ad1f6f426cca731f8211fec0b8b8472709c633ddea4d4d1ccbcbce50f06debca62efb427dec78504e14cb0267300c9790fa031b7f4e5e24be5988fa5d7c2fa1e21a2de488259f55f4002f2e0cb23300ac8ccb9a5431d272613a6231e78990d89888918c9120baeb06dc15bac056426d2ca662d4c58e06bb1d877efd30dda831c302225c96ac0ff7c226d239e62d6b6e355daaf225f5f596849bdcfbf3b2a3b9f79c25bb7bec9f1aba99be4061ea0a3bfd7b31b397dbc553f15d8509d1df2f394153b16687fdb75e7ec20881fe063b505245c550f233d3488a407dc27dd72079468227fdbc25217921a80074fa9649f81a0d73d0f55b7aa87d87d7a225391de6a2aa22578292eab9ec64418ba89cdbff40fbe731bafc35d9b6ee37fc69a4e1638914117cbb1404e910610324aa842a09015cad9c9fc8fe6462d28387f742c59274aaa6178c3640d83a228acbb2a01332e503167a8cdcb2a10b2a98a2d7125a8f2f1c5e32cece9050438ff07223725a88322db165a5fc08d949d390a8d0051e,0xb6994df67347f8a352708a2b,0xb10bc50b7039d334677c2298226df397,'ca307716610ff7e8d14559ba463a86d70999b1033fa25017b1525950ffbd8bf7','75','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('11','6','R_INDEX','simulated',0x72bfd27168edf5163aa8a6f2103c579ca179bcff0b9cf6fad60562e61b77a9ff2b38ae81ba51b62539b6baf89985ed7c79cfaeb3969f628be0798ed2c3e385aea48c522d46e46f24667fec07ffd1a3ee0633e84f0c57e5e72cb93e197b94e890f453304e110334c95b0284b46c6bad1c1408c809df701f36728da2b1dfff3087e203444a7aeaa1ff11675f5a60f5ee1e36baf02cb227a128ccbf08b475f2e82b57e709d937bb2df93ef28c273bfac8993009182aa610314159205e1d27448e16f7818def606559c4c79f30b2705fe45b14ba0a8ff2341d37912a25f010a9f0f8c42459457d98c0106b3b7afab3484054cb5e6e5a884c00ab9704b3d2573b49830d43483a6b14be5e4f2371747ac9af3f4f56193f550a1cc7eaf850358c5d979442436f0fbb14d77745476da523532e2fba9ee20cfd90bae00ed2a6cf79eb33f6846b399c3462b24d529b33f1757c510f41d243ebe8ecc482bf370c17504f4521193d809ae3ae48865cb2c043b59b1014613d44bef95fb61df9cc462286be6847af9b7a03c0f852446d2f1d61fdc4f958b930f658a74ab3f4bd0795d80407d05398d991e46ef8010e90c13699468719b43112c7d862cdc09883a0d79c5ec91fef4a3f1b0562570452d45db2d193e358eec6d99cc3cb6936ef10f4cb4da9f78b8f44799f0f005843f32de41d1210,0x4a154b5072d3860c07b09815,0xa7f1fccf82199c79821f3bd828f342ce,'8de7069df58dfb9824aac1e96ba41cc5eaee3cfa205cc419efd32646fd23bc74','90','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('12','6','L_INDEX','simulated',0x6ffd5f15218175f8b7f48c1b2467f58af5965b21fbc44612e3fe6d16c8ab43314e4a59aae461ba2c2e5d460b5e48255d8c9c3258eb2ad865b0ade526c3949b397e956dac95573a195647dc159ce404880d2b27ddc5f4ecfc22fb658853c58eb76f715bb49fd10dd45c0240e09b2f4cbfa847222dc7f143763bab5c3c003e403700b4634a73ccfb6b66b87644e301c09f7bd68e90862251157d25f19854c9425d4fd26a28d7fd76fc2707d3bb5d1edd6e1886ce83024cff0c57f73187690db13e40cd81f99091e348f0c33c738edc9b0b56574336910df368036dcb2eae553a138dc41f18c9366d98e555afd27f9ac985a65ea3e1226cf58dcea1e1247118715d31fd7811503fef63b2164a8e7c7a96cad887e10209f547b386c6e81a92d92f5acc44b4dad4297b9eaf1014b8c390270c6d50d60e03f096803f56180c332631fe9a1584033cf967796d4a3bff6f179abccc0e510cfc90d18fc37df8a17369dd5e11d1467ec5cd0d7bbb8d1b749062830fa953120c5f410cdd29ca293d63eabd16d2c647a70ea4638e530c40f66248da5fb9fb8a877dafc26c5a822c3ba731c70e4be0f1399914e0d10341b6e0ddbbce9e92b3eb48dc81b88e860e183c3660f798737122a48e5c4042c6cb9195d3dd240cff8f28aab33c58bffe4d92dfb92a9363d0dabe7eca164a48947c88738b0ee9f200d937,0x11201585f7fccdbf98c8f011,0xb7f140f6b5adeb7e138f05ed3efd6bde,'9bc4e918e8aeab19c6e88580dcb2123f75a998c9e0e3c2983e0467f3f39e2f5b','77','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('13','7','R_INDEX','simulated',0xac29f893df194922db63ef9575cfae9b6efdf53d986322d94c115e7263dcb2878425c24fa41ded5bf9f0b8891144be4aa82301b2b9fb48ce37c002190c74aa2f4b4ab3ff3b8f1896425b65c3dc01a61300a9ecc003d938eee2655e00a1b1bb2e29fd28ca28f4bf7259a113c181c9c56e88d05bbed8c9d7fda75bb5c3f3aba26e39ddca4199940dc608f3e5ffa1541a2fa8ed48c2971efc0533cf04ac181468ea0311a0f300340473986e316823c6061625268bd7c133bd62e441ef72974f1c86fc09add9d296b934100446b1a8620afae81d1a6f917584e6410c0b1537f84691e3211c17321baa88ffe345103d732eb16c21ae3ba6b5db023bf5a11af6b2019232e62b91748940774da364402feb9317e7877d3d0bd7748f8de32cc19730ccacb5e58425c0f6b363b67e8382ef5186c399b64a315ae7a1230cd74eadcf9a1c440fd109e2ff8175c180016e1d526407ffcf4a9153c35b631562af4c4d2e409efebef93b89f711120d83fbe9a72f7470df287662673c35babd5cba6e2d3c0db8a3f4d9cff130cd37478d64e0a6f9111f59501fa98df60d8475afeae18819ec4f0b3e66091913308171ffd022fdf56e19726f0b90e07c112c1ea8b2576e465ce182173efba97e1449bf82bf9ab670064d69169eea7bf5a6b62113b3a9f2dcc3b5cd7343802a7a731279f8b9283adf8a736164e40d67,0xd1312f33058d6175e6d3c842,0xfc59282e812720e3da69fb2ebb31bf91,'aac517702f1cb307be6a77e9e4f9618dd985bf1ac336f236ace9b9ff32662bb9','83','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('14','7','L_INDEX','simulated',0xae1bac70f2eefb517e2050e3c8a40eac958d77ca4a8f4db779ca0c393ab4bfeed9231db7eeb1e5f4c4cda995ee67d664a7ad2e4535c98499dcff33c7048e39cff2ea453eecd1e1e7c44345233d59fb5047b2754723698a9f5f850097b411bf4d12934a3866643e6139a21c35dda1e52f2d8a97d05b02ca051a4292e6c69079195a31f417568942f98aad01080ab0ed23e79d46ef88465c8bfd65d218a54f8b19a6712c76ebd2f2b72a796e8aa9b9be78e5630724a797275cfbfd35dc37abd3a875c15b54211b5635097a4e8b7da5f2486436e2fc313cf7cb457844a20f1cb810b6fc5172e8486868de640068906c9d3872e42a1e0b79e5d7e7ca083505195c54b546c3809681a100a2f0cb299dab961c50c239844d20b5cd0eaa765684f56ff03d869afebad3eaf67054e09e75bd2b23b42b180733e53a8f7ea918af0e7304fb412b038b7a645779417648bc693de921a0a41f3837f9502671f84da0a5bb61acc44624024b9cf55e063d84e875c7eead535864d68f4c38881437fed7e172b87e6bb1907d077e31ea75e08ec3a4d35e963575ce6db0f691b861affcf5b90bb1bcf164c4b724c3bb5085f9434162687a301babc2a362a6a164f0e794f34248f9b86046529080bad412646c406ca8b6cc9a3441de512e1e08ea4ec70f7b99f2e4f2e4292a5d60b513411d7f1018a00807183f1e1b3ccfee8d,0x1e8a2e6b85d610eb67be66d2,0x1e4928e2a653728543a7f3aa1fffaa02,'6400270641b5850c9f424a973da21fe606883ffd323d47784e59540af02b9296','96','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('15','8','R_INDEX','simulated',0xd2a785e46bdec368fe08cebe66dd060bb370fe695cbf994fff6f399128278721423d8fea2de7d1d67745a639d2296c0f7f52016ffbb9d38eed194a603c516c96d35cabecb9d0ced1d249398ca771beecde14bff1005c09b9fd09d66d19955ed37ca9e51f0234f68763baf6868035d504bb2ea6c0d01c33fd53b2e5e8a35d08cdfc48fda8148a9192186eae722e7b97ce58cd154e68af7068b2f8026e3b9860a1cecad78dcf7114227b3d21fac4d8b09846a6138c0c58fd01b2513f2db46bf3796f6b21333dd9d744a3433421088d3f4f7d6d785383c751cee345da700e0d24f57cd51c25d8a4d3dbc8befacf726dfa92efceba39a377c935b82f4902c287cc896c00988f42ee8a613a8de44d3925b36612d782a9ac6a677028414af3799320fbe0c03097ea0f2d738001c6a9d053b9b1ed55cbe5f48948cc3d82f2e72a1b56fb9192978b6c33034719d2b2d92d7c93de549fa57b198e4f489193801a5fd54928269d8133b411cfc44a4a94319684eaab5f3dd3281c310b5c74f8749dc81d98c0cd5046c00cdf6857cb99780222a8d2f1c347461e89cac0806e91b4b72e70a607f42c6705e927499bf357374f62f54e983620a60ede0a5ae54b8c8d720dd115ac22f7895427cf0b9601d2eb110b7d2bef9c70d717ae5ad160893aba3f7533288686bb139593f49ec935581d7ad66648c7f36b0bf3f533,0x65a59348b14f5d12b57f1c05,0xc955bf4bd979fafe18eb0cdb3c28e13f,'e1701305b520838dc70484e01cac762531cbbc30ab4c3c378ae9dbdb7d5b4009','89','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('16','8','L_INDEX','simulated',0x3b7545c1beae2df8a67366a0ea0c34bd28d72934852b25bd7e3e170b2be7f6d909d9202b9256ccfe5e51470cf6fb964422c69b44c1fdebf4bb2fc4affbd1e3c0128140d1fa5d22168c8ad2886e85270ae56533cc9e8887702f5d1a5779b557ed172ec075d2c51b04c5b9286267e188a386518c36abd1c6b8d9e51c16c6333733dcec58946f3759ea53eb7b6fce43402cec802e97404dfed6863e8989e7c1210cf2b55e3060d21500e6db3566beeff25c5f91e93ce1e318bc71d413c2e24fc26a77fdaf521a88c8bd7461fe5b7c3ff769268929b0f5b4149d82c647090b51e9266ca139d4b6c009b2971f7c92fd957f3cb854128d9fc63f54acbe9e2d0aa75fa8e8854f4f69955bf7377fa2d0bb79d75239ede605cc23d427898e7a401e63059a7982890c0d2fd6a68ed69efb99c65baf9b208f2faf9ab49f92621f6770f8967e8c97bcf5115621e96bf5b45e346caca90495a8060bc13da827d3f8cd0a347e970c94a97cd1d47c1295efe719f264b9562c204ce508a6a7f5d53daa59206765edcbe384548d100dcbfb4cf813eae915d42a51c8afdef29cd718020d91c703807b2613841ab7a09bb19027ff715756d67dc2ae1515a7bf0375727ac6345310626a62e0e4d1c69375922c00275b50f53f9857d0476d270d17b9a9b47ddad65b7dc1c9fa3c5ab09fa57f638c567857bcbb236ac0ba5a1f02069fe4,0x59969e242d56446223a99eee,0x3e2929b75757f9374455ed76d3cf286f,'ec9da313f04048519a8160c23f5141c8d19c076a2ee9d68e8c4faa01187f2741','68','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('17','11','R_INDEX','simulated',0xdaa476565f8377f54ec71c638c6e317e9db5ff84e9c215d3bd6a7ea17d3bb3d7160eb38f17bd1336cdfc6d0d5196d495c1bd3c5a50b5e7b688762cc7e11d90705e53bca92ac90e43e0a118f7a0442f5c324fcc394c3e98764d946413ebd3fce8e5cfa5f732ea485e3c20e493c3dff825aaf48de1888a5a7e759d6af82e4174296486bbcaf254ab728afb87916744dc199ac17784cedffb2645798abd4e801712b9a773a1a3b3bc9106dd2c147d5f74b40bdb943c15197bc5d7891a16c9b1b756b93b15469ec7a73317d9decc879be8848cfb2a9b8d80692e117d03dd8d145031cdddd261bee213d9c9577ace9b91aea9768b664db8ce3a48ce7119a206112bf18043e32e48284ab27cf50630a4ee867a2def15fb5ced4ce8ab2b121874f8f5a4624e53ff970084fe42aef2b3e3fd934f833624bc9ce838acb5f6be9aeec1d7c0fb04ddbed22c86d51655b7692a9cf8359862e9dbec78a065f13b1b6ac8f3bc6ac9e93362811581d1be1bbf564c84ee743d37ec8f71726e36eb647b4e5dee7e173b5246d542ddad3e1c8af933823c2bebc6543d2080f33977c65e4f5eba81cdb1c1bc191a4be956e851662e755dc1c9a6feeefbad7970fe0361c2cb86d0499e4312b29edc040bd6178541a715fb11875c22c886730214ad6262b8c79324a894fd2db9b926d1da3397953dea135bd4e26a1f5b544f31cf02aca739,0x3148b6fa82ee5d1062bf40b0,0x924b499fcddb4fd6de701c1ad9ecc1b0,'95b690a137721658d56fc94ef06dd17a61a777171a9acda85cf0ac61bf1c5262','78','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('18','11','L_INDEX','simulated',0xdc18f4f24dd11253967c7a0e52eaefb5569aeeacafaed1117827e85c9cf35dc2eb4f04de7fc2967d3207004c2792f45545e81d2a3eed68b898286000a0168df3cd52accdaf04eab4350e35952076f0fdf6f6c5b18bee5191d2884b963260e8b8f1b85c0ec813970256407ed83dc1a7f7fee0bcc4ce42554897c7c9a521956058924d3dfb944271287063bf3a99fe597582729a296f81b303ab152c0dd8d596946c61eaecb7ad7f17b69377a83188103074f6bc6172d260a8620fba6ce0604b943c330331acfa38b01dd1151a4612e65437e7f8ef7bb7003cf867a049f0fd1ee750f6e008d10a247f94045f4eb7aef241ca3dbafe15fbd9c51a160c5038c5ee89782bf3ec20d6dcafd9b32b57f8489d4dd259deb9d4ee21bba0e6112b07e72b3c88347d9afa43ee2495d92346c743b1bb2ffd345e11f307f1d3e883451ec768a5d3cda30e2d36d14b774c9850d679694a9b9e8c26229c5aef3fc183bd15459f74a77eab992c7f9829a74bca14be4a8d118ebc309db877ee0594ec6a195c8472da1e96791a3a8d872b2322ecd9220bf788f0b120594edd53fa5849e33167b3d1339e405bbc5db5b1eafa43ce73e65d2d80b82892c6bdbc5e5009440ced0c7ae512f2bda1a7217a1e00d1330f3548f64383a37067762eb9441fd53760d432c72bee60fb03d079ed7e4146d15ca8bef272acf0d46d99dc7a32,0x5309050bb8cecd3e8272614c,0xa21de0ee1753c5174cd431fa986d6bfa,'4d25573374ec0f1ad8ff8bd3d9d2aa22e6da6856904f97877ead8efbb8d0398d','95','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('19','12','R_INDEX','simulated',0x6f137fd8d68d62a92b7e07909a98ae5095adaf5fa0c4af8397e313417d080a373ce180eff297312720bf355df2483966303319f93cfe2cf3bf7abeb0ed4d7031190e495ce4dfaab4c58237499ef96be26e955ffd221a6074fd352a910aadd6e534173f148bd3736c8efecff736f1763353d4889e35cc566be7b901e40c80b4296dbb802b7e96d489bc65ec7d422b468a8282bfbb670ebb2f0c0ce696708bd308a37a62df5c48049b11def22230763870b5c00854b5126718bbcff9a6097da262554def224614ddd892e4dd8c7d73fcb54d335f652a769aaf64c24935a40b1f3a201fe13e0deffa094af63df96de36c0ecb9f8bb8db37558cdf7de4a5925381dd2ad3d9f633d11d43a2e24dd0a0d495566bcf23bf1258f81e022c3d16a77d13e48cd43bab41e66d9f7e8a6fd69ae0c8b20499dee6b34648fb17eedc4baaef225e0769a7379d1bf21c13b163037c02bc698556f046a4210a7a43e01369a980dcb34c9ecbfab34128e987ce21ac0020f5d3f982b91ca64a74b5075955fc8ed81eed8328eca825d4aff49af2160b94ac5a1e31d23e590eb5f0fca04c70f6783fbb9df15d1caee1ebe3a9fde585332aac08ab0565b05b33ad2da218c4889081f99d898c785fdca7a92b77c213f09c2e2de58a032be888b84d0f512264ccb4e57330f964193edef24f785a06c2539c60f2040942341af48ddd2899d9f2,0xdb99a67a795d3dbfec5d74eb,0x6d3beaf5dc9d8904fd26153735abfce2,'b5a767af8a33542a8ab93c5d3e0357ea9e9ed45f308725fa788ee3c76cfb8dad','81','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('20','12','L_INDEX','simulated',0xf9656bd09dff68ebc30da1c35273e6205e8b125f28314fb266c9245018190eb04058ab34b9b51d5b72a64b1d4a57d8fed954c7943f648b8a5716b40d0035237564f0189739e206b8128f50854ef1d6fd5aaa119ee4ff64c6e17a0f8bab4e7d60d56acd2c156e70b6e0c2f314dcf157571c862c91d6a8777d35885c57e3740ebd6646f815209932bb6a63e749cd62a7c469dc7411fde91ab52669c67c20dd3f50643db53eb381b658ccb70d1eb5b36edda140c9f30f9c1a92ba094aa9ae62582609a18f07883b793b2ab96fe4b52e8a0bcf71fd96b616860f40606493fb143bcf8b5e2ba7f3ed2fffd7d5c49ca4a1cf1e68ab47ce5208e0d71dbe1712de98f77021ac23523232f856872acf07dd6bcefd39b5ff040d2c644bc0afa9c98b76de73403e39fdf46af4151c94f42b22bf7b6ee044c6184433adccad1752f26a2cec9355c3c3b03da627600eb6106bdd3d8173145c2e151ea822995e4ea0c6ad16ae595590c31b2ac98f465e758e83b5f3f24e048beb7a0fe83f78c600e48409ce9430a0f1b40998055b20bff12f273d4ed9b7c5620ab65e689782c7b7db10b9f9b2f96b1da632f4c179fbf6b1680179bd00c478d0060a000d4b74da6a187e8326c28e73d19b46053273b2507a99c95385632de65d1b967134f40fb89892ae45016fb80c96f066fd7dee372d,0xeae248de1e5c09b4dd75c484,0x09dad79e0138caaa909dfee10bea4dbf,'601c6548e6734845538eb9c470db26f59984727c240548cd81ff901613561dac','88','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('21','13','R_INDEX','simulated',0x607a11e532faa8b62052dacf8d5048e8f1e5a27910cb1d05c18373f5bb0ec22b9bab88cc507e9b8b92052cebf3d8475f056a3344016ef05006029da0cc4a8356be2e3bfe334c6574f39c9865c0eff9c86ba9eb059ba54775e0a5670a5a5485172bd7bb87b9563225e48f3c0c6ec725ec5119aefcf8672fb511fc221a60dd9c5051cccf183d592b188486db7a6bc148821a47a6867bcebd2444dd3e60d13c829ea43c6f2e9de1757fb7d5149a497e36b9f4bd7438c47b727057679886ea8a4715405132092d07fc7db301a39848300f63b98317f2edd46fbd2dbbb67553b2e6e2f3aea604ec77f9bf2649c4b5461113b3fcec5d400ff15d211ec4abcf27b85850d0217f41c56474f6d5dd65cfb76e00af08c3c9c185babd32a8777ff7b0e1091520c9b5e1c6b1b27b445d75bd1e51dbe3068f62621f05ac88ce8805210694c8cb25dc9abe41ae44592337853b0a1e15e133a0080588d6d0e1f9ddb30fd83d493248ebb66eee328c1c5bf66f78dda62190deb8064e92911eae83ec8a24cca7843f8531685f392f0c81569fe9f746fa10c40362fdcc0f43943e5a398360c873d69b15418f39ada190b3cc895f7027d69396777e34cc56738de57a4c1781e54d0e7f2eb2806c88e7d0226edc4dda5ceac1cdaa4d533303bcb641a01ced7031dcbcc21e13,0x5d85e5363f63719f5e655d42,0xce4ae0c791f1fe8a1495bd27ec3b3b7e,'1b77a4b0047a45ada8869d60924dfdaf72934c59916485ba5a782a442494541c','88','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('22','13','L_INDEX','simulated',0x91354b55f15a14318464f38930a2b8cf0ced3a88eed41fa2d3eedafdcf1e94030801f9ada8917112dcdc350f1d6c3e7f61f6fb1eb6f9d6d73a89239f0d9ff2c8b7ed040f20d4fcf5a367bdd6a56853ffb4e6f03fdeaec68dfbc4e88f84b19f082ce8be54d2b8bfe7bded336e3edc300cfba35877e2d9e5f0e8500c6ab2acb1907f91b11d028932d202888eefd5ebc505d5e04a4e7d7d916c3b30babcb2bce18f7be5f7d7397855bdb9ac5d3ed66fa2feb43d0067d6db786d980409c0eb197a8201741503ea9c14030c3145a21d2af171b3576220f28f764ef7653cd48a5cda9f37fffc2d3c86bfb5574dc5767f7e3d97874b4dae34aea3748443f8c2344b9800d40b5d6b80d05dd212687fff73aa31a931c49465d426c8dee0fe8ba651f8f4f27f121335883c6185c5521fddf164d791819285cf01145e518952f9ab6fc2d9d6cc07915e622c1f2ebc2caa5f331925d29521936d1d002bf887149bbc8c7cba5c396c8cc170eaa5680bee59a5523064242e95e377cd329e7a2ddfe5e459947cc102c34beb76527298efd9f805c81119f29d03092cd73ddd16e9ceb9e57b304641e70519a32e67755edcd0f6625b214337e6ddce4190d9323def4ae4988adf39d55faaf2fade8422575ade76dd813c21945a4188bf579de3f3f256248d3fb5641c3b844d785fd880e49e6949522bc5fe566c,0x123a60d85549960a08cff768,0xa44d45a5bfb81d3c762418ae2053d3ec,'d291b89c57afca352993b45eb0b4124ba4d94bb02d17b964206e113d896d2ab2','71','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('23','14','R_INDEX','simulated',0xea8a6be140635ebd8dd7c31c3fd3da6a2e36a30189eae47f3f157d13a50fda3d554b262a9d2cf7483d02afeb19fd9ae1852a4fed6fda91e63435f38b13cd022f34c983d6b8a6d647d2f14efbc3821ff0f109063b940c63a7e85df360b62e931cbf3df17ef1baa408ff398d384c320ebefa0ee260ae1166d580c411dd0019c116faa23602860a77abd36aeadb2b69cfa0b1f4d89f11d01c333abaab4db21d59c42c49c4c133557d981de0ccfdaf6b4392d0cb3aef6b5619b6d96da5a7ab1069ffed54fd27a80a71e6dd89006d2ee4fa543d20837d90ce02e49c32ae0b21590ac1aee322a9bef5a09b3fea15bbf63c1d8e62821fd8122a6674446ab36a575c8aecd1d971d169083516acc46a79e8ac7b9b5364541122697b8e5e3268168f455f66e6fc959dae870d9357ba6cb616d1d6a6a7d32b4be870a6687e4cc7823ff3b5074cfe4ca875f1a05b08efcbb0007a4a5a631482d7a61cb64eb7b829d10f0b3adcd1acccb7a05024cecfaacc9586dd89f4b2fdab220ddc2637f99c2ea683357db2764c06299898002ed3eadadb1ec382a2ae9976b360e3af85011be154c00cda773775f0a99f8b10ec911c188a4d5f3e74b396b6bcec42846e3f066183babcc7e271c1990ef5223b347e7f2c264c2e99f5fcec4982f2a65f1f4a39c94eef0d451adb0bd37c90c70e5a045610f8f1cd926343e50f6febba281143,0xa3656d10f66dc1daa19b2dd5,0x04e212391fbc6e5270143aab671f02b3,'eeb069c19838d77f17900df01cd93c52a6d8fd6f6d210753a6e462acaa556831','90','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('24','14','L_INDEX','simulated',0x32f9699707e263d4a7b97d00f93098c37de5212a2d14b7ad03b41c4791fa39ab06561db2a730c09cc56d024391b04c4ff0e35ee46a337de788d885823251a4c22a00d335ffe29dedce64f4a913a72579ffaa02fa1db178ba5caa3db4d0720af8f01b0710d0a8096cd6ef6487ba06eb78758c431963845eb1fd9ee3ebd71d2f346b79add8304b968c90f39a911d7eef60626f45c50c4c1ab69363100f5f200e4a3ae44205632a43492b53288a86c9cfdb7d2a6b976fbc841f7c818b67025ffe07760f776d70debdda55bab3aa0a618e2aedd4e91fbff02e4e16ca43d73e40316993aa0f76cb6ad17fece6b9792be2f527a4d9a96e1c2d627595003d9c1deb94a1a6352a457e68758f20b6fd4a65eed691e8430cc7198275e2619f305de9d7ec4eb519f22cba066591cb166db0d257adae363e76c069b260b815410ee22bc9e5002b244ae9754db4559a33637ca7f6f7b58e9d8fb7764c6c24773f13d7ae28365cb3ec3eb655cefa852c541bafdc9d5aae65889ebc77dbd1c92419ecb7f8b17c6481fceab29b7fc4f959f7c172fd1755290bb1c76ec74bae85b2b28ac01be49d480624273442379eedb46a7ea5ffde9c311c0c7a9db622cc1aeed7ade359099de95ed290b3b55e21e080252b1431333aeafe9204fd182b08b275c89429347c1c90e401d29d810006a98dd84fda57ebf8700f6c71d70b21d347,0x57dfc56323565e3871174741,0x3d21a844c8d26f2df4eb7a8c5a82bd76,'81d74ae0866c2571d3b7ba7e933956272d2fff1f02e38e5af753dbd0fc7edac9','83','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('25','17','R_INDEX','simulated',0x5825f317d2822b91ff5560407b9a78aaf3f54a387234ade31b62388c7c98a5c5d77276b2a8c2d89c3e86914b926dfbd3b7f0012b4dbc4605fe34aa63f035398b60448b1339da84857d266592f77f0d5439654885253a00b4551aa5f04bf7befc2bb2e61e8be026e5d269764a5bda471e0fda348d4a366f92ca64f25ffbe6ae070ac55e7fc047bc781a619f2e8c2ef63c41f866013c1d25f0bf80eaeae0074302cde0ce4d3e09b3e6c57a063e1e1c4e4f5d7c87bf8ac6d43aa72d48ddf59c8189520946179be678acb5544f3d0164e9dbf1974b5bad66faa6ee121a14c333691d75ba48d5e8fbff165b8a9f292a06eae7546c32c26108f2dc961c9534b1456813364b6a87513dd9e09b74fc25076130433640762f0a6059f6fdb73e8dce6a367f2a3657ae0165b892789f45db89db04759df05f683be723e795b7eb016699f7df63f75502d8cdbc3818058778e33f9d53906b19e52ad30f526dc6e734db6c6d7150b778f19ec27292d6b3f01d5db610df4441a041bbcff0474b826215b2911b19c39243fbd90cb86d88c1607efe1cfa1ec72131a71d86eadca4490c4e343f4aa3b5397666f5dea090a66fcdc60edf23de712cdad9537c472dcff541440a7009b00d9d82723852b9cd22949ae5868a57d57af4e73a7588e5089d026e607d73046fea7cf82f3c307ecf626f03498cddb6206feb4f464e,0x017467e38a2dfd2cad6bae8f,0x9d19cf5d8f236be79d646069c23e2cd0,'67ad657d53e7a321ae36cd06412c6864d188fcee70917e0c8919c62702e1477e','76','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('26','17','L_INDEX','simulated',0x616efe89f089288babcd48d93881a873154ee4910d007b7f5c4debd6b25d13118eda7c5c26d073060872c8d111fb1a06f7b6fecc685aa88365a203ff978e89dda2ceb4ec2d423b8b8c83416e40d70d9746814d5a5451e92545cbeeeea74ce6879e98880f1a649fa236ad84db3a18cfc244efd90463ece77302a79a30785336261db7b2094906004781656c4f51ddac6bcc548783eb7913355a653e452563af05bc279e99da45a19b2f24d9e45a0d5386f966062affad8eac46f5aa7963d04e655aba8c4edd4ddf0f44cf46e02e9c05d0ea49242db3c8a9e22ca702807778cf04d68b6d7b6a51b061345b8e59a47dde6f9f41e2b776777539ae67815467ac4a2ba06a927de9609a4cfff56b99dba276c7d28acb1b1ccfe99cfb10cb7a0dbf9aa305a4ce4e9e1345531f7b0ea1de88fe3265768c85926583895189a0cb20e393b34bfa13cc58078f5cae21fa156f57062c83cdd18ffb7c77d46e0f60e46231f840842cd64eb9397154c652f53d10fb280434982023f1a3e6b7c6e6085de67f44d269fba3fb1283854a9895291e582a383eb9c3defc62f3d7dfb12351d993c36b4d62e0b4afdf9c91611fbd22243f0ea06d2e5037d0db270078b2a3b620bd342937df28c6b4e463c0801e5674c67d671dd09c38c995e7d587324af9085c6cc6e96a46fd43e6ac96d1dd7f0ffbca7af699974c393971a3b2a14c9a,0xc3b5caf6f85bff6f1fbef71e,0x964150d0c54e8433d00b02b58578ddd4,'613bf73c0d7a47e8046146446bb873489a7ca04dc239e927b7db85e0a758b1aa','76','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('27','18','R_INDEX','simulated',0x8562e1b834b56b110d8e6f0dd78c093230a32bd458429191862addb97179efdb5e563be41bf28ce7de8ed98ab43e4a3caa75c3b9b8f8ab345a66c564e16f5ddc66e12b9c5160aeefec93d6035200bfd961f49a87a668ffd194df3c6548729c3edde7c8927d9c600e96af223b77ac6f3e6b6020f3bd4fd2c958a94a0cb58b5a469704664ccc955871cb40f5c228437a5f6ae38a440ca40b499cba6dd642f92f7020258f4f80fb3e5e7f897419be3e87cec6d2cc4197fbadf18f501d8fe5550fd0956f28ce0c6bec1e9561ced0edc0449163a2edbe63fd66aee2c8f0e584334402ffe83537eadee2ca93ef2426a5553b9a80dd818d5a706ced96d9d1dd03dfe33f223e64cdb894ade964ca1fb534ae354533fa73f8d1ee62736982acc5dae3ebdee441f819f20634e1540a8b6fc07a74cf82fbd8f18df52bd4313757123ce4caa5b985114abb5aa45f2923e2892cbc85ac6e10d100da6bf32044e88eb7da12bd4de3928d15bfdf8548fa337319389b74ada53ffb4bd3dd760d913c7eebcfc83fa2bc18ca751c2af1f4f38b3ab10fd53c12ecc2249b435ed207ae5001256c2b37977840b050e83791b5c8d0f7dd7dbcdf5879e6fe5c9c7cae86530c49d748f2d7e202c8e20636755d6b5e63cb9b9809400e83604fbefba4f6dd9815b4f5038f2f46f5bd2dbaf4062e7344133a548ec3b79387d98b6b9a6d3b2b0ab0,0x9e99fade44464b27f4397347,0xcca78da6aa33c02b86afb67dbf1795dc,'d216dfca9f3ad5828c9adf9efd91dbb2e9bc85270a7eb94ff3b1141785490e9d','95','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('28','18','L_INDEX','simulated',0x95fd77301b6afea3a3858f4fc0a5282b22e6a50081999ad7e38eb2c85ec1362e8ff538c45c3e63dad72d4c6c6126a0cb4e2c9bb17c3952bc679e12ce06c69c82bb46faf8fac5678ae44ad85755189df589df51b1b0c4a0b370059db264cdc27aaab00a615a194427d9b25cd9b2c348baba4f486ce6271c330a3eb362a2833e829f8b5aa9f81100daecabc4744d1d613eedfab8b23fb02edfa4471d5e576856bd24911a781db560f0841b72832bf5162f2886e499abb2a63c839b4d565c3ca92c1442b1548e239e5465a4da276e2b132c51241d35636e4d91ad9dab7ac06be05ff9a9cfe1e60473a95c1ad58a28dfb63eaeef449061cdc4f59af78147ef75c4904d8c603e52079983ac10234485589105355256b6f6136f64c8d021965a63d29c76b4cfc228621f99dfda7e6f9657723f8eb23bb2a816e11bc3badf7e2260bfea4549575726bb8cc600bd739c554274276292777f5e48fc4d6acba426cf9f7a5af68221955600aa6a08869adfb4bff94185c6b581098317a048c518ce770182a89ad1b142f1fc66631a91fba6bf7f4b8078bba02aeed6833029dfd34c32d0903ff435ef15b753b07af3e3f1c4c9fbb778eff6fd22f690684e8481e8381f10afae1310bde71e001296f0e445306f9a371bb023fc5f53c3f54aa43b968daa408ee68bccd6cee445b4f4c73a78c507d269cb223311fd3020,0x59fade2be6aadeafade68f93,0xd4d77174096f1c6c5142b52117cb905c,'9a7b0be52e3635368d05fcb82e31368f23ea5552128f6e47e5a0d1833e636f7f','83','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('29','19','R_INDEX','simulated',0x36b7ac5a8b031781ee75c7a2acf910d8eff69a100f78b71ec7a9c7083cd3adfa635aca0f3e1966f0ef78c67045ad81c30fb23fa1056f643c35902a17f82877d9588c901967b4d6dd301b01d1177e631f5580c7f012e2844ff307319278c7daea10551da84b9190040cf248059f1cc98e703424ecc76a03b369eec25705b8d3ea06a9167494e0796a33e2cf88eb54662402ca7271019e8e332a9669edbe35e5d46758c6def7727a8dc8eb19294ff63b9d3106408caa745ccf9dc9f2b476ff3cb4d2a7fba31e07baf1cb6ce94bdc8baa3a75871abf0eb515e300b746067d2bd0631e0e43d91d564ca848eed5426631dcbcacdc740e16269eac8b106f982b380feb44682a480192439a0141db7e019d77f136d923952819ae372d29f368531e83a49769be698e87b40b2b0d843477a5834531be1f89992a96a1961fc1a298cd686fcead694da364018b62de0d050bb336c8ec2c19577bb711e44575baf191d43a24d3ccf60d44c277ead925e875c256a845cb72f129d5c51ea79d400ba7adda0451fc4376c22f638791e19e8fdbb86eeb01a1d31376ad2011d23fb77d2f13331007b7efc9b8cd23096febc78da3ffdfaab47c7d2c6f04c7eea2fffeaa156cfd2d2e7c198b8b8190139a92ea2f3b54eb7d595ca17cfab73a064026cde34f88e0222b9ed9741ce370314207dfd239f69bb941,0x0b951bc0874532b889689e97,0xf4386f6ac5cf1b7769353b6d669dab61,'c41aec089976fb0fb22b693c9f32f7a967f16af249f10d8aebbd23d49e2fedd5','78','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('30','19','L_INDEX','simulated',0xfaf48b52d95f931cfe3892a5f48331739a3c087bc2a7f5bc4e50a0ed3c491f21dc73dae44cc8bbe0e972b86f547fa86e503e9c5e468b109b8af699a25c91da4c15c1988edbf1f6df7807cd2f9c4720ba3d51819c9c5e0b93c6c31f529ac7a3a71124923d0011232abaf3512f4a367f76135b61ced4b513545c828ada3db0f63a4eb0fe4302a0f40c3f90476b52a08c4e5a577f19c79298bde977bf063a2220ea11a84f683277e28f945e2961c2cb087a0daa3ed5289f1e8a891948f54806a07cd68154ca3bdf75852ab588bec78c1791008fbd8c24f029d054f54345be9c2deb3afa42c2064325765517995aa159efe07d66fdb3bda03e511f811e10d1ec72ff4112b0bdad9979dcdd2fb0e005e468c0084fbe3660d7e8d151369dd70bbaebae2d894330f2504cff673dd5e6a50c355a3f5b1e39c8cf27c54094165fe27f2508bb27c74acbcca53ad03aff7eb8aeb8c50588072c7445e6e68b4d31caea4b7a10c8d8f5f70d0e9802e9464132985558d007192aee18d25f322a931d07616eb0d58e5074ac2c48816369e506c44dbb560a891e9fec69a5bde2ceec792a2f25d4bc4ee82582d5e095eef27cd7e7c93538d3e74e2a3a6ef63ea55c1dfaf0860313e06f1a5c061d3f2db83b3b970e784075404ec3fcb2136346a8d8f8a79fda34b1b0ebf2c8b1de7f5422,0xf9def3bbe4e1d5ff9f14bf3a,0x96837503ab72673f34594180f6c4d091,'a5eca6ae94f0abf21db8a0de65b8b9219405385df32cc96a4954339bb602984b','88','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('31','20','R_INDEX','simulated',0xadc75349af9133acccc101b42f9240da4c9d1bd202bd99e5d2d7d97034bd1e68ea20e559268d335599a36033ad8df139f05836215e62886d03e74a2b6d5258a077fbcca2adf417fd0a7dd3de3aae36535a741e1738ce28a32a54f59acf483b9dc77ffd498298eb134c7df3b32c63cb9ae9f9089fb394088e7450f709120ed7c3071ea48ab2bb59ca5fbb3e82f6c0d10e66dce8abb3437b5cfbedfae5a2cc415af35a7c5a319b67ba39db835e192fb65a03783efad1a5ab2a0aea8e99f4e01d10a7b55b98e53d9e5d9e1fc5d2b7a4014527ef3a25ca65660b3e5e1189005b19e02d758669955cafe52836b7ab966dfd45eb688603d3582a8d850bca72ed054634ebf3ee4ff5154a7a02c4455584a8116238af9b961a98a221e5449107b86242772047b9b4ed9f484dd1a0b97196639542b21786a4c77e515248b73c0522778a81dff4af17e25f92b986c1043d681e4e926ecee7462e6fad8d7e5db36ae0410b1ce50dfad79a42cf48fcae8e65e376714ce4ad7a90af55702b9cbcaa01cf77125318fdeadd326d73af8336e6083811213c0bed0b4ad05d7eb52e0d2af1b3ab1e3896284d726b33610c302d7a24ee0f2a8ac4df148ed797cd501184606012088005f5fb1bf7f4a7aeaa2a0b0a25d39a986ef605cf461a4d0c7c99f9828458e6336c2e51eac25c795a987bb486cb79f2f6d741,0x818d66fc98920970d3203dc1,0xfea2b53aa41e97eb812491bde90909e7,'3e8f872fcaca12667058414ce5aeb781b14bd36b7c0f2d9989c78e01a8a5bb6f','84','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('32','20','L_INDEX','simulated',0xa53685e2f120e653ef48ccbbfbeb31de8fa2c67469140a2d739d7c68ca806259a33dd741ff2cf3ec9198775d35233b84ae246b00c0cc527941c226a5c202b347662ff869824b462825e03f22d84874bceee201477e83f9a7c6e255b26528f52e2a979995b13b6bab65a2552888f940918de48d33f469005475f265a2ea1c8c892f852d99c5cebc172d86410b0f043d198ee938bfb65f376229fe3b7826bd94ea300da6582254e1f9f4fb4d3ea4afa0667937b568b73b775d852f493353269e4b02665519241e045ccd4529ab17f4b24db14774eba31c01189f1c059c1cd65dfeebbf92e3a86ac2b81fc36ec8977066600da6f9070a1b32cf9364e6212f79f839b0e5b8bd37ebf6cd74eae21902713ca3f94f699c394f0625467eedfbd5b29912d9a6bab28b082efbcf9294d0367c1a6abb4a7abd6cd5e79d14d17cfaaab673f8655d340d764584711f0d2277afc19fa5461e48d2ea3abcff8835bdf0b55c0e6b1540ef4b3ff31ec69b491208f6b203a70856021a7a4d2e9616b1029f3132b7322941697db8ee939719c2f54aa4cf5899bf4c833d9222a61c308f1b4ec4ceaf034d991c407c32e8829cc64772a3a99e8b08ed8a7ee0b9c0c90910350e30e4462380d525b847ccb179b2beda6fe91ad9a2036f9477ba48448560c833a644a109119ab7042e2c6c5d1bf233b293b6c59e4c3b278524,0x513d4b4937b8f285eb95ce22,0xa7ae13f5f6a8910c1eff0620ab336cea,'45e8dd53c3f73ea4ae546ea1231f48903c00cab84d62c9f345150da0cbcaffab','81','1','2026-11-12 04:07:32');
INSERT INTO `biometric_templates` VALUES ('33','23','R_INDEX','simulated',0xa0a9348c7c2e507290b70c7e43282d4065f36f10de3c933de8f3d6ac57ab1b3353bfd91d167e8f240508becf762464762fa465127c7289d9a63d15dd01fae5987fbe092fcb7f1bd9e41e5346a11c8476f9c7b1da60811f9ac619e37457e3147dc1915d3dc8cde3bbbf1db066e2ae872a1a413a6d9eb1b10c388e1a226298a31bbdedf08c1cb7c738af408057e1461b26a261b7301acbf43406e255c70b3cb5929f9df4d3bc0b0f264657181240b0ca692b1eb3e1e7ad7d76df3c854f1a5979a37d13b0d779e72e4430a4c454989f664a640abe5868883cbd3c655af5234a783c00a8813ad8600686a65b6767784243316c60695b1040d28f96ebdd302b4776bf2367adcfc0017e6408f8255870ae21a490dfd41267ee1b84e928adf79e66e99af3ab4f53d855791cf223815660ed02efcee444ed133b0b6ded9df76015aca6b93b317408fe999cab34af6c5189c40fbc3da511f9f143b6b62e1a4f1d29104b90fba35b36b0b7186f81ea0afe79399e48d1111f776608a02c1b7f91d476ec9306bb217cd00ea54dd6df69f067cefc3499dcc69f7af133b8664687900bd225e9d591e1d76a7913ff6b7ec5c65ffa85933d0637738fba6b40c05760e45d536c68aca270da4d7069f0cbc5cd3651e29fb2ea8a663806b5712fe666189354347a8eb21e33c7307c2bb5d7fcdbedd8197a3fa2acc91c,0x1c481d29aceca082cc52bf4b,0x4efe538bdb8baf01d5e2ff642a576345,'64c2717fc43c7916ee7a8d7f2d26aece88dececefd6fcafbb2a4cd68dfc18a2e','63','1','2026-11-12 04:07:36');
INSERT INTO `biometric_templates` VALUES ('34','23','L_INDEX','simulated',0x42cbc3efe79f9271b326fb90c150db56902902b9021d558959a35c9cae63b27a81b22b42d2a1ddeba69bd3922db34c2ead8a308210428401f8f60f519e9151e578e6375d7cd17452841083a987fb5551ef3e51b28c770470f6e0e92b8742e8840f30f080be854480d1af1aa24e9859da9ec54dc1f5afe2a87cf6d0f6a2837888248b64278658f9fd609f1c0481126be4a86926cdf322e6eaeba1d00ddf254f123d11d626f1ffb0e73a486ac2a2a888dc1e351a21d19a59d510d1def99d5c6afa36366a783c773287871532baf642ecf730591632f772c84a52021dfd9e9f560ff7f2fc97b78f856237a7984203fd06bda6693e1da5150da6463ab05af48961d5b7260630429c6e9e03c233dd673b195a39130300d83cab5044c361219dbd8ab22b462502bb7410f8c0d70ee95769a24d18a5ce3b54669a0c993c2fc0668a826625b212ecef5b3eabef4aabbe2f9a86a779c267da107ceacf7103fd6cf95b51b3ac8f0059db2749ff35ba7c12e128011a72f8a7642e0e8bb92c9245383b834ac764b6e7d6c37f35732f6d4c0c05417bc41484c395e947aec22b9f09919f83768bf0fcc85c21b95228675be7e687d492c0ee5cf7e097d1bf2fd181499a3e5750e381fc8100054c1f64f1335e324b478581d3cae0d7de0e443d9fd58e21eec9004c7ff92186c21eafacd6bffa32077d773529caa7,0x44351467375900d9ca9c4346,0x854cfffada2444c569007bb25af9ca87,'4348de2baa678bc1fff3fd504e69265c64363634ae4a6832eacd83fb6631157c','65','1','2026-11-12 04:07:36');
INSERT INTO `biometric_templates` VALUES ('35','24','R_INDEX','simulated',0x3aba2e267e6f425f5ab0c3ff67c437622435ec2f17d4fe1ac4693e853c4e18d75c09fd2d966bbd872a7c6be591d8d512ba67cc05a5b5decaf458b778ce937051f419c15f779ac44d83ff7ebb7f4ef7c63e17f72e4eebeb9e83709069e9de5f5aeb87382e3e727da83db27a7599e08a604227199a54fa85ccf16f73ce44126478e59d8d4795916b8a1e9918b85ab438c127a3931ffbe8cee5ca2ad838f1fce645cb996eeb53c712942e4983972a6a392ba71361b3424e0850783c3022cf7a75b8caafa67bf7911f4606a0ab30e7723d165794401684acdbba1994b19b00b83f5a793f90e19b14d8416d6b329a3220a976563d3537aacbadb44525c9d8db8f84ccf5b24e4e34f6f6dc659b229cc87743e8ceb8f25f3d33330d3e0216780d5ccd0044b029949531e0534de814b6e76c94ab2782a0a533ba2786fcebe090629585ea876f55ad4ac974055f40c8e9579f9a35ae38f605db930fb497dc8285174f61a8aa4020bde1ee6838f9ba6f7aae38ae21fff6f65cf8d10d8f7d65cc96b1304419dbf25182c57b1d1d476e4f00dfc3e8a732e11314d094a90c352715ef9495ec48c8b9c399c9ab1cf713cc414d9ff13434bdc990a897f4b12d2ef8a5525ea70e1a52513252658b0b522276830a8518b61249c530d34ffa1d1fb2c72f54901991f9e8ee1f2d5a8070cddaefc689ea1d36,0xb87ba31adceee03d8bc56d3d,0x6576a3d28c98845f472bc128ef753551,'dc5c56b7d8ef2043b083917746ad2589bb21e41b077e06173c367edde87d2e83','69','1','2026-11-12 04:07:36');

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

INSERT INTO `class_sessions` VALUES ('1','1','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 1','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('2','1','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 2','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('3','1','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 3','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('4','1','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 4','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('5','1','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 5','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('6','1','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 6','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('7','1','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 7','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('8','2','2026-10-20','11:00:00','13:00:00','Lab 1','Lesson 8','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('9','2','2026-10-22','11:00:00','13:00:00','Lab 1','Lesson 9','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('10','2','2026-10-27','11:00:00','13:00:00','Lab 1','Lesson 10','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('11','2','2026-10-29','11:00:00','13:00:00','Lab 1','Lesson 11','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('12','2','2026-11-03','11:00:00','13:00:00','Lab 1','Lesson 12','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('13','2','2026-11-05','11:00:00','13:00:00','Lab 1','Lesson 13','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('14','2','2026-11-10','11:00:00','13:00:00','Lab 1','Lesson 14','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('15','3','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 15','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('16','3','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 16','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('17','3','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 17','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('18','3','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 18','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('19','3','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 19','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('20','3','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 20','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('21','3','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 21','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('22','4','2026-10-19','08:00:00','10:00:00','Lab 2','Lesson 22','closed','2026-10-19 08:00:00','2026-10-19 10:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('23','4','2026-10-21','08:00:00','10:00:00','Lab 2','Lesson 23','closed','2026-10-21 08:00:00','2026-10-21 10:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('24','4','2026-10-26','08:00:00','10:00:00','Lab 2','Lesson 24','closed','2026-10-26 08:00:00','2026-10-26 10:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('25','4','2026-10-28','08:00:00','10:00:00','Lab 2','Lesson 25','closed','2026-10-28 08:00:00','2026-10-28 10:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('26','4','2026-11-02','08:00:00','10:00:00','Lab 2','Lesson 26','closed','2026-11-02 08:00:00','2026-11-02 10:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('27','4','2026-11-04','08:00:00','10:00:00','Lab 2','Lesson 27','closed','2026-11-04 08:00:00','2026-11-04 10:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('28','4','2026-11-09','08:00:00','10:00:00','Lab 2','Lesson 28','closed','2026-11-09 08:00:00','2026-11-09 10:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('29','4','2026-11-11','08:00:00','10:00:00','Lab 2','Lesson 29','closed','2026-11-11 08:00:00','2026-11-11 10:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('30','5','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 30','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('31','5','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 31','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('32','5','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 32','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('33','5','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 33','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('34','5','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 34','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('35','5','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 35','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('36','5','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 36','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','3','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('37','6','2026-10-20','11:00:00','13:00:00','Lab 1','Lesson 37','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('38','6','2026-10-22','11:00:00','13:00:00','Lab 1','Lesson 38','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('39','6','2026-10-27','11:00:00','13:00:00','Lab 1','Lesson 39','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('40','6','2026-10-29','11:00:00','13:00:00','Lab 1','Lesson 40','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('41','6','2026-11-03','11:00:00','13:00:00','Lab 1','Lesson 41','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('42','6','2026-11-05','11:00:00','13:00:00','Lab 1','Lesson 42','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('43','6','2026-11-10','11:00:00','13:00:00','Lab 1','Lesson 43','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','2','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('44','7','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 44','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','4','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('45','7','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 45','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','4','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('46','7','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 46','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','4','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('47','7','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 47','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','4','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('48','7','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 48','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','4','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('49','7','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 49','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','4','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('50','7','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 50','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','4','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('51','8','2026-10-20','11:00:00','13:00:00','Lab 1','Lesson 51','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','4','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('52','8','2026-10-22','11:00:00','13:00:00','Lab 1','Lesson 52','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','4','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('53','8','2026-10-27','11:00:00','13:00:00','Lab 1','Lesson 53','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','4','2026-11-12 04:07:32');
INSERT INTO `class_sessions` VALUES ('54','8','2026-10-29','11:00:00','13:00:00','Lab 1','Lesson 54','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','4','2026-11-12 04:07:33');
INSERT INTO `class_sessions` VALUES ('55','8','2026-11-03','11:00:00','13:00:00','Lab 1','Lesson 55','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','4','2026-11-12 04:07:33');
INSERT INTO `class_sessions` VALUES ('56','8','2026-11-05','11:00:00','13:00:00','Lab 1','Lesson 56','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','4','2026-11-12 04:07:33');
INSERT INTO `class_sessions` VALUES ('57','8','2026-11-10','11:00:00','13:00:00','Lab 1','Lesson 57','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','4','2026-11-12 04:07:33');
INSERT INTO `class_sessions` VALUES ('58','2','2026-11-12','08:00:00','17:00:00','Lab 2','Demo session for today','scheduled',NULL,NULL,'2','2026-11-12 04:07:33');
INSERT INTO `class_sessions` VALUES ('59','3','2026-11-12','09:00:00','17:30:00','Lab 2','Demo session for today','scheduled',NULL,NULL,'3','2026-11-12 04:07:33');
INSERT INTO `class_sessions` VALUES ('60','9','2026-11-12','00:00:00','23:59:00','Workshop','Test session','closed','2026-11-12 04:07:36','2026-11-12 04:07:37','31','2026-11-12 04:07:36');

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

INSERT INTO `classes` VALUES ('1','1','DIT-2025-SEP','Diploma IT – September 2025 intake','2025','2026-11-12 04:07:31');
INSERT INTO `classes` VALUES ('2','2','CIT-2026-JAN','Certificate IT – January 2026 intake','2026','2026-11-12 04:07:31');
INSERT INTO `classes` VALUES ('3','3','DBM-2025-SEP','Diploma Business Mgt – September 2025 intake','2025','2026-11-12 04:07:31');
INSERT INTO `classes` VALUES ('4','4','DEE-2026-JAN','DEE Jan 2026','2026','2026-11-12 04:07:35');

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

INSERT INTO `courses` VALUES ('1','1','DIT','Diploma in Information Technology','Diploma','2026-11-12 04:07:31');
INSERT INTO `courses` VALUES ('2','1','CIT','Certificate in Information Technology','Certificate','2026-11-12 04:07:31');
INSERT INTO `courses` VALUES ('3','2','DBM','Diploma in Business Management','Diploma','2026-11-12 04:07:31');
INSERT INTO `courses` VALUES ('4','3','DEE','Diploma in Electrical Engineering','Diploma','2026-11-12 04:07:35');

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

INSERT INTO `departments` VALUES ('1','ICT','Information and Communication Technology','2026-11-12 04:07:31');
INSERT INTO `departments` VALUES ('2','BUS','Business Studies','2026-11-12 04:07:31');
INSERT INTO `departments` VALUES ('3','ENG','Engineering','2026-11-12 04:07:34');
INSERT INTO `departments` VALUES ('5','XSS','<script>alert(1)</script>','2026-11-12 04:07:34');

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

INSERT INTO `enrollments` VALUES ('1','1','1','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('2','2','1','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('3','3','1','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('4','4','1','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('5','5','1','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('6','6','1','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('7','7','1','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('8','8','1','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('9','9','1','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('10','10','1','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('11','1','2','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('12','2','2','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('13','3','2','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('14','4','2','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('15','5','2','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('16','6','2','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('17','7','2','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('18','8','2','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('19','9','2','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('20','10','2','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('21','1','3','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('22','2','3','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('23','3','3','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('24','4','3','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('25','5','3','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('26','6','3','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('27','7','3','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('28','8','3','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('29','9','3','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('30','10','3','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('31','1','4','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('32','2','4','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('33','3','4','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('34','4','4','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('35','5','4','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('36','6','4','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('37','7','4','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('38','8','4','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('39','9','4','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('40','10','4','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('41','11','5','2026-11-12 04:07:31');
INSERT INTO `enrollments` VALUES ('42','12','5','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('43','13','5','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('44','14','5','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('45','15','5','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('46','16','5','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('47','11','6','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('48','12','6','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('49','13','6','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('50','14','6','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('51','15','6','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('52','16','6','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('53','17','7','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('54','18','7','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('55','19','7','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('56','20','7','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('57','21','7','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('58','22','7','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('59','17','8','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('60','18','8','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('61','19','8','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('62','20','8','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('63','21','8','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('64','22','8','2026-11-12 04:07:32');
INSERT INTO `enrollments` VALUES ('65','23','9','2026-11-12 04:07:36');
INSERT INTO `enrollments` VALUES ('66','24','9','2026-11-12 04:07:36');
INSERT INTO `enrollments` VALUES ('67','25','9','2026-11-12 04:07:36');

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

INSERT INTO `lecturers` VALUES ('1','2','LEC001','1','Female','2026-11-12 04:07:31');
INSERT INTO `lecturers` VALUES ('2','3','LEC002','1','Male','2026-11-12 04:07:31');
INSERT INTO `lecturers` VALUES ('3','4','LEC003','2','Female','2026-11-12 04:07:31');
INSERT INTO `lecturers` VALUES ('4','31','LEC900','3','Male','2026-11-12 04:07:36');

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

INSERT INTO `notifications` VALUES ('1','11','warning','Low attendance: DIT101','Your attendance in DIT101 Computer Applications is 28.6% (2 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:07:33');
INSERT INTO `notifications` VALUES ('2','9','warning','Low attendance: DIT101','Your attendance in DIT101 Computer Applications is 42.9% (3 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:07:33');
INSERT INTO `notifications` VALUES ('3','13','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:07:33');
INSERT INTO `notifications` VALUES ('4','11','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 57.1% (4 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:07:33');
INSERT INTO `notifications` VALUES ('5','10','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:07:33');
INSERT INTO `notifications` VALUES ('6','9','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:07:33');
INSERT INTO `notifications` VALUES ('7','14','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:07:33');
INSERT INTO `notifications` VALUES ('8','11','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 57.1% (4 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:07:33');
INSERT INTO `notifications` VALUES ('9','10','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:07:33');
INSERT INTO `notifications` VALUES ('10','9','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:07:33');
INSERT INTO `notifications` VALUES ('11','11','warning','Low attendance: DIT104','Your attendance in DIT104 Programming in Java is 50.0% (4 of 8 sessions). The minimum required is 75%.','0','2026-11-12 04:07:33');
INSERT INTO `notifications` VALUES ('12','19','warning','Low attendance: CIT101','Your attendance in CIT101 Computer Fundamentals is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:07:33');
INSERT INTO `notifications` VALUES ('13','19','warning','Low attendance: CIT102','Your attendance in CIT102 Networking Basics is 14.3% (1 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:07:33');
INSERT INTO `notifications` VALUES ('14','17','warning','Low attendance: CIT102','Your attendance in CIT102 Networking Basics is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:07:33');
INSERT INTO `notifications` VALUES ('15','16','warning','Low attendance: CIT102','Your attendance in CIT102 Networking Basics is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:07:33');
INSERT INTO `notifications` VALUES ('16','25','warning','Low attendance: DBM101','Your attendance in DBM101 Principles of Management is 42.9% (3 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:07:33');
INSERT INTO `notifications` VALUES ('17','22','warning','Low attendance: DBM101','Your attendance in DBM101 Principles of Management is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:07:33');
INSERT INTO `notifications` VALUES ('18','29','warning','Low attendance: DEE101','Your attendance in DEE101 Electrical Principles is 0.0% (0 of 1 sessions). The minimum required is 75%.','0','2026-11-12 04:07:37');
INSERT INTO `notifications` VALUES ('19','27','info','Welcome','Welcome to DEE101','0','2026-11-12 04:07:37');
INSERT INTO `notifications` VALUES ('20','29','info','Welcome','Welcome to DEE101','0','2026-11-12 04:07:38');
INSERT INTO `notifications` VALUES ('21','30','info','Welcome','Welcome to DEE101','0','2026-11-12 04:07:38');

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `setting_key` varchar(50) NOT NULL,
  `setting_value` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `settings` VALUES ('biometric_driver','simulated','2026-11-12 04:07:31');
INSERT INTO `settings` VALUES ('bridge_url','http://127.0.0.1:8765','2026-11-12 04:07:31');
INSERT INTO `settings` VALUES ('consent_version','1.0','2026-11-12 04:07:31');
INSERT INTO `settings` VALUES ('institution_name','Demo Technical Training Institute','2026-11-12 04:07:31');
INSERT INTO `settings` VALUES ('late_grace_minutes','15','2026-11-12 04:07:38');
INSERT INTO `settings` VALUES ('match_threshold','80','2026-11-12 04:07:31');
INSERT INTO `settings` VALUES ('min_attendance_percent','75','2026-11-12 04:07:38');
INSERT INTO `settings` VALUES ('min_quality','50','2026-11-12 04:07:31');

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

INSERT INTO `students` VALUES ('1','5','DIT/001/2025','1','Male',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('2','6','DIT/002/2025','1','Female',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('3','7','DIT/003/2025','1','Male',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('4','8','DIT/004/2025','1','Female',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('5','9','DIT/005/2025','1','Male',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('6','10','DIT/006/2025','1','Female',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('7','11','DIT/007/2025','1','Male',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('8','12','DIT/008/2025','1','Female',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('9','13','DIT/009/2025','1','Male',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('10','14','DIT/010/2025','1','Female',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('11','15','CIT/001/2026','2','Male',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('12','16','CIT/002/2026','2','Female',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('13','17','CIT/003/2026','2','Male',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('14','18','CIT/004/2026','2','Female',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('15','19','CIT/005/2026','2','Male',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('16','20','CIT/006/2026','2','Female',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('17','21','DBM/001/2025','3','Male',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('18','22','DBM/002/2025','3','Female',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('19','23','DBM/003/2025','3','Male',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('20','24','DBM/004/2025','3','Female',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('21','25','DBM/005/2025','3','Male',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('22','26','DBM/006/2025','3','Female',NULL,'active','2026-11-12 04:07:31');
INSERT INTO `students` VALUES ('23','27','DEE/001/2026','4','Female',NULL,'active','2026-11-12 04:07:35');
INSERT INTO `students` VALUES ('24','29','DEE/002/2026','4','Male',NULL,'active','2026-11-12 04:07:35');
INSERT INTO `students` VALUES ('25','30','DEE/003/2026','4','Female',NULL,'active','2026-11-12 04:07:35');

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

INSERT INTO `unit_assignments` VALUES ('1','1','1','1','2026/2027','1','2026-11-12 04:07:31');
INSERT INTO `unit_assignments` VALUES ('2','2','1','1','2026/2027','1','2026-11-12 04:07:31');
INSERT INTO `unit_assignments` VALUES ('3','3','1','2','2026/2027','1','2026-11-12 04:07:31');
INSERT INTO `unit_assignments` VALUES ('4','4','1','2','2026/2027','1','2026-11-12 04:07:31');
INSERT INTO `unit_assignments` VALUES ('5','5','2','2','2026/2027','1','2026-11-12 04:07:31');
INSERT INTO `unit_assignments` VALUES ('6','6','2','1','2026/2027','1','2026-11-12 04:07:32');
INSERT INTO `unit_assignments` VALUES ('7','7','3','3','2026/2027','1','2026-11-12 04:07:32');
INSERT INTO `unit_assignments` VALUES ('8','8','3','3','2026/2027','1','2026-11-12 04:07:32');
INSERT INTO `unit_assignments` VALUES ('9','9','4','4','2026/2027','1','2026-11-12 04:07:36');

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

INSERT INTO `units` VALUES ('1','1','DIT101','Computer Applications','2026-11-12 04:07:31');
INSERT INTO `units` VALUES ('2','1','DIT102','Web Design and Development','2026-11-12 04:07:31');
INSERT INTO `units` VALUES ('3','1','DIT103','Database Systems','2026-11-12 04:07:31');
INSERT INTO `units` VALUES ('4','1','DIT104','Programming in Java','2026-11-12 04:07:31');
INSERT INTO `units` VALUES ('5','2','CIT101','Computer Fundamentals','2026-11-12 04:07:31');
INSERT INTO `units` VALUES ('6','2','CIT102','Networking Basics','2026-11-12 04:07:31');
INSERT INTO `units` VALUES ('7','3','DBM101','Principles of Management','2026-11-12 04:07:31');
INSERT INTO `units` VALUES ('8','3','DBM102','Business Communication','2026-11-12 04:07:31');
INSERT INTO `units` VALUES ('9','4','DEE101','Electrical Principles','2026-11-12 04:07:35');

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

INSERT INTO `users` VALUES ('1','admin','admin','admin@example.ac.ke',NULL,'System Administrator','$2y$10$thR3hrxPscSq2lUuNCxRAuW5rDGGUFgFvOW0.JgzdSFuFHPLMql8W','1','0','1',NULL,'2026-11-12 04:07:33','2026-11-12 04:07:31','2026-11-12 04:07:33');
INSERT INTO `users` VALUES ('2','lecturer','LEC001','lec001@example.ac.ke','0700000010','Grace Wanjiru','$2y$10$KD2rAybgHb/6KSSKchJvA.e1j8xNIxZX4hasQ.ghpL30JNwl1Zh.e','1','0','0',NULL,'2026-11-12 04:07:34','2026-11-12 04:07:31','2026-11-12 04:07:34');
INSERT INTO `users` VALUES ('3','lecturer','LEC002','lec002@example.ac.ke','0700000011','Peter Otieno','$2y$10$KD2rAybgHb/6KSSKchJvA.e1j8xNIxZX4hasQ.ghpL30JNwl1Zh.e','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('4','lecturer','LEC003','lec003@example.ac.ke','0700000012','Mary Achieng','$2y$10$KD2rAybgHb/6KSSKchJvA.e1j8xNIxZX4hasQ.ghpL30JNwl1Zh.e','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:34');
INSERT INTO `users` VALUES ('5','student','DIT/001/2025','brian.kamau@student.example.ac.ke','0711100000','Brian Kamau','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,'2026-11-12 04:07:34','2026-11-12 04:07:31','2026-11-12 04:07:34');
INSERT INTO `users` VALUES ('6','student','DIT/002/2025','faith.njeri@student.example.ac.ke','0711100001','Faith Njeri','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('7','student','DIT/003/2025','kevin.mutua@student.example.ac.ke','0711100002','Kevin Mutua','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('8','student','DIT/004/2025','mercy.chebet@student.example.ac.ke','0711100003','Mercy Chebet','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('9','student','DIT/005/2025','dennis.omondi@student.example.ac.ke','0711100004','Dennis Omondi','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('10','student','DIT/006/2025','joy.wambui@student.example.ac.ke','0711100005','Joy Wambui','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('11','student','DIT/007/2025','collins.kiprop@student.example.ac.ke','0711100006','Collins Kiprop','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('12','student','DIT/008/2025','sharon.atieno@student.example.ac.ke','0711100007','Sharon Atieno','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('13','student','DIT/009/2025','victor.mwangi@student.example.ac.ke','0711100008','Victor Mwangi','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('14','student','DIT/010/2025','esther.jepkosgei@student.example.ac.ke','0711100009','Esther Jepkosgei','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('15','student','CIT/001/2026','ian.barasa@student.example.ac.ke','0711100010','Ian Barasa','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('16','student','CIT/002/2026','diana.nyambura@student.example.ac.ke','0711100011','Diana Nyambura','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('17','student','CIT/003/2026','moses.kibet@student.example.ac.ke','0711100012','Moses Kibet','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('18','student','CIT/004/2026','ruth.akinyi@student.example.ac.ke','0711100013','Ruth Akinyi','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('19','student','CIT/005/2026','allan.mutiso@student.example.ac.ke','0711100014','Allan Mutiso','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('20','student','CIT/006/2026','naomi.wairimu@student.example.ac.ke','0711100015','Naomi Wairimu','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('21','student','DBM/001/2025','felix.ochieng@student.example.ac.ke','0711100016','Felix Ochieng','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('22','student','DBM/002/2025','purity.jeptoo@student.example.ac.ke','0711100017','Purity Jeptoo','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('23','student','DBM/003/2025','samuel.karanja@student.example.ac.ke','0711100018','Samuel Karanja','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('24','student','DBM/004/2025','linet.auma@student.example.ac.ke','0711100019','Linet Auma','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('25','student','DBM/005/2025','eric.rotich@student.example.ac.ke','0711100020','Eric Rotich','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('26','student','DBM/006/2025','agnes.moraa@student.example.ac.ke','0711100021','Agnes Moraa','$2y$10$dKbw7W.kbaLF/eLQhoexQufY4NAvmD/0nNOTa.zVlIFwN1T2rmcIG','1','0','0',NULL,NULL,'2026-11-12 04:07:31','2026-11-12 04:07:31');
INSERT INTO `users` VALUES ('27','student','DEE/001/2026','tso@example.com','0712000001','Test Student One','$2y$10$eSMq6pYpHvSROJGrmDtzF.yx0SDOmpw6iATX5.nw7oAGsLw6rlJi6','1','0','0',NULL,'2026-11-12 04:07:35','2026-11-12 04:07:35','2026-11-12 04:07:35');
INSERT INTO `users` VALUES ('29','student','DEE/002/2026',NULL,'0712000002','Csv Student Two','$2y$10$svL5cB7/1TH4KWo20JT6k.juQEPaE2jbdn8qMv46Kght8BhNYKMY6','1','1','0',NULL,NULL,'2026-11-12 04:07:35','2026-11-12 04:07:35');
INSERT INTO `users` VALUES ('30','student','DEE/003/2026',NULL,NULL,'Csv Student Three','$2y$10$blZOKUjpmSt23MxhfWOb1.YMQk6Q8FWLH9h52HIbd1WfqB4n6ca5y','1','1','0',NULL,NULL,'2026-11-12 04:07:35','2026-11-12 04:07:35');
INSERT INTO `users` VALUES ('31','lecturer','LEC900','lec900@example.com','0712000900','Test Lecturer','$2y$10$b0MwhrpQh3YDgEG5kj2HfOpG9uZ9b9hyEObFyf1fAmPUf8saRQ8K.','1','0','0',NULL,'2026-11-12 04:07:36','2026-11-12 04:07:36','2026-11-12 04:07:36');

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
