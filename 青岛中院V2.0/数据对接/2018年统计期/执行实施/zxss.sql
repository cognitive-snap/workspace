drop view if exists db_dpzjk.v_visu_zxss;
create view db_dpzjk.v_visu_zxss as 

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
  coalesce(yjsl,0)::text as columnvalue12,--预警数量
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
with llyj as(
select 
c_fy as fywd,
sum(coalesce(n_wpcsz,0)) as wp,
sum(coalesce(n_sfakffz,0)) as akff,
sum(coalesce(n_jayjz,0)) as ja
from t_jspt_qd_zxss_llyj_gdtjq ll 
right join d_fy_qd qd on qd.c_fy=substr(ll.c_jbfyid,5)
where substr(c_tjq,1,4)<='2018'
group by c_fy
),
jdaj as(
select
c_fy as fywd,
c_hddc,
sum(coalesce(n_jdaj_sdz,0))as jdaj
from t_jspt_dp_zxss_jdaj_gdtjq jd
right join d_fy_qd qd on qd.c_fy=substr(jd.c_jbfyid,5)
where substr(c_tjq,1,4)<='2018'
group by c_fy,c_hddc
)

select fywd,'网拍' as yjlx,wp as yjsl from llyj
union all 
select '185018620000' as fywd,'网拍' as yjlx,sum(wp) as yjsl from llyj

union all 

select fywd,'案款发放' as yjlx,akff as yjsl from llyj
union all 
select '185018620000' as fywd,'案款发放' as yjlx,sum(akff) as yjsl from llyj

union all 

select fywd,'结案' as yjlx,ja as yjsl from llyj
union all 
select '185018620000' as fywd,'结案' as yjlx,sum(ja) as yjsl from llyj

union all 

select fywd,'执行通知' as yjlx,sum(jdaj) as yjsl from jdaj where c_hddc='执行通知' group by fywd
union all 
select '185018620000' as fywd,'执行通知' as yjlx,sum(jdaj) as yjsl from jdaj where c_hddc='执行通知'

union all 

select fywd,'总对总查询' as yjlx,sum(jdaj) as yjsl from jdaj where c_hddc='点对点查控' group by fywd
union all 
select '185018620000' as fywd,'总对总查询' as yjlx,sum(jdaj) as yjsl from jdaj where c_hddc='点对点查控'

union all 


select c_fy,'终本约谈' as yjlx,COALESCE(yjsl,0) as yjsl from(
select fywd,sum(jdaj) as yjsl from jdaj where c_hddc='终本约谈' group by fywd
) yt right join d_fy_qd qd on qd.c_fy=yt.fywd
union all 
select '185018620000' as fywd,'终本约谈' as yjlx,COALESCE(sum(jdaj),0) as yjsl from jdaj where c_hddc='终本约谈'
)llyj
union all
--拍卖测试数据
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
where schemaid='zxss_ccpm_pmjd' 
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
 from "db_dpzjk"."d_testData_qd"
where schemaid='zxss_wpsj_ajje' 
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
 from "db_dpzjk"."d_testData_qd"
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
  ajsl::text as columnvalue12,--案件数量
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
  ajs::text as columnvalue12,--案件数量
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
with dtjd as(
select 
c_fy as fywd,
sum(coalesce(n_jdaj_sdz,0)) as zjks,
sum(COALESCE(n_cqs_sdz,0)) as cqs
FROM
db_dpzjk.t_jspt_dp_zxss_jdaj_gdtjq  jd
right join d_fy_qd qd on qd.c_fy=substr(jd.c_jbfyid,5)
where   substr(c_tjq,1,4)='2018' 
group by c_fy
) 

select fywd,'总监控数' as lx,zjks as ajs from dtjd
union all 
select '185018620000' as fywd,'总监控数' as lx,sum(zjks) as ajs from dtjd

union all

select fywd,'超期数' as lx,cqs as ajs from dtjd
union all 
select '185018620000' as fywd,'超期数' as lx,sum(cqs) as ajs from dtjd

union all 

select fywd,'正常数' as lx,(zjks-cqs) as ajs from dtjd
union all 
select '185018620000' as fywd,'正常数' as lx,sum(zjks-cqs) as ajs from dtjd
) dtjd


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
  jdzs::text as columnvalue13,--节点总数
  jdcq::text as columnvalue14,--节点超期
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
where dp_jddm is not null and c_fy is not null and substr(lcjd.c_tjq,1,4)='2018' 
GROUP BY fy.c_fy,c_hddc,wd.dp_jddm,c_ajzlbdm,wd.dp_jdjc
union all 
SELECT
	'185018620000' as fywd,
	c_hddc,
	wd.dp_jdjc as jdlcwd,
	case when c_ajzlbdm = '100101' then '首次执行' 
	when c_ajzlbdm = '100102' then '恢复执行' end as c_ajzlb,
	sum(coalesce(n_jdaj_sdz,0)) as ajs,
	sum(coalesce(n_cqs_sdz,0)) as cqs,
	(sum(coalesce(n_jdaj_sdz,0)) - sum(coalesce(n_cqs_sdz,0))) as zcs
FROM
	db_dpzjk.t_jspt_dp_zxss_jdaj_gdtjq lcjd left join db_dpzjk.d_zxlcjdmc wd on lcjd.c_hddc = wd.dp_jdjc
where dp_jddm is not null and substr(lcjd.c_tjq,1,4)='2018' 
GROUP BY c_hddc,wd.dp_jddm,c_ajzlbdm,wd.dp_jdjc
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
where dp_jddm is not null and c_fy is not null and substr(lcjd.c_tjq,1,4)='2018' 
GROUP BY fy.c_fy,c_hddc,wd.dp_jddm,wd.dp_jdjc
union all 
SELECT
	'185018620000' as fywd,
	c_hddc,
	wd.dp_jdjc as jdlcwd,
	'全部案件' as c_ajzlb,
	sum(coalesce(n_jdaj_sdz,0)) as ajs,
	sum(coalesce(n_cqs_sdz,0)) as cqs,
	(sum(coalesce(n_jdaj_sdz,0)) - sum(coalesce(n_cqs_sdz,0))) as zcs
FROM
	db_dpzjk.t_jspt_dp_zxss_jdaj_gdtjq lcjd left join db_dpzjk.d_zxlcjdmc wd on lcjd.c_hddc = wd.dp_jdjc
where dp_jddm is not null  and substr(lcjd.c_tjq,1,4)='2018'
GROUP BY c_hddc,wd.dp_jddm,wd.dp_jdjc
)

select  
	fywd,
	c_ajzlb as ajlx,
	jdlcwd as jdlx,
	ajs as jdzs,
	cqs as jdcq
from jdaj 

)jdsj