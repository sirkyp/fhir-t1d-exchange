Profile: T1DObservation
Parent: Observation
Id: t1d-observation
Title: "T1D Exchange Observation"
Description: "Base observation profile for T1D Exchange data collection"

* identifier MS
* status 1..1 MS
* category 1..* MS
* category from T1DObservationCategoryValueSet (extensible)
* code 1..1 MS
* code from T1DObservationCodeValueSet (extensible)
* subject 1..1 MS
* subject only Reference(T1DPatient)
* encounter MS
* encounter only Reference(T1DEncounter)
* effective[x] 1..1 MS
* performer MS
* performer only Reference(T1DProvider or T1DOrganization)
* value[x] MS
* interpretation MS
* referenceRange MS

Profile: T1DGlucoseObservation
Parent: T1DObservation
Id: t1d-glucose-observation
Title: "T1D Glucose Observation"
Description: "Glucose measurement observation for T1D patients"

* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code from T1DGlucoseCodeValueSet (required)
* value[x] only Quantity
* valueQuantity.unit from T1DGlucoseUnitsValueSet (required)
* valueQuantity.system = "http://unitsofmeasure.org"

* component MS
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component contains
    bgmMean 0..1 MS and
    cgmHighAbove180 0..1 MS and
    timeInRange 0..1 MS

* component[bgmMean].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#bgm-mean
* component[bgmMean].value[x] only Quantity
* component[bgmMean].valueQuantity.unit = "mg/dL"

* component[cgmHighAbove180].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#cgm-high-above-180
* component[cgmHighAbove180].value[x] only Quantity
* component[cgmHighAbove180].valueQuantity.unit = "%"

* component[timeInRange].code = http://t1dexchange.org/fhir/CodeSystem/t1d-codes#time-in-range
* component[timeInRange].value[x] only Quantity
* component[timeInRange].valueQuantity.unit = "%"

Profile: T1DHbA1cObservation
Parent: T1DObservation
Id: t1d-hba1c-observation
Title: "T1D HbA1c Observation"
Description: "Hemoglobin A1c observation for T1D patients"

* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code = http://loinc.org#4548-4 "Hemoglobin A1c/Hemoglobin.total in Blood"
* value[x] only Quantity
* valueQuantity.unit from T1DHbA1cUnitsValueSet (required)
* valueQuantity.system = "http://unitsofmeasure.org"

Profile: T1DSDOHObservation
Parent: T1DObservation
Id: t1d-sdoh-observation
Title: "T1D Social Determinants of Health Observation"
Description: "Social determinants of health observations for T1D patients"

* category = http://terminology.hl7.org/CodeSystem/observation-category#social-history
* code from T1DSDOHCodeValueSet (extensible)
* value[x] only CodeableConcept or boolean or string
* valueCodeableConcept from T1DSDOHResponseValueSet (extensible)