drop view if exists db_dpzjk.v_visu_zxzx;
create view  db_dpzjk.v_visu_zxzx as 

--执行质效
select 
  public.uuid_generate_v1() as id,
  'zxzx_zxzx' as schemaid,
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
  zxlx as columnvalue11,--质效类型
  cast(zxz as varchar) as columnvalue12,--质效值
  null as columnvalue13,
  null as columnvalue14,
  null as columnvalue15,
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
from(
--执行完毕率
select 
c_fy as fywd,
'执行完毕率'  as zxlx,
case when fm=0 then 0 else round((fz/1.0/fm*100),1) end as zxz
FROM(
SELECT
c_fy, 
sum(n_sp_zxwbajsz) as fz,
sum(n_yjajs_zxz) as fm 
from t_jspt_qd_zxzx_zxwbl_gdtjq zxwb
right join d_fy_qd qd on qd.c_fy=substr(zxwb.c_jbfyid,5)
where c_tjq like extract(year from now())||'%'
group by c_fy
) zxwb


union all 
--法定期限内结案率
select 
c_fy as fywd,
'法定期限内结案率' as zxlx,
case when fm=0 then 0 else round(fz/1.0/fm*100,1) end as zxz
from(
select 
c_fy,
sum(n_fdqxjasz) as fz,
sum(n_sczxajjasz) as fm
from 
t_jspt_qd_zxzx_fdqxnjal_gdtjq fdja
right join d_fy_qd qd on qd.c_fy=substr(fdja.c_jbfyid,5)
where c_tjq like extract(year from now())||'%'
group by c_fy
) fdjal

)zxzx

union all
--有财产可供执行案件法定期限内实际执结率
--实际执结到位率
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
where schemaid='zxzx_zxzx' 


union all

--质效指标
select 
  public.uuid_generate_v1() as id,
  'zxzx_zxzb' as schemaid,
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
  zxlx as columnvalue11,--质效类型
  cast(bfb as varchar) as columnvalue12,--百分比
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
from(
with zxwbl as(
SELECT
c_fy, 
sum(n_sp_zxwbajsz) as fz,
sum(n_yjajs_zxz) as fm 
from t_jspt_qd_zxzx_zxwbl_gdtjq zxwb 
right join d_fy_qd qd on qd.c_fy=substr(zxwb.c_jbfyid,5)
where c_tjq like extract(year from now())||'%'
group by c_fy
),
hfwb as (
select 
c_fy,
sum(n_zxzb_zxwbz) as fz,
sum(n_zxzb_hfzxajz) as fm
from 
t_jspt_qd_zxzx_hfzxwbl_gdtjq hfzx
right join d_fy_qd qd on qd.c_fy=substr(hfzx.c_jbfyid,5)
where c_tjq like extract(year from now())||'%'
group by c_fy
),
pjys as (
select 
c_jbfyid,
n_zxzb_hfzxajz as ajs,
COALESCE(date_part('day', (dt_jasj::TIMESTAMP-d_hclarq::TIMESTAMP)),0) as sj
from 
t_jspt_qd_zxzx_hfzxpjys
where to_char(dt_kssj_1,'yyyy')=to_char(now(),'yyyy')
),
dwl as (
select 
c_fy,
sum(n_sjdwje) as fz,
sum(n_sqzxbdje) as fm
from t_jspt_qd_zxzx_sjzxdwl dwl
right join d_fy_qd qd on qd.c_fy=substr(dwl.c_jbfyid,5)
where to_char(dt_kssj_1,'yyyy')=to_char(now(),'yyyy')
group by c_fy
)

select 
c_fy as fywd,
'执行完毕率'  as zxlx,
case when fm=0 then 0 else round((fz/1.0/fm*100),1) end as bfb
from  zxwbl

union ALL

select
'185018620000' as fywd,
'执行完毕率'  as zxlx,
case when sum(fm)=0 then 0 else round((sum(fz)/1.0/sum(fm)*100),1) end as bfb 
from zxwbl

union all

select 
c_fy as fywd,
'恢复执行完毕率' as zxlx,
case when fm=0 then 0 else round(fz/1.0/fm*100,1) end as bfb
from hfwb

union all 

select 
'185018620000' as fywd,
'恢复执行完毕率' as zxlx,
case when sum(fm)=0 then 0 else round(sum(fz)/1.0/sum(fm)*100,1) end as bfb
from hfwb

union ALL

select
c_fy as fywd,
'恢复执行平均用时' as zxlx,
case when sum(ajs)=0 then 0 else round(sum(sj::int)/1.0/sum(ajs),1) end as bfb
from pjys right join d_fy_qd qd on qd.c_fy=substr(pjys.c_jbfyid,5)
group by c_fy

union all 

select 
'185018620000' as fywd,
'恢复执行平均用时' as zxlx,
case when sum(ajs)=0 then 0 else round(sum(sj::int)/1.0/sum(ajs),1) end as bfb
from pjys right join d_fy_qd qd on qd.c_fy=substr(pjys.c_jbfyid,5)

union all 
--实际执行到位率
select 
c_fy as fywd,
'实际执行到位率'  as zxlx,
case when fm=0 then 0 else round((fz/1.0/fm*100),1) end as bfb
from  dwl

union ALL

select
'185018620000' as fywd,
'实际执行到位率'  as zxlx,
case when sum(fm)=0 then 0 else round((sum(fz)/1.0/sum(fm)*100),1) end as bfb 
from dwl 

)zxzx

