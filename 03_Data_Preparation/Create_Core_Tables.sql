create schema if not exists capstone;

-- !!!!!  This is the only table requiring import from a flat file on the Google Drive
--        All others are handled completely inside the query editor.
drop table if exists capstone.dim_drg cascade;
create table if not exists capstone.dim_drg (
drg_cd char(3),
drg_desc varchar(200)
);
-- !!!! Import data from a file on the Google Drive:  
--      Quantic Capstone/Data/capstone_core_tables/drg_codes_and_descriptions.txt'
--      (Format: csv; Header: OFF; Delimiter: [tab],  Quote: ")
select * from capstone.dim_drg order by 1;

-------------------------------------------------------------------------
-- Diagnosis and Procedure Code Mapping Tables
-------------------------------------------------------------------------
-- ** Important insight: The diagnosis-to-ccsr category is not 1:1
--    One diagnosis code can map to 1 or more CCSR categories. This is valid
--    and represents the concept that a diagnosis can span more than one
--    clinically meaningful condition or body system
drop table if exists capstone.dx_to_ccsr_mapping cascade;
create table if not exists capstone.dx_to_ccsr_mapping as (
select 
a.i10_dx_cd as dx_cd,
a.i10_dx_desc as dx_desc,
a.ccsr_cat_cd,
b.ccsr_cat_desc
from 
hcup_nis_2023.dx_to_ccsr_mapping a
join
hcup_nis_2023.ccsr_categories b
on a.ccsr_cat_cd = b.ccsr_cat_cd
)
;
select * from capstone.dx_to_ccsr_mapping;


drop table if exists capstone.pr_to_ccsr_mapping cascade;
create table if not exists capstone.pr_to_ccsr_mapping as (
select 
trim(BOTH '''' FROM i10_pr_cd) as pr_cd,
i10_pr_desc as pr_desc,
trim(BOTH '''' FROM ccsr_cat_cd) as ccsr_cat_cd,
ccsr_cat_desc
from hcup_nis_2023.pr_to_ccsr_mapping
);
select * from capstone.pr_to_ccsr_mapping;


-------------------------------------------------------------------------
-- Dimension Tables
-------------------------------------------------------------------------
drop table if exists capstone.dim_serviceline cascade;
create table if not exists capstone.dim_serviceline (
serviceline_cd	integer,
serviceline_nm	varchar(30)
);
insert into capstone.dim_serviceline values ( 1, 'Maternal/Neonatal');
insert into capstone.dim_serviceline values ( 2, 'Mental Health/Substance Abuse');
insert into capstone.dim_serviceline values ( 3, 'Injury');
insert into capstone.dim_serviceline values ( 4, 'Surgical');
insert into capstone.dim_serviceline values ( 5, 'Medical');

select * from capstone.dim_serviceline;


drop table if exists capstone.dim_discharge_dest cascade;
create table if not exists capstone.dim_discharge_dest (
discharge_dest_cd	integer,
discharge_dest_short	varchar(10),
discharge_dest	varchar(60)
);
insert into capstone.dim_discharge_dest values (1, 'Routine', 'Routine');
insert into capstone.dim_discharge_dest values (2, 'STH', 'Short-Term Hospital');
insert into capstone.dim_discharge_dest values (5, 'SNF/ICF', 'Skilled Nursing Facility/Intermediate Care Facility');
insert into capstone.dim_discharge_dest values (6, 'HHC', 'Home Health Care');
insert into capstone.dim_discharge_dest values (7, 'AMA', 'Against Medical Advice');
insert into capstone.dim_discharge_dest values (20, 'Died', 'Died During Admission');
insert into capstone.dim_discharge_dest values (99, 'Unknown', 'Discharge Alive, Destination Unknown');

select * from capstone.dim_discharge_dest;


drop table if exists capstone.dim_month cascade;
create table if not exists capstone.dim_month (
month_no	integer,
month_nm_short char(3),
month_nm varchar(10),
season_nm varchar(10)
);
insert into capstone.dim_month values (1, 'Jan', 'January', 'Winter');
insert into capstone.dim_month values (2, 'Feb', 'February', 'Winter');
insert into capstone.dim_month values (3, 'Mar', 'March', 'Spring');
insert into capstone.dim_month values (4, 'Apr', 'April', 'Spring');
insert into capstone.dim_month values (5, 'May', 'May',	'Spring');
insert into capstone.dim_month values (6, 'Jun', 'June', 'Summer');
insert into capstone.dim_month values (7, 'Jul', 'July', 'Summer');
insert into capstone.dim_month values (8, 'Aug', 'August', 'Summer');
insert into capstone.dim_month values (9, 'Sep', 'September', 'Fall');
insert into capstone.dim_month values (10, 'Oct', 'October', 'Fall');
insert into capstone.dim_month values (11, 'Nov', 'November', 'Fall');
insert into capstone.dim_month values (12, 'Dec', 'December', 'Winter');

select * from capstone.dim_month;


drop table if exists capstone.dim_hosp_bedsize cascade;
create table if not exists capstone.dim_hosp_bedsize (
hosp_bedsize_cd numeric(2,0),
hosp_bedsize_desc varchar(10)
);
insert into capstone.dim_hosp_bedsize values (1, 'Small');
insert into capstone.dim_hosp_bedsize values (2, 'Medium');
insert into capstone.dim_hosp_bedsize values (3, 'Large');

select * from capstone.dim_hosp_bedsize;


drop table if exists capstone.dim_hosp_teach cascade;
create table if not exists capstone.dim_hosp_teach (
hosp_teach_cd numeric(2,0),
hosp_teach_desc varchar(20)
);
insert into capstone.dim_hosp_teach values (1, 'Rural Nonteaching');
insert into capstone.dim_hosp_teach values (2, 'Urban Nonteaching');
insert into capstone.dim_hosp_teach values (3, 'Urban Teaching');

select * from capstone.dim_hosp_teach;


drop table if exists capstone.dim_soi_score cascade;
create table if not exists capstone.dim_soi_score (
soi_score numeric(2,0),
soi_desc_short	varchar(10),
soi_desc varchar(30)
);
insert into capstone.dim_soi_score values (0, 'None', 'No Class Specified');
insert into capstone.dim_soi_score values (1, 'Minor', 'Minor Loss of Function');
insert into capstone.dim_soi_score values (2, 'Moderate', 'Moderate Loss of Function');
insert into capstone.dim_soi_score values (3, 'Major', 'Major Loss of Function');
insert into capstone.dim_soi_score values (4, 'Extreme', 'Extreme Loss of Function');

select * from capstone.dim_soi_score;


drop table if exists capstone.dim_rom_score cascade;
create table if not exists capstone.dim_rom_score (
rom_score numeric(2,0),
rom_desc_short	varchar(10),
rom_desc varchar(30)
);
insert into capstone.dim_rom_score values (0, 'None', 'No Class Specified');
insert into capstone.dim_rom_score values (1, 'Minor', 'Minor Likelihood of Dying');
insert into capstone.dim_rom_score values (2, 'Moderate', 'Moderate Likelihood of Dying');
insert into capstone.dim_rom_score values (3, 'Major', 'Major Likelihood of Dying');
insert into capstone.dim_rom_score values (4, 'Extreme', 'Extreme Likelihood of Dying');

select * from capstone.dim_rom_score;




-------------------------------------------------------------------------
-- NIS Data
-------------------------------------------------------------------------
DROP TABLE IF EXISTS capstone.nis_core cascade;
CREATE TABLE IF NOT EXISTS capstone.nis_core as (
SELECT 
    core.key_nis  as admit_id,
	core.hosp_nis as hosp_id,
    age                 ,
    amonth as admit_month_no, 
	case aweekend 
		when 0 then 'Weekday'
		when 1 then 'Weekend'
	end as admit_weekday_weekend,
    died  as died_ind,
    totchg_2023 as total_charge,
    dispuniform as discharge_dest_cd,
	elective as elective_ind,
    case female
		when 0 then 'M'
		when 1 then 'F'
	end as gender,
    case
		when hcup_ed = 0 then 0
		when hcup_ed in (1,2,3,4) then 1
	end as admit_thru_ed_ind,
	i10_serviceline as serviceline_cd,
    los as length_of_stay,
	hosp_bedsize as hosp_bedsize_cd,
	hosp_locteach as hosp_teach_cd,
	core.pay1 as payer_cd,
	LPAD(severity.aprdrg::text, 3, '0') as drg_cd ,
	aprdrg_risk_mortality as rom_score,
	aprdrg_severity as soi_score,
	i10_ndx  as dx_cd_count,
    i10_npr  as pr_cd_count,
    i10_dx1         as dx_cd_01    ,
    i10_dx2         as dx_cd_02    ,
    i10_dx3         as dx_cd_03    ,
    i10_dx4         as dx_cd_04    ,
    i10_dx5         as dx_cd_05    ,
    i10_dx6         as dx_cd_06    ,
    i10_dx7         as dx_cd_07    ,
    i10_dx8         as dx_cd_08    ,
    i10_dx9         as dx_cd_09    ,
    i10_dx10        as dx_cd_10    ,
    i10_dx11        as dx_cd_11    ,
    i10_dx12        as dx_cd_12    ,
    i10_dx13        as dx_cd_13    ,
    i10_dx14        as dx_cd_14    ,
    i10_dx15        as dx_cd_15    ,
    i10_dx16        as dx_cd_16    ,
    i10_dx17        as dx_cd_17    ,
    i10_dx18        as dx_cd_18    ,
    i10_dx19        as dx_cd_19    ,
    i10_dx20        as dx_cd_20    ,
    i10_dx21        as dx_cd_21    ,
    i10_dx22        as dx_cd_22    ,
    i10_dx23        as dx_cd_23    ,
    i10_dx24        as dx_cd_24    ,
    i10_dx25        as dx_cd_25    ,
    i10_dx26        as dx_cd_26    ,
    i10_dx27        as dx_cd_27    ,
    i10_dx28        as dx_cd_28    ,
    i10_dx29        as dx_cd_29    ,
    i10_dx30        as dx_cd_30    ,
    i10_dx31        as dx_cd_31    ,
    i10_dx32        as dx_cd_32    ,
    i10_dx33        as dx_cd_33    ,
    i10_dx34        as dx_cd_34    ,
    i10_dx35        as dx_cd_35    ,
    i10_dx36        as dx_cd_36    ,
    i10_dx37        as dx_cd_37    ,
    i10_dx38        as dx_cd_38    ,
    i10_dx39        as dx_cd_39    ,
    i10_dx40        as dx_cd_40    ,
    i10_pr1         as pr_cd_01    ,
    i10_pr2         as pr_cd_02    ,
    i10_pr3         as pr_cd_03    ,
    i10_pr4         as pr_cd_04    ,
    i10_pr5         as pr_cd_05    ,
    i10_pr6         as pr_cd_06    ,
    i10_pr7         as pr_cd_07    ,
    i10_pr8         as pr_cd_08    ,
    i10_pr9         as pr_cd_09    ,
    i10_pr10        as pr_cd_10    ,
    i10_pr11        as pr_cd_11    ,
    i10_pr12        as pr_cd_12    ,
    i10_pr13        as pr_cd_13    ,
    i10_pr14        as pr_cd_14    ,
    i10_pr15        as pr_cd_15    ,
    i10_pr16        as pr_cd_16    ,
    i10_pr17        as pr_cd_17    ,
    i10_pr18        as pr_cd_18    ,
    i10_pr19        as pr_cd_19    ,
    i10_pr20        as pr_cd_20    ,
    i10_pr21        as pr_cd_21    ,
    i10_pr22        as pr_cd_22    ,
    i10_pr23        as pr_cd_23    ,
    i10_pr24        as pr_cd_24    ,
    i10_pr25        as pr_cd_25
from hcup_nis_2023.core 
join hcup_nis_2023.hospital
on hcup_nis_2023.core.hosp_nis = hcup_nis_2023.hospital.hosp_nis
join hcup_nis_2023.severity
on hcup_nis_2023.core.key_nis = hcup_nis_2023.severity.key_nis
	and hcup_nis_2023.core.hosp_nis = hcup_nis_2023.severity.hosp_nis
where
age not in (-99,-66)
and amonth <> -9
and aweekend <> -9
and died not in (-9,-8)
and dispuniform not in (-9,-8)
and elective not in (-9,-8)
and i10_ndx > 0
and los not in (-9999,-8888,-6666)
and totchg_2023 >0
)
;
select count(*) from capstone.nis_core;
--6,672,346

drop table if exists capstone.nis_comorbidities cascade;
create table if not exists capstone.nis_comorbidities as (
select
key_nis  			as admit_id,
hosp_nis 			as hosp_id,
CMR_AIDS 			as CMR_AIDS_IND,
CMR_ALCOHOL			AS CMR_ALCOHOL_IND,
CMR_AUTOIMMUNE 		AS CMR_AUTOIMMUNE_IND,
CMR_CANCER_LYMPH 	AS CMR_CANCER_LYMPH_IND,
CMR_CANCER_LEUK		AS CMR_CANCER_LEUK_IND,
CMR_CANCER_METS 	AS CMR_CANCER_METS_IND,
CMR_CANCER_NSITU 	AS CMR_CANCER_NSITU_IND,
CMR_CANCER_SOLID 	AS CMR_CANCER_SOLID_IND,
CMR_DEMENTIA 		AS CMR_DEMENTIA_IND,
CMR_DEPRESS 		AS MR_DEPRESS_IND,
CMR_DIAB_UNCX 		AS CMR_DIAB_UNCX_IND,
CMR_DIAB_CX 		AS MR_DIAB_CX_IND,
CMR_DRUG_ABUSE 		AS CMR_DRUG_ABUSE_IND,
CMR_HTN_CX 			AS CMR_HTN_CX_IND,
CMR_HTN_UNCX 		AS CMR_HTN_UNCX_IND,
CMR_LUNG_CHRONIC 	AS CMR_LUNG_CHRONIC_IND,
CMR_OBESE 			AS CMR_OBESE_IND,
CMR_PERIVASC 		AS CMR_PERIVASC_IND,
CMR_THYROID_HYPO 	AS CMR_THYROID_HYPO_IND,
CMR_THYROID_OTH 	AS CMR_THYROID_OTH_IND
FROM hcup_nis_2023.dx_pr_grps
);
select count(*) from capstone.nis_comorbidities;
--6,743,716


--Puts all Diagnosis Codes into an array
--and all Procedure Codes into an array
DROP TABLE IF EXISTS capstone.nis_dx_pr_array cascade;
CREATE TABLE IF NOT EXISTS capstone.nis_dx_pr_array AS (
SELECT
    core.admit_id,
	core.hosp_id,
	core.drg_cd,
	core.rom_score,
	core.soi_score,
	-- all diagnoses for this admission as an array
    ARRAY_REMOVE(
        ARRAY[        
		NULLIF(TRIM(core.dx_cd_01), ''),
		NULLIF(TRIM(core.dx_cd_02), ''),
		NULLIF(TRIM(core.dx_cd_03), ''),
		NULLIF(TRIM(core.dx_cd_04), ''),
		NULLIF(TRIM(core.dx_cd_05), ''),
		NULLIF(TRIM(core.dx_cd_06), ''),
		NULLIF(TRIM(core.dx_cd_07), ''),
		NULLIF(TRIM(core.dx_cd_08), ''),
		NULLIF(TRIM(core.dx_cd_09), ''),
		NULLIF(TRIM(core.dx_cd_10), ''),
		NULLIF(TRIM(core.dx_cd_11), ''),
		NULLIF(TRIM(core.dx_cd_12), ''),
		NULLIF(TRIM(core.dx_cd_13), ''),
		NULLIF(TRIM(core.dx_cd_14), ''),
		NULLIF(TRIM(core.dx_cd_15), ''),
		NULLIF(TRIM(core.dx_cd_16), ''),
		NULLIF(TRIM(core.dx_cd_17), ''),
		NULLIF(TRIM(core.dx_cd_18), ''),
		NULLIF(TRIM(core.dx_cd_19), ''),
		NULLIF(TRIM(core.dx_cd_20), ''),
		NULLIF(TRIM(core.dx_cd_21), ''),
		NULLIF(TRIM(core.dx_cd_22), ''),
		NULLIF(TRIM(core.dx_cd_23), ''),
		NULLIF(TRIM(core.dx_cd_24), ''),
		NULLIF(TRIM(core.dx_cd_25), ''),
		NULLIF(TRIM(core.dx_cd_26), ''),
		NULLIF(TRIM(core.dx_cd_27), ''),
		NULLIF(TRIM(core.dx_cd_28), ''),
		NULLIF(TRIM(core.dx_cd_29), ''),
		NULLIF(TRIM(core.dx_cd_30), ''),
		NULLIF(TRIM(core.dx_cd_31), ''),
		NULLIF(TRIM(core.dx_cd_32), ''),
		NULLIF(TRIM(core.dx_cd_33), ''),
		NULLIF(TRIM(core.dx_cd_34), ''),
		NULLIF(TRIM(core.dx_cd_35), ''),
		NULLIF(TRIM(core.dx_cd_36), ''),
		NULLIF(TRIM(core.dx_cd_37), ''),
		NULLIF(TRIM(core.dx_cd_38), ''),
		NULLIF(TRIM(core.dx_cd_39), ''),
		NULLIF(TRIM(core.dx_cd_40), '')
        ],
        NULL
    ) AS dx_codes_array,
	-- all procedures for this admission as an array
	ARRAY_REMOVE(
        ARRAY[
		NULLIF(TRIM(core.pr_cd_01), ''),
		NULLIF(TRIM(core.pr_cd_02), ''),
		NULLIF(TRIM(core.pr_cd_03), ''),
		NULLIF(TRIM(core.pr_cd_04), ''),
		NULLIF(TRIM(core.pr_cd_05), ''),
		NULLIF(TRIM(core.pr_cd_06), ''),
		NULLIF(TRIM(core.pr_cd_07), ''),
		NULLIF(TRIM(core.pr_cd_08), ''),
		NULLIF(TRIM(core.pr_cd_09), ''),
		NULLIF(TRIM(core.pr_cd_10), ''),
		NULLIF(TRIM(core.pr_cd_11), ''),
		NULLIF(TRIM(core.pr_cd_12), ''),
		NULLIF(TRIM(core.pr_cd_13), ''),
		NULLIF(TRIM(core.pr_cd_14), ''),
		NULLIF(TRIM(core.pr_cd_15), ''),
		NULLIF(TRIM(core.pr_cd_16), ''),
		NULLIF(TRIM(core.pr_cd_17), ''),
		NULLIF(TRIM(core.pr_cd_18), ''),
		NULLIF(TRIM(core.pr_cd_19), ''),
		NULLIF(TRIM(core.pr_cd_20), ''),
		NULLIF(TRIM(core.pr_cd_21), ''),
		NULLIF(TRIM(core.pr_cd_22), ''),
		NULLIF(TRIM(core.pr_cd_23), ''),
		NULLIF(TRIM(core.pr_cd_24), ''),
		NULLIF(TRIM(core.pr_cd_25), '')
		],
        NULL
    ) AS pr_codes_array
FROM capstone.nis_core core
)
;
select count(*) from capstone.nis_dx_pr_array;
--6,672,346


--*********************************************************************
--Create Long Diagnosis Code Table - NIS Dataset
---One row per Admission / Diagnosis Code
---Also includes CCSR Category Code associated with the diagnosis code
---Recall Dx : CCSR is 1:many
--*********************************************************************
drop table if exists capstone.nis_long_dx cascade;
create table if not exists capstone.nis_long_dx as (
with long_dx as (
select core.key_nis as admit_id, 
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx1 as dx_cd,
1 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx1), '') is not null and core.i10_dx1 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx2 as dx_cd,
2 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx2), '') is not null and core.i10_dx2 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx3 as dx_cd,
3 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx3), '') is not null and core.i10_dx3 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx4 as dx_cd,
4 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx4), '') is not null and core.i10_dx4 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx5 as dx_cd,
5 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx5), '') is not null and core.i10_dx5 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx6 as dx_cd,
6 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx6), '') is not null and core.i10_dx6 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx7 as dx_cd,
7 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx7), '') is not null and core.i10_dx7 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx8 as dx_cd,
8 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx8), '') is not null and core.i10_dx8 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx9 as dx_cd,
9 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx9), '') is not null and core.i10_dx9 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx10 as dx_cd,
10 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx10), '') is not null and core.i10_dx10 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx11 as dx_cd,
11 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx11), '') is not null and core.i10_dx11 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx12 as dx_cd,
12 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx12), '') is not null and core.i10_dx12 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx13 as dx_cd,
13 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx13), '') is not null and core.i10_dx13 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx14 as dx_cd,
14 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx14), '') is not null and core.i10_dx14 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx15 as dx_cd,
15 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx15), '') is not null and core.i10_dx15 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx16 as dx_cd,
16 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx16), '') is not null and core.i10_dx16 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx17 as dx_cd,
17 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx17), '') is not null and core.i10_dx17 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx18 as dx_cd,
18 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx18), '') is not null and core.i10_dx18 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx19 as dx_cd,
19 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx19), '') is not null and core.i10_dx19 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx20 as dx_cd,
20 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx20), '') is not null and core.i10_dx20 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx21 as dx_cd,
21 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx21), '') is not null and core.i10_dx21 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx22 as dx_cd,
22 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx22), '') is not null and core.i10_dx22 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx23 as dx_cd,
23 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx23), '') is not null and core.i10_dx23 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx24 as dx_cd,
24 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx24), '') is not null and core.i10_dx24 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx25 as dx_cd,
25 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx25), '') is not null and core.i10_dx25 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx26 as dx_cd,
26 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx26), '') is not null and core.i10_dx26 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx27 as dx_cd,
27 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx27), '') is not null and core.i10_dx27 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx28 as dx_cd,
28 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx28), '') is not null and core.i10_dx28 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx29 as dx_cd,
29 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx29), '') is not null and core.i10_dx29 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx30 as dx_cd,
30 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx30), '') is not null and core.i10_dx30 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx31 as dx_cd,
31 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx31), '') is not null and core.i10_dx31 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx32 as dx_cd,
32 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx32), '') is not null and core.i10_dx32 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx33 as dx_cd,
33 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx33), '') is not null and core.i10_dx33 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx34 as dx_cd,
34 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx34), '') is not null and core.i10_dx34 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx35 as dx_cd,
35 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx35), '') is not null and core.i10_dx35 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx36 as dx_cd,
36 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx36), '') is not null and core.i10_dx36 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx37 as dx_cd,
37 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx37), '') is not null and core.i10_dx37 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx38 as dx_cd,
38 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx38), '') is not null and core.i10_dx38 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx39 as dx_cd,
39 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx39), '') is not null and core.i10_dx39 <> 'invl'
union all
select core.key_nis as admit_id,  
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_dx40 as dx_cd,
40 as dx_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_dx40), '') is not null and core.i10_dx40 <> 'invl'
)
select a.admit_id, a.drg_cd, a.dx_cd, a.dx_index, b.ccsr_cat_cd
from long_dx a
join capstone.dx_to_ccsr_mapping b on 
a.dx_cd = b.dx_cd
)
;
select count(*) from capstone.nis_input_long_dx;


