drop view if exists db_dpzjk.v_visu_sy;
create view db_dpzjk.v_visu_sy as

--质效指标排行
select 
  public.uuid_generate_v1() as id,
  'sy_zxzbph'as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,--法院维度
  null as columnvalue6,
  null as columnvalue7 ,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  zbmc as columnvalue11,--指标名称
  zbsz as columnvalue12,--指标数值
  null as columnvalue13,
  null as columnvalue14 ,
  null as columnvalue15 ,
  null as columnvalue16 ,
  null as columnvalue17 ,
  null as columnvalue18 ,
  null as columnvalue19 ,
  null as columnvalue20 ,
  null as columnvalue21 ,
  null as columnvalue22 ,
  null as columnvalue23 ,
  null as columnvalue24 ,
  null as columnvalue25 ,
  null as columnvalue26 ,
  null as columnvalue27 ,
  null as columnvalue28 ,
  null as columnvalue29 ,
  null as columnvalue30 ,
  null as extendvalue 
from (
--法定审限内执结率
select 
'法定审限内执结率' as zbmc,
fy.c_fy as fywd,
fy.c_fymc,
case 
	when aj.fm=0 then 0
	else round(aj.fz/aj.fm*100,2) 
	end as zbsz
from d_fy_qd fy
LEFT JOIN(
select 
c_jbfyid,
sum(COALESCE(n_fdsxnzjsz,0)) as fz,
sum(COALESCE(n_fdsxnjasz,0)) as fm
from t_jspt_qd_sy_fdsxnzjl_gdtjq 
where c_tjq like extract(year from now())||'%'
group by c_jbfyid
) aj
on fy.c_fy=substr(aj.c_jbfyid,4)

union all
--终本案件合格率
select 
'终本案件合格率' as zbmc,
fy.c_fy as fywd,
fy.c_fymc,
round(aj.fz/aj.fm*100,2) as zbsz
from d_fy_qd fy
LEFT JOIN(
select 
c_jbfyid,
sum(COALESCE(n_zbajsz,0)) as fm,
sum(COALESCE(n_zbhgajz,0)) as fz
from t_jspt_qd_sy_zbajhgl_gdtjq 
where c_tjq like extract(year from now())||'%'
group by c_jbfyid
) aj
on fy.c_fy=substr(aj.c_jbfyid,4)
union all 
--执行案件执结率
select 
'执行案件执结率' as zbmc,
fy.c_fy as fywd,
fy.c_fymc,
round(aj.fz/aj.fm*100,2) as zbsz
from d_fy_qd fy
LEFT JOIN(
select 
c_jbfyid,
sum(COALESCE(n_yjajs_zxz,0)) as fm,
sum(COALESCE(n_zjlajz,0)) as fz
from t_jspt_qd_sy_zxajzjl_gdtjq 
where c_tjq like extract(year from now())||'%'
group by c_jbfyid
) aj
on fy.c_fy=substr(aj.c_jbfyid,4)
union all 
--信访案件办结率



)zxzbph
union all 
--首页案件数
select 
  public.uuid_generate_v1() as id,
  'sy_syajs' as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,
  null as columnvalue6,
  null as columnvalue7 ,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  ajlx as columnvalue11,--案件类型
  ajs as columnvalue12,--案件数
  tb as columnvalue13,--同比
  null as columnvalue14 ,
  null as columnvalue15 ,
  null as columnvalue16 ,
  null as columnvalue17 ,
  null as columnvalue18 ,
  null as columnvalue19 ,
  null as columnvalue20 ,
  null as columnvalue21 ,
  null as columnvalue22 ,
  null as columnvalue23 ,
  null as columnvalue24 ,
  null as columnvalue25 ,
  null as columnvalue26 ,
  null as columnvalue27 ,
  null as columnvalue28 ,
  null as columnvalue29 ,
  null as columnvalue30 ,
  null as extendvalue 
