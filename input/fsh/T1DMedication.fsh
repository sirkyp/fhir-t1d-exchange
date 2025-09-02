Profile: T1DMedicationRequest
Parent: MedicationRequest
Id: t1d-medication-request
Title: "T1D Medication Request"
Description: "Medication request profile for T1D Exchange including insulin and diabetes medications"

* identifier MS
* identifier ^definition = "Unique medication prescription ID for each unique patient medication prescription. The medication prescription ID must remain consistent across all files which contain that medication prescription and across all data submissions."
* identifier ^short = "Unique medication prescription ID"
* identifier ^comment = "Priority: High"

* status 1..1 MS
* status ^definition = "What is the status of this medication"
* status ^short = "Status of this medication"
* status ^comment = "Priority: Low"

* intent 1..1 MS

* category MS
* category from T1DMedicationCategoryValueSet (extensible)

* medication[x] 1..1 MS
* medicationCodeableConcept ^definition = "Identification of the medication prescribed."
* medicationCodeableConcept ^short = "Identification of medication prescribed"
* medicationCodeableConcept ^comment = "Priority: High"
* medicationCodeableConcept from T1DMedicationCodeValueSet (extensible)
* medicationCodeableConcept MS

* subject 1..1 MS
* subject ^definition = "Patient identifier that the medication applies to from the patient's file."
* subject ^short = "Patient identifier from patient file"
* subject ^comment = "Priority: High"
* subject only Reference(T1DPatient)

* encounter MS
* encounter ^definition = "Encounter identifier for when the medication prescription was created from the encounters file"
* encounter ^short = "Encounter identifier when prescription created"
* encounter ^comment = "Priority: Low | Notes: Provide when available"
* encounter only Reference(T1DEncounter)

* authoredOn 1..1 MS
* authoredOn ^definition = "When prescription was authorized."
* authoredOn ^short = "When prescription was authorized"
* authoredOn ^comment = "Priority: Low"

* requester MS
* requester ^definition = "Provider identifier for the provider that ordered the medication from the providers file."
* requester ^short = "Provider identifier who ordered medication"
* requester ^comment = "Priority: Low"
* requester only Reference(T1DProvider)

* dosageInstruction MS
* dosageInstruction.timing MS
* dosageInstruction.route MS
* dosageInstruction.route from T1DMedicationRouteValueSet (extensible)
* dosageInstruction.doseAndRate MS
* dosageInstruction.doseAndRate.dose[x] MS

* extension contains
    T1DInsulinRegimen named insulinRegimen 0..1 MS and
    T1DInsulinDeliveryMethod named deliveryMethod 0..1 MS

Extension: T1DInsulinRegimen
Id: t1d-insulin-regimen
Title: "T1D Insulin Regimen Extension"
Description: "Type of insulin regimen for T1D patients"
* ^context.type = #element
* ^context.expression = "MedicationRequest"
* value[x] only CodeableConcept
* valueCodeableConcept ^definition = "Type of insulin regimen"
* valueCodeableConcept ^short = "Type of insulin regimen"
* valueCodeableConcept ^comment = "Priority: High"
* valueCodeableConcept from T1DInsulinRegimenValueSet (required)

Extension: T1DInsulinDeliveryMethod
Id: t1d-insulin-delivery-method
Title: "T1D Insulin Delivery Method Extension"
Description: "Method of insulin delivery (pump, pen, syringe, etc.)"
* ^context.type = #element
* ^context.expression = "MedicationRequest"
* value[x] only CodeableConcept
* valueCodeableConcept ^definition = "Method of insulin delivery"
* valueCodeableConcept ^short = "Method of insulin delivery"
* valueCodeableConcept ^comment = "Priority: High"
* valueCodeableConcept from T1DInsulinDeliveryValueSet (required)

Profile: T1DMedicationStatement
Parent: MedicationStatement
Id: t1d-medication-statement
Title: "T1D Medication Statement"
Description: "Medication statement profile for documenting current T1D medications"

* identifier MS
* status 1..1 MS
* category MS
* category from T1DMedicationCategoryValueSet (preferred)
* medication[x] 1..1 MS
* medicationCodeableConcept from T1DMedicationCodeValueSet (extensible)
* medicationCodeableConcept MS
* subject 1..1 MS
* subject only Reference(T1DPatient)
* context MS
* context only Reference(T1DEncounter)
* effective[x] MS
* informationSource MS
* informationSource only Reference(T1DProvider or T1DPatient)
* dosage MS
* dosage.timing MS
* dosage.route MS
* dosage.route from T1DMedicationRouteValueSet (extensible)
* dosage.doseAndRate MS