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
* code ^comment = "Priority: High | Notes: See Core Laboratory Observations page for complete list of 23 core labs to include when available"
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

* extension contains
    T1DObservationCodeType named observationCodeType 0..1 MS and
    T1DObservationEffectiveTime named effectiveTime 0..1 MS

* extension[observationCodeType] ^definition = "Disease specific coding system"
* extension[observationCodeType] ^short = "Observation code system"
* extension[observationCodeType] ^comment = "Priority: High"

* extension[effectiveTime] ^definition = "Encounter time"
* extension[effectiveTime] ^short = "Encounter time"
* extension[effectiveTime] ^comment = "Priority: Low"

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

// Pattern for bgmMean component
* component[bgmMean].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#bgm-mean
* component[bgmMean].value[x] only Quantity
* component[bgmMean].valueQuantity.unit = "mg/dL"

// Pattern for cgmHighAbove180 component  
* component[cgmHighAbove180].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#cgm-high-above-180
* component[cgmHighAbove180].value[x] only Quantity
* component[cgmHighAbove180].valueQuantity.unit = "%"

// Pattern for timeInRange component
* component[timeInRange].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#time-in-range
* component[timeInRange].value[x] only Quantity
* component[timeInRange].valueQuantity.unit = "%"

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

Profile: T1DHypoglycemiaObservation
Parent: T1DObservation
Id: t1d-hypoglycemia-observation
Title: "T1D Hypoglycemia Event Observation"
Description: "Severe hypoglycemia events requiring medical attention"

* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code from T1DSevereHypoglycemiaValueSet (required)
* value[x] only integer
* valueInteger ^definition = "Number of severe hypoglycemia events since last visit"
* valueInteger ^short = "Count of severe hypoglycemia events"
* valueInteger ^comment = "Priority: High | Notes: Level 3 (from JDRF consensus document): a severe event characterized by altered mental and/or physical status requiring assistance"

* component MS
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component contains
    patientReportedAmbulatory 0..1 MS and
    patientReportedInpatient 0..1 MS

// Pattern for patientReportedAmbulatory component
* component[patientReportedAmbulatory].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#sh-events-amb-pro
* component[patientReportedAmbulatory].value[x] only integer

// Pattern for patientReportedInpatient component
* component[patientReportedInpatient].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#sh-events-inp-pro
* component[patientReportedInpatient].value[x] only integer

* component[patientReportedAmbulatory] ^definition = "Patient reported number of severe hypoglycemia episodes requiring ED or urgent care since last visit (not requiring overnight stay or hospitalization)"
* component[patientReportedAmbulatory] ^short = "Patient reported ambulatory severe hypoglycemia"
* component[patientReportedAmbulatory] ^comment = "Priority: High | Notes: Will vary by site's acceptance of PRO (Patient Reported Outcomes)"
* component[patientReportedAmbulatory].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#sh-events-amb-pro
* component[patientReportedAmbulatory].value[x] only integer

* component[patientReportedInpatient] ^definition = "Patient reported number of severe hypoglycemia episodes requiring hospitalization since last visit (excludes ED and urgent care visits)"
* component[patientReportedInpatient] ^short = "Patient reported inpatient severe hypoglycemia"
* component[patientReportedInpatient] ^comment = "Priority: High | Notes: Will vary by site's acceptance of PRO (Patient Reported Outcomes)"
* component[patientReportedInpatient].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#sh-events-inp-pro
* component[patientReportedInpatient].value[x] only integer

Profile: T1DDKAObservation
Parent: T1DObservation
Id: t1d-dka-observation
Title: "T1D DKA Event Observation"
Description: "Diabetic ketoacidosis episodes requiring medical attention. Uses component model for DKA-related lab values and patient-reported data because: (1) Clinical Context - lab values are specifically 'during DKA' not general lab results, (2) T1D Exchange Purpose - these are quality metrics for DKA severity not standalone lab tracking, (3) Specification Alignment - T1D Exchange treats these as DKA event attributes, (4) Implementation Simplicity - single observation captures complete DKA episode data."

* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code from T1DDKAEventsValueSet (required)
* value[x] only integer
* valueInteger ^definition = "Number of DKA episodes since last visit"
* valueInteger ^short = "Count of DKA episodes"
* valueInteger ^comment = "Priority: High | Notes: Elevated serum or urine ketones and serum bicarbonate <15 mmol/L or blood pH <7.3"

* component MS
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component contains
    serumBicarbonate 0..1 MS and
    bloodPH 0..1 MS and
    patientReportedInpatient 0..1 MS and
    patientReportedEventDate 0..1 MS and
    ambulatoryEvents 0..1 MS

// Pattern for serumBicarbonate component
* component[serumBicarbonate].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dka-serum-bicarb
* component[serumBicarbonate].value[x] only Quantity
* component[serumBicarbonate].valueQuantity.unit = "mmol/L"

// Pattern for bloodPH component
* component[bloodPH].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dka-blood-ph
* component[bloodPH].value[x] only Quantity
* component[bloodPH].valueQuantity.unit = "[pH]"

// Pattern for patientReportedInpatient component
* component[patientReportedInpatient].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dka-events-inp-pro
* component[patientReportedInpatient].value[x] only integer

// Pattern for patientReportedEventDate component
* component[patientReportedEventDate].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dka-events-pro-dt
* component[patientReportedEventDate].value[x] only dateTime or Period or string

// Pattern for ambulatoryEvents component
* component[ambulatoryEvents].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dka-events-amb
* component[ambulatoryEvents].value[x] only integer

* component[serumBicarbonate] ^definition = "Serum bicarbonate level during DKA (mmol/L) to 1 decimal place"
* component[serumBicarbonate] ^short = "Serum bicarbonate during DKA"
* component[serumBicarbonate] ^comment = "Priority: High | Notes: Lab reported serum bicarbonate value in mmol/L associated with a DKA event"
* component[serumBicarbonate].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dka-serum-bicarb
* component[serumBicarbonate].value[x] only Quantity
* component[serumBicarbonate].valueQuantity.unit = "mmol/L"

* component[bloodPH] ^definition = "Arterial pH value during DKA to 1 decimal place"
* component[bloodPH] ^short = "Blood pH during DKA"
* component[bloodPH] ^comment = "Priority: High | Notes: Lab reported blood pH value associated with a DKA event"
* component[bloodPH].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dka-blood-ph
* component[bloodPH].value[x] only Quantity
* component[bloodPH].valueQuantity.unit = "[pH]"

* component[patientReportedInpatient] ^definition = "Patient reported number of DKA episodes requiring hospitalization since last visit (excludes ED and urgent care visits)"
* component[patientReportedInpatient] ^short = "Patient reported inpatient DKA episodes"
* component[patientReportedInpatient] ^comment = "Priority: High | Notes: Will vary by site's acceptance of PRO (Patient Reported Outcomes)"
* component[patientReportedInpatient].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dka-events-inp-pro
* component[patientReportedInpatient].value[x] only integer

* component[patientReportedEventDate] ^definition = "Date of admission for patient reported DKA events (dka_events_inp_pro and dka_events_amb_pro)"
* component[patientReportedEventDate] ^short = "Date of patient reported DKA event"
* component[patientReportedEventDate] ^comment = "Priority: High | Notes: Patient reported date of when a DKA event occurred for patient reported DKA events. Format: YYYYMMDD, YYYYMM, or YYYY"
* component[patientReportedEventDate].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dka-events-pro-dt
* component[patientReportedEventDate].value[x] only dateTime or Period or string

* component[ambulatoryEvents] ^definition = "Number of DKA episodes requiring ED or urgent care since last visit (not requiring overnight stay or hospitalization)"
* component[ambulatoryEvents] ^short = "DKA ambulatory episodes"
* component[ambulatoryEvents] ^comment = "Priority: High | Notes: Elevated serum or urine ketones and serum bicarbonate <15 mmol/L or blood pH <7.3"
* component[ambulatoryEvents].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dka-events-amb
* component[ambulatoryEvents].value[x] only integer

