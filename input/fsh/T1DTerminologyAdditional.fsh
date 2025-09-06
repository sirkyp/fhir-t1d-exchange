// Additional T1D Exchange ValueSets for Phase 1 Implementation

ValueSet: T1DHypoglycemiaAwarenessValueSet
Id: t1d-hypoglycemia-awareness-valueset
Title: "T1D Hypoglycemia Awareness Value Set"
Description: "Patient's ability to self-identify hypoglycemia symptoms"
* ^experimental = false
* ^url = "http://t1dexchange.org/fhir/ValueSet/t1d-hypoglycemia-awareness-valueset"
* include codes from system http://t1dexchange.org/fhir/CodeSystem/t1d-hypoglycemia-awareness

CodeSystem: T1DHypoglycemiaAwareness
Id: t1d-hypoglycemia-awareness
Title: "T1D Hypoglycemia Awareness"
Description: "Codes for hypoglycemia awareness assessment"
* ^url = "http://t1dexchange.org/fhir/CodeSystem/t1d-hypoglycemia-awareness"
* ^experimental = false
* ^caseSensitive = true
* #1 "Yes" "Patient can identify hypoglycemia symptoms"
* #2 "Partial/Some hypoglycemia unawareness" "Patient has partial awareness of hypoglycemia symptoms"
* #3 "No" "Patient cannot identify hypoglycemia symptoms"
* #10 "Unknown" "Hypoglycemia awareness status unknown"

ValueSet: T1DSevereHypoglycemiaValueSet
Id: t1d-severe-hypoglycemia-valueset
Title: "T1D Severe Hypoglycemia Value Set"
Description: "Codes for severe hypoglycemia events"
* ^experimental = false
* ^url = "http://t1dexchange.org/fhir/ValueSet/t1d-severe-hypoglycemia-valueset"
* http://t1dexchange.org/fhir/CodeSystem/t1d-codes#sh-events-amb "Severe Hypoglycemia Ambulatory"
* http://t1dexchange.org/fhir/CodeSystem/t1d-codes#sh-events-inp "Severe Hypoglycemia Inpatient"

ValueSet: T1DDKAEventsValueSet
Id: t1d-dka-events-valueset
Title: "T1D DKA Events Value Set"
Description: "Codes for diabetic ketoacidosis events"
* ^experimental = false
* ^url = "http://t1dexchange.org/fhir/ValueSet/t1d-dka-events-valueset"
* http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dka-events-amb "DKA Ambulatory"
* http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dka-events-inp "DKA Inpatient"

ValueSet: T1DSDOHCodeValueSet
Id: t1d-sdoh-code-valueset
Title: "T1D SDOH Code Value Set"
Description: "Social determinants of health observation codes"
* ^experimental = false
* ^url = "http://t1dexchange.org/fhir/ValueSet/t1d-sdoh-code-valueset"
* http://loinc.org#93030-5 "Has lack of transportation kept you from medical appointments, meetings, work, or from getting things needed for daily living"
* http://loinc.org#93033-9 "Are you worried about losing your housing?"
* http://loinc.org#88124-3 "Food insecurity risk [HVS]"
* http://loinc.org#88122-7 "Hunger Vital Signs Q1"
* http://loinc.org#88123-5 "Hunger Vital Signs Q2"

ValueSet: T1DSDOHResponseValueSet
Id: t1d-sdoh-response-valueset
Title: "T1D SDOH Response Value Set"
Description: "Response options for SDOH screening questions"
* ^experimental = false
* ^url = "http://t1dexchange.org/fhir/ValueSet/t1d-sdoh-response-valueset"
* include codes from system http://t1dexchange.org/fhir/CodeSystem/t1d-sdoh-responses

CodeSystem: T1DSDOHResponses
Id: t1d-sdoh-responses
Title: "T1D SDOH Responses"
Description: "Response codes for SDOH screening"
* ^url = "http://t1dexchange.org/fhir/CodeSystem/t1d-sdoh-responses"
* ^experimental = false
* ^caseSensitive = true
* #often-true "Often true"
* #sometimes-true "Sometimes true"
* #never-true "Never true"
* #dont-know-refused "Don't know/refused"
* #yes "Yes"
* #no "No"
* #unknown "Unknown"

