SELECT chartevents.subject_id, chartevents.itemid, chartevents.value, chartevents.charttime, d_items.label, d_items.linksto,patients.dob, patients.gender, admissions.admittime
FROM chartevents
INNER JOIN patients ON chartevents.subject_id = patients.subject_id
INNER JOIN admissions ON chartevents.subject_id = admissions.subject_id
INNER JOIN d_items ON chartevents.itemid = d_items.itemid

WHERE chartevents.itemid IN (
    --candidate data elements for ML
    '223770' --O2 Saturation Pulse oximetry Alarm - LOW
    ,'223769' --O2 Saturation Pulse oximetry Alarm - HIGH
    ,'220210' --respiratory rate
    ,'219' --high resp. rate
    ,'615' --respiratory rate
    ,'618' --resp. rate (total)
    ,'227243' --Manual Blood Pressure Systolic Right
    ,'220047' --Heart Rate Alarm - low
    ,'223762' -- Temperature Celcius 
    ,'220739' -- GCS - eye opening
    ,'223900' -- GCS - motor response
    ,'223901' -- GCS - verbal response
    ,'223752' -- non-invasive blood pressure alarm - LOW
    ,'223751' -- non-invasive blood pressure alarm - HIGH
    ,'225309' -- ART BP Systolic
    ,'220179' -- Noninvasive blood pressure systolic
    ,'227013' -- GCSScore_ApacheIV
    ,'226755' -- GCSApacheIIScore
    ,'223791' -- Base Line Pain Level
    ,'225813' -- Pain Level
    ,'198', -- GCS Total
    --resp rate
    '615','618','220210','224690',
    --glucose
    '807','811','1529','3745','3744','225664','220621','226537',
    --HR
    '211','220045',
    --SysBP
    '51','442','455','6701','220179','220050',
    --DiasBP
    '8368','8440','8441','8555','220180','220051',
    --Temp
    '223761','678','223762','676',
    --Glasgow Coma Scale
    '227013','220739','223900','223901','226755');