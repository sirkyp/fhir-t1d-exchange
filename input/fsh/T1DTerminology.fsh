// T1D Exchange Code Systems
CodeSystem: T1DIdentifierType
Id: t1d-identifier-type
Title: "T1D Identifier Types"
Description: "Identifier types used in T1D Exchange"
* ^url = "http://t1dexchange.org/fhir/CodeSystem/t1d-identifier-type"
* ^experimental = false
* ^caseSensitive = true
* #T1D-ID "T1D Patient ID" "T1D Exchange patient identifier"
* #T1D-PROVIDER-ID "T1D Provider ID" "T1D Exchange provider identifier"
* #T1D-ORG-ID "T1D Organization ID" "T1D Exchange organization identifier"
* #T1D-ENCOUNTER-ID "T1D Encounter ID" "T1D Exchange encounter identifier"

CodeSystem: T1DCodes
Id: t1d-codes
Title: "T1D Codes"
Description: "T1D-specific codes for observations and measurements"
* ^url = "http://t1dexchange.org/fhir/CodeSystem/t1d-codes"
* ^experimental = false
* ^caseSensitive = true
* #t1d-dx-dt "T1D Diagnosis Date" "Date of Type 1 diabetes diagnosis"
* #bgm-mean "BGM Mean" "Blood glucose meter mean/average"
* #cgm-high-above-180 "CGM High Above 180" "Percentage of time above 180 mg/dL"
* #time-in-range "Time in Range" "Percentage of time in target glucose range"
* #ins-regimen "Insulin Regimen" "Type of insulin regimen"
* #bgm-company "BGM Company" "Blood glucose meter manufacturer"
* #cgm-company "CGM Company" "Continuous glucose monitor manufacturer"
* #documented-transition-plan "Documented Transition Plan" "Transition plan from pediatric to adult care"
* #transportation-insecurity "Transportation Insecurity" "Transportation access challenges"
* #housing-insecurity "Housing Insecurity" "Housing stability challenges"
* #hypo-sym "Hypoglycemia Symptoms" "Patient's ability to self identify hypoglycemia"
* #hypo-sym-value "Hypoglycemia Symptom Value" "Typical glucose value for hypoglycemia symptoms"
* #sh-events-amb "Severe Hypoglycemia Ambulatory" "Severe hypoglycemia events requiring ED/urgent care"
* #sh-events-inp "Severe Hypoglycemia Inpatient" "Severe hypoglycemia events requiring hospitalization"
* #dka-events-amb "DKA Ambulatory" "DKA episodes requiring ED/urgent care"
* #dka-events-inp "DKA Inpatient" "DKA episodes requiring hospitalization"
* #dka-serum-bicarb "DKA Serum Bicarbonate" "Serum bicarbonate level during DKA"
* #dka-blood-ph "DKA Blood pH" "Arterial pH value during DKA"
* #dka-events-inp-pro "DKA Inpatient Patient Reported" "Patient reported DKA episodes requiring hospitalization"
* #dka-events-pro-dt "DKA Event Date Patient Reported" "Date of patient reported DKA events"
* #sh-events-amb-pro "Severe Hypoglycemia Ambulatory Patient Reported" "Patient reported severe hypoglycemia requiring ED/urgent care"
* #sh-events-inp-pro "Severe Hypoglycemia Inpatient Patient Reported" "Patient reported severe hypoglycemia requiring hospitalization"
* #flu-dt "Flu Vaccine Date" "Date of last flu vaccine"
* #eye-exam-dt "Eye Exam Date" "Date of last eye exam (dilated or retinal photographs)"
* #foot-exam-dt "Foot Exam Date" "Date of last foot exam"
* #dental-exam-dt "Dental Exam Date" "Date of last dental exam"
* #basal-bolus "Basal-Bolus" "Basal-bolus insulin regimen"
* #pump "Insulin Pump" "Insulin pump therapy"
* #mixed "Mixed Insulin" "Mixed insulin regimen"
* #other "Other" "Other insulin regimen type"
* #organization-id "Organization ID" "Submitting Member Organization ID"
* #provider-id "Provider ID" "Provider identifier for diabetes specialist"
* #encounter-id "Encounter ID" "Unique encounter identifier"