--*********************************************************************
--Create Long Procedure Table - NIS dataset
---One row per Admission / Procedure Code
---Also includes CCSR Category Code associated with the procedure code
--*********************************************************************
drop table if exists capstone.nis_long_pr cascade;
create table if not exists capstone.nis_long_pr as (
with long_pr as (
select core.key_nis as admit_id, 
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr1 as pr_cd,
1 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr1), '') is not null
  and core.i10_pr1 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr2 as pr_cd,
2 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr2), '') is not null
  and core.i10_pr2 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr3 as pr_cd,
3 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr3), '') is not null
  and core.i10_pr3 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr4 as pr_cd,
4 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr4), '') is not null
  and core.i10_pr4 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr5 as pr_cd,
5 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr5), '') is not null
  and core.i10_pr5 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr6 as pr_cd,
6 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr6), '') is not null
  and core.i10_pr6 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr7 as pr_cd,
7 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr7), '') is not null
  and core.i10_pr7 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr8 as pr_cd,
8 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr8), '') is not null
  and core.i10_pr8 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr9 as pr_cd,
9 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr9), '') is not null
  and core.i10_pr9 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr10 as pr_cd,
10 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr10), '') is not null
  and core.i10_pr10 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr11 as pr_cd,
11 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr11), '') is not null
  and core.i10_pr11 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr12 as pr_cd,
