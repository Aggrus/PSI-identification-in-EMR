--need PMR (patient medical? record) 
SELECT 
prescriptions.subject_id,prescriptions.icustay_id,prescriptions.drug_type,prescriptions.drug,prescriptions.drug_name_poe,prescriptions.drug_name_generic, prescriptions.formulary_drug_cd,prescriptions.prod_strength, prescriptions.dose_val_rx,prescriptions.dose_unit_rx, prescriptions.form_val_disp, prescriptions.form_unit_disp,prescriptions.route
FROM  prescriptions
WHERE 
prescriptions.drug = 'codeine'
OR
prescriptions.drug = 'fentanyl'
OR
prescriptions.drug = 'fentanyl citrate'
OR
prescriptions.drug = 'hydrocodone bitartrate'
OR
prescriptions.drug = 'hyrdromorphone'
OR
prescriptions.drug = 'levorphanol'
OR
prescriptions.drug = 'loperamide'
OR
prescriptions.drug = 'meperidine'
OR
prescriptions.drug = 'methadone'
OR
prescriptions.drug = 'morphine'
OR
prescriptions.drug = 'oxycodone'
OR
prescriptions.drug = 'propoxyphene'
OR
prescriptions.drug = 'remifentanil'
OR
prescriptions.drug = 'sufentanil'
OR
prescriptions.drug = 'tramadol'
;
--7 results 