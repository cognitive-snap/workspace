drop view if exists db_dpzjk.v_visu_sy;
create view db_dpzjk.v_visu_sy as

--��Чָ������

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
  cast(coalesce(zbsz,0)as text) as columnvalue12,--ָ����ֵ
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
--�ձ������ϸ���
select 
'�ձ������ϸ���' as zbmc,
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
--ִ�а���ִ����
select 
'ִ�а���ִ����' as zbmc,
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
----�ŷð��������(��������)
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
where schemaid='sy_zxzbph' and columnvalue11='�ŷð��������'
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
  cast(ajlx as text) as columnvalue11,--��������
  cast(ajs as text)as columnvalue12,--������
  cast(tb as text) as columnvalue13,--ͬ��
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
select fywd,'����' as ajlx,zs as jntq from ajs where sj='2018'
union all 
select '185018620000' as fywd,'����' as ajlx,sum(zs) as jntq from ajs where sj='2018'

union all

select fywd,'�ɴ�' as ajlx,jc as jntq from ajs where sj='2018'
union all 
select '185018620000' as fywd,'�ɴ�' as ajlx,sum(jc) as jntq from ajs where sj='2018'

union all 

select fywd,'δ��' as ajlx,wj as jntq from ajs where sj='2018'
union all 
select '185018620000' as fywd,'δ��' as ajlx,sum(wj) as jntq from ajs where sj='2018'

union all 

select fywd,'����' as ajlx,xs as jntq from ajs where sj='2018'
union all 
select '185018620000' as fywd,'����' as ajlx,sum(xs) as jntq from ajs where sj='2018'

union all 

select fywd,'�ѽ�' as ajlx,yj as jntq from ajs where sj='2018'
union all 
select '185018620000' as fywd,'�ѽ�' as ajlx,sum(yj) as jntq from ajs where sj='2018'
) jn 
left join 
(
select fywd,'����' as ajlx,zs as qntq from ajs where sj='2017'
union all 
select '185018620000' as fywd,'����' as ajlx,sum(zs) as qntq from ajs where sj='2017'

union all

select fywd,'�ɴ�' as ajlx,jc as qntq from ajs where sj='2017'
union all 
select '185018620000' as fywd,'�ɴ�' as ajlx,sum(jc) as qntq from ajs where sj='2017'

union all 

select fywd,'δ��' as ajlx,wj as qntq from ajs where sj='2017'
union all 
select '185018620000' as fywd,'δ��' as ajlx,sum(wj) as qntq from ajs where sj='2017'

union all 

select fywd,'����' as ajlx,xs as qntq from ajs where sj='2017'
union all 
select '185018620000' as fywd,'����' as ajlx,sum(xs) as qntq from ajs where sj='2017'

union all 

select fywd,'�ѽ�' as ajlx,yj as qntq from ajs where sj='2017'
union all 
select '185018620000' as fywd,'�ѽ�' as ajlx,sum(yj) as qntq from ajs where sj='2017'
)qn on jn.fywd=qn.fywd and jn.ajlx=qn.ajlx order by fywd
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
  ajsl::text as columnvalue12,--������
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
substr(c_tjq,1,4)='2018'  and
 c_ajsj='���' or c_ajsj='�澯'
group by c_jbfyid
union all 
SELECT 
	c_jbfyid,
	'�浳������' as ztlx,
	sum(coalesce(n_ajsjz,0)) as ajsl
from t_jspt_qd_sy_ajsj_gdtjq
where 
substr(c_tjq,1,4)='2018'  and
 c_ajsj='����Ұ�ȫ'
group by c_jbfyid
union all 
SELECT 
	c_jbfyid,
	'����' as ztlx,
	sum(coalesce(n_ajsjz,0)) as ajsl
from t_jspt_qd_sy_ajsj_gdtjq
where 
substr(c_tjq,1,4)='2018' and
 c_ajsj!='����Ұ�ȫ' and c_ajsj!='���' and c_ajsj!='�澯'
group by c_jbfyid
union all 
SELECT 
	'0000185018620000'as c_jbfyid,
	'����' as ztlx,
	sum(coalesce(n_ajsjz,0)) as ajsl
from t_jspt_qd_sy_ajsj_gdtjq
where 
substr(c_tjq,1,4)='2018'  and
 c_ajsj='���' or c_ajsj='�澯'
union all 
SELECT 
	'0000185018620000'as c_jbfyid,
	'�浳������' as ztlx,
	sum(coalesce(n_ajsjz,0)) as ajsl
from t_jspt_qd_sy_ajsj_gdtjq
where 
substr(c_tjq,1,4)='2018'  and
 c_ajsj='����Ұ�ȫ'
union all 
SELECT 
	'0000185018620000'as c_jbfyid,
	'����' as ztlx,
	sum(coalesce(n_ajsjz,0)) as ajsl
from t_jspt_qd_sy_ajsj_gdtjq
where 
substr(c_tjq,1,4)='2018' and
 c_ajsj!='����Ұ�ȫ' and c_ajsj!='���' and c_ajsj!='�澯'

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

--���óͽ�
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
*/
union all

--��ҳ�����ѽ�ͳ��
select 
  public.uuid_generate_v1() as id,
  'sy_xsyjtj'as schemaid,
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
  lx as columnvalue11,--ָ������
  cast(ajs as text) as  columnvalue12,--ָ����ֵ
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
--����
select c_fy as fywd,'����' as lx,xs as ajs from xs
union all 
select '185018620000' as fywd,'����' as lx,sum(xs) as ajs from xs
--�ѽ�
union all 
select c_fy as fywd,'�ѽ�' as lx,yj as ajs from yj
union all 
select '185018620000' as fywd,'�ѽ�' as lx,sum(yj) as ajs from yj
) xsyj;

ALTER TABLE "db_dpzjk"."v_visu_sy" OWNER TO "dpzjk";