12 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr12), '') is not null
  and core.i10_pr12 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr13 as pr_cd,
13 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr13), '') is not null
  and core.i10_pr13 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr14 as pr_cd,
14 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr14), '') is not null
  and core.i10_pr14 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr15 as pr_cd,
15 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr15), '') is not null
  and core.i10_pr15 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr16 as pr_cd,
16 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr16), '') is not null
  and core.i10_pr16 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr17 as pr_cd,
17 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr17), '') is not null
  and core.i10_pr17 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr18 as pr_cd,
18 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr18), '') is not null
  and core.i10_pr18 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr19 as pr_cd,
19 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr19), '') is not null
  and core.i10_pr19 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr20 as pr_cd,
20 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr20), '') is not null
  and core.i10_pr20 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr21 as pr_cd,
21 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr21), '') is not null
  and core.i10_pr21 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr22 as pr_cd,
22 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr22), '') is not null
  and core.i10_pr22 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr23 as pr_cd,
23 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr23), '') is not null
  and core.i10_pr23 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr24 as pr_cd,
24 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr24), '') is not null
  and core.i10_pr24 <> 'invl'
union all
select core.key_nis as admit_id,
LPAD(severity.aprdrg::text, 3, '0') as drg_cd, core.i10_pr25 as pr_cd,
25 as pr_index
from hcup_nis_2023.core 
join hcup_nis_2023.severity on core.key_nis = severity.key_nis
where nullif(trim(core.i10_pr25), '') is not null
  and core.i10_pr25 <> 'invl'
)
select a. admit_id, a.drg_cd, a.pr_cd, a.pr_index, b.ccsr_cat_cd
from long_pr a
join capstone.pr_to_ccsr_mapping b on 
a.pr_cd = b.pr_cd
)
;

