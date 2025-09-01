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

* identifier[t1d-encounter-id].type = http://t1dexchange.org/fhir/CodeSystem/t1d-identifier-type#T1D-ENCOUNTER-ID
* identifier[t1d-encounter-id].system = "http://t1dexchange.org/fhir/encounter-id"
* identifier[t1d-encounter-id].value 1..1 MS

* class 1..1 MS
* class from T1DEncounterClassValueSet (required)
* type MS
* type from T1DEncounterTypeValueSet (extensible)
* subject 1..1 MS
* subject only Reference(T1DPatient)
* participant MS
* participant.individual only Reference(T1DProvider)
* period 1..1 MS
* period.start 1..1 MS
* reasonCode MS
* reasonCode from T1DEncounterReasonValueSet (preferred)
* serviceProvider MS
* serviceProvider only Reference(T1DOrganization)

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