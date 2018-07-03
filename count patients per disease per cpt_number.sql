--count patients who have the same disease, used anethesia, and who did not die
--to count patients who did die, change hospital_expire_flag to 1
SELECT 
count(admissions.hospital_expire_flag), admissions.diagnosis, cptevents.cpt_number 
FROM admissions, cptevents 
WHERE 
cptevents.cpt_number = '99143' 
OR
cptevents.cpt_number = '99144'
OR 
cptevents.cpt_number = '99145'
OR
cptevents.cpt_number = '99148'
OR
cptevents.cpt_number = '99149'
OR
cptevents.cpt_number = '99150'
OR
cptevents.cpt_number = '00810' 
OR
cptevents.cpt_number = '00670'
OR 
cptevents.cpt_number BETWEEN 00100 AND 00222 
OR
cptevents.cpt_number BETWEEN 01320 AND 01444
OR
cptevents.cpt_number BETWEEN 00309 AND 00352
OR
cptevents.cpt_number = '00400'
OR
cptevents.cpt_number BETWEEN 01462 AND 01522
OR
cptevents.cpt_number = '00474'
OR
cptevents.cpt_number BETWEEN 01610 AND 01682
OR
cptevents.cpt_number BETWEEN 00500 AND 00580
OR
cptevents.cpt_number BETWEEN 01710 AND 01782
OR
cptevents.cpt_number BETWEEN 00600 AND 00670
OR
cptevents.cpt_number = '01810'
OR
cptevents.cpt_number BETWEEN 00700 AND 00797
OR
cptevents.cpt_number = '01860'
OR
cptevents.cpt_number BETWEEN 00800 AND 00882
OR
cptevents.cpt_number BETWEEN 01916 AND 01936
OR
cptevents.cpt_number BETWEEN 00902 AND 00952
OR
cptevents.cpt_number BETWEEN 01112 AND 01190
OR
cptevents.cpt_number BETWEEN 01200 AND 01274
GROUP BY  admissions.diagnosis, admissions.hospital_expire_flag, cptevents.cpt_number
HAVING admissions.hospital_expire_flag = 0
ORDER BY count(admissions.hospital_expire_flag) DESC;
--newborn is the leading diagnosis with cpt_number 99144 and count 434616


-----------------------------------------------------
--when having statement is admissions.hospital_expire_flag = 1; sepsis is the highest diagnosed disease with cpt_number 99144 and a count of 14952
HAVING admissions.hospital_expire_flag = 1
    --when admissions.hospital_expire_flag = 0; sepsis with cpt_number 99144 has a count of 51352

SELECT 
count(admissions.hospital_expire_flag), admissions.diagnosis, cptevents.cpt_number 
FROM admissions, cptevents 
WHERE 
cptevents.cpt_number = '99144'
AND 
admissions.diagnosis = 'SEPSIS'
GROUP BY  admissions.diagnosis, admissions.hospital_expire_flag, cptevents.cpt_number
HAVING admissions.hospital_expire_flag = 0
ORDER BY count(admissions.hospital_expire_flag) DESC;