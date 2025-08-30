// T1D Bundle Examples with UUID References

Instance: t1d-data-submission-example
InstanceOf: T1DDataSubmissionBundle
Usage: #example
Title: "T1D Data Submission Bundle Example"
Description: "Example of a complete T1D data submission bundle"

* type = #transaction
* timestamp = "2024-01-15T10:30:00Z"

* entry[0]
  * fullUrl = "urn:uuid:12345678-1234-5678-9abc-123456789abc"
  * resource
    * resourceType = "Patient"
    * id = "T1DPatientExample"
    * meta.profile = "http://t1dexchange.org/fhir/StructureDefinition/t1d-patient"
    * identifier[0].type = http://t1dexchange.org/fhir/CodeSystem/t1d-identifier-type#T1D-ID
    * identifier[0].system = "http://t1dexchange.org/fhir/patient-id"
    * identifier[0].value = "T1D-12345"
    * identifier[1].type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
    * identifier[1].system = "http://hospital.example.org/mrn"
    * identifier[1].value = "MRN-67890"
    * active = true
    * name.family = "Smith"
    * name.given = "John"
    * gender = #male
    * birthDate = "2010-05-15"
  * request
    * method = #POST
    * url = "Patient"
    * ifNoneExist = "identifier=http://t1dexchange.org/patient-id|T1D-001"

* entry[+]
  * fullUrl = "urn:uuid:12345678-1234-5678-9abc-123456789abd"
  * resource
    * resourceType = "Encounter"
    * id = "T1DEncounterExample"
    * meta.profile = "http://t1dexchange.org/fhir/StructureDefinition/t1d-encounter"
    * identifier[0].type = http://t1dexchange.org/fhir/CodeSystem/t1d-identifier-type#T1D-ENCOUNTER-ID
    * identifier[0].system = "http://t1dexchange.org/fhir/encounter-id"
    * identifier[0].value = "ENC-12345"
    * status = #finished
    * class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB
    * subject = Reference(urn:uuid:12345678-1234-5678-9abc-123456789abc)
    * period.start = "2024-01-15T09:00:00Z"
    * period.end = "2024-01-15T09:30:00Z"
  * request
    * method = #POST
    * url = "Encounter"

* entry[+]
  * fullUrl = "urn:uuid:12345678-1234-5678-9abc-123456789abe"
  * resource
    * resourceType = "Observation"
    * id = "T1DGlucoseObservationExample"
    * meta.profile = "http://t1dexchange.org/fhir/StructureDefinition/t1d-glucose-observation"
    * status = #final
    * category[0] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
    * code = http://loinc.org#2339-0
    * subject = Reference(urn:uuid:12345678-1234-5678-9abc-123456789abc)
    * encounter = Reference(urn:uuid:12345678-1234-5678-9abc-123456789abd)
    * effectiveDateTime = "2024-01-15T09:15:00Z"
    * valueQuantity.value = 150
    * valueQuantity.unit = "mg/dL"
    * valueQuantity.system = "http://unitsofmeasure.org"
    * performer = Reference(urn:uuid:12345678-1234-5678-9abc-123456789ac2)
  * request
    * method = #POST
    * url = "Observation"

* entry[+]
  * fullUrl = "urn:uuid:12345678-1234-5678-9abc-123456789abf"
  * resource
    * resourceType = "Observation"
    * id = "T1DHbA1cObservationExample"
    * meta.profile = "http://t1dexchange.org/fhir/StructureDefinition/t1d-hba1c-observation"
    * status = #final
    * category[0] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
    * code.coding.system = "http://loinc.org"
    * code.coding.code = #4548-4
    * code.coding.display = "Hemoglobin A1c/Hemoglobin.total in Blood"
    * subject = Reference(urn:uuid:12345678-1234-5678-9abc-123456789abc)
    * encounter = Reference(urn:uuid:12345678-1234-5678-9abc-123456789abd)
    * effectiveDateTime = "2024-01-15T09:15:00Z"
    * valueQuantity.value = 7.2
    * valueQuantity.unit = "%"
    * valueQuantity.system = "http://unitsofmeasure.org"
    * performer = Reference(urn:uuid:12345678-1234-5678-9abc-123456789ac2)
  * request
    * method = #POST
    * url = "Observation"

