drop view if exists db_dpzjk.v_visu_sy;
create view db_dpzjk.v_visu_sy as

--质效指标排行

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
  cast(coalesce(zbsz,0)as text) as columnvalue12,--指标数值
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
	else round(aj.fz::numeric/aj.fm::numeric*100,2) 
	end as zbsz
from d_fy_qd fy
LEFT JOIN(
select 
c_jbfyid,
sum(COALESCE(n_fdsxnzjsz,0)) as fz,
sum(COALESCE(n_fdsxnjasz,0)) as fm
from t_jspt_qd_sy_fdsxnzjl_gdtjq 
where substr(c_tjq,1,4)='2018'
group by c_jbfyid
) aj
on fy.c_fy=substr(aj.c_jbfyid,5)
where fy.c_fy!='185018620000'
union all
--终本案件合格率
select 
'终本案件合格率' as zbmc,
fy.c_fy as fywd,
fy.c_fymc,
COALESCE(round(aj.fz::numeric/aj.fm::numeric*100,2),0) as zbsz
from d_fy_qd fy
LEFT JOIN(
select 
c_jbfyid,
sum(COALESCE(n_zbajsz,0)) as fm,
sum(COALESCE(n_zbhgajz,0)) as fz
from t_jspt_qd_sy_zbajhgl_gdtjq 
where substr(c_tjq,1,4)='2018'
group by c_jbfyid
) aj
on fy.c_fy=substr(aj.c_jbfyid,5)
where fy.c_fy!='185018620000'
union all 
--执行案件执结率
select 
'执行案件执结率' as zbmc,
fy.c_fy as fywd,
fy.c_fymc,
round(aj.fz::numeric/aj.fm::numeric*100,2) as zbsz
from d_fy_qd fy
LEFT JOIN(
select 
c_jbfyid,
sum(COALESCE(n_yjajs_zxz,0)) as fm,
sum(COALESCE(n_zjlajz,0)) as fz
from t_jspt_qd_sy_zxajzjl_gdtjq 
where substr(c_tjq,1,4)='2018'
group by c_jbfyid
) aj
on fy.c_fy=substr(aj.c_jbfyid,5)
where fy.c_fy!='185018620000'
)zxzbph
union all 
----信访案件办结率(测试数据)
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
from "db_dpzjk"."d_testData_qd"
where schemaid='sy_zxzbph' and columnvalue11='信访案件办结率'
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
  cast(ajlx as text) as columnvalue11,--案件类型
  cast(ajs as text)as columnvalue12,--案件数
  cast(tb as text) as columnvalue13,--同比
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
with ajs as(
select 
	c_fy as fywd,
  substr(c_tjq,1,4) as sj,
  sum(coalesce(n_zx_jcajz,0)+coalesce(n_zx_xsajz,0)) as zs,
	sum(COALESCE(n_zx_jcajz,0)) as jc,
  sum(COALESCE(n_zx_wjajz,0)) as wj,
	sum(COALESCE(n_zx_xsajz,0)) as xs,
  sum(COALESCE(n_zx_yjajz,0)) as yj
from t_jspt_qd_sy_sjafx_mouth aj right join d_fy_qd qd on qd.c_fy=substr(aj.c_jbfyid,5)
group by c_fy,substr(c_tjq,1,4)
)
select jn.fywd,jn.ajlx,jntq as ajs,case when qntq=0 then 0 else round((jntq-qntq)/1.0/qntq*100,1) end as tb
from(
select fywd,'总数' as ajlx,zs as jntq from ajs where sj='2018'
union all 
select '185018620000' as fywd,'总数' as ajlx,sum(zs) as jntq from ajs where sj='2018'

union all

select fywd,'旧存' as ajlx,jc as jntq from ajs where sj='2018'
union all 
select '185018620000' as fywd,'旧存' as ajlx,sum(jc) as jntq from ajs where sj='2018'

union all 

select fywd,'未结' as ajlx,wj as jntq from ajs where sj='2018'
union all 
select '185018620000' as fywd,'未结' as ajlx,sum(wj) as jntq from ajs where sj='2018'

union all 

select fywd,'新收' as ajlx,xs as jntq from ajs where sj='2018'
union all 
select '185018620000' as fywd,'新收' as ajlx,sum(xs) as jntq from ajs where sj='2018'

union all 

select fywd,'已结' as ajlx,yj as jntq from ajs where sj='2018'
union all 
select '185018620000' as fywd,'已结' as ajlx,sum(yj) as jntq from ajs where sj='2018'
) jn 
left join 
(
select fywd,'总数' as ajlx,zs as qntq from ajs where sj='2017'
union all 
select '185018620000' as fywd,'总数' as ajlx,sum(zs) as qntq from ajs where sj='2017'

union all

select fywd,'旧存' as ajlx,jc as qntq from ajs where sj='2017'
union all 
select '185018620000' as fywd,'旧存' as ajlx,sum(jc) as qntq from ajs where sj='2017'

union all 

select fywd,'未结' as ajlx,wj as qntq from ajs where sj='2017'
union all 
select '185018620000' as fywd,'未结' as ajlx,sum(wj) as qntq from ajs where sj='2017'

union all 

select fywd,'新收' as ajlx,xs as qntq from ajs where sj='2017'
union all 
select '185018620000' as fywd,'新收' as ajlx,sum(xs) as qntq from ajs where sj='2017'

union all 

select fywd,'已结' as ajlx,yj as qntq from ajs where sj='2017'
union all 
select '185018620000' as fywd,'已结' as ajlx,sum(yj) as qntq from ajs where sj='2017'
)qn on jn.fywd=qn.fywd and jn.ajlx=qn.ajlx order by fywd
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
  ajsl::text as columnvalue12,--案件数
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
substr(c_tjq,1,4)='2018'  and
 c_ajsj='涉军' or c_ajsj='涉警'