select count(*) from capstone.nis_long_pr;


-------------------------------------------------------------------------
-- Add primary keys / foreign keys
-------------------------------------------------------------------------
-- Primary Keys
ALTER TABLE capstone.nis_core DROP CONSTRAINT IF EXISTS pk_nis_core CASCADE;
ALTER TABLE capstone.nis_core
ADD CONSTRAINT pk_nis_core
PRIMARY KEY (admit_id);

ALTER TABLE capstone.nis_comorbidities DROP CONSTRAINT IF EXISTS pk_cmr cascade;
alter table capstone.nis_comorbidities
add constraint pk_cmr
primary key (admit_id);

alter table capstone.dim_serviceline drop constraint if exists pk_svcline cascade;
alter table capstone.dim_serviceline
add constraint pk_svcline
primary key (serviceline_cd);

alter table capstone.dim_discharge_dest drop constraint if exists pk_dischg_dest cascade;
alter table capstone.dim_discharge_dest add constraint pk_dischg_dest
primary key (discharge_dest_cd);

alter table capstone.dim_month drop constraint if exists pk_month cascade;
alter table capstone.dim_month add constraint pk_month
primary key (month_no);

alter table capstone.dim_hosp_bedsize drop constraint if exists pk_bedsize cascade;
alter table capstone.dim_hosp_bedsize add constraint pk_bedsize
primary key (hosp_bedsize_cd);

