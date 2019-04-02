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
  yjs as columnvalue12,-- 已结案件数
  wjs as columnvalue13,-- 未结案件数
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
fy.c_fy,
aj.ajlx,
aj.yjs,
aj.wjs
from d_fy_qd fy
left join (
SELECT
	c_jbfyid,
	'审查类' AS ajlx,
	SUM (n_scl_yjajz) AS yjs,
	SUM (n_scl_wjajz) AS wjs
FROM
	db_dpzjk.t_jspt_qd_zxsc_zxajfl_gdtjq
WHERE
	c_tjq LIKE (
		EXTRACT (YEAR FROM now()) || '%'
	)
GROUP BY
	c_jbfyid
union all 
SELECT
	c_jbfyid,
	'异议类' AS ajlx,
	SUM (n_yyl_yjajz) AS yjs,
	SUM (n_yyl_wjajz) AS wjs
FROM
	db_dpzjk.t_jspt_qd_zxsc_zxajfl_gdtjq
WHERE
	c_tjq LIKE (
		EXTRACT (YEAR FROM now()) || '%'
	)
GROUP BY
	c_jbfyid

union all 

SELECT
	c_jbfyid,
	'复议类' AS ajlx,
	SUM (n_fyl_yjajz) AS yjs,
	SUM (n_fyl_wjajz) AS wjs
FROM
	db_dpzjk.t_jspt_qd_zxsc_zxajfl_gdtjq
WHERE
	c_tjq LIKE (
		EXTRACT (YEAR FROM now()) || '%'
	)
GROUP BY
	c_jbfyid
union all 
SELECT
	c_jbfyid,
	'监督类' AS ajlx,
	SUM (n_jdl_yjajz) AS yjs,
	SUM (n_jdl_wjajz) AS wjs
FROM
	db_dpzjk.t_jspt_qd_zxsc_zxajfl_gdtjq
WHERE
	c_tjq LIKE (
		EXTRACT (YEAR FROM now()) || '%'
	)
GROUP BY
	c_jbfyid
)aj
on fy.c_fy = substr(aj.c_jbfyid,5)
)zxajfl
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
  ajs as columnvalue12,-- 案件数
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
else round(sum(coalesce(n_scl_yjajz,0))/sum(coalesce(n_xsscajz,0)),2)
end as ajs
from 
	t_jspt_qd_zxsc_sclaj_gdtjq 
where c_tjq like extract('year' from now())||'%'
group by c_jbfyid
union all 
--未结案件数量
select 
c_jbfyid,
'wjajsl' as sxlx,
sum(coalesce(n_scl_wjajz,0)) as ajs
from 
	t_jspt_qd_zxsc_sclaj_gdtjq 
where c_tjq like extract('year' from now())||'%'
group by c_jbfyid
union all 
--案件总数
select 
c_jbfyid,
'wjajsl' as sxlx,
sum(coalesce(n_scl_wjajz,0)+coalesce(n_scl_yjajz,0)) as ajs
from 
	t_jspt_qd_zxsc_sclaj_gdtjq 
where c_tjq like extract('year' from now())||'%'
group by c_jbfyid
) aj 
on fy.c_fy = substr(aj.c_jbfyid,5)



)sclaj


union all
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
  yf as columnvalue11,--月份
  ajs as columnvalue12,--案件数
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
	c_jbfyid as fywd,
	c_tjq,
	sum(coalesce(n_xsajs_zxz,0))as ajs
from t_jspt_qd_sy_sjafx_mouth sja
right join d_fy_qd fy on fy.c_fy = substr(sja.c_jbfyid,5)
where c_tjq like extract('year' from now())||'%'
group by c_jbfyid,c_tjq
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
  ajs as columnvalue12,--案件数
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





)jwn