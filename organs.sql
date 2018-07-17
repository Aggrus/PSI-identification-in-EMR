--patients that are organs
select admissions.subject_id, admission_type, age( dischtime, admittime), age( deathtime, admittime)--, procedures_icd.icd9_code 
from admissions
--inner join procedures_icd on admissions.subject_id = procedures_icd.subject_id
where age( dischtime, admittime) < interval '1 hour' 
or age( deathtime, admittime) < interval '1 hour';