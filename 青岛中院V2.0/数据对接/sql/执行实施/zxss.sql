drop view if exists db_dpzjk.v_visu_zxss;
create view db_dpzjk,v_visu_zxss as 

-- 流量预警
select 
  public.uuid_generate_v1() as id,
  'zxss_llyj'as schemaid,
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
  yjlx as columnvalue11,--指标类型
  yjsl as columnvalue12,--预警数量
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
from 
(
select 
	fy.c_fy as fywd,
	llyj.yjlx,
	llyj.yjsl
from d_fy_qd fy
left join (
--统计期是减少3天
select 
	c_jbfyid,
	'网拍'as yjlx,
	sum(coalesce(n_wpcsz,0)) as yjsl
from t_jspt_qd_zxss_llyj_gdtjq 
where c_tjq like extract('year'from now())||'%'
group by c_jbfyid
union all 
select 
	'0000185018620000'as c_jbfyid,
	'网拍'as yjlx,
	sum(coalesce(n_wpcsz,0)) as yjsl
from t_jspt_qd_zxss_llyj_gdtjq 
where c_tjq like extract('year'from now())||'%'
union all 
select 
	c_jbfyid,
	'案款发放'as yjlx,
	sum(coalesce(n_sfakffz,0)) as yjsl
from t_jspt_qd_zxss_llyj_gdtjq 
where c_tjq like extract('year'from now())||'%'
group by c_jbfyid
union all 
select 
	'0000185018620000'as c_jbfyid,
	'案款发放'as yjlx,
	sum(coalesce(n_sfakffz,0)) as yjsl
from t_jspt_qd_zxss_llyj_gdtjq 
where c_tjq like extract('year'from now())||'%'
union all 
select 
	c_jbfyid,
	'结案'as yjlx,
	sum(coalesce(n_jayjz,0)) as yjsl
from t_jspt_qd_zxss_llyj_gdtjq 
where c_tjq like extract('year'from now())||'%'
group by c_jbfyid
union all 
select 
	'0000185018620000'as c_jbfyid,
	'结案'as yjlx,
	sum(coalesce(n_jayjz,0)) as yjsl
from t_jspt_qd_zxss_llyj_gdtjq 
where c_tjq like extract('year'from now())||'%'
union all 
select 
	c_jbfyid,
	'执行通知' as yjlx,
	sum(coalesce(n_jdaj_sdz,0))as yjsl
from t_jspt_zxss_jdaj
where c_tjq like extract('year'from now())||'%'
group by c_jbfyid
union all 
select 
	'0000185018620000' as c_jbfyid,
	'执行通知' as yjlx,
	sum(coalesce(n_jdaj_sdz,0))as yjsl
from t_jspt_zxss_jdaj
where c_tjq like extract('year'from now())||'%' and  c_hddc='执行通知'

union all 
select 
	c_jbfyid,
	'总对总查询' as yjlx,
	sum(coalesce(n_jdaj_sdz,0))as yjsl
from t_jspt_zxss_jdaj
where c_tjq like extract('year'from now())||'%'and  c_hddc='点对点查控'
group by c_jbfyid
union all 
select 
	'0000185018620000' as c_jbfyid,
	'总对总查询' as yjlx,
	sum(coalesce(n_jdaj_sdz,0))as yjsl
from t_jspt_zxss_jdaj
where c_tjq like extract('year'from now())||'%'and  c_hddc='点对点查控'
union all 
select 
	c_jbfyid,
	'终本约谈' as yjlx,
	sum(coalesce(n_jdaj_sdz,0))as yjsl
from t_jspt_zxss_jdaj
where c_tjq like extract('year'from now())||'%'and  c_hddc='终本约谈'
group by c_jbfyid
union all 
select 
	'0000185018620000' as c_jbfyid,
	'终本约谈' as yjlx,
	sum(coalesce(n_jdaj_sdz,0))as yjsl
from t_jspt_zxss_jdaj
where c_tjq like extract('year'from now())||'%'and  c_hddc='终本约谈'
)llyj
on fy.c_fy = substr(llyj.c_jbfyid,5)
)llyj
union all
--拍卖测试数据
select * from "db_dpzjk"."d_testData_qd"
where schemaid='zxss_ccpm_pmjd' 
union all 
select * from "db_dpzjk"."d_testData_qd"
where schemaid='zxss_wpsj_ajje' 
union all 
select * from "db_dpzjk"."d_testData_qd"
where schemaid='zxss_wpsj_pmxx' 
-- 网络拍卖-拍卖阶段
/*select 	
  public.uuid_generate_v1() as id,
  'zxss_ccpm_pmjd'as schemaid,
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
  pmjj as columnvalue11,--拍卖阶段
  ajsl as columnvalue12,--案件数量
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
from 
(



)pmjd
union all

-- 网络拍卖-案件金额
select 	
  public.uuid_generate_v1() as id,
  'zxss_wpsj_ajje'as schemaid,
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
  ajje as columnvalue11,--案件/金额
  sl as columnvalue12,--数量
  tbfh as columnvalue13,--同比符号
  tb as columnvalue14,--同比
  hbfh as columnvalue15,--环比符号
  hb as columnvalue16,--环比
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
from 
(



)ajje
union all

-- 网络拍卖-拍卖信息
select 	
  public.uuid_generate_v1() as id,
  'zxss_wpsj_pmxx'as schemaid,
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
  cbr as columnvalue11,--承办人
  pmsl as columnvalue12,--拍卖数量
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
from 
(



)pmxx
*/


