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