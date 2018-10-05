-- noteevents PTSD
SELECT subject_id,noteevents.text 
FROM noteevents 
where LOWER(noteevents.text) LIKE '%ptsd%' 
and NOT LOWER(noteevents.text) LIKE '%anxiety%' 
limit 20