ValueSet: T1DStatusActorValueSet
Id: t1d-status-actor-valueset
Title: "T1D Status Actor Value Set"
Description: "Actors responsible for encounter status"
* ^experimental = false
* ^url = "http://t1dexchange.org/fhir/ValueSet/t1d-status-actor-valueset"
* include codes from system http://t1dexchange.org/fhir/CodeSystem/t1d-status-actor

CodeSystem: T1DStatusActorCS
Id: t1d-status-actor
Title: "T1D Status Actor"
Description: "Codes for actors responsible for encounter status"
* ^url = "http://t1dexchange.org/fhir/CodeSystem/t1d-status-actor"
* ^experimental = false
* ^caseSensitive = true
* #patient "Patient" "The patient is responsible for the current status"
* #provider "Provider" "The provider is responsible for the current status"
* #other "Other" "Catch-all for external actors"

ValueSet: T1DStatusReasonValueSet
Id: t1d-status-reason-valueset
Title: "T1D Status Reason Value Set"
Description: "Reasons for encounter status"
* ^experimental = false
* ^url = "http://t1dexchange.org/fhir/ValueSet/t1d-status-reason-valueset"
* include codes from system http://t1dexchange.org/fhir/CodeSystem/t1d-status-reason

CodeSystem: T1DStatusReasonCS
Id: t1d-status-reason
Title: "T1D Status Reason"
Description: "Codes for reasons for encounter status"
* ^url = "http://t1dexchange.org/fhir/CodeSystem/t1d-status-reason"
* ^experimental = false
* ^caseSensitive = true
* #equipment "Equipment" "Equipment was not available"
* #interpreter "Interpreter" "Interpreter was not available"
* #insurance "Insurance" "Insurance issue"
* #no-referral-preauthorization "No referral/preauthorization" "Insurance issue"
* #schedule-conflict "Schedule conflict" "Patient or provider had a scheduling conflict"
* #financials "Financials" "Financial issue"
* #scheduling-error "Scheduling error" "An error occurred in scheduling the encounter"
* #weather "Weather" "Weather interfered with the encounter"
* #illness "Illness" "Patient/Provider was hospitalized or otherwise too sick"
* #no-longer-needed "No longer needed" "Appointment is no longer necessary"
* #convenience "Convenience" "Convenience reason"
* #other "Other" "Other reason"

ValueSet: T1DEncounterReasonCodeTypeValueSet
Id: t1d-encounter-reason-code-type-valueset
Title: "T1D Encounter Reason Code Type Value Set"
Description: "Code systems used for encounter reasons"
* ^experimental = false
* ^url = "http://t1dexchange.org/fhir/ValueSet/t1d-encounter-reason-code-type-valueset"
* include codes from system http://t1dexchange.org/fhir/CodeSystem/t1d-encounter-reason-code-type

CodeSystem: T1DEncounterReasonCodeTypeCS
Id: t1d-encounter-reason-code-type
Title: "T1D Encounter Reason Code Type"
Description: "Code systems for encounter reasons"
* ^url = "http://t1dexchange.org/fhir/CodeSystem/t1d-encounter-reason-code-type"
* ^experimental = false
* ^caseSensitive = true
* #cpt "CPT Code" "CPT Code"
* #snomedct "SNOMED CT" "FHIR standard uses SNOMED CT for describing encounter reason"
* #icd10 "ICD-10 Code" "ICD-10 Code"
* #icd9 "ICD-9 Code" "ICD-9 Code"

ValueSet: T1DEndoVisitValueSet
Id: t1d-endo-visit-valueset
Title: "T1D Endocrine Visit Value Set"
Description: "Binary indicator for endocrine group visits"
* ^experimental = false
* ^url = "http://t1dexchange.org/fhir/ValueSet/t1d-endo-visit-valueset"
* include codes from system http://t1dexchange.org/fhir/CodeSystem/t1d-endo-visit

