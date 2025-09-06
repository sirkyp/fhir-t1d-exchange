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