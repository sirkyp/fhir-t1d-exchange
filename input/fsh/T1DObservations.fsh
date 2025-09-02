Profile: T1DObservation
Parent: Observation
Id: t1d-observation
Title: "T1D Observation"
Description: "Base observation profile for T1D Exchange data collection"

* identifier MS
* identifier ^definition = "Unique observation ID for each unique patient observation. The observation ID must remain consistent across all files which contain that observation and across all data submissions."
* identifier ^short = "Unique observation ID for each patient observation"
* identifier ^comment = "Priority: High | Notes: If no adequate value is provided by the EMR system then the below method can be used to generated the observation_id. hash( patient_id, effective_date, effective_time (if available), code (LONIC code), value)"

* status 1..1 MS
* status ^definition = "Status of observation"
* status ^short = "Status of observation"
* status ^comment = "Priority: High"

* category 1..* MS
* category ^definition = "Classification of type of observation"
* category ^short = "Classification of type of observation"
* category ^comment = "Priority: High"
* category from T1DObservationCategoryValueSet (extensible)

* code 1..1 MS
* code ^definition = "Type of observation being reported as a valid LOINC code."
* code ^short = "Type of observation as LOINC code"
* code ^comment = "Priority: High | Notes: Refer to Diabetes_Core_Observations sheet in the Diabetes spec for a complete list of labs to include"
* code from T1DObservationCodeValueSet (extensible)

* subject 1..1 MS
* subject ^definition = "Patient identifier that the observation applies to from the patient's file."
* subject ^short = "Patient identifier from patient file"
* subject ^comment = "Priority: High"
* subject only Reference(T1DPatient)

* encounter MS
* encounter ^definition = "Encounter identifier for when the observation was recorded from the encounters file"
* encounter ^short = "Encounter identifier when observation recorded"
* encounter ^comment = "Priority: Low | Notes: Provide when available"
* encounter only Reference(T1DEncounter)

* effective[x] 1..1 MS
* effective[x] ^definition = "Encounter date"
* effective[x] ^short = "Encounter date"
* effective[x] ^comment = "Priority: High"

* performer MS
* performer only Reference(T1DProvider or T1DOrganization)

* value[x] MS
* value[x] ^definition = "value of code"
* value[x] ^short = "value of code"
* value[x] ^comment = "Priority: High"

* interpretation MS
* interpretation ^definition = "Observation interpretation"
* interpretation ^short = "Observation interpretation"
* interpretation ^comment = "Priority: Low"

* referenceRange MS
* referenceRange.low ^definition = "The lower threshold at which the test would be considered 'abnormal'"
* referenceRange.low ^short = "Lower threshold for abnormal test"
* referenceRange.low ^comment = "Priority: Low"
* referenceRange.high ^definition = "The higher threshold at which the test would be considered 'abnormal'"
* referenceRange.high ^short = "Higher threshold for abnormal test"
* referenceRange.high ^comment = "Priority: Low"

Profile: T1DGlucoseObservation
Parent: T1DObservation
Id: t1d-glucose-observation
Title: "T1D Glucose Observation"
Description: "Glucose measurement observation for T1D patients"

* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code from T1DGlucoseCodeValueSet (required)
* value[x] only Quantity
* valueQuantity.unit from T1DGlucoseUnitsValueSet (required)
* valueQuantity.system = "http://unitsofmeasure.org"

* component MS
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component contains
    bgmMean 0..1 MS and
    cgmHighAbove180 0..1 MS and
    timeInRange 0..1 MS

* component[bgmMean] ^definition = "Mean (average) value of blood glucose values reported in mg/dL. When possible, mean value should be based on glucose values used to determine average blood glucose monitoring frequency."
* component[bgmMean] ^short = "Mean blood glucose value"
* component[bgmMean] ^comment = "Priority: Medium | Notes: Round to nearest integer. Do not report mmol/L; to convert, multiply by 18 to convert mmol/L to mg/dL."
* component[bgmMean].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#bgm-mean
* component[bgmMean].value[x] only Quantity
* component[bgmMean].valueQuantity.unit = "mg/dL"

* component[cgmHighAbove180] ^definition = "Percentage of elevated sensor glucose levels. When possible, percentage should be based on glucose values used to determine typical sensor use (frequency or percent time)."
* component[cgmHighAbove180] ^short = "Percentage above 180 mg/dL"
* component[cgmHighAbove180] ^comment = "Priority: High | Notes: Calculate percent of sensor glucose values >180 mg/dL. Round to nearest integer. Range 0-100."
* component[cgmHighAbove180].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#cgm-high-above-180
* component[cgmHighAbove180].value[x] only Quantity
* component[cgmHighAbove180].valueQuantity.unit = "%"

* component[timeInRange] ^definition = "Percentage of glucose levels. When possible, percentage should be based on glucose values used to determine typical sensor use (frequency or percent time)."
* component[timeInRange] ^short = "Percentage in target range"
* component[timeInRange] ^comment = "Priority: High | Notes: Calculate percent of sensor glucose values between 70 mg/dL and 180 mg/dL. Round to nearest integer. Range 0-100."
* component[timeInRange].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#time-in-range
* component[timeInRange].value[x] only Quantity
* component[timeInRange].valueQuantity.unit = "%"

Profile: T1DHbA1cObservation
Parent: T1DObservation
Id: t1d-hba1c-observation
Title: "T1D HbA1c Observation"
Description: "Hemoglobin A1c observation for T1D patients"

* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code = http://loinc.org#4548-4 "Hemoglobin A1c/Hemoglobin.total in Blood"
* value[x] only Quantity
* valueQuantity.unit from T1DHbA1cUnitsValueSet (required)
* valueQuantity.system = "http://unitsofmeasure.org"

Profile: T1DSDOHObservation
Parent: T1DObservation
Id: t1d-sdoh-observation
Title: "T1D Social Determinants of Health Observation"
Description: "Social determinants of health observations for T1D patients"

* category = http://terminology.hl7.org/CodeSystem/observation-category#social-history
* code from T1DSDOHCodeValueSet (extensible)
* value[x] only CodeableConcept or boolean or string
* valueCodeableConcept from T1DSDOHResponseValueSet (extensible)