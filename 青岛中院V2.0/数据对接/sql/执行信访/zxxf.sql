drop view if exists db_dpzjk.v_visu_zxjd;
create view db_dpzjk.v_visu_zxjd as 

--≤‚ ‘ ˝æ›
select 
	public.uuid_generate_v1() as id,
  schemaid as schemaid,
  now() as gathertime,
  now() as recordtime,
  columnvalue1 as columnvalue1,
  columnvalue2 as columnvalue2,
  columnvalue3 as columnvalue3,
  columnvalue4 as columnvalue4,
  columnvalue5 as columnvalue5,
  columnvalue6 as columnvalue6,
  columnvalue7 as columnvalue7,
  columnvalue8 as columnvalue8,
  columnvalue9 as columnvalue9,
  columnvalue10 as columnvalue10,
  columnvalue11 as columnvalue11,
  columnvalue12 as columnvalue12,
  columnvalue13 as columnvalue13,
  columnvalue14 as columnvalue14,
  columnvalue15 as columnvalue15,
  columnvalue16 as columnvalue16,
  columnvalue17 as columnvalue17,
  columnvalue18 as columnvalue18,
  columnvalue19 as columnvalue19,
  columnvalue20 as columnvalue20,
  columnvalue21 as columnvalue21,
  columnvalue22 as columnvalue22,
  columnvalue23 as columnvalue23,
  columnvalue24 as columnvalue24,
  columnvalue25 as columnvalue25,
  columnvalue26 as columnvalue26,
  columnvalue27 as columnvalue27,
  columnvalue28 as columnvalue28,
  columnvalue29 as columnvalue29,
  columnvalue30 as columnvalue30,
  extendvalue as extendvalue
from 
	"db_dpzjk"."d_testData_qd"
where schemaid='zxjd_afb' 
or schemaid='zxjd_xfhjl' 
or schemaid='zxjd_xfhjlbhqst' 
or schemaid='zxjd_bxfajzxcxfltj' 
or schemaid='zxjd_gzrjfl'
or schemaid ='zxjd_xfajs' 
or  schemaid ='zxjd_xfrs'

