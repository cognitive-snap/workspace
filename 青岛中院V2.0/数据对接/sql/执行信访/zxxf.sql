drop view if exists db_dpzjk.v_visu_zxjd;
create view db_dpzjk.v_visu_zxjd as 

--≤‚ ‘ ˝æ›
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
where schemaid='zxjd_afb' 
or schemaid='zxjd_xfhjl' 
or schemaid='zxjd_xfhjlbhqst' 
or schemaid='zxjd_bxfajzxcxfltj' 
or schemaid='zxjd_gzrjfl'
or schemaid ='zxjd_xfajs' 
or  schemaid ='zxjd_xfrs'