union all
--超期未结案件
select 	
  public.uuid_generate_v1() as id,
  'zxss_cqwjaj'as schemaid,
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
  ajlx as columnvalue11,--案件类型
  ajsl as columnvalue12,--案件数量
  cssj as columnvalue13,--超时阶段
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
from 
(
with glwjaqk as (
--超一个月
select
	fy.c_fy as fywd,
	'超一个月' as cqsj,
	c_ajlb as ajlb,
	sum(COALESCE(n_cqyywjz,0)::numeric) as sl
	from t_jspt_qd_zxss_cqwjaj  wjaj
right join d_fy_qd fy on fy.c_fy = substr(wjaj.c_jbfyid,5)
	group by ajlb,fy.c_fy 
union ALL
--超期两个月
select
	fy.c_fy as fywd,
	'超两个月' as cqsj,
	c_ajlb as ajlb,
	sum(COALESCE(n_t_cqlywjz,0)::numeric) as sl
	from t_jspt_qd_zxss_cqwjaj  wjaj
right join d_fy_qd fy on fy.c_fy = substr(wjaj.c_jbfyid,5)
	group by ajlb,fy.c_fy 
--超期三个月
union all
select
	fy.c_fy as fywd,
	'超三个月' as cqsj,
	c_ajlb as ajlb,
	sum(COALESCE(n_cqsywjz,0)::numeric) as sl
from t_jspt_qd_zxss_cqwjaj  wjaj
right join d_fy_qd fy on fy.c_fy = substr(wjaj.c_jbfyid,5)
group by ajlb,fy.c_fy 
union all 
--超期半年
select 
	fy.c_fy as fywd,
	'超半年以上' as cqsj,
	c_ajlb as ajlb,
	sum(coalesce(n_cqbnyswjz,0)::numeric) as sl
from t_jspt_qd_zxss_cqwjaj  wjaj
right join d_fy_qd fy on fy.c_fy = substr(wjaj.c_jbfyid,5)
group by ajlb,fy.c_fy 
union all 
select
	'0000185018620000' as fywd,
	'超一个月' as cqsj,
	c_ajlb as ajlb,
	sum(COALESCE(n_cqyywjz,0)::numeric) as sl
	from t_jspt_qd_zxss_cqwjaj  wjaj
right join d_fy_qd fy on fy.c_fy = substr(wjaj.c_jbfyid,5)
	group by ajlb
union ALL
--超期两个月
select
	'0000185018620000' as fywd,
	'超两个月' as cqsj,
	c_ajlb as ajlb,
	sum(COALESCE(n_t_cqlywjz,0)::numeric) as sl
	from t_jspt_qd_zxss_cqwjaj  wjaj
right join d_fy_qd fy on fy.c_fy = substr(wjaj.c_jbfyid,5)
	group by ajlb
--超期三个月
union all
select
	'0000185018620000' as fywd,
	'超三个月' as cqsj,
	c_ajlb as ajlb,
	sum(COALESCE(n_cqsywjz,0)::numeric) as sl
from t_jspt_qd_zxss_cqwjaj  wjaj
right join d_fy_qd fy on fy.c_fy = substr(wjaj.c_jbfyid,5)
group by ajlb
union all 
--超期半年
select 
	'0000185018620000' as fywd,
	'超半年以上' as cqsj,
	c_ajlb as ajlb,
	sum(coalesce(n_cqbnyswjz,0)::numeric) as sl
from t_jspt_qd_zxss_cqwjaj  wjaj
right join d_fy_qd fy on fy.c_fy = substr(wjaj.c_jbfyid,5)
group by ajlb
)
select 
	fywd,
	cqsj as cssj,
	sl as ajsl,
	ajlb as ajlx
from glwjaqk
union all 
--求各类案件类型总数
select 
	fywd,
	null as cqsj,
	sum(sl) as ajsl,
case 
		when ajlb='刑事案件' then '刑事总数'
		when ajlb='民事案件' then '民事总数'
		when ajlb='行政案件' then '行政总数'
		when ajlb='执行类案件' then '执行总数'
	end  as ajlx
from glwjaqk
group by ajlb,fywd

union all 
--求各类案件类型占比
select
	fywd, 
	null as cqsj,
	case when 
	(select sum(sl) from glwjaqk)::numeric=0 then 0
else
	round((sum(sl)::numeric)/1.0/((select sum(sl) from glwjaqk)::numeric)*100,1)
	end  as ajsl,
case 
		when ajlb='刑事案件' then '刑事占比'
		when ajlb='民事案件' then '民事占比'
		when ajlb='行政案件' then '行政占比'
		when ajlb='执行类案件' then '执行占比'
	end  as ajlx
from glwjaqk
group by ajlb,fywd


)cqwjaj


