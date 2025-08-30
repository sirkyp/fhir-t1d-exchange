// Example Instances for T1D Exchange IG

Instance: T1DPatientExample
InstanceOf: T1DPatient
Usage: #example
Title: "T1D Patient Example"
Description: "Example of a T1D Exchange patient"
* identifier[t1d-id].system = "http://t1dexchange.org/fhir/patient-id"
* identifier[t1d-id].value = "T1D-12345"
* identifier[mrn].system = "http://hospital.example.org/mrn"
* identifier[mrn].value = "MRN-67890"
* active = true
* name.family = "Smith"
* name.given = "John"
* gender = #male
* birthDate = "2010-05-15"

* extension[educationLevel].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-EducationLevel|3.0.0#ELEM "Elementary School"

Instance: T1DProviderExample
InstanceOf: T1DProvider
Usage: #example
Title: "T1D Provider Example"
Description: "Example of a T1D Exchange provider"
* identifier[t1d-provider-id].system = "http://t1dexchange.org/fhir/provider-id"
* identifier[t1d-provider-id].value = "PROV-12345"
* identifier[npi].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[npi].value = "1234567890"
* active = true
* name.family = "Johnson"
* name.given = "Sarah"
* name.prefix = "Dr."
* gender = #female
* qualification.code = http://nucc.org/provider-taxonomy#207RE0101X "Endocrinology, Diabetes & Metabolism Physician"

Instance: T1DOrganizationExample
InstanceOf: T1DOrganization
Usage: #example
Title: "T1D Organization Example"
Description: "Example of a T1D Exchange organization"
* identifier[t1d-org-id].system = "http://t1dexchange.org/fhir/organization-id"
* identifier[t1d-org-id].value = "ORG-12345"
* active = true
* type = http://terminology.hl7.org/CodeSystem/organization-type#prov "Healthcare Provider"
* name = "Children's Diabetes Center"
* telecom.system = #phone
* telecom.value = "555-123-4567"

Instance: T1DEncounterExample
InstanceOf: T1DEncounter
Usage: #example
Title: "T1D Encounter Example"
Description: "Example of a T1D Exchange encounter"
* identifier[t1d-encounter-id].system = "http://t1dexchange.org/fhir/encounter-id"
* identifier[t1d-encounter-id].value = "ENC-12345"
* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"
* type = http://snomed.info/sct#390906007 "Follow-up encounter"
* subject = Reference(Patient/T1DPatientExample)
* participant.individual = Reference(Practitioner/T1DProviderExample)
* period.start = "2024-01-15T09:00:00Z"
* period.end = "2024-01-15T09:30:00Z"
* reasonCode = http://snomed.info/sct#46635009 "Type 1 diabetes mellitus"
* serviceProvider = Reference(Organization/T1DOrganizationExample)
* extension[encounterLocation].valueString = "Exam Room 3"
* extension[encounterDuration].valueQuantity.value = 30
* extension[encounterDuration].valueQuantity.unit = "min"
* extension[encounterDuration].valueQuantity.system = "http://unitsofmeasure.org"

Instance: T1DGlucoseObservationExample
InstanceOf: T1DGlucoseObservation
Usage: #example
Title: "T1D Glucose Observation Example"
Description: "Example of a glucose observation for T1D patient"
* status = #final
* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code = http://loinc.org#2339-0 "Glucose [Mass/volume] in Blood"
* subject = Reference(Patient/T1DPatientExample)
* encounter = Reference(Encounter/T1DEncounterExample)
* effectiveDateTime = "2024-01-15T09:15:00Z"
* performer = Reference(Practitioner/T1DProviderExample)
* valueQuantity.value = 150
* valueQuantity.unit = "mg/dL"
* valueQuantity.system = "http://unitsofmeasure.org"
* component[bgmMean].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#bgm-mean
* component[bgmMean].valueQuantity.value = 145
* component[bgmMean].valueQuantity.unit = "mg/dL"
* component[bgmMean].valueQuantity.system = "http://unitsofmeasure.org"

Instance: T1DHbA1cObservationExample
InstanceOf: T1DHbA1cObservation
Usage: #example
Title: "T1D HbA1c Observation Example"
Description: "Example of an HbA1c observation for T1D patient"
* status = #final
* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code = http://loinc.org#4548-4 "Hemoglobin A1c/Hemoglobin.total in Blood"
* subject = Reference(Patient/T1DPatientExample)
* encounter = Reference(Encounter/T1DEncounterExample)
* effectiveDateTime = "2024-01-15T09:15:00Z"
* performer = Reference(Practitioner/T1DProviderExample)
* valueQuantity.value = 7.2
* valueQuantity.unit = "%"
* valueQuantity.system = "http://unitsofmeasure.org"

