DROP SCHEMA IF EXISTS mimiciv_hosp CASCADE;
CREATE SCHEMA mimiciv_hosp;
SET search_path TO mimiciv_hosp;

DROP TABLE IF EXISTS mimiciv_hosp.admissions;
CREATE TABLE mimiciv_hosp.admissions
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  admittime TIMESTAMP NOT NULL,
  dischtime TIMESTAMP,
  deathtime TIMESTAMP,
  admission_type VARCHAR(40) NOT NULL,
  admit_provider_id VARCHAR(10),
  admission_location VARCHAR(60),
  discharge_location VARCHAR(60),
  insurance VARCHAR(255),
  language VARCHAR(25),
  marital_status VARCHAR(30),
  race VARCHAR(80),
  edregtime TIMESTAMP,
  edouttime TIMESTAMP,
  hospital_expire_flag SMALLINT
);

DROP TABLE IF EXISTS mimiciv_hosp.d_hcpcs;
CREATE TABLE mimiciv_hosp.d_hcpcs
(
  code CHAR(5) NOT NULL,
  category SMALLINT,
  long_description TEXT,
  short_description VARCHAR(180)
);

DROP TABLE IF EXISTS mimiciv_hosp.diagnoses_icd;
CREATE TABLE mimiciv_hosp.diagnoses_icd
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  seq_num INTEGER NOT NULL,
  icd_code CHAR(7),
  icd_version SMALLINT
);

DROP TABLE IF EXISTS mimiciv_hosp.d_icd_diagnoses;
CREATE TABLE mimiciv_hosp.d_icd_diagnoses
(
  icd_code CHAR(7) NOT NULL,
  icd_version SMALLINT NOT NULL,
  long_title VARCHAR(255)
);

DROP TABLE IF EXISTS mimiciv_hosp.d_icd_procedures;
CREATE TABLE mimiciv_hosp.d_icd_procedures
(
  icd_code CHAR(7) NOT NULL,
  icd_version SMALLINT NOT NULL,
  long_title VARCHAR(222)
);


DROP TABLE IF EXISTS mimiciv_hosp.drgcodes;
CREATE TABLE mimiciv_hosp.drgcodes
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  drg_type VARCHAR(4),
  drg_code VARCHAR(10) NOT NULL,
  description VARCHAR(195),
  drg_severity SMALLINT,
  drg_mortality SMALLINT
);

DROP TABLE IF EXISTS mimiciv_hosp.hcpcsevents;
CREATE TABLE mimiciv_hosp.hcpcsevents
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  chartdate DATE,
  hcpcs_cd CHAR(5) NOT NULL,
  seq_num INTEGER NOT NULL,
  short_description VARCHAR(180)
);

DROP TABLE IF EXISTS mimiciv_hosp.patients;
CREATE TABLE mimiciv_hosp.patients
(
  subject_id INTEGER NOT NULL,
  gender CHAR(1) NOT NULL,
  anchor_age SMALLINT,
  anchor_year SMALLINT NOT NULL,
  anchor_year_group VARCHAR(20) NOT NULL,
  dod DATE
);

DROP TABLE IF EXISTS mimiciv_hosp.procedures_icd;
CREATE TABLE mimiciv_hosp.procedures_icd
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  seq_num INTEGER NOT NULL,
  chartdate DATE NOT NULL,
  icd_code VARCHAR(7),
  icd_version SMALLINT
);

DROP TABLE IF EXISTS mimiciv_hosp.services;
CREATE TABLE mimiciv_hosp.services
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  transfertime TIMESTAMP NOT NULL,
  prev_service VARCHAR(10),
  curr_service VARCHAR(10)
);

----Comments

COMMENT ON TABLE mimiciv_hosp.procedures_icd IS
   'Procedures relating to a hospital admission coded using the ICD system.';
-- Columns
COMMENT ON COLUMN mimiciv_hosp.procedures_icd.SUBJECT_ID is
   'Foreign key. Identifies the patient.';
COMMENT ON COLUMN mimiciv_hosp.procedures_icd.HADM_ID is
   'Foreign key. Identifies the hospital stay.';
COMMENT ON COLUMN mimiciv_hosp.procedures_icd.SEQ_NUM is
   'Lower procedure numbers occurred earlier.';
COMMENT ON COLUMN mimiciv_hosp.procedures_icd.ICD_CODE is
   'ICD code associated with the procedure.';