alter table capstone.dim_hosp_teach drop constraint if exists pk_teach cascade;
alter table capstone.dim_hosp_teach add constraint pk_teach
primary key (hosp_teach_cd);

alter table capstone.dim_soi_score drop constraint if exists pk_soi cascade;
alter table capstone.dim_soi_score add constraint pk_soi
primary key (soi_score);

alter table capstone.dim_rom_score drop constraint if exists pk_rom cascade;
alter table capstone.dim_rom_score add constraint pk_rom
primary key (rom_score);

alter table capstone.dim_drg drop constraint if exists pk_drg cascade;
alter table capstone.dim_drg add constraint pk_drg
primary key (drg_cd);

alter table capstone.pr_to_ccsr_mapping drop constraint if exists pk_pr_cd cascade;
alter table capstone.pr_to_ccsr_mapping add constraint pk_pr_cd
primary key (pr_cd);

-- Foreign Keys
alter table capstone.nis_core drop constraint if exists fk_svcline cascade;
alter table capstone.nis_core add constraint fk_svcline 
foreign key (serviceline_cd) references capstone.dim_serviceline(serviceline_cd);

alter table capstone.nis_core drop constraint if exists fk_discharge_dest cascade;
alter table capstone.nis_core add constraint fk_discharge_dest
foreign key (discharge_dest_cd) references capstone.dim_discharge_dest(discharge_dest_cd);

