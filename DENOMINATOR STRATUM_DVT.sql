--code below will pull all patient records (admit time, procedure start time, icd9 code, subject id, diagnoses long_title and short_title, patients dob and dod) that had an operation procedure done
SELECT 
admissions.subject_id,admissions.admittime,procedureevents_mv.starttime,patients.dob,admissions.deathtime,procedures_icd.icd9_code,d_icd_diagnoses.short_title,d_icd_diagnoses.long_title
FROM ((((admissions
INNER JOIN procedureevents_MV ON admissions.subject_id=procedureevents_mv.subject_id)
INNER JOIN procedures_icd ON admissions.subject_id=procedures_icd.subject_id)
INNER JOIN d_icd_diagnoses ON d_icd_diagnoses.icd9_code=procedures_icd.icd9_code)
INNER JOIN patients ON patients.subject_id=admissions.subject_id)
--code below will narrow down results and only show patient information where the procedure start time occurred within two day of the patient admit time
WHERE
DATE_PART('year', procedureevents_mv.starttime::date) - DATE_PART('year',admissions.admittime::date) = 0
AND
DATE_PART('month',procedureevents_mv.starttime::date) - DATE_PART('month',admissions.admittime::date) = 0
AND
DATE_PART('day',procedureevents_mv.starttime::timestamp - admissions.admittime::timestamp) BETWEEN 0 AND 2
--select secondary icd9 diagnoses codes for:
    --deep vein thrombosis or pulmonary embolism
AND
procedures_icd.icd9_code IN ('4151','41511','41513','41519','45111','45119','4512','45181','4519','45340','45341','45342','4538','4539','4820','4821','4822','4823','48230','48231','48232','48239','4824','48240','48241','48242','48249','4828','48281','48282','48283','48284','48289','4829','485','486','5070','514'
    --pneumonia
,'4820','4821','4822','4823','48230','48231','48232','48239','4824','48240','48241','48242','48249','4828','48281','48282','48283','48284','48289','4829','485','486','5070','514'
    --sepsis
,'0380','0381','03810','03811','03812','03819','0382','0383','03840','03841','03842','03843','03844','03849','0388','0389','78552','99591','99592','99802'
    --cardiac arrest
,'4275','63450','63451','63452','63550','63551','63552','63650','63651','63652','63750','63751','63752','6385','6395','66910','66911','66912','66913','66914','7855','78550','78551','78559','7991','9950','9954','9980','99800','99801','99809','9994','99941','99942','99949'
    --gastrointestinal hemorrhage or acute ulcer
,'4560','45620','5307','53082','53100','53101','53110','53111','53120','53121','53130','53131','53190','53191','53200','53201','53210','53211','53220','53221','53230','53231','53290','53291','53300','53301','53310','53311','53320','53321','53330','53331','53390','53391','53400','53401','53410','53411','53420','53421','53430','53431','53490','53491','53501','53511','53521','53531','53541','53551','53561','53783','53784','56202','56203','56212','56213','5693','56985','56986','5780','5781','5789');



