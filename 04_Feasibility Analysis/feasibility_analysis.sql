-- Feasibility Analysis

--DRG Frequency
select core.drg_cd, dim.drg_desc, count(core.admit_id) as encounter_count
from capstone.nis_core core
join capstone.dim_drg dim on core.drg_cd = dim.drg_cd
group by core.drg_cd, dim.drg_desc
order by encounter_count desc;


--Procedure Code Variety
--Count of distinct procedure codes by DRG
select p.drg_cd, dim.drg_desc, count(distinct(p.pr_cd)) as pr_variety
from capstone.nis_long_pr p
join capstone.dim_drg dim
on p.drg_cd = dim.drg_cd
group by p.drg_cd, dim.drg_desc
order by pr_variety desc;

--Diagnosis Frequency
--Count of distinct diagnosis codes DRG
select dx.drg_cd, dim.drg_desc, count(distinct(dx.dx_cd)) as dx_variety
from capstone.nis_long_dx dx
join capstone.dim_drg dim
on dx.drg_cd = dim.drg_cd
group by dx.drg_cd, dim.drg_desc
order by dx_variety desc;


--------------------------------------------------------------------------
-- Decision: Select these 5 DRGs for the feasibility model:
--('194','139','469','383','710')
--------------------------------------------------------------------------


--Average Charge per DRG
select drg_cd,
round(avg(total_charge),0) as avg_charge
from capstone.nis_core
where drg_cd in ('194','139','469','383','710')
group by drg_cd
order by drg_cd;


--------------------------------------------------------------------------
-- Select the most prevalent Diagnosis CCSR's within the 5 selected DRGs
-- Adjust the query for the DRG and re-run
--------------------------------------------------------------------------
-- Primary Diagnosis (a.dx_index = 1)
select * from (
select a.drg_cd, a.ccsr_cat_cd, 
count(distinct(a.admit_id)) as encounter_count,
(count(distinct(a.admit_id)) * 1.0 / 
	(select count(distinct(admit_id))from capstone.nis_long_dx 
	  where drg_cd = '194') 
	  * 100) as prevalence_pct
from 
capstone.nis_long_dx a
where a.drg_cd = '194' -- in ('194','139','469','383','710')
and a.dx_index = 1
group by a.drg_cd, a.ccsr_cat_cd)
order by drg_cd, encounter_count desc;


-- Secondary Diagnosis (a.dx_index > 1)
select * from (
select a.drg_cd, a.ccsr_cat_cd, 
count(distinct(a.admit_id)) as encounter_count,
(count(distinct(a.admit_id)) * 1.0 / 
	(select count(distinct(admit_id))from capstone.nis_long_dx 
	  where drg_cd = '194') 
	  * 100) as prevalence_pct
from 
capstone.nis_long_dx a
where a.drg_cd = '194' -- in ('194','139','469','383','710')
and a.dx_index > 1
group by a.drg_cd, a.ccsr_cat_cd)
where prevalence_pct between 5 and 60
order by drg_cd, encounter_count desc;


--------------------------------------------------------------------------
-- Decision: Select this set of Diagnosis CCSR Category Codes from across all 5 DRGs:
-- ** Based on secondary diagnosis
-- BLD003
-- CIR007
-- CIR008
-- CIR011
-- CIR017
-- CIR019
-- END003
-- END005
-- END009
-- END010
-- END011
-- END016
-- FAC009
-- FAC016
-- FAC026
-- FAC030
-- GEN002
-- GEN003
-- INF002
-- RSP008
-- RSP012
-- SKN001
--------------------------------------------------------------------------


-- Create a helper table to hold the selected CCSR Cateogry Codes
drop table if exists capstone.feasibility_selected_ccsrs cascade;
create table if not exists capstone.feasibility_selected_ccsrs (
ccsr_cat_cd character(6),
feature_nm varchar(50)
);