// Value Sets
ValueSet: T1DGenderValueSet
Id: t1d-gender-valueset
Title: "T1D Gender Value Set"
Description: "Gender values including non-binary option for T1D Exchange"
* ^experimental = false
* http://hl7.org/fhir/administrative-gender#male "Male"
* http://hl7.org/fhir/administrative-gender#female "Female"
* http://hl7.org/fhir/administrative-gender#other "Other"
* http://hl7.org/fhir/administrative-gender#unknown "Unknown"

ValueSet: T1DEducationLevelValueSet
Id: t1d-education-level-valueset
Title: "T1D Education Level Value Set"
Description: "Education level categories for T1D Exchange based on specification values"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/v3-EducationLevel|3.0.0#ELEM "No High School"
* http://terminology.hl7.org/CodeSystem/v3-EducationLevel|3.0.0#HS "High School graduate"
* http://terminology.hl7.org/CodeSystem/v3-EducationLevel|3.0.0#BD "College graduate"
* http://terminology.hl7.org/CodeSystem/v3-EducationLevel|3.0.0#POSTG "Post Graduate degree"
* http://terminology.hl7.org/CodeSystem/v3-NullFlavor#UNK "Unknown"

ValueSet: T1DObservationCategoryValueSet
Id: t1d-observation-category-valueset
Title: "T1D Observation Category Value Set"
Description: "Observation categories for T1D Exchange"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/observation-category|1.0.1#vital-signs "Vital Signs"
* http://terminology.hl7.org/CodeSystem/observation-category|1.0.1#laboratory "Laboratory"
* http://terminology.hl7.org/CodeSystem/observation-category|1.0.1#social-history "Social History"
* http://terminology.hl7.org/CodeSystem/observation-category|1.0.1#exam "Exam"

ValueSet: T1DObservationCodeValueSet
Id: t1d-observation-code-valueset
Title: "T1D Observation Code Value Set"
Description: "All observation codes for T1D Exchange including core laboratory observations"
* ^experimental = false
// Core Laboratory Observations
* http://loinc.org#4548-4 "Hemoglobin A1c/Hemoglobin.total in Blood"
* http://loinc.org#4549-2 "Hemoglobin A1c/Hemoglobin.total in Blood by Electrophoresis"
* http://loinc.org#17856-6 "Hemoglobin A1c/Hemoglobin.total in Blood by HPLC"
* http://loinc.org#31209-0 "Islet cell 512 Ab [Units/volume] in Serum"
* http://loinc.org#56718-0 "Islet cell 512 Ab [Units/volume] in Serum by Immunoassay"
* http://loinc.org#32636-3 "Islet cell 512 Ab [Titer] in Serum"
* http://loinc.org#8072-1 "Insulin Ab [Units/volume] in Serum"
* http://loinc.org#76651-9 "Zinc transporter 8 Ab [Units/volume] in Serum or Plasma by Immunoassay"
* http://loinc.org#13926-1 "Glutamate decarboxylase 65 Ab [Units/volume] in Serum"
* http://loinc.org#56540-8 "Glutamate decarboxylase 65 Ab [Units/volume] in Serum by Immunoassay"
* http://loinc.org#2093-3 "Cholesterol [Mass/volume] in Serum or Plasma"
* http://loinc.org#2085-9 "Cholesterol in HDL [Mass/volume] in Serum or Plasma"
* http://loinc.org#2089-1 "Cholesterol in LDL [Mass/volume] in Serum or Plasma"
* http://loinc.org#2571-8 "Triglyceride [Mass/volume] in Serum or Plasma"
* http://loinc.org#3016-3 "Thyrotropin [Units/volume] in Serum or Plasma"
* http://loinc.org#3024-7 "Thyroxine (T4) free [Mass/volume] in Serum or Plasma"
* http://loinc.org#3026-2 "Thyroxine (T4) [Mass/volume] in Serum or Plasma"
* http://loinc.org#8099-4 "Thyroperoxidase Ab [Units/volume] in Serum or Plasma"
* http://loinc.org#8098-6 "Thyroglobulin Ab [Units/volume] in Serum or Plasma"
* http://loinc.org#31017-7 "Tissue transglutaminase IgA Ab [Units/volume] in Serum"
* http://loinc.org#32998-7 "Tissue transglutaminase IgG Ab [Units/volume] in Serum"
* http://loinc.org#2458-8 "IgA [Mass/volume] in Serum or Plasma"
* http://loinc.org#13092-2 "Endomysium Ab [Units/volume] in Serum"
* http://loinc.org#14708-2 "Endomysium Ab [Titer] in Serum"
* http://loinc.org#14957-5 "Microalbumin [Mass/volume] in Urine"
* http://loinc.org#6942-7 "Albumin [Mass/volume] in Urine by Electrophoresis"
* http://loinc.org#2161-8 "Creatinine [Mass/volume] in Urine"
* http://loinc.org#2160-0 "Creatinine [Mass/volume] in Serum or Plasma"
* http://loinc.org#10466-1 "Anion gap 3 in Serum or Plasma"
* http://loinc.org#1863-0 "Anion gap 4 in Serum or Plasma"
* http://loinc.org#33037-3 "Anion gap in Serum or Plasma"
* http://loinc.org#1986-9 "C peptide [Mass/volume] in Serum or Plasma"

