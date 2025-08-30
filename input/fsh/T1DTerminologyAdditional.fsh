// Additional Value Sets for T1D Exchange

ValueSet: T1DProviderSpecialtyValueSet
Id: t1d-provider-specialty-valueset
Title: "T1D Provider Specialty Value Set"
Description: "Healthcare provider specialties relevant to T1D care"
* ^experimental = false
* http://nucc.org/provider-taxonomy#207RE0101X "Endocrinology, Diabetes & Metabolism Physician"
* http://nucc.org/provider-taxonomy#208000000X "Pediatrics Physician"
* http://nucc.org/provider-taxonomy#207R00000X "Internal Medicine Physician"
* http://nucc.org/provider-taxonomy#363L00000X "Nurse Practitioner"
* http://nucc.org/provider-taxonomy#364S00000X "Clinical Nurse Specialist"
* http://nucc.org/provider-taxonomy#133V00000X "Dietitian, Registered"

ValueSet: T1DOrganizationTypeValueSet
Id: t1d-organization-type-valueset
Title: "T1D Organization Type Value Set"
Description: "Types of healthcare organizations in T1D Exchange"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/organization-type|2.0.1#prov "Healthcare Provider"
* http://terminology.hl7.org/CodeSystem/organization-type|2.0.1#dept "Hospital Department"
* http://terminology.hl7.org/CodeSystem/organization-type|2.0.1#team "Organizational team"

ValueSet: T1DEncounterClassValueSet
Id: t1d-encounter-class-valueset
Title: "T1D Encounter Class Value Set"
Description: "Encounter classes for T1D Exchange"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/v3-ActCode|9.0.0#AMB "ambulatory"
* http://terminology.hl7.org/CodeSystem/v3-ActCode|9.0.0#IMP "inpatient encounter"
* http://terminology.hl7.org/CodeSystem/v3-ActCode|9.0.0#EMER "emergency"
* http://terminology.hl7.org/CodeSystem/v3-ActCode|9.0.0#VR "virtual"

ValueSet: T1DEncounterTypeValueSet
Id: t1d-encounter-type-valueset
Title: "T1D Encounter Type Value Set"
Description: "Types of encounters for T1D care"
* ^experimental = false
* http://snomed.info/sct#185349003 "Encounter for check up"
* http://snomed.info/sct#390906007 "Follow-up encounter"
* http://snomed.info/sct#185347001 "Encounter for problem"
* http://snomed.info/sct#11429006 "Consultation"

ValueSet: T1DEncounterReasonValueSet
Id: t1d-encounter-reason-valueset
Title: "T1D Encounter Reason Value Set"
Description: "Reasons for T1D-related encounters"
* ^experimental = false
* http://snomed.info/sct#46635009 "Type 1 diabetes mellitus"
* http://snomed.info/sct#182836005 "Review of care plan"
* http://snomed.info/sct#408403008 "Patient referral to specialist"
* http://snomed.info/sct#182840001 "Drug monitoring"

ValueSet: T1DConditionCategoryValueSet
Id: t1d-condition-category-valueset
Title: "T1D Condition Category Value Set"
Description: "Categories of conditions for T1D Exchange"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/condition-category|1.0.1#problem-list-item "Problem List Item"
* http://terminology.hl7.org/CodeSystem/condition-category|1.0.1#encounter-diagnosis "Encounter Diagnosis"

ValueSet: T1DConditionCodeValueSet
Id: t1d-condition-code-valueset
Title: "T1D Condition Code Value Set"
Description: "Condition codes relevant to T1D Exchange"
* ^experimental = false
* http://snomed.info/sct#46635009 "Type 1 diabetes mellitus"
* http://snomed.info/sct#4855003 "Retinopathy due to diabetes mellitus"
* http://snomed.info/sct#127013003 "Diabetic nephropathy"
* http://snomed.info/sct#230572002 "Diabetic neuropathy"
* http://snomed.info/sct#421895002 "Diabetic ketoacidosis"