union all
--地图节点数据
select 	
  public.uuid_generate_v1() as id,
  'zxss_dtjd'as schemaid,
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
  lx as columnvalue11,--案件类型
  ajs as columnvalue12,--案件数量
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
from 
(
with ajph as (
select 
	fy.c_fy as fywd,
	'总监控数' as lx,
	coalesce(ajs,0) as ajs
from (
SELECT
  c_jbfyid,
	sum(coalesce(n_jdaj_sdz,0)) as ajs
FROM
	db_dpzjk.t_jspt_dp_zxss_jdaj_gdtjq 
where   c_tjq like (extract('year' from now())||'%'::text) 
GROUP BY c_jbfyid
union all 
SELECT
  '0000185018620000'as c_jbfyid,
	sum(coalesce(n_jdaj_sdz,0)) as ajs
FROM
	db_dpzjk.t_jspt_dp_zxss_jdaj_gdtjq 
where   c_tjq like (extract('year' from now())||'%'::text) 
)ajsl
right join d_fy_qd fy on fy.c_fy = substr(ajsl.c_jbfyid,5)
group by fy.c_fy,ajsl.ajs

union all 
select 
	fy.c_fy as fywd,
	'超期数' as lx,
	coalesce(ajs,0) as ajs
from (
SELECT
  c_jbfyid,
	sum(coalesce(n_cqs_sdz,0)) as ajs
FROM
	db_dpzjk.t_jspt_dp_zxss_jdaj_gdtjq 
where   c_tjq like (extract('year' from now())||'%'::text) 
GROUP BY c_jbfyid
union all 
SELECT
  '0000185018620000'as c_jbfyid,
	sum(coalesce(n_cqs_sdz,0)) as ajs
FROM
	db_dpzjk.t_jspt_dp_zxss_jdaj_gdtjq 
where   c_tjq like (extract('year' from now())||'%'::text) 

)ajsl
right join d_fy_qd fy on fy.c_fy = substr(ajsl.c_jbfyid,5)
group by fy.c_fy,ajsl.ajs
union all 
select 
	fy.c_fy as fywd,
	'正常数' as lx,
	coalesce(ajs,0) as ajs
from (
SELECT
  c_jbfyid,
	(sum(coalesce(n_jdaj_sdz,0)) - sum(coalesce(n_cqs_sdz,0))) as ajs
FROM
	db_dpzjk.t_jspt_dp_zxss_jdaj_gdtjq 
where   c_tjq like (extract('year' from now())||'%'::text) 
GROUP BY c_jbfyid
union all 
SELECT
  '0000185018620000'as c_jbfyid,
	(sum(coalesce(n_jdaj_sdz,0)) - sum(coalesce(n_cqs_sdz,0))) as ajs
FROM
	db_dpzjk.t_jspt_dp_zxss_jdaj_gdtjq 
where   c_tjq like (extract('year' from now())||'%'::text) 

)ajsl
right join d_fy_qd fy on fy.c_fy = substr(ajsl.c_jbfyid,5)
group by fy.c_fy,ajsl.ajs
)
select 
	fywd,
	lx,
	ajs
from ajph


)dtjd


