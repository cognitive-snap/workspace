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

Date: 2019-03-29 15:47:20
*/


-- ----------------------------
-- Table structure for d_fy_qd
-- ----------------------------
DROP TABLE IF EXISTS "db_dpzjk"."d_fy_qd";
CREATE TABLE "db_dpzjk"."d_fy_qd" (
"c_fy" varchar(30) COLLATE "default",
"c_fbdm" varchar(30) COLLATE "default",
"c_fymc" varchar(300) COLLATE "default",
"c_fyfid" varchar(300) COLLATE "default",
"n_level" int4,
"c_isxq" varchar(10) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "db_dpzjk"."d_fy_qd"."c_fy" IS '区级法院维度';
COMMENT ON COLUMN "db_dpzjk"."d_fy_qd"."c_fymc" IS '法院名称';
COMMENT ON COLUMN "db_dpzjk"."d_fy_qd"."c_fyfid" IS '市级维度';

-- ----------------------------
-- Records of d_fy_qd
-- ----------------------------
INSERT INTO "db_dpzjk"."d_fy_qd" VALUES ('185018620001', 'F20', '山东省青岛市中级人民法院', '185018620000', '3', '否');
INSERT INTO "db_dpzjk"."d_fy_qd" VALUES ('185018621863', 'F21', '青岛市市南区人民法院', '185018620000', '4', '否');
INSERT INTO "db_dpzjk"."d_fy_qd" VALUES ('185018621864', 'F22', '青岛市市北区人民法院', '185018620000', '4', '否');
INSERT INTO "db_dpzjk"."d_fy_qd" VALUES ('185018621866', 'F25', '青岛市李沧区人民法院', '185018620000', '4', '否');
INSERT INTO "db_dpzjk"."d_fy_qd" VALUES ('185018621867', 'F26', '青岛市城阳区人民法院', '185018620000', '4', '否');
INSERT INTO "db_dpzjk"."d_fy_qd" VALUES ('185018621868', 'F27', '青岛市黄岛区人民法院', '185018620000', '4', '否');
INSERT INTO "db_dpzjk"."d_fy_qd" VALUES ('185018621869', 'F28', '青岛市崂山区人民法院', '185018620000', '4', '否');
INSERT INTO "db_dpzjk"."d_fy_qd" VALUES ('185018621870', 'F29', '即墨市人民法院', '185018620000', '4', '否');
INSERT INTO "db_dpzjk"."d_fy_qd" VALUES ('185018621871', 'F2A', '胶州市人民法院', '185018620000', '4', '否');
INSERT INTO "db_dpzjk"."d_fy_qd" VALUES ('185018621872', 'F2B', '平度市人民法院', '185018620000', '4', '否');
INSERT INTO "db_dpzjk"."d_fy_qd" VALUES ('185018621874', 'F2D', '莱西市人民法院', '185018620000', '4', '否');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
