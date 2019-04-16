drop view if exists db_dpzjk.v_visu_zxsc;
create view db_dpzjk.v_visu_zxsc as

-- 执行案件分类
select 
  public.uuid_generate_v1() as id,
  'zxsc_zxajfl'as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,--法院维度
  null as columnvalue6,
  null as columnvalue7,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  ajlx as columnvalue11,-- 案件类型
  yjs::text as columnvalue12,-- 已结案件数
  wjs::text as columnvalue13,-- 未结案件数
  null as columnvalue14,
  null as columnvalue15,
  null as columnvalue16,
  null as columnvalue17,
  null as columnvalue18,
  null as columnvalue19,
  null as columnvalue20,
  null as columnvalue21,
  null as columnvalue22,
  null as columnvalue23,
  null as columnvalue24,
  null as columnvalue25,
  null as columnvalue26,
  null as columnvalue27,
  null as columnvalue28,
  null as columnvalue29,
  null as columnvalue30,
  null as extendvalue 
from (
with scl as(
SELECT
c_fy as fywd,
sum(n_scl_yjajz) as scyj,
sum(n_scl_wjajz) as scwj,
sum(n_fyl_wjajz) as fywj,
sum(n_fyl_yjajz) as fyyj,
sum(n_jdl_wjajz) as jdwj,
sum(n_jdl_yjajz) as jdyj,
sum(n_yyl_wjajz) as yywj,
sum(n_yyl_yjajz) as yyyj
FROM
	db_dpzjk.t_jspt_qd_zxsc_zxajfl_gdtjq aj
right join d_fy_qd qd on qd.c_fy=substr(aj.c_jbfyid,5)
where substr(c_tjq,1,4)='2018'
group by c_fy
) 

select fywd,'审查类' as ajlx,scyj as yjs,scwj as wjs from scl
union all
select '185018620000' as fywd,'审查类' as ajlx,sum(scyj) as yjs,sum(scwj) as wjs from scl

union all 

select fywd,'复议类' as ajlx,fyyj as yjs,fywj as wjs from scl
union all
select '185018620000' as fywd,'复议类' as ajlx,sum(fyyj) as yjs,sum(fywj) as wjs from scl

union all
 
select fywd,'监督类' as ajlx,jdyj as yjs,jdwj as wjs from scl
union all
select '185018620000' as fywd,'监督类' as ajlx,sum(jdyj) as yjs,sum(jdwj) as wjs from scl

union all

select fywd,'异议类' as ajlx,yyyj as yjs,yywj as wjs from scl
union all
select '185018620000' as fywd,'异议类' as ajlx,sum(yyyj) as yjs,sum(yywj) as wjs from scl
) zxajfl
union all
-- 执行审查类案件收结比/执行审查类案件未结数量/各区市法院审查案件数量
select 
  public.uuid_generate_v1() as id,
  'zxsc_sclaj'as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,--法院维度
  null as columnvalue6,
  null as columnvalue7,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  sxlx as columnvalue11,--筛选类型
  coalesce(ajs,0)::text as columnvalue12,-- 案件数
  null as columnvalue13,
  null as columnvalue14,
  null as columnvalue15,
  null as columnvalue16,
  null as columnvalue17,
  null as columnvalue18,
  null as columnvalue19,
  null as columnvalue20,
  null as columnvalue21,
  null as columnvalue22,
  null as columnvalue23,
  null as columnvalue24,
  null as columnvalue25,
  null as columnvalue26,
  null as columnvalue27,
  null as columnvalue28,
  null as columnvalue29,
  null as columnvalue30,
  null as extendvalue 
from (

select 
c_fy as fywd,
aj.sxlx,
aj.ajs
from d_fy_qd fy 
left join 
(
--收结比
select 
c_jbfyid,
'sjb' as sxlx,
case when 
	sum(coalesce(n_xsscajz,0))=0 then 0
else round(sum(coalesce(n_scl_yjajz,0))/sum(coalesce(n_xsscajz,0))*100,1)
end as ajs
from 
	t_jspt_qd_zxsc_sclaj_gdtjq 
where substr(c_tjq,1,4)='2018'
group by c_jbfyid
union all 
--未结案件数量
select 
c_jbfyid,
'wjajsl' as sxlx,
sum(coalesce(n_scl_wjajz,0)) as ajs
from 
	t_jspt_qd_zxsc_sclaj_gdtjq 
where substr(c_tjq,1,4)='2018'
group by c_jbfyid
union all 
--案件总数
select 
c_jbfyid,
'gqsfy' as sxlx,
sum(coalesce(n_scl_wjajz,0)+coalesce(n_scl_yjajz,0)) as ajs
from 
	t_jspt_qd_zxsc_sclaj_gdtjq 
where substr(c_tjq,1,4)='2018'
group by c_jbfyid
) aj 
on fy.c_fy = substr(aj.c_jbfyid,5)

)sclaj


