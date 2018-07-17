Serum sodium < 110 mEq/L or > 170 mEq/L
Serum potassium < 2.0 mEq/L or > 7.0 mEq/L
PaO2 < 50 mm Hg
pH < 7.1 or > 7.7
Serum glucose > 800 mg/dl
Serum calcium > 15 mg/dl
Toxic level of drug or other chemical substance in a hemodynamically or neurologically
compromised patient

SELECT labevents.subject_id, labevents.itemid, labevents.charttime, labevents.value, labevents.valuenum, labevents.valueuom, labevents.flag
FROM labevents
WHERE
