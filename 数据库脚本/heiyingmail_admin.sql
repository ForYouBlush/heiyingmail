/*
SQLyog ��ҵ�� - MySQL GUI v8.14 
MySQL - 5.7.36 : Database - heiyingmail_admin
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`heiyingmail_admin` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `heiyingmail_admin`;

/*Table structure for table `QRTZ_BLOB_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;

CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_BLOB_TRIGGERS` */

/*Table structure for table `QRTZ_CALENDARS` */

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;

CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_CALENDARS` */

/*Table structure for table `QRTZ_CRON_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;

CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_CRON_TRIGGERS` */

insert  into `QRTZ_CRON_TRIGGERS`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`CRON_EXPRESSION`,`TIME_ZONE_ID`) values ('RenrenScheduler','TASK_1','DEFAULT','0 0/30 * * * ?','Asia/Shanghai');

/*Table structure for table `QRTZ_FIRED_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;

CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_FIRED_TRIGGERS` */

/*Table structure for table `QRTZ_JOB_DETAILS` */

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;

CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_JOB_DETAILS` */

insert  into `QRTZ_JOB_DETAILS`(`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`JOB_CLASS_NAME`,`IS_DURABLE`,`IS_NONCONCURRENT`,`IS_UPDATE_DATA`,`REQUESTS_RECOVERY`,`JOB_DATA`) values ('RenrenScheduler','TASK_1','DEFAULT',NULL,'io.renren.modules.job.utils.ScheduleJob','0','0','0','0','?\0sr\0org.quartz.JobDataMap???��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap?��?(\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap��(v\n?\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap??`��\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.DatehjAKYt\0\0xpw\0\0|??xt\00 0/30 * * * ?sr\0java.lang.Long;?��??\0J\0valuexr\0java.lang.Number????\0\0xp\0\0\0\0\0\0\0t\0renrent\0��������sr\0java.lang.Integer???\0I\0valuexq\0~\0\0\0\0\0x\0');

/*Table structure for table `QRTZ_LOCKS` */

DROP TABLE IF EXISTS `QRTZ_LOCKS`;

CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_LOCKS` */

insert  into `QRTZ_LOCKS`(`SCHED_NAME`,`LOCK_NAME`) values ('RenrenScheduler','STATE_ACCESS'),('RenrenScheduler','TRIGGER_ACCESS');

/*Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS` */

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;

CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_PAUSED_TRIGGER_GRPS` */

/*Table structure for table `QRTZ_SCHEDULER_STATE` */

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;

CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_SCHEDULER_STATE` */

insert  into `QRTZ_SCHEDULER_STATE`(`SCHED_NAME`,`INSTANCE_NAME`,`LAST_CHECKIN_TIME`,`CHECKIN_INTERVAL`) values ('RenrenScheduler','��ӰӴ1635333861686',1635338740393,15000);

/*Table structure for table `QRTZ_SIMPLE_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;

CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_SIMPLE_TRIGGERS` */

/*Table structure for table `QRTZ_SIMPROP_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;

CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_SIMPROP_TRIGGERS` */

/*Table structure for table `QRTZ_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;

CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `QRTZ_TRIGGERS` */

insert  into `QRTZ_TRIGGERS`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`NEXT_FIRE_TIME`,`PREV_FIRE_TIME`,`PRIORITY`,`TRIGGER_STATE`,`TRIGGER_TYPE`,`START_TIME`,`END_TIME`,`CALENDAR_NAME`,`MISFIRE_INSTR`,`JOB_DATA`) values ('RenrenScheduler','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1635339600000,1635337800000,5,'WAITING','CRON',1635151102000,0,NULL,2,'?\0sr\0org.quartz.JobDataMap???��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap?��?(\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap��(v\n?\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap??`��\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.DatehjAKYt\0\0xpw\0\0|??xt\00 0/30 * * * ?sr\0java.lang.Long;?��??\0J\0valuexr\0java.lang.Number????\0\0xp\0\0\0\0\0\0\0t\0renrent\0��������sr\0java.lang.Integer???\0I\0valuexq\0~\0\0\0\0\0x\0');

/*Table structure for table `schedule_job` */

DROP TABLE IF EXISTS `schedule_job`;

CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean����',
  `params` varchar(2000) DEFAULT NULL COMMENT '����',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron���ʽ',
  `status` tinyint(4) DEFAULT NULL COMMENT '����״̬  0������  1����ͣ',
  `remark` varchar(255) DEFAULT NULL COMMENT '��ע',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='��ʱ����';

/*Data for the table `schedule_job` */

insert  into `schedule_job`(`job_id`,`bean_name`,`params`,`cron_expression`,`status`,`remark`,`create_time`) values (1,'testTask','renren','0 0/30 * * * ?',0,'��������','2021-10-25 07:45:19');

/*Table structure for table `schedule_job_log` */

DROP TABLE IF EXISTS `schedule_job_log`;

CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '������־id',
  `job_id` bigint(20) NOT NULL COMMENT '����id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean����',
  `params` varchar(2000) DEFAULT NULL COMMENT '����',
  `status` tinyint(4) NOT NULL COMMENT '����״̬    0���ɹ�    1��ʧ��',
  `error` varchar(2000) DEFAULT NULL COMMENT 'ʧ����Ϣ',
  `times` int(11) NOT NULL COMMENT '��ʱ(��λ������)',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COMMENT='��ʱ������־';

/*Data for the table `schedule_job_log` */

insert  into `schedule_job_log`(`log_id`,`job_id`,`bean_name`,`params`,`status`,`error`,`times`,`create_time`) values (1,1,'testTask','renren',0,NULL,1,'2021-10-25 17:00:00'),(2,1,'testTask','renren',0,NULL,1,'2021-10-25 17:30:00'),(3,1,'testTask','renren',0,NULL,1,'2021-10-25 18:00:00'),(4,1,'testTask','renren',0,NULL,1,'2021-10-25 18:30:00'),(5,1,'testTask','renren',0,NULL,1,'2021-10-25 19:00:00'),(6,1,'testTask','renren',0,NULL,2,'2021-10-25 19:30:00'),(7,1,'testTask','renren',0,NULL,1,'2021-10-25 20:00:00'),(8,1,'testTask','renren',0,NULL,0,'2021-10-25 20:30:00'),(9,1,'testTask','renren',0,NULL,0,'2021-10-25 21:00:00'),(10,1,'testTask','renren',0,NULL,1,'2021-10-25 21:30:00'),(11,1,'testTask','renren',0,NULL,1,'2021-10-25 22:00:00'),(12,1,'testTask','renren',0,NULL,0,'2021-10-25 22:30:00'),(13,1,'testTask','renren',0,NULL,0,'2021-10-25 23:00:00'),(14,1,'testTask','renren',0,NULL,0,'2021-10-25 23:30:00'),(15,1,'testTask','renren',0,NULL,459,'2021-10-26 00:00:00'),(16,1,'testTask','renren',0,NULL,8,'2021-10-26 10:30:00'),(17,1,'testTask','renren',0,NULL,0,'2021-10-26 11:00:00'),(18,1,'testTask','renren',0,NULL,0,'2021-10-26 11:30:00'),(19,1,'testTask','renren',0,NULL,0,'2021-10-26 12:00:00'),(20,1,'testTask','renren',0,NULL,0,'2021-10-26 12:30:00'),(21,1,'testTask','renren',0,NULL,356,'2021-10-26 13:00:00'),(22,1,'testTask','renren',0,NULL,1,'2021-10-26 13:30:00'),(23,1,'testTask','renren',0,NULL,0,'2021-10-26 14:00:00'),(24,1,'testTask','renren',0,NULL,1,'2021-10-26 14:30:00'),(25,1,'testTask','renren',0,NULL,0,'2021-10-26 15:00:00'),(26,1,'testTask','renren',0,NULL,0,'2021-10-26 15:30:00'),(27,1,'testTask','renren',0,NULL,1,'2021-10-26 16:00:00'),(28,1,'testTask','renren',0,NULL,1,'2021-10-26 16:30:00'),(29,1,'testTask','renren',0,NULL,1,'2021-10-26 17:00:00'),(30,1,'testTask','renren',0,NULL,0,'2021-10-26 17:30:00'),(31,1,'testTask','renren',0,NULL,0,'2021-10-26 18:00:00'),(32,1,'testTask','renren',0,NULL,1,'2021-10-26 18:30:00'),(33,1,'testTask','renren',0,NULL,0,'2021-10-26 19:00:00'),(34,1,'testTask','renren',0,NULL,1,'2021-10-26 19:30:00'),(35,1,'testTask','renren',0,NULL,0,'2021-10-26 20:00:00'),(36,1,'testTask','renren',0,NULL,1,'2021-10-26 20:30:00'),(37,1,'testTask','renren',0,NULL,0,'2021-10-26 21:00:00'),(38,1,'testTask','renren',0,NULL,0,'2021-10-26 21:30:00'),(39,1,'testTask','renren',0,NULL,1,'2021-10-26 22:00:00'),(40,1,'testTask','renren',0,NULL,0,'2021-10-26 22:30:00'),(41,1,'testTask','renren',0,NULL,0,'2021-10-26 23:00:00'),(42,1,'testTask','renren',0,NULL,4,'2021-10-27 00:00:00'),(43,1,'testTask','renren',0,NULL,0,'2021-10-27 13:30:00'),(44,1,'testTask','renren',0,NULL,0,'2021-10-27 14:00:00'),(45,1,'testTask','renren',0,NULL,0,'2021-10-27 14:30:00'),(46,1,'testTask','renren',0,NULL,1,'2021-10-27 15:00:00'),(47,1,'testTask','renren',0,NULL,1,'2021-10-27 15:30:00'),(48,1,'testTask','renren',0,NULL,0,'2021-10-27 16:00:00'),(49,1,'testTask','renren',0,NULL,0,'2021-10-27 16:30:00'),(50,1,'testTask','renren',0,NULL,0,'2021-10-27 17:00:00'),(51,1,'testTask','renren',0,NULL,0,'2021-10-27 17:30:00'),(52,1,'testTask','renren',0,NULL,1,'2021-10-27 18:00:00'),(53,1,'testTask','renren',0,NULL,0,'2021-10-27 18:30:00'),(54,1,'testTask','renren',0,NULL,1,'2021-10-27 19:00:00'),(55,1,'testTask','renren',0,NULL,0,'2021-10-27 19:30:00'),(56,1,'testTask','renren',0,NULL,1,'2021-10-27 20:00:00'),(57,1,'testTask','renren',0,NULL,1,'2021-10-27 20:30:00');

/*Table structure for table `sys_captcha` */

DROP TABLE IF EXISTS `sys_captcha`;

CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '��֤��',
  `expire_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='ϵͳ��֤��';

/*Data for the table `sys_captcha` */

insert  into `sys_captcha`(`uuid`,`code`,`expire_time`) values ('fe6cab64-7780-4bd0-8067-8f552419c4ba','pp8a3','2021-10-26 11:42:07');

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '״̬   0������   1����ʾ',
  `remark` varchar(500) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='ϵͳ������Ϣ��';

/*Data for the table `sys_config` */

insert  into `sys_config`(`id`,`param_key`,`param_value`,`status`,`remark`) values (1,'CLOUD_STORAGE_CONFIG_KEY','{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}',0,'�ƴ洢������Ϣ');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '�û���',
  `operation` varchar(50) DEFAULT NULL COMMENT '�û�����',
  `method` varchar(200) DEFAULT NULL COMMENT '���󷽷�',
  `params` varchar(5000) DEFAULT NULL COMMENT '�������',
  `time` bigint(20) NOT NULL COMMENT 'ִ��ʱ��(����)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP��ַ',
  `create_date` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='ϵͳ��־';

/*Data for the table `sys_log` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '���˵�ID��һ���˵�Ϊ0',
  `name` varchar(50) DEFAULT NULL COMMENT '�˵�����',
  `url` varchar(200) DEFAULT NULL COMMENT '�˵�URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '��Ȩ(����ö��ŷָ����磺user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '����   0��Ŀ¼   1���˵�   2����ť',
  `icon` varchar(50) DEFAULT NULL COMMENT '�˵�ͼ��',
  `order_num` int(11) DEFAULT NULL COMMENT '����',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COMMENT='�˵�����';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`) values (1,0,'ϵͳ����',NULL,NULL,0,'system',0),(2,1,'����Ա�б�','sys/user',NULL,1,'admin',1),(3,1,'��ɫ����','sys/role',NULL,1,'role',2),(4,1,'�˵�����','sys/menu',NULL,1,'menu',3),(5,1,'SQL���','http://localhost:8080/renren-fast/druid/sql.html',NULL,1,'sql',4),(6,1,'��ʱ����','job/schedule',NULL,1,'job',5),(7,6,'�鿴',NULL,'sys:schedule:list,sys:schedule:info',2,NULL,0),(8,6,'����',NULL,'sys:schedule:save',2,NULL,0),(9,6,'�޸�',NULL,'sys:schedule:update',2,NULL,0),(10,6,'ɾ��',NULL,'sys:schedule:delete',2,NULL,0),(11,6,'��ͣ',NULL,'sys:schedule:pause',2,NULL,0),(12,6,'�ָ�',NULL,'sys:schedule:resume',2,NULL,0),(13,6,'����ִ��',NULL,'sys:schedule:run',2,NULL,0),(14,6,'��־�б�',NULL,'sys:schedule:log',2,NULL,0),(15,2,'�鿴',NULL,'sys:user:list,sys:user:info',2,NULL,0),(16,2,'����',NULL,'sys:user:save,sys:role:select',2,NULL,0),(17,2,'�޸�',NULL,'sys:user:update,sys:role:select',2,NULL,0),(18,2,'ɾ��',NULL,'sys:user:delete',2,NULL,0),(19,3,'�鿴',NULL,'sys:role:list,sys:role:info',2,NULL,0),(20,3,'����',NULL,'sys:role:save,sys:menu:list',2,NULL,0),(21,3,'�޸�',NULL,'sys:role:update,sys:menu:list',2,NULL,0),(22,3,'ɾ��',NULL,'sys:role:delete',2,NULL,0),(23,4,'�鿴',NULL,'sys:menu:list,sys:menu:info',2,NULL,0),(24,4,'����',NULL,'sys:menu:save,sys:menu:select',2,NULL,0),(25,4,'�޸�',NULL,'sys:menu:update,sys:menu:select',2,NULL,0),(26,4,'ɾ��',NULL,'sys:menu:delete',2,NULL,0),(27,1,'��������','sys/config','sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete',1,'config',6),(29,1,'ϵͳ��־','sys/log','sys:log:list',1,'log',7),(30,1,'�ļ��ϴ�','oss/oss','sys:oss:all',1,'oss',6),(31,0,'��Ʒϵͳ','','',0,'editor',0),(32,31,'����ά��','product/category','',1,'menu',0),(34,31,'Ʒ�ƹ���','product/brand','',1,'editor',0),(37,31,'ƽ̨����','','',0,'system',0),(38,37,'���Է���','product/attrgroup','',1,'tubiao',0),(39,37,'������','product/baseattr','',1,'log',0),(40,37,'��������','product/saleattr','',1,'zonghe',0),(41,31,'��Ʒά��','product/spu','',0,'zonghe',0),(42,0,'�Ż�Ӫ��','','',0,'mudedi',0),(43,0,'���ϵͳ','','',0,'shouye',0),(44,0,'����ϵͳ','','',0,'config',0),(45,0,'�û�ϵͳ','','',0,'admin',0),(46,0,'���ݹ���','','',0,'sousuo',0),(47,42,'�Ż�ȯ����','coupon/coupon','',1,'zhedie',0),(48,42,'���ż�¼','coupon/history','',1,'sql',0),(49,42,'ר��','coupon/subject','',1,'tixing',0),(50,42,'��ɱ�','coupon/seckill','',1,'daohang',0),(51,42,'����ά��','coupon/bounds','',1,'geren',0),(52,42,'�����ۿ�','coupon/full','',1,'shoucang',0),(53,43,'�ֿ�ά��','ware/wareinfo','',1,'shouye',0),(54,43,'��湤����','ware/task','',1,'log',0),(55,43,'��Ʒ���','ware/sku','',1,'jiesuo',0),(56,44,'������ѯ','order/order','',1,'zhedie',0),(57,44,'�˻�������','order/return','',1,'shanchu',0),(58,44,'�ȼ�����','order/settings','',1,'system',0),(59,44,'֧����ˮ��ѯ','order/payment','',1,'job',0),(60,44,'�˿���ˮ��ѯ','order/refund','',1,'mudedi',0),(61,45,'��Ա�б�','member/member','',1,'geren',0),(62,45,'��Ա�ȼ�','member/level','',1,'tubiao',0),(63,45,'���ֱ仯','member/growth','',1,'bianji',0),(64,45,'ͳ����Ϣ','member/statistics','',1,'sql',0),(65,46,'��ҳ�Ƽ�','content/index','',1,'shouye',0),(66,46,'��������','content/category','',1,'zhedie',0),(67,46,'���۹���','content/comments','',1,'pinglun',0),(68,41,'spu����','product/spu','',1,'config',0),(69,41,'������Ʒ','product/spuadd','',1,'bianji',0),(70,43,'�ɹ���ά��','','',0,'tubiao',0),(71,70,'�ɹ�����','ware/purchaseitem','',1,'editor',0),(72,70,'�ɹ���','ware/purchase','',1,'menu',0),(73,41,'��Ʒ����','product/manager','',1,'zonghe',0),(74,42,'��Ա�۸�','coupon/memberprice','',1,'admin',0),(75,42,'ÿ����ɱ','coupon/seckillsession','',1,'job',0),(76,37,'���ά��','product/attrupdate',NULL,2,'LOG',0);

/*Table structure for table `sys_oss` */

DROP TABLE IF EXISTS `sys_oss`;

CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL��ַ',
  `create_date` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='�ļ��ϴ�';

/*Data for the table `sys_oss` */

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '��ɫ����',
  `remark` varchar(100) DEFAULT NULL COMMENT '��ע',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '������ID',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='��ɫ';

/*Data for the table `sys_role` */

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '��ɫID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '�˵�ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='��ɫ��˵���Ӧ��ϵ';

/*Data for the table `sys_role_menu` */

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '�û���',
  `password` varchar(100) DEFAULT NULL COMMENT '����',
  `salt` varchar(20) DEFAULT NULL COMMENT '��',
  `email` varchar(100) DEFAULT NULL COMMENT '����',
  `mobile` varchar(100) DEFAULT NULL COMMENT '�ֻ���',
  `status` tinyint(4) DEFAULT NULL COMMENT '״̬  0������   1������',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '������ID',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='ϵͳ�û�';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`username`,`password`,`salt`,`email`,`mobile`,`status`,`create_user_id`,`create_time`) values (1,'admin','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','root@renren.io','13612345678',1,1,'2016-11-11 11:11:11');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '�û�ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '��ɫID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='�û����ɫ��Ӧ��ϵ';

/*Data for the table `sys_user_role` */

/*Table structure for table `sys_user_token` */

DROP TABLE IF EXISTS `sys_user_token`;

CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `update_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='ϵͳ�û�Token';

/*Data for the table `sys_user_token` */

insert  into `sys_user_token`(`user_id`,`token`,`expire_time`,`update_time`) values (1,'7e173942ee2d7ef71f70581896b03a1d','2021-10-28 01:36:38','2021-10-27 13:36:38');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '�û���',
  `mobile` varchar(20) NOT NULL COMMENT '�ֻ���',
  `password` varchar(64) DEFAULT NULL COMMENT '����',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='�û�';

/*Data for the table `tb_user` */

insert  into `tb_user`(`user_id`,`username`,`mobile`,`password`,`create_time`) values (1,'mark','13612345678','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','2017-03-23 22:37:41');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
