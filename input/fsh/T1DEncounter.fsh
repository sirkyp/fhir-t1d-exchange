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

* period.end MS
* period.end ^definition = "Time of the visit being documented in 24 hour format"
* period.end ^short = "Time of the visit"
* period.end ^comment = "Priority: Low"

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
    T1DEncounterDuration named encounterDuration 0..1 MS and
    T1DEncounterTime named encounterTime 0..1 MS and
    T1DStatusActor named statusActor 0..1 MS and
    T1DStatusReason named statusReason 0..1 MS and
    T1DEncounterReasonCodeType named encounterReasonCodeType 0..* MS and
    T1DEndoVisit named endoVisit 0..1 MS

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

Extension: T1DEncounterTime
Id: t1d-encounter-time
Title: "T1D Encounter Time Extension"
Description: "Time of the visit being documented in 24 hour format"
* ^context.type = #element
* ^context.expression = "Encounter"
* value[x] only time
* valueTime ^definition = "Time of the visit being documented in 24 hour format"
* valueTime ^short = "Time of visit in HHMM format"
* valueTime ^comment = "Priority: Low"

Extension: T1DStatusActor
Id: t1d-status-actor
Title: "T1D Status Actor Extension"
Description: "The actor that is responsible for the current status"
* ^context.type = #element
* ^context.expression = "Encounter"
* value[x] only CodeableConcept
* valueCodeableConcept from T1DStatusActorValueSet (required)
* valueCodeableConcept ^definition = "The actor that is responsible for the current status. This is not the party responsible for changing the status; that would almost universally be the provider. Rather, this is the person responsible FOR the status."
* valueCodeableConcept ^short = "Actor responsible for current status"
* valueCodeableConcept ^comment = "Priority: Low"

Extension: T1DStatusReason
Id: t1d-status-reason
Title: "T1D Status Reason Extension"
Description: "The reason for the current status"
* ^context.type = #element
* ^context.expression = "Encounter"
* value[x] only CodeableConcept
* valueCodeableConcept from T1DStatusReasonValueSet (required)
* valueCodeableConcept ^definition = "The reason for the current status; the actor scopes the reason. For instance, an actor of patient and reason is illness would imply the patient was too sick while an actor of provider and reason of illness would imply the provider was sick."
* valueCodeableConcept ^short = "Reason for current status"
* valueCodeableConcept ^comment = "Priority: Low"

Extension: T1DEncounterReasonCodeType
Id: t1d-encounter-reason-code-type
Title: "T1D Encounter Reason Code Type Extension"
Description: "Code system used to describe encounter reason"
* ^context.type = #element
* ^context.expression = "Encounter"
* value[x] only CodeableConcept
* valueCodeableConcept from T1DEncounterReasonCodeTypeValueSet (required)
* valueCodeableConcept ^definition = "Code system used to describe encounter reason"
* valueCodeableConcept ^short = "Code system for encounter reason"
* valueCodeableConcept ^comment = "Priority: High if encounter_reason_code is provided"

Extension: T1DEndoVisit
Id: t1d-endo-visit
Title: "T1D Endocrine Visit Extension"
Description: "Binary indicator for endocrine group visit"
* ^context.type = #element
* ^context.expression = "Encounter"
* value[x] only CodeableConcept
* valueCodeableConcept from T1DEndoVisitValueSet (required)
* valueCodeableConcept ^definition = "Binary 0 or 1 to indicate an encounter is from the endocrine group or non-endocrine group"
* valueCodeableConcept ^short = "Endocrine group visit indicator"
* valueCodeableConcept ^comment = "Priority: Medium"