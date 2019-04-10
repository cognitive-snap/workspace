drop view if exists db_dpzjk.v_visu_zxss;
create view db_dpzjk,v_visu_zxss as 

-- ����Ԥ��
select 
  public.uuid_generate_v1() as id,
  'zxss_llyj'as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,--��Ժά��
  null as columnvalue6,
  null as columnvalue7,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  yjlx as columnvalue11,--ָ������
  yjsl as columnvalue12,--Ԥ������
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
--ͳ�����Ǽ���3��
select 
	c_jbfyid,
	'����'as yjlx,
	sum(coalesce(n_wpcsz,0)) as yjsl
from t_jspt_qd_zxss_llyj_gdtjq 
where c_tjq like extract('year'from now())||'%'
group by c_jbfyid
union all 
select 
	'0000185018620000'as c_jbfyid,
	'����'as yjlx,
	sum(coalesce(n_wpcsz,0)) as yjsl
from t_jspt_qd_zxss_llyj_gdtjq 
where c_tjq like extract('year'from now())||'%'
union all 
select 
	c_jbfyid,
	'�����'as yjlx,
	sum(coalesce(n_sfakffz,0)) as yjsl
from t_jspt_qd_zxss_llyj_gdtjq 
where c_tjq like extract('year'from now())||'%'
group by c_jbfyid
union all 
select 
	'0000185018620000'as c_jbfyid,
	'�����'as yjlx,
	sum(coalesce(n_sfakffz,0)) as yjsl
from t_jspt_qd_zxss_llyj_gdtjq 
where c_tjq like extract('year'from now())||'%'
union all 
select 
	c_jbfyid,
	'�᰸'as yjlx,
	sum(coalesce(n_jayjz,0)) as yjsl
from t_jspt_qd_zxss_llyj_gdtjq 
where c_tjq like extract('year'from now())||'%'
group by c_jbfyid
union all 
select 
	'0000185018620000'as c_jbfyid,
	'�᰸'as yjlx,
	sum(coalesce(n_jayjz,0)) as yjsl
from t_jspt_qd_zxss_llyj_gdtjq 
where c_tjq like extract('year'from now())||'%'
union all 
select 
	c_jbfyid,
	'ִ��֪ͨ' as yjlx,
	sum(coalesce(n_jdaj_sdz,0))as yjsl
from t_jspt_zxss_jdaj
where c_tjq like extract('year'from now())||'%'
group by c_jbfyid
union all 
select 
	'0000185018620000' as c_jbfyid,
	'ִ��֪ͨ' as yjlx,
	sum(coalesce(n_jdaj_sdz,0))as yjsl
from t_jspt_zxss_jdaj
where c_tjq like extract('year'from now())||'%' and  c_hddc='ִ��֪ͨ'

union all 
select 
	c_jbfyid,
	'�ܶ��ܲ�ѯ' as yjlx,
	sum(coalesce(n_jdaj_sdz,0))as yjsl
from t_jspt_zxss_jdaj
where c_tjq like extract('year'from now())||'%'and  c_hddc='��Ե���'
group by c_jbfyid
union all 
select 
	'0000185018620000' as c_jbfyid,
	'�ܶ��ܲ�ѯ' as yjlx,
	sum(coalesce(n_jdaj_sdz,0))as yjsl
from t_jspt_zxss_jdaj
where c_tjq like extract('year'from now())||'%'and  c_hddc='��Ե���'
union all 
select 
	c_jbfyid,
	'�ձ�Լ̸' as yjlx,
	sum(coalesce(n_jdaj_sdz,0))as yjsl
from t_jspt_zxss_jdaj
where c_tjq like extract('year'from now())||'%'and  c_hddc='�ձ�Լ̸'
group by c_jbfyid
union all 
select 
	'0000185018620000' as c_jbfyid,
	'�ձ�Լ̸' as yjlx,
	sum(coalesce(n_jdaj_sdz,0))as yjsl
