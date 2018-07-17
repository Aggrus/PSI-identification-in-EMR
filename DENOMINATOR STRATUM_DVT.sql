--total # of admissions: 58,976
SELECT admissions.subject_id,admissions.admission_type, admissions.admittime,admissions.dischtime,procedureevents_mv.starttime,patients.dob,admissions.deathtime,procedures_icd.icd9_code,d_icd_diagnoses.short_title,d_icd_diagnoses.long_title, cptevents.cpt_number, prescriptions.drug,prescriptions.ndc
--to find patients who were readmitted after being discharged 
FROM admissions
INNER JOIN procedureevents_MV ON admissions.subject_id=procedureevents_mv.subject_id
INNER JOIN procedures_icd ON admissions.subject_id=procedures_icd.subject_id
INNER JOIN d_icd_diagnoses ON d_icd_diagnoses.icd9_code=procedures_icd.icd9_code
INNER JOIN patients ON patients.subject_id=admissions.subject_id
INNER JOIN cptevents ON cptevents.subject_id=admissions.subject_id
INNER JOIN prescriptions ON prescriptions.subject_id=admissions.subject_id

WHERE 
DATE_PART('year', procedureevents_mv.starttime::date) - DATE_PART('year',admissions.admittime::date) = 0
AND
DATE_PART('month',procedureevents_mv.starttime::date) - DATE_PART('month',admissions.admittime::date) = 0
AND
DATE_PART('day',procedureevents_mv.starttime::timestamp - admissions.admittime::timestamp) BETWEEN 0 AND 2
AND 
DATE_PART('year', admissions.dischtime::date) - DATE_PART('year',admissions.admittime::date) = 0
AND
DATE_PART('month',admissions.dischtime::date) - DATE_PART('month',admissions.admittime::date) = 0
AND
DATE_PART('day',admissions.dischtime::timestamp - admissions.admittime::timestamp) BETWEEN 0 AND 4
--select secondary icd9 diagnoses codes for:
AND 
--total number of patients with an icd 9 diagnoses code = 36140
diagnoses_icd.icd9_code IN (
    --deep vein thrombosis or pulmonary embolism
    --total count = 2276
'4151','41511','41513','41519','45111','45119','4512','45181','4519','45340','45341','45342','4538','4539'
    --pneumonia
    --total count = 11171
,'4820','4821','4822','4823','48230','48231','48232','48239','4824','48240','48241','48242','48249','4828','48281','48282','48283','48284','48289','4829','485','486','5070','514'
    --sepsis
    --total count =14187 
,'0380','0381','03810','03811','03812','03819','0382','0383','03840','03841','03842','03843','03844','03849','0388','0389','78552','99591','99592','99802'
    --cardiac arrest
    --total count = 3582
,'4275','63450','63451','63452','63550','63551','63552','63650','63651','63652','63750','63751','63752','6385','6395','66910','66911','66912','66913','66914','7855','78550','78551','78559','7991','9950','9954','9980','99800','99801','99809','9994','99941','99942','99949'
    --gastrointestinal hemorrhage or acute ulcer
    --total count = 4924
,'4560','45620','5307','53082','53100','53101','53110','53111','53120','53121','53130','53131','53190','53191','53200','53201','53210','53211','53220','53221','53230','53231','53290','53291','53300','53301','53310','53311','53320','53321','53330','53331','53390','53391','53400','53401','53410','53411','53420','53421','53430','53431','53490','53491','53501','53511','53521','53531','53541','53551','53561','53783','53784','56202','56203','56212','56213','5693','56985','56986','5780','5781','5789')

--cpt_number = anesthesia codes 
AND 
--total count of cpt numbers = 79
cptevents.cpt_number IN (
    --local moderate sedation total count = 79
    '99143','99144','99145','99148','99149','99150',
    --local general anesthesia total count = 0
    '00810','00670',
    '00100','00102','00103','00104','00120','00124','00126','00140','00142','00144','00145','00147','00148','00160','00162','00164','00170','00172','00174','00176','00190','00192','00210','00211','00212','00214','00215','00216','00218','00220','00222','01320','01340','01360','01380','01382','01390','01392','01400','01402','01404','01420','01430','01432','01440','01442','01444','00300','00320','00322','00326','00350','00352','00400','01462','01464','01470','01472','01474','01480','01482','01484','01486','01490','01500','01502','01520','01522','00474','01610','01620','01622','01630','01634','01636','01638','01650','01652','01654','01656','01670','01680','01682','00500','00520','00522','00524','00528','00529','00530','00532','00534','00537','00539','00540','00541','00542','00546','00548','00550','00560','00561','00562','00563','00566','00567','00580','01710','01712','01714','01716','01730','01732','01740','01742','01744','01756','01758','01760','01770','01772','01780','01782','00600','00604','00620','00625','00626','00630','00632','00635','00640','00670','01810','00700','00702','00730','00731','00732','00750','00752','00754','00756','00770','00790','00792','00794','00796','00797','01860','00800','00802','00811','00812','00813','00820','00830','00832','00834','00836','00840','00842','00844','00846','00848','00851','00860','00862','00864','00865','00866','00868','00870','00872','00873','00880','00882','01916','01920','01922','01924','01925','01926','01930','01931','01932','01933','01935','01936','00902','00904','00906','00908','00910','00912','00914','00916','00918','00920','00921','00922','00924','00926','00928','00930','00932','00934','00936','00938','00940','00942','00948','00950','00952','01112','01120','01130','01140','01150','01160','01170','01173','01180','01190','01200','01202','01210','01212','01214','01215','01220','01230','01232','01234','01250','01260','01270','01272','01274')
AND
--opiods and sedatives NEED NDC #'s
--prescriptions.drug IN ('gabapentin','pregabalin','diphenhydramine','diphenhydramine','promenthazine','transdermal scopolamine','dimenhydrinate','prochlorperazine','triazolam','temazepam','lorazepam','diazepam','clonazepam muscle relaxants','cyclobenzaprine','naltrexone','nalmefne','zolpidem','eszopiclone','ramelteon','amitriptyline','imipramine','doxepin','nortiptyline','codeine','fentanyl','fentanyl citrate','hydrocodone bitartrate','hydromorphone','levorphanol','loperamide','meperidine','methadone','morphine','oxycodone','propoxyphene','remifentanil','sufentanil','tramadol')

--selecting patients who have multiple admission dates 
AND (admissions.subject_id) IN
(SELECT admissions.subject_id FROM admissions 
GROUP BY admissions.subject_id HAVING COUNT(*) > 1
) 
--patient 76174 was discharged and readmitted within 30 days