group by c_jbfyid
union all 
SELECT 
	c_jbfyid,
	'涉党政机构' as ztlx,
	sum(coalesce(n_ajsjz,0)) as ajsl
from t_jspt_qd_sy_ajsj_gdtjq
where 
substr(c_tjq,1,4)='2018'  and
 c_ajsj='涉国家安全'
group by c_jbfyid
union all 
SELECT 
	c_jbfyid,
	'其他' as ztlx,
	sum(coalesce(n_ajsjz,0)) as ajsl
from t_jspt_qd_sy_ajsj_gdtjq
where 
substr(c_tjq,1,4)='2018' and
 c_ajsj!='涉国家安全' and c_ajsj!='涉军' and c_ajsj!='涉警'
group by c_jbfyid
union all 
SELECT 
	'0000185018620000'as c_jbfyid,
	'军队' as ztlx,
	sum(coalesce(n_ajsjz,0)) as ajsl
from t_jspt_qd_sy_ajsj_gdtjq
where 
substr(c_tjq,1,4)='2018'  and
 c_ajsj='涉军' or c_ajsj='涉警'
union all 
SELECT 
	'0000185018620000'as c_jbfyid,
	'涉党政机构' as ztlx,
	sum(coalesce(n_ajsjz,0)) as ajsl
from t_jspt_qd_sy_ajsj_gdtjq
where 
substr(c_tjq,1,4)='2018'  and
 c_ajsj='涉国家安全'
union all 
SELECT 
	'0000185018620000'as c_jbfyid,
	'其他' as ztlx,
	sum(coalesce(n_ajsjz,0)) as ajsl
from t_jspt_qd_sy_ajsj_gdtjq
where 
substr(c_tjq,1,4)='2018' and
 c_ajsj!='涉国家安全' and c_ajsj!='涉军' and c_ajsj!='涉警'

) aj
on fy.c_fy=substr(aj.c_jbfyid,5)
)sjtszt
union all 
select 	public.uuid_generate_v1() as id,
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
where schemaid ='sy_xycj'
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
where schemaid ='sy_xzrc'

--信用惩戒
/*
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
*/
union all

--首页新收已结统计
select 
  public.uuid_generate_v1() as id,
  'sy_xsyjtj'as schemaid,
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
  lx as columnvalue11,--指标名称
  cast(ajs as text) as  columnvalue12,--指标数值
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
with xs as (
select qd.c_fy,COALESCE(xs,0) as xs
from(
select
c_fy,
sum(n_zx_xsajz) as xs
from 
t_jspt_qd_sy_sjafx sja
right join d_fy_qd qd on qd.c_fy=substr(sja.c_jbfyid,5)
where to_char(dt_kssj_1,'yyyymmdd')=to_char(now()+'-1 year','yyyymmdd')
group by c_fy
) xs right join d_fy_qd qd on qd.c_fy=xs.c_fy
),
yj as (
select qd.c_fy,COALESCE(yj,0) as yj 
from(
select 
c_fy,
sum(n_zx_yjajz) as yj
from 
t_jspt_qd_sy_sjafx sja
right join d_fy_qd qd on qd.c_fy=substr(sja.c_jbfyid,5)
where to_char(dt_kssj_2,'yyyymmdd')=to_char(now()+'-1 year','yyyymmdd')
group by c_fy
) yj right join d_fy_qd qd on qd.c_fy=yj.c_fy
)
--新收
select c_fy as fywd,'新收' as lx,xs as ajs from xs
union all 
select '185018620000' as fywd,'新收' as lx,sum(xs) as ajs from xs
--已结
union all 
select c_fy as fywd,'已结' as lx,yj as ajs from yj
union all 
select '185018620000' as fywd,'已结' as lx,sum(yj) as ajs from yj
) xsyj;

ALTER TABLE "db_dpzjk"."v_visu_sy" OWNER TO "dpzjk";