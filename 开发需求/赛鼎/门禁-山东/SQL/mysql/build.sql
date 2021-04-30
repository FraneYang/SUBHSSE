SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `t_bd_authgroup`;
CREATE TABLE `t_bd_authgroup` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `AuthGroupName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Remark` text CHARACTER SET utf8,
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


INSERT INTO `t_bd_authgroup` VALUES ('1', '全部', null, '2019-09-16 18:54:06');


DROP TABLE IF EXISTS `t_bd_authgroup_control`;
CREATE TABLE `t_bd_authgroup_control` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `AuthGroup_Key` bigint(20) DEFAULT NULL,
  `ControlNumber` int(11) DEFAULT NULL,
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`P_Key`),
  KEY `authGroupControl_authGroup_authGroupKey` (`AuthGroup_Key`),
  KEY `authGroupControl_control_controlNumber` (`ControlNumber`),
  CONSTRAINT `authGroupControl_authGroup_authGroupKey` FOREIGN KEY (`AuthGroup_Key`) REFERENCES `t_bd_authgroup` (`P_Key`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `authGroupControl_control_controlNumber` FOREIGN KEY (`ControlNumber`) REFERENCES `t_bd_control` (`ControlNumber`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


INSERT INTO `t_bd_authgroup_control` VALUES ('1', '1', '10001', '2019-09-18 11:50:11');


DROP TABLE IF EXISTS `t_bd_cardrecords`;
CREATE TABLE `t_bd_cardrecords` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `EntranceControlNumber` int(11) DEFAULT NULL,
  `PersonIDCard` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EntranceTime` datetime DEFAULT NULL,
  `Remark` text CHARACTER SET utf8,
  `EntranceImagePath` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `EntranceControlName` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `LeaveControlNumber` int(11) DEFAULT NULL,
  `LeaveControlName` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `LeaveTime` datetime DEFAULT NULL,
  `LeaveImagePath` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `EntranceOperatorName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `LeaveOperatorName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_cardrecords_parkin`;
CREATE TABLE `t_bd_cardrecords_parkin` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `EntranceControlNumber` int(11) DEFAULT NULL,
  `PersonIDCard` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EntranceTime` datetime DEFAULT NULL,
  `Remark` text CHARACTER SET utf8,
  `EntranceImagePath` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `EntranceControlName` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `LeaveControlNumber` int(11) DEFAULT NULL,
  `LeaveControlName` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `LeaveTime` datetime DEFAULT NULL,
  `LeaveImagePath` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `EntranceOperatorName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `LeaveOperatorName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_cardrecords_parkout`;
CREATE TABLE `t_bd_cardrecords_parkout` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `EntranceControlNumber` int(11) DEFAULT NULL,
  `PersonIDCard` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EntranceTime` datetime DEFAULT NULL,
  `Remark` text CHARACTER SET utf8,
  `EntranceImagePath` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `EntranceControlName` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `LeaveControlNumber` int(11) DEFAULT NULL,
  `LeaveControlName` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `LeaveTime` datetime DEFAULT NULL,
  `LeaveImagePath` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `EntranceOperatorName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `LeaveOperatorName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `StopTime` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_config`;
CREATE TABLE `t_bd_config` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `ConfigName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ConfigValue` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `IsEnable` int(255) DEFAULT '1',
  `ConfigCode` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;


INSERT INTO `t_bd_config` VALUES ('1', '异常日志文件位置', '默认路径', '1', 'ExceptionPath');
INSERT INTO `t_bd_config` VALUES ('2', '异常日志文件隔几天清理一次', '6', '1', 'ClearExceptionTime');
INSERT INTO `t_bd_config` VALUES ('3', 'IP地址', '192.168.1.139', '1', 'ServerIP');
INSERT INTO `t_bd_config` VALUES ('4', '端口', '26680', '1', 'ServerPort');
INSERT INTO `t_bd_config` VALUES ('5', '服务器日志文件位置', '默认路径', '1', 'ServerLogPath');
INSERT INTO `t_bd_config` VALUES ('6', '人员图片保存路径', '默认路径', '1', 'PersonPhotoImagePath');
INSERT INTO `t_bd_config` VALUES ('7', '共享文件夹路径', 'D://BackupPhoto', '1', 'SharedFolderPath');
INSERT INTO `t_bd_config` VALUES ('8', '服务器日志文件隔几天清理一次', '6', '1', 'ClearServerTime');
INSERT INTO `t_bd_config` VALUES ('9', '自动更新白名单', '是', '0', 'AutoWhiteList');
INSERT INTO `t_bd_config` VALUES ('10', '智能卡类型', '1', '1', 'ICCardType');
INSERT INTO `t_bd_config` VALUES ('11', '上传服务器IP', '47.106.172.173', '1', 'UploadServerIP');
INSERT INTO `t_bd_config` VALUES ('12', '上传服务器端口', '26001', '1', 'UploadServerPort');
INSERT INTO `t_bd_config` VALUES ('13', '系统场地编号', '10000', '1', 'SysNumber');
INSERT INTO `t_bd_config` VALUES ('14', '是否开启上传服务器', '是', '0', 'IsUpload');
INSERT INTO `t_bd_config` VALUES ('15', '是否开启自动获取IP', '是', '1', 'IsAutoGetIP');
INSERT INTO `t_bd_config` VALUES ('16', '是否开启自动启动本地服务', '否', '0', 'IsLocalServer');
INSERT INTO `t_bd_config` VALUES ('17', '是否开启自动连接云端服务', '否', '0', 'IsYunServer');
INSERT INTO `t_bd_config` VALUES ('18', '默认设置几路视频', '4', '1', 'SetVideo');
INSERT INTO `t_bd_config` VALUES ('19', '是否开启开机自启', '是', '0', 'IsAutoStart');


DROP TABLE IF EXISTS `t_bd_control`;
CREATE TABLE `t_bd_control` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `ControlName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Park_Key` bigint(20) DEFAULT NULL,
  `ControlType` int(255) DEFAULT NULL,
  `ControlIP` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ComputerName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Remark` text CHARACTER SET utf8,
  `CannelNumber` int(11) DEFAULT NULL,
  `ControlNumber` int(11) DEFAULT NULL,
  `State` int(255) DEFAULT '0',
  `OnlineTime` datetime DEFAULT NULL,
  `CommType` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`P_Key`),
  KEY `ControlNumber` (`ControlNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


INSERT INTO `t_bd_control` VALUES ('1', '192.168.1.189', null, '1', '192.168.1.189', 'DESKTOP-N9V91VR', null, '1', '10001', '0', '2019-09-17 16:38:27', '进');

DROP TABLE IF EXISTS `t_bd_controlconfig`;
CREATE TABLE `t_bd_controlconfig` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `Control_Key` bigint(20) DEFAULT NULL,
  `FillLight` int(255) DEFAULT NULL,
  `MatchValue` int(50) DEFAULT '50',
  `QualityValue` int(50) DEFAULT '50',
  `ControlNumber` int(11) DEFAULT NULL,
  `ImageUploadType` int(255) DEFAULT '0',
  `TimeInterval` int(10) DEFAULT NULL,
  `FaceSwitch` int(255) DEFAULT '1',
  `WriteIo` int(255) DEFAULT '1',
  `WriteVolue` int(255) DEFAULT '0',
  `BlackIo` int(255) DEFAULT '0',
  `BlackVolue` int(255) DEFAULT '1',
  `LightOpenTime` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `LightCloseTime` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `StrangerIo` int(255) DEFAULT '0',
  `StrangerVolue` int(255) DEFAULT '1',
  PRIMARY KEY (`P_Key`),
  KEY `Control_Key` (`Control_Key`),
  CONSTRAINT `t_bd_controlconfig_ibfk_1` FOREIGN KEY (`Control_Key`) REFERENCES `t_bd_control` (`P_Key`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_control_category`;
CREATE TABLE `t_bd_control_category` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `CategoryNumber` int(11) DEFAULT NULL,
  `CategoryName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `t_bd_control_category` VALUES ('1', '1', 'A系列');
INSERT INTO `t_bd_control_category` VALUES ('2', '2', 'B系列');
INSERT INTO `t_bd_control_category` VALUES ('3', '3', 'C系列');
INSERT INTO `t_bd_control_category` VALUES ('4', '4', 'D系列');


DROP TABLE IF EXISTS `t_bd_control_type`;
CREATE TABLE `t_bd_control_type` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `CategoryNumber` int(11) DEFAULT NULL,
  `TypeName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ServerType` int(255) DEFAULT NULL,
  `Remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;


INSERT INTO `t_bd_control_type` VALUES ('1', '1', 'IFC6020A', '1', '智小智');
INSERT INTO `t_bd_control_type` VALUES ('2', '1', 'IFC6020B', '1', '智小智');
INSERT INTO `t_bd_control_type` VALUES ('3', '1', 'IFC6021A', '2', '华夏灵目二代');
INSERT INTO `t_bd_control_type` VALUES ('4', '1', 'IFC6021B', '2', '华夏灵目二代');
INSERT INTO `t_bd_control_type` VALUES ('5', '1', 'IFC6022A', '3', '智慧芯/华夏灵目一代');
INSERT INTO `t_bd_control_type` VALUES ('6', '1', 'IFC6022B', '3', '智慧芯/华夏灵目一代');
INSERT INTO `t_bd_control_type` VALUES ('7', '2', 'IFC6011A', '4', '华夏慕颜');
INSERT INTO `t_bd_control_type` VALUES ('8', '2', 'IFC6012B', '5', '马飞达');
INSERT INTO `t_bd_control_type` VALUES ('9', '3', 'IDC7115A', '4', '华夏慕颜');
INSERT INTO `t_bd_control_type` VALUES ('10', '3', 'IDC7115B', '4', '华夏慕颜');
INSERT INTO `t_bd_control_type` VALUES ('11', '3', 'IDC7115C', '4', '华夏慕颜');
INSERT INTO `t_bd_control_type` VALUES ('12', '4', 'IFC6010A', '4', '华夏慕颜');
INSERT INTO `t_bd_control_type` VALUES ('13', '4', 'IFC6010B', '4', '华夏慕颜');
INSERT INTO `t_bd_control_type` VALUES ('14', '4', 'IFC6010C', '4', '华夏慕颜');
INSERT INTO `t_bd_control_type` VALUES ('15', '2', 'IFC6013C', '5', '宇泛');
INSERT INTO `t_bd_control_type` VALUES ('16', '1', 'IFC6023A', '7', '华安');
INSERT INTO `t_bd_control_type` VALUES ('17', '1', 'IFC6024A', '6', '海清');
INSERT INTO `t_bd_control_type` VALUES ('18', '1', 'IFC6025A', '8', '芊熠');


DROP TABLE IF EXISTS `t_bd_data`;
CREATE TABLE `t_bd_data` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `DataType` int(255) DEFAULT NULL,
  `DataName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `DataValue` int(255) DEFAULT NULL,
  `Remark` text CHARACTER SET utf8,
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;


INSERT INTO `t_bd_data` VALUES ('1', '1', '主菜单', '1', null, '2019-09-09 14:19:20');
INSERT INTO `t_bd_data` VALUES ('2', '1', '子菜单', '2', null, '2019-09-09 14:19:24');
INSERT INTO `t_bd_data` VALUES ('3', '1', '功能', '3', null, '2019-09-09 14:19:26');
INSERT INTO `t_bd_data` VALUES ('4', '3', '水泥工', '1', null, '2019-09-09 14:19:27');
INSERT INTO `t_bd_data` VALUES ('5', '3', '监工', '2', null, '2019-09-09 14:19:29');


DROP TABLE IF EXISTS `t_bd_department`;
CREATE TABLE `t_bd_department` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `Parent_Key` bigint(20) DEFAULT NULL,
  `DepNo` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `DepName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `DepSName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `DepLevel` int(255) DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `WeaveCount` int(255) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `DepFunction` text CHARACTER SET utf8,
  `DepAuthority` text CHARACTER SET utf8,
  `DepDuty` text CHARACTER SET utf8,
  `Manager` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `SetTemp` int(255) DEFAULT NULL,
  `Remark` text CHARACTER SET utf8,
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsDelete` int(255) DEFAULT '0',
  `DeleteTime` datetime DEFAULT NULL,
  `DeleteUserName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `DepInterNumber` bigint(20) DEFAULT '0',
  PRIMARY KEY (`P_Key`),
  KEY `dep_dep_parentKey` (`Parent_Key`),
  CONSTRAINT `dep_dep_parentKey` FOREIGN KEY (`Parent_Key`) REFERENCES `t_bd_department` (`P_Key`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


INSERT INTO `t_bd_department` VALUES ('1', null, null, '默认部门', null, null, null, null, null, null, null, null, null, null, null, '2019-09-16 20:20:18', '0', null, null, '0');

DROP TABLE IF EXISTS `t_bd_departmentlog`;
CREATE TABLE `t_bd_departmentlog` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `Parent_Key` bigint(20) DEFAULT NULL,
  `DepNo` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `DepName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `DepSName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `DepLevel` int(255) DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `WeaveCount` int(255) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `DepFunction` text CHARACTER SET utf8,
  `DepAuthority` text CHARACTER SET utf8,
  `DepDuty` text CHARACTER SET utf8,
  `Manager` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `SetTemp` int(255) DEFAULT NULL,
  `Remark` text CHARACTER SET utf8,
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsDelete` int(255) DEFAULT '0',
  `DeleteTime` datetime DEFAULT NULL,
  `DeleteUserName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `DepInterNumber` bigint(20) DEFAULT '0',
  `OpType` int(255) DEFAULT NULL,
  `OperatorName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `OpTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `UpSelfPlat` int(255) DEFAULT '0',
  `OperatorType` tinyint(255) DEFAULT '1',
  PRIMARY KEY (`P_Key`),
  KEY `dep_dep_parentKey` (`Parent_Key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


INSERT INTO `t_bd_departmentlog` VALUES ('1', null, null, '默认部门', null, null, null, null, null, null, null, null, null, null, null, '2019-09-16 20:20:31', '0', null, null, '0', '1', 'admin', '2019-09-16 20:20:31', '0', '1');


DROP TABLE IF EXISTS `t_bd_exception`;
CREATE TABLE `t_bd_exception` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `Content` text CHARACTER SET utf8,
  `CreateTime` datetime DEFAULT NULL,
  `OperatorUserKey` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`P_Key`),
  KEY `CreateTime` (`CreateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_holiday`;
CREATE TABLE `t_bd_holiday` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `HolidayName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `Remark` text CHARACTER SET utf8,
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_inoutrecord_log`;
CREATE TABLE `t_bd_inoutrecord_log` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `PersonName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PersonSex` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `PersonIDCardCode` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `WorkTypeName` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `DepName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ControlNumber` bigint(20) DEFAULT NULL,
  `ControlName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `RecordTime` datetime DEFAULT NULL,
  `ImagePath` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CommType` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `UploadType` int(255) DEFAULT '0',
  `UploadTV` int(255) DEFAULT '0',
  `Type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PersonNation` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PersonBirthday` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PersonAddress` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `PersonIssuingDept` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `IDBeginDate` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `IDEndDate` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`P_Key`),
  KEY `log_PersonIDCardCode` (`PersonIDCardCode`) USING BTREE,
  KEY `log_WorkTypeName` (`WorkTypeName`) USING BTREE,
  KEY `log_ControlNumber` (`ControlNumber`) USING BTREE,
  KEY `log_RecordTime` (`RecordTime`) USING BTREE,
  KEY `log_Type` (`Type`) USING BTREE,
  KEY `log_UploadTV` (`UploadTV`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_ledinmethod`;
CREATE TABLE `t_bd_ledinmethod` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `datavalue` int(255) DEFAULT NULL,
  `dataname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;


INSERT INTO `t_bd_ledinmethod` VALUES ('1', '0', '随机');
INSERT INTO `t_bd_ledinmethod` VALUES ('2', '1', '立即显示');
INSERT INTO `t_bd_ledinmethod` VALUES ('3', '2', '左滚显示');
INSERT INTO `t_bd_ledinmethod` VALUES ('4', '3', '上滚显示');
INSERT INTO `t_bd_ledinmethod` VALUES ('5', '4', '右滚显示');
INSERT INTO `t_bd_ledinmethod` VALUES ('6', '5', '下滚显示');
INSERT INTO `t_bd_ledinmethod` VALUES ('7', '6', '连续左滚显示');
INSERT INTO `t_bd_ledinmethod` VALUES ('8', '7', '连续下滚显示');
INSERT INTO `t_bd_ledinmethod` VALUES ('9', '8', '中间向上下展开');
INSERT INTO `t_bd_ledinmethod` VALUES ('10', '9', '中间向两边展开');
INSERT INTO `t_bd_ledinmethod` VALUES ('11', '10', '中间向四周展开');
INSERT INTO `t_bd_ledinmethod` VALUES ('12', '11', '从右向左移入');
INSERT INTO `t_bd_ledinmethod` VALUES ('13', '12', '从左向右移入');
INSERT INTO `t_bd_ledinmethod` VALUES ('14', '13', '从左向右展开');
INSERT INTO `t_bd_ledinmethod` VALUES ('15', '14', '从右向左展开');
INSERT INTO `t_bd_ledinmethod` VALUES ('16', '15', '从右上角移入');
INSERT INTO `t_bd_ledinmethod` VALUES ('17', '16', '从右下角移入');
INSERT INTO `t_bd_ledinmethod` VALUES ('18', '17', '从左上角移入');
INSERT INTO `t_bd_ledinmethod` VALUES ('19', '18', '从左下角移入');
INSERT INTO `t_bd_ledinmethod` VALUES ('20', '19', '从上向下移入');
INSERT INTO `t_bd_ledinmethod` VALUES ('21', '20', '从下向上移入');
INSERT INTO `t_bd_ledinmethod` VALUES ('22', '21', '横向百叶窗');
INSERT INTO `t_bd_ledinmethod` VALUES ('23', '22', '纵向百叶窗');


DROP TABLE IF EXISTS `t_bd_ledleaf`;
CREATE TABLE `t_bd_ledleaf` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `LEDScreenKey` bigint(20) DEFAULT NULL,
  `LeafNunber` int(255) DEFAULT NULL,
  `LeafWait` int(255) DEFAULT NULL,
  `LEDRows` int(255) DEFAULT NULL,
  PRIMARY KEY (`P_Key`),
  KEY `LEDScreenKey` (`LEDScreenKey`),
  CONSTRAINT `t_bd_ledleaf_ibfk_1` FOREIGN KEY (`LEDScreenKey`) REFERENCES `t_bd_ledscreen` (`P_Key`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_ledleafrow`;
CREATE TABLE `t_bd_ledleafrow` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `LEDScreenKey` bigint(20) DEFAULT NULL,
  `LEDLeaf` int(255) NOT NULL,
  `RowIndex` int(255) NOT NULL,
  `RowText` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `TextFont` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `fontsize` int(11) DEFAULT NULL,
  `spacing` int(255) DEFAULT '0',
  `ShowWatchEvent` int(255) DEFAULT '0',
  `defLeft` int(255) DEFAULT '0',
  `defTop` int(255) DEFAULT '0',
  `defWidth` int(11) DEFAULT '0',
  `defHeight` int(11) DEFAULT '0',
  `ShowTimeClock` int(11) DEFAULT '1',
  PRIMARY KEY (`P_Key`,`LEDLeaf`,`RowIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_ledrow`;
CREATE TABLE `t_bd_ledrow` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `LED_Key` bigint(20) DEFAULT NULL,
  `Content` text CHARACTER SET utf8,
  `Remark` text CHARACTER SET utf8,
  `LEDFontColor` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Number` int(11) DEFAULT NULL,
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_ledscreen`;
CREATE TABLE `t_bd_ledscreen` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `LEDName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `LEDIP` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `LEDPort` int(255) DEFAULT NULL,
  `LEDNumber` int(11) DEFAULT NULL,
  `Remark` text CHARACTER SET utf8,
  `LEDState` int(255) DEFAULT '1',
  `LEDModel` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `DefaultTemplate` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `LEDWidth` int(11) DEFAULT NULL,
  `LEDHeight` int(11) DEFAULT NULL,
  `LEDTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `LEDType` int(255) DEFAULT '0',
  `ControlType` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ShowNotice` int(255) DEFAULT '0',
  `NoticeWidth` int(11) DEFAULT '0',
  `NoticeHeight` int(11) DEFAULT '0',
  `NoticeContent` text CHARACTER SET utf8,
  `NoticeFont` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `NoticeFontSize` int(11) DEFAULT '12',
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


INSERT INTO `t_bd_ledscreen` VALUES ('1', '电视机', '192.168.1.1', '9999', '0', '1', '1', '电视机固定模板', '', '160', '80', '', '1', '', '0', '0', '0', null, null, '12');


DROP TABLE IF EXISTS `t_bd_loginlog`;
CREATE TABLE `t_bd_loginlog` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `HostName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_mafeidaconfig`;
CREATE TABLE `t_bd_mafeidaconfig` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `Control_Key` bigint(20) DEFAULT NULL,
  `ControlNumber` int(11) DEFAULT NULL,
  `companyName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `displayModType` int(255) DEFAULT '1',
  `displayModContent` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `delayTimeForCloseDoor` int(11) DEFAULT '500',
  `identifyDistance` int(11) DEFAULT '0',
  `identifyScores` int(255) DEFAULT '80',
  `saveIdentifyTime` int(11) DEFAULT NULL,
  `recRank` int(255) DEFAULT '1',
  `multiplayerDetection` int(255) DEFAULT '1',
  `wg` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `closeTimeStart` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `closeTimeEnd` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `ttsModType` int(255) DEFAULT '1',
  `ttsModContent` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `recStrangerType` int(255) DEFAULT '1',
  `recStrangerTimesThreshold` int(11) DEFAULT '3',
  `ttsModStrangerType` int(255) DEFAULT '1',
  `ttsModStrangerContent` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `recModeFaceEnable` int(255) DEFAULT '2',
  `recModeCardEnable` int(255) DEFAULT '1',
  `recModeCardIntf` int(255) DEFAULT '1',
  `recModeCardFaceEnable` int(255) DEFAULT '1',
  `recModeCardFaceIntf` int(255) DEFAULT '1',
  `recModeIdCardFaceEnable` int(255) DEFAULT '1',
  `recModeIdCardFaceIntf` int(255) DEFAULT '2',
  `recModeIdCardFaceHardware` int(255) DEFAULT '1',
  `recFaceCardValue` int(255) DEFAULT '55',
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_offlinerecord`;
CREATE TABLE `t_bd_offlinerecord` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `PersonName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `PersonSex` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `PersonIDCardCode` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ControlNumber` bigint(20) DEFAULT NULL,
  `ControlName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `RecordTime` datetime DEFAULT NULL,
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_opendoor_log`;
CREATE TABLE `t_bd_opendoor_log` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `AssociateKey` bigint(20) DEFAULT NULL,
  `ControlNumber` int(11) DEFAULT NULL,
  `OpenedType` int(255) DEFAULT NULL,
  `OperateState` int(255) DEFAULT '0',
  `OperateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `OperatorName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ControlName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ControlIP` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_park`;
CREATE TABLE `t_bd_park` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `ParkName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Parent_Key` bigint(20) DEFAULT NULL,
  `Remark` text CHARACTER SET utf8,
  `CreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`P_Key`),
  KEY `park_park_parentKey` (`Parent_Key`),
  CONSTRAINT `park_park_parentKey` FOREIGN KEY (`Parent_Key`) REFERENCES `t_bd_park` (`P_Key`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_permission`;
CREATE TABLE `t_bd_permission` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `PermissionName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Type` int(255) DEFAULT NULL,
  `Remark` text CHARACTER SET utf8,
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `Parent_Key` bigint(255) DEFAULT NULL,
  `IsDelete` int(255) DEFAULT '0',
  `Icon` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `OrderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`P_Key`),
  KEY `permission_permission_parentKey1` (`Parent_Key`),
  CONSTRAINT `permission_permission_parentKey1` FOREIGN KEY (`Parent_Key`) REFERENCES `t_bd_permission` (`P_Key`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;


INSERT INTO `t_bd_permission` VALUES ('1', '系统设置', '1', null, '2019-09-09 20:06:48', null, '0', 'system.png', '2');
INSERT INTO `t_bd_permission` VALUES ('2', '硬件管理', '1', null, '2019-09-09 20:06:48', null, '0', 'hardware.png', '3');
INSERT INTO `t_bd_permission` VALUES ('3', '人员管理', '1', null, '2019-09-09 20:06:49', null, '0', 'whiteperson.png', '4');
INSERT INTO `t_bd_permission` VALUES ('4', '统计报表', '1', null, '2019-09-09 20:06:49', null, '0', 'reports.png', '5');
INSERT INTO `t_bd_permission` VALUES ('5', '用户管理', '1', null, '2019-09-09 20:06:49', null, '0', 'user.png', '6');
INSERT INTO `t_bd_permission` VALUES ('6', '日志管理', '1', null, '2019-09-09 20:06:49', null, '0', 'log.png', '7');
INSERT INTO `t_bd_permission` VALUES ('7', '关于我们', '1', null, '2019-09-09 20:06:49', null, '0', 'about.png', '8');
INSERT INTO `t_bd_permission` VALUES ('8', '系统配置', '2', null, '2019-09-09 20:06:50', '1', '0', '', '1');
INSERT INTO `t_bd_permission` VALUES ('9', '设备管理', '2', null, '2019-09-09 20:06:50', '2', '0', '', '1');
INSERT INTO `t_bd_permission` VALUES ('10', '显示屏管理', '2', null, '2019-09-09 20:06:50', '2', '0', '', '2');
INSERT INTO `t_bd_permission` VALUES ('11', '工种管理', '2', null, '2019-09-09 20:06:50', '3', '0', '', '1');
INSERT INTO `t_bd_permission` VALUES ('12', '人员管理', '2', null, '2019-09-09 20:06:50', '3', '0', '', '2');
INSERT INTO `t_bd_permission` VALUES ('13', '人员下发', '2', null, '2019-09-09 20:06:51', '3', '0', '', '3');
INSERT INTO `t_bd_permission` VALUES ('14', '场内记录', '2', null, '2019-09-09 20:06:51', '4', '0', '', '1');
INSERT INTO `t_bd_permission` VALUES ('15', '进出记录', '2', null, '2019-09-09 20:06:51', '4', '0', '', '2');
INSERT INTO `t_bd_permission` VALUES ('16', '设备白名单', '2', null, '2019-09-09 20:06:51', '4', '0', '', '4');
INSERT INTO `t_bd_permission` VALUES ('17', '设备脱机记录', '2', null, '2019-09-09 20:06:51', '4', '0', '', '5');
INSERT INTO `t_bd_permission` VALUES ('18', '用户管理', '2', null, '2019-09-09 20:06:52', '5', '0', '', '1');
INSERT INTO `t_bd_permission` VALUES ('19', '开关闸日志', '2', null, '2019-09-09 20:06:52', '6', '0', '', '1');
INSERT INTO `t_bd_permission` VALUES ('20', '登录日志', '2', null, '2019-09-09 20:06:52', '6', '0', '', '2');
INSERT INTO `t_bd_permission` VALUES ('21', '异常日志', '2', null, '2019-09-09 20:06:52', '6', '0', '', '3');
INSERT INTO `t_bd_permission` VALUES ('22', '注册软件', '2', null, '2019-09-09 20:06:52', '7', '0', '', '1');
INSERT INTO `t_bd_permission` VALUES ('23', '更新日志', '2', null, '2019-09-09 20:06:53', '7', '0', '', '2');
INSERT INTO `t_bd_permission` VALUES ('24', '软件版本', '2', null, '2019-09-09 20:06:53', '7', '0', '', '3');
INSERT INTO `t_bd_permission` VALUES ('25', '版本更新', '2', null, '2019-09-09 20:06:54', '7', '0', '', '4');
INSERT INTO `t_bd_permission` VALUES ('27', '首页', '1', '', '2019-08-23 09:52:55', null, '0', 'home.png', '1');
INSERT INTO `t_bd_permission` VALUES ('28', '设备添加', '3', '', '2019-08-23 11:31:40', '9', '0', '', '1');
INSERT INTO `t_bd_permission` VALUES ('29', '设备修改', '3', '', '2019-08-23 11:31:58', '9', '0', '', '2');
INSERT INTO `t_bd_permission` VALUES ('30', '设备删除', '3', '', '2019-08-23 11:32:07', '9', '0', '', '3');
INSERT INTO `t_bd_permission` VALUES ('31', '清空设备白名单', '3', '', '2019-08-23 11:32:52', '9', '0', '', '4');
INSERT INTO `t_bd_permission` VALUES ('32', '设备开闸', '3', '', '2019-08-23 11:33:04', '9', '0', '', '5');
INSERT INTO `t_bd_permission` VALUES ('33', '设备关闸', '3', '', '2019-08-23 11:33:16', '9', '0', '', '6');
INSERT INTO `t_bd_permission` VALUES ('34', '权限组添加', '3', '', '2019-08-23 15:54:35', '9', '0', '', '7');
INSERT INTO `t_bd_permission` VALUES ('35', '权限组修改', '3', '', '2019-08-23 15:54:48', '9', '0', '', '8');
INSERT INTO `t_bd_permission` VALUES ('36', '权限组删除', '3', '', '2019-08-23 15:55:02', '9', '0', '', '9');
INSERT INTO `t_bd_permission` VALUES ('37', '显示屏添加', '3', '', '2019-08-23 19:17:40', '10', '0', '', '1');
INSERT INTO `t_bd_permission` VALUES ('38', '显示屏修改', '3', '', '2019-08-23 19:17:51', '10', '0', '', '2');
INSERT INTO `t_bd_permission` VALUES ('39', '显示屏删除', '3', '', '2019-08-23 19:18:04', '10', '0', '', '3');
INSERT INTO `t_bd_permission` VALUES ('40', '工种添加', '3', '', '2019-08-24 10:05:47', '11', '0', '', '1');
INSERT INTO `t_bd_permission` VALUES ('41', '工种修改', '3', '', '2019-08-24 10:06:12', '11', '0', '', '2');
INSERT INTO `t_bd_permission` VALUES ('42', '工种删除', '3', '', '2019-08-24 10:06:26', '11', '0', '', '3');
INSERT INTO `t_bd_permission` VALUES ('43', '进出日志', '2', '', '2019-08-24 10:53:23', '4', '0', '', '3');
INSERT INTO `t_bd_permission` VALUES ('44', '进出日志导出', '3', '', '2019-08-26 11:49:28', '43', '0', '', '1');
INSERT INTO `t_bd_permission` VALUES ('45', '进出日志删除', '3', '', '2019-08-26 11:49:41', '43', '0', '', '2');
INSERT INTO `t_bd_permission` VALUES ('46', '场内记录导出', '3', '', '2019-08-26 14:50:18', '14', '0', '', '1');
INSERT INTO `t_bd_permission` VALUES ('47', '场内记录删除', '3', '', '2019-08-26 14:50:32', '14', '0', '', '2');
INSERT INTO `t_bd_permission` VALUES ('48', '进出记录导出', '3', '', '2019-08-26 16:04:18', '15', '0', '', '1');
INSERT INTO `t_bd_permission` VALUES ('49', '进出记录删除', '3', '', '2019-08-26 16:04:38', '15', '0', '', '2');
INSERT INTO `t_bd_permission` VALUES ('50', '用户添加', '3', '', '2019-08-27 14:37:15', '18', '0', '', '1');
INSERT INTO `t_bd_permission` VALUES ('51', '用户修改', '3', '', '2019-08-27 14:37:31', '18', '0', '', '2');
INSERT INTO `t_bd_permission` VALUES ('52', '用户删除', '3', '', '2019-08-27 14:37:51', '18', '0', '', '3');
INSERT INTO `t_bd_permission` VALUES ('53', '分配角色', '3', '', '2019-08-27 14:38:16', '18', '0', '', '4');
INSERT INTO `t_bd_permission` VALUES ('54', '修改密码', '3', '', '2019-08-27 14:38:29', '18', '0', '', '5');
INSERT INTO `t_bd_permission` VALUES ('55', '角色添加', '3', '', '2019-08-27 14:38:50', '18', '0', '', '6');
INSERT INTO `t_bd_permission` VALUES ('56', '角色修改', '3', '', '2019-08-27 14:39:05', '18', '0', '', '7');
INSERT INTO `t_bd_permission` VALUES ('57', '角色删除', '3', '', '2019-08-27 14:39:16', '18', '0', '', '8');
INSERT INTO `t_bd_permission` VALUES ('58', '分配权限', '3', '', '2019-08-27 14:39:44', '18', '0', '', '9');
INSERT INTO `t_bd_permission` VALUES ('59', '部门添加', '3', '', '2019-08-28 15:17:49', '12', '0', '', '1');
INSERT INTO `t_bd_permission` VALUES ('60', '部门修改', '3', '', '2019-08-28 15:18:01', '12', '0', '', '2');
INSERT INTO `t_bd_permission` VALUES ('61', '部门删除', '3', '', '2019-08-28 15:18:10', '12', '0', '', '3');
INSERT INTO `t_bd_permission` VALUES ('62', '人员添加', '3', '', '2019-08-28 15:18:27', '12', '0', '', '4');
INSERT INTO `t_bd_permission` VALUES ('63', '人员修改', '3', '', '2019-08-28 15:18:40', '12', '0', '', '5');
INSERT INTO `t_bd_permission` VALUES ('64', '人员删除', '3', '', '2019-08-28 15:18:54', '12', '0', '', '6');
INSERT INTO `t_bd_permission` VALUES ('65', '人员批量导入', '3', '', '2019-08-28 15:19:08', '12', '0', '', '7');
INSERT INTO `t_bd_permission` VALUES ('66', '分配部门', '3', '', '2019-08-28 15:19:33', '12', '0', '', '8');
INSERT INTO `t_bd_permission` VALUES ('67', '更改有效期', '3', '', '2019-08-28 15:19:46', '12', '0', '', '9');
INSERT INTO `t_bd_permission` VALUES ('68', '导出选中', '3', '', '2019-08-28 15:20:01', '12', '0', '', '10');
INSERT INTO `t_bd_permission` VALUES ('69', '导出全部', '3', '', '2019-08-28 15:20:13', '12', '0', '', '11');
INSERT INTO `t_bd_permission` VALUES ('70', '离职', '3', '', '2019-08-28 15:20:24', '12', '0', '', '12');
INSERT INTO `t_bd_permission` VALUES ('71', '分配权限组', '3', '', '2019-08-28 15:46:53', '12', '0', '', '13');
INSERT INTO `t_bd_permission` VALUES ( '314','人员下发日志', '2', '', '2019-11-26 09:55:12.580', '6', '0', '', '4');



DROP TABLE IF EXISTS `t_bd_person`;
CREATE TABLE `t_bd_person` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `Dep_Key` bigint(20) DEFAULT NULL,
  `PersonName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PersonSex` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `PersonPhone` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PersonBirthday` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PersonIDCard` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PersonComeDate` datetime DEFAULT NULL,
  `PersonOutDate` datetime DEFAULT NULL,
  `PersonPhoto` longblob,
  `Remark` text CHARACTER SET utf8,
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `AuthGroup_Key` bigint(20) DEFAULT NULL,
  `PersonTitle` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `IsDelete` int(255) DEFAULT '0',
  `DeleteTime` datetime DEFAULT NULL,
  `DeleteUserName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PersonCardPhoto` longblob,
  `PersonInterNumber` bigint(20) DEFAULT '0',
  `PersonPermission_Key` bigint(20) DEFAULT NULL,
  `IsDeparture` int(255) DEFAULT '0',
  `WorkType` int(255) DEFAULT NULL,
  `WhiteListState` int(255) DEFAULT '0',
  `ICCardNumber` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `X` int(255) DEFAULT NULL,
  `Y` int(255) DEFAULT NULL,
  `W` int(255) DEFAULT NULL,
  `H` int(255) DEFAULT NULL,
  `PersonAddress` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `PersonNation` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PersonIssuingDept` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `IDBeginDate` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `IDEndDate` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `UploadType` int(11) DEFAULT '0',
  `RandomKey` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`P_Key`),
  KEY `person_authgroup_authGroupKey` (`AuthGroup_Key`),
  KEY `person_dep_depKey` (`Dep_Key`),
  KEY `person_personPermission_personpermissionKey` (`PersonPermission_Key`),
  CONSTRAINT `person_authgroup_authGroupKey` FOREIGN KEY (`AuthGroup_Key`) REFERENCES `t_bd_authgroup` (`P_Key`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `person_dep_depKey` FOREIGN KEY (`Dep_Key`) REFERENCES `t_bd_department` (`P_Key`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `person_personPermission_personpermissionKey` FOREIGN KEY (`PersonPermission_Key`) REFERENCES `t_bd_person_permission` (`P_Key`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_personlog`;
CREATE TABLE `t_bd_personlog` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `DepInterNomber` bigint(20) DEFAULT NULL,
  `PersonName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PersonSex` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `PersonPhone` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PersonBirthday` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PersonIDCard` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PersonComeDate` datetime DEFAULT NULL,
  `PersonOutDate` datetime DEFAULT NULL,
  `PersonPhoto` longblob,
  `Remark` text CHARACTER SET utf8,
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `AuthGroupInterNomber` bigint(20) DEFAULT NULL,
  `PersonTitle` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `IsDelete` int(255) DEFAULT '0',
  `DeleteTime` datetime DEFAULT NULL,
  `DeleteUserName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PersonCardPhoto` longblob,
  `PersonInterNomber` bigint(20) DEFAULT '0',
  `IsDeparture` int(255) DEFAULT '0',
  `WorkType` int(255) DEFAULT NULL,
  `WhiteListState` int(255) DEFAULT '0',
  `ICCardNumber` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `X` int(255) DEFAULT NULL,
  `Y` int(255) DEFAULT NULL,
  `W` int(255) DEFAULT NULL,
  `H` int(255) DEFAULT NULL,
  `PersonAddress` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `PersonNation` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PersonIssuingDept` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `IDBeginDate` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `IDEndDate` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `RandomKey` bigint(20) DEFAULT NULL,
  `OpType` int(255) DEFAULT NULL,
  `OperatorName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `OpTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `UpSelfPlat` int(255) DEFAULT '0',
  `OperatorType` int(255) DEFAULT NULL,
  `ValidTimeStart` datetime DEFAULT NULL,
  `ValidTimeEnd` datetime DEFAULT NULL,
  `IsWhiteList` int(255) DEFAULT '0',
  PRIMARY KEY (`P_Key`),
  KEY `person_authgroup_authGroupKey` (`AuthGroupInterNomber`),
  KEY `person_dep_depKey` (`DepInterNomber`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_person_permission`;
CREATE TABLE `t_bd_person_permission` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `ValidTimeStart` datetime DEFAULT NULL,
  `ValidTimeEnd` datetime DEFAULT NULL,
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_role`;
CREATE TABLE `t_bd_role` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Remark` text CHARACTER SET utf8,
  `CreateTime` datetime DEFAULT NULL,
  `IsDelete` int(255) DEFAULT '0',
  `DeleteTime` datetime DEFAULT NULL,
  `DeleteUserName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


INSERT INTO `t_bd_role` VALUES ('1', '管理员', null, null, '0', null, null);
INSERT INTO `t_bd_role` VALUES ('2', '操作员', null, null, '0', null, null);


DROP TABLE IF EXISTS `t_bd_role_permission`;
CREATE TABLE `t_bd_role_permission` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `Role_Key` bigint(20) DEFAULT NULL,
  `Permission_Key` bigint(20) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`P_Key`),
  KEY `rolePermission_permission_permissionKey1` (`Permission_Key`),
  KEY `rolePermission_role_roleKey` (`Role_Key`),
  CONSTRAINT `rolePermission_permission_permissionKey1` FOREIGN KEY (`Permission_Key`) REFERENCES `t_bd_permission` (`P_Key`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `rolePermission_role_roleKey` FOREIGN KEY (`Role_Key`) REFERENCES `t_bd_role` (`P_Key`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;


INSERT INTO `t_bd_role_permission` VALUES ('1', '1', '27', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('2', '1', '1', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('3', '1', '8', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('4', '1', '2', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('5', '1', '9', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('6', '1', '28', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('7', '1', '29', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('8', '1', '30', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('9', '1', '31', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('10', '1', '32', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('11', '1', '33', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('12', '1', '34', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('13', '1', '35', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('14', '1', '36', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('15', '1', '10', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('16', '1', '37', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('17', '1', '38', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('18', '1', '39', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('19', '1', '3', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('20', '1', '11', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('21', '1', '40', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('22', '1', '41', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('23', '1', '42', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('24', '1', '12', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('25', '1', '59', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('26', '1', '60', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('27', '1', '61', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('28', '1', '62', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('29', '1', '63', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('30', '1', '64', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('31', '1', '65', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('32', '1', '66', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('33', '1', '67', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('34', '1', '68', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('35', '1', '69', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('36', '1', '70', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('37', '1', '71', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('38', '1', '13', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('39', '1', '4', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('40', '1', '14', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('41', '1', '46', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('42', '1', '47', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('43', '1', '15', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('44', '1', '48', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('45', '1', '49', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('46', '1', '43', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('47', '1', '44', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('48', '1', '45', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('49', '1', '16', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('50', '1', '17', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('51', '1', '5', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('52', '1', '18', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('53', '1', '50', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('54', '1', '51', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('55', '1', '52', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('56', '1', '53', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('57', '1', '54', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('58', '1', '55', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('59', '1', '56', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('60', '1', '57', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('61', '1', '58', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('62', '1', '6', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('63', '1', '19', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('64', '1', '20', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('65', '1', '21', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('66', '1', '7', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('67', '1', '22', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('68', '1', '23', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('69', '1', '24', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('70', '1', '25', '2019-08-28 16:03:25');
INSERT INTO `t_bd_role_permission` VALUES ('71', '2', '27', '2019-08-29 17:19:39');
INSERT INTO `t_bd_role_permission` VALUES ('72', '2', '1', '2019-08-29 17:19:39');
INSERT INTO `t_bd_role_permission` VALUES ('73', '2', '8', '2019-08-29 17:19:39');
INSERT INTO `t_bd_role_permission` VALUES ( '74', '1','314', '2019-11-26 09:56:43.000');


DROP TABLE IF EXISTS `t_bd_softdog`;
CREATE TABLE `t_bd_softdog` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `ServiceNumber` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `RegisterCode` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `BeginDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_user`;
CREATE TABLE `t_bd_user` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PassWord` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `Role_Key` bigint(20) DEFAULT NULL,
  `Remark` text CHARACTER SET utf8,
  `RealName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `IsDelete` int(255) DEFAULT '0',
  `DeleteTime` datetime DEFAULT NULL,
  `DeleteUserName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `HostName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`P_Key`),
  KEY `user_role_roleKey` (`Role_Key`),
  CONSTRAINT `user_role_roleKey` FOREIGN KEY (`Role_Key`) REFERENCES `t_bd_role` (`P_Key`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


INSERT INTO `t_bd_user` VALUES ('1', 'admin', '202cb962ac5975b964b7152d234b70', '2019-09-16 18:29:19', '1', null, 'admin', '0', null, null, null);
INSERT INTO `t_bd_user` VALUES ('2', '操作员', '202cb962ac5975b964b7152d234b70', '2019-09-18 11:57:43', '2', null, null, '0', null, null, null);


DROP TABLE IF EXISTS `t_bd_whitelist`;
CREATE TABLE `t_bd_whitelist` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `ControlNumber` int(11) DEFAULT NULL,
  `PersonName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PersonIDCard` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ControlName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ValidTimeStart` datetime DEFAULT NULL,
  `ValidTimeEnd` datetime DEFAULT NULL,
  `PersonSex` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_whitelistlog`;
CREATE TABLE `t_bd_whitelistlog` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `PersonName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PersonIDCard` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ControlNumber` int(11) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `State` int(255) DEFAULT '0',
  `Tag` int(255) DEFAULT NULL,
  `PersonLog_Key` bigint(20) DEFAULT NULL,
  `Remark` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `Type` int(255) DEFAULT '1',
  PRIMARY KEY (`P_Key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_bd_zhibixuanconfig`;
CREATE TABLE `t_bd_zhibixuanconfig` (
  `P_Key` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `similarity` int(255) DEFAULT '60',
  `saveIdentifyTime` int(11) DEFAULT '5',
  `uploadSetting` int(255) DEFAULT '1',
  `volumeSetting` int(255) DEFAULT '100',
  `safetyHelmet` int(255) DEFAULT '1',
  `aliveDetectEnable` int(255) DEFAULT '1',
  `faceShow` int(255) DEFAULT '1',
  `waterMark` int(255) DEFAULT '1',
  `extinguishingScreenTime` int(255) DEFAULT '300',
  `ledMode` int(255) DEFAULT '1',
  `ledLevel` int(255) DEFAULT '100',
  `ledStartTime1` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `ledEndTime1` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nLevel1` int(255) DEFAULT '100',
  `ip` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `subnetMask` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `gateway` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ledStartTime2` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `ledEndTime2` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nLevel2` int(255) DEFAULT '100',
  `isLedSet1` int(255) DEFAULT '0',
  `isLedSet2` int(255) DEFAULT '0',
  `isLedSet3` int(255) DEFAULT '0',
  `ledStartTime3` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `ledEndTime3` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nLevel3` int(255) DEFAULT '100',
  `Control_Key` bigint(20) DEFAULT NULL,
  `ControlNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`P_Key`),
  KEY `Control_Key` (`Control_Key`),
  CONSTRAINT `t_bd_zhibixuanconfig_ibfk_1` FOREIGN KEY (`Control_Key`) REFERENCES `t_bd_control` (`P_Key`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

