--Financial Opportunity

--Procedure CCSRs in scope:
-- MST019
-- CAR024
-- GIS009

drop table if exists capstone.financial_opportunity cascade;
create table if not exists capstone.financial_opportunity as (
WITH targets AS (
    SELECT 'MST019' AS target_ccsr
    UNION ALL SELECT 'CAR024'
    UNION ALL SELECT 'GIS009'
),
base AS (
    SELECT 
        c.admit_id,
        c.drg_cd,
        c.age,
        c.gender,
        c.rom_score,
        c.soi_score,
        c.length_of_stay,
        c.total_charge
    FROM capstone.nis_core c
    WHERE c.drg_cd IN ('139','194','383','469','710')
),
target_flags AS (
    SELECT DISTINCT
        l.admit_id,
        l.ccsr_cat_cd
    FROM capstone.nis_long_pr l
    WHERE l.ccsr_cat_cd IN ('MST019','CAR024','GIS009')
)
SELECT
    b.*,
    t.target_ccsr,
    CASE 
        WHEN tf.admit_id IS NOT NULL THEN 1
        ELSE 0
    END AS target_flag
FROM base b
CROSS JOIN targets t
LEFT JOIN target_flags tf
    ON b.admit_id = tf.admit_id
    AND tf.ccsr_cat_cd = t.target_ccsr
);

select * from capstone.financial_opportunity limit 20;


--Sanity Check
--Check a few admissions from each target ccsr to be sure

select * from capstone.nis_long_pr where admit_id in (
select admit_id from capstone.financial_opportunity where target_ccsr='MST019' and target_flag=1
and drg_cd IN ('139','194','383','469','710')
order by random()
limit 5)
and ccsr_cat_cd='MST019'
order by drg_cd, pr_index;

select * from capstone.nis_long_pr where admit_id in (
select admit_id from capstone.financial_opportunity where target_ccsr='CAR024' and target_flag=1
and drg_cd IN ('139','194','383','469','710')
order by random()
limit 5)
and ccsr_cat_cd='CAR024'
order by drg_cd, pr_index;

select * from capstone.nis_long_pr where admit_id in (
select admit_id from capstone.financial_opportunity where target_ccsr='GIS009' and target_flag=1
and drg_cd IN ('139','194','383','469','710')
order by random()
limit 5)
and ccsr_cat_cd='GIS009'
order by drg_cd, pr_index;





-- Potential Financial Opportunity - DRG Level
drop table if exists capstone.financial_opportunity_drg cascade;
create table if not exists capstone.financial_opportunity_drg as (
WITH drg_benchmark AS (
    SELECT
        target_ccsr,
        drg_cd,
		--number of admissions where the target CCSR IS NOT present:
        COUNT(*) FILTER (WHERE target_flag = 0) AS n_target_0, 
		--number of admissions where the target CCSR IS present:
        COUNT(*) FILTER (WHERE target_flag = 1) AS n_target_1,
		--median charge where the target CCSR IS NOT present:
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY total_charge)
            FILTER (WHERE target_flag = 0) AS median_charge_target_0,
		--median charge where the target CCSR IS present:
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY total_charge)
            FILTER (WHERE target_flag = 1) AS median_charge_target_1
    FROM capstone.financial_opportunity
    GROUP BY target_ccsr, drg_cd
)
SELECT
    target_ccsr,
    drg_cd,
    n_target_0,
    n_target_1,
    median_charge_target_0,
    median_charge_target_1,
    median_charge_target_1 - median_charge_target_0 AS delta_charge
FROM drg_benchmark
ORDER BY target_ccsr, drg_cd
);

select * from capstone.financial_opportunity_drg
order by target_ccsr, drg_cd;


-- Potential Financial Opportunity - Encounter Level
drop table if exists capstone.financial_opportunity_admission cascade;
create table if not exists capstone.financial_opportunity_admission as (
WITH drg_benchmark AS (
    SELECT
        target_ccsr,
        drg_cd,
        COUNT(*) FILTER (WHERE target_flag = 0) AS n_target_0,
        COUNT(*) FILTER (WHERE target_flag = 1) AS n_target_1,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY total_charge)
            FILTER (WHERE target_flag = 0) AS median_charge_target_0,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY total_charge)
            FILTER (WHERE target_flag = 1) AS median_charge_target_1
    FROM capstone.financial_opportunity
    GROUP BY target_ccsr, drg_cd
)
SELECT
    a.admit_id,
    a.target_ccsr,
    a.target_flag,
    a.drg_cd,
    a.age,
    a.gender,
    a.rom_score,
    a.soi_score,
    a.length_of_stay,
    a.total_charge,
    b.n_target_0,
    b.n_target_1,
    b.median_charge_target_0,
    b.median_charge_target_1,
    b.median_charge_target_1 - b.median_charge_target_0 AS delta_charge
FROM capstone.financial_opportunity a
LEFT JOIN drg_benchmark b
    ON a.target_ccsr = b.target_ccsr
   AND a.drg_cd = b.drg_cd
ORDER BY a.target_ccsr, a.drg_cd, a.admit_id
);

select count(*) from capstone.financial_opportunity_admission;

select distinct target_ccsr from capstone.financial_opportunity_admission;

--export capstone.financial_opportunity_admission to 
-- ...Models\financial_opportunity_model\financial_opportunity_input_admission.csv

/*
The model identified the top 5 highest probability admissions
for review. Now, check the clinical plausibility of these admissions, reviewing the
diagnosis CCSRs
*/
select admit_id, 
dx_index,
dx_cd,
ccsr_cat_cd
from capstone.mimic_long_dx
where admit_id in (
29285346,
20289704,
20493673,
29876293,
29657639
)
--order by admit_id, dx_index;
order by ccsr_cat_cd, admit_id, dx_index;