union all
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
where schemaid ='zxsc_zxsclalxhfx'

/*
-- 执行审查类案类型化分析
select 
  public.uuid_generate_v1() as id,
  'zxsc_zxsclalxhfx'as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,--法院维度
  null as columnvalue6,
  null as columnvalue7,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  alx as columnvalue11,--案类型
  zb as columnvalue12,--占比
  null as columnvalue13,
  null as columnvalue14,
  null as columnvalue15,
  null as columnvalue16,
  null as columnvalue17,
  null as columnvalue18,
  null as columnvalue19,
  null as columnvalue20,
  null as columnvalue21,
  null as columnvalue22,
  null as columnvalue23,
  null as columnvalue24,
  null as columnvalue25,
  null as columnvalue26,
  null as columnvalue27,
  null as columnvalue28,
  null as columnvalue29,
  null as columnvalue30,
  null as extendvalue 
from (





)zxsclalxhfx

*/
union all
-- 近年收案数量曲线图-本年
select 
  public.uuid_generate_v1() as id,
  'zxsc_jnsaslqxt_bn'as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,--法院维度
  null as columnvalue6,
  null as columnvalue7,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  yf::text as columnvalue11,--月份
  coalesce(ajs,0)::text as columnvalue12,--案件数
  null as columnvalue13,
  null as columnvalue14,
  null as columnvalue15,
  null as columnvalue16,
  null as columnvalue17,
  null as columnvalue18,
  null as columnvalue19,
  null as columnvalue20,
  null as columnvalue21,
  null as columnvalue22,
  null as columnvalue23,
  null as columnvalue24,
  null as columnvalue25,
  null as columnvalue26,
  null as columnvalue27,
  null as columnvalue28,
  null as columnvalue29,
  null as columnvalue30,
  null as extendvalue 
from (
select 
	yf.c_yf as yf,
	aj.fywd,
	aj.ajs
from d_yf yf
left join (
select 
	substr(c_jbfyid,5) as fywd,
	c_tjq,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_mouth sja
right join d_fy_qd fy on fy.c_fy = substr(sja.c_jbfyid,5)
where substr(c_tjq,1,4)='2018'
group by c_jbfyid,c_tjq
union all 
--全市
select 
	'185018620000' as fywd,
	c_tjq,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_mouth sja
where substr(c_tjq,1,4)='2018'
group by c_tjq
)aj
on yf.c_yf = substr(aj.c_tjq,5,2) 
)bn

union all
-- 近年收案数量曲线图-近五年
select 
  public.uuid_generate_v1() as id,
  'zxsc_jnsaslqxt_bn'as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,--法院维度
  null as columnvalue6,
  null as columnvalue7,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  nf as columnvalue11,--年份
  coalesce(ajs,0)::text as columnvalue12,--案件数
  null as columnvalue13,
  null as columnvalue14,
  null as columnvalue15,
  null as columnvalue16,
  null as columnvalue17,
  null as columnvalue18,
  null as columnvalue19,
  null as columnvalue20,
  null as columnvalue21,
  null as columnvalue22,
  null as columnvalue23,
  null as columnvalue24,
  null as columnvalue25,
  null as columnvalue26,
  null as columnvalue27,
  null as columnvalue28,
  null as columnvalue29,
  null as columnvalue30,
  null as extendvalue 