alter table capstone.nis_core drop constraint if exists fk_bedsize_cd cascade;
alter table capstone.nis_core add constraint fk_bedsize_cd
foreign key (hosp_bedsize_cd) references capstone.dim_hosp_bedsize(hosp_bedsize_cd);

alter table capstone.nis_core drop constraint if exists fk_teach_cd cascade;
alter table capstone.nis_core add constraint fk_teach_cd
foreign key (hosp_teach_cd) references capstone.dim_hosp_teach(hosp_teach_cd);

alter table capstone.nis_core drop constraint if exists fk_soi cascade;
alter table capstone.nis_core add constraint fk_soi
foreign key (soi_score) references capstone.dim_soi_score (soi_score);

alter table capstone.nis_core drop constraint if exists fk_rom cascade;
alter table capstone.nis_core add constraint fk_rom
foreign key (rom_score) references capstone.dim_rom_score (rom_score);

alter table capstone.nis_core drop constraint if exists fk_drg cascade;
alter table capstone.nis_core add constraint fk_drg 
foreign key (drg_cd) references capstone.dim_drg(drg_cd);

alter table capstone.nis_core drop constraint if exists fk_month cascade;
alter table capstone.nis_core add constraint fk_month
foreign key (admit_month_no) references capstone.dim_month(month_no);