insert into capstone.feasibility_selected_ccsrs (ccsr_cat_cd, feature_nm) values
('BLD003','sec_ccsr_bld003'),
('CIR007','sec_ccsr_cir007'),
('CIR008','sec_ccsr_cir008'),
('CIR011','sec_ccsr_cir011'),
('CIR017','sec_ccsr_cir017'),
('CIR019','sec_ccsr_cir019'),
('END003','sec_ccsr_end003'),
('END005','sec_ccsr_end005'),
('END009','sec_ccsr_end009'),
('END010','sec_ccsr_end010'),
('END011','sec_ccsr_end011'),
('END016','sec_ccsr_end016'),
('FAC009','sec_ccsr_fac009'),
('FAC016','sec_ccsr_fac016'),
('FAC026','sec_ccsr_fac026'),
('FAC030','sec_ccsr_fac030'),
('GEN002','sec_ccsr_gen002'),
('GEN003','sec_ccsr_gen003'),
('INF002','sec_ccsr_inf002'),
('RSP008','sec_ccsr_rsp008'),
('RSP012','sec_ccsr_rsp012'),
('SKN001','sec_ccsr_skn001');

select * from capstone.feasibility_selected_ccsrs;


-- Create 'layer 2' of the model input. This block will create a column for each of the 
-- secondary CCSR codes we just inserted in feasibility_selected_ccsrs, and set the 
-- value to 0 or 1 to identify if that CCSR is represented in the admission.
-- Repeatability Note: Highlight the entire block between ''-- start here' and ''-- end here'
-- and execute query

-- start here
do $$
declare
    v_sql text;
    v_flag_cols text;
begin
    select string_agg(
        format(
            'max(case when d.dx_index > 1 and d.ccsr_cat_cd = %L then 1 else 0 end) as %I',
            s.ccsr_cat_cd,
            s.feature_nm
        ),
        ', ' order by s.feature_nm
    )
    into v_flag_cols
    from capstone.feasibility_selected_ccsrs s;
    v_sql := format($fmt$
        drop table if exists capstone.feasibility_layer2_dx_summary cascade;
        create table capstone.feasibility_layer2_dx_summary as
        select
            f.admit_id,
            f.drg_cd,
            count(distinct d.dx_index) as diagnosis_count,
            count(distinct d.ccsr_cat_cd) as distinct_ccsr_count,
            count(distinct case when d.dx_index > 1 then d.ccsr_cat_cd end) as secondary_ccsr_count,
            %s
        from capstone.nis_core f
        left join capstone.nis_long_dx d
            on f.admit_id = d.admit_id
        where f.drg_cd in ('139','194','383','469','710')
        group by
            f.admit_id,
            f.drg_cd
    $fmt$, v_flag_cols);
	raise notice '%', v_sql;
    execute v_sql;
end $$;
-- end here

select * from capstone.feasibility_layer2_dx_summary limit 50;

--quick sanity check: prevalence percentages
--these numbers should be about what I saw in the Feasibility Analysis spreadsheet, columns X, Y, Z, and AA
select
    drg_cd,
    avg(sec_ccsr_gen003::numeric) *100 as prev_gen003,
    avg(sec_ccsr_end005::numeric) *100 as prev_end005,
    avg(sec_ccsr_rsp012::numeric) *100 as prev_rsp012
from capstone.feasibility_layer2_dx_summary
group by drg_cd
order by drg_cd;


select * from cap_analytics.prccsr_target_profile_drg limit 100;
select drg_cd, sum(prev_pct) from cap_analytics.prccsr_target_profile_drg
group by drg_cd order by drg_cd;

--Next up, identify procedure targets
--Profile overall procedure prevalence across 5 selected DRGs
--Create a table with one row per Procedure CCSR, number of admissions
--having that procedure code, and the prevalence of the procedure across
--across all 5 of our selected DRGs
--**The original code block to dynamically create the table consumed too much memory.
--  Instead, I took the DDL that it created, broke it up into several INSERT statements, and
--  put it all in one nasty script: create_table_feasibility_prccsr_target_profile.sql
--  Below is retained for reference; execute create_table_feasibility_prccsr_target_profile.sql and
--  come back here


SET work_mem = '1GB';
SET maintenance_work_mem = '2GB';

do $$
declare
    v_sql text;