from (

select 
	fy.c_fy as fywd,
	aj.nf,
	aj.ajs
from d_fy_qd fy
left join (
--当年
select 
	c_jbfyid ,
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
where c_tjq like extract('year' from now()+interval'-1 year')||'%'
group by c_jbfyid,c_tjq
union all
select 
	c_jbfyid ,
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
where c_tjq like extract('year' from now()+interval'-2 year')||'%'
group by c_jbfyid,c_tjq

union all
select 
	c_jbfyid ,
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
where c_tjq like extract('year' from now()+interval'-3 year')||'%'
group by c_jbfyid,c_tjq
union all
select 
	c_jbfyid ,
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
where c_tjq like extract('year' from now()+interval'-4 year')||'%'
group by c_jbfyid,c_tjq

union all
select 
	c_jbfyid ,
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
where c_tjq like extract('year' from now()+interval'-5 year')||'%'
group by c_jbfyid,c_tjq

union all
select 
	c_jbfyid ,
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
where c_tjq like extract('year' from now()+interval'-6 year')||'%'
group by c_jbfyid,c_tjq
)aj
on fy.c_fy = substr(aj.c_jbfyid,5)

union all 
--全市

--当年
select 
	'185018620000' as fywd,
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
right join d_fy_qd fy on fy.c_fy = substr(sja.c_jbfyid,5)
where c_tjq like extract('year' from now()+interval'-1 year')||'%'
group by c_tjq
union all
select 
	'185018620000' as fywd, 
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
right join d_fy_qd fy on fy.c_fy = substr(sja.c_jbfyid,5)
where c_tjq like extract('year' from now()+interval'-2 year')||'%'
group by c_tjq

union all
select 
	'185018620000' as fywd, 
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
right join d_fy_qd fy on fy.c_fy = substr(sja.c_jbfyid,5)
where c_tjq like extract('year' from now()+interval'-3 year')||'%'
group by c_tjq
union all
select 
	'185018620000' as fywd, 
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
right join d_fy_qd fy on fy.c_fy = substr(sja.c_jbfyid,5)
where c_tjq like extract('year' from now()+interval'-4 year')||'%'
group by c_tjq

union all
select 
	'185018620000' as fywd, 
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
right join d_fy_qd fy on fy.c_fy = substr(sja.c_jbfyid,5)
where c_tjq like extract('year' from now()+interval'-5 year')||'%'
group by c_tjq

union all
select 
	'185018620000' as fywd, 
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
right join d_fy_qd fy on fy.c_fy = substr(sja.c_jbfyid,5)
where c_tjq like extract('year' from now()+interval'-6 year')||'%'
group by c_tjq


)jwn;

drop view if exists db_dpzjk.v_visu_zxsc;
create view db_dpzjk.v_visu_zxsc as

-- 执行案件分类
select 
  public.uuid_generate_v1() as id,
  'zxsc_zxajfl'as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,--法院维度
  null as columnvalue6,
  null as columnvalue7,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  ajlx as columnvalue11,-- 案件类型
  yjs::text as columnvalue12,-- 已结案件数
  wjs::text as columnvalue13,-- 未结案件数
  null as columnvalue14,
  null as columnvalue15,
  null as columnvalue16,
  null as columnvalue17,
  null as columnvalue18,
  null as columnvalue19,
  null as columnvalue20,
  null as columnvalue21,
  null as columnvalue22,
  null as columnvalue23,
  null as columnvalue24,
  null as columnvalue25,
  null as columnvalue26,
  null as columnvalue27,
  null as columnvalue28,
  null as columnvalue29,
  null as columnvalue30,
  null as extendvalue 
from (
with scl as(
SELECT
c_fy as fywd,
sum(n_scl_yjajz) as scyj,
sum(n_scl_wjajz) as scwj,
sum(n_fyl_wjajz) as fywj,
sum(n_fyl_yjajz) as fyyj,
sum(n_jdl_wjajz) as jdwj,
sum(n_jdl_yjajz) as jdyj,
sum(n_yyl_wjajz) as yywj,
sum(n_yyl_yjajz) as yyyj
FROM
	db_dpzjk.t_jspt_qd_zxsc_zxajfl_gdtjq aj
right join d_fy_qd qd on qd.c_fy=substr(aj.c_jbfyid,5)
where substr(c_tjq,1,4)='2018'
group by c_fy
) 

select fywd,'审查类' as ajlx,scyj as yjs,scwj as wjs from scl
union all
select '185018620000' as fywd,'审查类' as ajlx,sum(scyj) as yjs,sum(scwj) as wjs from scl

union all 

select fywd,'复议类' as ajlx,fyyj as yjs,fywj as wjs from scl
union all
select '185018620000' as fywd,'复议类' as ajlx,sum(fyyj) as yjs,sum(fywj) as wjs from scl

union all
 
select fywd,'监督类' as ajlx,jdyj as yjs,jdwj as wjs from scl
union all
select '185018620000' as fywd,'监督类' as ajlx,sum(jdyj) as yjs,sum(jdwj) as wjs from scl

union all

select fywd,'异议类' as ajlx,yyyj as yjs,yywj as wjs from scl
union all
select '185018620000' as fywd,'异议类' as ajlx,sum(yyyj) as yjs,sum(yywj) as wjs from scl
) zxajfl
union all
-- 执行审查类案件收结比/执行审查类案件未结数量/各区市法院审查案件数量
select 
  public.uuid_generate_v1() as id,
  'zxsc_sclaj'as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,--法院维度
  null as columnvalue6,
  null as columnvalue7,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  sxlx as columnvalue11,--筛选类型
  coalesce(ajs,0)::text as columnvalue12,-- 案件数
  null as columnvalue13,
  null as columnvalue14,
  null as columnvalue15,
  null as columnvalue16,
  null as columnvalue17,
  null as columnvalue18,
  null as columnvalue19,
  null as columnvalue20,
  null as columnvalue21,
  null as columnvalue22,
  null as columnvalue23,
  null as columnvalue24,
  null as columnvalue25,
  null as columnvalue26,
  null as columnvalue27,
  null as columnvalue28,
  null as columnvalue29,
  null as columnvalue30,
  null as extendvalue 
