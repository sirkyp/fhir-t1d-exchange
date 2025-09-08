// Extended Phase 1 Examples: Remaining T1D-Specific Disease Management Variables

Instance: T1DSevereHypoglycemiaWithPatientReported
InstanceOf: T1DHypoglycemiaObservation
Usage: #example
Title: "T1D Severe Hypoglycemia with Patient Reported Events"
Description: "Example severe hypoglycemia observation with patient-reported components"
* identifier.system = "http://t1dexchange.org/fhir/identifier/observation-id"
* identifier.value = "obs-severe-hypo-pro-001"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#sh-events-inp
* subject = Reference(T1DPatientExample)
* effectiveDateTime = "2024-01-05"
* valueInteger = 1
* component[patientReportedAmbulatory].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#sh-events-amb-pro
* component[patientReportedAmbulatory].valueInteger = 2
* component[patientReportedInpatient].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#sh-events-inp-pro
* component[patientReportedInpatient].valueInteger = 1
* performer = Reference(T1DProviderExample)

Instance: T1DDKAWithAmbulatoryEvents
InstanceOf: T1DDKAObservation
Usage: #example
Title: "T1D DKA with Ambulatory Events"
Description: "Example DKA observation including ambulatory events"
* identifier.system = "http://t1dexchange.org/fhir/identifier/observation-id"
* identifier.value = "obs-dka-amb-001"
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
* component[ambulatoryEvents].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dka-events-amb
* component[ambulatoryEvents].valueInteger = 2
* performer = Reference(T1DProviderExample)

Instance: T1DFluVaccineScreening
InstanceOf: T1DCareScreeningObservation
Usage: #example
Title: "T1D Flu Vaccine Screening"
Description: "Example flu vaccine date screening"
* identifier.system = "http://t1dexchange.org/fhir/identifier/observation-id"
* identifier.value = "obs-flu-001"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#exam
* code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#flu-dt
* subject = Reference(T1DPatientExample)
* effectiveDateTime = "2024-01-15"
* valueDateTime = "2023-10-15"
* performer = Reference(T1DProviderExample)

Instance: T1DEyeExamScreening
InstanceOf: T1DCareScreeningObservation
Usage: #example
Title: "T1D Eye Exam Screening"
Description: "Example eye exam date screening"
* identifier.system = "http://t1dexchange.org/fhir/identifier/observation-id"
* identifier.value = "obs-eye-001"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#exam
* code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#eye-exam-dt
* subject = Reference(T1DPatientExample)
* effectiveDateTime = "2024-01-15"
* valueDateTime = "2023-08-20"
* performer = Reference(T1DProviderExample)

Instance: T1DFootExamScreening
InstanceOf: T1DCareScreeningObservation
Usage: #example
Title: "T1D Foot Exam Screening"
Description: "Example foot exam date screening"
* identifier.system = "http://t1dexchange.org/fhir/identifier/observation-id"
* identifier.value = "obs-foot-001"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#exam
* code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#foot-exam-dt
* subject = Reference(T1DPatientExample)
* effectiveDateTime = "2024-01-15"
* valueDateTime = "2023-12-10"
* performer = Reference(T1DProviderExample)

Instance: T1DDentalExamScreening
InstanceOf: T1DCareScreeningObservation
Usage: #example
Title: "T1D Dental Exam Screening"
Description: "Example dental exam date screening"
* identifier.system = "http://t1dexchange.org/fhir/identifier/observation-id"
* identifier.value = "obs-dental-001"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#exam
* code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#dental-exam-dt
* subject = Reference(T1DPatientExample)
* effectiveDateTime = "2024-01-15"
* valueDateTime = "2023-11-05"
* performer = Reference(T1DProviderExample)

Instance: T1DTransportationInsecurityScreening
InstanceOf: T1DSDOHScreeningObservation
Usage: #example
Title: "T1D Transportation Insecurity Screening"
Description: "Example transportation insecurity screening"
* identifier.system = "http://t1dexchange.org/fhir/identifier/observation-id"
* identifier.value = "obs-transport-001"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#social-history
* code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#transportation-insecurity
* subject = Reference(T1DPatientExample)
* effectiveDateTime = "2024-01-15"
* valueCodeableConcept = http://t1dexchange.org/fhir/CodeSystem/t1d-sdoh-responses#sometimes-true "Sometimes true"
* performer = Reference(T1DProviderExample)

Instance: T1DHousingInsecurityScreening
InstanceOf: T1DSDOHScreeningObservation
Usage: #example
Title: "T1D Housing Insecurity Screening"
Description: "Example housing insecurity screening"
* identifier.system = "http://t1dexchange.org/fhir/identifier/observation-id"
* identifier.value = "obs-housing-001"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#social-history
* code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#housing-insecurity
* subject = Reference(T1DPatientExample)
* effectiveDateTime = "2024-01-15"
* valueCodeableConcept = http://t1dexchange.org/fhir/CodeSystem/t1d-sdoh-responses#never-true "Never true"
* performer = Reference(T1DProviderExample)