ValueSet: T1DGlucoseCodeValueSet
Id: t1d-glucose-code-valueset
Title: "T1D Glucose Code Value Set"
Description: "Glucose measurement codes for T1D Exchange"
* ^experimental = false
* http://loinc.org#2339-0 "Glucose [Mass/volume] in Blood"
* http://loinc.org#6689-4 "Glucose [Mass/volume] in Plasma"
* http://loinc.org#15074-8 "Glucose [Moles/volume] in Blood"

ValueSet: T1DGlucoseUnitsValueSet
Id: t1d-glucose-units-valueset
Title: "T1D Glucose Units Value Set"
Description: "Units for glucose measurements"
* ^experimental = false
* http://unitsofmeasure.org#mg/dL "mg/dL"
* http://unitsofmeasure.org#mmol/L "mmol/L"

ValueSet: T1DHbA1cUnitsValueSet
Id: t1d-hba1c-units-valueset
Title: "T1D HbA1c Units Value Set"
Description: "Units for HbA1c measurements"
* ^experimental = false
* http://unitsofmeasure.org#% "%"
* http://unitsofmeasure.org#mmol/mol "mmol/mol"

ValueSet: T1DInsulinRegimenValueSet
Id: t1d-insulin-regimen-valueset
Title: "T1D Insulin Regimen Value Set"
Description: "Types of insulin regimens for T1D patients"
* ^experimental = false
* http://t1dexchange.org/fhir/CodeSystem/t1d-codes#basal-bolus "Basal-Bolus"
* http://t1dexchange.org/fhir/CodeSystem/t1d-codes#pump "Insulin Pump"
* http://t1dexchange.org/fhir/CodeSystem/t1d-codes#mixed "Mixed Insulin"
* http://t1dexchange.org/fhir/CodeSystem/t1d-codes#other "Other"

ValueSet: T1DTransitionPlanValueSet
Id: t1d-transition-plan-valueset
Title: "T1D Transition Plan Value Set"
Description: "Documented transition plan options"
* ^experimental = false
* http://snomed.info/sct#182836005 "Medication review"
* http://snomed.info/sct#408403008 "Patient referral to specialist"
* http://snomed.info/sct#385651009 "In progress"

ValueSet: T1DCareScreeningCodeValueSet
Id: t1d-care-screening-code-valueset
Title: "T1D Care Screening Code Value Set"
Description: "Codes for preventive care screening dates"
* ^experimental = false
* ^url = "http://t1dexchange.org/fhir/ValueSet/t1d-care-screening-code-valueset"
* http://t1dexchange.org/fhir/CodeSystem/t1d-codes#flu-dt "Flu Vaccine Date"
* http://t1dexchange.org/fhir/CodeSystem/t1d-codes#eye-exam-dt "Eye Exam Date"
* http://t1dexchange.org/fhir/CodeSystem/t1d-codes#foot-exam-dt "Foot Exam Date"
* http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dental-exam-dt "Dental Exam Date"

ValueSet: T1DSDOHInsecurityCodeValueSet
Id: t1d-sdoh-insecurity-code-valueset
Title: "T1D SDOH Insecurity Code Value Set"
Description: "Codes for transportation and housing insecurity screening"
* ^experimental = false
* ^url = "http://t1dexchange.org/fhir/ValueSet/t1d-sdoh-insecurity-code-valueset"
* http://t1dexchange.org/fhir/CodeSystem/t1d-codes#transportation-insecurity "Transportation Insecurity"
* http://t1dexchange.org/fhir/CodeSystem/t1d-codes#housing-insecurity "Housing Insecurity"

