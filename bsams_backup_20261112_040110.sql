-- BSAMS database backup
-- Created: 2026-11-12 04:01:10

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
INSERT INTO `attendance_records` VALUES ('459','60','23','late','simulated','95.39',NULL,'31','2026-11-12 04:01:09');
INSERT INTO `attendance_records` VALUES ('462','60','25','present','manual',NULL,'Fingerprint not yet enrolled; ID card checked','31','2026-11-12 04:01:09');
INSERT INTO `attendance_records` VALUES ('463','60','24','absent','auto',NULL,NULL,NULL,'2026-11-12 04:01:09');

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

INSERT INTO `audit_logs` VALUES ('1','1','login_success','user','1',NULL,'::1','','2026-11-12 04:01:05');
INSERT INTO `audit_logs` VALUES ('2','1','login_failed','user','1','Attempt 1 of 5','::1','','2026-11-12 04:01:05');
INSERT INTO `audit_logs` VALUES ('3',NULL,'login_failed','user',NULL,'Unknown login: \' OR \'1\'=\'1\' --','::1','','2026-11-12 04:01:05');
INSERT INTO `audit_logs` VALUES ('4','4','login_failed','user','4','Attempt 1 of 5','::1','','2026-11-12 04:01:05');
INSERT INTO `audit_logs` VALUES ('5','4','login_failed','user','4','Attempt 2 of 5','::1','','2026-11-12 04:01:05');
INSERT INTO `audit_logs` VALUES ('6','4','login_failed','user','4','Attempt 3 of 5','::1','','2026-11-12 04:01:05');
INSERT INTO `audit_logs` VALUES ('7','4','login_failed','user','4','Attempt 4 of 5','::1','','2026-11-12 04:01:06');
INSERT INTO `audit_logs` VALUES ('8','4','account_locked','user','4','Locked after 5 failed attempts','::1','','2026-11-12 04:01:06');
INSERT INTO `audit_logs` VALUES ('9','4','login_locked','user','4',NULL,'::1','','2026-11-12 04:01:06');
INSERT INTO `audit_logs` VALUES ('10',NULL,'csrf_rejected',NULL,NULL,'Path: /bsams/login.php','::1','','2026-11-12 04:01:06');
INSERT INTO `audit_logs` VALUES ('11','1','csrf_rejected',NULL,NULL,'Path: /bsams/admin/departments.php','::1','','2026-11-12 04:01:06');
INSERT INTO `audit_logs` VALUES ('12','2','login_success','user','2',NULL,'::1','','2026-11-12 04:01:06');
INSERT INTO `audit_logs` VALUES ('13','5','login_success','user','5',NULL,'::1','','2026-11-12 04:01:06');
INSERT INTO `audit_logs` VALUES ('14','2','access_denied',NULL,NULL,'Role lecturer tried /bsams/admin/students.php','::1','','2026-11-12 04:01:06');
INSERT INTO `audit_logs` VALUES ('15','5','access_denied',NULL,NULL,'Role student tried /bsams/lecturer/sessions.php','::1','','2026-11-12 04:01:06');
INSERT INTO `audit_logs` VALUES ('16','5','access_denied',NULL,NULL,'Role student tried /bsams/admin/settings.php','::1','','2026-11-12 04:01:06');
INSERT INTO `audit_logs` VALUES ('17','1','department_created','department','3','ENG','::1','','2026-11-12 04:01:06');
INSERT INTO `audit_logs` VALUES ('18','1','department_created','department','5','XSS','::1','','2026-11-12 04:01:06');
INSERT INTO `audit_logs` VALUES ('19','1','course_created','course','4','DEE','::1','','2026-11-12 04:01:07');
INSERT INTO `audit_logs` VALUES ('20','1','class_created','class','4','DEE-2026-JAN','::1','','2026-11-12 04:01:07');
INSERT INTO `audit_logs` VALUES ('21','1','unit_created','unit','9','DEE101','::1','','2026-11-12 04:01:07');
INSERT INTO `audit_logs` VALUES ('22','1','student_created','student','23','DEE/001/2026','::1','','2026-11-12 04:01:07');
INSERT INTO `audit_logs` VALUES ('23','27','login_success','user','27',NULL,'::1','','2026-11-12 04:01:07');
INSERT INTO `audit_logs` VALUES ('24','27','password_changed','user','27',NULL,'::1','','2026-11-12 04:01:07');
INSERT INTO `audit_logs` VALUES ('25','1','student_created','student','24','DEE/002/2026','::1','','2026-11-12 04:01:07');
INSERT INTO `audit_logs` VALUES ('26','1','student_created','student','25','DEE/003/2026','::1','','2026-11-12 04:01:07');
INSERT INTO `audit_logs` VALUES ('27','1','students_imported','student',NULL,'2 imported, 1 failed','::1','','2026-11-12 04:01:07');
INSERT INTO `audit_logs` VALUES ('28','1','lecturer_created','lecturer','4','LEC900','::1','','2026-11-12 04:01:08');
INSERT INTO `audit_logs` VALUES ('29','1','allocation_created','unit_assignment','9','3 students registered','::1','','2026-11-12 04:01:08');
INSERT INTO `audit_logs` VALUES ('30','1','consent_recorded','student','23',NULL,'::1','','2026-11-12 04:01:08');
INSERT INTO `audit_logs` VALUES ('31','1','consent_recorded','student','24',NULL,'::1','','2026-11-12 04:01:08');
INSERT INTO `audit_logs` VALUES ('32','1','fingerprint_enrolled','student','23','Right index (simulated, quality 66)','::1','','2026-11-12 04:01:08');
INSERT INTO `audit_logs` VALUES ('33','1','fingerprint_enrolled','student','23','Left index (simulated, quality 70)','::1','','2026-11-12 04:01:08');
INSERT INTO `audit_logs` VALUES ('34','1','enrol_duplicate_rejected','student','24','Matched template of DEE/001/2026','::1','','2026-11-12 04:01:08');
INSERT INTO `audit_logs` VALUES ('35','1','fingerprint_enrolled','student','24','Right index (simulated, quality 93)','::1','','2026-11-12 04:01:08');
INSERT INTO `audit_logs` VALUES ('36','2','access_denied',NULL,NULL,'Role lecturer tried /bsams/api/enroll.php','::1','','2026-11-12 04:01:08');
INSERT INTO `audit_logs` VALUES ('37','31','login_success','user','31',NULL,'::1','','2026-11-12 04:01:09');
INSERT INTO `audit_logs` VALUES ('38','31','session_created','class_session','60',NULL,'::1','','2026-11-12 04:01:09');
INSERT INTO `audit_logs` VALUES ('39','31','session_opened','class_session','60',NULL,'::1','','2026-11-12 04:01:09');
INSERT INTO `audit_logs` VALUES ('40','31','scan_rejected','class_session','60','Best score 16.46 below threshold 80 (3 candidates)','::1','','2026-11-12 04:01:09');
INSERT INTO `audit_logs` VALUES ('41','31','scan_rejected','class_session','60','Best score 13.84 below threshold 80 (3 candidates)','::1','','2026-11-12 04:01:09');
INSERT INTO `audit_logs` VALUES ('42','31','scan_rejected','class_session','60','Best score 18.61 below threshold 80 (3 candidates)','::1','','2026-11-12 04:01:09');
INSERT INTO `audit_logs` VALUES ('43','2','access_denied','class_session','60','Scan for another lecturer\'s session','::1','','2026-11-12 04:01:09');
INSERT INTO `audit_logs` VALUES ('44','31','attendance_manual','class_session','60','Student #25 set to present: Fingerprint not yet enrolled; ID card checked','::1','','2026-11-12 04:01:09');
INSERT INTO `audit_logs` VALUES ('45','31','session_closed','class_session','60','1 student(s) marked absent automatically','::1','','2026-11-12 04:01:09');
INSERT INTO `audit_logs` VALUES ('46','1','report_exported','report',NULL,'unit: Unit attendance summary – DEE101 Electrical Principles (DEE-2026-JAN, 2026/2027 T1)','::1','','2026-11-12 04:01:10');
INSERT INTO `audit_logs` VALUES ('47','2','report_exported','report',NULL,'below: Students below the minimum attendance of 75%','::1','','2026-11-12 04:01:10');
INSERT INTO `audit_logs` VALUES ('48','1','announcement_sent','notification',NULL,'class:4: Welcome (3 recipients)','::1','','2026-11-12 04:01:10');
INSERT INTO `audit_logs` VALUES ('49','1','settings_updated','settings',NULL,'{\"institution_name\":\"Demo Technical Training Institute\",\"min_attendance_percent\":\"80\",\"late_grace_minutes\":\"10\",\"biometric_driver\":\"simulated\",\"match_threshold\":\"80\",\"min_quality\":\"50\",\"bridge_url\":\"http:\\/\\/127.0.0.1:8765\",\"consent_version\":\"1.0\"}','::1','','2026-11-12 04:01:10');

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

INSERT INTO `biometric_consents` VALUES ('1','1','1.0','2026-11-12 04:01:03','1',NULL);
INSERT INTO `biometric_consents` VALUES ('2','2','1.0','2026-11-12 04:01:03','1',NULL);
INSERT INTO `biometric_consents` VALUES ('3','3','1.0','2026-11-12 04:01:03','1',NULL);
INSERT INTO `biometric_consents` VALUES ('4','4','1.0','2026-11-12 04:01:03','1',NULL);
INSERT INTO `biometric_consents` VALUES ('5','5','1.0','2026-11-12 04:01:03','1',NULL);
INSERT INTO `biometric_consents` VALUES ('6','6','1.0','2026-11-12 04:01:04','1',NULL);
INSERT INTO `biometric_consents` VALUES ('7','7','1.0','2026-11-12 04:01:04','1',NULL);
INSERT INTO `biometric_consents` VALUES ('8','8','1.0','2026-11-12 04:01:04','1',NULL);
INSERT INTO `biometric_consents` VALUES ('9','11','1.0','2026-11-12 04:01:04','1',NULL);
INSERT INTO `biometric_consents` VALUES ('10','12','1.0','2026-11-12 04:01:04','1',NULL);
INSERT INTO `biometric_consents` VALUES ('11','13','1.0','2026-11-12 04:01:04','1',NULL);
INSERT INTO `biometric_consents` VALUES ('12','14','1.0','2026-11-12 04:01:04','1',NULL);
INSERT INTO `biometric_consents` VALUES ('13','17','1.0','2026-11-12 04:01:04','1',NULL);
INSERT INTO `biometric_consents` VALUES ('14','18','1.0','2026-11-12 04:01:04','1',NULL);
INSERT INTO `biometric_consents` VALUES ('15','19','1.0','2026-11-12 04:01:04','1',NULL);
INSERT INTO `biometric_consents` VALUES ('16','20','1.0','2026-11-12 04:01:04','1',NULL);
INSERT INTO `biometric_consents` VALUES ('17','23','1.0','2026-11-12 04:01:08','1',NULL);
INSERT INTO `biometric_consents` VALUES ('18','24','1.0','2026-11-12 04:01:08','1',NULL);

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