COMMENT ON TABLE mimiciv_hosp.patients IS
   'Patients associated with an admission to the hospital.';
-- Columns
COMMENT ON COLUMN mimiciv_hosp.patients.SUBJECT_ID is
   'Primary key. Identifies the patient.';
COMMENT ON COLUMN mimiciv_hosp.patients.GENDER is
   'Gender.';
COMMENT ON COLUMN mimiciv_hosp.patients.DOD is
   'Date of death. Null if the patient was alive at least 90 days post-hospital discharge.';


 
COMMENT ON TABLE mimiciv_hosp.drg_codes IS
   'Hospital stays classified using the Diagnosis-Related Group system.';
-- Columns
COMMENT ON COLUMN mimiciv_hosp.drg_codes.SUBJECT_ID is
   'Foreign key. Identifies the patient.';
COMMENT ON COLUMN mimiciv_hosp.drg_codes.HADM_ID is
   'Foreign key. Identifies the hospital stay.';
COMMENT ON COLUMN mimiciv_hosp.drg_codes.DRG_TYPE is
   'Type of Diagnosis-Related Group, for example APR is All Patient Refined';
COMMENT ON COLUMN mimiciv_hosp.drg_codes.DRG_CODE is
   'Diagnosis-Related Group code';
COMMENT ON COLUMN mimiciv_hosp.drg_codes.DESCRIPTION is
   'Description of the Diagnosis-Related Group';
COMMENT ON COLUMN mimiciv_hosp.drg_codes.DRG_SEVERITY is
   'Relative severity, available for type APR only.';
COMMENT ON COLUMN mimiciv_hosp.drg_codes.DRG_MORTALITY is
   'Relative mortality, available for type APR only.';


COMMENT ON TABLE mimiciv_hosp.diagnoses_icd IS
   'Diagnoses relating to a hospital admission coded using the ICD system.';
-- Columns
COMMENT ON COLUMN mimiciv_hosp.diagnoses_icd.SUBJECT_ID is
   'Foreign key. Identifies the patient.';
COMMENT ON COLUMN mimiciv_hosp.diagnoses_icd.HADM_ID is
   'Foreign key. Identifies the hospital stay.';
COMMENT ON COLUMN mimiciv_hosp.diagnoses_icd.SEQ_NUM is
   'Priority of the code. Sequence 1 is the primary code.';
COMMENT ON COLUMN mimiciv_hosp.diagnoses_icd.ICD_CODE is
   'ICD code for the diagnosis.';


COMMENT ON TABLE mimiciv_hosp.d_icd_procedures  IS
   'Dictionary of the International Classification of Diseases (Procedures).';
-- Columns
COMMENT ON COLUMN mimiciv_hosp.d_icd_procedures.ICD_CODE is
   'ICD code - note that this is a fixed length character field, as whitespaces are important in uniquely identifying ICD-9 codes.';
COMMENT ON COLUMN mimiciv_hosp.d_icd_procedures.LONG_TITLE is
   'Long title associated with the code.';


COMMENT ON TABLE mimiciv_hosp.d_icd_diagnoses IS
   'Dictionary of the International Classification of Diseases (Diagnoses).';
-- Columns
COMMENT ON COLUMN mimiciv_hosp.d_icd_diagnoses.ICD_CODE is
   'ICD code - note that this is a fixed length character field, as whitespaces are important in uniquely identifying ICD-9 codes.';
COMMENT ON COLUMN mimiciv_hosp.d_icd_diagnoses.LONG_TITLE is
   'Long title associated with the code.';


COMMENT ON TABLE mimiciv_hosp.admissions IS
   'Hospital admissions associated with a hospital admission.';
-- Columns
COMMENT ON COLUMN mimiciv_hosp.admissions.SUBJECT_ID is
   'Foreign key. Identifies the patient.';
COMMENT ON COLUMN mimiciv_hosp.admissions.HADM_ID is
   'Primary key. Identifies the hospital stay.';
COMMENT ON COLUMN mimiciv_hosp.admissions.ADMITTIME is
   'Time of admission to the hospital.';
COMMENT ON COLUMN mimiciv_hosp.admissions.DISCHTIME is
   'Time of discharge from the hospital.';
COMMENT ON COLUMN mimiciv_hosp.admissions.DEATHTIME is
   'Time of death.';
COMMENT ON COLUMN mimiciv_hosp.admissions.ADMISSION_TYPE is
   'Type of admission, for example emergency or elective.';