CodeSystem: T1DEndoVisitCS
Id: t1d-endo-visit
Title: "T1D Endocrine Visit"
Description: "Codes for endocrine group visit indicators"
* ^url = "http://t1dexchange.org/fhir/CodeSystem/t1d-endo-visit"
* ^experimental = false
* ^caseSensitive = true
* #0 "No" "Encounter is from non-endocrine group"
* #1 "Yes" "Encounter is from endocrine group"
* #99 "Other" "Other"
* #100 "Unknown" "Unknown"

ValueSet: T1DObservationCodeTypeValueSet
Id: t1d-observation-code-type-valueset
Title: "T1D Observation Code Type Value Set"
Description: "Code systems for observation codes"
* ^experimental = false
* ^url = "http://t1dexchange.org/fhir/ValueSet/t1d-observation-code-type-valueset"
* include codes from system http://t1dexchange.org/fhir/CodeSystem/t1d-observation-code-type

CodeSystem: T1DObservationCodeTypeCS
Id: t1d-observation-code-type
Title: "T1D Observation Code Type"
Description: "Code systems for observation codes"
* ^url = "http://t1dexchange.org/fhir/CodeSystem/t1d-observation-code-type"
* ^experimental = false
* ^caseSensitive = true
* #loinc "LOINC" "Logical Observation Identifiers Names and Codes"
* #t1d "T1D" "T1D Exchange custom codes"

ValueSet: T1DProviderIdTypeValueSet
Id: t1d-provider-id-type-valueset
Title: "T1D Provider ID Type Value Set"
Description: "Types of provider identifiers"
* ^experimental = false
* ^url = "http://t1dexchange.org/fhir/ValueSet/t1d-provider-id-type-valueset"
* include codes from system http://t1dexchange.org/fhir/CodeSystem/t1d-provider-id-type

CodeSystem: T1DProviderIdType
Id: t1d-provider-id-type
Title: "T1D Provider ID Type"
Description: "Types of provider identifiers"
* ^url = "http://t1dexchange.org/fhir/CodeSystem/t1d-provider-id-type"
* ^experimental = false
* ^caseSensitive = true
* #npi "NPI" "National Provider Index (NPI) number"
* #pos "POS" "CMS Provider of Service (POS) number"
* #dea "DEA" "DEA number"
* #internal "Internal" "Other nationally recognized or Internal Health System ID"

ValueSet: T1DProviderTypeValueSet
Id: t1d-provider-type-valueset
Title: "T1D Provider Type Value Set"
Description: "Types of healthcare providers in T1D care"
* ^experimental = false
* ^url = "http://t1dexchange.org/fhir/ValueSet/t1d-provider-type-valueset"
* include codes from system http://t1dexchange.org/fhir/CodeSystem/t1d-provider-type

CodeSystem: T1DProviderType
Id: t1d-provider-type
Title: "T1D Provider Type"
Description: "Types of healthcare providers in T1D care"
* ^url = "http://t1dexchange.org/fhir/CodeSystem/t1d-provider-type"
* ^experimental = false
* ^caseSensitive = true
* #MD "Physician" "Physician"
* #DO "Doctor of Osteopathic Medicine" "Doctor of Osteopathic Medicine"
* #PA "Physician Assistant" "Physician Assistant"
* #NP "Nurse Practitioner" "Nurse Practitioner"
* #RN "Registered Nurse" "Registered Nurse"
* #RD "Registered Dietician" "Registered Dietician"
* #EP "Exercise Physiologist" "Exercise Physiologist"
* #PS "Psychologist" "Psychologist"
* #SW "Social Worker" "Social Worker"
* #CDE "Certified Diabetes Educator" "Certified Diabetes Educator"
* #PH "Pharmacist" "Pharmacist"
* #OD "Optometrist" "Optometrist"
* #PO "Podiatrist" "Podiatrist"
* #PT "Physical therapist" "Physical therapist"
* #OT "Occupational therapist" "Occupational therapist"
* #OTH "Other person" "Other person"

