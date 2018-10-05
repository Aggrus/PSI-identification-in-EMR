-- chartdata xEWS reconstruction 

SELECT chartevents.subject_id ,d_items.itemid, value, gender ,marital_status, ethnicity, label as description, 0 as label 
FROM chartevents INNER JOIN patients ON chartevents.subject_id = patients.subject_id 
INNER JOIN admissions ON chartevents.subject_id = admissions.subject_id 
INNER JOIN d_items ON chartevents.itemid = d_items.itemid 
-- selected patients with PTSD
WHERE chartevents.subject_id in ('26650','28501','27682','26036','29862','28676','29222','31672','30234','30032') 
limit 1000