from (
select 
	fy.c_fy as fywd,
	aj.ajlx as ajlx,
	sum(aj.bntq) as ajs,
	case 
		when sum(aj.qntq)=0 then 0
	else 
		round(((sum(aj.bntq - aj.qntq))/sum(aj.qntq)),2)
	end tb
from d_fy_qd fy 
left JOIN (
select 
	c_jbfyid,
	'旧存' as ajlx,
  sum(coalesce(n_jcajs_zxz,0)) as bntq,
	0 as qntq
from t_jspt_qd_sy_sjafx_mouth aj
where c_tjq = to_char(now(),'yyyyMM')
group by c_jbfyid

union all 
select 
	c_jbfyid,
	'新收' as ajlx,
  sum(coalesce(n_xsajs_zxz,0)) as bntq,
	0 as qntq
from t_jspt_qd_sy_sjafx_mouth aj
where c_tjq = to_char(now(),'yyyyMM')
group by c_jbfyid
union all 
select 
	c_jbfyid,
	'已结' as ajlx,
  sum(coalesce(n_yjajs_zxz,0)) as bntq,
	0 as qntq
from t_jspt_qd_sy_sjafx_mouth aj
where c_tjq = to_char(now(),'yyyyMM')
group by c_jbfyid

union all 
select 
	c_jbfyid,
	'未结' as ajlx,
  sum(coalesce(n_wjajs_zxz,0)) as bntq,
	0 as qntq
from t_jspt_qd_sy_sjafx_mouth aj
where c_tjq = to_char(now(),'yyyyMM')
group by c_jbfyid
union all 
select 
	c_jbfyid,
	'总数' as ajlx,
  sum(coalesce(n_jcajs_zxz,0)+coalesce(n_xsajs_zxz,0)) as bntq,
	0 as qntq
from t_jspt_qd_sy_sjafx_mouth aj
where c_tjq = to_char(now(),'yyyyMM')
group by c_jbfyid
union all 

select 
	c_jbfyid,
	'旧存' as ajlx,
  0 as bntq,
	sum(coalesce(n_jcajs_zxz,0)) as qntq
from t_jspt_qd_sy_sjafx_mouth aj
where c_tjq = to_char(now()-interval'1 year','yyyyMM')
group by c_jbfyid

union all 
select 
	c_jbfyid,
	'新收' as ajlx,
  0 as bntq,
	sum(coalesce(n_xsajs_zxz,0)) as qntq
from t_jspt_qd_sy_sjafx_mouth aj
where c_tjq = to_char(now()-interval'1 year','yyyyMM')
group by c_jbfyid
union all 
select 
	c_jbfyid,
	'已结' as ajlx,
  0 as bntq,
	sum(coalesce(n_yjajs_zxz,0)) as qntq
from t_jspt_qd_sy_sjafx_mouth aj
where c_tjq = to_char(now()-interval'1 year','yyyyMM')
group by c_jbfyid

union all 
select 
	c_jbfyid,
	'未结' as ajlx,
  0 as bntq,
	sum(coalesce(n_wjajs_zxz,0)) as qntq
from t_jspt_qd_sy_sjafx_mouth aj
where c_tjq = to_char(now()-interval'1 year','yyyyMM')
group by c_jbfyid
union all 
select 
	c_jbfyid,
	'总数' as ajlx,
  0 as bntq,
	sum(coalesce(n_jcajs_zxz,0)+coalesce(n_xsajs_zxz,0)) as qntq
from t_jspt_qd_sy_sjafx_mouth aj
where c_tjq = to_char(now()-interval'1 year','yyyyMM')
group by c_jbfyid

)aj
on fy.c_fy=substr(aj.c_jbfyid,4)
group by ajlx,fy.c_fy
)syajs
union all 
-- 涉及特殊主体
select 
  public.uuid_generate_v1() as id,
  'sy_stszt' as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,
  null as columnvalue6,
  null as columnvalue7,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  ztlx as columnvalue11,--主体类型
  ajsl as columnvalue12,--案件数
  null as columnvalue13,
  null as columnvalue14 ,
  null as columnvalue15 ,
  null as columnvalue16 ,
  null as columnvalue17 ,
  null as columnvalue18 ,
  null as columnvalue19 ,
  null as columnvalue20 ,
  null as columnvalue21 ,
  null as columnvalue22 ,
  null as columnvalue23 ,
  null as columnvalue24 ,
  null as columnvalue25 ,
  null as columnvalue26 ,
  null as columnvalue27 ,
  null as columnvalue28 ,
  null as columnvalue29 ,
  null as columnvalue30 ,
  null as extendvalue 
from (
--涉军
select 
fy.c_fy as fywd,
aj.ztlx,
aj.ajsl
from 
d_fy_qd fy 
left join (
SELECT 
	c_jbfyid,
	'军队' as ztlx,
	sum(coalesce(n_ajsjz,0)) as ajsl
from t_jspt_qd_sy_ajsj_gdtjq
where 
c_tjq like extract('year' from now())||'%' and
 c_ajsj='涉军' or c_ajsj='涉警'
group by c_jbfyid) aj
on fy.c_fy=substr(aj.c_jbfyid,4)
union all 
--涉党政机构
select 
fy.c_fy as fywd,
aj.ztlx,
aj.ajsl
from 
d_fy_qd fy 
left join (
SELECT 
	c_jbfyid,
	'涉党政机构' as ztlx,
	sum(coalesce(n_ajsjz,0)) as ajsl
from t_jspt_qd_sy_ajsj_gdtjq
where 
c_tjq like extract('year' from now())||'%' and
 c_ajsj='涉国家安全'
group by c_jbfyid) aj
on fy.c_fy=substr(aj.c_jbfyid,4)
union all 
--其他
select 
fy.c_fy as fywd,
aj.ztlx,
aj.ajsl
from 
d_fy_qd fy 
left join (
SELECT 
	c_jbfyid,
	'其他' as ztlx,
	sum(coalesce(n_ajsjz,0)) as ajsl
from t_jspt_qd_sy_ajsj_gdtjq
where 
c_tjq like extract('year' from now())||'%' and
 c_ajsj!='涉国家安全' and c_ajsj!='涉军' and c_ajsj!='涉警'
group by c_jbfyid) aj
on fy.c_fy=substr(aj.c_jbfyid,4)


)sjtszt
union all 
--信用惩戒

select 
  public.uuid_generate_v1() as id,
  'sy_xycj' as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,
  null as columnvalue6,
  null as columnvalue7,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  xzztb as columnvalue11,--限制招投标
  xzcj as columnvalue12,--限制出境
  xzgxf as columnvalue13,--限制高消费
  xzqyfrgg as columnvalue14,--限制企业法人高管
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



)xycj
union all

--限制人次
select 
  public.uuid_generate_v1() as id,
  'sy_xzrc' as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,
  null as columnvalue6,
  null as columnvalue7,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  xzlx as columnvalue11,--限制类型
  rs as columnvalue12,--人数
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



)xzrc





