ValueSet: T1DObservationInterpretationValueSet
Id: t1d-observation-interpretation-valueset
Title: "T1D Observation Interpretation Value Set"
Description: "Observation interpretation codes for T1D Exchange"
* ^experimental = false
* ^url = "http://t1dexchange.org/fhir/ValueSet/t1d-observation-interpretation-valueset"
* http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#L "Low"
* http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H "High"
* http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#N "Normal"
* http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#A "Abnormal"
* http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#AA "Critically abnormal"
* http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#HH "Critically high"
* http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#LL "Critically low"
* http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#< "Off scale low"
* http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#> "Off scale high"
* http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#POS "Positive"
* http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#NEG "Negative"

ValueSet: T1DMedicationStatusValueSet
Id: t1d-medication-status-valueset
Title: "T1D Medication Status Value Set"
Description: "Medication status codes for T1D Exchange"
* ^experimental = false
* ^url = "http://t1dexchange.org/fhir/ValueSet/t1d-medication-status-valueset"
* http://hl7.org/fhir/CodeSystem/medicationrequest-status#active "Active"
* http://hl7.org/fhir/CodeSystem/medicationrequest-status#on-hold "On Hold"
* http://hl7.org/fhir/CodeSystem/medicationrequest-status#cancelled "Cancelled"
* http://hl7.org/fhir/CodeSystem/medicationrequest-status#completed "Completed"
* http://hl7.org/fhir/CodeSystem/medicationrequest-status#entered-in-error "Entered in Error"
* http://hl7.org/fhir/CodeSystem/medicationrequest-status#stopped "Stopped"
* http://hl7.org/fhir/CodeSystem/medicationrequest-status#draft "Draft"

ValueSet: T1DConditionStatusValueSet
Id: t1d-condition-status-valueset
Title: "T1D Condition Status Value Set"
Description: "Condition clinical and verification status codes for T1D Exchange"
* ^experimental = false
* ^url = "http://t1dexchange.org/fhir/ValueSet/t1d-condition-status-valueset"
* http://terminology.hl7.org/CodeSystem/condition-clinical#active "Active"
* http://terminology.hl7.org/CodeSystem/condition-clinical#relapse "Relapse"
* http://terminology.hl7.org/CodeSystem/condition-clinical#remission "Remission"
* http://terminology.hl7.org/CodeSystem/condition-clinical#resolved "Resolved"
* http://terminology.hl7.org/CodeSystem/condition-ver-status#provisional "Provisional"
* http://terminology.hl7.org/CodeSystem/condition-ver-status#differential "Differential"
* http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed "Confirmed"
* http://terminology.hl7.org/CodeSystem/condition-ver-status#refuted "Refuted"
* http://terminology.hl7.org/CodeSystem/condition-ver-status#entered-in-error "Entered in Error"

ValueSet: T1DObservationStatusValueSet
Id: t1d-observation-status-valueset
Title: "T1D Observation Status Value Set"
Description: "Observation status codes for T1D Exchange"
* ^experimental = false
* ^url = "http://t1dexchange.org/fhir/ValueSet/t1d-observation-status-valueset"
* http://hl7.org/fhir/observation-status#registered "Registered"
* http://hl7.org/fhir/observation-status#preliminary "Preliminary"
* http://hl7.org/fhir/observation-status#final "Final"
* http://hl7.org/fhir/observation-status#amended "Amended"
* http://hl7.org/fhir/observation-status#corrected "Corrected"
* http://hl7.org/fhir/observation-status#cancelled "Cancelled"
* http://hl7.org/fhir/observation-status#entered-in-error "Entered in Error"
* http://hl7.org/fhir/observation-status#unknown "Unknown"

CodeSystem: T1DConditionCategory
Id: t1d-condition-category
Title: "T1D Condition Category"
Description: "Condition category codes for T1D Exchange"
* ^url = "http://t1dexchange.org/fhir/CodeSystem/t1d-condition-category"
* ^experimental = false
* ^caseSensitive = true
* #complaint "Complaint" "The recorded condition is a complaint"
* #symptom "Symptom" "The recorded condition is a symptom"
* #finding "Finding" "The recorded condition is a finding"
* #diagnosis "Diagnosis" "The recorded condition is a diagnosis"