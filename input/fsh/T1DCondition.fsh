Profile: T1DCondition
Parent: Condition
Id: t1d-condition
Title: "T1D Exchange Condition"
Description: "Condition profile for T1D Exchange including diabetes and related conditions"

* identifier MS
* clinicalStatus 1..1 MS
* verificationStatus 1..1 MS
* category 1..* MS
* category from T1DConditionCategoryValueSet (required)
* severity MS
* code 1..1 MS
* code from T1DConditionCodeValueSet (preferred)
* subject 1..1 MS
* subject only Reference(T1DPatient)
* encounter MS
* encounter only Reference(T1DEncounter)
* onset[x] MS
* recordedDate MS
* recorder MS
* recorder only Reference(T1DProvider)
* asserter MS
* asserter only Reference(T1DProvider or T1DPatient)

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

* status 1..1 MS
* patient 1..1 MS
* patient only Reference(T1DPatient)
* date MS
* relationship 1..1 MS
* relationship from T1DFamilyRelationshipValueSet (required)
* condition MS
* condition.code from T1DFamilyHistoryConditionValueSet (preferred)
* condition.onset[x] MS