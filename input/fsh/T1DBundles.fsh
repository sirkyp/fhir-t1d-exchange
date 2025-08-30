// T1D Exchange Bundle Profiles
// Based on CGM IG bundle patterns for batch data submission

Profile: T1DDataSubmissionBundle
Parent: Bundle
Id: t1d-data-submission-bundle
Title: "T1D Data Submission Bundle"
Description: "Bundle for submitting T1D Exchange data as a transaction. Contains patient demographics, clinical encounters, observations, conditions, and medications related to Type 1 Diabetes care."

* type = #transaction (exactly)
* timestamp 1..1 MS
* entry 1..* MS
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "resource"
  * ^slicing.rules = #open

* entry contains
    patient 0..1 MS and
    provider 0..* MS and
    organization 0..* MS and
    encounter 0..* MS and
    observation 0..* MS and
    condition 0..* MS and
    medication 0..* MS

* entry[patient]
  * resource only T1DPatient
  * resource ^short = "T1D Patient demographics"

* entry[provider]
  * resource only T1DProvider
  * resource ^short = "T1D healthcare providers"

* entry[organization]
  * resource only T1DOrganization
  * resource ^short = "T1D healthcare organizations"

* entry[encounter]
  * resource only T1DEncounter
  * resource ^short = "T1D clinical encounters"

* entry[observation]
  * resource only T1DObservation
  * resource ^short = "T1D observations and measurements"

* entry[condition]
  * resource only T1DCondition
  * resource ^short = "T1D diagnoses and conditions"

* entry[medication]
  * resource only T1DMedicationRequest
  * resource ^short = "T1D medications and treatments"

Profile: T1DPatientDataBundle
Parent: Bundle
Id: t1d-patient-data-bundle
Title: "T1D Patient Data Bundle"
Description: "Bundle containing comprehensive T1D data for a single patient, including demographics, encounters, observations, conditions, and medications."

* type = #collection (exactly)
* timestamp 1..1 MS
* entry 1..* MS
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "resource"
  * ^slicing.rules = #open

* entry contains
    patient 1..1 MS and
    encounter 0..* MS and
    observation 0..* MS and
    condition 0..* MS and
    medication 0..* MS

* entry[patient]
  * resource only T1DPatient
  * resource ^short = "Patient demographics"

* entry[encounter]
  * resource only T1DEncounter
  * resource ^short = "Clinical encounters"

* entry[observation]
  * resource only T1DObservation
  * resource ^short = "T1D observations and measurements"

* entry[condition]
  * resource only T1DCondition
  * resource ^short = "T1D diagnoses and conditions"

* entry[medication]
  * resource only T1DMedicationRequest
  * resource ^short = "Insulin and diabetes medications"

Profile: T1DQualityReportBundle
Parent: Bundle
Id: t1d-quality-report-bundle
Title: "T1D Quality Report Bundle"
Description: "Bundle for T1D Exchange Quality Improvement reporting, containing aggregated data for population health analysis and benchmarking."

* type = #collection (exactly)
* timestamp 1..1 MS
* entry 1..* MS
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "resource"
  * ^slicing.rules = #open

* entry contains
    organization 1..1 MS and
    measureReport 0..* MS and
    observation 0..* MS and
    patient 0..* MS

* entry[organization]
  * resource only T1DOrganization
  * resource ^short = "Reporting organization"

* entry[measureReport]
  * resource only MeasureReport
  * resource ^short = "Quality measure reports"

* entry[observation]
  * resource only T1DObservation
  * resource ^short = "Aggregate observations"

* entry[patient]
  * resource only T1DPatient
  * resource ^short = "De-identified patient data"