union all 

--指标变化趋势
select 
  public.uuid_generate_v1() as id,
  'zxzx_zbbhqs' as schemaid,
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
  zxlx as columnvalue11,--质效类型
  yf as columnvalue12,--月份
  cast(bz as varchar) as columnvalue13,--比值
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
from(
select
c_fy as fywd,
'执行完毕率' as zxlx,
yf,
case when fm=0 then 0 else round(fz/1.0/fm*100,1) end as bz
from(
select
c_fy,
to_char(dt_kssj_1,'yyyymm') as yf,
COALESCE(sum(n_sp_zxwbajsz),0) as fz,
COALESCE(sum(n_yjajs_zxz),0) as fm
from t_jspt_qd_zxzx_zxwbl wb
right join d_fy_qd qd on qd.c_fy=substr(wb.c_jbfyid,5)
where to_char(dt_kssj_1,'yyyymm') between to_char(now()+'-11 month','yyyymm') and to_char(now(),'yyyymm')
group by c_fy,to_char(dt_kssj_1,'yyyymm')
) zxwbl

union all 

select 
c_fy as fywd,
'恢复执行完毕率' as zxlx,
yf,
case when fm=0 then 0 else round(fz/1.0/fm*100,1) end as bz
from(
select 
c_fy,
to_char(dt_kssj_1,'yyyymm') as yf,
COALESCE(sum(n_zxzb_zxwbz),0) as fz,
COALESCE(sum(n_zxzb_hfzxajz),0) as fm
from t_jspt_qd_zxzx_hfzxwbl hfwb
right join d_fy_qd qd on qd.c_fy=substr(hfwb.c_jbfyid,5)
where to_char(dt_kssj_1,'yyyymm') between to_char(now()+'-11 month','yyyymm') and to_char(now(),'yyyymm')
group by c_fy,to_char(dt_kssj_1,'yyyymm')
) hfzxwbl

union all 

select 
c_fy as fywd,
'恢复执行平均用时' as zxlx,
yf,
case when fm=0 then 0 else round(fz::int/1.0/fm,1) end as bz
from(
select 
c_fy,
to_char(dt_kssj_1,'yyyymm') as yf,
sum(COALESCE(date_part('day', (dt_jasj::TIMESTAMP-d_hclarq::TIMESTAMP)),0)) as fz,
sum(n_zxzb_hfzxajz) as fm
from t_jspt_qd_zxzx_hfzxpjys pj
right join d_fy_qd qd on qd.c_fy=substr(pj.c_jbfyid,5)
where to_char(dt_kssj_1,'yyyymm') between to_char(now()+'-11 month','yyyymm') and to_char(now(),'yyyymm')
group by c_fy,to_char(dt_kssj_1,'yyyymm')
) hfzxpjys

union all 
--实际执行到位率
select
c_fy as fywd,
'实际执行到位率' as zxlx,
yf,
case when fm=0 then 0 else round(fz/1.0/fm*100,1) end as bz
from(
select 
c_fy,
to_char(dt_kssj_1,'yyyymm') as yf,
COALESCE(sum(n_sjdwje),0) as fz,
COALESCE(sum(n_sqzxbdje),0) as fm
from t_jspt_qd_zxzx_sjzxdwl dwl
right join d_fy_qd qd on qd.c_fy=substr(dwl.c_jbfyid,5)
where to_char(dt_kssj_1,'yyyymm') between to_char(now()+'-11 month','yyyymm') and to_char(now(),'yyyymm')
group by c_fy,to_char(dt_kssj_1,'yyyymm')
) sjzxdwl
) zxzx



