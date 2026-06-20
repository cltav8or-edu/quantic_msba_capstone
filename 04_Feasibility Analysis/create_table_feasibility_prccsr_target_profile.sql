SET work_mem = '1GB';
SET maintenance_work_mem = '2GB';
drop table if exists capstone.feasibility_prccsr_target_profile cascade;
create table capstone.feasibility_prccsr_target_profile as
(        
            select
				'prccsr_adm001' as prccsr_col_nm,
                count(*) filter (where prccsr_adm001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm002' as prccsr_col_nm,
                count(*) filter (where prccsr_adm002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm003' as prccsr_col_nm,
                count(*) filter (where prccsr_adm003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm004' as prccsr_col_nm,
                count(*) filter (where prccsr_adm004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm005' as prccsr_col_nm,
                count(*) filter (where prccsr_adm005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm006' as prccsr_col_nm,
                count(*) filter (where prccsr_adm006 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm006 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm007' as prccsr_col_nm,
                count(*) filter (where prccsr_adm007 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm007 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm008' as prccsr_col_nm,
                count(*) filter (where prccsr_adm008 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm008 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm009' as prccsr_col_nm,
                count(*) filter (where prccsr_adm009 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm009 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm010' as prccsr_col_nm,
                count(*) filter (where prccsr_adm010 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm010 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm011' as prccsr_col_nm,
                count(*) filter (where prccsr_adm011 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm011 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm012' as prccsr_col_nm,
                count(*) filter (where prccsr_adm012 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm012 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm013' as prccsr_col_nm,
                count(*) filter (where prccsr_adm013 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm013 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm014' as prccsr_col_nm,
                count(*) filter (where prccsr_adm014 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm014 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm015' as prccsr_col_nm,
                count(*) filter (where prccsr_adm015 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm015 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm016' as prccsr_col_nm,
                count(*) filter (where prccsr_adm016 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm016 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm017' as prccsr_col_nm,
                count(*) filter (where prccsr_adm017 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm017 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm018' as prccsr_col_nm,
                count(*) filter (where prccsr_adm018 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm018 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm019' as prccsr_col_nm,
                count(*) filter (where prccsr_adm019 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm019 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm020' as prccsr_col_nm,
                count(*) filter (where prccsr_adm020 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm020 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm021' as prccsr_col_nm,
                count(*) filter (where prccsr_adm021 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm021 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_adm022' as prccsr_col_nm,
                count(*) filter (where prccsr_adm022 in (1,2,3)) as encounter_count,
                avg(case when prccsr_adm022 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car001' as prccsr_col_nm,
                count(*) filter (where prccsr_car001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car002' as prccsr_col_nm,
                count(*) filter (where prccsr_car002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car003' as prccsr_col_nm,
                count(*) filter (where prccsr_car003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car004' as prccsr_col_nm,
                count(*) filter (where prccsr_car004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car005' as prccsr_col_nm,
                count(*) filter (where prccsr_car005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car006' as prccsr_col_nm,
                count(*) filter (where prccsr_car006 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car006 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car007' as prccsr_col_nm,
                count(*) filter (where prccsr_car007 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car007 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car008' as prccsr_col_nm,
                count(*) filter (where prccsr_car008 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car008 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car009' as prccsr_col_nm,
                count(*) filter (where prccsr_car009 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car009 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			);
insert into capstone.feasibility_prccsr_target_profile (prccsr_col_nm, encounter_count, prevalence_pct)		
               select
				'prccsr_car010' as prccsr_col_nm,
                count(*) filter (where prccsr_car010 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car010 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car011' as prccsr_col_nm,
                count(*) filter (where prccsr_car011 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car011 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car012' as prccsr_col_nm,
                count(*) filter (where prccsr_car012 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car012 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car013' as prccsr_col_nm,
                count(*) filter (where prccsr_car013 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car013 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car014' as prccsr_col_nm,
                count(*) filter (where prccsr_car014 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car014 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car015' as prccsr_col_nm,
                count(*) filter (where prccsr_car015 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car015 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car016' as prccsr_col_nm,
                count(*) filter (where prccsr_car016 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car016 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car017' as prccsr_col_nm,
                count(*) filter (where prccsr_car017 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car017 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car018' as prccsr_col_nm,
                count(*) filter (where prccsr_car018 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car018 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car019' as prccsr_col_nm,
                count(*) filter (where prccsr_car019 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car019 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car020' as prccsr_col_nm,
                count(*) filter (where prccsr_car020 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car020 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car021' as prccsr_col_nm,
                count(*) filter (where prccsr_car021 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car021 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car022' as prccsr_col_nm,
                count(*) filter (where prccsr_car022 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car022 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car023' as prccsr_col_nm,
                count(*) filter (where prccsr_car023 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car023 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car024' as prccsr_col_nm,
                count(*) filter (where prccsr_car024 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car024 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car025' as prccsr_col_nm,
                count(*) filter (where prccsr_car025 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car025 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car026' as prccsr_col_nm,
                count(*) filter (where prccsr_car026 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car026 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car027' as prccsr_col_nm,
                count(*) filter (where prccsr_car027 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car027 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car028' as prccsr_col_nm,
                count(*) filter (where prccsr_car028 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car028 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_car029' as prccsr_col_nm,
                count(*) filter (where prccsr_car029 in (1,2,3)) as encounter_count,
                avg(case when prccsr_car029 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_chp001' as prccsr_col_nm,
                count(*) filter (where prccsr_chp001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_chp001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_cns001' as prccsr_col_nm,
                count(*) filter (where prccsr_cns001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_cns001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_cns002' as prccsr_col_nm,
                count(*) filter (where prccsr_cns002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_cns002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_cns003' as prccsr_col_nm,
                count(*) filter (where prccsr_cns003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_cns003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_cns004' as prccsr_col_nm,
                count(*) filter (where prccsr_cns004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_cns004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_cns005' as prccsr_col_nm,
                count(*) filter (where prccsr_cns005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_cns005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_cns006' as prccsr_col_nm,
                count(*) filter (where prccsr_cns006 in (1,2,3)) as encounter_count,
                avg(case when prccsr_cns006 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_cns007' as prccsr_col_nm,
                count(*) filter (where prccsr_cns007 in (1,2,3)) as encounter_count,
                avg(case when prccsr_cns007 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			;
commit;
insert into capstone.feasibility_prccsr_target_profile (prccsr_col_nm, encounter_count, prevalence_pct)			
            select
				'prccsr_cns008' as prccsr_col_nm,
                count(*) filter (where prccsr_cns008 in (1,2,3)) as encounter_count,
                avg(case when prccsr_cns008 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_cns009' as prccsr_col_nm,
                count(*) filter (where prccsr_cns009 in (1,2,3)) as encounter_count,
                avg(case when prccsr_cns009 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_cns010' as prccsr_col_nm,
                count(*) filter (where prccsr_cns010 in (1,2,3)) as encounter_count,
                avg(case when prccsr_cns010 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_cns011' as prccsr_col_nm,
                count(*) filter (where prccsr_cns011 in (1,2,3)) as encounter_count,
                avg(case when prccsr_cns011 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_cns012' as prccsr_col_nm,
                count(*) filter (where prccsr_cns012 in (1,2,3)) as encounter_count,
                avg(case when prccsr_cns012 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_cns013' as prccsr_col_nm,
                count(*) filter (where prccsr_cns013 in (1,2,3)) as encounter_count,
                avg(case when prccsr_cns013 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_cns014' as prccsr_col_nm,
                count(*) filter (where prccsr_cns014 in (1,2,3)) as encounter_count,
                avg(case when prccsr_cns014 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_enp001' as prccsr_col_nm,
                count(*) filter (where prccsr_enp001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_enp001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_enp002' as prccsr_col_nm,
                count(*) filter (where prccsr_enp002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_enp002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_enp003' as prccsr_col_nm,
                count(*) filter (where prccsr_enp003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_enp003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_enp004' as prccsr_col_nm,
                count(*) filter (where prccsr_enp004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_enp004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_enp005' as prccsr_col_nm,
                count(*) filter (where prccsr_enp005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_enp005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_enp006' as prccsr_col_nm,
                count(*) filter (where prccsr_enp006 in (1,2,3)) as encounter_count,
                avg(case when prccsr_enp006 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ent001' as prccsr_col_nm,
                count(*) filter (where prccsr_ent001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ent001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ent002' as prccsr_col_nm,
                count(*) filter (where prccsr_ent002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ent002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ent003' as prccsr_col_nm,
                count(*) filter (where prccsr_ent003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ent003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ent004' as prccsr_col_nm,
                count(*) filter (where prccsr_ent004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ent004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ent005' as prccsr_col_nm,
                count(*) filter (where prccsr_ent005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ent005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ent006' as prccsr_col_nm,
                count(*) filter (where prccsr_ent006 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ent006 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ent007' as prccsr_col_nm,
                count(*) filter (where prccsr_ent007 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ent007 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ent008' as prccsr_col_nm,
                count(*) filter (where prccsr_ent008 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ent008 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ent009' as prccsr_col_nm,
                count(*) filter (where prccsr_ent009 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ent009 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ent010' as prccsr_col_nm,
                count(*) filter (where prccsr_ent010 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ent010 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ent011' as prccsr_col_nm,
                count(*) filter (where prccsr_ent011 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ent011 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ent012' as prccsr_col_nm,
                count(*) filter (where prccsr_ent012 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ent012 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ent013' as prccsr_col_nm,
                count(*) filter (where prccsr_ent013 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ent013 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ent014' as prccsr_col_nm,
                count(*) filter (where prccsr_ent014 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ent014 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ent015' as prccsr_col_nm,
                count(*) filter (where prccsr_ent015 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ent015 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ent016' as prccsr_col_nm,
                count(*) filter (where prccsr_ent016 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ent016 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ent017' as prccsr_col_nm,
                count(*) filter (where prccsr_ent017 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ent017 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			;
commit;
insert into capstone.feasibility_prccsr_target_profile (prccsr_col_nm, encounter_count, prevalence_pct)
            select
				'prccsr_esa001' as prccsr_col_nm,
                count(*) filter (where prccsr_esa001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_esa001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_esa002' as prccsr_col_nm,
                count(*) filter (where prccsr_esa002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_esa002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_esa003' as prccsr_col_nm,
                count(*) filter (where prccsr_esa003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_esa003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_esa004' as prccsr_col_nm,
                count(*) filter (where prccsr_esa004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_esa004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_esa005' as prccsr_col_nm,
                count(*) filter (where prccsr_esa005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_esa005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_esa006' as prccsr_col_nm,
                count(*) filter (where prccsr_esa006 in (1,2,3)) as encounter_count,
                avg(case when prccsr_esa006 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_esa007' as prccsr_col_nm,
                count(*) filter (where prccsr_esa007 in (1,2,3)) as encounter_count,
                avg(case when prccsr_esa007 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_esa008' as prccsr_col_nm,
                count(*) filter (where prccsr_esa008 in (1,2,3)) as encounter_count,
                avg(case when prccsr_esa008 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_esa009' as prccsr_col_nm,
                count(*) filter (where prccsr_esa009 in (1,2,3)) as encounter_count,
                avg(case when prccsr_esa009 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_esa010' as prccsr_col_nm,
                count(*) filter (where prccsr_esa010 in (1,2,3)) as encounter_count,
                avg(case when prccsr_esa010 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_esa011' as prccsr_col_nm,
                count(*) filter (where prccsr_esa011 in (1,2,3)) as encounter_count,
                avg(case when prccsr_esa011 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_esa012' as prccsr_col_nm,
                count(*) filter (where prccsr_esa012 in (1,2,3)) as encounter_count,
                avg(case when prccsr_esa012 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_est001' as prccsr_col_nm,
                count(*) filter (where prccsr_est001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_est001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_est002' as prccsr_col_nm,
                count(*) filter (where prccsr_est002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_est002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_est003' as prccsr_col_nm,
                count(*) filter (where prccsr_est003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_est003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_est004' as prccsr_col_nm,
                count(*) filter (where prccsr_est004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_est004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_est005' as prccsr_col_nm,
                count(*) filter (where prccsr_est005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_est005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_eyp001' as prccsr_col_nm,
                count(*) filter (where prccsr_eyp001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_eyp001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_eyp002' as prccsr_col_nm,
                count(*) filter (where prccsr_eyp002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_eyp002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_frs001' as prccsr_col_nm,
                count(*) filter (where prccsr_frs001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_frs001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_frs002' as prccsr_col_nm,
                count(*) filter (where prccsr_frs002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_frs002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_frs003' as prccsr_col_nm,
                count(*) filter (where prccsr_frs003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_frs003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_frs004' as prccsr_col_nm,
                count(*) filter (where prccsr_frs004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_frs004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_frs005' as prccsr_col_nm,
                count(*) filter (where prccsr_frs005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_frs005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_frs006' as prccsr_col_nm,
                count(*) filter (where prccsr_frs006 in (1,2,3)) as encounter_count,
                avg(case when prccsr_frs006 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_frs007' as prccsr_col_nm,
                count(*) filter (where prccsr_frs007 in (1,2,3)) as encounter_count,
                avg(case when prccsr_frs007 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_frs008' as prccsr_col_nm,
                count(*) filter (where prccsr_frs008 in (1,2,3)) as encounter_count,
                avg(case when prccsr_frs008 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_frs009' as prccsr_col_nm,
                count(*) filter (where prccsr_frs009 in (1,2,3)) as encounter_count,
                avg(case when prccsr_frs009 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_frs010' as prccsr_col_nm,
                count(*) filter (where prccsr_frs010 in (1,2,3)) as encounter_count,
                avg(case when prccsr_frs010 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_frs011' as prccsr_col_nm,
                count(*) filter (where prccsr_frs011 in (1,2,3)) as encounter_count,
                avg(case when prccsr_frs011 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			;
commit;
insert into capstone.feasibility_prccsr_target_profile (prccsr_col_nm, encounter_count, prevalence_pct)	
            select
				'prccsr_frs012' as prccsr_col_nm,
                count(*) filter (where prccsr_frs012 in (1,2,3)) as encounter_count,
                avg(case when prccsr_frs012 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_frs013' as prccsr_col_nm,
                count(*) filter (where prccsr_frs013 in (1,2,3)) as encounter_count,
                avg(case when prccsr_frs013 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_frs014' as prccsr_col_nm,
                count(*) filter (where prccsr_frs014 in (1,2,3)) as encounter_count,
                avg(case when prccsr_frs014 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_frs015' as prccsr_col_nm,
                count(*) filter (where prccsr_frs015 in (1,2,3)) as encounter_count,
                avg(case when prccsr_frs015 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis001' as prccsr_col_nm,
                count(*) filter (where prccsr_gis001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis002' as prccsr_col_nm,
                count(*) filter (where prccsr_gis002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis003' as prccsr_col_nm,
                count(*) filter (where prccsr_gis003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis004' as prccsr_col_nm,
                count(*) filter (where prccsr_gis004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis005' as prccsr_col_nm,
                count(*) filter (where prccsr_gis005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis006' as prccsr_col_nm,
                count(*) filter (where prccsr_gis006 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis006 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis007' as prccsr_col_nm,
                count(*) filter (where prccsr_gis007 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis007 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis008' as prccsr_col_nm,
                count(*) filter (where prccsr_gis008 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis008 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis009' as prccsr_col_nm,
                count(*) filter (where prccsr_gis009 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis009 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis010' as prccsr_col_nm,
                count(*) filter (where prccsr_gis010 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis010 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis011' as prccsr_col_nm,
                count(*) filter (where prccsr_gis011 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis011 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis012' as prccsr_col_nm,
                count(*) filter (where prccsr_gis012 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis012 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis013' as prccsr_col_nm,
                count(*) filter (where prccsr_gis013 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis013 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis014' as prccsr_col_nm,
                count(*) filter (where prccsr_gis014 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis014 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis015' as prccsr_col_nm,
                count(*) filter (where prccsr_gis015 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis015 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis016' as prccsr_col_nm,
                count(*) filter (where prccsr_gis016 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis016 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis017' as prccsr_col_nm,
                count(*) filter (where prccsr_gis017 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis017 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis018' as prccsr_col_nm,
                count(*) filter (where prccsr_gis018 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis018 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis019' as prccsr_col_nm,
                count(*) filter (where prccsr_gis019 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis019 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis020' as prccsr_col_nm,
                count(*) filter (where prccsr_gis020 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis020 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis021' as prccsr_col_nm,
                count(*) filter (where prccsr_gis021 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis021 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis022' as prccsr_col_nm,
                count(*) filter (where prccsr_gis022 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis022 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis023' as prccsr_col_nm,
                count(*) filter (where prccsr_gis023 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis023 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis024' as prccsr_col_nm,
                count(*) filter (where prccsr_gis024 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis024 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis025' as prccsr_col_nm,
                count(*) filter (where prccsr_gis025 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis025 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis026' as prccsr_col_nm,
                count(*) filter (where prccsr_gis026 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis026 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis027' as prccsr_col_nm,
                count(*) filter (where prccsr_gis027 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis027 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			;
commit;
insert into capstone.feasibility_prccsr_target_profile (prccsr_col_nm, encounter_count, prevalence_pct)
            select
				'prccsr_gis028' as prccsr_col_nm,
                count(*) filter (where prccsr_gis028 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis028 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gis029' as prccsr_col_nm,
                count(*) filter (where prccsr_gis029 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gis029 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gnr001' as prccsr_col_nm,
                count(*) filter (where prccsr_gnr001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gnr001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gnr002' as prccsr_col_nm,
                count(*) filter (where prccsr_gnr002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gnr002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gnr003' as prccsr_col_nm,
                count(*) filter (where prccsr_gnr003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gnr003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gnr004' as prccsr_col_nm,
                count(*) filter (where prccsr_gnr004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gnr004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gnr005' as prccsr_col_nm,
                count(*) filter (where prccsr_gnr005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gnr005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gnr006' as prccsr_col_nm,
                count(*) filter (where prccsr_gnr006 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gnr006 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gnr007' as prccsr_col_nm,
                count(*) filter (where prccsr_gnr007 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gnr007 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gnr008' as prccsr_col_nm,
                count(*) filter (where prccsr_gnr008 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gnr008 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gnr009' as prccsr_col_nm,
                count(*) filter (where prccsr_gnr009 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gnr009 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_gnr010' as prccsr_col_nm,
                count(*) filter (where prccsr_gnr010 in (1,2,3)) as encounter_count,
                avg(case when prccsr_gnr010 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_hep001' as prccsr_col_nm,
                count(*) filter (where prccsr_hep001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_hep001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_hep002' as prccsr_col_nm,
                count(*) filter (where prccsr_hep002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_hep002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_hep003' as prccsr_col_nm,
                count(*) filter (where prccsr_hep003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_hep003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_hep004' as prccsr_col_nm,
                count(*) filter (where prccsr_hep004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_hep004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_hep005' as prccsr_col_nm,
                count(*) filter (where prccsr_hep005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_hep005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_hep006' as prccsr_col_nm,
                count(*) filter (where prccsr_hep006 in (1,2,3)) as encounter_count,
                avg(case when prccsr_hep006 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_hep007' as prccsr_col_nm,
                count(*) filter (where prccsr_hep007 in (1,2,3)) as encounter_count,
                avg(case when prccsr_hep007 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_hep008' as prccsr_col_nm,
                count(*) filter (where prccsr_hep008 in (1,2,3)) as encounter_count,
                avg(case when prccsr_hep008 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_hep009' as prccsr_col_nm,
                count(*) filter (where prccsr_hep009 in (1,2,3)) as encounter_count,
                avg(case when prccsr_hep009 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_hep010' as prccsr_col_nm,
                count(*) filter (where prccsr_hep010 in (1,2,3)) as encounter_count,
                avg(case when prccsr_hep010 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_hep011' as prccsr_col_nm,
                count(*) filter (where prccsr_hep011 in (1,2,3)) as encounter_count,
                avg(case when prccsr_hep011 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_hep012' as prccsr_col_nm,
                count(*) filter (where prccsr_hep012 in (1,2,3)) as encounter_count,
                avg(case when prccsr_hep012 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_hep013' as prccsr_col_nm,
                count(*) filter (where prccsr_hep013 in (1,2,3)) as encounter_count,
                avg(case when prccsr_hep013 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_img001' as prccsr_col_nm,
                count(*) filter (where prccsr_img001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_img001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_img002' as prccsr_col_nm,
                count(*) filter (where prccsr_img002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_img002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_img003' as prccsr_col_nm,
                count(*) filter (where prccsr_img003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_img003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_img004' as prccsr_col_nm,
                count(*) filter (where prccsr_img004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_img004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_img005' as prccsr_col_nm,
                count(*) filter (where prccsr_img005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_img005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_img006' as prccsr_col_nm,
                count(*) filter (where prccsr_img006 in (1,2,3)) as encounter_count,
                avg(case when prccsr_img006 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_img007' as prccsr_col_nm,
                count(*) filter (where prccsr_img007 in (1,2,3)) as encounter_count,
                avg(case when prccsr_img007 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_img008' as prccsr_col_nm,
                count(*) filter (where prccsr_img008 in (1,2,3)) as encounter_count,
                avg(case when prccsr_img008 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_img009' as prccsr_col_nm,
                count(*) filter (where prccsr_img009 in (1,2,3)) as encounter_count,
                avg(case when prccsr_img009 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_img010' as prccsr_col_nm,
                count(*) filter (where prccsr_img010 in (1,2,3)) as encounter_count,
                avg(case when prccsr_img010 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_lym001' as prccsr_col_nm,
                count(*) filter (where prccsr_lym001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_lym001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_lym002' as prccsr_col_nm,
                count(*) filter (where prccsr_lym002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_lym002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			;
commit;
insert into capstone.feasibility_prccsr_target_profile (prccsr_col_nm, encounter_count, prevalence_pct)
            select
				'prccsr_lym003' as prccsr_col_nm,
                count(*) filter (where prccsr_lym003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_lym003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_lym004' as prccsr_col_nm,
                count(*) filter (where prccsr_lym004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_lym004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_lym005' as prccsr_col_nm,
                count(*) filter (where prccsr_lym005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_lym005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_lym006' as prccsr_col_nm,
                count(*) filter (where prccsr_lym006 in (1,2,3)) as encounter_count,
                avg(case when prccsr_lym006 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_lym007' as prccsr_col_nm,
                count(*) filter (where prccsr_lym007 in (1,2,3)) as encounter_count,
                avg(case when prccsr_lym007 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_lym008' as prccsr_col_nm,
                count(*) filter (where prccsr_lym008 in (1,2,3)) as encounter_count,
                avg(case when prccsr_lym008 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_lym009' as prccsr_col_nm,
                count(*) filter (where prccsr_lym009 in (1,2,3)) as encounter_count,
                avg(case when prccsr_lym009 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_lym010' as prccsr_col_nm,
                count(*) filter (where prccsr_lym010 in (1,2,3)) as encounter_count,
                avg(case when prccsr_lym010 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_lym011' as prccsr_col_nm,
                count(*) filter (where prccsr_lym011 in (1,2,3)) as encounter_count,
                avg(case when prccsr_lym011 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mam001' as prccsr_col_nm,
                count(*) filter (where prccsr_mam001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mam001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mam002' as prccsr_col_nm,
                count(*) filter (where prccsr_mam002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mam002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mam003' as prccsr_col_nm,
                count(*) filter (where prccsr_mam003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mam003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mam004' as prccsr_col_nm,
                count(*) filter (where prccsr_mam004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mam004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mam005' as prccsr_col_nm,
                count(*) filter (where prccsr_mam005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mam005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mam006' as prccsr_col_nm,
                count(*) filter (where prccsr_mam006 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mam006 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mam007' as prccsr_col_nm,
                count(*) filter (where prccsr_mam007 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mam007 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mam008' as prccsr_col_nm,
                count(*) filter (where prccsr_mam008 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mam008 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mam009' as prccsr_col_nm,
                count(*) filter (where prccsr_mam009 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mam009 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mam010' as prccsr_col_nm,
                count(*) filter (where prccsr_mam010 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mam010 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mam011' as prccsr_col_nm,
                count(*) filter (where prccsr_mam011 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mam011 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mam012' as prccsr_col_nm,
                count(*) filter (where prccsr_mam012 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mam012 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mam013' as prccsr_col_nm,
                count(*) filter (where prccsr_mam013 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mam013 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mam014' as prccsr_col_nm,
                count(*) filter (where prccsr_mam014 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mam014 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			;
commit;
insert into capstone.feasibility_prccsr_target_profile (prccsr_col_nm, encounter_count, prevalence_pct)
            select
				'prccsr_mam015' as prccsr_col_nm,
                count(*) filter (where prccsr_mam015 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mam015 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mht001' as prccsr_col_nm,
                count(*) filter (where prccsr_mht001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mht001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mht002' as prccsr_col_nm,
                count(*) filter (where prccsr_mht002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mht002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mht003' as prccsr_col_nm,
                count(*) filter (where prccsr_mht003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mht003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mht004' as prccsr_col_nm,
                count(*) filter (where prccsr_mht004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mht004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mht005' as prccsr_col_nm,
                count(*) filter (where prccsr_mht005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mht005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mrs001' as prccsr_col_nm,
                count(*) filter (where prccsr_mrs001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mrs001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mrs002' as prccsr_col_nm,
                count(*) filter (where prccsr_mrs002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mrs002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mrs003' as prccsr_col_nm,
                count(*) filter (where prccsr_mrs003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mrs003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mrs004' as prccsr_col_nm,
                count(*) filter (where prccsr_mrs004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mrs004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mrs005' as prccsr_col_nm,
                count(*) filter (where prccsr_mrs005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mrs005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mrs006' as prccsr_col_nm,
                count(*) filter (where prccsr_mrs006 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mrs006 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mrs007' as prccsr_col_nm,
                count(*) filter (where prccsr_mrs007 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mrs007 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst001' as prccsr_col_nm,
                count(*) filter (where prccsr_mst001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst002' as prccsr_col_nm,
                count(*) filter (where prccsr_mst002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst003' as prccsr_col_nm,
                count(*) filter (where prccsr_mst003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst004' as prccsr_col_nm,
                count(*) filter (where prccsr_mst004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst005' as prccsr_col_nm,
                count(*) filter (where prccsr_mst005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst006' as prccsr_col_nm,
                count(*) filter (where prccsr_mst006 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst006 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst007' as prccsr_col_nm,
                count(*) filter (where prccsr_mst007 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst007 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst008' as prccsr_col_nm,
                count(*) filter (where prccsr_mst008 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst008 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst009' as prccsr_col_nm,
                count(*) filter (where prccsr_mst009 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst009 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst010' as prccsr_col_nm,
                count(*) filter (where prccsr_mst010 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst010 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst011' as prccsr_col_nm,
                count(*) filter (where prccsr_mst011 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst011 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst012' as prccsr_col_nm,
                count(*) filter (where prccsr_mst012 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst012 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst013' as prccsr_col_nm,
                count(*) filter (where prccsr_mst013 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst013 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst014' as prccsr_col_nm,
                count(*) filter (where prccsr_mst014 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst014 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst015' as prccsr_col_nm,
                count(*) filter (where prccsr_mst015 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst015 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst016' as prccsr_col_nm,
                count(*) filter (where prccsr_mst016 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst016 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst017' as prccsr_col_nm,
                count(*) filter (where prccsr_mst017 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst017 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			;
commit;
insert into capstone.feasibility_prccsr_target_profile (prccsr_col_nm, encounter_count, prevalence_pct)	
            select
				'prccsr_mst018' as prccsr_col_nm,
                count(*) filter (where prccsr_mst018 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst018 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst019' as prccsr_col_nm,
                count(*) filter (where prccsr_mst019 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst019 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst020' as prccsr_col_nm,
                count(*) filter (where prccsr_mst020 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst020 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst021' as prccsr_col_nm,
                count(*) filter (where prccsr_mst021 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst021 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst022' as prccsr_col_nm,
                count(*) filter (where prccsr_mst022 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst022 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst023' as prccsr_col_nm,
                count(*) filter (where prccsr_mst023 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst023 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst024' as prccsr_col_nm,
                count(*) filter (where prccsr_mst024 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst024 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst025' as prccsr_col_nm,
                count(*) filter (where prccsr_mst025 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst025 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst026' as prccsr_col_nm,
                count(*) filter (where prccsr_mst026 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst026 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst027' as prccsr_col_nm,
                count(*) filter (where prccsr_mst027 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst027 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst028' as prccsr_col_nm,
                count(*) filter (where prccsr_mst028 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst028 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst029' as prccsr_col_nm,
                count(*) filter (where prccsr_mst029 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst029 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_mst030' as prccsr_col_nm,
                count(*) filter (where prccsr_mst030 in (1,2,3)) as encounter_count,
                avg(case when prccsr_mst030 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ncm001' as prccsr_col_nm,
                count(*) filter (where prccsr_ncm001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ncm001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ncm002' as prccsr_col_nm,
                count(*) filter (where prccsr_ncm002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ncm002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ncm003' as prccsr_col_nm,
                count(*) filter (where prccsr_ncm003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ncm003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ncm004' as prccsr_col_nm,
                count(*) filter (where prccsr_ncm004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ncm004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_ost001' as prccsr_col_nm,
                count(*) filter (where prccsr_ost001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_ost001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_otr001' as prccsr_col_nm,
                count(*) filter (where prccsr_otr001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_otr001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_otr002' as prccsr_col_nm,
                count(*) filter (where prccsr_otr002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_otr002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_otr003' as prccsr_col_nm,
                count(*) filter (where prccsr_otr003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_otr003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_otr004' as prccsr_col_nm,
                count(*) filter (where prccsr_otr004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_otr004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_otr005' as prccsr_col_nm,
                count(*) filter (where prccsr_otr005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_otr005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_pgn001' as prccsr_col_nm,
                count(*) filter (where prccsr_pgn001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_pgn001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_pgn002' as prccsr_col_nm,
                count(*) filter (where prccsr_pgn002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_pgn002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_pgn003' as prccsr_col_nm,
                count(*) filter (where prccsr_pgn003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_pgn003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_pgn004' as prccsr_col_nm,
                count(*) filter (where prccsr_pgn004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_pgn004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_pgn005' as prccsr_col_nm,
                count(*) filter (where prccsr_pgn005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_pgn005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_pgn006' as prccsr_col_nm,
                count(*) filter (where prccsr_pgn006 in (1,2,3)) as encounter_count,
                avg(case when prccsr_pgn006 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_pgn007' as prccsr_col_nm,
                count(*) filter (where prccsr_pgn007 in (1,2,3)) as encounter_count,
                avg(case when prccsr_pgn007 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_pgn008' as prccsr_col_nm,
                count(*) filter (where prccsr_pgn008 in (1,2,3)) as encounter_count,
                avg(case when prccsr_pgn008 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_pgn009' as prccsr_col_nm,
                count(*) filter (where prccsr_pgn009 in (1,2,3)) as encounter_count,
                avg(case when prccsr_pgn009 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_plc001' as prccsr_col_nm,
                count(*) filter (where prccsr_plc001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_plc001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_plc002' as prccsr_col_nm,
                count(*) filter (where prccsr_plc002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_plc002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_pns001' as prccsr_col_nm,
                count(*) filter (where prccsr_pns001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_pns001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_pns002' as prccsr_col_nm,
                count(*) filter (where prccsr_pns002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_pns002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_pns003' as prccsr_col_nm,
                count(*) filter (where prccsr_pns003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_pns003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_pns004' as prccsr_col_nm,
                count(*) filter (where prccsr_pns004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_pns004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_pns005' as prccsr_col_nm,
                count(*) filter (where prccsr_pns005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_pns005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_pns006' as prccsr_col_nm,
                count(*) filter (where prccsr_pns006 in (1,2,3)) as encounter_count,
                avg(case when prccsr_pns006 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_rad001' as prccsr_col_nm,
                count(*) filter (where prccsr_rad001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_rad001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_rad002' as prccsr_col_nm,
                count(*) filter (where prccsr_rad002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_rad002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_rad003' as prccsr_col_nm,
                count(*) filter (where prccsr_rad003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_rad003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_rad004' as prccsr_col_nm,
                count(*) filter (where prccsr_rad004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_rad004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_res001' as prccsr_col_nm,
                count(*) filter (where prccsr_res001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_res001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_res002' as prccsr_col_nm,
                count(*) filter (where prccsr_res002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_res002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_res003' as prccsr_col_nm,
                count(*) filter (where prccsr_res003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_res003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_res004' as prccsr_col_nm,
                count(*) filter (where prccsr_res004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_res004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_res005' as prccsr_col_nm,
                count(*) filter (where prccsr_res005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_res005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_res006' as prccsr_col_nm,
                count(*) filter (where prccsr_res006 in (1,2,3)) as encounter_count,
                avg(case when prccsr_res006 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_res007' as prccsr_col_nm,
                count(*) filter (where prccsr_res007 in (1,2,3)) as encounter_count,
                avg(case when prccsr_res007 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_res008' as prccsr_col_nm,
                count(*) filter (where prccsr_res008 in (1,2,3)) as encounter_count,
                avg(case when prccsr_res008 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_res009' as prccsr_col_nm,
                count(*) filter (where prccsr_res009 in (1,2,3)) as encounter_count,
                avg(case when prccsr_res009 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_res010' as prccsr_col_nm,
                count(*) filter (where prccsr_res010 in (1,2,3)) as encounter_count,
                avg(case when prccsr_res010 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_res011' as prccsr_col_nm,
                count(*) filter (where prccsr_res011 in (1,2,3)) as encounter_count,
                avg(case when prccsr_res011 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_res012' as prccsr_col_nm,
                count(*) filter (where prccsr_res012 in (1,2,3)) as encounter_count,
                avg(case when prccsr_res012 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_res013' as prccsr_col_nm,
                count(*) filter (where prccsr_res013 in (1,2,3)) as encounter_count,
                avg(case when prccsr_res013 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_res014' as prccsr_col_nm,
                count(*) filter (where prccsr_res014 in (1,2,3)) as encounter_count,
                avg(case when prccsr_res014 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			;
commit;
insert into capstone.feasibility_prccsr_target_profile (prccsr_col_nm, encounter_count, prevalence_pct)	
            select
				'prccsr_rhb001' as prccsr_col_nm,
                count(*) filter (where prccsr_rhb001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_rhb001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_rhb002' as prccsr_col_nm,
                count(*) filter (where prccsr_rhb002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_rhb002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_rhb003' as prccsr_col_nm,
                count(*) filter (where prccsr_rhb003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_rhb003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_rhb004' as prccsr_col_nm,
                count(*) filter (where prccsr_rhb004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_rhb004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_skb001' as prccsr_col_nm,
                count(*) filter (where prccsr_skb001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_skb001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_skb002' as prccsr_col_nm,
                count(*) filter (where prccsr_skb002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_skb002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_skb003' as prccsr_col_nm,
                count(*) filter (where prccsr_skb003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_skb003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_skb004' as prccsr_col_nm,
                count(*) filter (where prccsr_skb004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_skb004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_skb005' as prccsr_col_nm,
                count(*) filter (where prccsr_skb005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_skb005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_skb006' as prccsr_col_nm,
                count(*) filter (where prccsr_skb006 in (1,2,3)) as encounter_count,
                avg(case when prccsr_skb006 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_skb007' as prccsr_col_nm,
                count(*) filter (where prccsr_skb007 in (1,2,3)) as encounter_count,
                avg(case when prccsr_skb007 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_skb008' as prccsr_col_nm,
                count(*) filter (where prccsr_skb008 in (1,2,3)) as encounter_count,
                avg(case when prccsr_skb008 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_skb009' as prccsr_col_nm,
                count(*) filter (where prccsr_skb009 in (1,2,3)) as encounter_count,
                avg(case when prccsr_skb009 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_skb010' as prccsr_col_nm,
                count(*) filter (where prccsr_skb010 in (1,2,3)) as encounter_count,
                avg(case when prccsr_skb010 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_sud001' as prccsr_col_nm,
                count(*) filter (where prccsr_sud001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_sud001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_sud002' as prccsr_col_nm,
                count(*) filter (where prccsr_sud002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_sud002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_sud003' as prccsr_col_nm,
                count(*) filter (where prccsr_sud003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_sud003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_sud004' as prccsr_col_nm,
                count(*) filter (where prccsr_sud004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_sud004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_urn001' as prccsr_col_nm,
                count(*) filter (where prccsr_urn001 in (1,2,3)) as encounter_count,
                avg(case when prccsr_urn001 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_urn002' as prccsr_col_nm,
                count(*) filter (where prccsr_urn002 in (1,2,3)) as encounter_count,
                avg(case when prccsr_urn002 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_urn003' as prccsr_col_nm,
                count(*) filter (where prccsr_urn003 in (1,2,3)) as encounter_count,
                avg(case when prccsr_urn003 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_urn004' as prccsr_col_nm,
                count(*) filter (where prccsr_urn004 in (1,2,3)) as encounter_count,
                avg(case when prccsr_urn004 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_urn005' as prccsr_col_nm,
                count(*) filter (where prccsr_urn005 in (1,2,3)) as encounter_count,
                avg(case when prccsr_urn005 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_urn006' as prccsr_col_nm,
                count(*) filter (where prccsr_urn006 in (1,2,3)) as encounter_count,
                avg(case when prccsr_urn006 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_urn007' as prccsr_col_nm,
                count(*) filter (where prccsr_urn007 in (1,2,3)) as encounter_count,
                avg(case when prccsr_urn007 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_urn008' as prccsr_col_nm,
                count(*) filter (where prccsr_urn008 in (1,2,3)) as encounter_count,
                avg(case when prccsr_urn008 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_urn009' as prccsr_col_nm,
                count(*) filter (where prccsr_urn009 in (1,2,3)) as encounter_count,
                avg(case when prccsr_urn009 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_urn010' as prccsr_col_nm,
                count(*) filter (where prccsr_urn010 in (1,2,3)) as encounter_count,
                avg(case when prccsr_urn010 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_urn011' as prccsr_col_nm,
                count(*) filter (where prccsr_urn011 in (1,2,3)) as encounter_count,
                avg(case when prccsr_urn011 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			union all 
            select
				'prccsr_urn012' as prccsr_col_nm,
                count(*) filter (where prccsr_urn012 in (1,2,3)) as encounter_count,
                avg(case when prccsr_urn012 in (1,2,3) then 1.0 else 0.0 end) as prevalence_pct
            from hcup_nis_2023.dx_pr_grps a
				join hcup_nis_2023.severity b on a.hosp_nis = b.hosp_nis and a.key_nis = b.key_nis
            where LPAD(b.aprdrg::text, 3, '0') in ('139','194','383','469','710')
			;


