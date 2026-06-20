--MIMIC Discovery and Analysis

set search_path = mimiciv_hosp;

select distinct admission_type from mimiciv_hosp.admissions;
/*
"AMBULATORY OBSERVATION"
"DIRECT EMER."
"DIRECT OBSERVATION"
"ELECTIVE"
"EU OBSERVATION"
"EW EMER."
"OBSERVATION ADMIT"
"SURGICAL SAME DAY ADMISSION"
"URGENT"
*/

select distinct discharge_location from admissions;
/* some values in common with the NIS dataset
"ACUTE HOSPITAL"
"AGAINST ADVICE"
"ASSISTED LIVING"
"CHRONIC/LONG TERM ACUTE CARE"
"DIED"
"HEALTHCARE FACILITY"
"HOME"
"HOME HEALTH CARE"
"HOSPICE"
"OTHER FACILITY"
"PSYCH FACILITY"
"REHAB"
"SKILLED NURSING FACILITY"
*/

select distinct insurance from admissions;
/* looks to be the same values as NIS - payer
"Medicaid"
"Medicare"
"No charge"
"Other"
"Private"
*/

select distinct marital_status from admissions;
/*
"DIVORCED"
"MARRIED"
"SINGLE"
"WIDOWED"
*/

select distinct race from admissions;
/*
"AMERICAN INDIAN/ALASKA NATIVE"
"ASIAN"
"ASIAN - ASIAN INDIAN"
"ASIAN - CHINESE"
"ASIAN - KOREAN"
"ASIAN - SOUTH EAST ASIAN"
"BLACK/AFRICAN"
"BLACK/AFRICAN AMERICAN"
"BLACK/CAPE VERDEAN"
"BLACK/CARIBBEAN ISLAND"
"HISPANIC OR LATINO"
"HISPANIC/LATINO - CENTRAL AMERICAN"
"HISPANIC/LATINO - COLUMBIAN"
"HISPANIC/LATINO - CUBAN"
"HISPANIC/LATINO - DOMINICAN"
"HISPANIC/LATINO - GUATEMALAN"
"HISPANIC/LATINO - HONDURAN"
"HISPANIC/LATINO - MEXICAN"
"HISPANIC/LATINO - PUERTO RICAN"
"HISPANIC/LATINO - SALVADORAN"
"MULTIPLE RACE/ETHNICITY"
"NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER"
"OTHER"
"PATIENT DECLINED TO ANSWER"
"PORTUGUESE"
"SOUTH AMERICAN"
"UNABLE TO OBTAIN"
"UNKNOWN"
"WHITE"
"WHITE - BRAZILIAN"
"WHITE - EASTERN EUROPEAN"
"WHITE - OTHER EUROPEAN"
"WHITE - RUSSIAN"
*/

select distinct language from admissions;
/*
"American Sign Language"
"Amharic"
"Arabic"
"Armenian"
"Bengali"
"Chinese"
"English"
"French"
"Haitian"
"Hindi"
"Italian"
"Japanese"
"Kabuverdianu"
"Khmer"
"Korean"
"Modern Greek (1453-)"
"Other"
"Persian"
"Polish"
"Portuguese"
"Russian"
"Somali"
"Spanish"
"Thai"
"Vietnamese"
*/

--d_hcpcs
--Dimension table for hcpcsevents; provides descriptons of the CPT codes
--Don't think HCPCE does anything for us since NIS does not have it
select distinct category from mimiciv_hosp.d_hcpcs;
--[null, 1,2,3]

select distinct short_description from d_hcpcs;
--very long list


--Patients
select distinct gender from patients;
--[F, M]

select distinct anchor_age from patients order by 1;
--[18-91]

select anchor_year, anchor_age from patients limit 100;

--To calculate length of stay
select subject_id, hadm_id, dischtime, admittime, 
ROUND(
    EXTRACT(EPOCH FROM (dischtime - admittime)) / 86400
  ) AS los,
dischtime - admittime as LOSs
from mimiciv_hosp.admissions limit 20;


----Check for complete population of DRG Codes
--In MIMIC but not in Dim DRG
select distinct drg_code from mimiciv_hosp.drgcodes where drg_type='APR'
except
select drg_cd from cap_analytics.dim_drg;
--None

--In HCUP NIS but not in Dim DRG
select distinct LPAD(aprdrg::text, 3, '0') as drg_code from hcup_nis_2023.severity
except 
select drg_cd from cap_analytics.dim_drg;
--None