* entry[+]
  * fullUrl = "urn:uuid:12345678-1234-5678-9abc-123456789ac0"
  * resource
    * resourceType = "Condition"
    * id = "T1DConditionExample"
    * meta.profile = "http://t1dexchange.org/fhir/StructureDefinition/t1d-condition"
    * clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
    * verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
    * category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
    * code = http://snomed.info/sct#46635009
    * subject = Reference(urn:uuid:12345678-1234-5678-9abc-123456789abc)
    * encounter = Reference(urn:uuid:12345678-1234-5678-9abc-123456789abd)
    * onsetDateTime = "2010-08-20"
  * request
    * method = #POST
    * url = "Condition"

* entry[+]
  * fullUrl = "urn:uuid:12345678-1234-5678-9abc-123456789ac1"
  * resource
    * resourceType = "MedicationRequest"
    * id = "T1DMedicationRequestExample"
    * meta.profile = "http://t1dexchange.org/fhir/StructureDefinition/t1d-medication-request"
    * status = #active
    * intent = #order
    * medicationCodeableConcept.coding.system = "http://www.nlm.nih.gov/research/umls/rxnorm"
    * medicationCodeableConcept.coding.code = #253182
    * subject = Reference(urn:uuid:12345678-1234-5678-9abc-123456789abc)
    * encounter = Reference(urn:uuid:12345678-1234-5678-9abc-123456789abd)
    * authoredOn = "2024-01-15"
  * request
    * method = #POST
    * url = "MedicationRequest"

* entry[+]
  * fullUrl = "urn:uuid:12345678-1234-5678-9abc-123456789ac2"
  * resource
    * resourceType = "Practitioner"
    * id = "T1DProviderExampleBundle"
    * meta.profile = "http://t1dexchange.org/fhir/StructureDefinition/t1d-provider"
    * identifier[0].type = http://t1dexchange.org/fhir/CodeSystem/t1d-identifier-type#T1D-PROVIDER-ID
    * identifier[0].system = "http://t1dexchange.org/fhir/provider-id"
    * identifier[0].value = "PROV-12345"
    * active = true
    * name.family = "Johnson"
    * name.given = "Sarah"
    * qualification.code = http://terminology.hl7.org/CodeSystem/v2-0360#MD
  * request
    * method = #POST
    * url = "Practitioner"

Instance: t1d-patient-data-example
InstanceOf: T1DPatientDataBundle
Usage: #example
Title: "T1D Patient Data Bundle Example"
Description: "Example of comprehensive T1D data for a single patient"

* type = #collection
* timestamp = "2024-01-15T10:30:00Z"

* entry[0]
  * fullUrl = "http://example.org/Patient/T1DPatientExample"
  * resource = T1DPatientExample

* entry[+]
  * fullUrl = "http://example.org/Encounter/T1DEncounterExample"
  * resource = T1DEncounterExample

* entry[+]
  * fullUrl = "http://example.org/Observation/T1DGlucoseObservationExample"
  * resource = T1DGlucoseObservationExample

* entry[+]
  * fullUrl = "http://example.org/Observation/T1DHbA1cObservationExample"
  * resource = T1DHbA1cObservationExample

* entry[+]
  * fullUrl = "http://example.org/Observation/T1DSDOHObservationExample"
  * resource = T1DSDOHObservationExample

* entry[+]
  * fullUrl = "http://example.org/Condition/T1DConditionExample"
  * resource = T1DConditionExample

* entry[+]
  * fullUrl = "http://example.org/MedicationRequest/T1DMedicationRequestExample"
  * resource = T1DMedicationRequestExample

Instance: t1d-quality-report-example
InstanceOf: T1DQualityReportBundle
Usage: #example
Title: "T1D Quality Report Bundle Example"
Description: "Example of T1D quality improvement reporting bundle"

* type = #collection
* timestamp = "2024-01-31T23:59:59Z"

* entry[0]
  * fullUrl = "http://example.org/Organization/T1DOrganizationExample"
  * resource = T1DOrganizationExample

* entry[+]
  * fullUrl = "http://example.org/MeasureReport/t1d-measure-report-example"
  * resource = t1d-measure-report-example

Instance: t1d-measure-report-example
InstanceOf: MeasureReport
Usage: #example
Title: "T1D HbA1c Control Measure Report"
Description: "Example quality measure report for HbA1c control"

* status = #complete
* type = #summary
* period
  * start = "2023-10-01"
  * end = "2023-12-31"
* reporter = Reference(T1DOrganizationExample)
* measure = "http://example.org/Measure/hba1c-control"
* group
  * population[0]
    * code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
    * count = 250
  * population[+]
    * code = http://terminology.hl7.org/CodeSystem/measure-population#numerator
    * count = 175
  * population[+]
    * code = http://terminology.hl7.org/CodeSystem/measure-population#denominator
    * count = 250
  * measureScore
    * value = 0.70