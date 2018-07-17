SELECT chartevents.subject_id, chartevents.itemid, chartevents.value, chartevents.charttime, d_items.label, d_items.linksto,patients.dob, patients.gender, admissions.admittime
FROM chartevents
INNER JOIN patients ON charevents.subject_id = patients.subject_id
INNER JOIN admissions ON chartevents.subject_id = admissions.subject_id
INNER JOIN d_items ON chartevents.itemid = d_items.itemid

WHERE chartevents.itemid IN ('227991','227990','227717','227716','227539','227538','227537','227241','227240','227239','226253','224641','224168','224162','224161','223770','223769','223768','223767','223752','223751','220293','220292','220073','220072','220066','220066','220063','220058','220056','220047','220046')

-----------------------------------------------------------------------
SELECT count(chartevents.itemid) FROM charevents
--GROUP BY (chartevents.item_id)
WHERE chartevents.itemid IN ('227991','227990','227717','227716','227539','227538','227537','227241','227240','227239','226253','224641','224168','224162','224161','223770','223769','223768','223767','223752','223751','220293','220292','220073','220072','220066','220066','220063','220058','220056','220047','220046');
--total count of alarm id codes = 

SELECT count(chartevents.itemid), chartevents.subject_id FROM charevents
GROUP BY (chartevents.subject_id, chartevents.item_id)
WHERE chartevents.itemid IN ('227991','227990','227717','227716','227539','227538','227537','227241','227240','227239','226253','224641','224168','224162','224161','223770','223769','223768','223767','223752','223751','220293','220292','220073','220072','220066','220066','220063','220058','220056','220047','220046');
--query for total count of alarm id codes grouped by patient id

