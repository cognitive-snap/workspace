drop view if exists db_dpzjk.v_visu_sy;
create view db_dpzjk.v_visu_sy as

--��Чָ������
select 
  public.uuid_generate_v1() as id,
  'sy_zxzbph'as schemaid,
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
  zbmc as columnvalue11,--ָ������
  zbsz as columnvalue12,--ָ����ֵ
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
--����������ִ����
select 
'����������ִ����' as zbmc,
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
--�ձ������ϸ���
select 
'�ձ������ϸ���' as zbmc,
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
--ִ�а���ִ����
select 
'ִ�а���ִ����' as zbmc,
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
--�ŷð��������



)zxzbph
union all 
--��ҳ������
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
  ajlx as columnvalue11,--��������
  ajs as columnvalue12,--������
  tb as columnvalue13,--ͬ��
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
	'�ɴ�' as ajlx,
  sum(coalesce(n_jcajs_zxz,0)) as bntq,
	0 as qntq
from t_jspt_qd_sy_sjafx_mouth aj
where c_tjq = to_char(now(),'yyyyMM')
group by c_jbfyid

union all 
select 
	c_jbfyid,
	'����' as ajlx,
  sum(coalesce(n_xsajs_zxz,0)) as bntq,
	0 as qntq
from t_jspt_qd_sy_sjafx_mouth aj
where c_tjq = to_char(now(),'yyyyMM')
group by c_jbfyid
union all 
select 
	c_jbfyid,
	'�ѽ�' as ajlx,
  sum(coalesce(n_yjajs_zxz,0)) as bntq,
	0 as qntq
from t_jspt_qd_sy_sjafx_mouth aj
where c_tjq = to_char(now(),'yyyyMM')
group by c_jbfyid

union all 
select 
	c_jbfyid,
	'δ��' as ajlx,
  sum(coalesce(n_wjajs_zxz,0)) as bntq,
	0 as qntq
from t_jspt_qd_sy_sjafx_mouth aj
where c_tjq = to_char(now(),'yyyyMM')
group by c_jbfyid
union all 
select 
	c_jbfyid,
	'����' as ajlx,
  sum(coalesce(n_jcajs_zxz,0)+coalesce(n_xsajs_zxz,0)) as bntq,
	0 as qntq
from t_jspt_qd_sy_sjafx_mouth aj
where c_tjq = to_char(now(),'yyyyMM')
group by c_jbfyid
union all 

select 
	c_jbfyid,
	'�ɴ�' as ajlx,
  0 as bntq,
	sum(coalesce(n_jcajs_zxz,0)) as qntq
from t_jspt_qd_sy_sjafx_mouth aj
where c_tjq = to_char(now()-interval'1 year','yyyyMM')
group by c_jbfyid

union all 
select 
	c_jbfyid,
	'����' as ajlx,
  0 as bntq,
	sum(coalesce(n_xsajs_zxz,0)) as qntq
from t_jspt_qd_sy_sjafx_mouth aj
where c_tjq = to_char(now()-interval'1 year','yyyyMM')
group by c_jbfyid
union all 
select 
	c_jbfyid,
	'�ѽ�' as ajlx,
  0 as bntq,
	sum(coalesce(n_yjajs_zxz,0)) as qntq
from t_jspt_qd_sy_sjafx_mouth aj
where c_tjq = to_char(now()-interval'1 year','yyyyMM')
group by c_jbfyid

union all 
select 
	c_jbfyid,
	'δ��' as ajlx,
  0 as bntq,
	sum(coalesce(n_wjajs_zxz,0)) as qntq
from t_jspt_qd_sy_sjafx_mouth aj
where c_tjq = to_char(now()-interval'1 year','yyyyMM')
group by c_jbfyid
union all 
select 
	c_jbfyid,
	'����' as ajlx,
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
-- �漰��������
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
  ztlx as columnvalue11,--��������
  ajsl as columnvalue12,--������
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
--���
select 
fy.c_fy as fywd,
aj.ztlx,
aj.ajsl
from 
d_fy_qd fy 
left join (
SELECT 
	c_jbfyid,
	'����' as ztlx,
	sum(coalesce(n_ajsjz,0)) as ajsl
from t_jspt_qd_sy_ajsj_gdtjq
where 
c_tjq like extract('year' from now())||'%' and
 c_ajsj='���' or c_ajsj='�澯'
group by c_jbfyid) aj
on fy.c_fy=substr(aj.c_jbfyid,4)
union all 
--�浳������
select 
fy.c_fy as fywd,
aj.ztlx,
aj.ajsl
from 
d_fy_qd fy 
left join (
SELECT 
	c_jbfyid,
	'�浳������' as ztlx,
	sum(coalesce(n_ajsjz,0)) as ajsl
from t_jspt_qd_sy_ajsj_gdtjq
where 
c_tjq like extract('year' from now())||'%' and
 c_ajsj='����Ұ�ȫ'
group by c_jbfyid) aj
on fy.c_fy=substr(aj.c_jbfyid,4)
union all 
--����
select 
fy.c_fy as fywd,
aj.ztlx,
aj.ajsl
from 
d_fy_qd fy 
left join (
SELECT 
	c_jbfyid,
	'����' as ztlx,
	sum(coalesce(n_ajsjz,0)) as ajsl
from t_jspt_qd_sy_ajsj_gdtjq
where 
c_tjq like extract('year' from now())||'%' and
 c_ajsj!='����Ұ�ȫ' and c_ajsj!='���' and c_ajsj!='�澯'
group by c_jbfyid) aj
on fy.c_fy=substr(aj.c_jbfyid,4)


)sjtszt
union all 
--���óͽ�

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
  xzztb as columnvalue11,--������Ͷ��
  xzcj as columnvalue12,--���Ƴ���
  xzgxf as columnvalue13,--���Ƹ�����
  xzqyfrgg as columnvalue14,--������ҵ���˸߹�
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

--�����˴�
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
  xzlx as columnvalue11,--��������
  rs as columnvalue12,--����
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





