from t_jspt_zxss_jdaj
where c_tjq like extract('year'from now())||'%'and  c_hddc='�ձ�Լ̸'
)llyj
on fy.c_fy = substr(llyj.c_jbfyid,5)
)llyj
union all
--������������
select * from "db_dpzjk"."d_testData_qd"
where schemaid='zxss_ccpm_pmjd' 
union all 
select * from "db_dpzjk"."d_testData_qd"
where schemaid='zxss_wpsj_ajje' 
union all 
select * from "db_dpzjk"."d_testData_qd"
where schemaid='zxss_wpsj_pmxx' 
-- ��������-�����׶�
/*select 	
  public.uuid_generate_v1() as id,
  'zxss_ccpm_pmjd'as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,--��Ժά��
  null as columnvalue6,
  null as columnvalue7,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  pmjj as columnvalue11,--�����׶�
  ajsl as columnvalue12,--��������
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

-- ��������-�������
select 	
  public.uuid_generate_v1() as id,
  'zxss_wpsj_ajje'as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,--��Ժά��
  null as columnvalue6,
  null as columnvalue7 ,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  ajje as columnvalue11,--����/���
  sl as columnvalue12,--����
  tbfh as columnvalue13,--ͬ�ȷ���
  tb as columnvalue14,--ͬ��
  hbfh as columnvalue15,--���ȷ���
  hb as columnvalue16,--����
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

-- ��������-������Ϣ
select 	
  public.uuid_generate_v1() as id,
  'zxss_wpsj_pmxx'as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,--��Ժά��
  null as columnvalue6,
  null as columnvalue7,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  cbr as columnvalue11,--�а���
  pmsl as columnvalue12,--��������
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
--����δ�᰸��
select 	
  public.uuid_generate_v1() as id,
  'zxss_cqwjaj'as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,--��Ժά��
  null as columnvalue6,
  null as columnvalue7,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  ajlx as columnvalue11,--��������
  ajsl as columnvalue12,--��������
  cssj as columnvalue13,--��ʱ�׶�
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
--��һ����
select
	fy.c_fy as fywd,
	'��һ����' as cqsj,
	c_ajlb as ajlb,
	sum(COALESCE(n_cqyywjz,0)::numeric) as sl
	from t_jspt_qd_zxss_cqwjaj  wjaj
right join d_fy_qd fy on fy.c_fy = substr(wjaj.c_jbfyid,5)
	group by ajlb,fy.c_fy 
union ALL
--����������
select
	fy.c_fy as fywd,
	'��������' as cqsj,
	c_ajlb as ajlb,
	sum(COALESCE(n_t_cqlywjz,0)::numeric) as sl
	from t_jspt_qd_zxss_cqwjaj  wjaj
right join d_fy_qd fy on fy.c_fy = substr(wjaj.c_jbfyid,5)
	group by ajlb,fy.c_fy 
--����������
union all
select
	fy.c_fy as fywd,
	'��������' as cqsj,
	c_ajlb as ajlb,
	sum(COALESCE(n_cqsywjz,0)::numeric) as sl
from t_jspt_qd_zxss_cqwjaj  wjaj
right join d_fy_qd fy on fy.c_fy = substr(wjaj.c_jbfyid,5)
group by ajlb,fy.c_fy 
union all 
--���ڰ���
select 
	fy.c_fy as fywd,
	'����������' as cqsj,
	c_ajlb as ajlb,
	sum(coalesce(n_cqbnyswjz,0)::numeric) as sl
from t_jspt_qd_zxss_cqwjaj  wjaj
right join d_fy_qd fy on fy.c_fy = substr(wjaj.c_jbfyid,5)
group by ajlb,fy.c_fy 
union all 
select
	'0000185018620000' as fywd,
	'��һ����' as cqsj,
	c_ajlb as ajlb,
	sum(COALESCE(n_cqyywjz,0)::numeric) as sl
	from t_jspt_qd_zxss_cqwjaj  wjaj
right join d_fy_qd fy on fy.c_fy = substr(wjaj.c_jbfyid,5)
	group by ajlb
union ALL
--����������
select
	'0000185018620000' as fywd,
	'��������' as cqsj,
	c_ajlb as ajlb,
	sum(COALESCE(n_t_cqlywjz,0)::numeric) as sl
	from t_jspt_qd_zxss_cqwjaj  wjaj
right join d_fy_qd fy on fy.c_fy = substr(wjaj.c_jbfyid,5)
	group by ajlb
--����������
union all
select
	'0000185018620000' as fywd,
	'��������' as cqsj,
	c_ajlb as ajlb,
	sum(COALESCE(n_cqsywjz,0)::numeric) as sl
from t_jspt_qd_zxss_cqwjaj  wjaj
right join d_fy_qd fy on fy.c_fy = substr(wjaj.c_jbfyid,5)
group by ajlb
union all 
--���ڰ���
select 
	'0000185018620000' as fywd,
	'����������' as cqsj,
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
--����స����������
select 
	fywd,
	null as cqsj,
	sum(sl) as ajsl,
case 
		when ajlb='���°���' then '��������'
		when ajlb='���°���' then '��������'
		when ajlb='��������' then '��������'
		when ajlb='ִ���స��' then 'ִ������'
	end  as ajlx
from glwjaqk
group by ajlb,fywd

union all 
--����స������ռ��
select
	fywd, 
	null as cqsj,
	case when 
	(select sum(sl) from glwjaqk)::numeric=0 then 0
else
	round((sum(sl)::numeric)/1.0/((select sum(sl) from glwjaqk)::numeric)*100,1)
	end  as ajsl,
case 
		when ajlb='���°���' then '����ռ��'
		when ajlb='���°���' then '����ռ��'
		when ajlb='��������' then '����ռ��'
		when ajlb='ִ���స��' then 'ִ��ռ��'
	end  as ajlx
from glwjaqk
group by ajlb,fywd


)cqwjaj


union all
--��ͼ�ڵ�����
select 	
  public.uuid_generate_v1() as id,
  'zxss_dtjd'as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,--��Ժά��
  null as columnvalue6,
  null as columnvalue7,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  lx as columnvalue11,--��������
  ajs as columnvalue12,--��������
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
	'�ܼ����' as lx,
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
	'������' as lx,
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
	'������' as lx,
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
--�ڵ�����
select 	
  public.uuid_generate_v1() as id,
  'zxss_jdsj'as schemaid,
  now() as gathertime,
  now() as recordtime,
  null as columnvalue1,
  null as columnvalue2,
  null as columnvalue3,
  null as columnvalue4,
  fywd as columnvalue5,--��Ժά��
  null as columnvalue6,
  null as columnvalue7,
  null as columnvalue8,
  null as columnvalue9,
  null as columnvalue10,
  ajlx as columnvalue11,--��������
  jdlx as columnvalue12,--�ڵ�����
  jdzs as columnvalue13,--�ڵ�����
  jdcq as columnvalue14,--�ڵ㳬��
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
	case when c_ajzlbdm = '100101' then '�״�ִ��' 
	when c_ajzlbdm = '100102' then '�ָ�ִ��' end as c_ajzlb,
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
	case when c_ajzlbdm = '100101' then '�״�ִ��' 
	when c_ajzlbdm = '100102' then '�ָ�ִ��' end as c_ajzlb,
	sum(coalesce(n_jdaj_sdz,0)) as ajs,
	sum(coalesce(n_cqs_sdz,0)) as cqs,
	(sum(coalesce(n_jdaj_sdz,0)) - sum(coalesce(n_cqs_sdz,0))) as zcs
FROM
	db_dpzjk.t_jspt_dp_zxss_jdaj_gdtjq lcjd left join db_dpzjk.d_zxlcjdmc wd on lcjd.c_hddc = wd.dp_jdjc
where dp_jddm is not null and lcjd.c_tjq like (extract('year' from now())||'%'::text)
GROUP BY c_hddc,wd.dp_jddm,c_ajzlbdm
union all 
--��������
SELECT
	fy.c_fy as fywd,
	c_hddc,
	wd.dp_jdjc as jdlcwd,
	'ȫ������' as c_ajzlb,
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
	'ȫ������' as c_ajzlb,
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