COMMENT ON COLUMN mimiciv_hosp.admissions.ADMISSION_LOCATION is
   'Admission location.';
COMMENT ON COLUMN mimiciv_hosp.admissions.DISCHARGE_LOCATION is
   'Discharge location';
COMMENT ON COLUMN mimiciv_hosp.admissions.INSURANCE is
   'Insurance type.';
COMMENT ON COLUMN mimiciv_hosp.admissions.LANGUAGE is
   'Language.';
COMMENT ON COLUMN mimiciv_hosp.admissions.MARITAL_STATUS is
   'Marital status.';


-- Primary Keys

-- admissions
ALTER TABLE mimiciv_hosp.admissions DROP CONSTRAINT IF EXISTS admissions_pk CASCADE;
ALTER TABLE mimiciv_hosp.admissions
ADD CONSTRAINT admissions_pk
  PRIMARY KEY (hadm_id);

-- d_hcpcs
ALTER TABLE mimiciv_hosp.d_hcpcs DROP CONSTRAINT IF EXISTS d_hcpcs_pk CASCADE;
ALTER TABLE mimiciv_hosp.d_hcpcs
ADD CONSTRAINT d_hcpcs_pk
  PRIMARY KEY (code);

-- diagnoses_icd
ALTER TABLE mimiciv_hosp.diagnoses_icd DROP CONSTRAINT IF EXISTS diagnoses_icd_pk CASCADE;
ALTER TABLE mimiciv_hosp.diagnoses_icd
ADD CONSTRAINT diagnoses_icd_pk
  PRIMARY KEY (hadm_id, seq_num, icd_code, icd_version);

-- d_icd_diagnoses
ALTER TABLE mimiciv_hosp.d_icd_diagnoses DROP CONSTRAINT IF EXISTS d_icd_diagnoses_pk CASCADE;
ALTER TABLE mimiciv_hosp.d_icd_diagnoses
ADD CONSTRAINT d_icd_diagnoses_pk
  PRIMARY KEY (icd_code, icd_version);

-- d_icd_procedures
ALTER TABLE mimiciv_hosp.d_icd_procedures DROP CONSTRAINT IF EXISTS d_icd_procedures_pk CASCADE;
ALTER TABLE mimiciv_hosp.d_icd_procedures
ADD CONSTRAINT d_icd_procedures_pk
  PRIMARY KEY (icd_code, icd_version);

-- hcpcsevents
ALTER TABLE mimiciv_hosp.hcpcsevents DROP CONSTRAINT IF EXISTS hcpcsevents_pk CASCADE;
ALTER TABLE mimiciv_hosp.hcpcsevents
ADD CONSTRAINT hcpcsevents_pk
  PRIMARY KEY (hadm_id, hcpcs_cd, seq_num);

-- patients
ALTER TABLE mimiciv_hosp.patients DROP CONSTRAINT IF EXISTS patients_pk CASCADE;
ALTER TABLE mimiciv_hosp.patients
ADD CONSTRAINT patients_pk
  PRIMARY KEY (subject_id);

-- procedures_icd

ALTER TABLE mimiciv_hosp.procedures_icd DROP CONSTRAINT IF EXISTS procedures_icd_pk CASCADE;
ALTER TABLE mimiciv_hosp.procedures_icd
ADD CONSTRAINT procedures_icd_pk
  PRIMARY KEY (hadm_id, seq_num, icd_code, icd_version);

-- services
ALTER TABLE mimiciv_hosp.services DROP CONSTRAINT IF EXISTS services_pk CASCADE;
ALTER TABLE mimiciv_hosp.services
ADD CONSTRAINT services_pk
  PRIMARY KEY (hadm_id, transfertime, curr_service);


-- Foreign Keys 
-- admissions
ALTER TABLE mimiciv_hosp.admissions DROP CONSTRAINT IF EXISTS admissions_patients_fk;
ALTER TABLE mimiciv_hosp.admissions
ADD CONSTRAINT admissions_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);

-- diagnoses_icd
ALTER TABLE mimiciv_hosp.diagnoses_icd DROP CONSTRAINT IF EXISTS diagnoses_icd_patients_fk;
ALTER TABLE mimiciv_hosp.diagnoses_icd
ADD CONSTRAINT diagnoses_icd_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);