ValueSet: T1DLanguageValueSet
Id: t1d-language-valueset
Title: "T1D Language Value Set"
Description: "ISO-639-1 language codes for T1D Exchange"
* ^experimental = false
* urn:ietf:bcp:47#en "English"
* urn:ietf:bcp:47#es "Spanish"
* urn:ietf:bcp:47#zh "Chinese"
* urn:ietf:bcp:47#vi "Vietnamese"
* urn:ietf:bcp:47#fr "French"
* urn:ietf:bcp:47#de "German"
* urn:ietf:bcp:47#ar "Arabic"
* http://terminology.hl7.org/CodeSystem/v3-NullFlavor#OTH "Other"
* http://terminology.hl7.org/CodeSystem/v3-NullFlavor#UNK "Unknown"

ValueSet: T1DRaceValueSet
Id: t1d-race-valueset
Title: "T1D Race Value Set"
Description: "Race categories based on NIH/HL7 standards for T1D Exchange"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/v3-Race#1002-5 "American Indian or Alaska Native"
* http://terminology.hl7.org/CodeSystem/v3-Race#2028-9 "Asian"
* http://terminology.hl7.org/CodeSystem/v3-Race#2054-5 "Black or African American"
* http://terminology.hl7.org/CodeSystem/v3-Race#2076-8 "Native Hawaiian or Other Pacific Islander"
* http://terminology.hl7.org/CodeSystem/v3-Race#2131-1 "Other Race"
* http://terminology.hl7.org/CodeSystem/v3-Race#2106-3 "White"
* http://terminology.hl7.org/CodeSystem/v3-NullFlavor#UNK "Unknown"

ValueSet: T1DEthnicityValueSet
Id: t1d-ethnicity-valueset
Title: "T1D Ethnicity Value Set"
Description: "Ethnicity categories based on NIH/HL7 standards for T1D Exchange"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/v3-Ethnicity#2135-2 "Hispanic or Latino"
* http://terminology.hl7.org/CodeSystem/v3-Ethnicity#2186-5 "Not Hispanic or Latino"
* http://terminology.hl7.org/CodeSystem/v3-NullFlavor#UNK "Unknown"

ValueSet: T1DInsuranceTypeValueSet
Id: t1d-insurance-type-valueset
Title: "T1D Insurance Type Value Set"
Description: "Insurance type categories for T1D Exchange"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/v3-ActCode#PUBLICPOL "public healthcare"
* http://terminology.hl7.org/CodeSystem/v3-ActCode#EHCPOL "extended healthcare"
* http://terminology.hl7.org/CodeSystem/v3-ActCode#MILITARY "Military"
* http://terminology.hl7.org/CodeSystem/v3-NullFlavor#NA "Not applicable"
* http://terminology.hl7.org/CodeSystem/v3-NullFlavor#OTH "Other"
* http://terminology.hl7.org/CodeSystem/v3-NullFlavor#UNK "Unknown"

ValueSet: T1DConditionCategoryValueSet
Id: t1d-condition-category-valueset
Title: "T1D Condition Category Value Set"
Description: "Condition categories for T1D Exchange"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item "Problem List Item"
* http://terminology.hl7.org/CodeSystem/condition-category#encounter-diagnosis "Encounter Diagnosis"

ValueSet: T1DConditionCodeValueSet
Id: t1d-condition-code-valueset
Title: "T1D Condition Code Value Set"
Description: "Condition codes for T1D and related conditions"
* ^experimental = false
* http://snomed.info/sct#46635009 "Type 1 diabetes mellitus"
* http://snomed.info/sct#44054006 "Type 2 diabetes mellitus"
* http://snomed.info/sct#8801005 "Secondary diabetes mellitus"
* http://snomed.info/sct#237599002 "Insulin dependent diabetes mellitus"

ValueSet: T1DFamilyRelationshipValueSet
Id: t1d-family-relationship-valueset
Title: "T1D Family Relationship Value Set"
Description: "Family relationship codes for T1D Exchange"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/v3-RoleCode#FTH "Father"
* http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "Mother"
* http://terminology.hl7.org/CodeSystem/v3-RoleCode#SIB "Sibling"
* http://terminology.hl7.org/CodeSystem/v3-RoleCode#GRPRN "Grandparent"

