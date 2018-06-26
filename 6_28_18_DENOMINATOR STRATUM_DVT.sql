'code below will pull all patient records(admit time, procedure start time, icd9 code, subject id) that had an operation procedure done'
SELECT admissions.admittime,procedureevents_mv.starttime,procedures_icd.icd9_code,admissions.subject_id,procedureevents_mv.subject_id,procedures_icd.subject_id--,diagnoses_icd.subject_id
FROM ((--(admissions
INNER JOIN procedureevents_MV ON admissions.subject_id=procedureevents_mv.subject_id)
INNER JOIN procedures_icd ON admissions.subject_id=procedures_icd.subject_id)
--INNER JOIN diagnoses_icd ON admissions.subject_id=diagnoses_icd.subject_id)
'remove all rows where the starttime occurred after 2 days of the admittime'
WHERE
(DATE_PART('year',procedureevents_mv.starttime::timestamp) - DATE_PART('year',admissions.admittime::timestamp) = 0 AND DATE_PART('month',procedureevents_mv.starttime::timestamp) - DATE_PART('month',admissions.admittime::timestamp) = 0 AND DATE_PART('day', procedureevents_mv.starttime::timestamp - admissions.admittime::timestamp) BETWEEN 0 and 2) ;
'select any secondary icd-9 diagnosis codes for deep vein thrombosis or pulmonary embolism'
--SELECT d_icd_diagnoses.icd_code,d_icd_diagnoses.short_title,d_icd_diagnoses.long_title,diagnoses_icd.icd9_code
--FROM (diagnoses_icd
--INNER JOIN d_icd_diagnoses ON diagnoses_icd.icd9_code=d_icd_diagnoses.icd9_code)
'add inner join to pull d_icd_diagnoses.short_title and d_icd_diagnoses.long_title and connect to each subject_id (might need to add inner join to above clause and add indentations'
--WHERE icd9_code LIKE %deep vein thrombosis% or %pulmonary embolism%;