-------------------------------------------------------------------------
-- MIMIC Data
-------------------------------------------------------------------------
drop table if exists capstone.mimic_core cascade;
create table if not exists capstone.mimic_core as (
select 
a.hadm_id as admit_id,
a.subject_id as patient_id,
p.anchor_age as age,
a.hospital_expire_flag as died_ind,
a.discharge_location as discharge_dest,
p.gender,
ROUND(
    EXTRACT(EPOCH FROM (a.dischtime - a.admittime)) / 86400
  	) AS length_of_stay,
a.insurance as payer_nm,
drg.drg_code as drg_cd,
drg.drg_mortality as rom_score,
drg.drg_severity as soi_score
from
mimiciv_hosp.admissions a
join mimiciv_hosp.patients p
	on a.subject_id = p.subject_id
join mimiciv_hosp.drgcodes drg
	on a.subject_id = drg.subject_id
	and a.hadm_id = drg.hadm_id
where drg.drg_type='APR'
)
;
select count(*) from capstone.mimic_core;
--366,931

ALTER TABLE capstone.mimic_core DROP CONSTRAINT IF EXISTS pk_mimic_core CASCADE;
ALTER TABLE capstone.mimic_core
ADD CONSTRAINT pk_mimic_core
PRIMARY KEY (admit_id);

