-- BSAMS database backup
-- Created: 2026-11-12 14:14:46

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
INSERT INTO `attendance_records` VALUES ('459','60','23','late','simulated','94.74',NULL,'31','2026-11-12 14:14:45');
INSERT INTO `attendance_records` VALUES ('462','60','25','present','manual',NULL,'Fingerprint not yet enrolled; ID card checked','31','2026-11-12 14:14:45');
INSERT INTO `attendance_records` VALUES ('463','60','24','absent','auto',NULL,NULL,NULL,'2026-11-12 14:14:45');

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

INSERT INTO `audit_logs` VALUES ('1','1','login_success','user','1',NULL,'::1','','2026-11-12 14:14:40');
INSERT INTO `audit_logs` VALUES ('2','1','login_failed','user','1','Attempt 1 of 5','::1','','2026-11-12 14:14:40');
INSERT INTO `audit_logs` VALUES ('3',NULL,'login_failed','user',NULL,'Unknown login: \' OR \'1\'=\'1\' --','::1','','2026-11-12 14:14:40');
INSERT INTO `audit_logs` VALUES ('4','4','login_failed','user','4','Attempt 1 of 5','::1','','2026-11-12 14:14:40');
INSERT INTO `audit_logs` VALUES ('5','4','login_failed','user','4','Attempt 2 of 5','::1','','2026-11-12 14:14:41');
INSERT INTO `audit_logs` VALUES ('6','4','login_failed','user','4','Attempt 3 of 5','::1','','2026-11-12 14:14:41');
INSERT INTO `audit_logs` VALUES ('7','4','login_failed','user','4','Attempt 4 of 5','::1','','2026-11-12 14:14:41');
INSERT INTO `audit_logs` VALUES ('8','4','account_locked','user','4','Locked after 5 failed attempts','::1','','2026-11-12 14:14:41');
INSERT INTO `audit_logs` VALUES ('9','4','login_locked','user','4',NULL,'::1','','2026-11-12 14:14:41');
INSERT INTO `audit_logs` VALUES ('10',NULL,'csrf_rejected',NULL,NULL,'Path: /bsams/login.php','::1','','2026-11-12 14:14:41');
INSERT INTO `audit_logs` VALUES ('11','1','csrf_rejected',NULL,NULL,'Path: /bsams/admin/departments.php','::1','','2026-11-12 14:14:41');
INSERT INTO `audit_logs` VALUES ('12','2','login_success','user','2',NULL,'::1','','2026-11-12 14:14:42');
INSERT INTO `audit_logs` VALUES ('13','5','login_success','user','5',NULL,'::1','','2026-11-12 14:14:42');
INSERT INTO `audit_logs` VALUES ('14','2','access_denied',NULL,NULL,'Role lecturer tried /bsams/admin/students.php','::1','','2026-11-12 14:14:42');
INSERT INTO `audit_logs` VALUES ('15','5','access_denied',NULL,NULL,'Role student tried /bsams/lecturer/sessions.php','::1','','2026-11-12 14:14:42');
INSERT INTO `audit_logs` VALUES ('16','5','access_denied',NULL,NULL,'Role student tried /bsams/admin/settings.php','::1','','2026-11-12 14:14:42');
INSERT INTO `audit_logs` VALUES ('17','1','department_created','department','3','ENG','::1','','2026-11-12 14:14:42');
INSERT INTO `audit_logs` VALUES ('18','1','department_created','department','5','XSS','::1','','2026-11-12 14:14:42');
INSERT INTO `audit_logs` VALUES ('19','1','course_created','course','4','DEE','::1','','2026-11-12 14:14:42');
INSERT INTO `audit_logs` VALUES ('20','1','class_created','class','4','DEE-2026-JAN','::1','','2026-11-12 14:14:42');
INSERT INTO `audit_logs` VALUES ('21','1','unit_created','unit','9','DEE101','::1','','2026-11-12 14:14:42');
INSERT INTO `audit_logs` VALUES ('22','1','student_created','student','23','DEE/001/2026','::1','','2026-11-12 14:14:43');
INSERT INTO `audit_logs` VALUES ('23','27','login_success','user','27',NULL,'::1','','2026-11-12 14:14:43');
INSERT INTO `audit_logs` VALUES ('24','27','password_changed','user','27',NULL,'::1','','2026-11-12 14:14:43');
INSERT INTO `audit_logs` VALUES ('25','1','student_created','student','24','DEE/002/2026','::1','','2026-11-12 14:14:44');
INSERT INTO `audit_logs` VALUES ('26','1','student_created','student','25','DEE/003/2026','::1','','2026-11-12 14:14:44');
INSERT INTO `audit_logs` VALUES ('27','1','students_imported','student',NULL,'2 imported, 1 failed','::1','','2026-11-12 14:14:44');
INSERT INTO `audit_logs` VALUES ('28','1','lecturer_created','lecturer','4','LEC900','::1','','2026-11-12 14:14:44');
INSERT INTO `audit_logs` VALUES ('29','1','allocation_created','unit_assignment','9','3 students registered','::1','','2026-11-12 14:14:44');
INSERT INTO `audit_logs` VALUES ('30','1','consent_recorded','student','23',NULL,'::1','','2026-11-12 14:14:44');
INSERT INTO `audit_logs` VALUES ('31','1','consent_recorded','student','24',NULL,'::1','','2026-11-12 14:14:44');
INSERT INTO `audit_logs` VALUES ('32','1','fingerprint_enrolled','student','23','Right index (simulated, quality 69)','::1','','2026-11-12 14:14:44');
INSERT INTO `audit_logs` VALUES ('33','1','fingerprint_enrolled','student','23','Left index (simulated, quality 90)','::1','','2026-11-12 14:14:44');
INSERT INTO `audit_logs` VALUES ('34','1','enrol_duplicate_rejected','student','24','Matched template of DEE/001/2026','::1','','2026-11-12 14:14:44');
INSERT INTO `audit_logs` VALUES ('35','1','fingerprint_enrolled','student','24','Right index (simulated, quality 96)','::1','','2026-11-12 14:14:44');
INSERT INTO `audit_logs` VALUES ('36','2','access_denied',NULL,NULL,'Role lecturer tried /bsams/api/enroll.php','::1','','2026-11-12 14:14:44');
INSERT INTO `audit_logs` VALUES ('37','31','login_success','user','31',NULL,'::1','','2026-11-12 14:14:45');
INSERT INTO `audit_logs` VALUES ('38','31','session_created','class_session','60',NULL,'::1','','2026-11-12 14:14:45');
INSERT INTO `audit_logs` VALUES ('39','31','session_opened','class_session','60',NULL,'::1','','2026-11-12 14:14:45');
INSERT INTO `audit_logs` VALUES ('40','31','scan_rejected','class_session','60','Best score 9.17 below threshold 80 (3 candidates)','::1','','2026-11-12 14:14:45');
INSERT INTO `audit_logs` VALUES ('41','31','scan_rejected','class_session','60','Best score 4.13 below threshold 80 (3 candidates)','::1','','2026-11-12 14:14:45');
INSERT INTO `audit_logs` VALUES ('42','31','scan_rejected','class_session','60','Best score 9.12 below threshold 80 (3 candidates)','::1','','2026-11-12 14:14:45');
INSERT INTO `audit_logs` VALUES ('43','2','access_denied','class_session','60','Scan for another lecturer\'s session','::1','','2026-11-12 14:14:45');
INSERT INTO `audit_logs` VALUES ('44','31','attendance_manual','class_session','60','Student #25 set to present: Fingerprint not yet enrolled; ID card checked','::1','','2026-11-12 14:14:45');
INSERT INTO `audit_logs` VALUES ('45','31','session_closed','class_session','60','1 student(s) marked absent automatically','::1','','2026-11-12 14:14:45');
INSERT INTO `audit_logs` VALUES ('46','1','report_exported','report',NULL,'unit: Unit attendance summary – DEE101 Electrical Principles (DEE-2026-JAN, 2026/2027 T1)','::1','','2026-11-12 14:14:46');
INSERT INTO `audit_logs` VALUES ('47','2','report_exported','report',NULL,'below: Students below the minimum attendance of 75%','::1','','2026-11-12 14:14:46');
INSERT INTO `audit_logs` VALUES ('48','1','announcement_sent','notification',NULL,'class:4: Welcome (3 recipients)','::1','','2026-11-12 14:14:46');
INSERT INTO `audit_logs` VALUES ('49','1','settings_updated','settings',NULL,'{\"institution_name\":\"Demo Technical Training Institute\",\"min_attendance_percent\":\"80\",\"late_grace_minutes\":\"10\",\"biometric_driver\":\"simulated\",\"match_threshold\":\"80\",\"min_quality\":\"50\",\"bridge_url\":\"http:\\/\\/127.0.0.1:8765\",\"consent_version\":\"1.0\"}','::1','','2026-11-12 14:14:46');

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

INSERT INTO `biometric_consents` VALUES ('1','1','1.0','2026-11-12 14:14:38','1',NULL);
INSERT INTO `biometric_consents` VALUES ('2','2','1.0','2026-11-12 14:14:38','1',NULL);
INSERT INTO `biometric_consents` VALUES ('3','3','1.0','2026-11-12 14:14:38','1',NULL);
INSERT INTO `biometric_consents` VALUES ('4','4','1.0','2026-11-12 14:14:38','1',NULL);
INSERT INTO `biometric_consents` VALUES ('5','5','1.0','2026-11-12 14:14:38','1',NULL);
INSERT INTO `biometric_consents` VALUES ('6','6','1.0','2026-11-12 14:14:38','1',NULL);
INSERT INTO `biometric_consents` VALUES ('7','7','1.0','2026-11-12 14:14:38','1',NULL);
INSERT INTO `biometric_consents` VALUES ('8','8','1.0','2026-11-12 14:14:38','1',NULL);
INSERT INTO `biometric_consents` VALUES ('9','11','1.0','2026-11-12 14:14:38','1',NULL);
INSERT INTO `biometric_consents` VALUES ('10','12','1.0','2026-11-12 14:14:38','1',NULL);
INSERT INTO `biometric_consents` VALUES ('11','13','1.0','2026-11-12 14:14:38','1',NULL);
INSERT INTO `biometric_consents` VALUES ('12','14','1.0','2026-11-12 14:14:38','1',NULL);
INSERT INTO `biometric_consents` VALUES ('13','17','1.0','2026-11-12 14:14:38','1',NULL);
INSERT INTO `biometric_consents` VALUES ('14','18','1.0','2026-11-12 14:14:38','1',NULL);
INSERT INTO `biometric_consents` VALUES ('15','19','1.0','2026-11-12 14:14:39','1',NULL);
INSERT INTO `biometric_consents` VALUES ('16','20','1.0','2026-11-12 14:14:39','1',NULL);
INSERT INTO `biometric_consents` VALUES ('17','23','1.0','2026-11-12 14:14:44','1',NULL);
INSERT INTO `biometric_consents` VALUES ('18','24','1.0','2026-11-12 14:14:44','1',NULL);

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