Profile: T1DHypoglycemiaAwarenessObservation
Parent: T1DObservation
Id: t1d-hypoglycemia-awareness-observation
Title: "T1D Hypoglycemia Awareness Observation"
Description: "Patient's ability to self-identify hypoglycemia symptoms"

* category = http://terminology.hl7.org/CodeSystem/observation-category#survey
* code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#hypo-sym
* value[x] only CodeableConcept
* valueCodeableConcept from T1DHypoglycemiaAwarenessValueSet (required)
* valueCodeableConcept ^definition = "Patient's ability to self identify hypoglycemia: presence of symptoms"
* valueCodeableConcept ^short = "Hypoglycemia awareness status"
* valueCodeableConcept ^comment = "Priority: Low"

* component MS
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component contains
    symptomThreshold 0..1 MS

// Pattern for symptomThreshold component
* component[symptomThreshold].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#hypo-sym-value
* component[symptomThreshold].value[x] only Quantity
* component[symptomThreshold].valueQuantity.unit = "mg/dL"

* component[symptomThreshold] ^definition = "Typical glucose value (mg/dL) for which patient consistently experiences symptoms of hypoglycemia. If range, use high end of range. Prefer blood glucose over sensor glucose value, if available."
* component[symptomThreshold] ^short = "Glucose threshold for symptoms"
* component[symptomThreshold] ^comment = "Priority: Low | Notes: Do not report mmol/L; to convert, multiply by 18 to convert mmol/L to mg/dL."
* component[symptomThreshold].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#hypo-sym-value
* component[symptomThreshold].value[x] only Quantity
* component[symptomThreshold].valueQuantity.unit = "mg/dL"

Profile: T1DCareScreeningObservation
Parent: T1DObservation
Id: t1d-care-screening-observation
Title: "T1D Care Screening Observation"
Description: "Preventive care screening dates for T1D patients"

* category = http://terminology.hl7.org/CodeSystem/observation-category#exam
* code from T1DCareScreeningCodeValueSet (required)
* value[x] only dateTime or Period or string
* valueDateTime ^definition = "Date of last screening or examination"
* valueDateTime ^short = "Date of last screening"
* valueDateTime ^comment = "Priority: Low | Notes: Supports YYYYMMDD, YYYYMM, YYYY formats"

Profile: T1DSDOHScreeningObservation
Parent: T1DObservation
Id: t1d-sdoh-screening-observation
Title: "T1D SDOH Screening Observation"
Description: "Social determinants of health screening for transportation and housing insecurity"

* category = http://terminology.hl7.org/CodeSystem/observation-category#social-history
* code from T1DSDOHInsecurityCodeValueSet (required)
* value[x] only CodeableConcept
* valueCodeableConcept from T1DSDOHResponseValueSet (required)
* valueCodeableConcept ^definition = "Response to SDOH screening question"
* valueCodeableConcept ^short = "SDOH screening response"
* valueCodeableConcept ^comment = "Priority: Low | Notes: Screening for transportation and housing insecurity"

Extension: T1DObservationCodeType
Id: t1d-observation-code-type
Title: "T1D Observation Code Type Extension"
Description: "Disease specific coding system for observations"
* ^context.type = #element
* ^context.expression = "Observation"
* value[x] only CodeableConcept
* valueCodeableConcept from T1DObservationCodeTypeValueSet (required)
* valueCodeableConcept ^definition = "Disease specific coding system"
* valueCodeableConcept ^short = "Observation code system"
* valueCodeableConcept ^comment = "Priority: High"

Extension: T1DObservationEffectiveTime
Id: t1d-observation-effective-time
Title: "T1D Observation Effective Time Extension"
Description: "Encounter time for observation"
* ^context.type = #element
* ^context.expression = "Observation"
* value[x] only time
* valueTime ^definition = "Encounter time"
* valueTime ^short = "Encounter time in HHMM format"
* valueTime ^comment = "Priority: Low"