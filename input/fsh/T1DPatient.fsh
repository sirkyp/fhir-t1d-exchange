Profile: T1DPatient
Parent: Patient
Id: t1d-patient
Title: "T1D Exchange Patient"
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

* identifier[t1d-id].type = http://t1dexchange.org/fhir/CodeSystem/t1d-identifier-type#T1D-ID
* identifier[t1d-id].system = "http://t1dexchange.org/fhir/patient-id"
* identifier[t1d-id].value 1..1 MS

* active 1..1 MS
* name 1..* MS
* gender 1..1 MS
* gender from T1DGenderValueSet (required)
* birthDate 1..1 MS

* extension contains
    T1DEducationLevel named educationLevel 0..1 MS

Extension: T1DEducationLevel
Id: t1d-education-level
Title: "T1D Education Level Extension"
Description: "Education level of patient or parent/legal guardian"
* ^context.type = #element
* ^context.expression = "Patient"
* value[x] only CodeableConcept
* valueCodeableConcept from T1DEducationLevelValueSet (required)