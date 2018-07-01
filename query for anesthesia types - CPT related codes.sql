--moderate sedation:
    --79 results
SELECT *
FROM cptevents
WHERE 
(cptevents.cpt_number = '99143' 
OR
cptevents.cpt_number = '99144'
OR 
cptevents.cpt_number = '99145'
OR
cptevents.cpt_number = '99148'
OR
cptevents.cpt_number = '99149'
OR
cptevents.cpt_number = '99150');

--General Anesthesia
    --zero results
SELECT *
FROM cptevents

WHERE 
(cptevents.cpt_number = '00810' 
OR
cptevents.cpt_number = '00670'
);

--cpt codes 00100-01999
    --571 results
SELECT *
FROM cptevents
WHERE 
--head
(cptevents.cpt_number BETWEEN 00100 AND 00222) 
OR
--Knee and popliteal area
(cptevents.cpt_number BETWEEN 01320 AND 01444)
or
--neck
(cptevents.cpt_number BETWEEN 00309 AND 00352)
or
--lower leg, thorax
(cptevents.cpt_number = '00400')
or
--lower leg, thorax
(cptevents.cpt_number BETWEEN 01462 AND 01522)
OR
--lower leg, thorax
(cptevents.cpt_number = '00474')
OR
--shoulder and axilla
(cptevents.cpt_number BETWEEN 01610 AND 01682)
OR
--intrathoracic
(cptevents.cpt_number BETWEEN 00500 AND 00580)
OR
--upper arm and elbow
(cptevents.cpt_number BETWEEN 01710 AND 01782)
OR 
--spine and spinal cord
(cptevents.cpt_number BETWEEN 00600 AND 00670)
OR 
--forearm, wrist and hand
(cptevents.cpt_number = '01810')
OR
--upper abdomen
(cptevents.cpt_number BETWEEN 00700 AND 00797)
OR 
--upper abdomen
(cptevents.cpt_number = '01860')
OR
--lower abdomen
(cptevents.cpt_number BETWEEN 00800 AND 00882)
OR 
--radiological procedure
(cptevents.cpt_number BETWEEN 01916 AND 01936)
OR
--perineum
(cptevents.cpt_number BETWEEN 00902 AND 00952) 
OR
--pelvis (excludes hip)
(cptevents.cpt_number BETWEEN 01112 AND 01190)
OR
--upper (excludes knee)
(cptevents.cpt_number BETWEEN 01200 AND 01274)
OR
--
(cptevents.cpt_number BETWEEN 01951 AND 01953)
OR
--obstetric
(cptevents.cpt_number BETWEEN 01958 AND 01969)
OR
--other procedures
(cptevents.cpt_number BETWEEN 01990 AND 01999)
 