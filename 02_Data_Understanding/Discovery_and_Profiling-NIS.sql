--Discovery / Profiling
SET SEARCH_PATH = hcup_nis_2023;
select count(*) from core;
--6743716
select count(distinct(hosp_nis)) from core;
--4181  this is sampling from 4,181 nationwide hospitals

select count(*) from core where hosp_nis is null;
--0

select count(distinct(key_nis)) from core;
--6743716  We can make this the PK

select distinct age from core;
--[ -99, -66, 0-90]
-- (-99, -66) = missing or invalid

select distinct amonth from core;
--identifies the admission month
--[-9, 1-12]
-- (-9) = missing or invalid

select distinct aweekend from core;
--identifies if the admission was on a weeekend
--[-9, 0,1]   0=Mon-Fri admission 1=Sat-Sun admission
-- (-9) = missing or invalid

select distinct died from core;
--Did the patient die during the stay
--[-9, -8, 0, 1]
-- (-9) = missing or invalid

select count(*) from core where discwt is null;
--This is the discharge level weight; we need to multiply the
--charge by this weight in order to compare costs nationwide
--0
select min(discwt), max(discwt) from core;
/* DISCWT scales each sampled discharge up so that 
summing across all records yields an estimate of all 
U.S. inpatient discharges for that year.
--[ 4.98 - 5.00]
*/

select distinct dispuniform from core;
--Discharge destination
--[-9, -8, 1-7, 20, 99]
-- (-9 ,-8) = missing or invalid

select distinct DRGVER from core;
--[ 40, 41]

select distinct elective from core;
--elective or non-elective admission
--[ -9, -8, 0,1]
-- 0 = Non-elective; 1 = elective, (-9, -8) = missing or invalid

select distinct female from core;
--Patient is female or not
-- [-9, -8, 0, 1]
-- 0 = Male, 1=Female (-9, -8)=missing or invalid

select distinct hcup_ed from core;
--if the admission came through the emergency department.
--This could be interesting to include
--[0-4]
-- 0 = Not thru ED; 1,2,3,4 Did come thru Ed

select distinct i10_ndx from core;
--total number of Diagnosis codes on this record
--[0-40]

select distinct i10_npr from core;
--total number of procedure codes on this record
--[0-25]

select distinct i10_serviceline from core;
--[1-5]
/* All discharges are categorized into five hospitalization 
types (i.e., service lines) in the following hierarchical order: 
1 = maternal/neonatal 
2 = mental health/substance abuse
3 = injury
4 = surgical
5 = medical
*/

select distinct los from core;
--Length of Stay in Days
--0 = admitted and discharged same day
--[-9999, -8888, -6666, 0-365]
--(-9999, -8888, -6666) = missing or invalid

select count(*) from core where totchg_2023 is null;
--Total charge for the stay
--0
select min(totchg_2023), max(totchg_2023) from core;
--[-999999999 - 11,278,286  wow!  $11.3M ]

select min(totchg_2023), max(totchg_2023) from core where totchg_2023 >0;
--[103 - 11,278,286 ]

/*  start to build the where clause
age not in (-99,-66)
amonth <> -9
aweekend <> -9
died not in (-9,-8)
dispuniform not in (-9,-8)
elective not in (-9,-8)
i10_ndx > 0
i10_npr > 0
los not in (-9999,-8888,-6666)
totchg_2023 >0

*/

--how many records are we removing if we apply the above filters
select count(*) from core;
--6743716

select count(*) from core 
where
age not in (-99,-66)				--excludes 621 records
and amonth <> -9 					--excludes 11,528 records
and aweekend <> -9  				--excludes 33 records
and died not in (-9,-8)				--excludes 2188 records
and dispuniform not in (-9,-8) 		--excludes 2188 records (Died is derived from the value)
and elective not in (-9,-8)			--excludes 12,403 records
and i10_ndx > 0						--excludes 1194 records
--and i10_npr > 0						--excludes 2,537,908 -- We don't want to keep this; I think a diagnosis without a procedure is valid and informative
and los not in (-9999,-8888,-6666) 	--excludes 2152 records
and totchg_2023 >0					--excludes 43595 records
;
--6672346
--We would exclude only 71,370 records if we keep all of these filters (not including i10_npr; I think that is not a valid filter).
--I'll keep them all there for now (not including i10_npr); if we decide to exclude any of 
--these dimensions from our analysis, we can remove the filter




select count(*) from core where totchg_2023 < 0
;

select distinct hosp_bedsize from hcup_nis_2023.hospital;
--[1,2,3]
-- 1 = Small	2=Medium	3=Large

select distinct hosp_locteach from hcup_nis_2023.hospital;
--[1,2,3]
--1 = Rural (Assumed to be nonteaching) 	2=Urban Nonteaching		3=Urban Teaching

select distinct aprdrg_risk_mortality from hcup_nis_2023.severity;
--Risk of Mortality subclass
--[0,1,2,3,4]
/* 0=No class specified
1 = Minor Likelihood of dying
2= Moderate likelihood of dying
3=Major Likelihood of dying
4=Extreme Likelihood of dying
*/

select distinct aprdrg_severity from hcup_nis_2023.severity;
--Severity of Illness subclass
--[0,1,2,3,4]
/*
0=No Class Specified
1=Minor loss of function
2=Moderate Loss fo Function
3=Major Loss of Function
4=Extreme Loss of Function
*/



select count(*) from hcup_nis_2023.dx_pr_grps;
--6743716
select count(distinct(key_nis)) from hcup_nis_2023.dx_pr_grps;
--6743716

select distinct cmr_version from hcup_nis_2023.dx_pr_grps;
--all 2025.1