ValueSet: T1DFamilyHistoryConditionValueSet
Id: t1d-family-history-condition-valueset
Title: "T1D Family History Condition Value Set"
Description: "Conditions for family history relevant to T1D"
* ^experimental = false
* http://snomed.info/sct#46635009 "Type 1 diabetes mellitus"
* http://snomed.info/sct#44054006 "Type 2 diabetes mellitus"
* http://snomed.info/sct#73211009 "Diabetes mellitus"

ValueSet: T1DEncounterClassValueSet
Id: t1d-encounter-class-valueset
Title: "T1D Encounter Class Value Set"
Description: "Encounter class codes for T1D Exchange"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"
* http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP "inpatient encounter"
* http://terminology.hl7.org/CodeSystem/v3-ActCode#EMER "emergency"
* http://terminology.hl7.org/CodeSystem/v3-ActCode#HH "home health"

ValueSet: T1DEncounterTypeValueSet
Id: t1d-encounter-type-valueset
Title: "T1D Encounter Type Value Set"
Description: "Encounter type codes for T1D Exchange"
* ^experimental = false
* http://snomed.info/sct#185349003 "Encounter for check up"
* http://snomed.info/sct#390906007 "Follow-up encounter"
* http://snomed.info/sct#11429006 "Consultation"

ValueSet: T1DEncounterReasonValueSet
Id: t1d-encounter-reason-valueset
Title: "T1D Encounter Reason Value Set"
Description: "Encounter reason codes for T1D Exchange"
* ^experimental = false
* http://snomed.info/sct#46635009 "Type 1 diabetes mellitus"
* http://snomed.info/sct#182836005 "Review of medication"
* http://snomed.info/sct#408403008 "Patient referral to specialist"

ValueSet: T1DMedicationCategoryValueSet
Id: t1d-medication-category-valueset
Title: "T1D Medication Category Value Set"
Description: "Medication categories for T1D Exchange"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/medicationrequest-category#inpatient "Inpatient"
* http://terminology.hl7.org/CodeSystem/medicationrequest-category#outpatient "Outpatient"
* http://terminology.hl7.org/CodeSystem/medicationrequest-category#community "Community"

ValueSet: T1DMedicationCodeValueSet
Id: t1d-medication-code-valueset
Title: "T1D Medication Code Value Set"
Description: "Medication codes for T1D Exchange"
* ^experimental = false
* http://www.nlm.nih.gov/research/umls/rxnorm#5856 "Insulin"
* http://www.nlm.nih.gov/research/umls/rxnorm#274783 "Insulin glargine"
* http://www.nlm.nih.gov/research/umls/rxnorm#51428 "Insulin lispro"

ValueSet: T1DMedicationRouteValueSet
Id: t1d-medication-route-valueset
Title: "T1D Medication Route Value Set"
Description: "Medication routes for T1D Exchange"
* ^experimental = false
* http://snomed.info/sct#263887005 "Subcutaneous route"
* http://snomed.info/sct#47625008 "Intravenous route"

ValueSet: T1DInsulinDeliveryValueSet
Id: t1d-insulin-delivery-valueset
Title: "T1D Insulin Delivery Value Set"
Description: "Insulin delivery methods for T1D Exchange"
* ^experimental = false
* http://snomed.info/sct#182817000 "Drug injection"
* http://snomed.info/sct#61181002 "Insulin pump"

ValueSet: T1DProviderSpecialtyValueSet
Id: t1d-provider-specialty-valueset
Title: "T1D Provider Specialty Value Set"
Description: "Provider specialty codes for T1D Exchange"
* ^experimental = false
* http://nucc.org/provider-taxonomy#207RE0101X "Endocrinology, Diabetes & Metabolism Physician"
* http://nucc.org/provider-taxonomy#363L00000X "Nurse Practitioner"
* http://nucc.org/provider-taxonomy#207R00000X "Internal Medicine Physician"

ValueSet: T1DOrganizationTypeValueSet
Id: t1d-organization-type-valueset
Title: "T1D Organization Type Value Set"
Description: "Organization type codes for T1D Exchange"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/organization-type#prov "Healthcare Provider"
* http://terminology.hl7.org/CodeSystem/organization-type#dept "Hospital Department"
* http://terminology.hl7.org/CodeSystem/organization-type#team "Organizational team"