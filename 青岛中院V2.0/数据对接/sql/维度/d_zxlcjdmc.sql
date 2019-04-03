/*
Navicat PGSQL Data Transfer

Source Server         : 172.23.20.217
Source Server Version : 90505
Source Host           : 172.23.20.217:5432
Source Database       : db_dp_zjk
Source Schema         : db_dpzjk

Target Server Type    : PGSQL
Target Server Version : 90505
File Encoding         : 65001

Date: 2019-04-03 10:14:45
*/


-- ----------------------------
-- Table structure for d_zxlcjdmc
-- ----------------------------
DROP TABLE IF EXISTS "db_dpzjk"."d_zxlcjdmc";
CREATE TABLE "db_dpzjk"."d_zxlcjdmc" (
"tdh_dm" int4,
"tdh_jdmc" varchar(300) COLLATE "default",
"dp_jddm" varchar(300) COLLATE "default",
"dp_jdmc" varchar(300) COLLATE "default",
"dp_jdjc" varchar(300) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of d_zxlcjdmc
-- ----------------------------
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('0', 'null', '203001033', '有财产案件进入程序节点', '有财产进入程序');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('0', 'null', '203001034', '无财产案件进入程序节点', '无财产进入程序');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('1040', '立案', '203001001', '立案审查时限节点', '立案');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('1060', '分案', '203001002', '分案期限节点', '分案');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3020', '评估', '203001017', '启动评估时限节点', '启动评估');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3031', '变卖', '203001026', '启动变卖时限节点', '启动变卖');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3032', '启动拍卖', '203001021', '启动拍卖程序时限节点', '启动拍卖');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3033', '一拍结果确认', '203001022', '拍卖成功确认时限节点', '拍卖确认');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3034', '启动二拍', '203001023', '启动二拍时限节点', '启动二拍');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3036', '启动三拍', '203001024', '启动三拍时限节点', '启动三拍');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3110', '期限变更', '203001038', '申请延长执行期限节点', '延长期限');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3140', '案件报结', '203001036', '有足额财产报结启动节点', '足额报结');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3150', '结案', '203001031', '结案时限节点', '结案');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3499', '银行存款冻结', '203001015', '银行存款冻结时限节点', '启动网络冻结');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3500', '传统查控', '203001005', '（首次）启动传统查控时限节点', '传统查控');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3507', '查封', '203001012', '保全措施期限节点查封', '启动查封');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3508', '扣押', '203001013', '保全措施期限节点扣押', '启动扣押');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3509', '冻结', '203001014', '保全措施期限节点冻结', '启动冻结');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3515', '其他制裁', '203001030', '启动执行制裁措施时限节点', '执行制裁');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3517', '执行线索', '203001008', '约谈执行线索节点', '终本线索');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3518', '终本约谈', '203001007', '无财产启动约谈时限节点', '终本约谈');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3518', '终本约谈', '203001035', '启动终本程序节点', '启动终本');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3520', '执行通知', '203001003', '发出执行通知书节点', '执行通知');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3524', '以物抵债', '203001025', '确定以物抵债时限节点', '以物抵债');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3525', '划拨', '203001016', '启动划拨时限节点', '启动扣划');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3527', '办理款物支付手续时限节点', '203001028', '办理款物支付手续时限节点', '办理支付');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3531', '网络查控', '203001004', '（首次）启动网络查控时限节点', '网络查控');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3531', '网络查控', '203001037', '网络查控次数节点', '网络查控次数');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3534', '终本审查', '203001040', '终本案件网络查询次数', '终本网络查控次数');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3535', '传统查控结果分析', '203001006', '完成传统查控时限节点', '完成传统查控');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3550', '线索核查', '203001009', '线索核查节点', '线索核查');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3551', '送达评估', '203001018', '送达当事人评估报告时限节点', '送达评估');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3552', '评估异议', '203001019', '评估异议提起时限节点', '评估异议');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3553', '评估异议审查', '203001020', '评估异议审查时限节点', '评估异议审查');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3555', '拍抵移交', '203001027', '拍卖或以物抵债移交时限节点', '拍抵移交');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3556', '完成款物支付手续时限节点', '203001029', '完成款物支付手续时限节点', '案款发放');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3570', '其他强制控制', '203001011', '其他控制财产时限节点', '财产控制');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('3576', '启动恢复执行时限节点', '203001010', '启动恢复执行时限节点', '恢复执行');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('5020', '归档', '203001032', '归档时限节点', '归档');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('6011', '制作裁判文书', '203001039', '执行文书节点', '执行文书');
INSERT INTO "db_dpzjk"."d_zxlcjdmc" VALUES ('100000', '补足维', '100000', null, '总数');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
