select services.subject_id, prev_service, curr_service, procedures_icd.icd9_code
from services
left join procedures_icd on services.subject_id = procedures_icd.subject_id
    where curr_service = 'OBS' OR prev_service = 'OBS' OR procedures_icd.icd9_code in ('630', '631', '632', '633.1', '633.9', '634', '635', '636', '637', '638', '639');