alter table capstone.mimic_core drop constraint if exists fk_drg cascade;
alter table capstone.mimic_core add constraint fk_drg 
foreign key (drg_cd) references capstone.dim_drg(drg_cd);

DROP TABLE IF EXISTS capstone.mimic_dx_pr_array CASCADE;
CREATE TABLE IF NOT EXISTS capstone.mimic_dx_pr_array 
as (
WITH
diagnoses_icd as (
	select distinct hadm_id as admit_id, trim(icd_code) as icd_code, seq_num from
	mimiciv_hosp.diagnoses_icd 
	order by seq_num),
procedures_icd as (
	select distinct hadm_id as admit_id, trim(icd_code) as icd_code, seq_num from
	mimiciv_hosp.procedures_icd
	order by seq_num),
dx_array as (
	select admit_id,
	ARRAY_AGG(icd_code ORDER BY seq_num ) AS dx_codes
	from diagnoses_icd group by admit_id),
pr_array as (
	select admit_id, ARRAY_AGG(icd_code ORDER BY seq_num ) AS pr_codes
	from procedures_icd group by admit_id)
SELECT
    core.admit_id,
    core.patient_id,
	core.drg_cd,
	core.rom_score,
	core.soi_score,
    -- all diagnoses for this admission
	dx.dx_codes as dx_codes_array,
	-- all procedures for this admission
	pr.pr_codes as pr_codes_array
FROM capstone.mimic_core core
JOIN dx_array dx on core.admit_id = dx.admit_id
JOIN pr_array pr on core.admit_id = pr.admit_id
)
;
select count(*) from capstone.mimic_dx_pr_array;


drop table if exists capstone.mimic_long_dx cascade;
create table if not exists capstone.mimic_long_dx as (
with core_dx as (
select core.admit_id, core.patient_id, trim(dx.icd_code) as dx_cd, dx.seq_num as dx_index, dx.icd_version
from capstone.mimic_core core
join mimiciv_hosp.diagnoses_icd dx
on core.admit_id = dx.hadm_id
and core.patient_id = dx.subject_id
)
select dx.admit_id, dx.dx_cd, dx.dx_index, dx.icd_version
,m.ccsr_cat_cd
from core_dx dx
join capstone.dx_to_ccsr_mapping m
on dx.dx_cd=m.dx_cd
);

drop table if exists capstone.mimic_long_pr cascade;
create table if not exists capstone.mimic_long_pr as (
with core_pr as (
select core.admit_id, core.patient_id, trim(pr.icd_code) as pr_cd, pr.seq_num as pr_index,
pr.icd_version
from capstone.mimic_core core
join mimiciv_hosp.procedures_icd pr
on core.admit_id=pr.hadm_id and core.patient_id=pr.subject_id
)
select p.admit_id, p.pr_cd, p.pr_index, p.icd_version
,m.ccsr_cat_cd
from core_pr p
join capstone.pr_to_ccsr_mapping m
on p.pr_cd = m.pr_cd
)
;