from (

select 
c_fy as fywd,
aj.sxlx,
aj.ajs
from d_fy_qd fy 
left join 
(
--收结比
select 
c_jbfyid,
'sjb' as sxlx,
case when 
	sum(coalesce(n_xsscajz,0))=0 then 0
else round(sum(coalesce(n_scl_yjajz,0))/sum(coalesce(n_xsscajz,0))*100,1)
end as ajs
from 
	t_jspt_qd_zxsc_sclaj_gdtjq 
where substr(c_tjq,1,4)='2018'
group by c_jbfyid
union all 
--未结案件数量
select 
c_jbfyid,
'wjajsl' as sxlx,
sum(coalesce(n_scl_wjajz,0)) as ajs
from 
	t_jspt_qd_zxsc_sclaj_gdtjq 
where substr(c_tjq,1,4)='2018'
group by c_jbfyid
union all 
--案件总数
select 
c_jbfyid,
'gqsfy' as sxlx,
sum(coalesce(n_scl_wjajz,0)+coalesce(n_scl_yjajz,0)) as ajs
from 
	t_jspt_qd_zxsc_sclaj_gdtjq 
where substr(c_tjq,1,4)='2018'
group by c_jbfyid
) aj 
on fy.c_fy = substr(aj.c_jbfyid,5)

)sclaj


union all
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
where schemaid ='zxsc_zxsclalxhfx'

/*
-- 执行审查类案类型化分析
select 
  public.uuid_generate_v1() as id,
  'zxsc_zxsclalxhfx'as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,--法院维度
  null as columnvalue6,
  null as columnvalue7,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  alx as columnvalue11,--案类型
  zb as columnvalue12,--占比
  null as columnvalue13,
  null as columnvalue14,
  null as columnvalue15,
  null as columnvalue16,
  null as columnvalue17,
  null as columnvalue18,
  null as columnvalue19,
  null as columnvalue20,
  null as columnvalue21,
  null as columnvalue22,
  null as columnvalue23,
  null as columnvalue24,
  null as columnvalue25,
  null as columnvalue26,
  null as columnvalue27,
  null as columnvalue28,
  null as columnvalue29,
  null as columnvalue30,
  null as extendvalue 
from (





)zxsclalxhfx

*/
union all
-- 近年收案数量曲线图-本年
select 
  public.uuid_generate_v1() as id,
  'zxsc_jnsaslqxt_bn'as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,--法院维度
  null as columnvalue6,
  null as columnvalue7,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  yf::text as columnvalue11,--月份
  coalesce(ajs,0)::text as columnvalue12,--案件数
  null as columnvalue13,
  null as columnvalue14,
  null as columnvalue15,
  null as columnvalue16,
  null as columnvalue17,
  null as columnvalue18,
  null as columnvalue19,
  null as columnvalue20,
  null as columnvalue21,
  null as columnvalue22,
  null as columnvalue23,
  null as columnvalue24,
  null as columnvalue25,
  null as columnvalue26,
  null as columnvalue27,
  null as columnvalue28,
  null as columnvalue29,
  null as columnvalue30,
  null as extendvalue 