Instance: T1DConditionExample
InstanceOf: T1DCondition
Usage: #example
Title: "T1D Condition Example"
Description: "Example of a T1D condition"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* code = http://snomed.info/sct#46635009 "Type 1 diabetes mellitus"
* subject = Reference(Patient/T1DPatientExample)
* encounter = Reference(Encounter/T1DEncounterExample)
* onsetDateTime = "2010-08-20"
* recordedDate = "2024-01-15"
* recorder = Reference(Practitioner/T1DProviderExample)
* extension[diagnosisDate].valueDate = "2010-08-20"
* extension[transitionPlan].valueCodeableConcept = http://snomed.info/sct#182836005 "Medication review"

Instance: T1DMedicationRequestExample
InstanceOf: T1DMedicationRequest
Usage: #example
Title: "T1D Medication Request Example"
Description: "Example of an insulin medication request"
* status = #active
* intent = #order
* medicationCodeableConcept.coding.system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* medicationCodeableConcept.coding.code = #253182
* medicationCodeableConcept.coding.display = "insulin, regular, human"
* subject = Reference(Patient/T1DPatientExample)
* encounter = Reference(Encounter/T1DEncounterExample)
* authoredOn = "2024-01-15"
* requester = Reference(Practitioner/T1DProviderExample)
* dosageInstruction.timing.repeat.frequency = 4
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.route = http://snomed.info/sct#263887005 "Subcutaneous"
* dosageInstruction.doseAndRate.doseQuantity.value = 10
* dosageInstruction.doseAndRate.doseQuantity.unit = "units"
* extension[insulinRegimen].valueCodeableConcept = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#basal-bolus
* extension[deliveryMethod].valueCodeableConcept = http://snomed.info/sct#61968008

Instance: T1DObservationExample
InstanceOf: T1DObservation
Usage: #example
Title: "T1D Observation Example"
Description: "Example of a base T1D observation"
* status = #final
* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#bgm-company
* subject = Reference(Patient/T1DPatientExample)
* encounter = Reference(Encounter/T1DEncounterExample)
* effectiveDateTime = "2024-01-15T09:15:00Z"
* performer = Reference(Practitioner/T1DProviderExample)
* valueString = "Dexcom"

Instance: T1DSDOHObservationExample
InstanceOf: T1DSDOHObservation
Usage: #example
Title: "T1D SDOH Observation Example"
Description: "Example of a social determinants of health observation"
* status = #final
* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#social-history
* code = http://loinc.org#93030-5 "Has lack of transportation kept you from medical appointments, meetings, work, or from getting things needed for daily living"
* subject = Reference(Patient/T1DPatientExample)
* encounter = Reference(Encounter/T1DEncounterExample)
* effectiveDateTime = "2024-01-15T09:15:00Z"
* performer = Reference(Practitioner/T1DProviderExample)
* valueCodeableConcept = http://loinc.org#LA32-8 "No"

Instance: T1DFamilyHistoryExample
InstanceOf: T1DFamilyHistory
Usage: #example
Title: "T1D Family History Example"
Description: "Example of family history for T1D patient"
* status = #completed
* patient = Reference(Patient/T1DPatientExample)
* date = "2024-01-15"
* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode|3.0.0#FTH "father"
* condition.code = http://snomed.info/sct#44054006 "Type 2 diabetes mellitus"
* condition.onsetAge.value = 45
* condition.onsetAge.unit = "a"
* condition.onsetAge.system = "http://unitsofmeasure.org"
* condition.onsetAge.code = #a

Instance: T1DMedicationStatementExample
InstanceOf: T1DMedicationStatement
Usage: #example
Title: "T1D Medication Statement Example"
Description: "Example of current T1D medication documentation"
* status = #active
* medicationCodeableConcept.coding.system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* medicationCodeableConcept.coding.code = #274783
* medicationCodeableConcept.coding.display = "insulin glargine"
* subject = Reference(Patient/T1DPatientExample)
* context = Reference(Encounter/T1DEncounterExample)
* effectiveDateTime = "2024-01-15"
* informationSource = Reference(Practitioner/T1DProviderExample)
* dosage.timing.repeat.frequency = 3
* dosage.timing.repeat.period = 1
* dosage.timing.repeat.periodUnit = #d
* dosage.route = http://snomed.info/sct#263887005 "Subcutaneous"
* dosage.doseAndRate.doseQuantity.value = 8
* dosage.doseAndRate.doseQuantity.unit = "units"