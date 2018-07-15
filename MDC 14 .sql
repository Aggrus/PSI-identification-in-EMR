select services.subject_id, prev_service, curr_service, procedures_icd.icd9_code as prodecure_icd, d_icd_procedures.short_title, diagnoses_icd.icd9_code as diagnoses_icd, d_icd_diagnoses.short_title from ((((services
inner join procedures_icd on services.subject_id = procedures_icd.subject_id)
inner join d_icd_procedures on procedures_icd.icd9_code = d_icd_procedures.icd9_code)
inner join diagnoses_icd on services.subject_id = diagnoses_icd.subject_id)
inner join d_icd_diagnoses on diagnoses_icd.icd9_code = d_icd_diagnoses.icd9_code)
where curr_service = 'OBS' or curr_service = 'GYN' or curr_service = 'NB' or curr_service = 'NBB' or curr_service = 'GYN' 
OR prev_service = 'OBS' or prev_service = 'GYN' or prev_service = 'NB' or prev_service = 'NBB' or prev_service = 'GYN';

----------------------------------------------------------------------------------------------------------------------------------


select services.subject_id, prev_service, curr_service, procedures_icd.icd9_code as prodecure_icd, d_icd_procedures.short_title, diagnoses_icd.icd9_code as diagnoses_icd, d_icd_diagnoses.short_title
from (((services
where curr_service = 'OBS' or curr_service = 'GYN' or curr_service = 'NB' or curr_service = 'NBB' or curr_service = 'GYN' 
OR prev_service = 'OBS' or prev_service = 'GYN' or prev_service = 'NB' or prev_service = 'NBB' or prev_service = 'GYN'
full outer join procedures_icd on services.subject_id = procedures_icd.subject_id
    where procedures_icd.icd9_code in ('630', '631', '632', '633.1', '633.9', '634', '635', '636', '637', '638', '639'))
full outer join d_icd_procedures on procedures_icd.icd9_code = d_icd_procedures.icd9_code)
full outer join diagnoses_icd on services.subject_id = diagnoses_icd.subject_id
    where diagnoses_icd.icd9_code in ('630', '631', '632', '633.1', '633.9', '634', '635', '636', '637', '638', '639'))
full outer join d_icd_diagnoses on diagnoses_icd.icd9_code = d_icd_diagnoses.icd9_code);