from (
select 
	yf.c_yf as yf,
	aj.fywd,
	aj.ajs
from d_yf yf
left join (
select 
	substr(c_jbfyid,5) as fywd,
	c_tjq,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_mouth sja
right join d_fy_qd fy on fy.c_fy = substr(sja.c_jbfyid,5)
where substr(c_tjq,1,4)='2018'
group by c_jbfyid,c_tjq
union all 
--全市
select 
	'185018620000' as fywd,
	c_tjq,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_mouth sja
where substr(c_tjq,1,4)='2018'
group by c_tjq
)aj
on yf.c_yf = substr(aj.c_tjq,5,2) 
)bn

union all
-- 近年收案数量曲线图-近五年
select 
  public.uuid_generate_v1() as id,
  'zxsc_jnsaslqxt_bn'as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,--法院维度
  null as columnvalue6,
  null as columnvalue7,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  nf as columnvalue11,--年份
  coalesce(ajs,0)::text as columnvalue12,--案件数
  null as columnvalue13,
  null as columnvalue14,
  null as columnvalue15,
  null as columnvalue16,
  null as columnvalue17,
  null as columnvalue18,
  null as columnvalue19,
  null as columnvalue20,
  null as columnvalue21,
  null as columnvalue22,
  null as columnvalue23,
  null as columnvalue24,
  null as columnvalue25,
  null as columnvalue26,
  null as columnvalue27,
  null as columnvalue28,
  null as columnvalue29,
  null as columnvalue30,
  null as extendvalue 
from (

select 
	fy.c_fy as fywd,
	aj.nf,
	aj.ajs
from d_fy_qd fy
left join (
--当年
select 
	c_jbfyid ,
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
where c_tjq like extract('year' from now()+interval'-1 year')||'%'
group by c_jbfyid,c_tjq
union all
select 
	c_jbfyid ,
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
where c_tjq like extract('year' from now()+interval'-2 year')||'%'
group by c_jbfyid,c_tjq

union all
select 
	c_jbfyid ,
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
where c_tjq like extract('year' from now()+interval'-3 year')||'%'
group by c_jbfyid,c_tjq
union all
select 
	c_jbfyid ,
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
where c_tjq like extract('year' from now()+interval'-4 year')||'%'
group by c_jbfyid,c_tjq

union all
select 
	c_jbfyid ,
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
where c_tjq like extract('year' from now()+interval'-5 year')||'%'
group by c_jbfyid,c_tjq

union all
select 
	c_jbfyid ,
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
where c_tjq like extract('year' from now()+interval'-6 year')||'%'
group by c_jbfyid,c_tjq
)aj
on fy.c_fy = substr(aj.c_jbfyid,5)

union all 
--全市

--当年
select 
	'185018620000' as fywd,
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
right join d_fy_qd fy on fy.c_fy = substr(sja.c_jbfyid,5)
where c_tjq like extract('year' from now()+interval'-1 year')||'%'
group by c_tjq
union all
select 
	'185018620000' as fywd, 
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
right join d_fy_qd fy on fy.c_fy = substr(sja.c_jbfyid,5)
where c_tjq like extract('year' from now()+interval'-2 year')||'%'
group by c_tjq

union all
select 
	'185018620000' as fywd, 
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
right join d_fy_qd fy on fy.c_fy = substr(sja.c_jbfyid,5)
where c_tjq like extract('year' from now()+interval'-3 year')||'%'
group by c_tjq
union all
select 
	'185018620000' as fywd, 
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
right join d_fy_qd fy on fy.c_fy = substr(sja.c_jbfyid,5)
where c_tjq like extract('year' from now()+interval'-4 year')||'%'
group by c_tjq

union all
select 
	'185018620000' as fywd, 
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
right join d_fy_qd fy on fy.c_fy = substr(sja.c_jbfyid,5)
where c_tjq like extract('year' from now()+interval'-5 year')||'%'
group by c_tjq

union all
select 
	'185018620000' as fywd, 
	substr(c_tjq,1,4) as nf,
	sum(coalesce(n_zx_xsajz,0))as ajs
from t_jspt_qd_sy_sjafx_gdtjq sja
right join d_fy_qd fy on fy.c_fy = substr(sja.c_jbfyid,5)
where c_tjq like extract('year' from now()+interval'-6 year')||'%'
group by c_tjq


)jwn;

ALTER TABLE "db_dpzjk"."v_visu_zxsc" OWNER TO "dpzjk";