ALTER TABLE mimiciv_hosp.diagnoses_icd DROP CONSTRAINT IF EXISTS diagnoses_icd_admissions_fk;
ALTER TABLE mimiciv_hosp.diagnoses_icd
ADD CONSTRAINT diagnoses_icd_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES mimiciv_hosp.admissions (hadm_id);

-- drgcodes
ALTER TABLE mimiciv_hosp.drgcodes DROP CONSTRAINT IF EXISTS drgcodes_patients_fk;
ALTER TABLE mimiciv_hosp.drgcodes
ADD CONSTRAINT drgcodes_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);

ALTER TABLE mimiciv_hosp.drgcodes DROP CONSTRAINT IF EXISTS drgcodes_admissions_fk;
ALTER TABLE mimiciv_hosp.drgcodes
ADD CONSTRAINT drgcodes_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES mimiciv_hosp.admissions (hadm_id);


-- hcpcsevents
ALTER TABLE mimiciv_hosp.hcpcsevents DROP CONSTRAINT IF EXISTS hcpcsevents_patients_fk;
ALTER TABLE mimiciv_hosp.hcpcsevents
ADD CONSTRAINT hcpcsevents_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);

ALTER TABLE mimiciv_hosp.hcpcsevents DROP CONSTRAINT IF EXISTS hcpcsevents_admissions_fk;
ALTER TABLE mimiciv_hosp.hcpcsevents
ADD CONSTRAINT hcpcsevents_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES mimiciv_hosp.admissions (hadm_id);

ALTER TABLE mimiciv_hosp.hcpcsevents DROP CONSTRAINT IF EXISTS hcpcsevents_d_hcpcs_fk;
ALTER TABLE mimiciv_hosp.hcpcsevents
ADD CONSTRAINT hcpcsevents_d_hcpcs_fk
  FOREIGN KEY (hcpcs_cd)
  REFERENCES mimiciv_hosp.d_hcpcs (code);

-- procedures_icd
ALTER TABLE mimiciv_hosp.procedures_icd DROP CONSTRAINT IF EXISTS procedures_icd_patients_fk;
ALTER TABLE mimiciv_hosp.procedures_icd
ADD CONSTRAINT procedures_icd_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);

ALTER TABLE mimiciv_hosp.procedures_icd DROP CONSTRAINT IF EXISTS procedures_icd_admissions_fk;
ALTER TABLE mimiciv_hosp.procedures_icd
ADD CONSTRAINT procedures_icd_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES mimiciv_hosp.admissions (hadm_id);

-- services
ALTER TABLE mimiciv_hosp.services DROP CONSTRAINT IF EXISTS services_patients_fk;
ALTER TABLE mimiciv_hosp.services
ADD CONSTRAINT services_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);

ALTER TABLE mimiciv_hosp.services DROP CONSTRAINT IF EXISTS services_admissions_fk;
ALTER TABLE mimiciv_hosp.services
ADD CONSTRAINT services_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES mimiciv_hosp.admissions (hadm_id);

--Indexes
-- admissions
DROP INDEX IF EXISTS admissions_idx01;
CREATE INDEX admissions_idx01
  ON admissions (admittime, dischtime, deathtime);

-- d_icd_diagnoses
DROP INDEX IF EXISTS D_ICD_DIAG_idx02;
CREATE INDEX D_ICD_DIAG_idx02
  ON D_ICD_DIAGNOSES (LONG_TITLE);

-- D_ICD_PROCEDURES
DROP INDEX IF EXISTS D_ICD_PROC_idx02;
CREATE INDEX D_ICD_PROC_idx02
  ON D_ICD_PROCEDURES (LONG_TITLE);

-- drgcodes
DROP INDEX IF EXISTS drgcodes_idx01;
CREATE INDEX drgcodes_idx01
  ON drgcodes (drg_code, drg_type);

DROP INDEX IF EXISTS drgcodes_idx02;
CREATE INDEX drgcodes_idx02
  ON drgcodes (description, drg_severity);

-- HCPCSEVENTS
DROP INDEX IF EXISTS HCPCSEVENTS_idx04;
CREATE INDEX HCPCSEVENTS_idx04
  ON HCPCSEVENTS (SHORT_DESCRIPTION);

-- patients
DROP INDEX IF EXISTS patients_idx01;
CREATE INDEX patients_idx01
  ON patients (anchor_age);

DROP INDEX IF EXISTS patients_idx02;
CREATE INDEX patients_idx02
  ON patients (anchor_year);  