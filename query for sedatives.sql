SELECT 
prescriptions.subject_id,prescriptions.icustay_id,prescriptions.drug_type,prescriptions.drug,prescriptions.drug_name_poe,prescriptions.drug_name_generic, prescriptions.formulary_drug_cd,prescriptions.prod_strength, prescriptions.dose_val_rx,prescriptions.dose_unit_rx, prescriptions.form_val_disp, prescriptions.form_unit_disp,prescriptions.route
FROM  prescriptions
WHERE 
prescriptions.drug = 'gabapentin'
OR
prescriptions.drug = 'pregabalin'
OR
prescriptions.drug = 'diphenhydramine'
OR
prescriptions.drug = 'promenthazine'
OR
prescriptions.drug = 'transdermal scopolamine'
OR
prescriptions.drug = 'dimenhydrinate'
OR
prescriptions.drug = 'prochlorperazine'
OR
prescriptions.drug = 'triazolam'
OR
prescriptions.drug = 'temazepam'
OR
prescriptions.drug = 'lorazepam'
OR
prescriptions.drug = 'diazepam'
OR
prescriptions.drug = 'clonazepam muscle relaxants'
OR
prescriptions.drug = 'cyclobenzaprine'
OR
prescriptions.drug = 'naltrexone'
OR
prescriptions.drug = 'nalmefene'
OR
prescriptions.drug = 'zolpiderm'
OR
prescriptions.drug = 'eszopiclone'
OR
prescriptions.drug = 'ramelteon'
OR
prescriptions.drug = 'amitriptyline'
OR
prescriptions.drug = 'imipramine'
OR
prescriptions.drug = 'doxepin'
OR
prescriptions.drug = 'nortriptyline';
