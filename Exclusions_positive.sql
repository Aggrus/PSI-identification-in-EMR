--Joins tables
SELECT admissions.subject_id, diagnoses_icd.icd9_code, PATIENTS.gender, admissions.admission_location, admissions.discharge_location 
FROM ((admissions
INNER JOIN PATIENTS  ON admissions.subject_id = PATIENTS.subject_id)
INNER JOIN diagnoses_icd  ON admissions.subject_id = diagnoses_icd.subject_id)
--Checks that all information in the table conforms to the specifications
WHERE (diagnoses_icd.icd9_code IS NOT NULL) 
AND (PATIENTS.gender = 'M' OR PATIENTS.gender = 'F') 
AND (admissions.admission_location = 'TRANSFER FROM HOSP/EXTRAM' OR admissions.admission_location = 'EMERGENCY ROOM ADMIT' OR admissions.admission_location = 'PHYS REFERRAL/NORMAL DELI' OR admissions.admission_location = 'CLINIC REFERRAL/PREMATURE') 
AND (admissions.discharge_location = 'DEAD/EXPIRED' OR admissions.discharge_location = 'HOME' OR admissions.discharge_location = 'HOME HEALTH CARE'); 