begin
    select string_agg(
        format(
            $f$
            select
				%L as prccsr_col_nm,
                count(*) filter (where %I in (1,2,3)) as encounter_count,
                avg(case when %I in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			$f$,
            c.column_name,
            c.column_name,
            c.column_name
        ),
        ' union all ' order by c.column_name
    )
    into v_sql
    from information_schema.columns c
    where c.table_schema = 'hcup_nis_2023'
      and c.table_name   = 'dx_pr_grps'
      and c.column_name like 'prccsr\_%' escape '\' and c.column_name <>'prccsr_version';

    v_sql := format($fmt$
        drop table if exists capstone.feasibility_prccsr_target_profile cascade;

        create table capstone.feasibility_prccsr_target_profile as
        %s
        ;
    $fmt$, v_sql);

    raise notice '%', v_sql;
    execute v_sql;
end $$;

--After running create_table_feasibility_prccsr_target_profile.sql:
select * from capstone.feasibility_prccsr_target_profile limit 100;

select count(*) from capstone.feasibility_prccsr_target_profile;
--328

select distinct prccsr_col_nm from capstone.feasibility_prccsr_target_profile;
--328

select
prccsr_col_nm,
encounter_count,
round(prevalence_pct::numeric, 4) as prevalence_pct
from capstone.feasibility_prccsr_target_profile
where prevalence_pct between 0.05 and 0.40
order by prevalence_pct desc, prccsr_col_nm;

--Yikes! Only three records come back.
--Feasibility Analysis spreadsheet | Procedure Target Selection tab | Columns A-C
--Perhaps combining all 5 DRGs in one overall prevalence screen is washing out DRG-specific signal
--Next step, create a similar prevalence table, but adding in the DRG.


--In this step, create a table with one row per DRG, Procedure CCSR, number of admissions
--having that DRG / Procedure CCSR combination, and the prevalence of the Procedure CCSR 
--within the DRG.
--The original code block to dynamically create the table consumed too much memory.
--Instead, I took the DDL that it created, broke it up into several INSERT statements, and
--put it all in one nasty script: create_table_feasibility_prccsr_target_profile_by_drg.sql
--Below is retained for reference; execute create_table_feasibility_prccsr_target_profile_by_drg.sql and
--come back here

SET work_mem = '1GB';
SET maintenance_work_mem = '2GB';

do $$
declare
    v_sql text;
begin
    select string_agg(
        format(
            $f$
            select
				LPAD(b.aprdrg::text, 3, '0') as drg_cd,
                %L as prccsr_col_nm,
                count(*) filter (where %I in (1,2,3)) as encounter_count,
                avg(case when %I in (1,2,3) then 1.0 else 0.0 end) as prev_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			group by drg_cd
            $f$,
            c.column_name,
            c.column_name,
            c.column_name
        ),
        ' union all ' order by c.column_name
    )
    into v_sql
    from information_schema.columns c
    where c.table_schema = 'hcup_nis_2023'
      and c.table_name   = 'dx_pr_grps'
      and c.column_name like 'prccsr\_%' escape '\' and c.column_name <>'prccsr_version';

    v_sql := format($fmt$
        drop table if exists capstone.feasibility_prccsr_target_profile_by_drg cascade;

        create table capstone.feasibility_prccsr_target_profile_by_drg as
        %s
        ;
    $fmt$, v_sql);

    raise notice '%', v_sql;
    execute v_sql;
end $$;

--After running create_table_feasibility_prccsr_target_profile_by_drg.sql:

select * from capstone.feasibility_prccsr_target_profile_by_drg limit 100;

--Quick sanity check. Since this table has a row per DRG / CCSR category, expect
--5x as many rows compared to the previous table: 1640
select count(*) from capstone.feasibility_prccsr_target_profile_by_drg;
--1640


--Now lets look at prevalence between 5 and 60%
select
drg_cd,
prccsr_col_nm,
round(prevalence_pct::numeric, 4) as prevalence_pct
from capstone.feasibility_prccsr_target_profile_by_drg
where prevalence_pct between 0.05 and 0.40
order by drg_cd, prevalence_pct desc;

--Feasibility Analysis spreadsheet | Procedure Target Selection tab | Columns E-G
--Look for prevalence as well as clinical variety

---------------------------------------------------------------------------------------
-- Decision: Select this set of Procedure CCSR Category Codes from across all 5 DRGs:
-- prccsr_car024
-- prccsr_esa001
-- prccsr_esa004
-- prccsr_gis009
-- prccsr_img008
-- prccsr_mst019
-- prccsr_res005
---------------------------------------------------------------------------------------

--With the Target Procedure CCSR Category codes selected, 
--build layer 3 of the feasibility model input

drop table if exists capstone.feasibility_layer3_procedure_targets cascade;

create table capstone.feasibility_layer3_procedure_targets as (
select
    key_nis as admit_id,
    case when prccsr_car024 in (1,2,3) then 1 else 0 end as target_prccsr_car024,
	case when prccsr_esa004 in (1,2,3) then 1 else 0 end as target_prccsr_esa001,
    case when prccsr_esa004 in (1,2,3) then 1 else 0 end as target_prccsr_esa004,
    case when prccsr_gis009 in (1,2,3) then 1 else 0 end as target_prccsr_gis009,
    case when prccsr_img008 in (1,2,3) then 1 else 0 end as target_prccsr_img008,
    case when prccsr_mst020 in (1,2,3) then 1 else 0 end as target_prccsr_mst019,
	case when prccsr_res005 in (1,2,3) then 1 else 0 end as target_prccsr_res005
from hcup_nis_2023.dx_pr_grps a
join capstone.nis_core b on a.key_nis = b.admit_id
where b.drg_cd in ('139','194','383','469','710')
)
;

select count(*) from capstone.feasibility_layer3_procedure_targets;
--560,311
select count(distinct(admit_id)) from capstone.feasibility_layer3_procedure_targets;
--560,311

---------------------------------------------------------------------------------------
-- Finally, create model input table
---------------------------------------------------------------------------------------
drop table if exists capstone.feasibility_model_input cascade;
create table capstone.feasibility_model_input as (
select
core.admit_id, 
core.drg_cd,
core.age,
core.gender,
core.rom_score,
core.soi_score,
core.length_of_stay,
core.total_charge,
l2.diagnosis_count,
l2.distinct_ccsr_count,
l2.secondary_ccsr_count,
l2.sec_ccsr_bld003,
l2.sec_ccsr_cir007,
l2.sec_ccsr_cir008,
l2.sec_ccsr_cir011,
l2.sec_ccsr_cir017,
l2.sec_ccsr_cir019,
l2.sec_ccsr_end003,
l2.sec_ccsr_end005,
l2.sec_ccsr_end009,
l2.sec_ccsr_end010,
l2.sec_ccsr_end011,
l2.sec_ccsr_end016,
l2.sec_ccsr_fac009,
l2.sec_ccsr_fac016,
l2.sec_ccsr_fac026,
l2.sec_ccsr_fac030,
l2.sec_ccsr_gen002,
l2.sec_ccsr_gen003,
l2.sec_ccsr_inf002,
l2.sec_ccsr_rsp008,
l2.sec_ccsr_rsp012,
l2.sec_ccsr_skn001,
l3.target_prccsr_car024,
l3.target_prccsr_esa001,
l3.target_prccsr_esa004,
l3.target_prccsr_gis009,
l3.target_prccsr_img008,
l3.target_prccsr_mst019,
l3.target_prccsr_res005
from capstone.nis_core core
join capstone.feasibility_layer2_dx_summary l2 on core.admit_id = l2.admit_id
join capstone.feasibility_layer3_procedure_targets l3 on core.admit_id = l3.admit_id
where core.drg_cd in ('139','194','383','469','710')
)
;
--Sanity check for uniqueness
select count(*) from capstone.feasibility_model_input;
--560,311
select count(distinct(admit_id)) from capstone.feasibility_model_input;
--560,0311

--Select all rows and save as 'feasibility_model_input.csv'
select * from capstone.feasibility_model_input order by random();

