Profile: T1DPatient
Parent: Patient
Id: t1d-patient
Title: "T1D Patient"
Description: "Patient profile for T1D Exchange data collection including demographics and T1D-specific information"

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains
    mrn 0..1 MS and
    t1d-id 1..1 MS

* identifier[mrn].type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
* identifier[mrn].system 1..1 MS
* identifier[mrn].value 1..1 MS

* identifier[t1d-id] ^definition = "Unique patient identifier across all admissions, outpatient visits, etc. that does not change over time and is consistent with other data submissions."
* identifier[t1d-id] ^short = "Unique patient identifier across all encounters"
* identifier[t1d-id] ^comment = "Priority: High | Notes: Assign and use the same encrypted ID for each patient within and across all tables. The encrypted ID should not contain any PHI (e.g., SSN, DOB, MRN, etc.). Maintain a secure crosswalk of encrypted IDs to actual patient identifiers at each site that crosses all T1D Exchange Quality Improvement initiatives. Example: The same encrypted IDs should be used on patient's that cross multiple cohort/project data submissions so they may be identified as the same patient."
* identifier[t1d-id].type = http://t1dexchange.org/fhir/CodeSystem/t1d-identifier-type#T1D-ID
* identifier[t1d-id].system = "http://t1dexchange.org/fhir/patient-id"
* identifier[t1d-id].value 1..1 MS

* active 1..1 MS
* name 1..* MS

* gender 1..1 MS
* gender ^definition = "Gender (technically, sex) of the respective patient"
* gender ^short = "Gender of the patient"
* gender ^comment = "Priority: High"
* gender from T1DGenderValueSet (required)

* birthDate 1..1 MS
* birthDate ^definition = "Date of birth of the respective patient"
* birthDate ^short = "Date of birth of patient"
* birthDate ^comment = "Priority: High"

// T1D Extensions
* extension contains
    T1DRace named race 0..2 MS and
    T1DEthnicity named ethnicity 0..1 MS and
    T1DEducationLevel named educationLevel 0..1 MS and
    T1DLanguage named language 0..1 MS and
    T1DPrimaryInsurance named primaryInsurance 0..1 MS

* extension[race] ^definition = "Race based on common NIH categories using HL7 standards"
* extension[race] ^short = "Race based on NIH categories"
* extension[race] ^comment = "Priority: High"

* extension[ethnicity] ^definition = "Ethnicity based on common NIH categories using HL7 standards"
* extension[ethnicity] ^short = "Ethnicity based on NIH categories"
* extension[ethnicity] ^comment = "Priority: High"

// Address for postal code
* address 0..* MS
* address.postalCode 0..1 MS
* address.postalCode ^definition = "Five character postal code of the respective patient's primary address, sent with leading zeros as alphanumeric values"
* address.postalCode ^short = "Five character postal code"
* address.postalCode ^comment = "Priority: High"

// Death information
* deceased[x] 0..1 MS
* deceased[x] ^definition = "Death date of the respective patient if patient has expired"
* deceased[x] ^short = "Death date if patient expired"
* deceased[x] ^comment = "Priority: Low"

Extension: T1DEducationLevel
Id: t1d-education-level
Title: "T1D Education Level Extension"
Description: "Highest level of education of patient/Parents or Legal guardian of patient"
* ^context.type = #element
* ^context.expression = "Patient"
* value[x] only CodeableConcept
* valueCodeableConcept from T1DEducationLevelValueSet (required)
* valueCodeableConcept ^definition = "Highest level of education of patient/ Parents or Legal guardian of patient"
* valueCodeableConcept ^short = "Highest education level of patient/guardian"
* valueCodeableConcept ^comment = "Priority: Low"

Extension: T1DLanguage
Id: t1d-language
Title: "T1D Language Extension"
Description: "The ISO-639-1 alpha 2 code in lower case for the language the patient speaks"
* ^context.type = #element
* ^context.expression = "Patient"
* value[x] only CodeableConcept
* valueCodeableConcept from T1DLanguageValueSet (required)
* valueCodeableConcept ^definition = "The ISO-639-1 alpha 2 code in lower case for the language the patient's speaks."
* valueCodeableConcept ^short = "ISO-639-1 language code"
* valueCodeableConcept ^comment = "Priority: Low"

Extension: T1DRace
Id: t1d-race
Title: "T1D Race Extension"
Description: "Race based on common NIH categories using HL7 standards"
* ^context.type = #element
* ^context.expression = "Patient"
* value[x] only CodeableConcept
* valueCodeableConcept from T1DRaceValueSet (required)
* valueCodeableConcept ^definition = "Race based on common NIH categories using HL7 standards available here"
* valueCodeableConcept ^short = "Race based on NIH categories"
* valueCodeableConcept ^comment = "Priority: High"

Extension: T1DEthnicity
Id: t1d-ethnicity
Title: "T1D Ethnicity Extension"
Description: "Ethnicity based on common NIH categories using HL7 standards"
* ^context.type = #element
* ^context.expression = "Patient"
* value[x] only CodeableConcept
* valueCodeableConcept from T1DEthnicityValueSet (required)
* valueCodeableConcept ^definition = "Ethnicity based on common NIH categories using HL7 standards available here."
* valueCodeableConcept ^short = "Ethnicity based on NIH categories"
* valueCodeableConcept ^comment = "Priority: High"

Extension: T1DPrimaryInsurance
Id: t1d-primary-insurance
Title: "T1D Primary Insurance Extension"
Description: "Primary insurance type for patient coverage"
* ^context.type = #element
* ^context.expression = "Patient"
* value[x] only CodeableConcept
* valueCodeableConcept from T1DInsuranceTypeValueSet (required)
* valueCodeableConcept ^definition = "Primary insurance type"
* valueCodeableConcept ^short = "Primary insurance type"
* valueCodeableConcept ^comment = "Priority: High"