'code below will pull all patient records(admit time, procedure start time, icd9 code, subject id) that had an operation procedure done'
SELECT admissions.admittime,procedureevents_mv.starttime,procedures_icd.icd9_code,admissions.subject_id,procedureevents_mv.subject_id,procedures_icd.subject_id
FROM ((admissions
INNER JOIN procedureevents_MV ON admissions.subject_id=procedureevents_mv.subject_id)
INNER JOIN procedures_icd ON admissions.subject_id=procedures_icd.subject_id); 
'need to write a code that measures the time between the admit time and the procedure start time to simplifiy the list of patients to those who had a procedure within two days of their admit time
in-range/out-range: in range will be admit time + 2 days (this will create a new column with the new time stamps (admit + 2 days), if the start time is after the new column date, it will be out-range'


'change the timestamp format to show only the date NOT the time and the date'
ALTER TABLE admissions
MODIFY COLUMN admittime DATE;

ALTER TABLE procedureevents_mv
MODIFY COLUMN starttime DATE;


ALTER TABLE admissions
ADD admittime_add2 DATE;
ALTER TABLE admissions
ADD admittime_add1 DATE;

'add dates into column admittime_add1 that are 1 day after the admission date'
INSERT INTO admissions(admittime_add1)
VALUES SELECT DATEADD(day,1,admissions.admittime()) FROM admissions;

'add dates into column admittime_add2 that are 2 days after the admission time'
INSERT INTO admissions(admittime_add2)
VALUES SELECT DATEADD(day,2,admissions.admittime()) FROM admissions;

'select the procedure start times that are equal to either column admittime_add1 or admittime_add2'
SELECT procedureevents_mv.starttime,procedureevents_mv.subject_id,admissions.admittime_add2 FROM procedureevents_mv,admissions
WHERE procedureevents_mv.starttime = admissions.admittime_add1 AND procedureevents_mv.starttime = admissions.admittime_add2;

'select any secondary icd-9 diagnosis codes for deep vein thrombosis or pulmonary embolism'
SELECT icd_code
FROM procedures_icd 
WHERE icd9_code LIKE %deep vein thrombosis% or %pulmonary embolism%;

'******did not run this code in the querybuilder yet so it probably has errors*******'