-- BSAMS database backup
-- Created: 2026-11-12 04:01:31

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
INSERT INTO `attendance_records` VALUES ('459','60','23','late','simulated','95.20',NULL,'31','2026-11-12 04:01:30');
INSERT INTO `attendance_records` VALUES ('462','60','25','present','manual',NULL,'Fingerprint not yet enrolled; ID card checked','31','2026-11-12 04:01:30');
INSERT INTO `attendance_records` VALUES ('463','60','24','absent','auto',NULL,NULL,NULL,'2026-11-12 04:01:30');

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

INSERT INTO `audit_logs` VALUES ('1','1','login_success','user','1',NULL,'::1','','2026-11-12 04:01:26');
INSERT INTO `audit_logs` VALUES ('2','1','login_failed','user','1','Attempt 1 of 5','::1','','2026-11-12 04:01:26');
INSERT INTO `audit_logs` VALUES ('3',NULL,'login_failed','user',NULL,'Unknown login: \' OR \'1\'=\'1\' --','::1','','2026-11-12 04:01:26');
INSERT INTO `audit_logs` VALUES ('4','4','login_failed','user','4','Attempt 1 of 5','::1','','2026-11-12 04:01:27');
INSERT INTO `audit_logs` VALUES ('5','4','login_failed','user','4','Attempt 2 of 5','::1','','2026-11-12 04:01:27');
INSERT INTO `audit_logs` VALUES ('6','4','login_failed','user','4','Attempt 3 of 5','::1','','2026-11-12 04:01:27');
INSERT INTO `audit_logs` VALUES ('7','4','login_failed','user','4','Attempt 4 of 5','::1','','2026-11-12 04:01:27');
INSERT INTO `audit_logs` VALUES ('8','4','account_locked','user','4','Locked after 5 failed attempts','::1','','2026-11-12 04:01:27');
INSERT INTO `audit_logs` VALUES ('9','4','login_locked','user','4',NULL,'::1','','2026-11-12 04:01:27');
INSERT INTO `audit_logs` VALUES ('10',NULL,'csrf_rejected',NULL,NULL,'Path: /bsams/login.php','::1','','2026-11-12 04:01:27');
INSERT INTO `audit_logs` VALUES ('11','1','csrf_rejected',NULL,NULL,'Path: /bsams/admin/departments.php','::1','','2026-11-12 04:01:27');
INSERT INTO `audit_logs` VALUES ('12','2','login_success','user','2',NULL,'::1','','2026-11-12 04:01:27');
INSERT INTO `audit_logs` VALUES ('13','5','login_success','user','5',NULL,'::1','','2026-11-12 04:01:27');
INSERT INTO `audit_logs` VALUES ('14','2','access_denied',NULL,NULL,'Role lecturer tried /bsams/admin/students.php','::1','','2026-11-12 04:01:28');
INSERT INTO `audit_logs` VALUES ('15','5','access_denied',NULL,NULL,'Role student tried /bsams/lecturer/sessions.php','::1','','2026-11-12 04:01:28');
INSERT INTO `audit_logs` VALUES ('16','5','access_denied',NULL,NULL,'Role student tried /bsams/admin/settings.php','::1','','2026-11-12 04:01:28');
INSERT INTO `audit_logs` VALUES ('17','1','department_created','department','3','ENG','::1','','2026-11-12 04:01:28');
INSERT INTO `audit_logs` VALUES ('18','1','department_created','department','5','XSS','::1','','2026-11-12 04:01:28');
INSERT INTO `audit_logs` VALUES ('19','1','course_created','course','4','DEE','::1','','2026-11-12 04:01:28');
INSERT INTO `audit_logs` VALUES ('20','1','class_created','class','4','DEE-2026-JAN','::1','','2026-11-12 04:01:28');
INSERT INTO `audit_logs` VALUES ('21','1','unit_created','unit','9','DEE101','::1','','2026-11-12 04:01:28');
INSERT INTO `audit_logs` VALUES ('22','1','student_created','student','23','DEE/001/2026','::1','','2026-11-12 04:01:28');
INSERT INTO `audit_logs` VALUES ('23','27','login_success','user','27',NULL,'::1','','2026-11-12 04:01:28');
INSERT INTO `audit_logs` VALUES ('24','27','password_changed','user','27',NULL,'::1','','2026-11-12 04:01:29');
INSERT INTO `audit_logs` VALUES ('25','1','student_created','student','24','DEE/002/2026','::1','','2026-11-12 04:01:29');
INSERT INTO `audit_logs` VALUES ('26','1','student_created','student','25','DEE/003/2026','::1','','2026-11-12 04:01:29');
INSERT INTO `audit_logs` VALUES ('27','1','students_imported','student',NULL,'2 imported, 1 failed','::1','','2026-11-12 04:01:29');
INSERT INTO `audit_logs` VALUES ('28','1','lecturer_created','lecturer','4','LEC900','::1','','2026-11-12 04:01:29');
INSERT INTO `audit_logs` VALUES ('29','1','allocation_created','unit_assignment','9','3 students registered','::1','','2026-11-12 04:01:29');
INSERT INTO `audit_logs` VALUES ('30','1','consent_recorded','student','23',NULL,'::1','','2026-11-12 04:01:29');
INSERT INTO `audit_logs` VALUES ('31','1','consent_recorded','student','24',NULL,'::1','','2026-11-12 04:01:29');
INSERT INTO `audit_logs` VALUES ('32','1','fingerprint_enrolled','student','23','Right index (simulated, quality 94)','::1','','2026-11-12 04:01:29');
INSERT INTO `audit_logs` VALUES ('33','1','fingerprint_enrolled','student','23','Left index (simulated, quality 76)','::1','','2026-11-12 04:01:29');
INSERT INTO `audit_logs` VALUES ('34','1','enrol_duplicate_rejected','student','24','Matched template of DEE/001/2026','::1','','2026-11-12 04:01:29');
INSERT INTO `audit_logs` VALUES ('35','1','fingerprint_enrolled','student','24','Right index (simulated, quality 87)','::1','','2026-11-12 04:01:29');
INSERT INTO `audit_logs` VALUES ('36','2','access_denied',NULL,NULL,'Role lecturer tried /bsams/api/enroll.php','::1','','2026-11-12 04:01:29');
INSERT INTO `audit_logs` VALUES ('37','31','login_success','user','31',NULL,'::1','','2026-11-12 04:01:29');
INSERT INTO `audit_logs` VALUES ('38','31','session_created','class_session','60',NULL,'::1','','2026-11-12 04:01:30');
INSERT INTO `audit_logs` VALUES ('39','31','session_opened','class_session','60',NULL,'::1','','2026-11-12 04:01:30');
INSERT INTO `audit_logs` VALUES ('40','31','scan_rejected','class_session','60','Best score 7.35 below threshold 80 (3 candidates)','::1','','2026-11-12 04:01:30');
INSERT INTO `audit_logs` VALUES ('41','31','scan_rejected','class_session','60','Best score 15.84 below threshold 80 (3 candidates)','::1','','2026-11-12 04:01:30');
INSERT INTO `audit_logs` VALUES ('42','31','scan_rejected','class_session','60','Best score 6.67 below threshold 80 (3 candidates)','::1','','2026-11-12 04:01:30');
INSERT INTO `audit_logs` VALUES ('43','2','access_denied','class_session','60','Scan for another lecturer\'s session','::1','','2026-11-12 04:01:30');
INSERT INTO `audit_logs` VALUES ('44','31','attendance_manual','class_session','60','Student #25 set to present: Fingerprint not yet enrolled; ID card checked','::1','','2026-11-12 04:01:30');
INSERT INTO `audit_logs` VALUES ('45','31','session_closed','class_session','60','1 student(s) marked absent automatically','::1','','2026-11-12 04:01:30');
INSERT INTO `audit_logs` VALUES ('46','1','report_exported','report',NULL,'unit: Unit attendance summary – DEE101 Electrical Principles (DEE-2026-JAN, 2026/2027 T1)','::1','','2026-11-12 04:01:30');
INSERT INTO `audit_logs` VALUES ('47','2','report_exported','report',NULL,'below: Students below the minimum attendance of 75%','::1','','2026-11-12 04:01:30');
INSERT INTO `audit_logs` VALUES ('48','1','announcement_sent','notification',NULL,'class:4: Welcome (3 recipients)','::1','','2026-11-12 04:01:31');
INSERT INTO `audit_logs` VALUES ('49','1','settings_updated','settings',NULL,'{\"institution_name\":\"Demo Technical Training Institute\",\"min_attendance_percent\":\"80\",\"late_grace_minutes\":\"10\",\"biometric_driver\":\"simulated\",\"match_threshold\":\"80\",\"min_quality\":\"50\",\"bridge_url\":\"http:\\/\\/127.0.0.1:8765\",\"consent_version\":\"1.0\"}','::1','','2026-11-12 04:01:31');

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

INSERT INTO `biometric_consents` VALUES ('1','1','1.0','2026-11-12 04:01:25','1',NULL);
INSERT INTO `biometric_consents` VALUES ('2','2','1.0','2026-11-12 04:01:25','1',NULL);
INSERT INTO `biometric_consents` VALUES ('3','3','1.0','2026-11-12 04:01:25','1',NULL);
INSERT INTO `biometric_consents` VALUES ('4','4','1.0','2026-11-12 04:01:25','1',NULL);
INSERT INTO `biometric_consents` VALUES ('5','5','1.0','2026-11-12 04:01:25','1',NULL);
INSERT INTO `biometric_consents` VALUES ('6','6','1.0','2026-11-12 04:01:25','1',NULL);
INSERT INTO `biometric_consents` VALUES ('7','7','1.0','2026-11-12 04:01:25','1',NULL);
INSERT INTO `biometric_consents` VALUES ('8','8','1.0','2026-11-12 04:01:25','1',NULL);
INSERT INTO `biometric_consents` VALUES ('9','11','1.0','2026-11-12 04:01:25','1',NULL);
INSERT INTO `biometric_consents` VALUES ('10','12','1.0','2026-11-12 04:01:25','1',NULL);
INSERT INTO `biometric_consents` VALUES ('11','13','1.0','2026-11-12 04:01:25','1',NULL);
INSERT INTO `biometric_consents` VALUES ('12','14','1.0','2026-11-12 04:01:25','1',NULL);
INSERT INTO `biometric_consents` VALUES ('13','17','1.0','2026-11-12 04:01:25','1',NULL);
INSERT INTO `biometric_consents` VALUES ('14','18','1.0','2026-11-12 04:01:25','1',NULL);
INSERT INTO `biometric_consents` VALUES ('15','19','1.0','2026-11-12 04:01:25','1',NULL);
INSERT INTO `biometric_consents` VALUES ('16','20','1.0','2026-11-12 04:01:25','1',NULL);
INSERT INTO `biometric_consents` VALUES ('17','23','1.0','2026-11-12 04:01:29','1',NULL);
INSERT INTO `biometric_consents` VALUES ('18','24','1.0','2026-11-12 04:01:29','1',NULL);

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