INSERT INTO `biometric_templates` VALUES ('1','1','R_INDEX','simulated',0xcc593d6db818c393a1ad78daf7731004a4d20e4670bac75ef77ddbf6096a9b5f4805e8a0b8ec8532c5af07bdc890aa309fcdde76980ba249dcc817fe6f1e8e92447a5808b537035b1cecf660aa4ea7ec86c6ddbe608c5215e8099ef4a8f545faadc2274fc44ec562f731b682932658c9eac5bbae816806b4b9e2ecd3214e87099ac3deafe0f3c75e950d6acd2a48df1b8c41bb8ce2597cd8bcffe3563288f5690debb9def527a00aa91fe7e028bcd0b87bc438afc292b4a5dd8b139d25ef7e2b7ae146c9eca6ddf6dcd3e23457cf50da2a2579e7756fb8390c06b09fd8c699550c28ea37e30e31183fde0f77269d521f15b964991b50334e5528b59a852d20f35bbc8e64cb642190104bbd1662ad59e8365c223237b9bbd8496f9e3248eca900eb498d247deb513fc9aba827f7c0ad743dbb230386962285a8dce331ade27c664a3938fd283a6114a194cbb48b2f34a637967d499dedf58da3d37297edb83374e66d74c98e2dcca5286c215c5f175a7652e9638d1cadc54649f0f1483cf461c64f08f9f69595ed0ef2b4d1dae9772ad135093e226bb6b73378c07cc23b5d22d6eaff776898465693f3c694483cc810b9ca0d499667e898262fadade0de9f3f985d3a888c9bc1bb0afc51a9e2127d0c3a4063e0aad5356695896e2884124f2ca70c82ef748d3b5c93ab8466290a824d7f205222bae2,0xdec4a006c7da93685d754202,0x4f32c605666c5adaac3ad050570ae48e,'a2b288eb896b832c706311509c504eb2a86a9413a8565565c444c81902ccd4bf','66','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('2','1','L_INDEX','simulated',0xa8d265abff5019e14378ef2fb2473445fa509158589390d8b3d8dad0412e6643685c0fe1afd104558436f0ca7c2533f50a14a142c6c680c1d50a1847ebe80714f823125c1c4d2dcf5360360dc496c6f3ecd95c64a91d6a05ed9cdd1a00f3437a1f0118a6e36047ffa50cd994ceab5f1f0f9185c0d799acb9ef75692c452e201aaefde724d33d8210faf353d0b6e88a5bb9cabed1b0bd7f6eaa180abab666d94c850484d038eaf01859bef888166d94675e813493b87ea9a1b96b405975ff437417f4a39813b6aa638820d51a7ddabc31f617454eacc50781f8a56dbcf410d1b8e173b9b617067c892a8c514973d8973d2f28dea8591894c71979e0d1d38c6f226aaa9c3cab458e8a9bf9f0668c16483e1f337b727eb5607f4152823774917a7b82cc093db1586ec001968fc745119309908546afaf78189e8d2fdf2c31f20a39c101ced6f653e8f460d8a7e5b07adc43e52b61c6259cd494ae71ae3314733dac7ce8edf2b1d20a40a76350c6c508269a7faf25a38d1de2032088108fb7398dee3f930f9556aa1db3fac431079184c9bd28be1d530b28826bca98eb3797f1f7f7ca22f4e2c9a594b81948bca0b190a1f60d4173dafd3e61e07d0df8c98048b518806346312a15d8d032ae6c7c24b6abb94c31849b05e556380bd8ac87a683392df5f21ad7b4e3f483240b7b5bc44f4a4d41b6b9ea,0x7e28f3f8145e17d2f3fb3d1c,0x5ae122e7ae67cf218d83eb0391bc9e5f,'e2e46f108bb4c085bd9e5410d4ced6b8c59bf590e59339d5d1405fea5a4e054e','78','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('3','2','R_INDEX','simulated',0xc93302b7d8970b99415596de1c1d4a8be374af7c98847a12bc2ad69bd9e4ab328da8b48bb0aabb80ca7ca13afa341572f2485f5a93545e84849ffa9e64977a3486cd987a1563fa72800ae375ca7b50347023e412f957e1d0af559fcd87a0bf0862c77fb55679e8e2e2b6e46761440e79bd524b904bb52853f4fafa9b855b303a6dfb3d52dbed5235d236bc7a79e801270d0d20245369229b414dcf184763047a3bba044fd2ecf680ebf28d95db4a5b02c04e73fd598b4d97ca809a8787800567e7d702ad0b490528a4672321512271f79712b08ddf14909c800b403c3947e1fbfc650176a5c72e3b505782c4a3ed22f33ebb6c9c5a13145c27725a48bbbd9c2ddd196b1a66ac5effd4124acaf67f0f58f454281e061a3cbb1e1631b6ba52c2e3326dce47a4617bcf74b010b19b2b5357625182501ada9bd47173c8da677452300fcf5b706187243aaeccfa7a7b7769894d632475e1edd22b816c43dbdf699a53047a2908f6ac96832265472899b62beaafe8466926dde3062f4a60e8792a12c147418ff9c70756123664771775917e1d4e9d1d2c238fad930f983d2abf2cd5d965b2560aa73908358ab1d23827fd6bfc55533de5adbfba31f47a36e052876c18930dd5001c898b66db0f6320cb6b8cdc8cdf5995429bf48ca598b3b1dd727e73683e85931947de7172b32342119a8e18f1e546418e325b2e,0xa195eb4d53f6a75b412fdb11,0x9d11dbea724740eecf487b5b96929259,'c59e0c23f6fd70acd5c35d6fb348b100552718a601c9f1e002d3cd14a0ba0302','64','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('4','2','L_INDEX','simulated',0x688cd433e2066c133022db5e3ce14503c339620ad7fe0bf6ef4224e79423372756438754a95180aca072dd69e92d5a0397c797c3b60d82614db06b61a4bf6d3caf50c621538e67ac8f9f5635756be2992070c949b9bd6cd47084466d05eb483734574de556ae0e53f7554e9393ebf43f7256ca0e9757448bca5126536dde441e2120a9b8d720a2f49fc6460e2c0b8d0f6d0b88524a7073f85239d62ae869ab335aa7fb9dcc2d03770e493ed136fd9d3eaea651bea75a3f2a5904a45584d34d6bbf5f5d4acb544d3b3d65d79f7f6c3321ae5c45054f24b0c310d14c0e471095f23eb048ab74ca5d70c4734c80234759ee0360456e6df66bb62ba8d43a7576647bf5b9b827881c67934096cf12cbd3e77b25dda7a3336cc3350caf2e243a33ab8d534374e794175a9adfcaa6a0ac7105db123a68844e5dbd3962f876f9724164167b79cd9afb538a754dce2f04803e12608a301840604f8846605510a409f7b12d3196629d66f91daf762a96d5c06245605d666349292ad3beddc3083c656c6bd712c7836c30878f9c91509ef5632666a16d11df0c7def11bcb814839ca78e8ff38083533ea39aa02b5274f15893935844b66dd8b82a2f9baa40182cadff14709ef350acfe3ab1920d5c74cea4e1ab441493ebab6ced0cfcf067b7e79ac07120f24d6616d9c58372a5fb02283b2f96ed77a67efa7f6032c7bbbb2e,0x51869309a7c3b2a2eace7ad8,0x360528e2c2f305ef257c643c83883d3d,'0a752b94f403045e158e04166fc9c92b5ae67ecb0046eeb8f1a11ca460e6e732','72','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('5','3','R_INDEX','simulated',0x00f057a55ad1ebe653c6a25d0d440bd2fa3596d5ab18c463b61d6f683bc21fd9b42113ce8d36bc0dd81d45b8cc52c45f07426da3bd0d599599659e475fa66b42b820c6ee71293ae07fc82fe4e77afd093f341d2441c745f221906c40ca9a544bfcfd4eb5e09bddf36e2eed4b615d586679af7ba41b09a0817f636d802ecc4d653d62ba5312383886a8651e930e173316a3efb70eafbdb2b963b99e1adac105c99a31c75415647cf500b6b472a10a4fbec26f2867170169558f0de79ff8b7cf8c2b71565252630ae3e5f35d72f208f448faba6a87b5d580b54251da257ddfe05b47a345f31c5981e69f0be9a77b49127c6fdab952a091b347e0a2ce54d15a3491b7ce062dfd60f74bb30b9ef9b8dadc5bf60cfa4ed0667125c45db9d6f0b5af8bf10ce1a03ff953a5ac3c7f6c92c2c7819cc517e34a00eb74ab5bd4986594e4a2b5e59dd7cfe29ff28c89b7289bc4eaf8b11aba68313d1c9e63e1f0ccbf4daccf447c796a83c2473d69dfd9eb8fad1a5d25690b620f6737698d2f6d6140531d38053a1c88aa4cc17fe5ff4872e403c22bada3a6c4747018f90f2cf7c05b1f3ff7cbcd725d67178968c01e173be0384543988a135fd3e7b9428f8cbe9cf39cc8002e27729ecd2687db8b733010f1049ac3626e9b4998fe1687c60b8b4ab35eb413e3a28167f14435fbdd9fed17c73b86a55379be2e12a4991db88711e1,0x35bd1af3933870f0914f9201,0x799587903db23be0d0ee8b5852b8d8a0,'c9bfbfdd9b0c72068962ae60c2e94894d7bf998b2cd7549f62e4c776ae1b2056','63','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('6','3','L_INDEX','simulated',0xe4c112dfcb278b3aee981de651c6db7ed6cc097cd911349175b342c3d7faff43d12646530d1660e19b473495c60abc5b6227c61ffe4cdf3542653c44bb23744142036b608c41fa2ed2c3e9f03cb3aa71e417627f1dc6ab1a8be3309a4540f790ee6b6414e46f204effc9391fba971916d1bedb39962bda9ec00842fc4f2e406e34a085f51cad3a196910413b5f62ceb1d1750d8b2e84a7c0f38fbe2631da4dbc57ba3561cccc72c8a2a8885270238858e28fa80166da6e41f77bc421aaa853d57e3393d0f3e625dcffce9334ed3a9efdfb3e420d53be419d77374cce27888034e2314301d0c08371def2094379c5bfab50cca9e5eb5f304fb3967c056f7e5c2cec359b660eecf596f46e8284656007a9918ab0f95170b79cc9a7ea94011eaef50bfcf3db432eb646e005e4c6aee6d1cea9361f72ff0271a07dac537e1914001bb1923dc3fbcf4167a57c3f574deec5e578a87a5a6ca318889d33d6cf692eedc904225e58e4101e4d2a4a6cf6eb95e4a48184945b6ba631ec8a47de28a09440b86dde281bc131162c775e844a60b7b5adb3f33c39962ba2ca048722b49a9ee0a139ddccd164db03c1eb61f89045452e250809015a7cb53f4009abaefc3b0dada9578ef7cd0c409e0890e323f6779b181d4c932d88b5533789a284f330f28bf00595b71cbd17454388d30323c77d07fcb2,0xfb9fcf0eb23edb86669dd97d,0x1e3e34ff5e08ab745f18c085f1c0dd57,'c083631d52321a651ba54986f83694c761622c66fceae73b30eeb3d7e3981ca9','87','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('7','4','R_INDEX','simulated',0x4316040b451e3a04d7c72992ca176088e632031ebaddca8dadc069fe129c7e8456ac26651eecb733f1ed598333fccb51bd798f7111d0400fd28a954347130ff5197c068fc6948b949f7b2e7c2cf2f207e961e3f83c67ad5f0dd23f95b0eba1f84cd73fed4694c5ebc618f53b87ec72665deab2a6a26212feb567df64fa26f4c619958f92e625ae3d012a87744cdc488f2bce36a820c6252ebc3c4a7c3719f1d8b8ff92505593dfcaa9629b2ee8f0263cce5110ed637bbf66a053237f084db3463ba6745f6c4542070a1a7320e750caa5abbfefe1ac673dd3879308cd240a9d006338ecbefbee914995d9f8461cab5ff1d0ea0d56c47fc5e8b52208d776200d34d395c3353df5567e8f7e931d79d971ed3873f8eeadb70a73d66ccb449a2b3f55eb872a8694121276896daa65d420ebe142e55f5b52c4c1bfd8b02bbb8fb1b5386a01c8c3394a416db1ec2f38d386283a9facdc2510a3c967f7802cda0f688f67df2990ccdd11f52ebc171c9003ad16318895c121a6c91b63ec67759728cd62db814f7b9b5f93f27e36a422b35a8ae797a4e7dee4e5e370b206b36e493adef32fbb22455cf2d6cd7caf6563b12ff996311c91b4f7e8631971454677d31147ad444eef72c8381c212dc960e77cfd097c96ee5f89d556bea54600fb7e4a73a33904518adb72acf1506e43ad4e870c80d9cdf968,0x51cd70b2073362d42d933330,0x493a8ea21cc48a880629a8d35cc4895f,'3394555821fd78172ceffda27057747280f2b9f98393883a4425da6f402c6267','80','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('8','4','L_INDEX','simulated',0xca234a9ee25bf625d5f0eb2328a1d1f29c55bcc90141d170ba63e4466e249122b06d9f602efc83f0695527853c2a4162abd81c273ff8de468fe23ae1bbf13507a9be9990ceb1eda92e02ea6a41b628dcf1957bee2c2790246a4b3b07dd41999fbb29c400329d170c3a4426bac426cd8b3919d80babeeea450d6eca33a0faa432c439da3f8e810b570fc9bbb75d58206c761d0ca9d4dc199966fa0dbe0e15af931c5c663318f381895b124d9bccae2005380e76d17fa1462994041763e8d56d75df458cdb12d952def1c18e7d921763dcf24e65d8e4c2515111ab1ad3559a8bdd76169d26ccd0d614fd45cb07c0fbfc677fc797f51667ae81183c5132f0fa358d42f3f62b29623c30d721969b7f076161b05912e12884fc92d9ffc81e6c38d9dc5683e0c3fdfedf424a334fa2f1ecdd9fc172fce380fafaa8d5d79d399f847dbede15e6ea581461141a05961167f8493e89e3099e7c4aeb118608aae6434bebff252fa3d393c853eefa7dbaeec089ba8cde28384be773fc444c99ece332bde9aea924da8f84dbe078dd0a348d5ff0f5e34e377e4794ec6e5f3802800e1db07edba0f2594552f95c7e4c351ca7c3b4ffdfaf79a00e0dab39635a3e42acab530395944511cc107a204af6e4fe71cf2e8e6b04c44aff5232537ba9ff67e7c6c38fb92ef420f8d0ac30fedbc8c43dbe45b2b868a2,0xfdf137571ea3abf22c855034,0x9d39d6dd023af421693b690cb955255b,'a50e73674752afbc4ccc4f2e662dfde11ec73f6129572f90b80a9d0e12f907cc','96','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('9','5','R_INDEX','simulated',0x754ad438994fff8cf2cc8fa7502251d529bff2f5031bf464ee8a40aee9313ffe81a33e2866c4b5f77bfcd8acf7ab73408c4eb8a62936fcdbde8e1fbb4ea2ab2cac0d22b54a8827016001009b7fb6cb507a0be0c275dc5cdaf3e1e5909f8bebb22b84d0c56d11e622a1007a7f4367ec0dd193fb4d53799c18312de25595b21f6799c62ddaaf0776e7ac07f01890ead12e6f53f09d9cd45773c3d7d430ab11fdc84d3831c83b47fca31bb880b15f2dfbb1b028d4b9a41578ac4238212768da4620fede85a9522d71bc7240a28e16ca3f16b3fb8dd4e757d99ac516619cce8ffb2bbadad8b8c8ec972d7ce1b97060abe5ee3fbe5fb04e26ed25e09d3761d7bb476b1d7810f72335467fa080ee86e70021addbdd57570213afe042e8efa802b190642592b698dc1765e8f2428dc9789d6ae3bc9993e9cf3b94a4ee9cf6c18e93cc1c56a09be9da2cd86e948762c39c021d888a4cefdce33fad5624f283e2343123771d28b5c43ffe9414bc834e8bb08d724f16ed082f1d6223f54d756aaf11880d7bc2bae9c6f5bc605e358df91cb0759eb1a48834e27fe5afc37d7cca6e84b8a9ad507b6398334bb5fab656b548d8f1966d0ac4f2ce5559b5a1ef6d910f3fff6e9b0305545dc13e5c3dafaf27035a58cfea5091492a2cb5a4710a8a89d26c1241e19e2562528933e2fb4a0ae72b8479de546274c47e1a,0x664cf83ac7a678be40ffff87,0xbf2eba6ca8acdb7a69f8322c6d8d956c,'efd6d65f99b57cd47ab4acbcc6a30906e5771944fe585afc5e91672c6e2ff177','68','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('10','5','L_INDEX','simulated',0x2747db20657cd799278bed294e50e9faab59ba28de7179a7ca4b4cc5c7f87ca97ec0ae490ae33662d5fc6ea4d7dc3519a893cffed6570dda869934ae82aafbf1302b832cf365688ac6f5cd555a95bbfbab1b01aaf1a9842174d3ac973fea456e6e3bedb58a67430d02c0e7322a47d9f9232098e1f0ab998d1bfbe19a14dbe3c1dce44bd09b7db0b0ae736fe44a39b5437484cc2379705bf9a8181e6e276d89ed0a0a4e05585711e4849834e22685698fb2f493910cd3aa8ce482eafa82056939e2b9123ab1041956b75c90e0a90b41a935ff1e83bcd4432a4d973480385bcaf6d6552fea01381dea1a6d15c0735e302cdeea1ef877f1fa13052de64d9ef2160b9cf65d086b46d7f8b44f97eeb5987a7f6602f35f61cb23d8e4fc14c60c79b4ef5b3241ba9f7b3bd76abaf402417405791c1f2495fe53a4e090cd1d617326ac6b938fa3cb89cdfe048bf738cff4929427077d7a68594da11a59308419abe2c959b9f1f04b69d7545f04a4177f38b7ba40aa61e35d3551871c4bd3ba3553597ee5b65c92d49ad1fe93a853ae3e5277ce4d9644052383df440923587e645cea64f9ec475206dc7c07e91e2849d2ac79526d2e9c4bdfed69992e374d1d21d3be602b88b9a3d451b8c9b7cbe8ce98e5362c326f7be77ea995c5558b517cb596db513b1df82612d38346aa2ee2d6ca1ee6d0fd44,0x97c7ce64dff0ceb3d82de4d6,0xda5179f1973cdddbbaad5c3a697a5b19,'ca307716610ff7e8d14559ba463a86d70999b1033fa25017b1525950ffbd8bf7','69','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('11','6','R_INDEX','simulated',0x716c900bd7a89523e7a4e7f19338e3f0545e16f32dfcebc3e0be8c157f26cb824a048bd7925a07e3bc1e1945ab98bd35684c244969c1249ceb4728a97b1595d301f3c9a4faa2be9ff33048599da0212c15d75ceae6f68c13afbdb1f2def90474e8c0af1900b557c359f06d282ec42896d1ebfddb01b5328f236aa7104710d317ee7a393e61d29176199c5b558eb16e5f81bed87762e9ab9ddfe67315703fc5e092fdf8a9f6edeb8b7136a23f3759512f3df6b0275c673a70d0d2021744773628a2c900d189a5b7ac42714eb369c46bda2decc9b1a9a2705747ad2d3aa1db00da7951b48c330adb7ea3db10daf8e31adb8226fc5af344f95bb94095ff9c9fece1b7151e5d2848fc371741744cc716cfbaeeafd8c2bf957b744a294b0627ef5b9676fcf50bfbe94a7a4711956eeed0e6ce884253a031a2f1c7444f4b82d76b5b6ab1f043f60dabeac0fc2d351401aa2accb7b4672a53b326b388c0447d3f008683be732e71dd947e208a5cf37dcc08961fbbc3a627446b8cd58e72d943eca4a35325b1835e8f4f35cb3f5ec4991728b86e53620f67381279a9743fdc51fa3bea3b79e5f45afbb4889295c3dbb3629c5f0a950cd2221582b5c628199f6d1df6910feb983c40ccefccb2cb4d3bf206e590c769a19a6e06fc3c3e146854d5b6c28955ee9c45843cc85fb81cbf013498,0x401959eaa95747f1ac944326,0x8bf8779cf03d8d99961204a7bedf6ea7,'8de7069df58dfb9824aac1e96ba41cc5eaee3cfa205cc419efd32646fd23bc74','81','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('12','6','L_INDEX','simulated',0x982595337d1fe3f5839869c1a9dba18236a6e0d740618d6f4311fe7b3d3e5fbc7e95f4b0f57a1d4d13b7a133b5212936714db1100dd551b973b2865a18d094fdbf6af66c5ebbd5a68784bf616d995087b9939232a4b18134966d91428311362f6fe56fab3aa9fa3979db820c2f5d8352892f826e47686033f4b7d4643ff586df0f31035d632809b9f490c12fd08a9b38c5acfe7f994c4e4b3752ec6dcb8586a5f73fe08211f61a691d98dcac4c888ab291888bd967d62b572cc02096a4029b1f6368c63ea5d53565b9e8bd710a0c0cfc638071bfb35d50719cc320aa0c1bfb1843fe0569a9766ed907497ee37ea3d51afbdf317a3a72c983c09a8aed93e5ae5f704894313d230c4a12e2ebefff3e11cde7a4395a619d53d43d071ed4f40b3a74cd75c4b27a12a3fe0ca2caa318ea5b41e3a5b947984b990c6fed0df426922fd7e2992bc1a938fe19c30483e1e370f088c563512bd9a4fbf0edc4cf685c70b5927c270b4f4f403cba312d5dd190b577e569cfeac6e9f2e7b5f3c5a63dd77f142d8f2cebc13874fed28522ee65f5dc005482912ad9969ef6a9451f4fc0d8cb8033b9dc741e08c7dcb41a44a5b237c9ad2931a076b4a509ddea1ee49e3011699138e85a5c303625235dfc5c1b3ecd6a2f18bf4d3b3b5d2f5a6e1c1592c46d97c65ace2ce34a45e57fbbddd6c137db1ae24fb2c1bc,0x8c747a00171c86fb947e2fb2,0xcd69fefa53ba66f4d7dd3820a211c322,'9bc4e918e8aeab19c6e88580dcb2123f75a998c9e0e3c2983e0467f3f39e2f5b','84','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('13','7','R_INDEX','simulated',0xe7d29ae55f7e02c1faf5b8194fe4e578537f903dc420364a35f016235f3efe950ec03a77e2a5f0fc4a6f741ae9d65123745fec57a17d63510b7df9bbfbfc1b9842df7c3b5b28cec2dddeabfd91af7e1c0c2f2e8c91526f068e4f52548281838e6687463107368bd7bedc2ed0b40761b6e646e5e19bc0a01337dcd99cfb6e61e20b146bdf567ee95c52f003155993f838b94f99b90f23bc68fd41602ab4730dc3d261a54c3719a941631b29a09447b136506d424278502a0e54c96da191e5d26cb3286f63bbbf640e8003b0a254a0adc8d29d5429ce43b32750325e5dac21822a116c09365f971077f240de674129e2c88b55d375d56c8afb42d25ed861bcf34603783cff86d9c9db2b06a50f1dacff1748ef0082d9927f58793a08f86c0e54a3c3b77651004860befda83ec37639596d8a6ea005bee53bc454d92a341c32f9bc91be942a8ef546cfc2a09db9eddcfe9157048387d566f03246a6ccc804a7233c6d680224dfc0c37f3d6550fa3c330374621443d1f6c8bc533fe0617d20318fc8f6136f1d1674ee3c2ef5aeb7a813da280cb11bc3ce6c90a6bb14455452bb030b9a9a74afc9914bc0f4fd43b7ab77f73409fc7c04aad2adf5ad4214ee2240cf81e115c42d2e3a63677815bfd41e60c2f9960a01189ccb8893713b1b10cccbcec03c8e27bf7f29d5d052293f924ef185a58aba0b77,0x9ee55310bf324a00bc961fcb,0xc18c06a4b38fc0b922976a7c2bc71542,'aac517702f1cb307be6a77e9e4f9618dd985bf1ac336f236ace9b9ff32662bb9','62','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('14','7','L_INDEX','simulated',0x45c614d0fbfb58809a56394d16d98fbe02a8de2d77fa7c972abb818978ba2c6ecb71722a6ab50488961f07c9035926e419f0daa2b2e80265677e850250e6fccdd07fa356093a728e883190157903383428c49f205f190095c3efa533c39ec0439a2f93f4016172d4dfba1bc9ce1ae9b8bb9f4188a724d96d29b2704fcb0723040d1ac3a4766cf3bb655a6bd7644d9ed4a7f8e140e4ecf28f0d7656dc0e05a4e2fa03a97abff843969038e34214596b1ee9d244e245f2316dad9f8790cbb363639d63db9bb03543af638ea2565460ff7aea7ad2074bfb94094182f1db945eb6b51a273610a0901c5410a3f8b725c6db27d39892edc8f6a38d7413131d1318790c69b057d098718e55982db1c2acd1e4b5265084203cb0781405ccc9e72b2a1c35e6ca74bf9b9835f4764afc02bb6cf777152565183da428b1585e73ba024336d1a1a46e4c821e5d5c4f8b861395622b7fb57c57c391507bb05accb857f89cf0c7279c04f8ac92810b83c50d9fb29f4b2133bcb822f5d66f2bf2399318da4a2a7ff728a7aaa0e50c14260cb3a992b2ee31ea1a92d8c251892c7d13a648ecc290f9dcafb1533d97efca9d692c824c3b2bd1f84e472ac1f3794034925b7e4a7d4bbd2cca2b329ac6862886be1ef88f766e96f3228cc7170e992aa29d67e40304871deba6db1aab93f6ff02d21e08c8f793f804342c2dac07f0,0x8e90003dd20c6ad0bba42893,0xfeb446d1dbe845ee4c44bf06da3c0557,'6400270641b5850c9f424a973da21fe606883ffd323d47784e59540af02b9296','91','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('15','8','R_INDEX','simulated',0xb206da71e4cae4c8a40d29f8f9aea1d859280fc6d97d3b6e1c856c6724695044e773cbe73f1ae610f4963c36c33738fa1a22201c1c927dfae67cbf817f6b4f614295a239ffb2838cdaf50583082918bf772ed10e2d38ad1c4c8d697a8fd1ebcfb2ff32dff624113625f104617d9155f98bbae8b2fc546bd00d1df467c66e9d2c73faa75d98a19add9cc14c81f50c725f17e332d259e15bb075f0af513ffd0ee50cb16607dc5cbb991cdd76c84e95c5d6ab1c1384bff0c2b0a0e7a48e55f70486cfb7a67bdf7b24245495eb89e186cfb4beb5a4f8de1d54762eddd20b5085f72c80a54abc47968bf530cb7226e92bb8d1b79f5659fa0d799a6755ca3ffd5c9273190fbb1dd3636962780540bca9f2b2301e34f34dd8b8aa07332b814dbe985bc2871c040d66572cabcfdf1bd0d16267ebe8bf280346c11f812b3ff6fb6e7577c1b668c915295f25cf79a7e6eaceef4d5340c1e7757efe8eaee9b6e77f1f228b9aa4310b0d9c495becd1dc23eba3955201259dc304d30a9d3840f4179de9127cfdcc71104667a92897b43bd73185058ec08fb0c74f0301420cc67dc3dc01c89915e1573696b2ec9a1b4fab6740f3f2e5ae6280b901f838d36c1f14bbbe3a150c92a3dc38340897e7afd51dc2605df25f179801bb554d685fd1fa9c5cb609c92ea5b06e7e7f0ddfbff92fd255862dc67b4229e430d36ece,0xe9141c9dd1e45441fc9bdbb8,0x9a3d2e985faab3bda62fe5d59aa2a808,'e1701305b520838dc70484e01cac762531cbbc30ab4c3c378ae9dbdb7d5b4009','77','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('16','8','L_INDEX','simulated',0x365fef5bca8fea362f6e1191a452a9b39d02023f8dcb4cea48c55b96d4b3960e0ebdbf8c640c9c9b696659477788af5acbd88e12977fe63b3e909c2eebeb881eb960d2e40971d267adc4086bf8752d169d3a697b64c93e162f723ceb98c36645f8bc2d9e6ebd3540e4a55f126564fc3025599fd38f3c86b9d43f90ff6163f9153bb44764bbc3111f454393853df533d292c680266c544d600bca5ed275d8e66969112ee9e3a6a1736246589053f787a008caf6fbc3ba319ec739b80ef3924f088a331bdae69036810b18085a33dc49aeda6d37f67f0db07355e2a5df289972af8da6f28012bc8a6c151a16f2cff0071dd961592fa77e96d56fab2db4e763c0afdc435615eb87880d62bd6fccbe38d69e6d92127ffc5f51ec525ecad22290f3bed7f9110428f27e7f1fad87c2d8e5188e986a95e7aa9703d3299fe6febd50d874bf711da6858502774a0ef8b9f56399947c83f4a9a21d0a8b69d51b327611092c09b94d999362add27a4f0945bd183230f53468ea84720949a96a7daa8437b1b9be70c1450f64cae4da0ca30325f2e7956ed8e1bf31658b347312a1511661d8df58dffcbc6940f3316c9ccfb46a364fe608b51245c5e769291c5a798f97bad5261ef646f113654648045ae7af8ebf5c11bf1ddc44b76a06d211e819549f4434ff75bb8af54574211395bed64686c022780d44b8f20206aea2df,0x50f68b91c8c3f61580ac3393,0xf4f73ccfabef8d84a3e511c4c73a582b,'ec9da313f04048519a8160c23f5141c8d19c076a2ee9d68e8c4faa01187f2741','89','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('17','11','R_INDEX','simulated',0x882e68d87070f5588fc4fd01e1fb7e2889432dbd42215554008f867ef68775cb458899ed81639662854eedf0e229ff648e3526bceea81ee34ba33cfb2384deb486ce8ec67e2653253132df5bd0160ccd4008fb6038da5e0a0804364c256dbbf73e9434dc2933db1a15968361b1eff1ec1aaa7b47f64ce43dacd5d826404135b70dd5dbd52a87a524bf02293c78cbfed23a368bc9cebc938f8aa8c9d515c56e4f44674ded4c9da8e9f2cd248a83b96765b01b33c264cf4368be830fc5c44519be15ddb1804fe7e2199d280963340cc5677f0a1f3ca3906a79c61450ff1730c9b962d980ea947b27dc6822a59d8833af91e89da03d6ab65a60731c1f10e9f0bb3147713ce2182e51660b783ac24932e194b7bfd5dff4d1d78ebd8933c6b2b093d4f4c3dc5a95812066941795e05e9d364711ae847967a01db07c5522444bc3f6f82c791f6b87ce19dda66ed7d845eebf45c47de8b58d1dae190422a30546e4c7c3d8704df85f2e51ec2c6b293ffcd0c189cc0b5066be73e50bdcebee0155b0663fd7b6230ea501d5c597affc1de03e019a01fdb45c925c15a47f751c21c853900b42b9735c3f0691bb621384bc50f60e2131968fb2cbfba5bbccdb429e638d245a0eeaea0b143c00bf2339ce86c3aeed7c2c23234bcec4ca7a9ef85c20e208eaf039c72a7cbaba6bc38cb13de45f39aed441e70a6f4b20282a0d95,0x24e140ae1f57902109e5dca8,0x5e8164985dd019d6aa2ed9ccf5164a4c,'95b690a137721658d56fc94ef06dd17a61a777171a9acda85cf0ac61bf1c5262','88','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('18','11','L_INDEX','simulated',0xb77ee0dc514bbd3247885c9b455a025930617fe80b96a47d39f156987c7c06708e854b368ff959e2b9efca1f489d75d516c046eb87e4b71dbc5c3313c447a66d74cb321ebeb62d6b978c302efe4ca9088c09cf2aed026b36159e8cb12f1edb14285cdf3fd514549722074a15d307fcfad73c5539c41408c6fc6696432dbde12a09d846e010808ac58df5b5abc19cf431bfc1f165abf0561687ce886917d432dc971d67f7967b9da017daf0c5637137a13610e3ec47b8c96f76660e626df23a605e0413d110b84ae937dbd8785741b3c361e29e2de9ee9cee16670a8052e2241f08cbcb46bb878d39f700bb19590dcd21d5b883912e0d0d6c125603d0cfd0bcb2b945388ebd94eddbb24f99977870af216aa894def3e9ef36d65006ecb595da0768042472b885276b3decccab4a33dbae6517e1b2b307f7390354715f5cc2fa1390641072d9915a0fd86c060b666fdc956d7a9d990b3207d19de3c7458752186f76245f7f35f0147627917545b5615c637efbd4b36d1ceb54b174108c444c7cb902e5deda79802fa6ec94b2cc3fcf15bf1e5c3352d90e658fb43e8f911ab32771699bf805bb02b4c6f6bd37de1e74a79b4a9613591f5591ab4a349b8ceee0590d1064982a229c22da25ed569e7abe7d905f369f49861d9e26b8dd99bd915be646849df4de0d46ea303286ba2fecd8aa13894ee19626eb6c,0x980b5d856ce30489db71bc66,0xaa2a55189bf9dea317378127a2489e5b,'4d25573374ec0f1ad8ff8bd3d9d2aa22e6da6856904f97877ead8efbb8d0398d','92','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('19','12','R_INDEX','simulated',0x7f9f9627aecb6087abcb991444fd11d468f73c098f8dc5192f1004c65da5cf9f9c143ff5fe3efb52f53139669612525790ef000dcdca8d94e23d3d3aae1be9878812a03f2afa796b2ba8388796c6d23ef24483f64a94adf025c3ec6a234aad019716314b516b4c37ec61d9e33802869b5db850f25cf0230c38db7ecada4dc9b903c53faa8138c1ff61d8057d2d123448a9ea112e630beda43382d552b7ed7f32ea782bbc412418f4c4895d8a600a8be2bb97ec92d4224cea42dbe6fccb4ed16c8ad3da283fbf8fec62d6e8400e9b92ae8a6837dd5fe198abae6afd3697fd5fb8b1b121408a67f7c35c93b656ec8f16af006819a714fa65fd2ea6ff768c3d18a6e0b34719782378123ea0a9826d016b3430d7d07127cab3159d37bd889233ab116a7e945e0b04780e7d9d3f42268cdef547859b5d8e7cbde6748cd99375625a4c25bcd35ac718867ab13e3f32047adaed6e6610f8d8735327573191e1269b9a4bc926a83022f1e28575fd0ff0bd692e585c591eca5dd1e33c97889685c38b540239d9df679409b5fbad7fbdb85f25acd136550744cfca7c929fdf2b61545a481874993b9f4508aeb41e0b3ae34d20ebdb11298887251476e52a89d19aaeb84734f05ebaaf1fbb55f5c9e0edbacbdeabb29f0f50a6912267da566c2b7ddc860279872cff5cbf9c87fe30cd6971a65258a394a7296951de6b543dbd,0x38b3c43b43e7eac349c9b153,0x4b71148192e4a45c150db6d2f5fcb7b3,'b5a767af8a33542a8ab93c5d3e0357ea9e9ed45f308725fa788ee3c76cfb8dad','74','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('20','12','L_INDEX','simulated',0x84065c79e649bec59c595f70af94cf610c4f1bba13dde9976bf2f773ccdfe45e1dc3aa5adf0f0a0df127a9d97c276d1fbd45adc99101c86c51272c3eebc549cda8b3abdb08b041f321e7c32451750378728e4a222afbf7837e459ee68caebb85ad86c9936be0eead596d64ea4a33b5c18162a612dbac55d5cfad676e9b59f5a1b761aedbb7ddb5480547d79d1a8e687dbc6e1d471716839c8712f213feed16d5987bc460136cbb94557e137ba5852795cfdd043c6263d043b52bad49fe04e5120625c454a0b91a218aeb332323c9183eeaaab2192cc325ded2d00111e5aec451905f36a24af125fc1bd8adaaa1d7e091715d6357b2c40f874f29dfcb43c25e800b9a2d69117925d6c903f0edfb0addaa6721007a5052e0581e2cdb05d8cb53f3b11936b98edec98425e48959a4a2bc60cd7add356c37dbd2ef24010b53b3402495ea80dfc89580efb237e6a62524dd281d3044dd8e65aa78d56c7cfb9a06fab46d2e5c6da29eea146f7d7227c8fc45082fc1b7940d4960067c1736a8b6d7733438185833687b3b65108068d959ba69ba101d6e98454aae72f4b33d0b8c982610f71853394535b070651c31b1e85d1a54648ed0a4d614c9f0c3702a47548e827963a87b0456bd96d2899dc5a59ecb980dd731cc803b4866fa583faa2df6c9c4b37961ca23bd6e66e765,0x2644dd370932bbe0210cc96d,0x727c708355a88009750aac6d79180ce8,'601c6548e6734845538eb9c470db26f59984727c240548cd81ff901613561dac','72','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('21','13','R_INDEX','simulated',0x6f79a44deeec3d2f3d201971f8ddd632fbecd3afc2e52971e2865994e24f6411e3e7143522b23629663dcc1611ad9ef80eccb4d0b27c3d2327e8fa7b11e8b132c4e570581227f4355d9ebce722cf0ca2d232e4dc7e811257876cd4f7f0d9413dc19d359f94671d6d516b5d72f9e41652baad0da2f509ee946f44014ce53d0cc9e0f0fa0ba02eaad43e62ec980afb2d0cd1bc59e420ddde579b1d9c172538e8ad3490963af110243b15345ecd65c40132fcd726bbe40625d6747d68fd8d89bfd447c06fe1151afcc61aae6c6416daad7edd94c6bea49e608aa74a318772a128639febda98762551ab53a63af37f03a6caeb764ee6b5743d8eb88b9fbe36a5e8ec9b0e43271b0de5909e295be91005693e9b155ee972d606d34ee7712c3f98943af5c01f1009ee661314184b91551c38d9016cea87f695e0d9abe850f5b881b4056335305b3a1e7ce4b99712da15d893bfb74ee2284a5389bb9080608eb06963706a4d3570c9fa953585b10e5cf8a0b9781fed5bb9963bcc294d2bb6287f4bd34de9e10184106ff0be3ce9444a54a1eefdccd1e8f10b6bf82e498096f0992a8e2dc22ac2bd3deec94c49744ba4cc3bb2643a4700f262fa4496b8d33ae6172dfd229c660bd8d8f0f66c2eb8c45e3f99dfe2f122b627eb92957cead466ca2d64fb6bf7d2,0xca188ec408997d77f5beb08e,0xf07025bcb67a00c8182bc913c1da3e96,'1b77a4b0047a45ada8869d60924dfdaf72934c59916485ba5a782a442494541c','74','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('22','13','L_INDEX','simulated',0xa2f936659ef40c6e244cb4892e9564b5bfc29d31cb33c1c243f866155d9a06b962c124625b063c5190300c22f4550c28331a6e79c80fc1983c11a41c34bede5c04cb8f430437845e14184d111535848758dff12a7dbaed6c62fab23f8bfc9aa90816a20d24ad96fda1ce7199a637319785830180d01763e315021e3211709a5f7a40aebc8fb0a69bd83aa2b063f01d47cc8f339f96c0a2b66171e6f9c507c867691795569fb37d6998802f4661277b65ed739d16ddad20a7fbcd5574ea1280ee430977ee5fd6580eb1e3d97dbb37e3ac29f40042a966bda5bef3d9a8a3868e0c28a2ae357c117c34031e9ac9d041e2cf25b6df0433ae057d2fd1526ac1aef6ebbc38b00b23bcd73fe2fe47da88ee2ad8137cf2dd32afb36161e2c8b16d6f636e901c902ff70f3a4391348fa9efd6bddc19ff13dd01c41f513616f30df926e0dc25567c430c8cd6a74aa174a4ecfda8b74dca39bd6cbf0a4df09fe52e40b141886cd6be752d050c4f3e62ad4b649c4b21f0ffef43c8c394c20b1765fdc0df846c92fed4c89b77b63a1ca223cc40f51ba0aa37a5f5330efceef9a1324c90c31fa5caf1e12b75b8937c409222c1c84f3737e5ea3be383582df295c5db9b7ceeceb4dac6be9c59dc762be42ff094241866e2e07ab8fe5ce2f47627b7c1d5f108c6eb41bf1a8cf93f82c69d1a3e26795a64767b,0x3b21cc872e01e76f58eac7ed,0xd1552cb7966026a2cd371403a958861b,'d291b89c57afca352993b45eb0b4124ba4d94bb02d17b964206e113d896d2ab2','75','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('23','14','R_INDEX','simulated',0x85602068d0c2762e8db4987acb260aa0532320300842736b864cde8ec103dc440b4d6f4e4e9493afdcab11b3d2b90050ed7e3f71335ef21d80604fdbedd96fedd0fd8533b92380f144f0fd021c5feb7f5661305f731137ca769c5257631ceed8ab14475f25700fe9354ccda9f21e9f3dec545a0cc9dd62b6b0b2f3ab9a3885a5995527a42652ab59b1c7b350004685dde90c3de9deb87468d2452912449af8100bfc85521d03b06e9eecf87e6aed106a8236476cfb49ace65912be6f202af1464ec24a6032ea21e28cea5b44ca7ed49297646765d6bbd2d322defc3de6e5da5889a9f58624ebd98a3a9dc5179555eea2832ce1a8c0ab70f99dadb4d7bd5c5c5957650b54e32050a346bdb5452a4a687a3d9002c88cee1ac8becfc4a5b6bd77f1266db0a21331f13587f7359ff5766f98540b13d7381f82b4558e710b8094d3786fd6f0cf890509606b879f61a783c9db4144ce3ab06f23649dbbedcf4acd887e9b126ab84cec710a5776eef0bf169674f07b3bce990ca025e1eadbc30bdf3a938f949a521223fbe7914d9fa3ae4fbe71628c8c358e72dcfe7b72858b9c02b523ecfaa209dfd420627f9e2b60264b9bb3bf37ad0777d48d017d5816d5850f8e54a212b644bdfe001597cd0e22e0df00aa45aaaa0d74ac9f17c339ae2818980b4a72e2fda60c09fb9a6b4b9e469ceb6c7d95b47f821037bc053a,0x14dccc5103567ba8ee34f7c4,0xa526467498beafd17aa4f1cf6163b033,'eeb069c19838d77f17900df01cd93c52a6d8fd6f6d210753a6e462acaa556831','96','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('24','14','L_INDEX','simulated',0xbc8a9644fbea7bca50e276694d5b2a79e87b59c181b293778041782c5abe6be91ba47121cc625270fb62a2819a42559f5ed56d44c03511e5ce0582e3cbba13a9d24a62befad48d55da6ae59bed110ddf0dec50afb87ebe2990874b4080105712661cefbbba46855aad1e20d7b07c85dda548622094e781217c30468e3ad90f294c71c34e78abd689bb75fdd451e76ff83461b90123aadda176db9f8228637f8ca19d87cdedb2b2d342aed5f7aa1352eb56ea9f7105e8a2f78b564c561b793a372c3c1d540fd76541838c9ab050836011475b7f064f91783e7b226fd490506d6e8fc8e24a7a73b1544b8d01e7b857d57ed28fd6d3353e4d1f14e2e6244f32f0962b4f7c419dbe079705af1b7a8eb00741dd18bf305732834fde9d515f62ba72d2d4fc2f147b37cc4100222a13f9825a9e8310832240c8acf1417dd94be5fbd4da9323edbed676df689d087753b848f1c7743e5bba73ff972c928ef99286eac93fd26e11f634d6589a396a0fbe2ee0c3526af6c9578d203563761e0b072be313564849570eeb00e548b3811dd0d017006c1b51f3c818eb99c6cfaae5f9967ddb02ef69356ebc9934cc4a1241367aac9cf76dba4c2613c74506238033db40f8a635802903c839d6652f37fd2b3ea1d258a510246a8b1b362cac379f0d24f6e851e9cc3c40c09f67e9811dc394642fb69e6356535d265ce2bf6c,0x80072783e7cd16fad2f02047,0x162a5183172674cf01e41e62d665b064,'81d74ae0866c2571d3b7ba7e933956272d2fff1f02e38e5af753dbd0fc7edac9','87','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('25','17','R_INDEX','simulated',0x3a8845d31c65d50c48f752434fd14c2e756cda7d614a2f0da93c71075753adeb635694899c8f1d22a039b5ff86a971fb0505ead7f01dc5813018526a7e4f4fc0c8d4f5f0728bcad205aafd2595cab83ac403a3f85e4d3192c8e30e8e36b4dac80fce88008a2f0a567b05fe1cfb3177cd8a611ec5bb02806030bfed9a3f67afbfe9e7fe39ec0f8a56caa8cb1bb01f15d5a73b0c28f5eb60234e1ed7740a45cf9c7474cc46073477183d8c700d4c6be57eae2a908184ce173a7c4cbf8d4d873bfe0fbb226a3ecdd1d113c3f0232216cb5b6aaf3cfc6b8f7414614d67b5f0a0e1bd583ed3b5f31584c03cce945d27153f6438b5fafb1c2dfaa38747cb6c4737aa96218ba4a29e97112add9bff2268e627077f4bdbd96ca0f59b3ba57a77afd50dbfe70866b82315b82590ca822d194c813a9fb9b91f6944f33a0f56daf3172387e35ea713b61451e7760916075205cec8836240a8a31e61232c6668cf4cfeb2ce8f6cbd7debfda56263c81a3daec4c44f1be4f48ad8d8cbb3d89783bb44fc97af2fdddd5dd249a0e6f3606407e3d52972202b124acc90f770452faf7096080c0d5d25c870b8bc5e25db8ace20deab5aac0397d3f2058277e2e674995a87cc849b295578b823683d56fb4af3791fab5623a5a56d99b8b9394fc9ad166d3690a3440ffd9c0bdb9c96fbc8d8692b8a9b70b27a969a952552,0x2201c98ca6abda08bf83b9e3,0x4ae0967dc826580f8bf1547ffa3a6f9a,'67ad657d53e7a321ae36cd06412c6864d188fcee70917e0c8919c62702e1477e','66','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('26','17','L_INDEX','simulated',0xc0649228169c355a73e41014bbde9e4d91ee9b8a6b3025725e79df18c985bc316756b04ee4888e72cb7a7af212b334bf6783b4303eec3a69d850e9cd4d918197e8ed60076bfc5ebc8204268acf83dae05b772e6271c721fa2bb1e958307ea05189bfc4164a7c6334f3017e4aba675382448325beb6b9d975d5de66ed8d3159927ce2213c7d5eefc5ba456aebd63562d88203240b5975fad91955c5e375a825a2304782176a206371d45d8269250a25bb206c171d3b13a1e2052aca7956e8829b127780301a898538a068d1d6daabfba9f754e355e05e641a3a2b64bd6670b28d1769322f0e20372ff8016ebe3179068d06ddd99ca329c423536556cf67e7389a04cf3b36edc0da7c98b2b6c53c3b3b57be9510c4967aa4967898226577b1fae329e8c09a46159c674a2376d1b97fd4eca6079400bbb2e724d87ea951df51bc1317f360c726010cf5fa415513be1930dc7bcbb22758ff4b28b8b0ad5daa861761259fd3f9fa73516c243f249a92701fcd3a8a6475de6c9415dcd2aaee78103da4fb89aa2a5212ea0f3caef7f8a28f43c17862ceaeb0c9b2d8b71b1866f749f03ddb89dc928a9081c147cb8cfe0070021b26a49039fb0b9ebb0f1b9872f80418f8c606facf905892e35235fb2cc9ba258e5ddc0d25740c96e752ceea20455a15e307999b1b90ad18d8884850b7a43ff8fc9e5c447fa4018fe7ad,0x6b074970a5592fa9fa06c3f0,0x64a073c143184b44fc0c07be0e2fada4,'613bf73c0d7a47e8046146446bb873489a7ca04dc239e927b7db85e0a758b1aa','62','1','2026-11-12 14:14:38');
INSERT INTO `biometric_templates` VALUES ('27','18','R_INDEX','simulated',0xfb661776d633bd6add28462127a608682da2c86b42d352b236911a09057ff340c9328ddbbfb3fb91b72777fb3585360ec71bd8a237976f02238b995c9fc2aa68fbe7d73e6843191ceb22e3ff0cb1da9f35ecad60500598a0b1af74ee37d91bf894b7dcdacd2e48b3c641aee49b0e95b5338f87519f9b446f76c149c50eb1bc2d9e49d78ea1aa9be909d2bf9726275ba65c488941414bca372cf192121533e2b4253741b5d2832aed5e5adc4749f5028cfcdc59899045434ca5a05cc92e8d057e5d99a42daeb83f9bf2ddd13554e0cd12bf70ff6820ec891df073de2f12d9784070d9cb5efa7d18494a11202d7be98e857b89ba18e4f44dd7e6d957c35fd0ff1163b0f8c2b34f2b668464b5d8a65b4a0604e618f8bf476a07773d5f70420e6dd5056a14a41c7536cadeb2d4db4f2e00adaac574301e372b0603dbcdb7252e35fa40f974c86edad7aa1ac23de4ba7957c6092d59f967f17e9deff482449d0109b070d1103a757d6c668fc5dcbe9e412ad8c09c41de16bcc4467aa3f68e8e3922e9e9924e659bcbfbf6bd29cca5608e62997040b227beecd11e87dc148f13ac3654374798daa0199e2c847d264bcb04732e0e470c3d70dd1a6d7a9a15436055aeccc75de8dc261356826be203fec55eb50f37ccaa720262fb7f906c21777e3e9a5f985de0085cfe26c631180376c3877aef3aba6f8223312abdcf4a,0x87789cc239582e6d142efd39,0xe84ed9f6fe4cb88f31aa311c2f58be47,'d216dfca9f3ad5828c9adf9efd91dbb2e9bc85270a7eb94ff3b1141785490e9d','85','1','2026-11-12 14:14:39');
INSERT INTO `biometric_templates` VALUES ('28','18','L_INDEX','simulated',0x2fb6fa3f79aedff2c1bc5252484ac7490ac53adcb42c4a33ce45f47010e02b3e1111ce8b2e38247308eb1f7b674859fa3f7ba29cbf6024f12a151573e81c05b640b83c1d2c5a199328efd2a249b621ad0bcd8800ff0a50c6513296b4bdd5ec499461cb38fd3692eb9c13057b13ec08f0ab7ec26ec68bcf7dcfd27281fa1d74bf8d112693162e6fbccc4cb83d03a3e7091bf631ce66e0ad0b77621e865b217925104a45f706bcc47ccafa28c6af7c58e556d6e37022986dd8599f99df288e714f751598c7e6c37b7405e8c3d78b88a9332077cc6e873b7b4db8c30204d4a96dc05b4363ec31c8a28a2c3fe85d191bfe0e2f5ed4beadd1ec68619307e0e2bf2ecefa50ff6a5972d5418eb6a3cea01c0a3b207519479a099217739c24fa5f0a7d2e84faa07a51574527540c39c9295da5815e42e8477fff67ebefbabd2e16372419b6e731f04ace202ba38ada1700b32cea3949cf0cbfd3c1c5e6b305b9c941efae86f4a63158af50492058155ab548c0f07438b7a94ee90bdecd6042c4ec9b6940e0795cd652db02976c9113c262afdf3d40be7ebc0be11e5d0b3c0f00c3322df702a3e47e8c7d8b437a8cfdd709d70151a0819b8bc7a952b87e614317e46e60e1a32cc2b12ab50304e9fb2e6784e73229059a3ef017107534851bd48251c87e7176b984582b917fa2ac9b84072458f3e786c9608aca5a,0xf13517482c2532f47928cbb6,0xac89695fd3ecf7f870f7ebeb49d78d95,'9a7b0be52e3635368d05fcb82e31368f23ea5552128f6e47e5a0d1833e636f7f','75','1','2026-11-12 14:14:39');
INSERT INTO `biometric_templates` VALUES ('29','19','R_INDEX','simulated',0x73a5643e63942a3cd8c84063e2e4ee0dcb07d51a9d76063c6e0c4442c2f2cbc29cd2d3343ece735630caa2b18486f4d647a5d54fd5ee502242d563e48e7501a1318b4a78cee0a2b361e37a9849fe7831f271a36c66d1167367e98c464cc8d2e03b24d86ca34e70ffaa3c62a41179713265fde4c5d38d0c1adf4c389ab9b8d35e9c3768dd85d9e4102d090f9079a2c35a0f2746a2e7f9e1add8f644ebdaf396553ed8d24fd8123d243918eeda1befdce547175d7206fb103fab739f7ec7f49950ef4752fe97d4d3796997aacfaf9178a59e2962473b042fa116e4d19ef251daee25a7dbe3cad5d62184c9c00ca5988917ccd4cc1e84fa409c40e2ced21f8f0396558aae8e2d3fe376c8a1758e86a1e4e689bc4c89846fc5b6a2fdcb38aa2a59f749df776b13f4feb252433c30176cf2875320b63570b75e6fe78f5193240d12a9132723c614480316ee6f059bc98f4ee0cd510964945a1d89f95763ff59560e069d16aecc58e9a5eb75d291d25a681f7831a3996916a45166ff960d2defc7d58d3fe5ad3874656b5399675186df833da1f8f13e7ff03f374fa0e322219c005314b17bd9059bb268d4c5beb0214effd2d7a6113afde05a590d81ea4855228611c7f84ac7ccb3b89601e3880a9786f64e616c8bb6c478d3de751c179238fe0ddbcc39a03ee9d7637e16d866acfe391756e5,0x3833bada904811cd90a3108b,0xbe40dc4c7ebf280c3841e158ae81206e,'c41aec089976fb0fb22b693c9f32f7a967f16af249f10d8aebbd23d49e2fedd5','64','1','2026-11-12 14:14:39');
INSERT INTO `biometric_templates` VALUES ('30','19','L_INDEX','simulated',0xbf1503d79545656d58310508c4cbc143109f00e7a9f29c2f5493bc51e2ded7ff35254ba7d580b05d8b33ad93b3a64347d720ad73c33e1e598f3ff7fbbf0cfcbe678924573a8588935b66dc65e2b595112d6ecc6464865e54fe218905a5af2e2f49fa9e71180bd6748b3705203c2aef6766af34f2dd81bf06a7c2a470ca4ff293d3bcefb489159c6a45b4badbc559c654e752772027d1dfc6b152bb37747e1cb6de9c9c3d682336f69b91cd549544fbb2126159ea06c7e128de5ae5364746a04889ef46beb91c9dbf27a7f7a271f15c2e014bb531bb3cf5f8002635e54b82dac4267a33a1430e91fbb7ecdf0fec161ebb323e98f001a8ccf6f5c34332cac4fea09d8ff030672ef5855413187a666fd8147f7b02a2c9df50420a46c6862ecfff4d865c7ef11a82cc673aab849965ec8f43ad5f8b5705c6254bbf8020b4bb4c96a5f0e633a29c474ec2af87d927c105d8397cad7d6add527bfe19a1cf59b98085831eb8821c568272dfb62a96c6a3417bc2c3fd059d68d59f3993345c8e86870584f38c2abde5b63ec5338461006399669720342f61b139cb08a0f82a024eb6fd5f6f490434d098fa858b7a143eeda8a8c06218f514160162dea6539ed16fd53be9cd4d529f3a4cfb6a18248bc71a378a24ca3d5504adc38cc3f278c11f6f22eb02fcfbfdaac58474fe,0xc57c9bf892e2d3a8e06a6da3,0x05a46e55493e2ef10143447088e632c5,'a5eca6ae94f0abf21db8a0de65b8b9219405385df32cc96a4954339bb602984b','83','1','2026-11-12 14:14:39');
INSERT INTO `biometric_templates` VALUES ('31','20','R_INDEX','simulated',0xbc92cd99cd4738980f9c5ff62e80adbea7cb236e0d4b46b306d60f51c7b7592f2be0612e8e83c25c7814f482e0e279fc09ac17d06af88fe111ca620807ffab0ba035ef9b0112bfb473349d675e2748acce5ccbb4bfc56d1be9b84ec924cf1b7ef56db1bc62cb9db040743eca51ba347ce344038a74bb3c31e81215b089c0a7daea0aeb8dc93f3955b533c7af4659bfb919fed52af9cb7c955f03f83f9e9fcc118ef193c96a165a0231ac735e4852f2c67add0d3c8335d21688dfb3e40a5a0358a144ae1097d22ce3726d24a2efa07f74677f0a363c0bde83d4993a56e307b6b49b5f7ed9179c60a96d29ca64e112d970b2fa5c69e263601d9be559ca50523f596901a1fa47fc01a9ad2c864abbd99c87a2005990efe1d2071edc7bcc84bc2ca6503c0fa34ae4cccff939185525036d012905046972df75250601ce14104791bf8a676e3ea01a5a9e7345394c472a8483d7cb519ca862722b9ae53866ed11ee154d22ed3a13f145ba408b8fa10aa370a37bdc3d3862f9ca5199c236994916fdaf895c4bdd568e5c0d2dbe453960e0272206cca2f359edba3124e0a12db270dc5a0c3d6687d5d1e1d144f4fe3ff78071113b7201cbdbc04eac44762f371eb204d75867d5381d4e6f03c2279149906a3a5d705f4520d9a6fa1937adedd69affa96977a7a232b58fd78ff5a75483e18e6fa4d9,0xe2d00bc3e3a25d2a051cef41,0xf7ba70a4fb0708fae19aca27d8cc37de,'3e8f872fcaca12667058414ce5aeb781b14bd36b7c0f2d9989c78e01a8a5bb6f','69','1','2026-11-12 14:14:39');
INSERT INTO `biometric_templates` VALUES ('32','20','L_INDEX','simulated',0x0184b17405e81cea651851883188e7c8b3b04c883b473bfa396bd650ea3178ee477c22edb3850619c2bca26b768a81c1b9fe28f24aebf1004873f1238bf2aa29a9caae38e2e36016138d2acf2b7de952ce201685b4a4e4f882532073538f1e6fce552fe3885f93730876db5e2cef71f18f4265e1adfe0bff63c17667961405ef72d3b4f03eb73b1269b627d292ddad217cfff19518ea56cd3ae76617a52cf79039d2cd660fbaf6e2edf25c17d16609a43f3328ba7776abd1618f2e0fd3fb1025c06d6d2bcc8acb6c97e43e92585afcdd0ec7468236049e1b8a92e175fe8fde5817a7c167b52c4d6f86b4e9be63e6591ad87125945a1a2a990c7b830dc34a8215c1b758e05c3342996b79a53f4c9a1f8a58d2fe18c5fd3756a8f7d7c80ee6ab4d3341ae149185c4cc3e1bf1a923e383c775deef642416f5153dacf40dfde7b7fac927bd727fc75e6e5a8cca2d06959f47f1bdd995e6439624263747c94380dd3eb667af1eba4b5be6cc7bced74293ff0c7118e10c60be0389f41f67e52819c85f2009468e633d17b28fb7bbc35a0af9de26347b63c0299855ccdf477949fd91881ae5706cadd9ee4f6c143475bdc9f73e7e9bf540f8aafb48ebc3c5010c791ea2b6f7dcfcc4fd10f4cebe3aab2d85e941e059b6a6f7b5f6a0c3e4d2e48572135433c2cc6da1811ed288c3c24fffebd16f3bbaff1d,0x63b826a097e64c51fd8c0e8e,0xd7f948b47052ca483924547b8dd35d0b,'45e8dd53c3f73ea4ae546ea1231f48903c00cab84d62c9f345150da0cbcaffab','62','1','2026-11-12 14:14:39');
INSERT INTO `biometric_templates` VALUES ('33','23','R_INDEX','simulated',0xbd98d4db00dbcffcc4dccb2510782f12c108634ba853b42a599df74a13a15326259d2a6ce5d36370e20e92a4e6190f9b21c50c764c8d8a396579483e3c2a6a472b482351ddfa14370be9ceed040f5c2edfc958b604bdb12c1b6e349a6d9c371e975d7dfe92815ba235ca11758b286093959751d33ac5c2ef3c741d8546ffc7d35d3e20a43df8c2b04c3866b8b2877891a4701948e26b227283ebab0a9bcf420e71cdb8d305c30639f743984e315cfb9d51f413c9cc90799a656b66088164988484af6fc3de91ce0cda4b4875c5c08f15aaaad20c10b4d46ec35e0afc9741d01998f9cd014cad1531e90659ccc16e8fccb7ccf7c361cfee96e510edcee5e0bbe24ce8b97112dcb5f2019be2a10be36c3e2f7717f7ad8d12572caebd455eaad2e5fc4c4e2eb184630ce27387e03c0fc05fbe20de75b79a9ad3698e53fd13282af1cb95a27b63b47db95244f3a7cfc123e0e80e84c7fce378480d13e62744bb27e91d04d10baf01c03453fd3ea51a63ae426627c0870dc38bee962d4f9615c6eb146c632254733990dcbe8b8b0558a71a5ac3eb495e7be16f36100d6ab1caf2d06448e4096f2de9af081ccb87e8a8b599b4e64482d491d78ba05747e29e6cea1715dae6339ffbb82e49dc1133b705fa493c45d4d8941adcd73751b5c3c09f81fd0dffad99f9af3b2947d6c363ba89777ec5c0b539a9f8a6,0xa8afb8420bffc8aff1296ad2,0xbd92d3dee88eaff207e0ad8a59a5a322,'b79a0603d2d88ee8c52d62e242e888c3c1d204ea48b4fdcd7f0e7123da08c56c','69','1','2026-11-12 14:14:44');
INSERT INTO `biometric_templates` VALUES ('34','23','L_INDEX','simulated',0xb6a2b195a8b1fe8d1507b75b07c94e57a95441f96d8a0df99c0f74b39d3da04e17786e0fc8444e469d18aa75ebca150376de3e907d07e62dd82ff1520e312de17968e26f149d068976f8a66a631f8c1cf3ea00eba8e6176238b53b323ea136ee46b3eb48a94591d4fe16ed0692eec91cbb4a41c49257eba9ab46106f87e604c8db0bf758bfe1fe3d52a60c4159296313df355799a253914947d7a5a4591217ad8cc959882f76319fdbfcdf485764e0163cdb5df98421b870c5b01af22a3daea20c9d49fa1580f71e077e95d31b9943c5e40ca60a217bc9af82ef6f7e90d3321dcb409a9a052b172bbb7d260796cf2ab40c3901a0791b32b9788d00df9952dbfc357930881c1c187d77488abe6cabd6217eab18d333c7388f43509e655cb951a22016064a8098277fd03b9480b061497dce9cfd5583ae3bf9bec5487199d834bfe17604afc0a60ca7f806fe4928fc9a7ea617008a4091506da19b86f3bc0d9a4d357b66f860cd20edc13ae14d87df5b198e65867dac62cfbb0c0a2b6dbac9433e7ce7e84a36eced3e29e70f0543e098f8e79336e43e6bb6f5cadba848c0b94995419f29658f5ce83ab7049af520bdcdba48068e6b8d02930b071f637fd3355b84c9356ead35c63016c45a0fb7fccb0933e58e178e1299394532c0297ea7f2fc155a352fcc5b576e7d24f1cd22c49bb19ae1e429,0xe1fd2e039589485a197b361e,0xf532da6e855f396ee04877b59602e982,'92cde606b0a70f473555b8de33259ee9f757186e793072c5a48ebd5a31ccd60f','90','1','2026-11-12 14:14:44');
INSERT INTO `biometric_templates` VALUES ('35','24','R_INDEX','simulated',0x39a3af778286495d34263400759e27768245ee99ac11453fde7fbe9f34d0fd68962ec10407f0a330a233d7dd91b78f08bd4ebc586578e7bf13e606ef6e5c182752f5335bab88973dfdb6b8ce30599e91dd88d99c046419682002fb5d28c1437b2283c0488094b7281a0f24f03ffe1fd8aed2c946a27a54988e0c0184fbdb3116d50abda23d51a71713efa82a4795fd181b7d2fab8f248fbec6c746a37a40ecb6b03213068c91a8fa8a27f7bf34d1c775c2aaecbacfe8add6fba11cfc1586a39fcb9490c83a468fb23474b99005ac0193d819c9c08ca93022e565db30931b70b8599cbf8263642b76c16bf9440d5ff4d961da16f927ef868121d84bfddb65749d940f53ff163e65edcfa98b32f255ac6e1cee7c902f77ea7ce911e3cd787f2bebd560cfe94688032bb305b8bf0e4f90f256603b0699aca0b3153fae9fd08ff7d950c3b91cc4aebd9d816796ab837ce845d2d367ed2f777cb665cc5e8ad43a745a5132805fef39b7a4320809d02e5ef131a491180e2a72d9c9b1c3528b7fdcbd6553c9ef03aa7fa3aef5a61a50a24b117bb881030ad2b1125a5d4d50cd83912c483fb1e2963a4b6888613974b65f5e7fe8fc9caeb4c7a8e6cc28e8e993d8426c50fb99a2e468ae2028e85c3aba11b914633ffb26a0ab47fd6b613e692969c16e5e0abce5b774381e517dbbbef170716085d29adf,0x180f03c95d030b8c7ff32a07,0xe926d27d0908fc7e48c1bbca9536aab0,'f9bbc163fe2025e9561ceedc3c8c9a29c5d806b6e72748b4101bd619461686a7','96','1','2026-11-12 14:14:44');

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

INSERT INTO `class_sessions` VALUES ('1','1','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 1','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('2','1','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 2','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('3','1','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 3','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('4','1','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 4','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('5','1','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 5','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('6','1','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 6','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('7','1','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 7','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('8','2','2026-10-20','11:00:00','13:00:00','Lab 1','Lesson 8','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('9','2','2026-10-22','11:00:00','13:00:00','Lab 1','Lesson 9','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('10','2','2026-10-27','11:00:00','13:00:00','Lab 1','Lesson 10','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('11','2','2026-10-29','11:00:00','13:00:00','Lab 1','Lesson 11','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('12','2','2026-11-03','11:00:00','13:00:00','Lab 1','Lesson 12','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('13','2','2026-11-05','11:00:00','13:00:00','Lab 1','Lesson 13','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('14','2','2026-11-10','11:00:00','13:00:00','Lab 1','Lesson 14','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('15','3','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 15','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('16','3','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 16','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('17','3','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 17','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('18','3','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 18','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('19','3','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 19','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('20','3','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 20','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('21','3','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 21','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('22','4','2026-10-19','08:00:00','10:00:00','Lab 2','Lesson 22','closed','2026-10-19 08:00:00','2026-10-19 10:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('23','4','2026-10-21','08:00:00','10:00:00','Lab 2','Lesson 23','closed','2026-10-21 08:00:00','2026-10-21 10:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('24','4','2026-10-26','08:00:00','10:00:00','Lab 2','Lesson 24','closed','2026-10-26 08:00:00','2026-10-26 10:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('25','4','2026-10-28','08:00:00','10:00:00','Lab 2','Lesson 25','closed','2026-10-28 08:00:00','2026-10-28 10:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('26','4','2026-11-02','08:00:00','10:00:00','Lab 2','Lesson 26','closed','2026-11-02 08:00:00','2026-11-02 10:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('27','4','2026-11-04','08:00:00','10:00:00','Lab 2','Lesson 27','closed','2026-11-04 08:00:00','2026-11-04 10:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('28','4','2026-11-09','08:00:00','10:00:00','Lab 2','Lesson 28','closed','2026-11-09 08:00:00','2026-11-09 10:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('29','4','2026-11-11','08:00:00','10:00:00','Lab 2','Lesson 29','closed','2026-11-11 08:00:00','2026-11-11 10:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('30','5','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 30','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('31','5','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 31','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('32','5','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 32','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('33','5','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 33','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('34','5','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 34','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('35','5','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 35','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('36','5','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 36','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('37','6','2026-10-20','11:00:00','13:00:00','Lab 1','Lesson 37','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('38','6','2026-10-22','11:00:00','13:00:00','Lab 1','Lesson 38','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('39','6','2026-10-27','11:00:00','13:00:00','Lab 1','Lesson 39','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('40','6','2026-10-29','11:00:00','13:00:00','Lab 1','Lesson 40','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('41','6','2026-11-03','11:00:00','13:00:00','Lab 1','Lesson 41','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('42','6','2026-11-05','11:00:00','13:00:00','Lab 1','Lesson 42','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('43','6','2026-11-10','11:00:00','13:00:00','Lab 1','Lesson 43','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('44','7','2026-10-20','11:00:00','13:00:00','Lab 3','Lesson 44','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','4','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('45','7','2026-10-22','11:00:00','13:00:00','Lab 3','Lesson 45','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','4','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('46','7','2026-10-27','11:00:00','13:00:00','Lab 3','Lesson 46','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','4','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('47','7','2026-10-29','11:00:00','13:00:00','Lab 3','Lesson 47','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','4','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('48','7','2026-11-03','11:00:00','13:00:00','Lab 3','Lesson 48','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','4','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('49','7','2026-11-05','11:00:00','13:00:00','Lab 3','Lesson 49','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','4','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('50','7','2026-11-10','11:00:00','13:00:00','Lab 3','Lesson 50','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','4','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('51','8','2026-10-20','11:00:00','13:00:00','Lab 1','Lesson 51','closed','2026-10-20 11:00:00','2026-10-20 13:00:00','4','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('52','8','2026-10-22','11:00:00','13:00:00','Lab 1','Lesson 52','closed','2026-10-22 11:00:00','2026-10-22 13:00:00','4','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('53','8','2026-10-27','11:00:00','13:00:00','Lab 1','Lesson 53','closed','2026-10-27 11:00:00','2026-10-27 13:00:00','4','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('54','8','2026-10-29','11:00:00','13:00:00','Lab 1','Lesson 54','closed','2026-10-29 11:00:00','2026-10-29 13:00:00','4','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('55','8','2026-11-03','11:00:00','13:00:00','Lab 1','Lesson 55','closed','2026-11-03 11:00:00','2026-11-03 13:00:00','4','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('56','8','2026-11-05','11:00:00','13:00:00','Lab 1','Lesson 56','closed','2026-11-05 11:00:00','2026-11-05 13:00:00','4','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('57','8','2026-11-10','11:00:00','13:00:00','Lab 1','Lesson 57','closed','2026-11-10 11:00:00','2026-11-10 13:00:00','4','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('58','2','2026-11-12','08:00:00','17:00:00','Lab 2','Demo session for today','scheduled',NULL,NULL,'2','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('59','3','2026-11-12','09:00:00','17:30:00','Lab 2','Demo session for today','scheduled',NULL,NULL,'3','2026-11-12 14:14:39');
INSERT INTO `class_sessions` VALUES ('60','9','2026-11-12','00:00:00','23:59:00','Workshop','Test session','closed','2026-11-12 14:14:45','2026-11-12 14:14:45','31','2026-11-12 14:14:45');

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

INSERT INTO `classes` VALUES ('1','1','DIT-2025-SEP','Diploma IT – September 2025 intake','2025','2026-11-12 14:14:38');
INSERT INTO `classes` VALUES ('2','2','CIT-2026-JAN','Certificate IT – January 2026 intake','2026','2026-11-12 14:14:38');
INSERT INTO `classes` VALUES ('3','3','DBM-2025-SEP','Diploma Business Mgt – September 2025 intake','2025','2026-11-12 14:14:38');
INSERT INTO `classes` VALUES ('4','4','DEE-2026-JAN','DEE Jan 2026','2026','2026-11-12 14:14:42');

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

INSERT INTO `courses` VALUES ('1','1','DIT','Diploma in Information Technology','Diploma','2026-11-12 14:14:38');
INSERT INTO `courses` VALUES ('2','1','CIT','Certificate in Information Technology','Certificate','2026-11-12 14:14:38');
INSERT INTO `courses` VALUES ('3','2','DBM','Diploma in Business Management','Diploma','2026-11-12 14:14:38');
INSERT INTO `courses` VALUES ('4','3','DEE','Diploma in Electrical Engineering','Diploma','2026-11-12 14:14:42');

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

INSERT INTO `departments` VALUES ('1','ICT','Information and Communication Technology','2026-11-12 14:14:38');
INSERT INTO `departments` VALUES ('2','BUS','Business Studies','2026-11-12 14:14:38');
INSERT INTO `departments` VALUES ('3','ENG','Engineering','2026-11-12 14:14:42');
INSERT INTO `departments` VALUES ('5','XSS','<script>alert(1)</script>','2026-11-12 14:14:42');

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

INSERT INTO `enrollments` VALUES ('1','1','1','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('2','2','1','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('3','3','1','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('4','4','1','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('5','5','1','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('6','6','1','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('7','7','1','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('8','8','1','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('9','9','1','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('10','10','1','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('11','1','2','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('12','2','2','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('13','3','2','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('14','4','2','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('15','5','2','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('16','6','2','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('17','7','2','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('18','8','2','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('19','9','2','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('20','10','2','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('21','1','3','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('22','2','3','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('23','3','3','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('24','4','3','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('25','5','3','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('26','6','3','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('27','7','3','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('28','8','3','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('29','9','3','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('30','10','3','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('31','1','4','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('32','2','4','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('33','3','4','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('34','4','4','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('35','5','4','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('36','6','4','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('37','7','4','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('38','8','4','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('39','9','4','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('40','10','4','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('41','11','5','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('42','12','5','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('43','13','5','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('44','14','5','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('45','15','5','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('46','16','5','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('47','11','6','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('48','12','6','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('49','13','6','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('50','14','6','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('51','15','6','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('52','16','6','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('53','17','7','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('54','18','7','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('55','19','7','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('56','20','7','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('57','21','7','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('58','22','7','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('59','17','8','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('60','18','8','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('61','19','8','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('62','20','8','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('63','21','8','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('64','22','8','2026-11-12 14:14:38');
INSERT INTO `enrollments` VALUES ('65','23','9','2026-11-12 14:14:44');
INSERT INTO `enrollments` VALUES ('66','24','9','2026-11-12 14:14:44');
INSERT INTO `enrollments` VALUES ('67','25','9','2026-11-12 14:14:44');

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

INSERT INTO `lecturers` VALUES ('1','2','LEC001','1','Female','2026-11-12 14:14:38');
INSERT INTO `lecturers` VALUES ('2','3','LEC002','1','Male','2026-11-12 14:14:38');
INSERT INTO `lecturers` VALUES ('3','4','LEC003','2','Female','2026-11-12 14:14:38');
INSERT INTO `lecturers` VALUES ('4','31','LEC900','3','Male','2026-11-12 14:14:44');

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

INSERT INTO `notifications` VALUES ('1','11','warning','Low attendance: DIT101','Your attendance in DIT101 Computer Applications is 28.6% (2 of 7 sessions). The minimum required is 75%.','0','2026-11-12 14:14:39');
INSERT INTO `notifications` VALUES ('2','9','warning','Low attendance: DIT101','Your attendance in DIT101 Computer Applications is 42.9% (3 of 7 sessions). The minimum required is 75%.','0','2026-11-12 14:14:39');
INSERT INTO `notifications` VALUES ('3','13','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 14:14:39');
INSERT INTO `notifications` VALUES ('4','11','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 57.1% (4 of 7 sessions). The minimum required is 75%.','0','2026-11-12 14:14:39');
INSERT INTO `notifications` VALUES ('5','10','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 14:14:39');
INSERT INTO `notifications` VALUES ('6','9','warning','Low attendance: DIT102','Your attendance in DIT102 Web Design and Development is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 14:14:39');
INSERT INTO `notifications` VALUES ('7','14','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 14:14:39');
INSERT INTO `notifications` VALUES ('8','11','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 57.1% (4 of 7 sessions). The minimum required is 75%.','0','2026-11-12 14:14:39');
INSERT INTO `notifications` VALUES ('9','10','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 14:14:39');
INSERT INTO `notifications` VALUES ('10','9','warning','Low attendance: DIT103','Your attendance in DIT103 Database Systems is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 14:14:39');
INSERT INTO `notifications` VALUES ('11','11','warning','Low attendance: DIT104','Your attendance in DIT104 Programming in Java is 50.0% (4 of 8 sessions). The minimum required is 75%.','0','2026-11-12 14:14:39');
INSERT INTO `notifications` VALUES ('12','19','warning','Low attendance: CIT101','Your attendance in CIT101 Computer Fundamentals is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 14:14:39');
INSERT INTO `notifications` VALUES ('13','19','warning','Low attendance: CIT102','Your attendance in CIT102 Networking Basics is 14.3% (1 of 7 sessions). The minimum required is 75%.','0','2026-11-12 14:14:39');
INSERT INTO `notifications` VALUES ('14','17','warning','Low attendance: CIT102','Your attendance in CIT102 Networking Basics is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 14:14:39');
INSERT INTO `notifications` VALUES ('15','16','warning','Low attendance: CIT102','Your attendance in CIT102 Networking Basics is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 14:14:39');
INSERT INTO `notifications` VALUES ('16','25','warning','Low attendance: DBM101','Your attendance in DBM101 Principles of Management is 42.9% (3 of 7 sessions). The minimum required is 75%.','0','2026-11-12 14:14:39');
INSERT INTO `notifications` VALUES ('17','22','warning','Low attendance: DBM101','Your attendance in DBM101 Principles of Management is 71.4% (5 of 7 sessions). The minimum required is 75%.','0','2026-11-12 14:14:39');
INSERT INTO `notifications` VALUES ('18','29','warning','Low attendance: DEE101','Your attendance in DEE101 Electrical Principles is 0.0% (0 of 1 sessions). The minimum required is 75%.','0','2026-11-12 14:14:45');
INSERT INTO `notifications` VALUES ('19','27','info','Welcome','Welcome to DEE101','0','2026-11-12 14:14:46');
INSERT INTO `notifications` VALUES ('20','29','info','Welcome','Welcome to DEE101','0','2026-11-12 14:14:46');
INSERT INTO `notifications` VALUES ('21','30','info','Welcome','Welcome to DEE101','0','2026-11-12 14:14:46');

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `setting_key` varchar(50) NOT NULL,
  `setting_value` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `settings` VALUES ('biometric_driver','simulated','2026-11-12 14:14:38');
INSERT INTO `settings` VALUES ('bridge_url','http://127.0.0.1:8765','2026-11-12 14:14:38');
INSERT INTO `settings` VALUES ('consent_version','1.0','2026-11-12 14:14:38');
INSERT INTO `settings` VALUES ('institution_name','Demo Technical Training Institute','2026-11-12 14:14:38');
INSERT INTO `settings` VALUES ('late_grace_minutes','15','2026-11-12 14:14:46');
INSERT INTO `settings` VALUES ('match_threshold','80','2026-11-12 14:14:38');
INSERT INTO `settings` VALUES ('min_attendance_percent','75','2026-11-12 14:14:46');
INSERT INTO `settings` VALUES ('min_quality','50','2026-11-12 14:14:38');

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

INSERT INTO `students` VALUES ('1','5','DIT/001/2025','1','Male',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('2','6','DIT/002/2025','1','Female',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('3','7','DIT/003/2025','1','Male',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('4','8','DIT/004/2025','1','Female',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('5','9','DIT/005/2025','1','Male',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('6','10','DIT/006/2025','1','Female',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('7','11','DIT/007/2025','1','Male',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('8','12','DIT/008/2025','1','Female',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('9','13','DIT/009/2025','1','Male',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('10','14','DIT/010/2025','1','Female',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('11','15','CIT/001/2026','2','Male',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('12','16','CIT/002/2026','2','Female',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('13','17','CIT/003/2026','2','Male',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('14','18','CIT/004/2026','2','Female',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('15','19','CIT/005/2026','2','Male',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('16','20','CIT/006/2026','2','Female',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('17','21','DBM/001/2025','3','Male',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('18','22','DBM/002/2025','3','Female',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('19','23','DBM/003/2025','3','Male',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('20','24','DBM/004/2025','3','Female',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('21','25','DBM/005/2025','3','Male',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('22','26','DBM/006/2025','3','Female',NULL,'active','2026-11-12 14:14:38');
INSERT INTO `students` VALUES ('23','27','DEE/001/2026','4','Female',NULL,'active','2026-11-12 14:14:43');
INSERT INTO `students` VALUES ('24','29','DEE/002/2026','4','Male',NULL,'active','2026-11-12 14:14:44');
INSERT INTO `students` VALUES ('25','30','DEE/003/2026','4','Female',NULL,'active','2026-11-12 14:14:44');

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

INSERT INTO `unit_assignments` VALUES ('1','1','1','1','2026/2027','1','2026-11-12 14:14:38');
INSERT INTO `unit_assignments` VALUES ('2','2','1','1','2026/2027','1','2026-11-12 14:14:38');
INSERT INTO `unit_assignments` VALUES ('3','3','1','2','2026/2027','1','2026-11-12 14:14:38');
INSERT INTO `unit_assignments` VALUES ('4','4','1','2','2026/2027','1','2026-11-12 14:14:38');
INSERT INTO `unit_assignments` VALUES ('5','5','2','2','2026/2027','1','2026-11-12 14:14:38');
INSERT INTO `unit_assignments` VALUES ('6','6','2','1','2026/2027','1','2026-11-12 14:14:38');
INSERT INTO `unit_assignments` VALUES ('7','7','3','3','2026/2027','1','2026-11-12 14:14:38');
INSERT INTO `unit_assignments` VALUES ('8','8','3','3','2026/2027','1','2026-11-12 14:14:38');
INSERT INTO `unit_assignments` VALUES ('9','9','4','4','2026/2027','1','2026-11-12 14:14:44');

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

INSERT INTO `units` VALUES ('1','1','DIT101','Computer Applications','2026-11-12 14:14:38');
INSERT INTO `units` VALUES ('2','1','DIT102','Web Design and Development','2026-11-12 14:14:38');
INSERT INTO `units` VALUES ('3','1','DIT103','Database Systems','2026-11-12 14:14:38');
INSERT INTO `units` VALUES ('4','1','DIT104','Programming in Java','2026-11-12 14:14:38');
INSERT INTO `units` VALUES ('5','2','CIT101','Computer Fundamentals','2026-11-12 14:14:38');
INSERT INTO `units` VALUES ('6','2','CIT102','Networking Basics','2026-11-12 14:14:38');
INSERT INTO `units` VALUES ('7','3','DBM101','Principles of Management','2026-11-12 14:14:38');
INSERT INTO `units` VALUES ('8','3','DBM102','Business Communication','2026-11-12 14:14:38');
INSERT INTO `units` VALUES ('9','4','DEE101','Electrical Principles','2026-11-12 14:14:42');

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

INSERT INTO `users` VALUES ('1','admin','admin','admin@example.ac.ke',NULL,'System Administrator','$2y$10$MbaS9BWxas0lPAexWkxkBObdrBBX76jnpiiA97bE28luTrhEY9JNG','1','0','1',NULL,'2026-11-12 14:14:40','2026-11-12 14:14:38','2026-11-12 14:14:40');
INSERT INTO `users` VALUES ('2','lecturer','LEC001','lec001@example.ac.ke','0700000010','Grace Wanjiru','$2y$10$xymFOqSXl9EyLDI5d.3iYuXFQBxRPe4ZxbNc1eGfY9K1uqUAcE0/i','1','0','0',NULL,'2026-11-12 14:14:42','2026-11-12 14:14:38','2026-11-12 14:14:42');
INSERT INTO `users` VALUES ('3','lecturer','LEC002','lec002@example.ac.ke','0700000011','Peter Otieno','$2y$10$xymFOqSXl9EyLDI5d.3iYuXFQBxRPe4ZxbNc1eGfY9K1uqUAcE0/i','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('4','lecturer','LEC003','lec003@example.ac.ke','0700000012','Mary Achieng','$2y$10$xymFOqSXl9EyLDI5d.3iYuXFQBxRPe4ZxbNc1eGfY9K1uqUAcE0/i','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:41');
INSERT INTO `users` VALUES ('5','student','DIT/001/2025','brian.kamau@student.example.ac.ke','0711100000','Brian Kamau','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,'2026-11-12 14:14:42','2026-11-12 14:14:38','2026-11-12 14:14:42');
INSERT INTO `users` VALUES ('6','student','DIT/002/2025','faith.njeri@student.example.ac.ke','0711100001','Faith Njeri','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('7','student','DIT/003/2025','kevin.mutua@student.example.ac.ke','0711100002','Kevin Mutua','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('8','student','DIT/004/2025','mercy.chebet@student.example.ac.ke','0711100003','Mercy Chebet','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('9','student','DIT/005/2025','dennis.omondi@student.example.ac.ke','0711100004','Dennis Omondi','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('10','student','DIT/006/2025','joy.wambui@student.example.ac.ke','0711100005','Joy Wambui','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('11','student','DIT/007/2025','collins.kiprop@student.example.ac.ke','0711100006','Collins Kiprop','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('12','student','DIT/008/2025','sharon.atieno@student.example.ac.ke','0711100007','Sharon Atieno','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('13','student','DIT/009/2025','victor.mwangi@student.example.ac.ke','0711100008','Victor Mwangi','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('14','student','DIT/010/2025','esther.jepkosgei@student.example.ac.ke','0711100009','Esther Jepkosgei','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('15','student','CIT/001/2026','ian.barasa@student.example.ac.ke','0711100010','Ian Barasa','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('16','student','CIT/002/2026','diana.nyambura@student.example.ac.ke','0711100011','Diana Nyambura','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('17','student','CIT/003/2026','moses.kibet@student.example.ac.ke','0711100012','Moses Kibet','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('18','student','CIT/004/2026','ruth.akinyi@student.example.ac.ke','0711100013','Ruth Akinyi','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('19','student','CIT/005/2026','allan.mutiso@student.example.ac.ke','0711100014','Allan Mutiso','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('20','student','CIT/006/2026','naomi.wairimu@student.example.ac.ke','0711100015','Naomi Wairimu','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('21','student','DBM/001/2025','felix.ochieng@student.example.ac.ke','0711100016','Felix Ochieng','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('22','student','DBM/002/2025','purity.jeptoo@student.example.ac.ke','0711100017','Purity Jeptoo','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('23','student','DBM/003/2025','samuel.karanja@student.example.ac.ke','0711100018','Samuel Karanja','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('24','student','DBM/004/2025','linet.auma@student.example.ac.ke','0711100019','Linet Auma','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('25','student','DBM/005/2025','eric.rotich@student.example.ac.ke','0711100020','Eric Rotich','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('26','student','DBM/006/2025','agnes.moraa@student.example.ac.ke','0711100021','Agnes Moraa','$2y$10$v5HRhz3AdDxdh7v51Fp3U.ZRVnyeW6heR9BbCsGrJFwI8c9KAj.qm','1','0','0',NULL,NULL,'2026-11-12 14:14:38','2026-11-12 14:14:38');
INSERT INTO `users` VALUES ('27','student','DEE/001/2026','tso@example.com','0712000001','Test Student One','$2y$10$WPoMajlcO6qNKApkYPSbZumj/zT/EYRoAaMR3BQ1ev5TQO0cRXkZe','1','0','0',NULL,'2026-11-12 14:14:43','2026-11-12 14:14:43','2026-11-12 14:14:43');
INSERT INTO `users` VALUES ('29','student','DEE/002/2026',NULL,'0712000002','Csv Student Two','$2y$10$4R5WTAx5WStrxeggBJuzHOckuZQHHPbgro5CnGJFQQVLKr7pvQW1m','1','1','0',NULL,NULL,'2026-11-12 14:14:44','2026-11-12 14:14:44');
INSERT INTO `users` VALUES ('30','student','DEE/003/2026',NULL,NULL,'Csv Student Three','$2y$10$r7MPOpxJ1tm5XsVHEhXAieCYdB7K2SXRp.3kLAXPiqJP6jMYgGlt.','1','1','0',NULL,NULL,'2026-11-12 14:14:44','2026-11-12 14:14:44');
INSERT INTO `users` VALUES ('31','lecturer','LEC900','lec900@example.com','0712000900','Test Lecturer','$2y$10$Tyty.rcZyeyeHPUr60uiCuOP3HMmCu84IJk8dSHecYFVLrRrMUtpK','1','0','0',NULL,'2026-11-12 14:14:45','2026-11-12 14:14:44','2026-11-12 14:14:45');

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
