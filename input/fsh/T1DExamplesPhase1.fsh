// Phase 1 Examples: T1D Diagnosis Date, Hypoglycemia Awareness, Enhanced DKA

Instance: T1DConditionWithDiagnosisDate
InstanceOf: T1DCondition
Usage: #example
Title: "T1D Condition with Diagnosis Date"
Description: "Example T1D condition with diagnosis date extension"
* identifier.system = "http://t1dexchange.org/fhir/identifier/condition-id"
* identifier.value = "cond-12345"
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* code = http://snomed.info/sct#46635009 "Type 1 diabetes mellitus"
* subject = Reference(T1DPatientExample)
* onsetDateTime = "2015-03-15"
* recordedDate = "2015-03-15"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* extension[diagnosisDate].valueDate = "2015-03-15"
* extension[transitionPlan].valueCodeableConcept = http://snomed.info/sct#385651009 "In progress"

Instance: T1DHypoglycemiaAwarenessExample
InstanceOf: T1DHypoglycemiaAwarenessObservation
Usage: #example
Title: "T1D Hypoglycemia Awareness Assessment"
Description: "Example hypoglycemia awareness assessment with symptom threshold"
* identifier.system = "http://t1dexchange.org/fhir/identifier/observation-id"
* identifier.value = "obs-hypo-awareness-001"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#survey
* code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#hypo-sym
* subject = Reference(T1DPatientExample)
* effectiveDateTime = "2024-01-15"
* valueCodeableConcept = http://t1dexchange.org/fhir/CodeSystem/t1d-hypoglycemia-awareness#2 "Partial/Some hypoglycemia unawareness"
* component[symptomThreshold].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#hypo-sym-value
* component[symptomThreshold].valueQuantity = 65 'mg/dL'
* performer = Reference(T1DProviderExample)

Instance: T1DDKAWithLabValues
InstanceOf: T1DDKAObservation
Usage: #example
Title: "T1D DKA Event with Laboratory Values"
Description: "Example DKA observation with serum bicarbonate and blood pH"
* identifier.system = "http://t1dexchange.org/fhir/identifier/observation-id"
* identifier.value = "obs-dka-001"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dka-events-inp
* subject = Reference(T1DPatientExample)
* effectiveDateTime = "2024-01-10"
* valueInteger = 1
* component[serumBicarbonate].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dka-serum-bicarb
* component[serumBicarbonate].valueQuantity = 12.5 'mmol/L'
* component[bloodPH].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dka-blood-ph
* component[bloodPH].valueQuantity = 7.1 '[pH]'
* component[patientReportedInpatient].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dka-events-inp-pro
* component[patientReportedInpatient].valueInteger = 1
* component[patientReportedEventDate].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dka-events-pro-dt
* component[patientReportedEventDate].valueDateTime = "2024-01-10"
* performer = Reference(T1DProviderExample)

Instance: T1DSevereHypoglycemiaExample
InstanceOf: T1DHypoglycemiaObservation
Usage: #example
Title: "T1D Severe Hypoglycemia Event"
Description: "Example severe hypoglycemia event requiring hospitalization"
* identifier.system = "http://t1dexchange.org/fhir/identifier/observation-id"
* identifier.value = "obs-severe-hypo-001"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#sh-events-inp
* subject = Reference(T1DPatientExample)
* effectiveDateTime = "2024-01-05"
* valueInteger = 1
* performer = Reference(T1DProviderExample)