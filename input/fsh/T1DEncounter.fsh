Profile: T1DEncounter
Parent: Encounter
Id: t1d-encounter
Title: "T1D Encounter"
Description: "Encounter profile for T1D Exchange patient interactions with healthcare providers"

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains
    t1d-encounter-id 1..1 MS

* identifier[t1d-encounter-id] ^definition = "Assign a unique encounter number for each unique patient encounter. The encounter number must remain consistent across all files which contain that encounter and across all data submissions."
* identifier[t1d-encounter-id] ^short = "Unique encounter number for each patient encounter"
* identifier[t1d-encounter-id] ^comment = "Priority: High | Notes: Epic users: For data elements that are found at the billing record level, please use the HAR value as the encounter number. For data elements at the EHR record level, please use the CSN value as the encounter number. A tag ID of TEN0999 will be created to hold the link between the HAR value and all associated CSN values."
* identifier[t1d-encounter-id].type = http://t1dexchange.org/fhir/CodeSystem/t1d-identifier-type#T1D-ENCOUNTER-ID
* identifier[t1d-encounter-id].system = "http://t1dexchange.org/fhir/encounter-id"
* identifier[t1d-encounter-id].value 1..1 MS

* class 1..1 MS
* class ^definition = "Classification of the encounter"
* class ^short = "Classification of the encounter"
* class ^comment = "Priority: High"
* class from T1DEncounterClassValueSet (required)

* type MS
* type from T1DEncounterTypeValueSet (extensible)

* subject 1..1 MS
* subject ^definition = "Patient identifier that the encounter applies to from the patient's file."
* subject ^short = "Patient identifier from patient file"
* subject ^comment = "Priority: High"
* subject only Reference(T1DPatient)

* participant MS
* participant.individual ^definition = "Provider ID(s) for an individual or entity defined in the provider file relevant to this encounter."
* participant.individual ^short = "Provider ID from provider file"
* participant.individual ^comment = "Priority: High"
* participant.individual only Reference(T1DProvider)

* period 1..1 MS
* period.start 1..1 MS
* period.start ^definition = "Date of the visit being documented"
* period.start ^short = "Date of the visit"
* period.start ^comment = "Priority: High"

* reasonCode MS
* reasonCode ^definition = "Reason for encounter coded using code system specified in encounter_reason_code_type field and when presenting multiple values should map 1:1."
* reasonCode ^short = "Reason for encounter coded"
* reasonCode ^comment = "Priority: High"
* reasonCode from T1DEncounterReasonValueSet (preferred)

* serviceProvider MS
* serviceProvider only Reference(T1DOrganization)

* status ^definition = "The status of the encounter record. Encounters should start with a status of planned and then diverge from there to their final status."
* status ^short = "Status of the encounter record"
* status ^comment = "Priority: High"

* extension contains
    T1DEncounterLocation named encounterLocation 0..1 MS and
    T1DEncounterDuration named encounterDuration 0..1 MS

Extension: T1DEncounterLocation
Id: t1d-encounter-location
Title: "T1D Encounter Location Extension"
Description: "Specific location information for T1D encounters"
* ^context.type = #element
* ^context.expression = "Encounter"
* value[x] only string

Extension: T1DEncounterDuration
Id: t1d-encounter-duration
Title: "T1D Encounter Duration Extension"
Description: "Duration of the encounter in minutes"
* ^context.type = #element
* ^context.expression = "Encounter"
* value[x] only Quantity
* valueQuantity.unit = "min"
* valueQuantity.system = "http://unitsofmeasure.org"