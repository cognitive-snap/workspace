drop view if exists db_dpzjk.v_visu_dwjs;
create view db_dpzjk.v_visu_dwjs as 
select 
	public.uuid_generate_v1() as id,
  schemaid,
  now() as gathertime,
  now() as recordtime,
  columnvalue1,
  columnvalue2,
  columnvalue3,
  columnvalue4,
  columnvalue5,
  columnvalue6,
  columnvalue7,
  columnvalue8,
  columnvalue9,
  columnvalue10,
  columnvalue11,
  columnvalue12,
  columnvalue13,
  columnvalue14 ,
  columnvalue15 ,
  columnvalue16 ,
  columnvalue17 ,
  columnvalue18 ,
  columnvalue19 ,
  columnvalue20 ,
  columnvalue21 ,
  columnvalue22 ,
  columnvalue23 ,
  columnvalue24 ,
  columnvalue25 ,
  columnvalue26 ,
  columnvalue27 ,
  columnvalue28 ,
  columnvalue29 ,
  columnvalue30 ,
  extendvalue  
from 
	"db_dpzjk"."d_testData_qd"
where schemaid='dwjs_rygcfb' 
or schemaid='dwjs_xlfb' 
or schemaid='dwjs_nlfb' 
or schemaid='dwjs_gznxfb' 
or schemaid='dwjs_jaqk' 
or schemaid='dwjs_ajs_jal' 
or schemaid='dwjs_zxzx' 
or schemaid='dwjs_pjslys' 
or schemaid='dwjs_fgxx' 
or schemaid='dwjs_fgry' 
