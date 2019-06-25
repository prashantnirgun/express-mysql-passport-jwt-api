/*
CREATE DATABASE IF NOT EXISTS retail;
USE my_dbs;
*/

DROP TABLE IF EXISTS `account_format`;
CREATE TABLE `account_format` (
  `account_format_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL DEFAULT '0',
  `account_format_name` varchar(100) NOT NULL,
  `side` char(1) NOT NULL,
  `created_by_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`account_format_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


INSERT INTO `account_format` (`account_format_id`,`branch_id`,`account_format_name`,`side`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (1,1,'Trading A/c','T',1,'2018-06-06 20:06:13',NULL,NULL),
 (2,1,'Profit & Loss A/c','P',1,'2018-06-06 20:06:13',NULL,NULL),
 (3,1,'Balancesheet','B',1,'2018-06-06 20:06:13',NULL,NULL);


DROP TABLE IF EXISTS `account_group`;
CREATE TABLE `account_group` (
  `account_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL DEFAULT '0',
  `account_group_name` varchar(50) NOT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `account_head_id` int(10) unsigned NOT NULL DEFAULT '0',
  `statutory` char(1) NOT NULL,
  `primary_group` char(1) NOT NULL,
  `primary_name` varchar(50) NOT NULL,
  `herarcy` tinyint(4) NOT NULL DEFAULT '0',
  `io` char(1) DEFAULT NULL,
  `created_by_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`account_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `account_group` (`account_group_id`,`branch_id`,`account_group_name`,`alias`,`account_head_id`,`statutory`,`primary_group`,`primary_name`,`herarcy`,`io`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (1,1,'Gross Profit b/d',NULL,6,'Y','Y','Gross Profit b/d',0,'Y',1,'2018-04-06 13:01:42',NULL,NULL),
 (2,1,'Gross Profit c/d',NULL,1,'Y','Y','Gross Profit c/d',0,'Y',1,'2018-04-06 13:01:42',NULL,NULL),
 (3,1,'Net Loss',NULL,2,'Y','Y','Net Loss',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (4,1,'Net Profit',NULL,2,'Y','Y','Net Profit',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (5,1,'Purchase',NULL,2,'Y','Y','Purchase Account',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (6,1,'Sales',NULL,1,'Y','Y','Sales Account',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (7,1,'Cash',NULL,5,'Y','Y','Cash',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (8,1,'Bank',NULL,5,'Y','Y','Bank',0,'Y',1,'2009-01-20 16:56:53',1,'2019-04-01 19:31:07'),
 (9,1,'Bank OD',NULL,6,'Y','Y','Bank OD',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (10,1,'Sundry Debtors.',NULL,5,'Y','Y','Sundry Debtors',0,'Y',1,'2009-01-20 16:56:53',6,'2019-01-21 14:33:18');

INSERT INTO `account_group` (`account_group_id`,`branch_id`,`account_group_name`,`alias`,`account_head_id`,`statutory`,`primary_group`,`primary_name`,`herarcy`,`io`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (11,1,'Sundry Creditors',NULL,6,'Y','Y','Sundry Creditors',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (12,1,'Capital Account',NULL,3,'Y','Y','Capital Account',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (13,1,'Bank OD',NULL,3,'Y','Y','Bank OD',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (14,1,'Bank OCC',NULL,3,'Y','Y','Bank OCC',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (15,1,'Deposits (Asset)',NULL,3,'Y','Y','Deposits (Asset)',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (16,1,'Direct Expenses',NULL,2,'Y','Y','Direct Expenses',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (17,1,'Direct Incomes',NULL,1,'Y','Y','Direct Incomes',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (18,1,'Duties & Taxes',NULL,4,'Y','Y','Duties & Taxes',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (19,1,'Expenses (Direct)',NULL,6,'Y','Y','Expenses (Direct)',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL);

INSERT INTO `account_group` (`account_group_id`,`branch_id`,`account_group_name`,`alias`,`account_head_id`,`statutory`,`primary_group`,`primary_name`,`herarcy`,`io`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (20,1,'Expenses (Indirect)',NULL,4,'Y','Y','Expenses (Indirect)',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (21,1,'Fixed Assets',NULL,3,'Y','Y','Fixed Assets',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (22,1,'Income (Direct)',NULL,1,'Y','Y','Income (Direct)',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (23,1,'Income (Indirect)',NULL,3,'Y','Y','Income (Indirect)',0,'Y',1,'2009-01-20 16:56:53',1,'2019-04-02 13:56:53'),
 (24,1,'Indirect Expenses',NULL,2,'Y','Y','Indirect Expenses',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (25,1,'Indirect Incomes',NULL,3,'Y','Y','Indirect Incomes',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (26,1,'Investments',NULL,3,'Y','Y','Investments',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (27,1,'Loans & Advances (Asset)',NULL,3,'Y','Y','Loans & Advances (Asset)',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (28,1,'Loans (Liability)',NULL,4,'Y','Y','Loans (Liability)',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL);

INSERT INTO `account_group` (`account_group_id`,`branch_id`,`account_group_name`,`alias`,`account_head_id`,`statutory`,`primary_group`,`primary_name`,`herarcy`,`io`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (29,1,'Misc. Expenses (ASSET)',NULL,2,'Y','Y','Misc. Expenses (ASSET)',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (30,1,'Provisions',NULL,4,'Y','Y','Provisions',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (31,1,'Reserves & Surplus',NULL,3,'Y','Y','Reserves & Surplus',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (32,1,'Retained Earnings',NULL,3,'Y','Y','Retained Earnings',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (33,1,'Secured Loans',NULL,4,'Y','Y','Secured Loans',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (34,1,'Stock-in-hand',NULL,3,'Y','Y','Stock-in-hand',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (35,1,'Bank OCC A/c',NULL,4,'Y','Y','Bank OCC A/c',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (36,1,'Suspense A/c',NULL,2,'Y','Y','Suspense A/c',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL),
 (37,1,'Unsecured Loans',NULL,4,'Y','Y','Unsecured Loans',0,'Y',1,'2009-01-20 16:56:53',NULL,NULL);


DROP TABLE IF EXISTS `account_head`;
CREATE TABLE `account_head` (
  `account_head_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL DEFAULT '0',
  `account_head_name` varchar(100) NOT NULL,
  `account_format_id` int(10) unsigned NOT NULL,
  `io` char(1) NOT NULL DEFAULT 'Y',
  `created_by_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`account_head_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `account_head` (`account_head_id`,`branch_id`,`account_head_name`,`account_format_id`,`io`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (1,1,'Direct Income',1,'N',1,'2018-04-06 13:01:42',NULL,NULL),
 (2,1,'Direct Expenses',1,'N',1,'2018-04-06 13:01:42',NULL,NULL),
 (3,1,'Income',2,'N',1,'2018-06-12 21:33:38',NULL,NULL),
 (4,1,'Expenses',2,'N',1,'2018-06-12 21:34:37',NULL,NULL),
 (5,1,'Assets',3,'N',1,'2018-06-12 21:35:07',NULL,NULL),
 (6,1,'Liability',3,'N',1,'2018-06-12 21:35:51',NULL,NULL);

DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_id` int(11) NOT NULL DEFAULT '0',
  `table_name` varchar(25) NOT NULL,
  `address_name` varchar(50) NOT NULL,
  `default_address` char(1) DEFAULT NULL,
  `add1` varchar(100) DEFAULT NULL,
  `add2` varchar(100) DEFAULT NULL,
  `add3` varchar(100) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `created_by_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `address` (`address_id`,`reference_id`,`table_name`,`address_name`,`default_address`,`add1`,`add2`,`add3`,`telephone`,`email`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (1,1,'branch','DEMO COMPANY ','Y','G.106 TIMES SQUARE, 101 FLR','53 DOWN STREET., MUMBAI  400111,','','91-022-123456 / 1234567890','demo@gmail.com',1,'2019-03-30 18:23:39',NULL,NULL);

DROP TABLE IF EXISTS `branch`;
CREATE TABLE `branch` (
  `branch_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL DEFAULT '0',
  `branch_name` varchar(60) NOT NULL,
  `gst` varchar(15) DEFAULT NULL,
  `pancard` varchar(15) DEFAULT NULL,
  `created_by_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `branch` (`branch_id`,`company_id`,`branch_name`,`gst`,`pancard`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (1,1,'DEMO BRANCH',NULL,NULL,2,'2015-12-28 17:28:23',NULL,NULL);




DROP TABLE IF EXISTS `branch_godown`;
CREATE TABLE `branch_godown` (
  `branch_godown_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL DEFAULT '0',
  `godown_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`branch_godown_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `branch_godown` (`branch_godown_id`,`branch_id`,`godown_id`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (1,1,1,2,'2018-04-04 13:09:12',NULL,NULL);

DROP TABLE IF EXISTS `client_column_property`;
CREATE TABLE `client_column_property` (
  `client_column_property_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `column_property_id` int(10) unsigned NOT NULL,
  `column_id` varchar(100) NOT NULL,
  `column_name` varchar(40) DEFAULT NULL,
  `set_default` char(1) NOT NULL,
  `statutary_id` char(1) NOT NULL DEFAULT '1',
  `archive_id` char(1) NOT NULL DEFAULT 'N',
  `created_at` datetime NOT NULL,
  `created_by_user_id` int(10) unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`client_column_property_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

INSERT INTO `client_column_property` (`client_column_property_id`,`company_id`,`column_property_id`,`column_id`,`column_name`,`set_default`,`statutary_id`,`archive_id`,`created_at`,`created_by_user_id`,`updated_at`,`updated_by_user_id`) VALUES 
 (1,1,1,'1','Landscape','N','Y','N','2019-01-25 15:44:12',1,NULL,NULL),
 (2,1,1,'2','Portrait','Y','Y','N','2019-01-25 15:44:12',1,NULL,NULL),
 (3,1,2,'1','Priority 1','N','Y','N','2019-01-25 16:39:11',1,NULL,NULL),
 (4,1,2,'2','Priority 2','Y','Y','N','2019-01-25 16:39:11',1,NULL,NULL),
 (5,1,2,'3','Priority 3','Y','Y','N','2019-01-25 16:39:11',1,NULL,NULL),
 (6,1,3,'S','Sales','Y','Y','N','2019-01-25 16:39:11',1,NULL,NULL),
 (7,1,3,'P','Purchase','Y','Y','N','2019-01-25 16:39:11',1,NULL,NULL),
 (8,1,4,'TR','Vehicle','Y','Y','N','2019-01-25 16:39:11',1,NULL,NULL),
 (9,1,4,'O','Other','Y','Y','N','2019-01-25 16:39:11',1,NULL,NULL),
 (10,1,5,'R','Account Receivable','N','Y','N','2019-01-31 16:00:16',1,NULL,NULL),
 (11,1,5,'P','Account Payable','N','Y','N','2019-01-31 16:00:16',1,NULL,NULL);

DROP TABLE IF EXISTS `column_property`;
CREATE TABLE `column_property` (
  `column_property_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `column_group` varchar(50) NOT NULL,
  `statutary_id` char(1) NOT NULL DEFAULT '1',
  `description` varchar(40) DEFAULT NULL,
  `archive_id` char(1) NOT NULL DEFAULT 'N',
  `created_at` datetime NOT NULL,
  `created_by_user_id` int(10) unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`column_property_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;


INSERT INTO `column_property` (`column_property_id`,`column_group`,`statutary_id`,`description`,`archive_id`,`created_at`,`created_by_user_id`,`updated_at`,`updated_by_user_id`) VALUES 
 (1,'Orientation','Y','Orientation','N','2019-01-25 15:44:12',1,NULL,NULL),
 (2,'Tax Priority','Y','Orientation','N','2019-01-25 16:36:06',1,NULL,NULL),
 (3,'Register','Y','Register','N','2019-01-25 16:36:06',1,NULL,NULL),
 (4,'Reference Type','Y','Reference Type','N','2019-01-25 16:36:06',1,NULL,NULL),
 (5,'AR/AP','Y','Account Reveivable / Payable','N','2019-01-31 16:00:16',1,NULL,NULL);

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `company_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(60) NOT NULL,
  `company_type_id` int(11) NOT NULL,
  `inventory` char(1) NOT NULL DEFAULT 'N',
  `created_by_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `company` (`company_id`,`company_name`,`company_type_id`,`inventory`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (1,'DEMO COMPANY',1,'Y',2,'2015-12-28 17:28:23',NULL,NULL);


DROP TABLE IF EXISTS `default_narration`;
CREATE TABLE `default_narration` (
  `default_narration_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL,
  `narration` varchar(100) NOT NULL,
  `voucher_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`default_narration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `general_ledger`;
CREATE TABLE `general_ledger` (
  `general_ledger_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL DEFAULT '0',
  `general_ledger_name` varchar(100) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `account_group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `statutory` char(1) NOT NULL,
  `primary_name` varchar(50) NOT NULL,
  `debit_credit_id` char(1) NOT NULL DEFAULT 'D',
  `opening_amount` decimal(18,2) NOT NULL DEFAULT '0.00',
  `gst_no` varchar(50) DEFAULT NULL,
  `pancard_no` varchar(50) DEFAULT NULL,
  `adhard_no` varchar(50) DEFAULT NULL,
  `ie_code` varchar(50) DEFAULT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `rmn` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `contact_person` varchar(50) DEFAULT NULL,
  `maintain_bill` char(1) NOT NULL DEFAULT 'N',
  `credit_period` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `credit_limit` decimal(12,2) unsigned DEFAULT '0.00',
  `herarcy` tinyint(4) NOT NULL DEFAULT '0',
  `tag` varchar(50) DEFAULT NULL,
  `fav` char(1) DEFAULT 'N',
  `io` char(1) NOT NULL DEFAULT 'Y',
  `remark` text,
  `created_by_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`general_ledger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `godown`;
CREATE TABLE `godown` (
  `godown_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL DEFAULT '0',
  `godown_name` varchar(50) NOT NULL,
  `created_by_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`godown_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `godown` (`godown_id`,`company_id`,`godown_name`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (1,1,'G-16',2,'2018-04-04 13:09:12',NULL,NULL);

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL DEFAULT '0',
  `item_name` varchar(50) NOT NULL,
  `item_group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `unit_id` int(10) unsigned NOT NULL DEFAULT '0',
  `hsn` varchar(50) DEFAULT NULL,
  `io` char(1) DEFAULT 'Y',
  `created_by_user_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `item` (`item_id`,`branch_id`,`item_name`,`item_group_id`,`unit_id`,`hsn`,`io`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (1,1,'.',1,1,'','Y',2,'2018-04-02 09:53:16',NULL,NULL),
 (2,1,'Imp Apple',1,1,'.','Y',2,'2015-04-09 11:13:55',NULL,NULL),
 (3,1,'Coconut Tender',1,2,'.','Y',2,'2015-04-03 11:36:53',1,'2019-04-05 19:59:24'),
 (4,1,'SWEET LIME',1,1,'.','Y',2,'2015-04-06 21:11:34',NULL,NULL),
 (5,1,'Mango Alphanso',1,1,'.','Y',2,'2015-04-06 21:16:17',2,'2019-04-03 13:20:11'),
 (6,1,'Figes',1,1,'.','Y',2,'2015-04-06 21:19:04',2,'2019-04-03 13:02:25'),
 (7,1,'Chicoo',1,1,'.','Y',2,'2015-04-09 11:13:44',2,'2019-04-03 13:06:26'),
 (8,1,'Banglore Grapes',1,1,'.','Y',2,'2015-04-09 18:19:40',2,'2019-04-03 13:05:54'),
 (9,1,'Pomogranet Kabuli',1,1,'.','Y',2,'2015-04-09 11:14:28',2,'2019-04-03 13:17:58'),
 (10,1,'Orange Kinoo',1,1,'.','Y',2,'2015-04-09 11:14:20',2,'2019-04-03 13:14:45'),
 (11,1,'Water Melon Kiran',1,1,'.','Y',2,'2015-04-09 11:14:41',2,'2019-04-03 13:17:19'),
 (12,1,'IMP GOVA',1,1,'.','Y',2,'2015-04-09 11:13:58',NULL,NULL);
INSERT INTO `item` (`item_id`,`branch_id`,`item_name`,`item_group_id`,`unit_id`,`hsn`,`io`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (13,1,'Honey Dew Melon',1,1,'.','Y',2,'2015-04-09 11:13:52',2,'2019-04-03 13:08:17'),
 (14,1,'Strawberry',1,1,'.','Y',2,'2015-04-09 18:19:57',2,'2019-04-03 13:21:35'),
 (15,1,'Papaya Disco',1,1,'.','Y',2,'2015-04-09 11:14:23',2,'2019-04-03 13:15:16'),
 (16,1,'Pineapple Rani',1,1,'.','Y',2,'2015-04-09 11:14:26',2,'2019-04-03 13:14:22'),
 (17,1,'Mash Melon',1,1,'.','Y',2,'2015-04-09 11:14:17',2,'2019-04-03 13:13:33'),
 (18,1,'Imp Orange',1,1,'.','Y',2,'2015-04-09 18:19:49',NULL,NULL),
 (19,1,'Imp Grapes',1,1,'.','Y',2,'2015-04-09 11:14:05',NULL,NULL),
 (20,1,'Green Apple Imp',1,1,'.','Y',2,'2015-04-07 13:23:07',NULL,NULL),
 (21,1,'Pears Imp Green',1,1,'.','Y',2,'2015-04-07 13:23:41',NULL,NULL),
 (22,1,'Table Orange',1,1,'.','Y',2,'2015-04-07 13:27:19',NULL,NULL),
 (23,1,'Banana Elichi',1,1,'.','Y',2,'2015-04-07 13:28:30',NULL,NULL),
 (24,1,'BANANA ELAYCHI DZ',1,4,'.','Y',2,'2017-04-12 16:59:10',1,'2019-04-05 20:00:25');
INSERT INTO `item` (`item_id`,`branch_id`,`item_name`,`item_group_id`,`unit_id`,`hsn`,`io`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (25,1,'Banana Golden',1,1,'.','Y',2,'2015-04-07 13:29:17',NULL,NULL),
 (26,1,'Imp Plum',1,1,'.','Y',2,'2015-04-07 13:30:30',NULL,NULL),
 (27,1,'Kiwi Imp',1,1,'.','Y',2,'2015-04-07 13:31:37',NULL,NULL),
 (28,1,'Imp Draygan fruit',1,1,'.','Y',2,'2015-04-07 17:17:36',NULL,NULL),
 (29,1,'Grapes Green Sonaka',1,1,'.','Y',2,'2015-04-09 12:19:34',2,'2019-04-03 13:07:50'),
 (30,1,'RAMFUL',1,1,'.','Y',2,'2015-04-09 12:22:27',NULL,NULL),
 (32,1,'Grapes Black',1,1,'.','Y',2,'2015-04-15 16:14:44',2,'2019-04-03 13:07:11'),
 (33,1,'IMP RAMBUSTAN',1,1,'.','Y',2,'2015-04-15 16:36:12',NULL,NULL),
 (34,1,'GOVA ',1,1,'.','Y',2,'2015-04-18 12:55:28',NULL,NULL),
 (35,1,'pomelos (pupnus)',1,1,'.','Y',2,'2015-04-18 20:24:28',NULL,NULL),
 (36,1,'Mango Badami',1,1,'.','Y',2,'2015-04-28 20:50:07',2,'2019-04-03 13:09:25'),
 (37,1,'mango dasheri ',1,1,'.','Y',2,'2015-04-30 20:11:16',NULL,NULL),
 (38,1,'Water Melon',1,1,'.','Y',2,'2015-04-30 20:12:37',2,'2019-04-03 13:18:26');
INSERT INTO `item` (`item_id`,`branch_id`,`item_name`,`item_group_id`,`unit_id`,`hsn`,`io`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (39,1,'Peach ',1,1,'.','Y',2,'2015-06-24 11:58:14',NULL,NULL),
 (40,1,'Litchies',1,1,'.','Y',2,'2015-07-01 20:22:24',NULL,NULL),
 (41,1,'Mango Keshar',1,1,'.','Y',2,'2015-07-01 20:34:52',NULL,NULL),
 (42,1,'Jamun Black',1,1,'.','Y',2,'2015-07-02 19:27:15',NULL,NULL),
 (43,1,'Red cherrie',1,1,'.','Y',2,'2015-07-03 12:02:11',NULL,NULL),
 (44,1,'plum Indian',1,1,'.','Y',2,'2015-07-03 12:35:47',NULL,NULL),
 (45,1,'Mango Langada',1,1,'.','Y',2,'2015-07-03 20:05:08',NULL,NULL),
 (46,1,'Khajoor',1,1,'.','Y',2,'2015-07-03 20:30:27',NULL,NULL),
 (47,1,'Mango chausa',1,1,'.','Y',2,'2015-07-12 19:36:27',NULL,NULL),
 (48,1,'Mango Neelam',1,1,'.','Y',2,'2015-07-12 19:59:43',NULL,NULL),
 (49,1,'Mango Lalbag',1,1,'.','Y',2,'2016-06-08 20:44:54',NULL,NULL),
 (50,1,'Table gray Fruit',1,1,'.','Y',2,'2015-07-13 11:29:59',NULL,NULL),
 (51,1,'Imp Mangosteen',1,1,'.','Y',2,'2015-07-15 13:28:44',NULL,NULL),
 (52,1,'pears Williams',1,1,'.','Y',2,'2015-07-16 12:13:56',NULL,NULL);
INSERT INTO `item` (`item_id`,`branch_id`,`item_name`,`item_group_id`,`unit_id`,`hsn`,`io`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (53,1,'Imp Gray fruit ',1,1,'.','Y',2,'2015-07-19 20:56:34',NULL,NULL),
 (54,1,'Peach Imp',1,1,'.','Y',2,'2015-08-03 19:19:51',NULL,NULL),
 (55,1,'Custard Apple',1,1,'.','Y',2,'2015-08-03 19:22:43',NULL,NULL),
 (56,1,'Imp Orange Mini',1,1,'.','Y',2,'2015-08-04 12:59:02',2,'2019-04-03 13:16:17'),
 (57,1,'Golden Apple',1,1,'.','Y',2,'2015-08-06 17:36:56',NULL,NULL),
 (58,1,'Table Apple',1,1,'.','Y',2,'2015-08-08 20:29:58',NULL,NULL),
 (59,1,'Fuji Apple',1,1,'.','Y',2,'2015-08-18 16:21:45',NULL,NULL),
 (60,1,'Kinoor Apple',1,1,'.','Y',2,'2015-08-18 16:54:21',NULL,NULL),
 (61,1,'Pears Imp China',1,1,'.','Y',2,'2015-08-20 12:07:50',NULL,NULL),
 (62,1,'Banana Green',1,1,'.','Y',2,'2015-09-02 18:32:32',NULL,NULL),
 (63,1,'Dates',1,1,'.','Y',2,'2015-09-03 20:36:16',NULL,NULL),
 (64,1,'Apple Himachal',1,1,'.','Y',2,'2015-09-08 18:29:29',NULL,NULL),
 (65,1,'Pears Naka',1,1,'.','Y',2,'2015-10-07 11:39:58',NULL,NULL);
INSERT INTO `item` (`item_id`,`branch_id`,`item_name`,`item_group_id`,`unit_id`,`hsn`,`io`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (66,1,'Imp Longon Fruit',1,1,'.','Y',2,'2015-10-16 20:51:19',2,'2019-04-03 13:22:10'),
 (67,1,'Imp Avakadu',1,1,'.','Y',2,'2015-10-24 18:42:36',NULL,NULL),
 (68,1,'Fruit Basket Mix',1,1,'.','Y',2,'2015-11-06 16:02:03',NULL,NULL),
 (69,1,'Imp Apple Royal Gala',1,1,'.','Y',2,'2015-12-18 19:49:06',NULL,NULL),
 (70,1,'Gooseberry',1,1,'.','Y',2,'2015-12-25 12:47:53',NULL,NULL),
 (71,1,'Apricot',1,1,'.','Y',2,'2016-01-06 13:16:29',2,'2019-04-03 13:02:06'),
 (72,1,'Jamun White',1,1,'.','Y',2,'2016-01-06 13:28:53',NULL,NULL),
 (73,1,'Juicy Orange',1,1,'.','Y',2,'2016-01-06 13:36:42',NULL,NULL),
 (74,1,'Raspberry',1,1,'.','Y',2,'2016-01-06 13:46:04',NULL,NULL),
 (75,1,'Suger Cane',1,1,'.','Y',2,'2016-01-06 13:48:06',2,'2019-04-03 13:23:26'),
 (76,1,'Dragon Fruit White Flesh',1,1,'.','Y',2,'2016-01-06 13:51:47',NULL,NULL),
 (77,1,'Blackbeery Imp',1,1,'.','Y',2,'2017-08-05 11:38:02',NULL,NULL),
 (78,1,'Mulbeeris',1,1,'.','Y',2,'2016-01-23 17:24:02',NULL,NULL);
INSERT INTO `item` (`item_id`,`branch_id`,`item_name`,`item_group_id`,`unit_id`,`hsn`,`io`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (79,1,'Apple Cooking ',1,1,'.','Y',2,'2016-02-08 19:42:17',NULL,NULL),
 (80,1,'Banana Kerala',1,1,'.','Y',2,'2016-02-08 19:45:19',NULL,NULL),
 (81,1,'Banana Yellow',1,1,'.','Y',2,'2016-02-08 19:47:09',NULL,NULL),
 (82,1,' Cherry Red Imp',1,1,'.','Y',2,'2016-02-08 19:48:49',2,'2019-04-03 13:08:51'),
 (83,1,'Melon Imp',1,1,'.','Y',2,'2016-02-08 19:52:01',NULL,NULL),
 (84,1,'Lychee Imp',1,1,'.','Y',2,'2016-02-08 19:54:56',NULL,NULL),
 (85,1,'Tadgola',1,1,'.','Y',2,'2016-02-08 19:58:59',NULL,NULL),
 (86,1,'Apple Rose',1,1,'.','Y',2,'2016-02-10 12:43:03',NULL,NULL),
 (87,1,'Mango Payari',1,1,'.','Y',2,'2016-02-10 12:51:07',NULL,NULL),
 (88,1,'Mango Rajapuri',1,1,'.','Y',2,'2016-02-10 12:52:05',NULL,NULL),
 (89,1,'Pupunes Imp',1,1,'.','Y',2,'2016-02-10 12:59:48',NULL,NULL),
 (90,1,'FUNUS',1,1,'.','Y',2,'2016-02-10 19:39:50',NULL,NULL),
 (91,1,'BORE',1,1,'.','Y',2,'2016-02-10 19:42:56',NULL,NULL);
INSERT INTO `item` (`item_id`,`branch_id`,`item_name`,`item_group_id`,`unit_id`,`hsn`,`io`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (92,1,'Pears Red Imp',1,1,'.','Y',2,'2016-02-10 19:45:25',NULL,NULL),
 (93,1,'Star Fruit',1,1,'.','Y',2,'2016-02-10 19:48:06',NULL,NULL),
 (94,1,'Apple Newzealand',1,1,'.','Y',2,'2016-02-11 16:27:33',NULL,NULL),
 (95,1,'Badam Green',1,1,'.','Y',2,'2016-02-11 16:46:07',NULL,NULL),
 (96,1,'Apple Shimla',1,1,'.','Y',2,'2016-04-04 19:18:02',NULL,NULL),
 (97,1,'Cantaloop Melon',1,1,'.','Y',2,'2016-04-26 16:51:12',NULL,NULL),
 (98,1,'Golden Apple Imp',1,1,'.','Y',2,'2016-05-06 12:26:15',NULL,NULL),
 (99,1,'Mango Safeda',1,1,'.','Y',2,'2016-05-06 12:29:24',NULL,NULL),
 (100,1,'Mango Totapuri',1,1,'.','Y',2,'2016-06-08 20:14:46',NULL,NULL),
 (101,1,' Raspberries Imp',1,1,'.','Y',2,'2016-06-14 17:41:16',2,'2019-04-03 12:50:37'),
 (102,1,' Red Current Imp',1,1,'.','Y',2,'2016-07-05 18:07:39',2,'2019-04-03 12:52:07'),
 (103,1,'watar Chestnut Green',1,1,'.','Y',2,'2016-07-15 19:18:05',NULL,NULL),
 (104,1,'Apricot imp',1,1,'.','Y',2,'2016-11-25 12:11:58',NULL,NULL);
INSERT INTO `item` (`item_id`,`branch_id`,`item_name`,`item_group_id`,`unit_id`,`hsn`,`io`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (105,1,'Figes Imp',1,1,'.','Y',2,'2016-11-25 12:12:58',NULL,NULL),
 (106,1,'Coconut Thai',1,2,'.','Y',2,'2016-12-26 17:30:10',1,'2019-04-05 19:59:51'),
 (107,1,'Lemon Imp',1,1,'.','Y',2,'2017-02-25 18:40:28',NULL,NULL),
 (108,1,'Japnese Melon',1,1,'.','Y',2,'2017-04-11 19:57:17',NULL,NULL),
 (109,1,'Blue Berries Imp',1,1,'.','Y',2,'2017-08-05 11:39:10',NULL,NULL),
 (110,1,'mango Sinduri',1,1,'.','Y',2,'2017-04-14 13:22:23',2,'2019-04-03 13:15:57'),
 (111,1,'Strawberry Imp',1,1,'.','Y',2,'2017-05-03 12:49:48',2,'2019-04-03 13:04:15'),
 (113,1,'Melon Suger Sarda',1,1,'.','Y',2,'2017-05-03 12:56:50',2,'2019-04-03 13:03:39'),
 (115,1,'Nectrin imp',1,1,'.','Y',2,'2017-06-01 12:37:27',NULL,NULL),
 (116,1,'Dates Fresh Yellow',1,1,'.','Y',2,'2018-06-28 14:31:36',2,'2019-04-03 12:55:41'),
 (117,1,'Dates fresh Red',1,1,'.','Y',2,'2018-06-28 14:30:42',2,'2019-04-03 12:55:08'),
 (118,1,'Passion Fruit Imp',1,1,'.','Y',2,'2018-03-15 16:27:27',NULL,NULL);
INSERT INTO `item` (`item_id`,`branch_id`,`item_name`,`item_group_id`,`unit_id`,`hsn`,`io`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (119,1,'Green apple grammy smith',1,1,'.','Y',2,'2018-04-20 14:34:13',NULL,NULL),
 (120,1,'Imp Orange Valancia',1,1,'.','Y',2,'2018-04-24 18:33:44',NULL,NULL),
 (121,1,'Apple Green Indian',1,1,'.','Y',2,'2018-04-24 18:35:52',2,'2019-04-03 13:01:24'),
 (122,1,'Pineapple Raja',1,1,'.','Y',2,'2018-10-20 14:48:30',2,'2019-04-03 12:57:51'),
 (123,1,'Washington Apple Imp',1,1,'.','Y',2,'2019-01-09 13:10:54',NULL,NULL),
 (124,1,'Italian Apple',1,1,'.','Y',2,'2019-01-09 13:09:52',NULL,NULL),
 (125,1,'Imp Mandrin Orange',1,1,'.','Y',2,'2019-03-04 14:04:08',NULL,NULL),
 (126,1,'Kimia Dates',1,1,'.','Y',2,'2019-01-21 13:31:42',2,'2019-04-03 13:03:09'),
 (127,1,'Sweet Tamarind',1,1,'.','Y',2,'2019-01-21 13:54:02',2,'2019-04-03 13:04:48'),
 (128,1,'Apple Turki',1,1,'.','Y',2,'2019-01-21 14:57:58',2,'2019-04-03 13:01:42'),
 (129,1,'Amarful',1,1,'.','Y',2,'2019-01-21 15:24:10',2,'2019-04-03 13:00:22'),
 (130,1,'Apple Bore',1,1,'.','Y',2,'2019-02-02 14:03:29',2,'2019-04-03 13:00:44');
INSERT INTO `item` (`item_id`,`branch_id`,`item_name`,`item_group_id`,`unit_id`,`hsn`,`io`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (131,1,'Jack Fruit',1,1,'.','Y',2,'2019-02-20 18:21:36',NULL,NULL),
 (132,1,'Apple Italian',1,1,'.','Y',2,'2019-03-04 12:40:51',2,'2019-04-03 13:05:20'),
 (133,1,'Washington Apple Imp.',1,1,'.','Y',2,'2019-03-06 17:38:23',NULL,NULL),
 (134,1,'CUCUMBER',2,1,NULL,'N',2,'2019-04-03 12:08:38',2,'2019-04-03 12:42:26'),
 (135,1,'CARROT',2,1,NULL,'N',2,'2019-04-03 12:13:14',NULL,NULL),
 (136,1,'Orange Local',1,1,NULL,'N',1,'2019-05-04 13:16:09',NULL,NULL);


DROP TABLE IF EXISTS `item_dtl`;
CREATE TABLE `item_dtl` (
  `co_id` tinyint(3) unsigned NOT NULL,
  `item_id` smallint(5) unsigned NOT NULL,
  `pur_rate` decimal(12,2) NOT NULL,
  `sales_rate` decimal(12,2) NOT NULL,
  `mrp` decimal(12,2) NOT NULL,
  `self_price` decimal(12,2) NOT NULL,
  `pur_dis` decimal(12,3) NOT NULL,
  `sales_dis` decimal(12,3) NOT NULL,
  `min_sales_rate` decimal(12,2) NOT NULL,
  `tax_id` smallint(5) unsigned NOT NULL,
  `warning_flag` char(1) NOT NULL,
  `Min_qty` decimal(12,3) NOT NULL,
  `min_days` tinyint(3) unsigned NOT NULL,
  `rol` decimal(12,3) NOT NULL,
  `rol_days` tinyint(3) unsigned NOT NULL,
  `Max_qty` decimal(12,3) NOT NULL,
  `max_days` tinyint(3) unsigned NOT NULL,
  `barcode` varchar(45) DEFAULT NULL,
  `user_id` tinyint(4) NOT NULL DEFAULT '0',
  `modi_dt` datetime NOT NULL,
  PRIMARY KEY (`co_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `item_group`;
CREATE TABLE `item_group` (
  `item_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL DEFAULT '0',
  `item_group_name` varchar(50) NOT NULL,
  `io` char(1) DEFAULT 'Y',
  `created_by_user_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`item_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `item_group` (`item_group_id`,`branch_id`,`item_group_name`,`io`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (1,1,'Fruits','N',1,'2019-03-12 14:53:10',NULL,NULL),
 (2,1,'Vegetables','N',1,'2019-03-12 14:53:10',NULL,NULL);

DROP TABLE IF EXISTS `system_configuration`;
CREATE TABLE `system_configuration` (
  `id` int(11) NOT NULL DEFAULT '0',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `description` varchar(50) NOT NULL,
  `value_1` varchar(15) DEFAULT NULL,
  `value_2` varchar(15) DEFAULT NULL,
  `value_3` varchar(51) DEFAULT NULL,
  `created_by_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`company_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `system_configuration` (`id`,`company_id`,`description`,`value_1`,`value_2`,`value_3`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (1,1,'Language','English',NULL,NULL,1,'2018-12-12 09:47:53',NULL,NULL),
 (2,1,'Date','2018-04-01','2019-03-31',NULL,1,'2018-12-12 09:47:53',NULL,NULL),
 (3,1,'Font','Vegtxt1',NULL,NULL,1,'2018-12-12 09:47:53',NULL,NULL),
 (4,1,'Account Receivable','N','11',NULL,1,'2018-12-12 09:47:53',NULL,NULL),
 (5,1,'Stock','Y',NULL,NULL,1,'2018-12-12 09:47:53',NULL,NULL),
 (6,1,'Account Payable','N',NULL,NULL,1,'2018-12-12 09:47:53',NULL,NULL),
 (8,1,'Maintenance','Y',NULL,NULL,1,'2018-12-12 09:47:53',NULL,NULL),
 (9,1,'Sales Commision','I',NULL,NULL,1,'2018-12-12 09:47:53',NULL,NULL),
 (10,1,'232','1','1','',1,'2018-12-12 09:47:53',NULL,NULL),
 (11,1,'1',NULL,NULL,NULL,1,'2018-12-12 09:47:53',NULL,NULL);

DROP TABLE IF EXISTS `tax`;
CREATE TABLE `tax` (
  `tax_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tax_name` varchar(25) NOT NULL,
  `register` char(1) NOT NULL DEFAULT 'S',
  `method` char(1) NOT NULL DEFAULT 'S',
  `round_up` decimal(3,2) NOT NULL DEFAULT '1.00',
  `tax_gl_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`tax_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tax` (`tax_id`,`branch_id`,`tax_name`,`register`,`method`,`round_up`,`tax_gl_id`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (4,1,'Motor','S','F','1.00',400,1,'2019-01-22 14:59:15',NULL,NULL);


DROP TABLE IF EXISTS `tax_detail`;
CREATE TABLE `tax_detail` (
  `tax_detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_id` int(10) unsigned NOT NULL DEFAULT '0',
  `wef_date` date NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  `reference_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `priority` tinyint(4) NOT NULL DEFAULT '3',
  `created_by_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`tax_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `tax_detail` (`tax_detail_id`,`tax_id`,`wef_date`,`file_id`,`reference_id`,`rate`,`priority`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (1,4,'2019-04-01',3,25,'500.00',1,1,'2019-04-09 00:00:00',NULL,NULL);

DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `unit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL DEFAULT '0',
  `unit_name` varchar(50) DEFAULT NULL,
  `unit_per_quantity` tinyint(3) unsigned DEFAULT '1',
  `unit_base` char(1) DEFAULT 'W',
  `created_by_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `unit` (`unit_id`,`branch_id`,`unit_name`,`unit_per_quantity`,`unit_base`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (1,1,'K.G.',1,'W',2,'2019-01-12 16:19:47',NULL,NULL),
 (2,1,'Nos.',1,'W',2,'2019-01-12 16:19:47',NULL,NULL),
 (3,1,'Packet',1,'W',2,'2019-01-12 16:19:47',NULL,NULL),
 (4,1,'Dozen',1,'W',2,'2019-01-12 16:19:47',NULL,NULL),
 (5,1,'Box',1,'W',2,'2019-01-12 16:19:47',NULL,NULL),
 (6,1,'Per Delivery',1,'W',2,'2019-01-12 16:19:47',NULL,NULL),
 (7,1,'PATI',1,'W',2,'2019-01-12 16:19:47',NULL,NULL);


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  `login_status_id` int(10) unsigned NOT NULL DEFAULT '1',
  `user_name` varchar(100) NOT NULL,
  `login_name` varchar(25) NOT NULL,
  `email_id` varchar(30) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `user_status_id` int(10) unsigned NOT NULL,
  `login_attempt` tinyint(3) unsigned NOT NULL,
  `otp` varchar(10) DEFAULT NULL,
  `otp_expiry` timestamp NULL DEFAULT NULL,
  `token` varchar(10) DEFAULT NULL,
  `token_expiry` timestamp NULL DEFAULT NULL,
  `archive_id` tinyint(3) unsigned NOT NULL DEFAULT '4',
  `created_by_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `user` (`user_id`,`company_id`,`user_group_id`,`login_status_id`,`user_name`,`login_name`,`email_id`,`mobile`,`password`,`user_status_id`,`login_attempt`,`otp`,`otp_expiry`,`token`,`token_expiry`,`archive_id`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (1,1,2,1,'demo','tss',NULL,NULL,'demo1234',1,0,NULL,NULL,NULL,NULL,0,0,'2019-03-30 18:23:39',NULL,NULL),
 (2,1,2,1,'admin','adinath',NULL,NULL,'admin1234',1,0,NULL,NULL,NULL,NULL,0,0,'2019-03-30 18:23:39',NULL,NULL);


DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `user_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `user_group_name` varchar(20) NOT NULL,
  `status_id` tinyint(3) unsigned NOT NULL,
  `archieve` char(1) NOT NULL DEFAULT 'N',
  `created_by_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user_group` (`user_group_id`,`company_id`,`user_group_name`,`status_id`,`archieve`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (1,1,'Administrator',0,'N',1,'2019-01-21 18:39:41',NULL,NULL),
 (2,1,'Supervisor',0,'N',1,'2019-01-21 18:39:41',NULL,NULL),
 (3,1,'Operoator',0,'N',1,'2019-01-21 18:39:41',NULL,NULL);

DROP TABLE IF EXISTS `voucher_type`;
CREATE TABLE `voucher_type` (
  `voucher_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL DEFAULT '0',
  `voucher_type_name` varchar(100) NOT NULL,
  `statutary` char(1) NOT NULL DEFAULT 'N',
  `primary_type` varchar(25) NOT NULL DEFAULT 'N',
  `prefix` varchar(5) DEFAULT NULL,
  `suffix` varchar(5) DEFAULT NULL,
  `default_narration` varchar(100) DEFAULT NULL,
  `starting_no` int(10) unsigned NOT NULL DEFAULT '1',
  `rounding_method` char(2) NOT NULL DEFAULT 'Y',
  `created_by_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`voucher_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `voucher_type` (`voucher_type_id`,`branch_id`,`voucher_type_name`,`statutary`,`primary_type`,`prefix`,`suffix`,`default_narration`,`starting_no`,`rounding_method`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (1,1,'Journal','Y','Journal','AJB',NULL,NULL,1,'Y',1,'2018-04-04 12:05:10',NULL,NULL),
 (2,1,'Receipt','Y','Receipt','CBR',NULL,NULL,1,'Y',1,'2018-04-04 12:05:10',NULL,NULL),
 (3,1,'Payment','Y','Payment','BBR',NULL,NULL,1,'Y',1,'2018-04-04 12:05:10',NULL,NULL),
 (4,1,'Vashi','Y','Challan','UJV',NULL,NULL,1,'Y',1,'2018-04-04 12:05:10',NULL,NULL),
 (5,1,'Purchase','Y','Purchase','CAR','',NULL,1,'Y',1,'2018-04-04 12:05:10',NULL,NULL),
 (6,1,'Sales','Y','Sales',NULL,NULL,NULL,1,'Y',1,'2018-04-04 12:05:10',NULL,NULL),
 (7,1,'Quotation','Y','Quotation','FJV',NULL,NULL,1,'Y',1,'2018-04-04 12:05:10',NULL,NULL);


DROP TABLE IF EXISTS `year`;
CREATE TABLE `year` (
  `year_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_by_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `year` (`year_id`,`company_id`,`start_date`,`end_date`,`created_by_user_id`,`created_at`,`updated_by_user_id`,`updated_at`) VALUES 
 (1,1,'2019-04-01','2020-03-31',2,'2018-05-05 19:54:50',NULL,NULL);

DROP TABLE IF EXISTS `account_group_view`;
DROP VIEW IF EXISTS `account_group_view`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `account_group_view` AS select `a`.`branch_id` AS `branch_id`,`a`.`account_group_id` AS `account_group_id`,concat(`a`.`account_group_name`,' ( ',`b`.`account_head_name`,' )') AS `account_group_name` from (`account_group` `a` join `account_head` `b` on((`a`.`account_head_id` = `b`.`account_head_id`)));


DROP TABLE IF EXISTS `account_head_view`;
DROP VIEW IF EXISTS `account_head_view`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `account_head_view` AS select `a`.`branch_id` AS `branch_id`,`a`.`account_head_id` AS `account_head_id`,concat(`a`.`account_head_name`,' ( ',`b`.`account_format_name`,' )') AS `account_head_name` from (`account_head` `a` join `account_format` `b` on((`a`.`account_format_id` = `b`.`account_format_id`)));


DROP TABLE IF EXISTS `column_value_view`;
DROP VIEW IF EXISTS `column_value_view`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `column_value_view` AS select `b`.`company_id` AS `company_id`,`a`.`column_group` AS `column_group`,`b`.`column_id` AS `column_id`,`b`.`column_name` AS `column_name`,`b`.`set_default` AS `set_default` from (`column_property` `a` join `client_column_property` `b` on((`a`.`column_property_id` = `b`.`column_property_id`)));


DROP TABLE IF EXISTS `company_view`;
DROP VIEW IF EXISTS `company_view`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `company_view` AS select `a`.`company_id` AS `company_id`,`a`.`company_name` AS `company_name`,`b`.`branch_id` AS `branch_id`,`b`.`branch_name` AS `branch_name`,`c`.`add1` AS `add1`,`c`.`add2` AS `add2`,`c`.`add3` AS `add3`,`c`.`telephone` AS `telephone`,`c`.`email` AS `email` from (`company` `a` join (`branch` `b` join `address` `c`) on(((`a`.`company_id` = `b`.`company_id`) and (`b`.`branch_id` = `c`.`reference_id`)))) where (`c`.`table_name` = 'branch');

DROP TABLE IF EXISTS `general_ledger_address_view`;
DROP VIEW IF EXISTS `general_ledger_address_view`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `general_ledger_address_view` AS select `a`.`general_ledger_id` AS `general_ledger_id`,`a`.`branch_id` AS `branch_id`,`a`.`general_ledger_name` AS `general_ledger_name`,`a`.`alias` AS `alias`,`a`.`account_group_id` AS `account_group_id`,`b`.`address_name` AS `address_name`,`b`.`add1` AS `add1`,`b`.`add2` AS `add2`,`b`.`add3` AS `add3`,`b`.`telephone` AS `telephone`,`b`.`email` AS `email` from (`general_ledger` `a` left join `address` `b` on((`a`.`general_ledger_id` = `b`.`reference_id`))) where ((`b`.`table_name` = 'general_ledger') and (`b`.`default_address` = 'Y'));


DROP TABLE IF EXISTS `general_ledger_view`;
DROP VIEW IF EXISTS `general_ledger_view`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `general_ledger_view` AS select `a`.`branch_id` AS `branch_id`,`a`.`general_ledger_id` AS `general_ledger_id`,concat(`a`.`general_ledger_name`,' ( ',`b`.`account_group_name`,' )') AS `general_ledger_name`,concat(`a`.`opening_amount`,' ',ucase(`a`.`debit_credit_id`),'r.') AS `opening`,`a`.`alias` AS `alias` from (`general_ledger` `a` join `account_group` `b` on((`a`.`account_group_id` = `b`.`account_group_id`)));

DROP TABLE IF EXISTS `item_view`;
DROP VIEW IF EXISTS `item_view`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `item_view` AS select `a`.`branch_id` AS `branch_id`,`a`.`item_id` AS `item_id`,`a`.`item_name` AS `item_name`,`a`.`hsn` AS `hsn`,`a`.`item_group_id` AS `item_group_id`,`c`.`item_group_name` AS `item_group_name`,`a`.`unit_id` AS `unit_id`,`b`.`unit_name` AS `unit_name`,ucase(`a`.`io`) AS `io` from (`item` `a` join (`unit` `b` join `item_group` `c`) on(((`a`.`unit_id` = `b`.`unit_id`) and (`a`.`item_group_id` = `c`.`item_group_id`))));

