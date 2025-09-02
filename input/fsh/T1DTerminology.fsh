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
* #basal-bolus "Basal-Bolus" "Basal-bolus insulin regimen"
* #pump "Insulin Pump" "Insulin pump therapy"
* #mixed "Mixed Insulin" "Mixed insulin regimen"
* #other "Other" "Other insulin regimen type"

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