INSERT INTO `biometric_templates` VALUES ('1','1','R_INDEX','simulated',0xabcc49f59f654b60ca9d5d20f783dfb368f56016d8b4df119bb9d3f5f110a60e65c50cf5c255893c933e4778f2b5206a7c344afc55fc380817b87ff9e58b82d2aa5936226c7688375e47a22d349b2eb949cc92e2a978254b9ce13b03f1fe11dfd226f9e601aeb266de30feb55c5c2d827fe2f5c3b46865acd97ed6fe1306548449b8061b10021861d4d2362bd840fc182acae387c4360f128181d1fe139347e5214debede494e9421a8b3754b9eb4f05f33ec3f0c9f8da107d7352c414da0f006dd0be885dfa824e6f94b04dddfd1d40acb55e3b32e568d9664a9374af67b6f35663ccfa6de0a05fe7efb2b6c4b0d941bfe3f69937e4e0c1c59e37bfe3d58a65995b5ece613a6d9d14988ce9013b70e0ac2878d53c3d820018cc319bd097416954c447d3725e2e9212b7652dfd6130dc79431aee051c690291c17d1e78d6d5906de5e0c7e9dbb7f4b5f7db2bfe2da20913572ff1a874dd7ec1932e69f0b9ab1e01dca11bf67c4cce6ee7829937f38c4fb5ac53a64cd909c295d4c06813358b8b45a3534db662e17f33d1ca5dd5e77babf179aa2ee6ebaa7823bc16c4ea16cbcd39f2f82fc757388d59b198c758da835292c23b6dabc9d3e7e9d5925bf38cf7c0cf73cd77c0c177154694b26942a30fbb5c7f05a38a5050fb2328ae235004b460bb9e8f3cf2c2838bc3207c03f3aeb4550c9cb9980b,0x1d27c180837068cd4ca22256,0xe145559e1a20bfaa90c66314905c636c,'a2b288eb896b832c706311509c504eb2a86a9413a8565565c444c81902ccd4bf','83','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('2','1','L_INDEX','simulated',0x7a2c73c987a54b3672b8a1656fcc5da1571cf067c53a38b05c8e1d64b229cf2dcd8c93661ff2a8a00ad10e20f8bca6b65355b9ef481014a9841ec22f55b407bf8625ef32633b1be46bf03a003c3d92ae738b98a81194bf3c75d0ac7bf1c9dae37edbf9d69cb2c047c15c4b15da96c0a3bdf4056d8e426e3914528a4ec71dba83d220dbc6c40e9afccaa55c41d58aecd0085a51d31798d8a700d14969875336099e7aa8f8f9f156373fb5583522ef8111ce4bb6b6346bfa30bf316ed40aaddb7403f4f1a11085c1f2fb6b4b5692743fa1eef803c3a136c99a97fd4755002b2a7c94cb6de3984664b6369e26637dd5f8b2e52dd3ad5a3d6493de56507cbe5e65a6cefba3032a5e62451ddd87593a03eacf76af0f1d974a188238fd9367b6e5f8303d7187ad4644539ed4ac0dcae113138038028af794b8a83a904771946400a2ab60e696a6b8073f1b15369fdc88f1339b14a057c1764e8bd56fafbeae84beecdc159f2e37c36ce7ac660f82810a59a3403d5ca4386570d854e624a3dbbdf4123b84ef61d9515f3a5f38a40c1d95d6920f794d8db9b3edd8c45b96d6fbca67765ea0dcb111b537736b87531dac9c2c70c3864e9b85f30a824d95a7587fca3348453516d9ab35e43b38fe891a2603b18940dbd700d182d9233d3d35c884e65fe8775b3328dc1d7804638f0c88f7a1bffddeee216e01,0xf0020f8be863172bc534ca94,0x822709e78d2e31c51234f1d37e507a57,'e2e46f108bb4c085bd9e5410d4ced6b8c59bf590e59339d5d1405fea5a4e054e','86','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('3','2','R_INDEX','simulated',0x0fc4d6981e49ee7e38acfaea5cc5c7d144226035b3e2a62574a89e7ea8d150c1b7a42c32a90eab7c34a9dc06a9182b7da2db61767ffde897cc71a494a4fc18b7e2d16d1946eafba6456877ae7cf38083549ed8f9c7f69b07216768a27601b54d3f1ec3590efd460a8656ce752d3d2db3b8bf3863b66341ba306a1e4e1174f0418993d4728899e7230f42840f25dd98dd59d36630519214f8a63d63bbabf4ab66efac75d0d6934842f9525b054226553d3af997dd4716dfd2f07d49cd1a629e1f4d850a7ca341c586ac70d7bbec8538a9e3fbb0e656c3b053889a74df726f1eeda3845c4aea6f1572e32fd2e3a9ce465b7ec45a019b48fb9e4475d0a6de50e1e09b1f997c381efea5387cdb323e29a3fe2a9d2a41e803cbea9fe857cc87908c8c432656d2b4b38c0c5dc75d4883cdf603f170388068e224dc0f52d6a3ef52c274744c4314ac7ce0cb00cf6880b92173a989cdfcdba997344448faeb273255877fbd880394fcae0490d59b6e94cc275ba5bd07e03eacd60e88004e1fc217d44bd936125bd923ba6d2e38391e0f8ad2b053a347df00fff3c2daf8534d0af01f03f27e7de1e9dc6f231d0fd37ae05b593e797963c6cfc3b6142718275edcdcea61638c715da2d3d0083914037267c7886b931a2d36697f94c08003af1185df887a0de2dfce9c818b3dedcb122f38c0f83864a253d31992ac7091,0x0247fd81417211e4e8e9277a,0x0dbd829ef3ade9bc0d547bea1b775f7a,'c59e0c23f6fd70acd5c35d6fb348b100552718a601c9f1e002d3cd14a0ba0302','75','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('4','2','L_INDEX','simulated',0x81f381858aad0853ee866884217f69b15a3a2426607d0a28bcd2e623020d78f117444920a4a73c3759242de54862e1e18a10b685b3c923b0b0aeb9def49fa318256da0f411e56d80e7941a3751ed94a688fad948dc2eae5af99ba202e759be36744b6e32ff1ca2fcd953b16b961a52baea228d283554b236664654ff09668a564e1ac973be8d2584082c206fa1fbd4e8b00ed1a74677c3ebef7b3f666fe321e17a2a6393822b05c958a1b2ee51bc970b7133d62b1cda60d410d2cccaefaab33dbeae835b1cbe23c924893f9272cb991a37dea12c9348129998dc22091cd88c43054d279b572eb9db2ab279b9ae313110192d88f34b35c63132cd15269c8e04575b5c4c62333d5523d59f5ae266c77c67a8efd60cabee4f8cb1a018ec1632d7f424a3d0d348cb3ee8adde0dc96d298b74d445fe69ec9e61865a467351f8bd2b716e5eca3717df35737b8d86a4bf13873df7c7649490f2622858aa79afa652885444f28dee4591317025df72fd4d57b741722723f228cd3f26f0a68efa3b2bf477eab1a796533257efd70d1b8fb3173fecd63c05824871f59500836d5b1bc5f7f500e5af3c8cd16ada546fde5c6ee887ef4e8413c8b7519c74de305bc57d7059ccbc475e25bf457511d428cf22aaffe84d7a385904c9dd3b917bb3b1b591953cffdc21c99b482065602579b16ec4ccf3b18d564249171af3b5de5e,0x883b55fc21235ddf2c0caf23,0xff3ab424ab396b5355fd05a424d30be5,'0a752b94f403045e158e04166fc9c92b5ae67ecb0046eeb8f1a11ca460e6e732','86','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('5','3','R_INDEX','simulated',0xa6c0e5adc9f636e7c78d520d96a5e5ade6e5c2eb9b9cdff37df4b1dc0c66c977b26ca247a0a99cdb0d7534a95651179aab070b9ec81412e2f592d972752f00541f39f3908664952510be5a702024f5d88edc63820457358883d7044c9b5507b892a68a8276765dd7bba3bea2ef0f5a7b5e36b9b82eca37240f08c7d961db99265249c8adfaba4041d284729de0646ee2397e5934535a25004d033edfc8a262b5a70f5e6a3fa90571bf79cae8785c1aaa5b84a6c6669443ae7aeeb25029bb01f9a11f6347b53331938e47c7efc38b11fd6fc2e65d58cb2f229d2c8574a7399f178b0b59891282b7e040c5fde0fc0ec78760ab4b7d2eb34f583c864486ced08b95fedba120e723bda80faad9e83ba5b7dacc9f04f36e4da2fbccebd651fbebdfcc24506fed232dd65ae8097e56fd83caa646a526a9b8a1de83dd5b6ade6730c145472df24d441c11b60c4bb48b8746487a167f357bfb3ba21fa619d1140f27bb039387777345258cff10b1f1d7be8a8cfca4f60b94dc2d80e629c9307887328248241143e8311662c08d4ab97155f537e35d060212cc951dff0ce020290ed1c5c7343027a651261083a0befcdad40fbd732da8bc9cac98e3bc76e569e985026724f31e910a4810cf1f29f99d9309cabd2aa5a569a06fe6904d96232d7d88c882ad3c5abf480acded8e783733fa7b2d7859c5f6bb091bbc271da146c576,0x7adab805e0ce95e8aac9fffb,0x25fcc9c2801216b4d47910cda3064497,'c9bfbfdd9b0c72068962ae60c2e94894d7bf998b2cd7549f62e4c776ae1b2056','84','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('6','3','L_INDEX','simulated',0x9aae17f65fa66044ef513ad326fc8e91a9331009154bab3a7edb50180e243731250c15800b71c866246b3d362c2c605b5682c96ba1c76f598c2049a6bf9ae56793ac8b79e815cc5d3b4433152fa64b7e5b34711c151aaa72683afc535413adb25e137c94e2f2c1d2946d3d7dab04fdf38ea915fd6e1f6e81b7bb293be728941fe927fbd515255cf628b09862999cb2323dbb2d8ef6401abea1467161f30879a55c665189dc029fb43b4c2c87bab001e0161c11fa47f32aaf490148602bd9108ca47754624626c0790d6d1e4629e8e26d1fe8ae859f2a3bb58bf218bb224c915b5372f20feb59d15edcf5647ba72c578ef553f1eba670eecc079c207616a353df35260c4659284a817f08fc3d5b9e6ac539ae5a9cb187c39c909886e965c363ab4ccf84a1ab2dccb0aab3db92c41f05117442538e1a32a2cb23cf7ee78893932c0214b8f61849cf918b24b23d46119d073761df9da8444bb667571f8fba384a38931ff9124b03b0cd6643a27c4eb8be90d73427f027322bfa7dba8d9d41a7952519a8ad75397e2203a09adb8c05d3050d2a79f703855d3aa5d6cacd8d75800862f9060a191b2ed48da9c18d5aa6d17cd83f8cfc81df44558a2197d9be61838898bc4fb1faf16af1a4f5cee03bb73e7e9194312725d30f0650e7f50287809b94cb2f6affed673fe998ddc3576b309b8f8e,0x5002afadba10ed1075a70585,0x585ddd13a17bcf03a18ccfce5591655b,'c083631d52321a651ba54986f83694c761622c66fceae73b30eeb3d7e3981ca9','64','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('7','4','R_INDEX','simulated',0xbd34138545f6e740dd2651dcd21e7e31d941c2e6c8e496960e8ba499b0877f7ba98b8e5827030908eccc5517acec1c49036aab366905be8be0dfee38e42d4beb7b53991faf1b33f2446597bb3a4ed5ea5be98be7fdb6b621f12f77624d50390916a10cbf5cf7959b97eb1737eb79f0e709f9cc4345db60e62dcee823da09cbbbe8c51f59d2d5a0b676aaec2257ef6b2dfb16f2ae068826b3b45058260d8b7e2341af6c878b2462b2ec0936bf14481689d445ba8509d28d84f570707e79dd2571291afcd3d5526a4754d35a28cfc17672dfceea9be74b0d896a7238bd3c14b58eabdc822801b58518f4d861e7230af64e4043095ab73ad184b3b6f56d2c2dc82bd192f62f2a9fcb9aced3b189ddcd2d6df90f71c8552b656d5e1a7fe8075d823bbbfcbe2d7672a85e53f35a9f795f9f5b6cd535a241c1ad1de1877d4f22e52cf61340c7a072d6939f2d79d3cb7e24fdaaaa9aad1ee4faf6bb7486ce112651890861920dfa7793c186124858b018018336ad91fa4db133dcf20b21061883d98a18686f1d89a3a461095c3e3e9136c8b1a321901cce60453a6455dd90a4b7908b3fb83eada5e0ec6021fb14dedc528481189f24aad2e9726f7929ce7fd7a2d2ea8dddc61d119d4201267b31973805735532b26ce813f7ed53d667b2ad062fe7cdccc3a2798c39ff283ad1deb2adf1337e2e8570,0x5c5b010dea2a7e7685d024ce,0x26a3e8d2060385f7031f6b22d2faf550,'3394555821fd78172ceffda27057747280f2b9f98393883a4425da6f402c6267','89','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('8','4','L_INDEX','simulated',0xb92a488d0b141b4b5d7d82f1deb987ce8f2ed3e8019fffd21609d2ef7d2da4f05e26730f64cb2dd273eef05844e0c1f1ff98b3fa392391e890022f45f34bf248be113bd5569c5f5f81d924d01669bd067c9fc074424d70d9e7ce3e2bfa63d6426702ee6a55a2340ffeb8c8d9395a9cd3df5e8fc2593e1eec38c7c797788c4ccca69b3f5c3e5f97735ec3830387fd66d3118c6548699c6f185a88e2ae8a027214f24319fb96c13b623bf9961e345a15b2f72f1c6331e883ec61c87413fb301d6d49dc925d079e17e3b593773d9ca2e7c0d541024d811a794dd8e968262fc925b5b3fd52a70e0f1ae6a3ae4606fc6721b2a5c2605be079595818ce434358786f0481b5e01a6c3b98a7525654c6084fe9d0d15285ba5dcfff85ceb7bba4ec2312dc5fe8a9d9b463b7d53010d6ab892061a6e4e6919d03d1f9a6c436f9169da1f3931b1ce87e79846a5a3da1d0e9c2853a8980046e1c6bf327f72313ba2a67c2228e1f2f7a447a9897c94862bbc4ebf3fa1939efb3834b91a04cba7493005a0c6596b484426f7d18ae7d2e44780145cc849f2c12cebaaac44d40c33e9ff4cf8cdb4c90b33e758c506e765aa2f702e72d06d054cafde01061cfd0d8478af02efa853737454d28ce260103b0c68006bc1a5158c7e2a5417940ebc81259ee96b1228f15fb7c2b73aff2b135e22e29ab12923a1abcb1,0xd8874381dd8c4e3ef4026716,0x48852332984b83b30a57ea662c0f28d5,'a50e73674752afbc4ccc4f2e662dfde11ec73f6129572f90b80a9d0e12f907cc','70','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('9','5','R_INDEX','simulated',0xeb9c6c0640b1aa7ba85bd4a1386323556e8f332bf6cfcfbd389e139de1bff0dd3dc175b34ed8295a391bc4ea893d7b300de67a5372668dc8991c26c2ff3806d88436594cbbca0f136b772c2a321a31c4c87b5134ea1922af30531b149e5dbcd84f13566308c6128fe6baa64c5f82d85242d334c58f20a9286ca9a8ba55bf7ef28edec4ecd26b2aa2d0eabbe39b5cd67e128b3f3c5cdd5e086fbb7a0a09c18a67100f04103b52283f72b5c9e5cf94b0b0772a477d0c73f4ab894781aa76aed2cace38b51df9d552ed40562bfd5359487799a431dbb78ff31cbd812e60ba59409b82a756dbc624d70056503a4875969e64482838ac94d6c01fba757fbee224176f8fd3e5f6877e83a6778f52993661cd37faf04b9db62d1bac92d0dbdbc2012f89f6c3f4cd6551894536f529cbc8e55a2da46948c3b4bda92f7787f12b162b68968914c2ec803f56d891aa9ace118f553440b19966bb067d1822639e76e9b8f3ab940734a93691f90f686b622aa73163c9776dcb6b89730b543cfe8f930270b0462d593515d14f18ac909a1ce510154522f45fa80cc7537196fb6b93e97ca537e030c7a7d234aa4b2c7fe44f209b20d29c77a01d4250b2d64f2c4d045cffa2ddeaa03b16d7153ca6706f40e1b543a69ee7c89c163d84589962d1fa2da46f70aae173c48d539bd8a20abbbd537fe9609cc2d98e70046c,0x4d8c308cfce565d842597386,0x5c7dacb9d80ae6faf7b3d21b23c31f26,'efd6d65f99b57cd47ab4acbcc6a30906e5771944fe585afc5e91672c6e2ff177','72','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('10','5','L_INDEX','simulated',0x957fdd0b70d42bc33d578f6383727aabfb7023187ec45223550828d161bcbb9418c86d42c90bab3ea53316c4ac344d0733d575f8c3b123352accaa1087fe989e71dfc5adacf670e6a6226a13406c3f2cb57aa9ecb89e6926b866118b9a040a72aabc8c97c65e6c506b5c7e20584f62a06405f6b6b8bd0eedde2e4678fc2140be47f04c6cbe97639e275d021b41f46b78f91b34986eec75f020d7ded83522c32342e6f25622614c88b3e79bf968a527d6e8e68221432047ca227acdb2dd23b703b5444f71f3e021f812a389591fd73167cca81240c267914c5426b1e168c6360ee3dde969c9606d2cf7bd6588fe1f6ca472e97955ba0b685639802c86dd57014453112951cfed9f38ccdd95b72835df7987b1783ca9857bea0acab26cbd3998ca1a1a93b5dd3d534c63e077c665c3299039470561b062e6738506fd7c49fd3ae7b58cc0e39555e81937f265c03539c9e2b197c43ccef219923342f9eb39b4dd3060a662037cd503ec7590dcc077d7f8e454d0281ec52820e677cf06aaa0187926979ed6069cf9a8594890bc7db7626f3d0271fb47cabe1fba54e7c4be89895d609b3c03a81f732b6048c0fa3724f5a7db6b9eea40d8c3c870869fa418fe9a1440326b9b1ffedc9c0dfe993694f874b462e8e24e2bd73651511c48d65e95332b42e9b8a8bd3308e4e9e2e0c2047a3fa3d57e,0x0390058909489af282faac5f,0x00b5ff2a782a2334f941e0bee619702b,'ca307716610ff7e8d14559ba463a86d70999b1033fa25017b1525950ffbd8bf7','67','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('11','6','R_INDEX','simulated',0x2348b3cd8966bf5199f42117913517f85dc82522657ae75ae95cfd5c14a56b0bf66a9a8690307162d8b59db0917764a476c2395d3aab7a93e39c4d8d66d1e99e3c4e0c6734533c2eb64107157d526d1f3d5d254cfee7e8d9096f0b893af41a0b4b31ed96788bdb5ed70de0528a2f6fd8d2c20e7ad6c5cd8ab56b6e3e23cb8ed22328f361ed9b4371f472990c84452d29f0f2b216b82534f70f3ea4bec1ed26fbfb804b23e11d3e7a66bdd317b6a44b99e909c16ceefcc96825f402d016d3eaa4b334ccab22c39388411ae6d8253e00ed8f25454bae6a3e4ed20aa3eb6b731c9a6f1c318996bcf27f8ab69db41d1b5072237231ec7ba2a76804ef8dee6e93329cd1b296e9bcfe9e701c01891a951201fcd64f704690a3ddbc6a2bef579660094a41a15cccca812a2b5bde210afe31aecfc7dee6b16bd459c37631813e222930ec4ad2ea14839a341b32d8d71429c366c9166b355b10fd351b0e9042eac3392e57699ec418b5e0cad5f3f783496b22b452064232e5d958d49a382daeed7f0efad87c91e351d9e2f1f9970768273e02b776a174f1a0a02271087eda7c73ea55204d3c67408a882c7764b79eb3696228f174001db12a082b7be07ba9321ffea054d12bc199b64c6dccbba06a6e9c35290d2a2297f45435aa166004b4dda0aa2d8af201b00d41830e860802070f14c6,0x39578fb2a2a8ec7f14672efd,0x873477e942fb4d60104376318c094102,'8de7069df58dfb9824aac1e96ba41cc5eaee3cfa205cc419efd32646fd23bc74','81','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('12','6','L_INDEX','simulated',0x18d593c8a55e954b90dc10b9f8a89a1e3f52687324fd9b6fefc841eeed5bb1cf4b347ef00cddb1201f24b9a69fcd501dbae6994626f1804c86d66d1336e0dde2960f6247b3a4feedf4fb18ce7d882c7613f3288955bbfcb09532b813f395c2dcb4d768a610038706b3c87abe048c1575afd0d8aecc1129b98e9b65117f001cf1bccbf64380ce968151f5dc4abdc118bfc4a8c9bd173bc43c2504417e7f423eafc4654f638c6561e73ac0dd8a4300fe83b645673d6679432bc79f4ea0c2ec6d2593f6ce5b38b7661e58a1376694323e8dc5f72fb027675e998736e4356e376c2c2070488ce9dc8a727c6e81680433fd47f606214bcf48197fb660a257a93672dbdfb4550dd497c7a24ff5e139d2a2f836641067cb3b0c809d1b7acd2bccf27a128110a8e8f0d426239db76fb0058059848258fc256d0a855e9a10a52d32191539fe44803da9a5bebbf82029f288618a2d2f55575e3bfe19ba50a26b2083b3b96de9593caf41032730a2392cde2ca0d55f332fda42c76451f788c83d6a84e40e73e3743617e18536a0a2d60e59a095e36c193d693bdbb7c4461de45fb1768ba20baa3cc0010220f64c888667686b090850b6e416092f22d519e2c99b54b7addb449d3d4d7417c26b16d42b77fc2bd9f8ad0b0cae9f27143f4e9f566a7adb1b6e9a1dfa9b0bf857863dfb449600924560c75fea50,0x375508d28f242726d37b4779,0x4c0c182e24e07ed0ed7eb362b9a887a3,'9bc4e918e8aeab19c6e88580dcb2123f75a998c9e0e3c2983e0467f3f39e2f5b','84','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('13','7','R_INDEX','simulated',0xc1563b2eb6ba8babb9c3dbcbb8a70265f7e3c9c3440ba3908a911ec6f4f24665d25f68672d867f227b963d11b9e3fda96a9a399e3e5718b271dcffe61cd0c3e4dc61df924b0af363ab909f7be79d89493b6e71cc8c94d4db3f142076776a76dffa1044cfab79cf477abb21dbe9b3f4464c7bc243b5c0a16f9e0084714556fe6b0efbc3cd688a6e1c75c89649508a4d177d30eac2546c5250e58c8641839c7f4138b6c3b26a309ce7c5305079bb76ebb25d2f6d78511048601c483fe1a309813fde66ee1c5097a02d085f7b8f0092ad74aa8edabeabcc76605051a703eaccba8f4c48daa43aa45116771124707a55a45704fe4db33fd06672bf24cefe460248426d6d2b7115bc71ff32f680a392ad7a7b550c83eacd722d6dd7df1d8152d2f6fcff4fa52a8cdb134b6154ff98131bde02f40155b333a6fbaeacefe61d31b74ef66687803af05e3d53f10e34eb5767866abcb4af2c9637a3283f7974676804d5f2d4c85c697bd2ac37affd4939a476471c50ea6636684f7c573c7d0dacf79c41ce35a4b6afc749c87d862b06a37bf7c470ed044c2e980902bc60ebd6ef22e527b86b210bda5770f57cdbcb7e49556deebaab77d97a64eefc7ee5e96282d7b813bc352306086a485cd30053e9d48da8dba5712f89ec64004eccc02539c57f4fd3ebbac5fd8388e9ce6daf5e71940b5a1f249ae9d3e7,0xa7e645e4304a63cb0cb415e6,0x92e28c3a991ca2298925904338bad4ae,'aac517702f1cb307be6a77e9e4f9618dd985bf1ac336f236ace9b9ff32662bb9','74','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('14','7','L_INDEX','simulated',0xfeb514422477cff65c8c78510aaabace7911e3a1cafa3d623356f44a407c81a948256cafdf7ee3eccf0f9d8710d433f796446e72f63eed5204b03e179b70dddfb7ba805b997fb107ef502fe0668e9629f917fddd09ffc23a617d8f7cbbe689bd1014f80dc44a8579a0f01e4f9bad87e176ac4c403e456340d3103496b6f7e7960c3dcf7502c90f271f15a8aeaef8eb129dab6481baf059d00948e70c31cb151ec51b5a08142121bd7a014738dfc4aaa481fb572b4e7c0ce9c41b3bc68b47e17c7f3a14be10a81aaf3e60640c5519ff97a6729f7daa087261895e7a85974299165303f7ae2e291d8847de8254207e96f266c07f250bff2c39f8ef05549313ac6b9c4f81549fc4bc1de6df3a5e7f188de23d267d8ce3c1612582fbef08041057d4a8f33a55e164304e11c827022457630d1a6b09cbd7975e0c4c2d2478557f0679fe0b618d6a225934dcd15bfe069c4226b5009a375f6fc0759dd2a7732239885ba435cd8873bc392160f187866c7f137c56e1c6d16564a5baf958be0ed9f3c2add77f98a89ed7521f3d34d5ebcaf7f4dbc0b9f23b5cd8d6753280cce11fa184c344b34dbd40dd71744ab1709db602398dd33a579f80dfb358612f8002673ac5bfbb2ba1d04802fb72c15ab7cfdb9ef7c74d61a798ba14893ad430bfbf239542666171a17596d5564fd18349d8035fa98190e34dab94f34e,0xdaa7058f2739f63ec3f7838a,0x534ca155e3c6f9a58f93c499bf829ff9,'6400270641b5850c9f424a973da21fe606883ffd323d47784e59540af02b9296','64','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('15','8','R_INDEX','simulated',0x02fddb14222a0dd9ba58e5e7ecb9dd632b4c2070feb560a18c5d3e70a23abfb4f35c8e7310ac4391289a461aff75f00aeee6d0263cbc07d7226c8f8018b47bbd9b5c7349225f1ad1f636bdfcbc21bb6a982d7995b16303ae1ac438034865b3a47f60fc0276e5746fbd7c9394b5ed32409ef0be58dbb8a173b028a40bffe07c33adb0e24a44bb3eb2b9980593a1c5eae9ab6f763094dc1dc7a4f339c73f3acb83bbac5b3c647be2d23732430246d7d64e6c668aa63b948767e7bb9deb30d488d90e047da7ccbe8eab40d6214789eefc176238254ca4dcfc50d5eb11808c470cf4f6265389b497785344bb0e258a5a33c0d3b15ff5e4be6a46ac089a0751735e780b7969a447909d8243500e5821cbafdcc0e73292de458fb230a10a17d55064cce23b08c8c6d8197dfacd352b9b0481aefc1c081eb49ddbb3fa611d0df6200cb0662e70e69340dc89d906013cfb61ae3a058c6d0a376641a21ad6c308119d9215d293703369986ed3d58a05fff24d30c1d40ef783a3bb12ad33630771823f6ecb7cb66b2cdabc164b503cba6da82ffb01c81832d6945ceb75b0be3523fa477d8e7e4866c6cf3631f553c3496d7b706b7d9d36b62b2e9a620a9e8d1b6f4c5317b6c8418107fef523829441e4e008cf1e1128327915748e4c8db6a660446b31bfea07329e40e784f3f321d5c0f18fc92387382bbe7c3226,0x7e184a056a4e79c0263ae2d7,0x359f2f524ba79fbcfeb18c0dbbedf42b,'e1701305b520838dc70484e01cac762531cbbc30ab4c3c378ae9dbdb7d5b4009','68','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('16','8','L_INDEX','simulated',0xcfab700acf07cc5a89fb5cb394a2aa31c0c63ed73be277d82803fb89ab17ed5ca20fa33647bfe039d88005ed3f329c0479627b8db22d8fe74b1ea1a79efceb2c08d1a102af5c83b21fa03f9e7ed9d299c415227dff221e79d66b4030b60e666df9b488f9e2f56900431f309859e1ee70007d9673d86c77749257cce8e697022f5e2f8494c5d6929d692554dfac5b8d7d839f377dd97c8efa149828345b9482288ed5d74220076542baef2368bb118436a7b6a3fcac53c77e04833ec1817bfa68fa48f399acfb8e662734136daed69bf140cf631c4caa495f6cb38fd736be86856641e52810b0da07bac41e45a5a16d197d8b4c663ea3bf0ae1b738f80d9727851fa052f3866f91558904880d5759a2c83d660afc34138561fc6ff3a6b718b9f529c4fe5e400ae5b64ad2e19b09f9480c89d16022d052851e3ade7996e013af21897b970901eb07be1e3cdf0f5f58816754bf7c758ef1b991d648cf7f7b620e0c6145e81abf1fbc3236760c1901a5cd9fc192e4db0eb2508f6fa162f5cb44a3c41101f208eebb8bf5d6f867a07941161bceca594d8c36a452cea06980f650092028c3cb5f8de1a3651cdf0fb4b96c8842202dd27e10d5d2de958fc0ea13edff0185e584869da0d19b763bc6eaf89c5777a0c81adf81a1629821dbe5e647051fbdcd8814903bc4ac6c4bdc2e9cd40c0b9ca9fe736baa757004bf,0xb71b79cc5dd5206eea56f59d,0xd14b2dd3b20af7e526418e395da576d2,'ec9da313f04048519a8160c23f5141c8d19c076a2ee9d68e8c4faa01187f2741','95','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('17','11','R_INDEX','simulated',0xd281c1078f4e0c9417efe321cc8453e53549c184f67226b9534f512ded32f5a52133d0baa4c3d92b00be3e6a2eb0b4649012bb392404cb0b8193eb3312097655209d96476c4ba20705c53b86d764d078393a454a57ee687337b654e3c9c6f935a1d15c442294033e4f6379774d880e7eaf28912903f0fe4031cfeb0607c1f11ad07061d3a290d8267548e06dd73dc8eeafee21493841e310a2a2f372b5b2a22192e36e774405b141a06943e470686b033b737ead8c2ac51270860fd4fd6d0b1ee6b696c5a6f149a9e2bd728ac3e060eb45294db7d8ecf75fde800e0abfbf818782c7054793531021e9e2ce6329e994809139486f7cd881a990b8fa9ab6a03009826b257f8f9a520657b27434b52cb4ee0713f835dac51061c0e319dad870778e21863a57cbfb83a2d1258e08b72ec0d3a3cfef5edcd4731b092194c78fbbe9bb97384ecfffdef6365be5cfd0c6723ad52e113703e9cd162c6325b837b54fa460ee90f0fbc768decf33e7dacfb7cb149690290fd57b3b864bc15e24b5cf79d55093b2abc09734ddccedfd1e3d29d6277e5c0288acfec715d40a8c16cf4e73c06816d8314f032c3cf3d6b8a9e24e7049bc06074fa75e0473353a7f8e54d7951b6e0a947cfff01ffa7347bae3b7e9673d439863875bb0f32f295c10cca164ab64f7ee881075daaf9b2814fd42b2aa631424e4e6b13e74bad3f3aa6e,0x34ba4ed0f09b9c26e256f0a1,0x2d238ae32f8155f262409bd8e98d92cb,'95b690a137721658d56fc94ef06dd17a61a777171a9acda85cf0ac61bf1c5262','71','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('18','11','L_INDEX','simulated',0x23e7e73e82e2c9386728535df0af74a5f02c04fd94a0e22718f06405f551661dbe76a0997137fac4000b876e855c79e78fd8e1489d392ea898e8fc6a294e147a3d84a8d0cccfd58d5b292aaad6ed5fc6026f5ff9b3e5972372d755e36e8d5b2c5fbfd7c7080a6668b4a2fcc9f2683825ddec04f3e4827295117c3b2af3e8b988934971b8cc849171262ea4f2cbdfb41159daed0e3e7d7296720d6cb3cf64161a2da24807da8cc2384eac0b028e15deee579879cf1a30c9ca5ffb5cc39277e6291dca0e9b358039bd0b889b6421d388c7d9be6c78c95a78c1c28f511ff3d933af42118766c8a23096693e9674d0f1825d5ac1ce2b85d844ce2220deb2ceec2b22e906c01b28f89e6e7642c3357ec3b335efd064f420e8288eecb687bbbb128ba34173b52df796c75820fc8ac88b6a6f76f190fdaaad04ee1f61a10043970b8a3b8a33e9f975bdca1e6448e6235a089760471d1f27e92ee67efa4f0da599b286be790cae16253c0c327f5bd7b1b15d738390836cb5a9b6056f84705e66393b970f2541bd19633e58282b8e17961c4ece64366cea0de7f98f1e7b1cb7bfbf919d69e081426be6d69a4f0783d5cb7be2f985adc37543bb8a54dd6159403ed5d2a3e532f8ed4ba6d9ac70c290db71b692b897d1811875d4d36722cb5f3854146c528510851b55ae0f881364f2e2883ca8931341dcda057cd033,0xe260751cd5dd9d4ee79854b9,0x0a2a9e197be0a933051cdb93da9f81d4,'4d25573374ec0f1ad8ff8bd3d9d2aa22e6da6856904f97877ead8efbb8d0398d','71','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('19','12','R_INDEX','simulated',0x83d05672f9f9e22f5f8f9075e8d204a7e01d1255668fdbde93b6b3fe53af5381fe4654f32a5bdb6d9e05df7fbee563e8c1021ec79acc9b835ef39b079bb1a7eb9aeea9e5e75ba95fdfb75210d37ba212247357c04992caef27be565984223c69ad1f8f432acc3a3eea2c15193d6b06112c763a1d61bf8f8856588c06400499523c09b3978e7d881b67ac4c41ea6ead4b4e56fd4daaff0f699435f9bd55a2448cddc186a3f844f63849cb42a579feebc49ea84d972d519d08a63b6a973bf732128b7c291c3ba7e0d51c55792d1c3c41be6ca113a5c4b886a0b362ed826c18b023441169807a02066a0493a8ceffc91ab3cdf6e5accd1b72a6d4902b97134903776ff99a7b12420c9bf6e92d30a5120371a11cb360ced4470ec78de6a5c4d30f7bca3e62ba5406a0159c46a9fc2603b202cd2d918df4fd546cafe2fef882de14f29415bd197f9e005fd12c80787155d0ecedd7fe14f5fa057c05f7475841bc9a707e86c5fd814c0962bc8e7c7f0105d15bc8893f6bb5ecedfd2f48a6231a7ea6b92d41662a377ce10d5b82e8722c53074799889bdcd1e48909cc02f04487a8338bbb09e13e2398ab05ecff9c6fede7b5aa66d3f6bb561b70fa8405dc99bf6f6ed596ab22c05ea191279db82d41783624da90f4ae2db6b25acb505b20c7a3618c0a6bdb847264bcbb0f2bd4c9832230844034dc3174e2f08fb0fa60,0x8c299d2951e33a79d7114b2f,0xb334821f54a5aeea13cc8d67a5b5314f,'b5a767af8a33542a8ab93c5d3e0357ea9e9ed45f308725fa788ee3c76cfb8dad','73','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('20','12','L_INDEX','simulated',0xc747722ea819acb8ff0aba3f7951609fe4b7a12fc5c6081dccef62b2416f0d2e31ab25e5b755b0c27ffee0c61d062ddd8753380c72a6a1eb6d94d1bec83983fbc876f46748ad3177b7daf525e051c105e8e5e796675f6a0da19603eeecfdd950ae15b95c1bb6c5d32d66187f1d5bb6fe6fdc0c9a2bb251fa8f73a0659fd0cc0f03c202985a4e9c74acaf1804c7a2a5a86764f8b595458a904580a4ecd5f747e36fc8fb566c11fd4d759589f09dd9e4904a1461e6550bd1a61f9449c603d32310f7b999d9d056500fc0bf4d6bfbb56b9323435641ee802beb26de90d0509724aeae167550c1aba23c2ed97e80d36d32a6d3dcf8a9ffb6f345c7e479d02a5a5fc1ad1d026e1b8d75eed7aa6b4a0410de3c5d2d9f4a13140db78b515a2ce0b43fb6f51e7aa81e430bd884cc2ca6233b2dcc0c818004da7f06baefb9a9d9d29674cfd0723a6840d521e0a08b6d4c42c573965974c34f20cff601f809cbe15eedcc6cbe482732723170fae613abb7d01d73511b81d173e971659512e0516dbc197971d734ed06d18ec556e78b3556d665e87ead2192106ac2b84b4f7f005b7bcdf74bb76af1253663f3f4e4943783944d4b90c7fbd7777963327a951f10d27f5c7f3fe4132ccc5f4ba640328dfe5fd978d8de845f150e1ca6b522709d06541054f83034fadc94d1364ba788,0x2bee4c66cf4bab4f78ecd8d2,0xe93740ca6197e12c0d66263b86b31054,'601c6548e6734845538eb9c470db26f59984727c240548cd81ff901613561dac','88','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('21','13','R_INDEX','simulated',0xfdfe6eff60b0467a77954210ed25e808be095edfeae12a5c80fa9ae6ae03aa8c3f381d30cc0cc1c7414649de1d189393054a059b43b242f5999e238ca833a2958c11548cb32a5208138a8992d4b75de0befb49dbe9c14e8666fbba76c618114656f14ef9f9220e87e7cfc74a3a900fc87f3a5b263583e5b88d6211d55c2dede63f35ddefcf0a97e0593b6f085d3c408c547b3a841aecbfbcd6f7c4a6dbe632d616ddef2a88774b3ed900a48d67153cba47b88a2e61a4e0761a7e9bc8e5e2ecfc5a0bd783296fe16ae3a867ef009b9df206ae63e4d8d978e68f6c74a14acd4da1c630a6aebb8d8002b4d649ae229d54a3c79483a284521a3376221b039eb2e091b49272f2fda57d714c8a10e7539baa44fa124e9de7e436b8d39cad1d66d44877856e8ea9a436935dd06b220873d611ff792c0203a2d6c4230e863f8e18fb39a68f7f7b0ba48b7a5f9e0be358dcc688d18b58bf539117f67c60e94181f3fc3f623e23bc5df03fa94d772cce8c3e10a357908e87a6d7801949dd6e0abedcccdaed9a439c504a555109f5bc4122644c2f9a400fd5266bcf52237dda66b69c26eab5512cf77d56784dc2465aa8c306cde505d253faee3129942dda5197b4c58c2665afe65ecaa446e81f759a73f08570405d4e903b94275b2b61794444c8b5ab1f41e5e2,0xa7d6ca5ec960742cf0c75b14,0x888200e565193069fdecf7fd5c91553a,'1b77a4b0047a45ada8869d60924dfdaf72934c59916485ba5a782a442494541c','82','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('22','13','L_INDEX','simulated',0x7580577a6c1949e7507680cc37f7ccf5868ef45acd0d468b619e2c9268dc8a17495ddd2a8c95f9586377b2e04635c275dfe50f31916fbdd597d0b18c0a0351bdda849f02270c70c8075f6ca8fa1fdc553e7bb70fe43262616e232b20926d2837a68c099294f275d15ed044657d2c64a3a1f788d9668d940951e340bcdc811759dfa186907430aa51c00584fd4d2932cf8ff27a22ead3a882644d0e82728d2b86c0ba3c05ac96a530f5919b6632eed37393db0e405c1c83b75bd1f4b0ec58d8501ccac9af4b59ed2d14b6626e7c5d4f47f3c6027e99b07fd2cc717af8615f0bba386262d3bdac69df019291dae151dda412b1d766986afbc931c3c5c57ef78780754d5aee4c6d990b03bfb871dba1c166e95235ceef07cd6979c50120b72935469cc86662b936934b1fc7997bc37f869b674aa10cfb0113acb7b0fc11c0f96bebe41b520bd34a5ba2ca8f52909dd16ddb4e504f037a13445e3b286d69238f1554546ef58bfa0efc0575c84f6a3889a36ecbba47a9ba38eee4cfce0574876b1c787092ce707aa6bca89753f32e3be72e505d455204d8fcef96f30efc41bb7162193897880af8bfe6244d7da7dfcc30bc8d53646e4ba1b71288950ce39c4fbf9e1c42966ea17b40945d11a2471ad5cb11d6d6f0a579727442ab972a76fa85028f60357b38c6a07d59f82d7abbfa505b81bed8,0xaa2996270109a00f98194fe8,0xced738af055d9e42f33588a8e8d70908,'d291b89c57afca352993b45eb0b4124ba4d94bb02d17b964206e113d896d2ab2','70','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('23','14','R_INDEX','simulated',0x91e7a617877239dda538679e262ae8af373dbff21558b8d56055fd1e172d7c7ee6e0863f2c9986b8b85f87f02f037a15261689e2193d1a92e52cef0939b7277b1830d4daafd30e79c427bb97f5969595ccd41e2a34c78b31313964fa7309f8b4340b1284a3d1db375fa878db96310be545912a22d6232f40ecc7ee57926ef7ad1409efdfb014be1f18534e1c4e3922dcb994281730d596d4f88087dc3ea8b5eb41c646e2aea93f38e7f63b88237113fc18a260f577f13c1cd716c8b95ab0db582ee2427169fae95dca305cba23dcd68e537147ce485e07323d26fa040fbbe111146e2b5824a093e7ba65ffd4b90bd477616e8e5e97c09afa3dd267dd405a0269bc5f202fc54b5af3df0947852ba4dfc71f6e5f762e6be9dbeefceb5b93056ff4cdc3ddba82c0ad1288333aabd25744a96aa7dfc18b801617cf435c79968d76f653a5428c9fb3530274ba157a4aef6c8e38ecccc9e89d6e4ea4339895b8b2e59ad68f709ef5f18db1b6fd74f8b12c65d5ed2f47949bdd7d9a25d23963db61dac4d7e5396719675b18c1b7018ec6fd0a0e75ec7b6d5c5bc0984c18ff0b2a1d03f2d010b0dbfa5d330cc7f2e9ed434ee2938a12aa85ee4674484d9821cf6f22e5b5d6cfd1468d352d6fe2a42dee3ba12f6d8a9e42aea48d01da606ece0606dce8dfe40cfa2a20932e82094c926376319f349edf8b4394822ea039,0x687a55fa458ebcfe08f0112c,0xf7af9884429782efa93bc772fbbd228b,'eeb069c19838d77f17900df01cd93c52a6d8fd6f6d210753a6e462acaa556831','63','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('24','14','L_INDEX','simulated',0x226c29e103d10e5e0abd57c76fd936cd84e10d7de8db7e1439e416bc62f65af002a8ca6a6a9b5d5c594077910a0969e3cb8facc75412d807cd2a60101d1083615a3a41bd2298f7b185fa79e19c6afb50724862f7673b98ec870110a6bea511840c117f205e9236add94d2891d7f1add7cc0c4bf88928bf8e5c194ac3a2f205d7a1e957308cfcec12cabf9b827018691e10a22173100384d4331bac257873582e54ecdfbf0ce67d638f5e2507e838d3cb6ab060397bfdeb2f7755642498fa8253b740528d68be7606f91c9b76775aea7a33fb1de9ddfedcc3c38f848cd04fda25c6caf4cb9fc93b5cd6be6d24b9ab49c9f4919d0b05481c1504b3ff1ce40f2f2b6a9746899f8a3ac354a0851fb1246366289fdac12985227e6caa2cf86849f28c8b453a209b3aabf45bb63c5bb5813b2b3286241fead9c8fe1906da6ef08f40694cd64d7ff504a319eef5d63cd4d711c2ad311515616d0c0bc9ba2acbad5b712bd2c44c696183bec36bf247fd1dba70a4c92352c6525cbc397fa6774c7e61c442abee03315a3ee42e6d66a88239dc5584a2944c003e6e81be193578c3198269962a847a17cf5cc0fee446ffaed4a6902304ba89fab6a478cdb00fb74aa7412f1344704c01f0fbd6780468100296914c03ad83289ce293ac9a83943a102e1b579aacbd91a4981ba2bd0bb5a96e1f86266c2140c42f67d2b9ca,0x75697ad1f968905b6789d097,0xdb661ad073e194ed59a836e526c2974d,'81d74ae0866c2571d3b7ba7e933956272d2fff1f02e38e5af753dbd0fc7edac9','64','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('25','17','R_INDEX','simulated',0x7db1b9e7598ea084d939384f8edcd87e7b44e6e81d49028ad613a0a24dd8924e33bc17bf0b6e58f6e2ee0d979413f34f81cdd811cf93a206fa98583bec84eef536d64a187b63979f49efaa754c62b386a8cabb0ff27bb8d27c169fff1a9c3f69fefbeb04f4c2e6caf276125a950664571ae3d1b9ae2c039ae0c10d29d0b37935d5bf5abc64705e7413cb0663df615ed07042899f0b5978fb903aee985c4fea4cfa66eed4793b1a07db9b7ae5155492983e16903f8234f3411e74c59c1e75087ddf6ba6fc006d072bdcdf5eec6677ac85af2d135329b0c55a4def74b49895cc086287e18850eac068141b91e2703b2dd25434dcfb0a7dca6b5900f5827bb0c85709a4a330ce2e28bdd87bcff73cb85603d765df3ca2da9731804fd6778ff630a84bd2be5a80a55d661da28c1794f5377652fea633fe9f58b8ca24f3908e5f79cccd50318b5a969065b4897af29c45babcb4e644633f3cab34fd767cccd346e8fdee2b57c2180799626d11f37d64a30d49d907ab8665bcd269ae2d8ce83b5d0e5fc9e821f82bb9d7eced4748bb55d91eb2e06d60f1f7fde2e9959694a0f77b07e0f8357cba65b7a069754bb31056b7a948d823c8d39d25500fe5cd79fdfe066a3a1fbd175692a35b021aeccecce8ba54841bb7334fbad4cb9815d54f5518af98d1b9f6f3ba09d5be326bf72b8e77219d6afd37460fe1,0xcbfd948feb6cd3a96d6e2875,0x234c5887bbee8d8bfc69f9667c88c0cf,'67ad657d53e7a321ae36cd06412c6864d188fcee70917e0c8919c62702e1477e','88','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('26','17','L_INDEX','simulated',0x01695f40017f69480932153eb8020c59c996467accbd6e8d5de4a90e4ec39d3c2652dfc83e1facba78063bccd163f8d9ceb78fd6eff98e84141197e6a7fead65afc8005ab8d0d4fa17a27bf3f7cb52bf5c1e6bf81007e4ca81fd3c9c81e9a2cec9f9af6b3d00566edd4e3d5eb247b2728e541de1d15d457ea9925cf06c81263890d02032b77f1bcf5f568b8b48d36f8ca3ef5203241bf256a27e1a6b766ea9d8eb3e323b2f341b2fc515428d8eabc4e70494f6b7442bb8b3fb94b7a75ac24dd074a5b6c57bb94a5d6968a41d3b8fc88f0359e0c9c7819539a3de4b486cb7bd2ca13aa4f953158cafa395e7892df109ec16fa82ef15e1a950cbfdb7a9fe8be91dbbc491aed2594e84c6d81998487c0d6966907c0b8aeb7b6666ba8dee33eabeed1d165d7ffb8f2c50eb082179830f339ea3fc56213b1dcb5a2b2390ff32f1bcb0c1c8e99b5cb6d1dd39c0296cf297b855ebce7239c73a7e3c9fd387c759d07c4797b30540a79da0232ffcef948fdc59a5568e021351f419dc7627e7d77d969249385abd9cb7db6cb4a577a25cd31e5d77be7804cd87803c60f1fdebb44b1dde48eac51224799e05fdcd3d2b83ded873604a0f72ac9df8f3c89ce225eaf8ffbc257946b09a98f415d687fa539e3bd1c4c97827dc417da412be05ed4bfd538e8a13cc8de77d2ade3500ef445cf9b40448b63e37075cdbb0da2643,0xc2d4acb7a7904ab6623035bc,0x31aa74cb1a8aa15a78f624eec0791494,'613bf73c0d7a47e8046146446bb873489a7ca04dc239e927b7db85e0a758b1aa','87','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('27','18','R_INDEX','simulated',0x2f9ca0ed3c69b86535bcd23af9f88e46ea8eb13766db9b23b6d6cc5897e4d71c0e5375202e49b1414e068625e35fe85b8dad47ef07f2312f38b934f7684ab4116e8f99831853b7b66e8edf9b765c07d2fdcb0223e468fa1612175514a6944366742885dbad7892b522311501c2ecb094bd3957a6d71ea75eaff4829aab673fc4bdb57b010a85479496c475f64f2e4e2c0550bd89beab45020531650222f48fad736af97a11239f658763590949655817661bb72e9d83df7ca678a633468dc1d5951c1292c57201299a76fa633f0f540fbf5bceea0ebba62e478505f7b80e9a5e798c3bb4f40639ee8358fed810913cfa853dc3f862937cd29d48406880f7f13daf0a77f8f0093d18f7ff03d73a9da81b2036f2e342fd422bce0d231e219e373cede30953377dac2afbfc93e6e765a5fd185cd05b2116132ad1ca6b8ffafccaf779334c6e5a7e88175ed14787b63f7f4433d2fd851420f867d9a1dbb3209174036daa78c24b15c2900922e40c346d1e9972d738c8573f7a8b6476da2583435d8bbef6dc24475f9d31ec2fb0451de270be087265a91f13a212cd16e69a54f9b24a7c1aa61f7f57c39f6c5693a7a5502fdb1a4552d3c941ae2615d021ee0c0a12ccfda26f14c39ad35d456eaf1501e593ed911f89eabfb59f4cb6b76db1fc76b590ddef3901920e8c92e522c60ed7c88ab5ae389e38557d0210586a,0x734dfac21f4b301a84dc19fe,0xf886080d25724caf77456618d741b19c,'d216dfca9f3ad5828c9adf9efd91dbb2e9bc85270a7eb94ff3b1141785490e9d','95','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('28','18','L_INDEX','simulated',0xe593d8fe38994a969a1b2e12d75bf417a1c0fd16095f6fe90b31ee1409d5c9e775b2d2049802aba6dfa7ccc84864068b7d0ba960ba707d33a0420c125a59317f2cf94ebdd79d70a2c4104e79e5ca126d1222f7c8e4f7316278dda6163624252703af230d081d16ca10ada8684866123598e7abf6b3baad5b7fd33c2fa030ce3d31860a50114f09d17cfaeeef6ef8d6b62fca9cb109f02a60e9a990df1c8f562420bd7b69d0ea251d470d3e7231347eff13cad6ab47bb26b73fb9193530d63775caed6565d8de52200055fbb6dd61dd0db4079e6ea175136a0d64287e5541258a63725b370c77433e2866e07e0cbb541f4eb07134e142e23403541ba3048eab3bb3ea95f770d0abc5b95c1a81f5b1c354a47cdc6c3e83316b67ad3c739aba0307acee06cbdbf03a19a821b9ac1a964e437cd18d996cb85d49e962f412f37c173d226a421ad5d835b02688e76beefcd514e616226f18de080896df80ab1f541857bd185c80708da6518653ca85ebad5720d587b8582c70f3a7c4fba3259f0b1a93474f8d19475a53e64aaa53710c0204e7138943e4f1a369aa30bf625ed4fd4513ed1671678123d7ec058d43a2ab849b883a5280cfe4a7b7be88a76820fab75ac4ea5e6d5da066c09a6c1706f27e463552f04f8547d10a53f77b99b4310fa0803f60ce9bb0c01d23f99f3f97c0ac6a987e5ec44f2b0114,0x2c8a347cbbee16836e77d698,0xfdb27a12c51b67a0aaad9bb81d604512,'9a7b0be52e3635368d05fcb82e31368f23ea5552128f6e47e5a0d1833e636f7f','72','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('29','19','R_INDEX','simulated',0x8f96cbbb51efcd3e29aaee9d32d301b5f4116dc4cea8190121058a46f74b77992170313d1da944ff65819c1dfcae852e2740fde410a62fac5eb550c7e112c8ecd352d721cd07f838d3561d543e69c1ee4492de28834445b96de1d7e59022c39903d051e616a3dba6a02c80b115710d11ba82ec618ce5065e0bf1fe1757a293a7c8bd46ba8527137caaf203abf0f8a5453aec05fce28c68ea15b5f97cc76d55fb761e75231831a8fed431197b6cffa287abd998697246f8477736fd385ff72ad22cb4f7d64259b2e8d5fa35410d522dd0758c7ea320e933ccc403dbb694bd183113e21b995054e374da839e2e854f740cb929f6e24100248eed641dda2e4912a80d5bb4c06c8c8dcb12f8b8b08412ad842f3c4fb707775a6848b7dca61a89420e98e53f4ccf3b37fa81a855e165f5b50e815b5ad5c68b68baee79abdb54367974848b32474078b4e14109efaf1d7693fd4b06c8ad41ff85e815e83879736786d8d51d895070735d3a82479fb559064d20efd90ed3f7463dd0246d5b82b279ada0cf19d307d13c3464c176f8fc773e7107d70ec5e17ca5ca5a5db3f412e8447ecf7a9b28206835b87c33d3c09b4b9d4f84dbce468f5d9f83d0bfa02139d0e59ac0a39aba7273723435d72b60c8182ef8dd61a63f73ba84bf49409d00aac9881d878698706a873257ee046ecc9413839874,0xf0ae4e279cc54bb1da578f75,0x3b113759519456d30c6fa8d79de11aec,'c41aec089976fb0fb22b693c9f32f7a967f16af249f10d8aebbd23d49e2fedd5','67','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('30','19','L_INDEX','simulated',0x7f5f226bd9334c800b5bdb1c50cfef2c259c80688e6c0f0a95409790f2e47749080ae851e2881ee4786caceb9c54b1a0eb8f29ca570d0da3d6a0f133794b79a374bf847a67e7d0a27d1020efc851f6f197f3eac805f90f3443567ae34bc6c66259ea26af139b9e6149afd628fd5f11829bcc6e1351978155def8847fb251b0f833a1ef44e1a4515b8935e61130be2efeab98bcabcdfcc393d44658442aa6903c35f1989ac18f7c6a7681cb02081a17c7c1eac7875a76917c4b779fdf2394ee3d9558f41fe91d347a0f4ed9f77e1c9d6783a1f279c4ed8e3916f3dbce2aff291cc79f96eff4fc773fd5e4f44ad7771481b2934f3ba5f2933383a7a354c3916f972d65f32315e7e0c1c110121a4393b9ccf7112c1321c21e1afc67d77d687769321a9b2e8ecdb548e8c54ee24d34549e30a2c2525380667c50296b4ddf7720f0eeff9ce658f1b44d8fd6f3d4cab57acc7b15a4d35db6ecbc4c97bec9a854c28c6d1fc1c9bd34e3ea430edaf766a7e6731b3c9de8be6dab48824f064c18a80e336be28aac8843d47bdfb0801d97d488e32b6157c1fbab080457b66d89d694b2988c134591d2e7df4721e763cd978519d76bbda9f8a31f9dd88d1d739558b2ceba95ca4ead21c8ea916d6d4895a99de329f2394d314e0a712cfa3809e4fb67ed2230a5012ca98d40089b,0x1c6f36153187c53ad2b53a6b,0x37cd2936e3feeadcfc9f8aaa99b77fee,'a5eca6ae94f0abf21db8a0de65b8b9219405385df32cc96a4954339bb602984b','88','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('31','20','R_INDEX','simulated',0xc95436b0064265adc45e85fce6aaa47af1809a582e58788e1a279e0f4297599f5f3bc829a55375f06c404a489adbdeb5bb1f137bc6b82f1cbab2be295d6cb52f81443f0a0ced2b7820d4691ec176ce00068aeb91200c629f49e7dc66ba6016fca164d3c37d8e84a3ab5abf5c644fa2278ef93f70f36caaf2489b34c25636ee26d43e81089ef45a5d4851b30c797f4ee903cd79a4ab88e223be119a4826ca3244577bdc1944a0a2a3160ee68fba10762cd00f456ad69e972373acf8bbe8744837868d337a2c3b9b74203f0dbddc509410ff9d3ffd275c058498a04cfba5b2c15bb5b641495ae9d53bda2ad064007e10a01cdbc8f740629930306f250dca57ef8af3f25094727f15e35ada90484ee71515360ebc5f4151d0d78a6a650a3989654cc634acdd4de89d5f79a9523b7c5027b14ee33240d3ea606e3ff1e14e961d3a6ae0c7bed074f273050a3051765d476745f4ccb7916c92293c4266f1dd373a3d771662258fcfe49257dd3be1da892ab080520a3e655bacf1c96cb32ec408ccf81c74955d3124f04cff728e1afa1364e61e7e975562d14d1166c392a102e8559ce8196c089cefc866aef74de5711783fc35cbab1bf79a0e42cc6d7f6afa392354d0224d4bbcbd0697a685ad52692cca4249fdb7d57702b809c9bc0312b35a1ef48b546672b37fa6f65c4a5f0ceabd9939d43f,0x8167f8c6d07a38bef0ad7149,0x298decc21f032ab1193321c30c149d81,'3e8f872fcaca12667058414ce5aeb781b14bd36b7c0f2d9989c78e01a8a5bb6f','89','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('32','20','L_INDEX','simulated',0xa158d428c56146683476ca58de4ecae55c31396ca2c69e9dcbaa70ced45307a17dc449b71bd68051401f2bffc61396e51402bfc6398b21ae491c1b5999f4468adba3aea5fbf6ffff9fb0bacf1d06f92d40c1ae55597bfef1b350043e59c31f3f78422203622624f9c718d273403b7365d077ca9f3c052ebe1f8cdc21b4aff60862ee1df1acc7c54943cdbb09a6f3dc19604bb5c9a761fed45533ed5d618f529b0d0bc228199022eb2e4aa097eb25d708518fe04ff46bfe43797e49d9a8db340ea690ea822a63ced3f525bc149f0767b4a962dfd84508e65b1f16f598e22cca4cea97cdfea6afe427f87d12ebbae5d7dbfcaa844d7b1461256aa3a5881efbcdb159d3a41d502ccad89c1fda2abeb6d06163768c62b039cdd4b6a8a5de99523ea03fa3edc8a580efc8274cc565821fe6b3d974aa7c4e54bf7725d458750ee9c7d08d34dfbbb95a6e11bd2a905c45d6e1b6c96542548d699b50c40c532d1c795c4d88c945fe375fdfa4b6d75f2e42541a1c62132dc2785ac229556198f4fc48866657f5bc5f18e55e136e71cb04f2b966574327e069a08717d9f76db8d40ac7d38cc3c750f07714a999dc8ddf0a183675a682d087e66a27b64c55d582db72c55218f0d9842a827c13d102f0aa181a395ba1c8ca3633ccfa60de742117650c9f7afacac62bec635f137b145484703fd091ad8b944a84,0x3cc17ba80ff3938bc0c959b3,0xfb2c078e4d166131b870f6a406bd4268,'45e8dd53c3f73ea4ae546ea1231f48903c00cab84d62c9f345150da0cbcaffab','68','1','2026-11-12 04:01:25');
INSERT INTO `biometric_templates` VALUES ('33','23','R_INDEX','simulated',0x132a0507bbf1bd65afd7ec70f0e746c3d933b8230442eae0f4d0cde2aa6100b3bc96a390981b04c9e562e481e9611a239f3ef24946bec3f4d5551e4e8284733bb269ee2fabaf83d4161d67a5915ae65421cc86743089e5558caefb7bcc7df8a2b03c8606980cebaab7e9e435c766d2fc1dec971a873b8d733b7099a2def56a6155c03a066ff70966a1931b7d0f531637dc3b6093654869ec87cb3ae53174ca2d708f7c4c299d4251d00fc46393a300c8790627195c7c27fc35464d8c0d816fb06263e0103e5315048b403f4974e61cc9263c8b4bf346853a3a826db09da5a9668d1e43bbccba5ba678a3a9e4f53088551ffb626333260070b13e52478152535bb07e23b752b28a3b6430c0b33c85fbba0b6841d78607689b91c1d75169671afd475eefac00c8b222c0a4698c3476311d5d8c93c7423ae7009fb87c7a7effcbc30665f950fa5163cf7de1be46813be97cb72d33d92c0773bfecc573c7679bf6b8bd3747b5078744baa5c5f342f3781d81fafbabb2d0be1b58c20ee4e7e07d93908bc0c03d2e5773413042749fc414e1deca05e30aeee2a4b73a2dec596adcd46e41d201b3bfb2f5dd1faa8956479799214dba51693b944c8c41730cb27745b62a6f09bb4b7655540a22957d53942630325e819ee4a9b881e03b2d8ecf2b282f8e095cd336f146e0a4e3e90f1597940d3d9153103b0abc0ea4,0xafe7fb31b76f424331808798,0xf5bdc19dc4ae429bf0e43f052ac62676,'d7334bfd9d03cf1ec4a960931ac488fb60ef479c7e0eec22a021834b471184e5','94','1','2026-11-12 04:01:29');
INSERT INTO `biometric_templates` VALUES ('34','23','L_INDEX','simulated',0xbea18154006328023a315a83846a726ab595ffaea741bac9d8853054bd0be1666c974762a1fef86ec438f8329b73af28500b7645b8e401f2041ae77a69f3dcc49582032162a14f1b7b37541ff069336efbc2559175e51ca80ca72afde121ee71e685af6cc240a5e61a20345646a09181ec69820cf97e6445ce553115e0dae1b17ef3bf57ace1656c63d961b7b4e91145229da7278ffccdafd462fa5907ae5e4533a9c058a393403f79f500353e4048b3d9c3e387f7f01e49b2cf699692983e79db9ebdf106aec06c9e5c2169aad8af758887e4bc1dc804ac21c081427cd15789e11ded17797c3d78ff3d6425215f842e1889ec6b4a4c13d4d7cf58ac5c8e4d4d1216a8205fcc1ad0b5e05b7f7bd6c271743421b8cfb6c111c669a87530a80084bfe2c1dce117575dbb7d9c89028b4c1e59b22fddcb0f5cd05eb59383f21db326213262de63073e710ae6567ce0a2536b141c93028db78681037caed456baa452473edc1183951297cd9ed0eb6643ad6c7c0301092b35b0fb9a14b14f7ae41656efdac96244c864737bf35b6c113fa862b7a2da9a3643e6141c335cc9ee5237af72497fada1d29d10942e62fb0aaf8b9074396953d02ae365c8790bdcbd04c74f1116e67356a0ecc94fb8c20f86f8ee6e76e90408e191291078428c85a99fc1a13cc9e64240d3d7d09f517a9e8d94a7e5454b7e1d,0x521547db37bb8a0856b9c3b2,0x24390ec8bec020f29608c96ff86f5f33,'270e84e438783754d423228abdc62ec9e66f39496133a4fa7716b887b5c3db91','76','1','2026-11-12 04:01:29');
INSERT INTO `biometric_templates` VALUES ('35','24','R_INDEX','simulated',0x9864ac8dae731fc90e17c8954a864507c2dc180a1d8b1ceec46371696f4cf08ed293ac1a5446de660d851eb6f045425742522f8c24e24e69a5ea09f0ac60a2d3dfff421017991d8e0740841bcdb9956f8cca696038099258499d6970068ce4e8e780d1856fcb577258d9efda6af6613ad8af099ced5927736e9d5820e63f3b385d0c115af3c2384b7897ae203d499b71d7464c314d0e74efbdb3a778bb71f86a3bfa2614e0df01cd8db5e1ca57b612e77b8c206eb5b301e5d2f8535d47dd655ac9b78005f4ff983ebadc81bfa9c1f7bb017db8853ad70336130e74ed990190d0c8a669268aa7f4742d54d7aedcdddeddcd5050f2982cbd8210fd9c4bf7818cd4e78e206b516365c9efd6ae6634ffe295f12341b71afec2403ddba9e4d025cb6d26aec947cdb63e6b8639e0c75eb09c817ce1baa029381dc9a104bd0645dc9c30b7d9d10f2ee0a9a18bcddff8c5faf938fbbbfd8b588ee6a7ec2fe078fff3358656caf1f2d4b4394484af6bf6f9be4b6ba9f524d62ef98dcfec24eb5abf37987ef80db431da669b84e2e97c0f9a3a667fda2b93991fb70804b53bde126e9776fe0e750250e0a2d15dfb5332ccce2cb72c390bc7f7482062f1438b2c7cb970aac9423136c161c79ebe4a299a6216dd8d9ff3f342e8520ed11db6e1cecf1c42d4485bcfa956dbb6228ab2b99c,0x5d2ede912b824b22f5a0b86c,0xd7a8a4a7ab12a3b1d81fc9aa7c2bc58e,'49bff43121b9c498c84c2aa0476324b0011ba588e129dc524f680641345d6b20','87','1','2026-11-12 04:01:29');

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

INSERT INTO `class_sessions` VALUES ('1','1','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 1','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','2','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('2','1','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 2','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','2','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('3','1','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 3','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','2','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('4','1','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 4','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','2','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('5','1','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 5','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','2','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('6','1','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 6','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','2','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('7','1','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 7','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','2','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('8','2','2026-10-20','11:00:00','13:00:00','Lab 1','Lesson 8','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','2','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('9','2','2026-10-22','11:00:00','13:00:00','Lab 1','Lesson 9','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','2','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('10','2','2026-10-27','11:00:00','13:00:00','Lab 1','Lesson 10','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','2','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('11','2','2026-10-29','11:00:00','13:00:00','Lab 1','Lesson 11','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','2','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('12','2','2026-11-03','11:00:00','13:00:00','Lab 1','Lesson 12','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','2','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('13','2','2026-11-05','11:00:00','13:00:00','Lab 1','Lesson 13','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','2','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('14','2','2026-11-10','11:00:00','13:00:00','Lab 1','Lesson 14','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','2','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('15','3','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 15','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','3','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('16','3','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 16','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','3','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('17','3','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 17','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','3','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('18','3','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 18','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','3','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('19','3','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 19','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','3','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('20','3','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 20','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','3','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('21','3','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 21','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','3','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('22','4','2026-10-19','08:00:00','10:00:00','Lab 2','Lesson 22','closed','2026-10-19 08:00:00','2026-10-19 10:00:00','3','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('23','4','2026-10-21','08:00:00','10:00:00','Lab 2','Lesson 23','closed','2026-10-21 08:00:00','2026-10-21 10:00:00','3','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('24','4','2026-10-26','08:00:00','10:00:00','Lab 2','Lesson 24','closed','2026-10-26 08:00:00','2026-10-26 10:00:00','3','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('25','4','2026-10-28','08:00:00','10:00:00','Lab 2','Lesson 25','closed','2026-10-28 08:00:00','2026-10-28 10:00:00','3','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('26','4','2026-11-02','08:00:00','10:00:00','Lab 2','Lesson 26','closed','2026-11-02 08:00:00','2026-11-02 10:00:00','3','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('27','4','2026-11-04','08:00:00','10:00:00','Lab 2','Lesson 27','closed','2026-11-04 08:00:00','2026-11-04 10:00:00','3','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('28','4','2026-11-09','08:00:00','10:00:00','Lab 2','Lesson 28','closed','2026-11-09 08:00:00','2026-11-09 10:00:00','3','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('29','4','2026-11-11','08:00:00','10:00:00','Lab 2','Lesson 29','closed','2026-11-11 08:00:00','2026-11-11 10:00:00','3','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('30','5','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 30','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','3','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('31','5','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 31','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','3','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('32','5','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 32','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','3','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('33','5','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 33','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','3','2026-11-12 04:01:25');
INSERT INTO `class_sessions` VALUES ('34','5','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 34','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','3','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('35','5','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 35','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','3','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('36','5','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 36','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','3','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('37','6','2026-10-20','11:00:00','13:00:00','Lab 1','Lesson 37','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','2','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('38','6','2026-10-22','11:00:00','13:00:00','Lab 1','Lesson 38','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','2','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('39','6','2026-10-27','11:00:00','13:00:00','Lab 1','Lesson 39','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','2','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('40','6','2026-10-29','11:00:00','13:00:00','Lab 1','Lesson 40','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','2','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('41','6','2026-11-03','11:00:00','13:00:00','Lab 1','Lesson 41','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','2','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('42','6','2026-11-05','11:00:00','13:00:00','Lab 1','Lesson 42','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','2','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('43','6','2026-11-10','11:00:00','13:00:00','Lab 1','Lesson 43','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','2','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('44','7','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 44','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','4','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('45','7','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 45','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','4','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('46','7','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 46','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','4','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('47','7','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 47','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','4','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('48','7','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 48','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','4','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('49','7','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 49','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','4','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('50','7','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 50','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','4','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('51','8','2026-10-20','11:00:00','13:00:00','Lab 1','Lesson 51','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','4','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('52','8','2026-10-22','11:00:00','13:00:00','Lab 1','Lesson 52','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','4','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('53','8','2026-10-27','11:00:00','13:00:00','Lab 1','Lesson 53','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','4','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('54','8','2026-10-29','11:00:00','13:00:00','Lab 1','Lesson 54','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','4','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('55','8','2026-11-03','11:00:00','13:00:00','Lab 1','Lesson 55','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','4','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('56','8','2026-11-05','11:00:00','13:00:00','Lab 1','Lesson 56','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','4','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('57','8','2026-11-10','11:00:00','13:00:00','Lab 1','Lesson 57','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','4','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('58','2','2026-11-12','08:00:00','17:00:00','Lab 2','Demo session for today','scheduled',NULL,NULL,'2','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('59','3','2026-11-12','09:00:00','17:30:00','Lab 2','Demo session for today','scheduled',NULL,NULL,'3','2026-11-12 04:01:26');
INSERT INTO `class_sessions` VALUES ('60','9','2026-11-12','00:00:00','23:59:00','Workshop','Test session','closed','2026-11-12 04:01:30','2026-11-12 04:01:30','31','2026-11-12 04:01:30');

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

INSERT INTO `classes` VALUES ('1','1','DIT-2025-SEP','Diploma IT – September 2025 intake','2025','2026-11-12 04:01:24');
INSERT INTO `classes` VALUES ('2','2','CIT-2026-JAN','Certificate IT – January 2026 intake','2026','2026-11-12 04:01:24');
INSERT INTO `classes` VALUES ('3','3','DBM-2025-SEP','Diploma Business Mgt – September 2025 intake','2025','2026-11-12 04:01:24');
INSERT INTO `classes` VALUES ('4','4','DEE-2026-JAN','DEE Jan 2026','2026','2026-11-12 04:01:28');

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

INSERT INTO `courses` VALUES ('1','1','DIT','Diploma in Information Technology','Diploma','2026-11-12 04:01:24');
INSERT INTO `courses` VALUES ('2','1','CIT','Certificate in Information Technology','Certificate','2026-11-12 04:01:24');
INSERT INTO `courses` VALUES ('3','2','DBM','Diploma in Business Management','Diploma','2026-11-12 04:01:24');
INSERT INTO `courses` VALUES ('4','3','DEE','Diploma in Electrical Engineering','Diploma','2026-11-12 04:01:28');

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

INSERT INTO `departments` VALUES ('1','ICT','Information and Communication Technology','2026-11-12 04:01:24');
INSERT INTO `departments` VALUES ('2','BUS','Business Studies','2026-11-12 04:01:24');
INSERT INTO `departments` VALUES ('3','ENG','Engineering','2026-11-12 04:01:28');
INSERT INTO `departments` VALUES ('5','XSS','<script>alert(1)</script>','2026-11-12 04:01:28');

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

INSERT INTO `enrollments` VALUES ('1','1','1','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('2','2','1','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('3','3','1','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('4','4','1','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('5','5','1','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('6','6','1','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('7','7','1','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('8','8','1','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('9','9','1','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('10','10','1','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('11','1','2','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('12','2','2','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('13','3','2','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('14','4','2','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('15','5','2','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('16','6','2','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('17','7','2','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('18','8','2','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('19','9','2','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('20','10','2','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('21','1','3','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('22','2','3','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('23','3','3','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('24','4','3','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('25','5','3','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('26','6','3','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('27','7','3','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('28','8','3','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('29','9','3','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('30','10','3','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('31','1','4','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('32','2','4','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('33','3','4','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('34','4','4','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('35','5','4','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('36','6','4','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('37','7','4','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('38','8','4','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('39','9','4','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('40','10','4','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('41','11','5','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('42','12','5','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('43','13','5','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('44','14','5','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('45','15','5','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('46','16','5','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('47','11','6','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('48','12','6','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('49','13','6','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('50','14','6','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('51','15','6','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('52','16','6','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('53','17','7','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('54','18','7','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('55','19','7','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('56','20','7','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('57','21','7','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('58','22','7','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('59','17','8','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('60','18','8','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('61','19','8','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('62','20','8','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('63','21','8','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('64','22','8','2026-11-12 04:01:25');
INSERT INTO `enrollments` VALUES ('65','23','9','2026-11-12 04:01:29');
INSERT INTO `enrollments` VALUES ('66','24','9','2026-11-12 04:01:29');
INSERT INTO `enrollments` VALUES ('67','25','9','2026-11-12 04:01:29');

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

INSERT INTO `lecturers` VALUES ('1','2','LEC001','1','Female','2026-11-12 04:01:25');
INSERT INTO `lecturers` VALUES ('2','3','LEC002','1','Male','2026-11-12 04:01:25');
INSERT INTO `lecturers` VALUES ('3','4','LEC003','2','Female','2026-11-12 04:01:25');
INSERT INTO `lecturers` VALUES ('4','31','LEC900','3','Male','2026-11-12 04:01:29');

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

INSERT INTO `notifications` VALUES ('1','11','warning','Low attendance: DIT101','Your attendance in DIT101 Computer Applications is 28.6% (2 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:26');
INSERT INTO `notifications` VALUES ('2','9','warning','Low attendance: DIT101','Your attendance in DIT101 Computer Applications is 42.9% (3 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:26');
INSERT INTO `notifications` VALUES ('3','13','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:26');
INSERT INTO `notifications` VALUES ('4','11','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 57.1% (4 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:26');
INSERT INTO `notifications` VALUES ('5','10','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:26');
INSERT INTO `notifications` VALUES ('6','9','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:26');
INSERT INTO `notifications` VALUES ('7','14','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:26');
INSERT INTO `notifications` VALUES ('8','11','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 57.1% (4 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:26');
INSERT INTO `notifications` VALUES ('9','10','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:26');
INSERT INTO `notifications` VALUES ('10','9','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:26');
INSERT INTO `notifications` VALUES ('11','11','warning','Low attendance: DIT104','Your attendance in DIT104 Programming in Java is 50.0% (4 of 8 sessions). The minimum required is 75%.','0','2026-11-12 04:01:26');
INSERT INTO `notifications` VALUES ('12','19','warning','Low attendance: CIT101','Your attendance in CIT101 Computer Fundamentals is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:26');
INSERT INTO `notifications` VALUES ('13','19','warning','Low attendance: CIT102','Your attendance in CIT102 Networking Basics is 14.3% (1 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:26');
INSERT INTO `notifications` VALUES ('14','17','warning','Low attendance: CIT102','Your attendance in CIT102 Networking Basics is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:26');
INSERT INTO `notifications` VALUES ('15','16','warning','Low attendance: CIT102','Your attendance in CIT102 Networking Basics is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:26');
INSERT INTO `notifications` VALUES ('16','25','warning','Low attendance: DBM101','Your attendance in DBM101 Principles of Management is 42.9% (3 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:26');
INSERT INTO `notifications` VALUES ('17','22','warning','Low attendance: DBM101','Your attendance in DBM101 Principles of Management is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:26');
INSERT INTO `notifications` VALUES ('18','29','warning','Low attendance: DEE101','Your attendance in DEE101 Electrical Principles is 0.0% (0 of 1 sessions). The minimum required is 75%.','0','2026-11-12 04:01:30');
INSERT INTO `notifications` VALUES ('19','27','info','Welcome','Welcome to DEE101','0','2026-11-12 04:01:31');
INSERT INTO `notifications` VALUES ('20','29','info','Welcome','Welcome to DEE101','0','2026-11-12 04:01:31');
INSERT INTO `notifications` VALUES ('21','30','info','Welcome','Welcome to DEE101','0','2026-11-12 04:01:31');

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `setting_key` varchar(50) NOT NULL,
  `setting_value` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `settings` VALUES ('biometric_driver','simulated','2026-11-12 04:01:24');
INSERT INTO `settings` VALUES ('bridge_url','http://127.0.0.1:8765','2026-11-12 04:01:24');
INSERT INTO `settings` VALUES ('consent_version','1.0','2026-11-12 04:01:24');
INSERT INTO `settings` VALUES ('institution_name','Demo Technical Training Institute','2026-11-12 04:01:24');
INSERT INTO `settings` VALUES ('late_grace_minutes','15','2026-11-12 04:01:31');
INSERT INTO `settings` VALUES ('match_threshold','80','2026-11-12 04:01:24');
INSERT INTO `settings` VALUES ('min_attendance_percent','75','2026-11-12 04:01:31');
INSERT INTO `settings` VALUES ('min_quality','50','2026-11-12 04:01:24');

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

INSERT INTO `students` VALUES ('1','5','DIT/001/2025','1','Male',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('2','6','DIT/002/2025','1','Female',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('3','7','DIT/003/2025','1','Male',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('4','8','DIT/004/2025','1','Female',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('5','9','DIT/005/2025','1','Male',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('6','10','DIT/006/2025','1','Female',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('7','11','DIT/007/2025','1','Male',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('8','12','DIT/008/2025','1','Female',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('9','13','DIT/009/2025','1','Male',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('10','14','DIT/010/2025','1','Female',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('11','15','CIT/001/2026','2','Male',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('12','16','CIT/002/2026','2','Female',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('13','17','CIT/003/2026','2','Male',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('14','18','CIT/004/2026','2','Female',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('15','19','CIT/005/2026','2','Male',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('16','20','CIT/006/2026','2','Female',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('17','21','DBM/001/2025','3','Male',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('18','22','DBM/002/2025','3','Female',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('19','23','DBM/003/2025','3','Male',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('20','24','DBM/004/2025','3','Female',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('21','25','DBM/005/2025','3','Male',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('22','26','DBM/006/2025','3','Female',NULL,'active','2026-11-12 04:01:25');
INSERT INTO `students` VALUES ('23','27','DEE/001/2026','4','Female',NULL,'active','2026-11-12 04:01:28');
INSERT INTO `students` VALUES ('24','29','DEE/002/2026','4','Male',NULL,'active','2026-11-12 04:01:29');
INSERT INTO `students` VALUES ('25','30','DEE/003/2026','4','Female',NULL,'active','2026-11-12 04:01:29');

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

INSERT INTO `unit_assignments` VALUES ('1','1','1','1','2026/2027','1','2026-11-12 04:01:25');
INSERT INTO `unit_assignments` VALUES ('2','2','1','1','2026/2027','1','2026-11-12 04:01:25');
INSERT INTO `unit_assignments` VALUES ('3','3','1','2','2026/2027','1','2026-11-12 04:01:25');
INSERT INTO `unit_assignments` VALUES ('4','4','1','2','2026/2027','1','2026-11-12 04:01:25');
INSERT INTO `unit_assignments` VALUES ('5','5','2','2','2026/2027','1','2026-11-12 04:01:25');
INSERT INTO `unit_assignments` VALUES ('6','6','2','1','2026/2027','1','2026-11-12 04:01:25');
INSERT INTO `unit_assignments` VALUES ('7','7','3','3','2026/2027','1','2026-11-12 04:01:25');
INSERT INTO `unit_assignments` VALUES ('8','8','3','3','2026/2027','1','2026-11-12 04:01:25');
INSERT INTO `unit_assignments` VALUES ('9','9','4','4','2026/2027','1','2026-11-12 04:01:29');

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

INSERT INTO `units` VALUES ('1','1','DIT101','Computer Applications','2026-11-12 04:01:24');
INSERT INTO `units` VALUES ('2','1','DIT102','Web Design and Development','2026-11-12 04:01:24');
INSERT INTO `units` VALUES ('3','1','DIT103','Database Systems','2026-11-12 04:01:24');
INSERT INTO `units` VALUES ('4','1','DIT104','Programming in Java','2026-11-12 04:01:24');
INSERT INTO `units` VALUES ('5','2','CIT101','Computer Fundamentals','2026-11-12 04:01:24');
INSERT INTO `units` VALUES ('6','2','CIT102','Networking Basics','2026-11-12 04:01:24');
INSERT INTO `units` VALUES ('7','3','DBM101','Principles of Management','2026-11-12 04:01:24');
INSERT INTO `units` VALUES ('8','3','DBM102','Business Communication','2026-11-12 04:01:24');
INSERT INTO `units` VALUES ('9','4','DEE101','Electrical Principles','2026-11-12 04:01:28');

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

INSERT INTO `users` VALUES ('1','admin','admin','admin@example.ac.ke',NULL,'System Administrator','$2y$10$SY9lkE3IImjf8hUcky9Na.FemA.JVtTqa1MHiwMdPZ2HawVjQrVjG','1','0','1',NULL,'2026-11-12 04:01:26','2026-11-12 04:01:24','2026-11-12 04:01:26');
INSERT INTO `users` VALUES ('2','lecturer','LEC001','lec001@example.ac.ke','0700000010','Grace Wanjiru','$2y$10$cGuRNmoUUTmQbeL3jTKA6.LJH0SyP1pYihWZ.81Khz7e0YNDgRA3y','1','0','0',NULL,'2026-11-12 04:01:27','2026-11-12 04:01:25','2026-11-12 04:01:27');
INSERT INTO `users` VALUES ('3','lecturer','LEC002','lec002@example.ac.ke','0700000011','Peter Otieno','$2y$10$cGuRNmoUUTmQbeL3jTKA6.LJH0SyP1pYihWZ.81Khz7e0YNDgRA3y','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('4','lecturer','LEC003','lec003@example.ac.ke','0700000012','Mary Achieng','$2y$10$cGuRNmoUUTmQbeL3jTKA6.LJH0SyP1pYihWZ.81Khz7e0YNDgRA3y','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:27');
INSERT INTO `users` VALUES ('5','student','DIT/001/2025','brian.kamau@student.example.ac.ke','0711100000','Brian Kamau','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,'2026-11-12 04:01:27','2026-11-12 04:01:25','2026-11-12 04:01:27');
INSERT INTO `users` VALUES ('6','student','DIT/002/2025','faith.njeri@student.example.ac.ke','0711100001','Faith Njeri','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('7','student','DIT/003/2025','kevin.mutua@student.example.ac.ke','0711100002','Kevin Mutua','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('8','student','DIT/004/2025','mercy.chebet@student.example.ac.ke','0711100003','Mercy Chebet','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('9','student','DIT/005/2025','dennis.omondi@student.example.ac.ke','0711100004','Dennis Omondi','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('10','student','DIT/006/2025','joy.wambui@student.example.ac.ke','0711100005','Joy Wambui','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('11','student','DIT/007/2025','collins.kiprop@student.example.ac.ke','0711100006','Collins Kiprop','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('12','student','DIT/008/2025','sharon.atieno@student.example.ac.ke','0711100007','Sharon Atieno','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('13','student','DIT/009/2025','victor.mwangi@student.example.ac.ke','0711100008','Victor Mwangi','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('14','student','DIT/010/2025','esther.jepkosgei@student.example.ac.ke','0711100009','Esther Jepkosgei','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('15','student','CIT/001/2026','ian.barasa@student.example.ac.ke','0711100010','Ian Barasa','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('16','student','CIT/002/2026','diana.nyambura@student.example.ac.ke','0711100011','Diana Nyambura','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('17','student','CIT/003/2026','moses.kibet@student.example.ac.ke','0711100012','Moses Kibet','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('18','student','CIT/004/2026','ruth.akinyi@student.example.ac.ke','0711100013','Ruth Akinyi','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('19','student','CIT/005/2026','allan.mutiso@student.example.ac.ke','0711100014','Allan Mutiso','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('20','student','CIT/006/2026','naomi.wairimu@student.example.ac.ke','0711100015','Naomi Wairimu','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('21','student','DBM/001/2025','felix.ochieng@student.example.ac.ke','0711100016','Felix Ochieng','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('22','student','DBM/002/2025','purity.jeptoo@student.example.ac.ke','0711100017','Purity Jeptoo','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('23','student','DBM/003/2025','samuel.karanja@student.example.ac.ke','0711100018','Samuel Karanja','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('24','student','DBM/004/2025','linet.auma@student.example.ac.ke','0711100019','Linet Auma','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('25','student','DBM/005/2025','eric.rotich@student.example.ac.ke','0711100020','Eric Rotich','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('26','student','DBM/006/2025','agnes.moraa@student.example.ac.ke','0711100021','Agnes Moraa','$2y$10$maZqvJ570Qqe.ltKKe1uzOieXZjP8OH02AinTt28owlzAenLfXEXe','1','0','0',NULL,NULL,'2026-11-12 04:01:25','2026-11-12 04:01:25');
INSERT INTO `users` VALUES ('27','student','DEE/001/2026','tso@example.com','0712000001','Test Student One','$2y$10$A/rfGb5vD4IYWGUNLiY5deyRNmzcABomDN9KQS8coeFsuqffMkgWe','1','0','0',NULL,'2026-11-12 04:01:28','2026-11-12 04:01:28','2026-11-12 04:01:29');
INSERT INTO `users` VALUES ('29','student','DEE/002/2026',NULL,'0712000002','Csv Student Two','$2y$10$43I3VzGSign7z9SuwBqOjeLREeOLHHdvrv4rzNmJW7C6VJ/zEt1B6','1','1','0',NULL,NULL,'2026-11-12 04:01:29','2026-11-12 04:01:29');
INSERT INTO `users` VALUES ('30','student','DEE/003/2026',NULL,NULL,'Csv Student Three','$2y$10$9XmrHtUoVM8wRNnGQvQzWelnWH8ixB6H0/JQ6VcTLbdR6rjSNjufy','1','1','0',NULL,NULL,'2026-11-12 04:01:29','2026-11-12 04:01:29');
INSERT INTO `users` VALUES ('31','lecturer','LEC900','lec900@example.com','0712000900','Test Lecturer','$2y$10$ooOwq190IucmnEM6qhip/egcwUo5jtSI3Qy/wrfazRpMhuQCDEBVW','1','0','0',NULL,'2026-11-12 04:01:29','2026-11-12 04:01:29','2026-11-12 04:01:29');

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