ValueSet: T1DFamilyRelationshipValueSet
Id: t1d-family-relationship-valueset
Title: "T1D Family Relationship Value Set"
Description: "Family relationships for family history"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/v3-RoleCode|3.0.0#FTH "father"
* http://terminology.hl7.org/CodeSystem/v3-RoleCode|3.0.0#MTH "mother"
* http://terminology.hl7.org/CodeSystem/v3-RoleCode|3.0.0#SIB "sibling"
* http://terminology.hl7.org/CodeSystem/v3-RoleCode|3.0.0#GRPRN "grandparent"

ValueSet: T1DFamilyHistoryConditionValueSet
Id: t1d-family-history-condition-valueset
Title: "T1D Family History Condition Value Set"
Description: "Conditions relevant for family history in T1D"
* ^experimental = false
* http://snomed.info/sct#46635009 "Type 1 diabetes mellitus"
* http://snomed.info/sct#44054006 "Type 2 diabetes mellitus"
* http://snomed.info/sct#73211009 "Diabetes mellitus"

ValueSet: T1DMedicationCategoryValueSet
Id: t1d-medication-category-valueset
Title: "T1D Medication Category Value Set"
Description: "Categories of medications for T1D"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/medicationrequest-category|1.0.0#inpatient "Inpatient"
* http://terminology.hl7.org/CodeSystem/medicationrequest-category|1.0.0#outpatient "Outpatient"
* http://terminology.hl7.org/CodeSystem/medicationrequest-category|1.0.0#community "Community"

ValueSet: T1DMedicationCodeValueSet
Id: t1d-medication-code-valueset
Title: "T1D Medication Code Value Set"
Description: "Medications relevant to T1D treatment"
* ^experimental = false
* include http://www.nlm.nih.gov/research/umls/rxnorm#253182 "insulin, regular, human"
* include http://www.nlm.nih.gov/research/umls/rxnorm#274783 "insulin glargine"
* include http://www.nlm.nih.gov/research/umls/rxnorm#25789 "Glucagon"

ValueSet: T1DMedicationRouteValueSet
Id: t1d-medication-route-valueset
Title: "T1D Medication Route Value Set"
Description: "Routes of administration for T1D medications"
* ^experimental = false
* http://snomed.info/sct#263887005 "Subcutaneous"
* http://snomed.info/sct#26643006 "Oral"
* http://snomed.info/sct#47625008 "Intravenous"

ValueSet: T1DInsulinDeliveryValueSet
Id: t1d-insulin-delivery-valueset
Title: "T1D Insulin Delivery Value Set"
Description: "Methods of insulin delivery"
* ^experimental = false
* http://snomed.info/sct#63718003 "Insulin pump"
* http://snomed.info/sct#61968008 "Syringe"

ValueSet: T1DSDOHCodeValueSet
Id: t1d-sdoh-code-valueset
Title: "T1D SDOH Code Value Set"
Description: "Social determinants of health codes for T1D Exchange"
* ^experimental = false
* http://loinc.org#93030-5 "Has lack of transportation kept you from medical appointments, meetings, work, or from getting things needed for daily living"
* http://loinc.org#93033-9 "In the past 12 months, have you been concerned that your housing situation might change"
* http://loinc.org#97063-2 "Family history of Diabetes"

ValueSet: T1DSDOHResponseValueSet
Id: t1d-sdoh-response-valueset
Title: "T1D SDOH Response Value Set"
Description: "Response values for SDOH questions"
* ^experimental = false
* http://loinc.org#LA32-8 "No"
* http://loinc.org#LA33-6 "Yes"
* http://loinc.org#LA4489-6 "Unknown"

ValueSet: T1DObservationCodeValueSet
Id: t1d-observation-code-valueset
Title: "T1D Observation Code Value Set"
Description: "Observation codes for T1D Exchange"
* ^experimental = false
* include codes from valueset T1DGlucoseCodeValueSet
* http://loinc.org#4548-4 "Hemoglobin A1c/Hemoglobin.total in Blood"
* include codes from valueset T1DSDOHCodeValueSet
* include codes from system http://t1dexchange.org/fhir/CodeSystem/t1d-codes