union all
--节点数据
select 	
  public.uuid_generate_v1() as id,
  'zxss_jdsj'as schemaid,
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
  ajlx as columnvalue11,--案件类型
  jdlx as columnvalue12,--节点类型
  jdzs as columnvalue13,--节点总数
  jdcq as columnvalue14,--节点超期
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
from 
(
with jdaj as (
SELECT
	fy.c_fy as fywd,
	c_hddc,
	wd.dp_jdjc as jdlcwd,
	case when c_ajzlbdm = '100101' then '首次执行' 
	when c_ajzlbdm = '100102' then '恢复执行' end as c_ajzlb,
	sum(coalesce(n_jdaj_sdz,0)) as ajs,
	sum(coalesce(n_cqs_sdz,0)) as cqs,
	(sum(coalesce(n_jdaj_sdz,0)) - sum(coalesce(n_cqs_sdz,0))) as zcs
FROM
	db_dpzjk.t_jspt_dp_zxss_jdaj_gdtjq lcjd left join db_dpzjk.d_zxlcjdmc wd on lcjd.c_hddc = wd.dp_jdjc
inner join d_fy_qd fy  on fy.c_fy = substr(lcjd.c_jbfyid,5)
where dp_jddm is not null and c_fy is not null and lcjd.c_tjq like (extract('year' from now())||'%'::text)
GROUP BY fy.c_fy,c_hddc,wd.dp_jddm,c_ajzlbdm
union all 
SELECT
	'0000185018620000'as as fywd,
	c_hddc,
	wd.dp_jdjc as jdlcwd,
	case when c_ajzlbdm = '100101' then '首次执行' 
	when c_ajzlbdm = '100102' then '恢复执行' end as c_ajzlb,
	sum(coalesce(n_jdaj_sdz,0)) as ajs,
	sum(coalesce(n_cqs_sdz,0)) as cqs,
	(sum(coalesce(n_jdaj_sdz,0)) - sum(coalesce(n_cqs_sdz,0))) as zcs
FROM
	db_dpzjk.t_jspt_dp_zxss_jdaj_gdtjq lcjd left join db_dpzjk.d_zxlcjdmc wd on lcjd.c_hddc = wd.dp_jdjc
where dp_jddm is not null and lcjd.c_tjq like (extract('year' from now())||'%'::text)
GROUP BY c_hddc,wd.dp_jddm,c_ajzlbdm
union all 
--案件总数
SELECT
	fy.c_fy as fywd,
	c_hddc,
	wd.dp_jdjc as jdlcwd,
	'全部案件' as c_ajzlb,
	sum(coalesce(n_jdaj_sdz,0)) as ajs,
	sum(coalesce(n_cqs_sdz,0)) as cqs,
	(sum(coalesce(n_jdaj_sdz,0)) - sum(coalesce(n_cqs_sdz,0))) as zcs
FROM
	db_dpzjk.t_jspt_dp_zxss_jdaj_gdtjq lcjd left join db_dpzjk.d_zxlcjdmc wd on lcjd.c_hddc = wd.dp_jdjc
inner join d_fy_qd fy  on fy.c_fy = substr(lcjd.c_jbfyid,5)
where dp_jddm is not null and c_fy is not null and lcjd.c_tjq like (extract('year' from now())||'%'::text)
GROUP BY fy.c_fy,c_hddc,wd.dp_jddm
union all 
SELECT
	'0000185018620000'as as fywd,
	c_hddc,
	wd.dp_jdjc as jdlcwd,
	'全部案件' as c_ajzlb,
	sum(coalesce(n_jdaj_sdz,0)) as ajs,
	sum(coalesce(n_cqs_sdz,0)) as cqs,
	(sum(coalesce(n_jdaj_sdz,0)) - sum(coalesce(n_cqs_sdz,0))) as zcs
FROM
	db_dpzjk.t_jspt_dp_zxss_jdaj_gdtjq lcjd left join db_dpzjk.d_zxlcjdmc wd on lcjd.c_hddc = wd.dp_jdjc
where dp_jddm is not null  and lcjd.c_tjq like (extract('year' from now())||'%'::text)
GROUP BY c_hddc,wd.dp_jddm
)

select  
	fywd,
	c_ajzlbdm as ajlx,
	jdlcwd as jdlx,
	ajs as jdzs,
	cqs as jdcq
from jdaj 

)jdsj