INSERT INTO `biometric_templates` VALUES ('1','1','R_INDEX','simulated',0x5b749b747318ab47a3c5960dabaa58dd6a7afc4b185d15405e7d4af6a8f99dc9be32f7ef83f43a3651cac95ff614694a26a57e913c22814986b19a78c25583ba1fac78b9acffce9098c8e126f044da4847679f9f8623fb6592a3c6ede096dd854b6fc4de89f28346f9bfaa3078e35ea4002e35f164b5592ba6584cd8d09c533ecb3c3ef409148e0ff4b50060fff0586ea5595ed24f0e8e3120cf9584bbf9940a56475586d5ac2bd39f72564ec0b263d958a0aeef24a12281df466ea6ad6150ae707948e3a043d4f483d55ca17c7560e8a7a7bc77862e4770d7bbbab10bbc4f883d92b478804646f8e7b7401894ca1520313a68e1be53a710e6870f5292a7c6b1ce8bab7b9e012447372be830f5f9666602b3b44d01b18feda34df08f3761cbba91b7cc09f1d07ceb71cd373264aa4fdd2e699b7883260991dc474b54f9bce1315caf013ecd27fba6d2a6451080555b881f8bfdc8cea56ac7ed4331476c2e17fe3761e5bc2c9e2f730b07a103e6bc85b382811593c67fac2973d033a3d1a5b164acca4a9c70a87a9fbf18b3f15d217769c4d2db4cfa22fbf07b8c0eca909121af3bd0c4460ad4fe74d6842bb4a3ba665ba65afb0feff51b730b510ec4639d5a05cf67dd794df9c33dad913551211cc6fa86ba477701d30d71173bef91a0e821550c83648f905b7710557050097fdff738a5944d7a03,0x6d8b2d35efc6d15af9f316cd,0xce51f837f8dd1d5bc2ad83ab3f0e30a3,'a2b288eb896b832c706311509c504eb2a86a9413a8565565c444c81902ccd4bf','89','1','2026-11-12 04:01:03');
INSERT INTO `biometric_templates` VALUES ('2','1','L_INDEX','simulated',0xf1215a11c7d9b26b794d88771a6d3d90d45f240dcb23dfba968f66107e8291cf544a156cd7a0e8b3b0fbb39668c93c0a4a0991d46a312399ea2b4975b1080d75414ea6d3acd05fa48afaa82eb19256d6f42458c68c463ddcf0bf9acb5cc58630ae7b206003c815f6c1005d157d37fa66a8441c098625cfc0bc143094cb93f20cec7b8e411142e1e01d92052e84808444a3d6d74ef47824aab04bebad32c19ba4c7f366fe2b3f40516446bdb8e7492b598d69ae9f3b1bac7fbc02b539f2504c670ca366f0c33c1759942b8af7094268e368e21e7d3e3d129c88ae40c2c59226bc43412c508f3ececd3e36562be14ac1e8318fb87912f0225c8bd66f95d02d262df3ff49a996f1cbac9c908b2810977b0d2fad7c7ee5d7ae3b84c5f04032bfdca97cf211aea3ec5bb8c89abe7fe1b163aecc2c7f199350e05915cb98e57e25f404816c9131dda10278f48ccebf1c811a871f3575e50e3e19f2ae5cb80248d5ac88a99b373cf8a2c5d33e0cb19df3e8e98f490be6aecef88d95546ada13d243747773365966cc197a63f627fb96f9679274c9cd1e0f14c2f298a83e10952c2b8c5a2759df29486581471784c72005a0ec8096c11376ff9a13b3973fdd9919ef328a6958de5da46e07eb1bfe990001f77c26546fdc7b51468da356c4c7fbc51e31303b0eeace7970f1e8ac7b7e89902c8e8b1929b2ae,0xd8f8e1ad8b3c9c8de3b26b8f,0xa1f5a96be80f0a400dcc5f2db0f765a7,'e2e46f108bb4c085bd9e5410d4ced6b8c59bf590e59339d5d1405fea5a4e054e','92','1','2026-11-12 04:01:03');
INSERT INTO `biometric_templates` VALUES ('3','2','R_INDEX','simulated',0xd78ba86cb1a6c6c66ba07fbb63b61de8d462f4ef3f125909aea75fcd586ee18661b6eeed4616f5944faa2e6e6db6a87023ccaf578a6c31fed2bcf61d900e6b7412d59e6fa3f267a4ba2c5dc1b8ba0b91589041302e97ecfa055d45ebd384c1a5cffd9db672618c843a16a100bdfd62e2b760abc8597bd631130094d4eccf3da822097c4ac95a48c1c05d593c6f1463c1769a122c128a512794999aed48b4e0734c7d4fd9123e80cb9312f678829b025906ebb98de99efc059f41a7329a6fd2a0438e8bd59aaa0df41b503dfee9c237cd8cec566c9bc707035c654e875594426aa1c4b8a076c420206bf666942d2419a84aed18331bf61640ae11a384f9159d62d86b2aeb34b21ecd2829f85f876ebf0196542785346a32f8371b6e6ab30fd480fc0fe315de487ee128ebaeb4f37bcc3556a3394bc60543cda93ccf204a2f3df1a3c730c328132af431ac3b9994d0ecaf0e2cd9ea6c394e9d866db1a1c165d2d83a5a90e924d0ea19559ccc7ac4660e0e2f439c6542c4aa672fcab9f5ff99f2a6abd0def5d4723951d82a6b97351b0062e106016ae2ae53b001f0fd705b3b0641adb804f02118ef92a57534501ee62edd1bb0f6232d585c36fe48908b4d56b1f8cc7722324667dd98bc2edbc52183b5f216bd826c1540d8279035c1f2c762ccfb11ec57e336d917297f5e79178ea32cad45a0ce8d3931d416,0x140041daed43e5ccff9615e3,0x4660fb9d43c9bf2272f13c6cdbf32636,'c59e0c23f6fd70acd5c35d6fb348b100552718a601c9f1e002d3cd14a0ba0302','70','1','2026-11-12 04:01:03');
INSERT INTO `biometric_templates` VALUES ('4','2','L_INDEX','simulated',0x1b4d773c0f009bb668d0087390d287ce76452f68064ccaddbb080c470daf578c1d71c49afcace9092aabafc56e7da245aa1a85ab051aefbd1cf98ec5127c2b768c7d33c75d07db626c61d40f62175599d96720d8de681b2354f36ca0c28969abfcc9c7cc03248403fdae2846af371b7511042d8b0495a19eac9d612549c9c8c3691dac90b9774cc22eb073ccccde755caaf6d6db8ac3d58527d91c91e7437f9faaa01ffb0278a44ffb1ff2e1fc063dce9ba7b2386344e7080c37a85aad37ce4bd17728337562ebc42920b0cb8386d04064fe7f9e186701b157f1884cd199fed8d87916b7ace856d4cbae3ce0a1ffd57618951bc28e3f4bea9341fb6ca90e216af6092c60c1883684c4a3bea5ac07815f58bfa91dafcb21f07c8ce74729cb5c84405f354be22d70d4998d07ac3da4c0e1e1d50a8081913cd8575f8ec4953eb52c77c541395c5c533a50f25fcdc569f37331b2e89fe32b8ea6760db7eaf510f0e6177cac21d87f108d067ac21411f5ed6955a3c14407ebb0d1a65e6414d3ae533d1c2ad1dc045653296ece17108ce89b2a83e7fb2791cd9f8ca7bf877769b163afc7bc85d137c81f641e21a3a96b35ca1cf6aaa8e2377c7d9bc39c70cff646a1d47cb54fa21481a7606f36ee69a0802292199499d55b5d2a8e0e651ec8fca41ae7e78177c75ca67644cc9dbebb6f4d2b64ba1c9021ccede2270f15,0x275b4b6f1d77fbde455d8fb4,0x20a48fda03303d7b3d0ec4465806aa77,'0a752b94f403045e158e04166fc9c92b5ae67ecb0046eeb8f1a11ca460e6e732','95','1','2026-11-12 04:01:03');
INSERT INTO `biometric_templates` VALUES ('5','3','R_INDEX','simulated',0xd0e0fdfbc4d69d91c969b793a0a93f2b2bf013b64d9d431eb9fff517432dc100ca7c04521013c79413f30333fc14979e49934befb3ee66c627b24d3945855074976aeb5bfe84c5a38fb89bca0f2c0b0e960a0b76ed0af7ca2778c7b300316a6e76b4732dde092d5d28bfabdb2b4b1d90d77b79c8f7b53d01e263374256dff88c2da2a4fc3021e1d1ba58bf7120a705a34a63c06dbe226420fc5c30615c56738285ecc580e953b425e3a283e339e8ea6571d892088c95002dc8f3606a5f230aca48a81a6f56d7e2955062e9649f7add503e3b32aee2a15b510d63fd57af6fffb9e757a65a427b66df6299abb6d52c58de4addbc49b6d840fb4d595977cb460d0e19e3e23cc4e0cce01718ac15ca70bc1a0ca99a1099b015e4bd6b012df75f5109534ad88ed1df187ac9204b69b476c28b71ec0bcdf9db8ca99eb74367eb096cfd3c475ced646006bb9bfd72af6e1c8015fe84e7ab5df41d5b82d944e15da2c7ce9d90b05853f025f2b246cdcf10cf1405e6375023907a9f2a68a18a937b4c9bfa19f09aef8f3284e790816d5d32bb5568735b5c4f293d23e73ff344a99fadf2f97500a8957b561dbf909f6b88ab2b6d826adbca4417efcf5c7e644c963077bee0202b75cdb9a2c1d1eec3b37ac34442c2c5a9952f797acae9ea98c713d1eafcc57f0b2cda70fd755809e1238ca7a243eb61a15ed73af5de5d9febb9ce,0xb273c654f45a2836ec7186cc,0xfb0fc6dc9985c04ea6bb32ec074104e3,'c9bfbfdd9b0c72068962ae60c2e94894d7bf998b2cd7549f62e4c776ae1b2056','92','1','2026-11-12 04:01:03');
INSERT INTO `biometric_templates` VALUES ('6','3','L_INDEX','simulated',0x280acc48fcd8571aef3e77bc117c4e648074afec641bc35db00875aeab9116ff5f8f15ce1ea98ea51540f3ec684532176b0f78ba8fceba365831115cdd5b7baf6686085966de895375ef70519223f8d62d5581dd1dd9df3016d3b0b8d49741933065fc4fb2127e3d891f38dac4be4b4b6673402c2574dc04b7e18ad5ee3c5bb68d67025cc085a296c17fbe56f3f2c6e9f0cbf8a1bcd05555c22a92f758f51217c8cfca209fb61146a06001df021b6faa2dc61926111cf5b3d804b73610792568c26a12f295ef225da3e4f8fdbf959937aa6c45d93d9838dcbb60595d068ab8dd98f236fb899912c15cbe3082f31d3aff63e5c5b212ad7a09d2b90a2c014dd44d8dba66225ff213236f5b189d814c8f8e329d5cee2552e951dacf67c43cef73bb45e886478b0e8790b0a6645f5838c83e8c950b16ae6ad5367ea5cc621744634c4b1a0dfb2499c490fce7a7f6fdf8627439f9626db59bbcef07d5b7de49f8b972556ed1628c42cabb20464639dc9e29e48a89051340b3da78e2b2a512f83587b640d1f9c436975e7446d1201cb20e7166c37755574ae49ab4f7c68e3f8a2d963caf8597afb2e268fb3fb16e0bfa444fbe8144f6e737b58d923b0a795a22551851a147ec3645bd511e337267a8b1a494285096cbe2dd68145897e40dbd8b0dfba2041a619e4bdfebb6a89978db246bad82,0xf9a47033e3ac5fc46dd67009,0x02939598f566426cb351da78b48acfff,'c083631d52321a651ba54986f83694c761622c66fceae73b30eeb3d7e3981ca9','72','1','2026-11-12 04:01:03');
INSERT INTO `biometric_templates` VALUES ('7','4','R_INDEX','simulated',0xd5adbc9d7cae4802958c9a11d8e8974fefca13697b83a1e59fedc18e2e571343df3e655d0e663aaa046c04a3dcc0b919ad96d02f1a621db3fd20859bf6bc3adee01e5545fd35bf2ec5e8fa18eb1d078ec6508269c838a25067239ed6e29948f1f4ee6f30ee216c3e902cf23f7530e9c2eff0352739d221a2c7f50522fea06d9afee80689eb8cf4c42e200ea23fa99a72b2192c4f830513cc4f873b3a3fc4060df958d93f37a28c542841a2e50b2b1a64d1295d275f4aa7f20bb506fad7a413ded884b8f2827d3a9c52bad58c7b1a4c33e15c9c9f205bae4ea570857d0ce435529ed1cf42fa368c1a603de2e2216da4b825fcf753b7c304afae6cdd262662c204873ddd5700123b799ab9e7fcf4ca7861e5c7cffb2a8db9899a7c12a8fb880a04cf5d8014ee1ebad950324fa8f0bf2d19cf44cf2b761f1f9ce6bdfb69e8349fc17d4a3b58e0b6e801b65cc68af01ae671cd5446e287a9c4b3cf5a7ff372c1795072d0533dbd3c57162cc7ebb89ba2b1c5ef7ec36ad902dd34929e5d01dc89c14d0eca237911bfbf1c6d0a7273acb48ebb575352dac14b293356e49e55604fe7ecbed47952ee57d7d02467efb1d4cc572c8dcb787a2255ca9b406802272ad59baeafaad6df8bc5b901df250b98efd9ddb17a204a084988017466786849665bd50b76acf6241504c5eaad012dce228beded1601,0x8422b91d38d14852c3a30243,0x826c1770d64832bdf47e3c7c45ebcadc,'3394555821fd78172ceffda27057747280f2b9f98393883a4425da6f402c6267','68','1','2026-11-12 04:01:03');
INSERT INTO `biometric_templates` VALUES ('8','4','L_INDEX','simulated',0xc876500d46f534de9fe2c40663c5fdd310b154f37e064e7e3b35dc6c6ed764b5cfd5ff9a9a97c0126fdb55330d71d0dc59e21ac783dc4579426e9f5f5dafeb25c7ef07ebf5db41a3543710586be24f62add9d0d566cce984bf61e7cd7f0d3e9cd00bace4c2ba29458400a601016442c581b1eb3b4d81a05415731fa187727b10793398c0efc61685823c1c73622dc42ad288a5ec21d821e449a0b433d454b83cea5aac9cfdac204d6155355f4219890f374b416a03895954c44af2649d09e0daadc9b145f43c905f275586ca25757fe064c585674b6f39fe8948a86de41aadcc28911407a87b66a000aa33ae19862c90a38eced5d80900b3a7ec62c6d94a916adce295025846e4b722539cd5e05694b2bb5b20a98c95e34430ac863e63293c3fb970bbbf398d6bbc8e2734dd3f350d07cd4295c8d86f059e73585d519700e31d93bfe56ac7db8e1ef97d51978f7356023c83a84aaf05bb674f7ae48d72d5df656eb53d4e058390ca3339742a40e8bd099e8cd372ede7959d696866e7af5eb9145ae5a97ad00904b959c13c0277b37ad3541ef1e2a15a6c3212a2529c8f5a646b30a5acdadb87dc3dc3ccfc197530ebc17a6d546386ec4599a44aa99b3507a1d91b03cdec3eb91c687f3cae9b3185e73929d776ee19d38e03de0f2182adbfbdc65962a85404cad8f8a73dd4c0e2996730af03,0x7f855d79cd5d6696304d1e78,0x3b698ddd5e0c6f35551bcad42ec15f52,'a50e73674752afbc4ccc4f2e662dfde11ec73f6129572f90b80a9d0e12f907cc','67','1','2026-11-12 04:01:03');
INSERT INTO `biometric_templates` VALUES ('9','5','R_INDEX','simulated',0xc6dbe6411c54849f7c4c90beeebe5b04316a81b6e4a01f11409877a9aec5e4ab4adc3ad3346959e5b3b1a02b8a9c6351c10e5e198e3511d355653575bea7a5cd7664b56d43c8c9792d0691735ef3dc70c1e19ca1f2b3fa4aedde87b01f34a81a5ae533393201d57d1290cb1b1808710c2563f628d6d5c143a51aacf10dd649b8c6a9d1337ce9ac89c69735409b612d986cea2e92e954ca696edb2dcdc5e8e3992550245a1fecbf75ff62484adad5c79f54a5829e3e19f623c468651bd3d81930f96f96091aa1263577947d0263ad86ba907ae37b433b0ad7f993c3539a0a6e5330b78863426d61d510311216eabea4d7efffdfb298952b481a346f8f2d8b6339e98c199e052a3ee1fcbe8ac7f8704e21b2d0ea8c7b77ecee4f8bac63c5ca32009ac019791fa889267c10de68880af5679c07a44a9ed214970f0e47743673e640d5466cd5b6e81dd8dc7333c98e15a29ed39961f80f174ff7187fb68f0fadc211c25a46ad9aeac66521e5cd97c3dff0fd40e3e8ecb44e55ffad943574e45535dee2d968accad8f57bdb39cf3e145b5aae88e55c58733e3cb5699a9108660c5420c310c6f19a6d63a11795b0d6c80bac45816ffce16e106a01c7290e7dc06b78a03c0d373a65ec67c61ba5526154b8643df7fe8b91235af36d62a59b05b89b781280a1776047c9fe1421cd1097dc46c52ea91b4e9a09,0x88b8a8c2f06d371e2989f958,0xbf72a36393e9423a7a796f8e90fc346d,'efd6d65f99b57cd47ab4acbcc6a30906e5771944fe585afc5e91672c6e2ff177','76','1','2026-11-12 04:01:03');
INSERT INTO `biometric_templates` VALUES ('10','5','L_INDEX','simulated',0x6bbdd5c3a9adc72a0e6454c9a61a6041572bffa49e99532dfaa7499e7c083660e4518fef420d2ce21aee69e142c89867fb10740a65c3da7041f1041fa2d0271e7d987a045e4af5a1afac29e4c203e3b36e9c13a7a13cc52795b9b81ddccb65f88243662096f726d3600cca45d2bd5d378efc30fdf1da7b969675008a8b2ab3edf55bd2fe41c365a513517251385c28d3f5666f8fbe9f61b8dc41f021a5275a70ef57ce8c7f5608f588bfb803c99224d0e83371379093d5a5d3a7f5dbd48333da8f5ba1f52de16420cfb29b3ed87a660065dc40527a150e3bfb620d8e95e0540245111856ab49e0a5f5bae97fcd1281d764c3988e6008c2d805354bf3777239fd5628f051a118e820f3ad91a72bcb9b1c8e8a94a6cda696b1ee0cecfeab3b44175c7426b8319556bb429d2b745487ca631aacf33f4e3d517c382ca4c385d92ab547c43468cb58eedbf5881abdeab17153700a38b9d0e75804456126bac23aa0441eece2ab9dabe22513e3fba2b7017f908647e41d8d7704c8c47d2cbf4a8fb4795143194e248ebed4653d718d593fecad1ce2af835f90c60ec5ff878315ecd61d163d54b2c2a0313ccc292c4859db808049b999a1be3ba335f17860ecbd4237bead0a8d0d700b3534810cfd0c5441dec4cf103f631d6840c0f8edad832f10d46ac891009b858cf1ba8e09c08908bf5404aa,0x5558e7d6664716ee3d662c9f,0x75cd5e5e068dc4c6e190e4d4f2badceb,'ca307716610ff7e8d14559ba463a86d70999b1033fa25017b1525950ffbd8bf7','73','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('11','6','R_INDEX','simulated',0x408c92291acaf7d7351cbf39c2243254d46f68fe7594c4b4326ca3c74000c051403faf2ab707a690799ebfd9182b93f8b6f976d54e6031b70b94d70da584fc46fabb4de615ab1181f3ecd7bab7348d7c2d266a95ba3ba46095ce5c225f0589b5c0d46e3d8123fb4fe9aaa91e0e1b0b561f997fe66ad7996ecf9027055e40d3177cd505937dac472d940e9a7b329e8a166f7ea640da6e3dd81ba5dd048089641f768e17bc100320c1834c607f9d9d782d69985f8e8a1b37f19ab6b297bdf102ad3d75ff6b2bc62d34c56476213ab96e18096a3e35fc5131c646f48504a34522295f70a5db8846cc1312bd960aa0124135538448c6f6ca12e038a85475616a236bbbcd699e7de5febecc3fb6c66d9bdeb785f2ad5e01883801448b2b66d149b5a656f9ee77a4cfa8a7ad576a0c378944a120b6f5848596df8e63023fb68c6fd1d04cf5a177ca4af8de09371b86b1cdaa308a2d8c28a6bb97dacd36e6c7baeb139b56b771ac7472fbae8e4577e962f099840ede92e28640bcd0274c029b9fb730257008cecedddd57c131d5b8effc2ca7217efc45f0f2e214795a696fa3b94d9f8e53084d929ea8f4f5c2b79d8e18fcc2ed981830e274b54113b7b94e4406cc6e58356d06e2f3c1c662ac625be1445dfa443dac79d7e3ce2c7ad4405928d70a4f03ce3bda67d982035c60b7a3c4fc,0xb713338ead0fc763d9144e76,0x58b4456dd7dc39f399564884e27c5d5a,'8de7069df58dfb9824aac1e96ba41cc5eaee3cfa205cc419efd32646fd23bc74','72','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('12','6','L_INDEX','simulated',0xd8f72792546fb053e11abac2779f4d3cff2a6e4509766d2d17b0a06fffb19b0dae631419ded87917b73d81f85497d25200aa188335f5aa2603e46310ee43aa0a7bd5747bda0f303fd708375167be31b4fd89f731c2096596d9991d86c65367b33877041d68c07f5b969ebd5ab313969f6dcc64cc0883162e4b4d2f6e50f97d51e48beb63d2c4c9b38d67db0f59254d4dcb521f85c6fa57ccf5bc9e9bbdee2a95d68dbba4895c524bc4d4ccfe4146abbce0924c6f31fe9bf25bdbbc8afc3d8916a3fe79621b3cfa0125caf00363293bd1db42da66e6a8d1535ffb6343ccc7d5c90a1b9a331f1851cf2d63e5bc04980c4e1804fe0e8fa75353b75733dd858e279c0ce035738ebf879529066fdbfc56e74d7270265e7d9078fcf79678ba068477082c5820b69d6108234e686756a041d226d0104feedb2234802218fd90c400992ef9c9064d51d10024c85753fa0f5d50278bb6c18e922f9d13fd18171427e20ae58f6d7615c348377d76c69aad26c1e13469f4c5c5b2d79265d33ef3bb20661e29a5bb23969b80a1c65f885bae09013afdbebefb48606b6df2ee7da53dacbb7460864bb527fa0e7d364d51330de511608f1b54b97313b976707775cc74459ec3c8386cb0259a4550fb787e5f62836013a6d6479405734c463cba3e0b1d7ffdd431c036fda0730d98611a8a0dbfd921c71e06c862,0x52183d9b6e86c1b74b4571bd,0xcc19fd9edeb6c64164f2761310911304,'9bc4e918e8aeab19c6e88580dcb2123f75a998c9e0e3c2983e0467f3f39e2f5b','71','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('13','7','R_INDEX','simulated',0x3f08e2d5ccc1cf025ca387a64cb88c27688d288d28ef373e6f84b429c76923b85d1cb06d7fb04b869feac50c8baa57236f05533f39e328cd95ae3f58c8ae275171205aef2a6f63b22732f16ebe81a32a0485ac7c512767e14b2020ecab39fc48a6f56c39ce15f21c6f28495df1acec993348001194ffb2cb93afa1bf2680eb27a5ecc99ec34c07b1a660c6eee2b1482a53eb7e386cb9c69b3d0845dd6f737356cfa365d943197c20b285476a12f9c5acebd9d086920ef7bd9d55380c0dcc8a46d93a2d4d48e0d01646c82317cc93f910dd70c0c8978b3dfa9380cabccb9d086c37f4cc3f3c8f46646c09bb85d649b14e7b67386363c1add8d92d0e20f1a0ac0a46286df1566792f10522b4a82edb488f12a0b7b671c84d8aa6b1e8e142f74c999daeb94b3794e1b58a55ca637c58dcd3aae93411c61bc00a4b4c2500e63f351b778a2c1ddec8136fcc55231294595f2dc0e15dbe1df3b8ba6314743364209aedd240a09ccdd1429418d4aa0a22b6a1d789a9982dba09c5dc7c8a71b4da7fed8dc4a14fad240852fd0043499c5d4bb2db19f09594969923d6e838e00d03bf060f80f9c43de4941a8cd2d5c63ba1a16f5498449edf098a5759d99a68e9042b6713cd43e22c827db85262a02f02fdc958a1d079531427e3daf5d800b9868da9cbdb1ad20bd2da0086bbacc12a90fa2ab4b77438cde2,0xdc9cbc3693090f5ddaef6d03,0x6adc43fb361fcc92e521eac984bbdd09,'aac517702f1cb307be6a77e9e4f9618dd985bf1ac336f236ace9b9ff32662bb9','90','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('14','7','L_INDEX','simulated',0x60aef896720eb5fa9cbce48dcbf272ea480b5a06eab9ed99eedb2b9bfc3e468ae7fc89da06883c831d53fd57ee5380470e61680269cf8911dcd38b59c009b3aa92f6be8cc42122af3e91515284a88ca6575f908558dc6dc06dd4d10a2f75801d1706d447c0916c1c6e9cad57c0ae3f040fa2dc7dd3aa342c41f5d2ceafb3f90ebdd4e8c5af493301942791688dc3c7884db32af1d981f3159576ca35823084d6f9ee14b0f8503e40d134884d756e131d11ba25871a7619a14832b3b499d946d991036285e1f9e3525dfe38d9cefcc848a657cf693fd302eb18d66ef01cf6a040bb266393168acefd8010493e19a3a3330b13174cf34368d79cafd05f88b6434e3353491b79353a32b89a536e4601a53827c5ccd5b2b84152c02bd87596013ef3c5a5155132a1be87a406e7eed5f339c6b35263138048ad4aebd8cc832c46b8a391e5178d15cc9d604f42165239b6d315e37244f05034b49bd03da568e511857e1e45fa710106c571645cdf16a8343d91a6c5d0ba59df0045bfa44fe787c41f01b750672fa8cbc6fdf704792266e3243ae86ad86232327c35880e19469808458da3d065abcdaf4d7c72b18e97c49150ca835059f256f87e9c4de52db1b72e740362e49163aa7ff6c13f484f09295c857a4cdee32b4640bc4fa4fcd4b4881ba6a7dcf71d820b1447a37d6bbbf4f8e888b5e4f024bfbe1844,0xc5fc8ca342b37930b21eede3,0xaa3524fb07d74a3249991cb6acd2dc19,'6400270641b5850c9f424a973da21fe606883ffd323d47784e59540af02b9296','74','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('15','8','R_INDEX','simulated',0x514a19bb47716441982495d9351172348e1ca7173dac38d6cbf52d1bedf7f297efca30fdf8fbc2c9bdea5f715c60de6999b0abb2eef307295da07e5434119015209145b79183aa23e1ed3f53be6dd8199d2f1a2083dbe9feaea3000bfdd1eec8c90dc1ebe093578d72cad12bfb696da4b0ee74385b5717316d34bfcd0885733bf4b837ab7a209d06ad5996f33fe8c076d3e32e1f607137b0ed12c26ef88340dfd35082554b962cf1a4be1dec24feade8b79b282b4a1ac663f33ce270b49e4fa6f2e45f4c09308afaa3d76edcc7dda361628a687c7504aed22f004d9ed58bd2429ff600a6fcefd8b43729c62953b221f60a5ede4df6a09438e247ee4208092293d4e90d2caa42eb52492bd8694f0c2ad0ffe9a1e56a6d19fdebd70bbe1d00a2d3a10b96a8ecb4d7fd8148f0ac0a1acfbd1828d8519099df3781c35f210ed8ff4797b855236ee335fed237d81d062dc4169c5f1152c5a0882ad2009b0f8373ace441b014d68a40e281fb5739d12025ab50cc046e4608b00f25a311ff699dfee0c8e2fd3cc65d817d0b7b12cde0a89a9a4b32ea72e05a11b03107d092fc7f8d1b94d768a8a16cf06219a7ac134c790ac5747574d71b86f2b1719b048e5d04ff9f9ede9521d7e8f1b67827004613ddd3eab88827e231fbffd1af39d64b4e9bd4e07a0143231a0b8a3546311aaaca62c5db3c678bd7e0a2c1,0xd9fb3b2ba00b2b64e9a6ac50,0x511b8313983eb9eadf3cd43ea9cabaf3,'e1701305b520838dc70484e01cac762531cbbc30ab4c3c378ae9dbdb7d5b4009','72','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('16','8','L_INDEX','simulated',0xc8209406a3afde10326497f632be182840dbc7de83f972b7eb62f605f2d84d16c6cc03f4b47eacf708dd9a4adf0099dc8bfee632a89c5ba8ec0e6a29fac25fc7890cd1267e8fd1640fc29bf24fc6021dc5ef5858353250f03b84aeda3662a2c5abee74e8031e7870caf6e8339f789744fcb8bf6cad344b4c76a30a8da6eb2a0b7d2773145d88e87223683ae6fe1230a0d61eae0609e5b4d983b3b3a97721d8472f72d7a96fd338801c436e0645ff2c88162e4da0ea6b7a0148b3ed444fd06579747929a386fe826f20d9fb1a398c7c9449e2d19dd408dc9a8c7d54614637eed0e38d9b0428c290cbc69ddf7006798e852999d1bc4e8602a8d69f9ec0141f3108e5309d4893c4c5d813187ada4816472c62ba4801d0001d4a9033738a4744d3eddbed3dfc987b77fd9af49e9fcc256a4a2c88f4289aea12485c2109b92e5a6f41f98b8445d7632c9233175cee0ca5c9057fc825ba5efacaac47dbf34f4372845aa19c4f9a837a6273fecd651b2d6bf5b1f48bc2716b864f418cb8085cd0774fc7a672b3ad4b564bacd7725aa8a58a4e66a44f22b1f97e77a8cacce8c658868953fd6ea0a8faaac46038fc381542c8cb81b41e4d802de4538d09596c6221e3975440261181ff071bf260c3780c2b0e18c7b0d743441ad11bf74c16f0f64b4c0f6e95947583bbd6924bb6eb7479160fbe8c819e025ad1f5046a5b,0x2d0f95779a749f52d19ba499,0x5dcc4adaf225a6c7c8315df9002bbeac,'ec9da313f04048519a8160c23f5141c8d19c076a2ee9d68e8c4faa01187f2741','79','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('17','11','R_INDEX','simulated',0x7a0f4b4ac956964a85da89623707536c1ac5c1359219d4be8574c7f196ca00aa698de5fe495f1faeeaf39e8db39f4bc980af99a6f236bb916e869160d164d96806836b55189c3b7b240950a8cad3a103f59dffe4a9d1c66c90a4902cadaad55ca791a309702fbee97a879d141c2b6a8035be6cd27f702cf4f8e25536c3dcf8f624a7f56f2642166439c71fcf19ed9c77958bc4043f5e1a3c786d4c6877f081dc0288223242684d5092378feceb049bd36082e52b6e7eb6ada325a6623b5e3bf2dfe1d0f9d9562f57e69aa6bea681885dacb4aa5a973c83cec61cfaf1e98cb52b4e78af1c20b15bf1f296c71347de7c72a75c658b74c4489119addf068776182676492a1c6e1bd030223b7a01dafeeacd8685963e736c4896f6468330e83d56ef0d059a8a4afc15f710eb1655bb12fa07fd93a4678926410d476688ffaa8fbcd27069daa2f8054fdb95a19255c0ea92e0780cfe569a01d4a6616e84715ba50150c78f8ee5f2ac68b61b6a30e54e30c242530a2d516df6e5b97291a128d1a0e5def3905147f0fd4550994c2d7ca1336be5fd195249148a06610ce86a2b4023bd322473aade127bf47b0c90c6775a2e61fc3483ac487397d0acd83fbabe44ac3b2ffafe4c589498388f66a8d52c7be8000e59a02ba7b2f014da052993de7c25838ebec7b1049a504d997e41b65e5a9de23c3a9e64edef90a382d2e8,0x6d48a5aa6a454e660ac78ff3,0x286321eb0e68736300e0f86fa4c40482,'95b690a137721658d56fc94ef06dd17a61a777171a9acda85cf0ac61bf1c5262','76','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('18','11','L_INDEX','simulated',0xceba63a80e2e9a5d9f109de73b0c2b128f7014dcee4c20ce4be25be0f57623d10266abcb523bfafc51f562a11385300036c9268dc54255f93c8541f03bfecfe7bf06ae327d59f5b1b8cab716070bc50ce15fc2065062ac87f54e121648baba1dae7ec7b41ba808c4e378c0f8aec204ba95c9a27a7f4824d8da6982e007eb80b7cb2bd3bf06083c2ed3a074ae0b5a1dccf363a9f5fa7e0dad207064879d9ac2bce65eabea7055ec5f8b8f227b440053d8b17bb4991447aad09f9cf628950d591bb930827847fca860df44bf710e3f98a7155d242a7321aa97fa7176ce46299377df340673911753299bebad3af6fd04edb8331605c27a1e4b20f859923cbd4242dd18c2661a8dfcadf17f4c8b56ca208cf3819f55d5864996871e7d57b83b5887218caa24ac2643fe2ff5ba0296241bcf0d7bf46af77c1205d182a4ef56d8138fc955f243ddd95f6ce263b88452f573f59b8e175f8a0d8f1856b4931e56feb0eb0865ffbe8dbd9e4729bdd4890c0441dba92d17f330e8cd21e4207182fe4dea14950462fdb33e33e5ecb71da6faac2d8df2bae330803402efab2aefe6b3b2810c35aa106c6b93c7bc0c528fc17fd31f59a6228dfe920bc94f28fc7fd06b0bd7f7141951197b1bb976da9b15226884783fc89201076cb5f85597f3883d75b95c7649437c8648db7b393a2b2572e25ebc4753d50190f14be1,0x2ceee41222fc6ccf9929e977,0x76afaa4d3421946194c17852478be5e0,'4d25573374ec0f1ad8ff8bd3d9d2aa22e6da6856904f97877ead8efbb8d0398d','73','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('19','12','R_INDEX','simulated',0x50d34bf200969b586a3fbd86a9ffff4ee8ac551cec514c6e0f5216cbe94b92f5f1317ce9c14353ce71b57bb1e0ab9f1fa26f5d34c270b61879aee9766595f2eb1f65a3eb83224221bf4e2b632b02fe5751ad94e592f2f144536147cd132cf23fb27b5dde63c1e25808c07cc011af5eba60acc7af1ebd963e9012d413acee4773e2b99f0b7463177e9116195c5c643c0d9f6c895ec6cd044b4838c5c3ef10a7c8e30b549f290ab5d7251f7b358cbd4fc3107d4fc76fb3a627cc0c835722600366e9f5b803df50654b666cbe6cfae1a8a2194d666f7a40de742c7ac9a9e213b0a529f1bc42693c73014073dd706e13942b9203ea01a12ad6109eb17a492597d3093f79cf021731499213346d877bb104e96dd0546031705785582aa7a0b84e0bcf32a6b1ada64f528ccd3bf406e3a96fcdbc3d480a42ea7d5e516a1050d4647dd9d7af177297138f4250c96741689f5f9758d7b8c557b7d2a5566fc7a2dfb7f9e5ab6df007ca2cfa75efda6c325f8388410a8101b0f60fd9cf4d1616c5f261cc2f7a54aee5424de197423fd6de36ae63ba495c61acae4e098306221e3c954fb72edebb53e686bd8db28241b2d1afbe1ef406cdaaa905193293a699f6ea60f6506ef36b416fa40976688820116f729f0dd05b231a6db2075e94d1d613b1a4355131c4a0c3cb8b522d31932ee428c2ec674739881d2d629b825ec191,0x280c6918953905ba6c0d43db,0x45caa1fb37b4040a96652dbb7d55b44a,'b5a767af8a33542a8ab93c5d3e0357ea9e9ed45f308725fa788ee3c76cfb8dad','94','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('20','12','L_INDEX','simulated',0x131e97aa78057132c4adf8321acade79b40abc09b57cce8f140ee866775655a634ea154ab676b1a1b7e4545da538fae9f9ec390b479261cb7eda772fc56645c0fb4578775d06a64b7ecd987b302a81a60dfb6d96411a96382177ae2776cd6d23d5506f114c61da152944569144428f603dc569777789882e21d3d018b9214acc5bbbc2be68849b9470ff0cb8ced9be4387ce54cb4d7005014f32ac82bf5b3a2e8e6ddfc42d526b216ce6b3b174b56feff90b5e3e800a226ba16b14db4ac155b40a4212eab3abe2e6f819b48408f704e60ed99977a6d4e68aaef7f23fc54f233b201b43f969270cdec38e34abf21db3c1b2176f9fb3e64f125feeb92c14ec6909fbe065e5a76f6b78390e844308e77ddbc012b3526e6dbf601362c24329139d5b74a38e1a2f7706d93b5697177764045161154eb472d7e46f86974b5d66101892330918f921ecdc7722d0c5c3bc674fc5b63142650f3dc8667fdedb7ec927895da716671f4c1af36c56e917e236614bace70db5c9b01f90049b01b4fa4dc49f219d61e8bf04e511eec3d27e8f900a36ef1f51ff70361c4586cd83c0fd3070a829a779e4529d6f7c90c85aa1bdc778a5b8b1081c0f0f0cfe250e32dcb4474abaae97678c35a854e83b95d56e33f432c64206af356c3f49a09e37c9a39feaab77bf5eb3cbbf2b05f502c1,0x42cf7722a75656669618e2df,0x8b5fd48526b768d10d960ff861252292,'601c6548e6734845538eb9c470db26f59984727c240548cd81ff901613561dac','81','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('21','13','R_INDEX','simulated',0x5a0d257ba79c9b5c05bd8ed98c1e4d8f0c1146749f0ff238827518d6d24867f67ef29b807d552f55c64d80f73fce21c21c1bcc34ad1fdea6d68d7fdd8eadcf5ee09c02a721c9457e123fcf7de0bd956b3e691530b6329df29d0f3ef38f5adb42db394f65023bac38106a0e18d65c9b5d223cffada964c22e19c2e623f2bef5a9b7a5ba7fdfc3225413560918507f0cae3486b0842ad55c26f9a546294554e28cc0ec03b498c13c31bd7c9d3d00362ab6f3b3cf9525c187360cfb70e38355e22f508664adcf9b2b9c8c7e16c7295de76e9693ccdab142c1b7eebc705691ebe73ffd9ed90f0622b38f6f5d6944354f451ee5d5312f0bd870668c707f20b6b35b303c569937c243e5abc408380a16befa607f6d3c1a171109244d8b65784d6afe9801d9a6aecb83d0bcb4cf36b4e49640f44ae36e55f9a9c840f8c2f117fcb163a7d1a4c6f4f548adf07ee160ec8f3834d8d71f329b48d3643a95a72e01b2aa751154d541043b18c82ed177f546b1e9d35d3d2086b7175b44379cd47c1c5aa81d36bd0b337dd3ceb7d92c9438ee2c5955591b866eb284e02171d4006ab8cbd2c639d078489641b794c51f30b145dcc40c8329441dee8c6a2d28436ff1adeceeb75d46fbf1997378ee8ae276426f435b79ba57a562651e777e102b98a016dd2a513f0897,0x5c7d471043c1a46c7e7bf3af,0x7c35a089c2d7bcf182da6aa6e822d1a4,'1b77a4b0047a45ada8869d60924dfdaf72934c59916485ba5a782a442494541c','65','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('22','13','L_INDEX','simulated',0xaa89ff75273785448621d4b386d06e626f982cd872df5066c292da08f29bf62d0a9c260d48a4052bc026ae848fb151d120cd3dd0338cdd382eef97c8055c125fd83e1822336f30930f00dff59d8d5bba24a6956d6d5e1852d621beaf8e1f0b9f27814a7be2eb76bf6f70fae60126b92845ca95ab1097ed272837b33e84e58c70f16c50ff343e5c735d4677efa05f159a9ee5c38c1bc6b66685cbf2aa43acb00054c874a9f4596420daea17a36c57017d2db74eedc4ac62abe2b60abc425f7389ed9f36adbaaa64fe31b605cfcbe3c145f65d9d0e93fb4a3d11696e9c04012ef7424bdc5b5d5f4e7af3eba79c4ecbc3bc715c32d002ff10c762f503b9b0c240873818a51921856082fab32290ed7d1220f90e86b0c3021a577a2c01978cb9d222602dd485d2c4e5926a739cb18b3d518ad29b3c94572627d630428c0b0c442b3261bcb340bdd581df0f4005b1de340139d0ee206644b4e690bde6bc40aab06e879676c476fd50ad18f295efd43ac927f5467e614c89937ab146e28fe196d275b01f5fda62aeab84273f7a0fa41452b790a356a6a7fb41ff14d33741e4dd3667e685fe129e1af3a55dcb167499d4e6aa31a7eb8347de5ac0031f938e43eed6f0d8f7099bdb11f8a298a2d6638337237e5dddcd0ef06c109eabc1058e413749e496ae0fd956e5cea8f7a2dd1a033171bd2249,0x39e8c674ed2e6d7a46d0ca08,0xe0c15987fefeaffbf6d461126fdf2d87,'d291b89c57afca352993b45eb0b4124ba4d94bb02d17b964206e113d896d2ab2','87','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('23','14','R_INDEX','simulated',0x8533563c79dd9c13bc5ee14aaafb932e4735c4cd35d36f7f7716d09eb3c6a54743729a669897611c08ec1a48bb0a589deac0fad773d63e0af0739b8930aa2938ae1599de5c1cad22978f625aa46989bdf5533221a26282279f534658ae0d815475799e44539945a3e1095c4f045aaf2862c771a3329056abedaf876d25fe47632e6ebde7a71007bac89c16f1a8d98b8efb3b0c67081f4b202dcc97f4989f39257131f9493038314a3804f697d1b9258d24bf8e11ef29f4dc139b01bf7d0d2a396a157b9c4e2f73c8bb74bd47dda69c679f9845f4183e90d75100367f2388f262b103fdeb601243d9e647d4f4ff86fb8f8089382748e09ba3e46d46e4c1e1835110ba82b3c04ae7a09ef5d05d7fb137f360867fb263f6749025092b0db543fe861f63ff648fb01fe44a3ba4479808b01cd0fcc23cca832dcf7ab87dc3892be18b1c7b8069dd488092b6cec0ce4449d261ebab359307a5a5fb1fcbf6604f0cd41f0a8eade19ea95d2c7fd96bbd08acb60017caf03bf4c6ed1cf3e981cb98bac43f32d9c36d1efc27fbef33d967b649eb507f7328728ea4f7cf356615c2af145dd52f5bde0812224b51b56e9e074d228701cbcfd2f99642af3814dd4dfc722b8f3336e5f7e1f9c8a3a5d127dd50fafc3744b15df01ee639bfbadce82b5047fe8d9fd7bb00ae38e5253abeb4a1d7509866e26db4a793ed575df4e8,0x97c36839d2cb658248def45d,0x4efe07c6bdd887ffe2b8dd9230ca91ee,'eeb069c19838d77f17900df01cd93c52a6d8fd6f6d210753a6e462acaa556831','83','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('24','14','L_INDEX','simulated',0xcbc4eab9a4f95150341d2cb8ecbe7db4ceca466598348e332c99f3935460c834951aec8c9e547c318fb9f409da048b242f0522dd06a3291ab6beda6756f5fb1acd237224e6619686bbe48d14800359e3ad584f186e948e5c25b7315e342676395bcdbe95eac75813f8fc280205e8cd10114dfccd8f29b139eb5fa95b35441bb6adb6f55e495283c9a654e177cae7952ae380e82e65f8fbef7d2307f6db7ae3df5cc2664b76c65e32312757567abc232a32d6fd23585bc8e99eebd6d753514a1faecc669ce441a34f048809af0731c3f76b3eb6b5045f556df04940ec529e92bb7732a75683ed802741f6472100d578da2aa1863d3de655b307584089b9ebab40639236702de734d72f80ef158d012da7119c81f849a0aed3a390f3a0797549d765d43217c4944b6da0b2ba1078e848a33617f672d6bfd9da3a2c02c4cf41516671a4c3192dd561dc066e308fc83db9597f38b2af10fdb9fbcac869149ee5c5fc03e5ca35de625ffcdbce524ff51a6407507c540af77622ac7a827ce0099b3ef0ed4aa44912d6eff796e0782ea7de163d6af2e9fe9d2cd08204ef9847b30ec1d98252e3bd904e914887616e76af1270024000abdbe2b043710b68529e8e228d97de830c709559b08555749f9af6aa1c3296a4b6b3e047e0e4ee9ea7e52f9d6567a2475947384a6e9fee7f0e82ef78326cd1ea2584fd3028ed,0x2dfc31be0288796453a62496,0xabf07ebe383e26f01db5f78fea399a4a,'81d74ae0866c2571d3b7ba7e933956272d2fff1f02e38e5af753dbd0fc7edac9','82','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('25','17','R_INDEX','simulated',0x993408471726c384b82edfafcb37d8694b181f4300d61b915018902e81474e85a21ca113c296ec2712f5627e66c456fb3ec0d1d60629457496fdcc8bf68a5be29b9d1b60646e8f917065098ab5403e8a1230d800328979c561736522fb5a81beec806e40c0b6c60a714ac3be4de4cb6243f3f6ab091099c60b92ec7a74619dfeb52ee234f695608df3edbae6ccc9e2bd346d3acd3cfc93b28f8044356a5805b7a9d2170433f0b9d7eee041214362b321b22df168c49ad0ab85975c135999d4eb65c0343b1561656995c04142a16ecc6ca32161daa6bbc90905e8440ae12e29995ce53003dd981785445e1dfc83f4ce0745b9717e5352980a6f22cc220fb9a3a75e802a953d80b61214794252cdcdfafab622a15e9f4476ab2655bfd2d4babc8b7906e152f3c8f0c626bdc57298ca08e7667b60036f45c177498a7cae50c527d83f922bd939ecf2e54bfc637f4cadb96c4774e24494b59d9092e7259c72874427299bb8193e0e66379cd5326a3563d14f0899f45005a155e7329d8839583fcdff2f8b3b7906b3b4c423ca0dce8aae11bd2950541e9e9a5341d75ea765cc3722205fdd718b26aaabc1e5f8b9828b6e2fa1446523dbfe3251fced9c401bd7954d6cc3621d72aba8617d2ba63ec0bb21306ee9179827bee626bae7ecc4089cf91b545c48129ba0a8b239a38c75d44dd346174bfed3d6af,0xe21624604897a8967c29e0f6,0x70cfa88d6ce9278e8261028ed1a497c8,'67ad657d53e7a321ae36cd06412c6864d188fcee70917e0c8919c62702e1477e','85','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('26','17','L_INDEX','simulated',0xf2a8846721e66e5073867e781d5df38a0a511888a989c718d61af64dec3d08a4bdc99130804f0c5d0596ae8b083d5e04fae4058904e6e1963b1b9db03545eed215ad605bb0209c1294051b9b4e02a0701d58795072447a0c51c5e1e79141b5ce65a4c2d6f15cfd0dbd46a0a0985de3994d8499b72f7417d462e2828cb152ca44e38d78309cceef23d93e0d39b8ba05ee288ff9ad8c45adc455904ca649087b4bd00e9a37d26628b1066ec457a42e08d5a616eb798aa8e512269727b8eeeeb9377a738debcfcbf3cffd932b516a927f00c907e7bbc6dee7c484fba85a6e677594510fd4157004a9d78a7324f11991358cf416f4878b85b37615e127b9d07c5d8a5e1f408368aad33a677ff144d8f6a06db20a570ab600e29e2d7ec2890229dfa0e44e9bead3833903cc67dd37b83010d43769416fcd365cdaaa6ea75f212a6834a88585f77ffa63e80cfa83e60935e9729fc02e3d8babb7821d140d8e602c2e937d0d00004f20d48506c558ca09ddc8cc9bdda17a1afa207b61e3b2608980e459471304e930370a81a29ab55d75ef64b81565be4317df8a620046f0407bf31f3f138d879867375012a8352b74932561d0ae3da668ac5c9480eb1f9a11825dd91824905662fd8f17a5ec6819bbf7421453998db516497c83d856a8353fd09e02dfffdb3b1005468dcf0c2fff1cb17241c4c2bc07534ee7ec2945,0xf643b72d5e30c95a8615d8c1,0xa90b8fca9142bbaaaff7ec4ddcce6044,'613bf73c0d7a47e8046146446bb873489a7ca04dc239e927b7db85e0a758b1aa','78','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('27','18','R_INDEX','simulated',0x046b420e75734b3a68088bf97a5c372abb61c971ed755f95ec6e4f47752746aa2e5b6dcdc743111e0954a365cdd2d3d46da208e31e294b47bcd8969978ee2fa2d6e3aee73ab08fbcc881afbf0ad5e33d5a3476998d774ba3b55f57f685e3d0fc1f8a45b56719ea8b53869de14eb16cf7a779a5dee72ac611432e46f1af9396659ff274c86637f5e9f2faa7cc5ea67663d6536707460616fb39783e89bedd857eebbe83228d78075b928f93ea944c72411d407157a3c89eccef2f8617739adb2605facc957c6acce2111b084c2e0001124709a55328833e644bd3f9fabc998ecc828b25127070b23c838ceff2858b9caab816c007b940d25f02620e242e37d93aa21e7b57b50da8ee75876a00c797f416dd0916b291351f7249a25dca8fcfcd40256d8aa8c450786c582dabaaa0721170ab4ed7ae81ca7c88dfe304c45da547a202d803699454292a764884dd35ecafdc2262ddff5cb719701c4c9186d9b178c98c9d3c91a2fc85618d98bbd33893f0f38803e7a60b049a28407e0e51ecd8c8f71080a2bdcfd6f8eec283c121e97d392be80a3ad2d918b564217fa064e9dd87dda72d260940df60357c2db6f49feb66bb26a8af8c55243aafc01412bec2bf7c31864b4b12bef60fe3b0344d4cadfc0f4de699c9784c105e35adb1f4c7eac49ab2c1fe7bc061a4cec0dc92b4b7baac41a9ebab2d6a917f38e042e4,0x105e4712a9de0ce70959250a,0x23e6897ba7784d2d86b832169459d69c,'d216dfca9f3ad5828c9adf9efd91dbb2e9bc85270a7eb94ff3b1141785490e9d','70','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('28','18','L_INDEX','simulated',0x1dcb26a8def64dd6e69ece1e3e94369a2a2fd5161738000d4996dab2a53bc07a60f4ac2d0b8bfcbefbe2f776c571e928ad7ae5249e32affb3d5bcb6048f95f4bfa4cfa82d0dd1246404ebb525198f9162bf035691057d026a248244ec047a02d431a8896adae9d8c571b184940d31d741eafc015e630cf7a411ede231b908098a4ee39a0d3a5f9a52d43ffa847afb1ffcb64699ef512eaa0e658b0585e6af5ae7382474fe3284d7b15c23368458a2d8c2c79cd0b709516f150d61fa7658932f3d7a34141c5d396c70cbf0124d76b6bcb6063b64f02b6e4978926a2a4444b34d30080f8777163080c963fc3d837176056cd4de6f60c9357ed41da6368b8bc2175fd908618c3b416119a5f225799c985bc8a554188e816e1f8c981fbe8b21a29eb7cb1e3f3ca3021728478571413d6e05935bec811cce7eec768a316cb153244b57b8e72833f563ebf976bced45d96c6a78f594beed0dc9ec116cecd740849694a418dd2797726a6da737d5bbf26638e7b86f7f68f3545e1ce8907bc0273951b4b93b2a64560fde347f26585163e9e0d1a7cacfb96539f8dd3b7beb1bec49ab0b37ed06f24b7ab661677c76bab673139c481fa0298df002fcaa02426671e574f319787dbde8a77cf267c8b07ae03636798fa9f5bc55a753fd47fe37efd90585c16d6e5927ec7309c03de9e13a6837196ac03ad4e12088b,0xed4f234c7bd26dd500615fc8,0x18467db266d0f67df344234c93c718a9,'9a7b0be52e3635368d05fcb82e31368f23ea5552128f6e47e5a0d1833e636f7f','89','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('29','19','R_INDEX','simulated',0xe6fc3484c8ed974ea89b9c73ca8a3e94fb12468be03e236e0cabf767c5d65d8d6554cf0a779d514818d436d2e8fff6cab660f14d4154df394ccc4d322881dd32af0c192d584e9de931a1d63a293f29c3a3fb0b6a0c5fa0b762c21838597bb5460a7cf04454de8ecc86d293accbd6f6a65f1373f81d40192c6eee28629141c24c109b94339e19a24a2e67fff18a2d8d3e40e64231f6160625741bb5931166efb36684b69d2afc2af1090ed4cc8f54c367e58f5fa18f3968bf2ac3026006f7ead653f3155ea8f18d417b2de11e683f77f582885924be0b4d3088c4ebedec884cd296d9882c04b6ff359254abdeb44be44d6dc3c2e923de0df5b0e138124243514f39107170b20a0a451ec1c4bd3ba8657a42ec2e44fe307dcfa0b182e0c16a7917084032c93619e8c992dd715a956e1765e86c27e502aa3cad9f6f9dd124ec43a1e9eb5f197bfceaef35831ac8694dc2bf1d642544c37455dd6167feeb83c5c9e4f338c83e987083a23df1e56d30644550c5f6b8ab19f8c5ba2840470b195692d933384b05cdad364a494f3f13869fdd45d473da4dfc0ac1f6ca16d496df1c1d4d83abe1feece4fac6563584b453519278e8fba665c52ae77726bab1f4076750389fe6d68400bc5931db7cabcd0534169643db71571479f562969486f68cf8deb871788701e54fb5784f611dc315d39245,0x0ea6541902f2f11160b35168,0x75d717263d306ec81a2db49eadac5ba0,'c41aec089976fb0fb22b693c9f32f7a967f16af249f10d8aebbd23d49e2fedd5','74','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('30','19','L_INDEX','simulated',0x13eebcc7c7a647710f4ba67fe1f0296e389aea4864096649447267e3abe1f756b3456b8dbfc7ed6a3cb3be0c341d1971fbfa39ea69c48ddf46ea119230f48ea40e0db2fcca45cda9529b3da326a644f837b2e7460231029174d2c30a9924b63f5c96df58f62617e365c4a481127c2c9cea12ef0a38cc73e86e0908e0520ef62661e0bfe316e51871b74fe45c691834e789a464e8598a64690d2a3dbab97469b8f325ee54870d1fe4859aec59e53270c6bf871988527998033bde105ef43fe77725e3b2b6b9445109b082282f48b643328fd614ab892b0cc40dcd4f6d967a9ae9c650188382a7d163b4fb6720c9748902927e0958e2b7472053c8052b5ea563ea6a660adbdc92b41b6f902790d05b0a97f2a8afba509e286df0b23230309151c03835941a8e9f4f40dfe284f11f46daca50ad6ca3259eca6b276c5e693bd53a7f50893d45ff33eb47a9b4aadf73f290e99321c8828b3e079861a2b6847284ace9af52e5279880b7233011aa0bcb87bf85dfe6820943e7ff995a485d8cf233d6db9885fa3ead43670df0273273b516330718e0eba2d9c6ef1f5f1f0fcc1870c4b8f6151ea2c2b9a0a592ed768458b96a41e0ea2f88f354d316090dc09110ef387f4b3e3eaea3deba6b4843801385a8395eec91cbee57ee9604e959a62e37349c34cf7e698d357f0589,0x47fd405d17778d1c1811db61,0x410a5cba48b588d50a72ce2b02bdc9c5,'a5eca6ae94f0abf21db8a0de65b8b9219405385df32cc96a4954339bb602984b','62','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('31','20','R_INDEX','simulated',0x72e2fb188055d3eb6d54fbd15d487f754cd2b830cb88e19440480d4bc1e647e6f66eeb857cd5caf9cf5263ab790210affd1a0f7d7b21992b0d9bf7d1462a1258ae3e83eaa9184041bea211a5c5a7aeb6da9db656ce56c3ddfe1358d6c804ce26edb6f3d619d1a68b5ba4839808e4421e57d2ce95bde604d2c637c1937389b732bb4a83e65f3e2506e4748d39f86b1b6880410ba0eeb48a81be480cf7b4293ff3f825223bb15488235a07c2be32229563f697daf5226f1859af6b7246bf72a0567de77a70168065c862501549a0c4f2582ab469acde08df0c125393e8d64f3456148fb3eebdabe5f1c9dc9514b98cc93026d0f98535484290878760dcb8f749182d894d2d85bb170a65c454e427d32a28dc707c00a76dd425375ff30b4492bcdd82d42d96a4066e6279079941fc00b0d9dbeccaa34662b5caebfd5b5499980682fcf412ff3107d4b2bcee488911302e44d9f97a17266091861d8a8e8745b6e0b6eb3635f07fe9e95a2c3718c18a9598c3c493b8251974733d1484f933c156c51ee79e02fcbfeac47cd0a72fa2775ebc7b83d6495aa5f0ea818d07623b7b19424b8a1970e4cfce28998c7382e1584b3eadc3c5bc14b1400faddbdae4fae51b4489a002b62aa64398d4b8db67a5a9cb8082b6454b9c32f2f70bae705fde0667196533732461136c5ae33e264167a2f77172af,0x43940d7f047a0356adde9f0e,0x183faa76af03762e1ce1bac7740f0af6,'3e8f872fcaca12667058414ce5aeb781b14bd36b7c0f2d9989c78e01a8a5bb6f','62','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('32','20','L_INDEX','simulated',0x189e17529c7d581f0d1bb6faf5e2bf13adb9db799e3c27d3b90bb645b4eecede6e24fa7224061a181fbe18d8fa8163eb1e03897c05fa29afe072f92c7ed73ab7dee6d44f2eeba528af470baefd902147ed063b12f6129ec65e9166ef46e30618f6dbfa4589966eb1eb126506151433f5dd8ceb0d9ff42be95d247c73ed642d617c55aa9f5fb92b63c6318f78bbe4f6569ecf5697d7d988facd95787be45a73af6fb4ef67a053b169f4384b23639c73d1cfedc6d6b5bd73fd06635be569af24ac6b5a6f0986a25926590be1d282feb605425d836988c755f66382a90a0cb60693242aaa4157397c63713f27e499e8da60d6e2d54b8134ee3cca8d3f24690b982a5133cc1c643e4921cad5932393fd1da11cc07ebe7f7ec96de7e4b6d662fa6dcac91b7fda80ea2b1a96df34f7ec19cd5c7a2251222d51e988f5b5f1c7364c5c18ba02d64b5f053d885b60def92da18a21e8c50675c64748a08b26440e5fb86c1073543324cf7e239fabb33bb41058fce5e89f4a2773bd13ab1d091773e5d6375b132f9fdaffae3487c88fb940e12931f52a488b04f242bc64c0cd1e2b093dd1a34ed48ff188a68886d77fcf37afbd62151ec8a8c692cd9dd5c9576c04f629d6b3bb0e74a2a34cce57842d51cf29d27d025eaa00d6df12103d99394d24e82e4430059278d26f81f7a75b3c39edb2071ce82dec8b38,0x338a34c3ef63ea4aee6585c5,0xb774d37e0d05d09abff4943cb6afc5c8,'45e8dd53c3f73ea4ae546ea1231f48903c00cab84d62c9f345150da0cbcaffab','92','1','2026-11-12 04:01:04');
INSERT INTO `biometric_templates` VALUES ('33','23','R_INDEX','simulated',0xc64c25e07cc06465bfa9f7205056b0c763134454fb153bbe15646ffc0baaf3267270fce9c4e4595b8f3020228ab3baedc7f575de98ccbe39100e3610b348eeb660be06d46d5183b6e21cd2bdc8b1a9901bdd0b406ebe1c240a4f74782d46fced2922957a2111d88e4d663dd8407ffc349258afbc97a9c94e2e02b9f88de23b76527ae24266f1de4a5b54103148e4acd97d317923328eead1462a657304cd6205c618c32fb7167c7e5ea04d82ef2ed433fae0a5024ddf9700cccca06614b5be47c9def5c178487695c98c6a094da9c5ffc693a7f55dc8a49b5b1a73fe105213a071f85649968c95f3b6817cc5cf6dc8108259106009e503867fb9638f7e98214a3fdf4bc00a5b4a377ec63b56860d781b25182f9a09fc2ac54de4588063eb4c0c0d50d2988c0d868690cd7514a3143318f30fde4777f3ebc2deb7a3c99e22a748252b164c3042b81430f18b638af3046ef47b48633e507470d95bfd227fff3e98659d2b7991fab7120e14b549a127832fb22ff35fc3755955472e92739b4b9abf55b103b142e3b35d9ea74801bfd9baa2d3a003859b4bc7ce3f925a1fecd88b0eff19b9d6b9562b4d54c97ae7a89ddb969e064a5d46cf201a07ac138d66b283e60340c808b619b52a507073d6b2bfae4c0e03a7bf5bc0ea7950dab4252242f6be71d66eba80067e9f7d7a168db2d8eedbabcdf2f8b5e89542,0xf78cff13852f016e7ebaba08,0x6f796fe1ad421c34e37bba9a173d0995,'3da0ead61c2a891f45e3ce33df8cc2ae2c9aa4243d409e0073a6c4eada992754','66','1','2026-11-12 04:01:08');
INSERT INTO `biometric_templates` VALUES ('34','23','L_INDEX','simulated',0xb371383fbaa0db44a54e51da60e16d9b5611f4acb75f9e2ce865d0faedb73cceffbbee65323796db8746bf0d4288942b444ae1599c96d9f33414265df3b26ef9a436905e230150e99660fe04fd076af1e71d24af1ae3b28b9d5594a24989168a03cb08917ded272dfd3909abb0739cd9e3cfa995fd1d672980a4d80ed2eb82b75b923ff54508f606d79eb2de86bbfbee01b2fd4a79ee3c9b156aa612d1114d0f4ca13e0085e6b25442664f708a76d18d59732a27747d5ce278b24f0504f4916823f4146595da3d5e2b1f134c2eda8c62f9bd0398015635690406796403b509d85dc2c43c911e6fb6d83b5b3ed273e08ce4d8b9fcb5a89c2f291060b46f4970fb6cdfe78e71887dc82aed9582e02bdea7ccecaf3cb8fd8a4d905c989bc6c5f3cf86eb957c4aeca5959d232881b2c4432562eff4af0d311b46094e54f0dce097f3bf0d780693b845be80f400d331895b9e6e2e7004c65c3bfa8c56bdfb9386473373088d9c66bd6e51d0d855f0f3dba8211bba79aa03b6ff460049e53826a36a24e60a07e4fe4905e0e70111c2a0b6050b6186c5731ac59a74f420374a9e54f87bc772ca13ca82d872674c05519e0dd53361ca9bd287e366d7d6faded471eacc1a284ef860c0dbed1ac5321c8504c8eeb8352ad6019601d01b7bc460e00db0bb36bfa5c1497e99480051cdc4a3950b1a804a8f,0x30e384c6d36bbf501dbaf67d,0xda451f6d170cfeb2641ee8f32a31260e,'b065f333cd2b50eb750400f44e5e8c3273ae163d7ff543941e5d9123f6e1cd3f','70','1','2026-11-12 04:01:08');
INSERT INTO `biometric_templates` VALUES ('35','24','R_INDEX','simulated',0xa4fb01fc7124407d6b92291b69c168dc78131b982453bdf029fcc2e0a538773d30d6f6b7352dc0da63f63e75ea0ae2176e79042d570a9e8559a96631d7b4ac95dda8285e29c441110f723ffd0a6a0ddb9b20ef7184d94bc6adb569638b85dafcac494f810e08dfc41ed6e111fbca28ef8430d64c508ffbcfc96c4ae2f7d43cc029aa3a9be10aab01df3f208eecf13e053afaf8893ed709509f4abe190ec3687719dc1da35fb4a507cf26e9cb0da16ea9cddc25d04becaa499e595c77162e9fb53f81bb3eecd930994825a2bd00b16535729d3a33d8f9f5d86d209f3332c818fd168f1b4e3c1b2ab8fde0bd986aa227fb8028840a093ce9b1c00e2f5198c9a7c7e5334e88d538c55bc1b2c9ad8057a23504bde3db482793fcb579a5abbab1986274c39eb98613d9ee5f392cb0655ece8939dca4a280b287cd7434759420eb4eebed5df5b60a84513995c825ca3a6556d15895812e4a10a304f9b6a44121ac9e7faa56f5ac2be1f90662cd9960142616e0b9c0fb89d2207fae4a77dd606f87b446fe0471b873dffb184ce910e54badf9e36fa3749149df09bd82c9f0f2163b0afaced1b0b94384ee2d00555a49683d90dc3880ebb222eff2303dcc07a05d7a72e2f2923eda82e5599c38f6659fb1e541ddbf3161f6556abb9074222cfcb2a7391124eae519f1ba3130b9d04e47b9478139,0x05316f29fcbdddb1f2cec7d5,0xbddcc4861a79101fd86868b16fc75a99,'2be092d18a27b89058f4e36a3c18f7a33851400dafe4efc269c543d6a48642b6','93','1','2026-11-12 04:01:08');

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

INSERT INTO `class_sessions` VALUES ('1','1','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 1','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('2','1','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 2','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('3','1','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 3','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('4','1','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 4','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('5','1','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 5','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('6','1','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 6','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('7','1','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 7','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('8','2','2026-10-20','11:00:00','13:00:00','Lab 1','Lesson 8','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('9','2','2026-10-22','11:00:00','13:00:00','Lab 1','Lesson 9','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('10','2','2026-10-27','11:00:00','13:00:00','Lab 1','Lesson 10','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('11','2','2026-10-29','11:00:00','13:00:00','Lab 1','Lesson 11','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('12','2','2026-11-03','11:00:00','13:00:00','Lab 1','Lesson 12','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('13','2','2026-11-05','11:00:00','13:00:00','Lab 1','Lesson 13','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('14','2','2026-11-10','11:00:00','13:00:00','Lab 1','Lesson 14','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('15','3','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 15','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('16','3','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 16','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('17','3','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 17','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('18','3','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 18','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('19','3','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 19','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('20','3','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 20','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('21','3','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 21','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('22','4','2026-10-19','08:00:00','10:00:00','Lab 2','Lesson 22','closed','2026-10-19 08:00:00','2026-10-19 10:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('23','4','2026-10-21','08:00:00','10:00:00','Lab 2','Lesson 23','closed','2026-10-21 08:00:00','2026-10-21 10:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('24','4','2026-10-26','08:00:00','10:00:00','Lab 2','Lesson 24','closed','2026-10-26 08:00:00','2026-10-26 10:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('25','4','2026-10-28','08:00:00','10:00:00','Lab 2','Lesson 25','closed','2026-10-28 08:00:00','2026-10-28 10:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('26','4','2026-11-02','08:00:00','10:00:00','Lab 2','Lesson 26','closed','2026-11-02 08:00:00','2026-11-02 10:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('27','4','2026-11-04','08:00:00','10:00:00','Lab 2','Lesson 27','closed','2026-11-04 08:00:00','2026-11-04 10:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('28','4','2026-11-09','08:00:00','10:00:00','Lab 2','Lesson 28','closed','2026-11-09 08:00:00','2026-11-09 10:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('29','4','2026-11-11','08:00:00','10:00:00','Lab 2','Lesson 29','closed','2026-11-11 08:00:00','2026-11-11 10:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('30','5','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 30','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('31','5','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 31','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('32','5','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 32','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('33','5','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 33','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('34','5','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 34','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('35','5','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 35','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('36','5','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 36','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('37','6','2026-10-20','11:00:00','13:00:00','Lab 1','Lesson 37','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('38','6','2026-10-22','11:00:00','13:00:00','Lab 1','Lesson 38','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('39','6','2026-10-27','11:00:00','13:00:00','Lab 1','Lesson 39','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('40','6','2026-10-29','11:00:00','13:00:00','Lab 1','Lesson 40','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('41','6','2026-11-03','11:00:00','13:00:00','Lab 1','Lesson 41','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('42','6','2026-11-05','11:00:00','13:00:00','Lab 1','Lesson 42','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('43','6','2026-11-10','11:00:00','13:00:00','Lab 1','Lesson 43','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('44','7','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 44','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','4','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('45','7','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 45','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','4','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('46','7','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 46','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','4','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('47','7','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 47','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','4','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('48','7','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 48','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','4','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('49','7','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 49','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','4','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('50','7','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 50','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','4','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('51','8','2026-10-20','11:00:00','13:00:00','Lab 1','Lesson 51','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','4','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('52','8','2026-10-22','11:00:00','13:00:00','Lab 1','Lesson 52','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','4','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('53','8','2026-10-27','11:00:00','13:00:00','Lab 1','Lesson 53','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','4','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('54','8','2026-10-29','11:00:00','13:00:00','Lab 1','Lesson 54','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','4','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('55','8','2026-11-03','11:00:00','13:00:00','Lab 1','Lesson 55','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','4','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('56','8','2026-11-05','11:00:00','13:00:00','Lab 1','Lesson 56','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','4','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('57','8','2026-11-10','11:00:00','13:00:00','Lab 1','Lesson 57','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','4','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('58','2','2026-11-12','08:00:00','17:00:00','Lab 2','Demo session for today','scheduled',NULL,NULL,'2','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('59','3','2026-11-12','09:00:00','17:30:00','Lab 2','Demo session for today','scheduled',NULL,NULL,'3','2026-11-12 04:01:04');
INSERT INTO `class_sessions` VALUES ('60','9','2026-11-12','00:00:00','23:59:00','Workshop','Test session','closed','2026-11-12 04:01:09','2026-11-12 04:01:09','31','2026-11-12 04:01:09');

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

INSERT INTO `classes` VALUES ('1','1','DIT-2025-SEP','Diploma IT – September 2025 intake','2025','2026-11-12 04:01:03');
INSERT INTO `classes` VALUES ('2','2','CIT-2026-JAN','Certificate IT – January 2026 intake','2026','2026-11-12 04:01:03');
INSERT INTO `classes` VALUES ('3','3','DBM-2025-SEP','Diploma Business Mgt – September 2025 intake','2025','2026-11-12 04:01:03');
INSERT INTO `classes` VALUES ('4','4','DEE-2026-JAN','DEE Jan 2026','2026','2026-11-12 04:01:07');

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

INSERT INTO `courses` VALUES ('1','1','DIT','Diploma in Information Technology','Diploma','2026-11-12 04:01:03');
INSERT INTO `courses` VALUES ('2','1','CIT','Certificate in Information Technology','Certificate','2026-11-12 04:01:03');
INSERT INTO `courses` VALUES ('3','2','DBM','Diploma in Business Management','Diploma','2026-11-12 04:01:03');
INSERT INTO `courses` VALUES ('4','3','DEE','Diploma in Electrical Engineering','Diploma','2026-11-12 04:01:07');

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

INSERT INTO `departments` VALUES ('1','ICT','Information and Communication Technology','2026-11-12 04:01:03');
INSERT INTO `departments` VALUES ('2','BUS','Business Studies','2026-11-12 04:01:03');
INSERT INTO `departments` VALUES ('3','ENG','Engineering','2026-11-12 04:01:06');
INSERT INTO `departments` VALUES ('5','XSS','<script>alert(1)</script>','2026-11-12 04:01:06');

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

INSERT INTO `enrollments` VALUES ('1','1','1','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('2','2','1','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('3','3','1','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('4','4','1','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('5','5','1','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('6','6','1','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('7','7','1','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('8','8','1','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('9','9','1','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('10','10','1','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('11','1','2','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('12','2','2','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('13','3','2','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('14','4','2','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('15','5','2','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('16','6','2','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('17','7','2','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('18','8','2','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('19','9','2','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('20','10','2','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('21','1','3','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('22','2','3','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('23','3','3','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('24','4','3','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('25','5','3','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('26','6','3','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('27','7','3','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('28','8','3','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('29','9','3','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('30','10','3','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('31','1','4','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('32','2','4','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('33','3','4','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('34','4','4','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('35','5','4','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('36','6','4','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('37','7','4','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('38','8','4','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('39','9','4','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('40','10','4','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('41','11','5','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('42','12','5','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('43','13','5','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('44','14','5','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('45','15','5','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('46','16','5','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('47','11','6','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('48','12','6','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('49','13','6','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('50','14','6','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('51','15','6','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('52','16','6','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('53','17','7','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('54','18','7','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('55','19','7','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('56','20','7','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('57','21','7','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('58','22','7','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('59','17','8','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('60','18','8','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('61','19','8','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('62','20','8','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('63','21','8','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('64','22','8','2026-11-12 04:01:03');
INSERT INTO `enrollments` VALUES ('65','23','9','2026-11-12 04:01:08');
INSERT INTO `enrollments` VALUES ('66','24','9','2026-11-12 04:01:08');
INSERT INTO `enrollments` VALUES ('67','25','9','2026-11-12 04:01:08');

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

INSERT INTO `lecturers` VALUES ('1','2','LEC001','1','Female','2026-11-12 04:01:03');
INSERT INTO `lecturers` VALUES ('2','3','LEC002','1','Male','2026-11-12 04:01:03');
INSERT INTO `lecturers` VALUES ('3','4','LEC003','2','Female','2026-11-12 04:01:03');
INSERT INTO `lecturers` VALUES ('4','31','LEC900','3','Male','2026-11-12 04:01:08');

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

INSERT INTO `notifications` VALUES ('1','11','warning','Low attendance: DIT101','Your attendance in DIT101 Computer Applications is 28.6% (2 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:04');
INSERT INTO `notifications` VALUES ('2','9','warning','Low attendance: DIT101','Your attendance in DIT101 Computer Applications is 42.9% (3 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:04');
INSERT INTO `notifications` VALUES ('3','13','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:04');
INSERT INTO `notifications` VALUES ('4','11','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 57.1% (4 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:04');
INSERT INTO `notifications` VALUES ('5','10','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:04');
INSERT INTO `notifications` VALUES ('6','9','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:04');
INSERT INTO `notifications` VALUES ('7','14','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:04');
INSERT INTO `notifications` VALUES ('8','11','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 57.1% (4 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:04');
INSERT INTO `notifications` VALUES ('9','10','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:04');
INSERT INTO `notifications` VALUES ('10','9','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:04');
INSERT INTO `notifications` VALUES ('11','11','warning','Low attendance: DIT104','Your attendance in DIT104 Programming in Java is 50.0% (4 of 8 sessions). The minimum required is 75%.','0','2026-11-12 04:01:05');
INSERT INTO `notifications` VALUES ('12','19','warning','Low attendance: CIT101','Your attendance in CIT101 Computer Fundamentals is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:05');
INSERT INTO `notifications` VALUES ('13','19','warning','Low attendance: CIT102','Your attendance in CIT102 Networking Basics is 14.3% (1 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:05');
INSERT INTO `notifications` VALUES ('14','17','warning','Low attendance: CIT102','Your attendance in CIT102 Networking Basics is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:05');
INSERT INTO `notifications` VALUES ('15','16','warning','Low attendance: CIT102','Your attendance in CIT102 Networking Basics is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:05');
INSERT INTO `notifications` VALUES ('16','25','warning','Low attendance: DBM101','Your attendance in DBM101 Principles of Management is 42.9% (3 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:05');
INSERT INTO `notifications` VALUES ('17','22','warning','Low attendance: DBM101','Your attendance in DBM101 Principles of Management is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 04:01:05');
INSERT INTO `notifications` VALUES ('18','29','warning','Low attendance: DEE101','Your attendance in DEE101 Electrical Principles is 0.0% (0 of 1 sessions). The minimum required is 75%.','0','2026-11-12 04:01:09');
INSERT INTO `notifications` VALUES ('19','27','info','Welcome','Welcome to DEE101','0','2026-11-12 04:01:10');
INSERT INTO `notifications` VALUES ('20','29','info','Welcome','Welcome to DEE101','0','2026-11-12 04:01:10');
INSERT INTO `notifications` VALUES ('21','30','info','Welcome','Welcome to DEE101','0','2026-11-12 04:01:10');

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `setting_key` varchar(50) NOT NULL,
  `setting_value` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `settings` VALUES ('biometric_driver','simulated','2026-11-12 04:01:03');
INSERT INTO `settings` VALUES ('bridge_url','http://127.0.0.1:8765','2026-11-12 04:01:03');
INSERT INTO `settings` VALUES ('consent_version','1.0','2026-11-12 04:01:03');
INSERT INTO `settings` VALUES ('institution_name','Demo Technical Training Institute','2026-11-12 04:01:03');
INSERT INTO `settings` VALUES ('late_grace_minutes','15','2026-11-12 04:01:10');
INSERT INTO `settings` VALUES ('match_threshold','80','2026-11-12 04:01:03');
INSERT INTO `settings` VALUES ('min_attendance_percent','75','2026-11-12 04:01:10');
INSERT INTO `settings` VALUES ('min_quality','50','2026-11-12 04:01:03');

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

INSERT INTO `students` VALUES ('1','5','DIT/001/2025','1','Male',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('2','6','DIT/002/2025','1','Female',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('3','7','DIT/003/2025','1','Male',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('4','8','DIT/004/2025','1','Female',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('5','9','DIT/005/2025','1','Male',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('6','10','DIT/006/2025','1','Female',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('7','11','DIT/007/2025','1','Male',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('8','12','DIT/008/2025','1','Female',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('9','13','DIT/009/2025','1','Male',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('10','14','DIT/010/2025','1','Female',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('11','15','CIT/001/2026','2','Male',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('12','16','CIT/002/2026','2','Female',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('13','17','CIT/003/2026','2','Male',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('14','18','CIT/004/2026','2','Female',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('15','19','CIT/005/2026','2','Male',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('16','20','CIT/006/2026','2','Female',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('17','21','DBM/001/2025','3','Male',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('18','22','DBM/002/2025','3','Female',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('19','23','DBM/003/2025','3','Male',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('20','24','DBM/004/2025','3','Female',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('21','25','DBM/005/2025','3','Male',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('22','26','DBM/006/2025','3','Female',NULL,'active','2026-11-12 04:01:03');
INSERT INTO `students` VALUES ('23','27','DEE/001/2026','4','Female',NULL,'active','2026-11-12 04:01:07');
INSERT INTO `students` VALUES ('24','29','DEE/002/2026','4','Male',NULL,'active','2026-11-12 04:01:07');
INSERT INTO `students` VALUES ('25','30','DEE/003/2026','4','Female',NULL,'active','2026-11-12 04:01:07');

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

INSERT INTO `unit_assignments` VALUES ('1','1','1','1','2026/2027','1','2026-11-12 04:01:03');
INSERT INTO `unit_assignments` VALUES ('2','2','1','1','2026/2027','1','2026-11-12 04:01:03');
INSERT INTO `unit_assignments` VALUES ('3','3','1','2','2026/2027','1','2026-11-12 04:01:03');
INSERT INTO `unit_assignments` VALUES ('4','4','1','2','2026/2027','1','2026-11-12 04:01:03');
INSERT INTO `unit_assignments` VALUES ('5','5','2','2','2026/2027','1','2026-11-12 04:01:03');
INSERT INTO `unit_assignments` VALUES ('6','6','2','1','2026/2027','1','2026-11-12 04:01:03');
INSERT INTO `unit_assignments` VALUES ('7','7','3','3','2026/2027','1','2026-11-12 04:01:03');
INSERT INTO `unit_assignments` VALUES ('8','8','3','3','2026/2027','1','2026-11-12 04:01:03');
INSERT INTO `unit_assignments` VALUES ('9','9','4','4','2026/2027','1','2026-11-12 04:01:08');

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

INSERT INTO `units` VALUES ('1','1','DIT101','Computer Applications','2026-11-12 04:01:03');
INSERT INTO `units` VALUES ('2','1','DIT102','Web Design and Development','2026-11-12 04:01:03');
INSERT INTO `units` VALUES ('3','1','DIT103','Database Systems','2026-11-12 04:01:03');
INSERT INTO `units` VALUES ('4','1','DIT104','Programming in Java','2026-11-12 04:01:03');
INSERT INTO `units` VALUES ('5','2','CIT101','Computer Fundamentals','2026-11-12 04:01:03');
INSERT INTO `units` VALUES ('6','2','CIT102','Networking Basics','2026-11-12 04:01:03');
INSERT INTO `units` VALUES ('7','3','DBM101','Principles of Management','2026-11-12 04:01:03');
INSERT INTO `units` VALUES ('8','3','DBM102','Business Communication','2026-11-12 04:01:03');
INSERT INTO `units` VALUES ('9','4','DEE101','Electrical Principles','2026-11-12 04:01:07');

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

INSERT INTO `users` VALUES ('1','admin','admin','admin@example.ac.ke',NULL,'System Administrator','$2y$10$E/5rmTtvqds.SxrqVc8wke/QTD18aXHWNHvzGd17tCTo0Tbb9J43m','1','0','1',NULL,'2026-11-12 04:01:05','2026-11-12 04:01:03','2026-11-12 04:01:05');
INSERT INTO `users` VALUES ('2','lecturer','LEC001','lec001@example.ac.ke','0700000010','Grace Wanjiru','$2y$10$RLoSMjkdSksXDoFDrX6eD.UOSq3cUHrMwnrv/lZgYO9KzU0RClM4i','1','0','0',NULL,'2026-11-12 04:01:06','2026-11-12 04:01:03','2026-11-12 04:01:06');
INSERT INTO `users` VALUES ('3','lecturer','LEC002','lec002@example.ac.ke','0700000011','Peter Otieno','$2y$10$RLoSMjkdSksXDoFDrX6eD.UOSq3cUHrMwnrv/lZgYO9KzU0RClM4i','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('4','lecturer','LEC003','lec003@example.ac.ke','0700000012','Mary Achieng','$2y$10$RLoSMjkdSksXDoFDrX6eD.UOSq3cUHrMwnrv/lZgYO9KzU0RClM4i','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:06');
INSERT INTO `users` VALUES ('5','student','DIT/001/2025','brian.kamau@student.example.ac.ke','0711100000','Brian Kamau','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,'2026-11-12 04:01:06','2026-11-12 04:01:03','2026-11-12 04:01:06');
INSERT INTO `users` VALUES ('6','student','DIT/002/2025','faith.njeri@student.example.ac.ke','0711100001','Faith Njeri','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('7','student','DIT/003/2025','kevin.mutua@student.example.ac.ke','0711100002','Kevin Mutua','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('8','student','DIT/004/2025','mercy.chebet@student.example.ac.ke','0711100003','Mercy Chebet','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('9','student','DIT/005/2025','dennis.omondi@student.example.ac.ke','0711100004','Dennis Omondi','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('10','student','DIT/006/2025','joy.wambui@student.example.ac.ke','0711100005','Joy Wambui','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('11','student','DIT/007/2025','collins.kiprop@student.example.ac.ke','0711100006','Collins Kiprop','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('12','student','DIT/008/2025','sharon.atieno@student.example.ac.ke','0711100007','Sharon Atieno','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('13','student','DIT/009/2025','victor.mwangi@student.example.ac.ke','0711100008','Victor Mwangi','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('14','student','DIT/010/2025','esther.jepkosgei@student.example.ac.ke','0711100009','Esther Jepkosgei','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('15','student','CIT/001/2026','ian.barasa@student.example.ac.ke','0711100010','Ian Barasa','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('16','student','CIT/002/2026','diana.nyambura@student.example.ac.ke','0711100011','Diana Nyambura','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('17','student','CIT/003/2026','moses.kibet@student.example.ac.ke','0711100012','Moses Kibet','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('18','student','CIT/004/2026','ruth.akinyi@student.example.ac.ke','0711100013','Ruth Akinyi','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('19','student','CIT/005/2026','allan.mutiso@student.example.ac.ke','0711100014','Allan Mutiso','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('20','student','CIT/006/2026','naomi.wairimu@student.example.ac.ke','0711100015','Naomi Wairimu','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('21','student','DBM/001/2025','felix.ochieng@student.example.ac.ke','0711100016','Felix Ochieng','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('22','student','DBM/002/2025','purity.jeptoo@student.example.ac.ke','0711100017','Purity Jeptoo','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('23','student','DBM/003/2025','samuel.karanja@student.example.ac.ke','0711100018','Samuel Karanja','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('24','student','DBM/004/2025','linet.auma@student.example.ac.ke','0711100019','Linet Auma','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('25','student','DBM/005/2025','eric.rotich@student.example.ac.ke','0711100020','Eric Rotich','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('26','student','DBM/006/2025','agnes.moraa@student.example.ac.ke','0711100021','Agnes Moraa','$2y$10$ESZtdtR/PDs.sNVdHKrX0.zGksl0JDXliJX0OOrBskLV0XQWtXYSe','1','0','0',NULL,NULL,'2026-11-12 04:01:03','2026-11-12 04:01:03');
INSERT INTO `users` VALUES ('27','student','DEE/001/2026','tso@example.com','0712000001','Test Student One','$2y$10$RSPuaIXp1tCNbM.iuId/POrkRufOdM6ufclSxUeAZf3EwVvnsKCZm','1','0','0',NULL,'2026-11-12 04:01:07','2026-11-12 04:01:07','2026-11-12 04:01:07');
INSERT INTO `users` VALUES ('29','student','DEE/002/2026',NULL,'0712000002','Csv Student Two','$2y$10$yIRLaTRfMXLuhTj0v/ROw.8DBFCPhup/2aI2rIOdK08f7Epxay2E2','1','1','0',NULL,NULL,'2026-11-12 04:01:07','2026-11-12 04:01:07');
INSERT INTO `users` VALUES ('30','student','DEE/003/2026',NULL,NULL,'Csv Student Three','$2y$10$Nq4thryW7AGi0vh7qqH.neqwNWiAu84W5C2erFFV0/NV9yW8TeZ5i','1','1','0',NULL,NULL,'2026-11-12 04:01:07','2026-11-12 04:01:07');
INSERT INTO `users` VALUES ('31','lecturer','LEC900','lec900@example.com','0712000900','Test Lecturer','$2y$10$vqKpN5uf420gT1wmCouYR.rPJzdJw/XhRtngE1/GQscQX1dMGvX..','1','0','0',NULL,'2026-11-12 04:01:09','2026-11-12 04:01:08','2026-11-12 04:01:09');

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
