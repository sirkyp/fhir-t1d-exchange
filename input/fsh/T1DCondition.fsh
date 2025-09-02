Profile: T1DCondition
Parent: Condition
Id: t1d-condition
Title: "T1D Condition"
Description: "Condition profile for T1D Exchange including diabetes and related conditions"

* identifier MS
* identifier ^definition = "Unique condition ID for each unique patient condition. The condition ID must remain consistent across all files which contain that condition and across all data submissions."
* identifier ^short = "Unique condition ID for each patient condition"
* identifier ^comment = "Priority: High | Notes: If no adequate value is provided by the EMR system then the below method can be used to generate the condition_id. hash(patient_id+ICD10Code+onset_date)"

* category 1..* MS
* category ^definition = "Type of condition"
* category ^short = "Type of condition"
* category ^comment = "Priority: Low"
* category from T1DConditionCategoryValueSet (required)

* code 1..1 MS
* code ^definition = "Identification of the condition, problem or diagnosis."
* code ^short = "Identification of the condition, problem or diagnosis"
* code ^comment = "Priority: High"
* code from T1DConditionCodeValueSet (preferred)

* subject 1..1 MS
* subject ^definition = "Patient identifier that the condition applies to from the patient's file."
* subject ^short = "Patient identifier from patient file"
* subject ^comment = "Priority: High"
* subject only Reference(T1DPatient)

* encounter MS
* encounter ^definition = "Encounter identifier for when the condition was asserted from the encounters file"
* encounter ^short = "Encounter identifier when condition asserted"
* encounter ^comment = "Priority: Low | Notes: Provide when available"
* encounter only Reference(T1DEncounter)

* onset[x] MS
* onset[x] ^definition = "Estimated or actual date for condition onset."
* onset[x] ^short = "Estimated or actual onset date"
* onset[x] ^comment = "Priority: low"

* recordedDate ^definition = "Date when condition was first entered."
* recordedDate ^short = "Date when condition first entered"
* recordedDate ^comment = "Priority: low"

* clinicalStatus ^definition = "Status of the reported condition."
* clinicalStatus ^short = "Status of the reported condition"
* clinicalStatus ^comment = "Priority: Low"

* verificationStatus ^definition = "Verification status of the reported condition."
* verificationStatus ^short = "Verification status of reported condition"
* verificationStatus ^comment = "Priority: Low"

* extension contains
    T1DDiagnosisDate named diagnosisDate 0..1 MS and
    T1DTransitionPlan named transitionPlan 0..1 MS

Extension: T1DDiagnosisDate
Id: t1d-diagnosis-date
Title: "T1D Diagnosis Date Extension"
Description: "Date of Type 1 diabetes diagnosis"
* ^context.type = #element
* ^context.expression = "Condition"
* value[x] only date

Extension: T1DTransitionPlan
Id: t1d-transition-plan
Title: "T1D Transition Plan Extension"
Description: "Documented transition plan from pediatric to adult care"
* ^context.type = #element
* ^context.expression = "Condition"
* value[x] only CodeableConcept
* valueCodeableConcept from T1DTransitionPlanValueSet (required)

Profile: T1DFamilyHistory
Parent: FamilyMemberHistory
Id: t1d-family-history
Title: "T1D Family History"
Description: "Family history profile for diabetes and related conditions"

* patient 1..1 MS
* patient only Reference(T1DPatient)
* relationship 1..1 MS
* relationship from T1DFamilyRelationshipValueSet (required)
* condition MS
* condition.code from T1DFamilyHistoryConditionValueSet (preferred)
* condition.onset[x] MS