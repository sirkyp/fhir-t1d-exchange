// Additional T1D ValueSets for High-Priority Missing Elements

ValueSet: T1DHypoglycemiaAwarenessValueSet
Id: t1d-hypoglycemia-awareness-valueset
Title: "T1D Hypoglycemia Awareness Value Set"
Description: "Patient's ability to self identify hypoglycemia symptoms"
* ^experimental = false
* include codes from system http://t1dexchange.org/fhir/CodeSystem/t1d-codes where concept is-a #hypo-sym

ValueSet: T1DSevereHypoglycemiaValueSet
Id: t1d-severe-hypoglycemia-valueset
Title: "T1D Severe Hypoglycemia Events Value Set"
Description: "Severe hypoglycemia events requiring medical attention"
* ^experimental = false
* http://t1dexchange.org/fhir/CodeSystem/t1d-codes#sh-events-amb "Severe Hypoglycemia Ambulatory"
* http://t1dexchange.org/fhir/CodeSystem/t1d-codes#sh-events-inp "Severe Hypoglycemia Inpatient"

ValueSet: T1DDKAEventsValueSet
Id: t1d-dka-events-valueset
Title: "T1D DKA Events Value Set"
Description: "Diabetic ketoacidosis episodes requiring medical attention"
* ^experimental = false
* http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dka-events-amb "DKA Ambulatory"
* http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dka-events-inp "DKA Inpatient"

ValueSet: T1DSDOHResponseValueSet
Id: t1d-sdoh-response-valueset
Title: "T1D SDOH Response Value Set"
Description: "Social determinants of health screening responses"
* ^experimental = false
* http://loinc.org#LA28397-0 "Often true"
* http://loinc.org#LA6270-8 "Sometimes true"
* http://loinc.org#LA28398-8 "Never true"
* http://loinc.org#LA15775-2 "Don't know/refused"

ValueSet: T1DSDOHCodeValueSet
Id: t1d-sdoh-code-valueset
Title: "T1D SDOH Code Value Set"
Description: "Social determinants of health screening codes"
* ^experimental = false
* http://loinc.org#93030-5 "Has lack of transportation kept you from medical appointments"
* http://loinc.org#93033-9 "Are you worried about losing your housing"
* http://loinc.org#88122-7 "Hunger Vital Signs Q1"
* http://loinc.org#88123-5 "Hunger Vital Signs Q2"
* http://t1dexchange.org/fhir/CodeSystem/t1d-codes#transportation-insecurity "Transportation Insecurity"
* http://t1dexchange.org/fhir/CodeSystem/t1d-codes#housing-insecurity "Housing Insecurity"