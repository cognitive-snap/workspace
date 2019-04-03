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

Date: 2019-04-03 10:08:37
*/


-- ----------------------------
-- Table structure for d_yf
-- ----------------------------
DROP TABLE IF EXISTS "db_dpzjk"."d_yf";
CREATE TABLE "db_dpzjk"."d_yf" (
"c_yf" varchar(50) COLLATE "default",
"c_yfmc" varchar(300) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of d_yf
-- ----------------------------
INSERT INTO "db_dpzjk"."d_yf" VALUES ('01', '1月');
INSERT INTO "db_dpzjk"."d_yf" VALUES ('02', '2月');
INSERT INTO "db_dpzjk"."d_yf" VALUES ('03', '3月');
INSERT INTO "db_dpzjk"."d_yf" VALUES ('04', '4月');
INSERT INTO "db_dpzjk"."d_yf" VALUES ('05', '5月');
INSERT INTO "db_dpzjk"."d_yf" VALUES ('06', '6月');
INSERT INTO "db_dpzjk"."d_yf" VALUES ('07', '7月');
INSERT INTO "db_dpzjk"."d_yf" VALUES ('08', '8月');
INSERT INTO "db_dpzjk"."d_yf" VALUES ('09', '9月');
INSERT INTO "db_dpzjk"."d_yf" VALUES ('10', '10月');
INSERT INTO "db_dpzjk"."d_yf" VALUES ('11', '11月');
INSERT INTO "db_dpzjk"."d_yf" VALUES ('12', '12月');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
