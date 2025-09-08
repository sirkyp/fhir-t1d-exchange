// T1D Exchange Device Examples
// Examples for insulin management, device profiles, and usage observations

// ============================================================================
// DEVICE EXAMPLES
// ============================================================================

Instance: T1DInsulinPumpExample
InstanceOf: T1DInsulinPumpDevice
Title: "T1D Insulin Pump Device Example"
Description: "Example of Medtronic 670G insulin pump with hybrid closed loop delivery"
* identifier.system = "http://t1dexchange.org/fhir/device-id"
* identifier.value = "pump-12345"
* manufacturer = T1DInsulinPumpCompanyCS#5 "Medtronic"
* deviceName.name = T1DInsulinPumpModelCS#medtronic-670g-auto "Minimed 670G (for Medtronic) (Auto)"
* deviceName.type = http://hl7.org/fhir/device-nametype#model-name
* patient = Reference(T1DPatientExample)
* extension[pumpStartDate].valueDate = "2023-03-15"
* extension[deliverySystem].valueCodeableConcept = T1DPumpDeliverySystemCS#4 "Hybrid closed loop"
* extension[siteChangeFreq].valueInteger = 3

Instance: T1DCGMDeviceExample
InstanceOf: T1DCGMDevice
Title: "T1D CGM Device Example"
Description: "Example of Dexcom G6 continuous glucose monitor"
* identifier.system = "http://t1dexchange.org/fhir/device-id"
* identifier.value = "cgm-67890"
* manufacturer = T1DCGMCompanyCS#1 "Dexcom"
* deviceName.name = T1DCGMModelCS#dexcom-g6 "G6 (for Dexcom)"
* deviceName.type = http://hl7.org/fhir/device-nametype#model-name
* patient = Reference(T1DPatientExample)
* extension[cgmStartDate].valueDate = "2023-01-10"

Instance: T1DBGMDeviceExample
InstanceOf: T1DBGMDevice
Title: "T1D BGM Device Example"
Description: "Example of OneTouch Verio blood glucose meter"
* identifier.system = "http://t1dexchange.org/fhir/device-id"
* identifier.value = "bgm-11111"
* manufacturer = T1DBGMCompanyCS#8 "OneTouch / LifeScan"
* deviceName.name = T1DBGMModelCS#lifescan-onetouch-verio "OneTouch Verio (for LifeScan)"
* deviceName.type = http://hl7.org/fhir/device-nametype#model-name
* patient = Reference(T1DPatientExample)

Instance: T1DInsulinPenExample
InstanceOf: T1DInsulinPenDevice
Title: "T1D Insulin Pen Device Example"
Description: "Example of Novo Nordisk FlexPen insulin pen"
* identifier.system = "http://t1dexchange.org/fhir/device-id"
* identifier.value = "pen-22222"
* manufacturer = T1DInsulinPenCompanyCS#4 "Novo Nordisk"
* deviceName.name = T1DInsulinPenModelCS#novo-nordisk-flexpen "FlexPen (Novo Nordisk)"
* deviceName.type = http://hl7.org/fhir/device-nametype#model-name
* patient = Reference(T1DPatientExample)

// ============================================================================
// INSULIN MANAGEMENT EXAMPLES
// ============================================================================

Instance: T1DInsulinDosingExample
InstanceOf: T1DInsulinDosingObservation
Title: "T1D Insulin Dosing Observation Example"
Description: "Example of daily insulin dosing with basal and bolus components"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#therapy
* code = T1DCodes#insulin-dosing
* subject = Reference(T1DPatientExample)
* encounter = Reference(T1DEncounterExample)
* effectiveDateTime = "2024-01-15"
* performer = Reference(T1DProviderExample)
* valueQuantity.value = 45.5
* valueQuantity.unit = "units"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #U

* component[basalInsulinDaily].code = T1DCodes#basal-insulin-daily
* component[basalInsulinDaily].valueQuantity.value = 22.0
* component[basalInsulinDaily].valueQuantity.unit = "units"
* component[basalInsulinDaily].valueQuantity.system = "http://unitsofmeasure.org"
* component[basalInsulinDaily].valueQuantity.code = #U

* component[bolusInsulinDaily].code = T1DCodes#bolus-insulin-daily
* component[bolusInsulinDaily].valueQuantity.value = 23.5
* component[bolusInsulinDaily].valueQuantity.unit = "units"
* component[bolusInsulinDaily].valueQuantity.system = "http://unitsofmeasure.org"
* component[bolusInsulinDaily].valueQuantity.code = #U

* component[basalInsulinInjections].code = T1DCodes#basal-insulin-injections
* component[basalInsulinInjections].valueInteger = 0

* component[bolusInsulinInjections].code = T1DCodes#bolus-insulin-injections
* component[bolusInsulinInjections].valueInteger = 0

Instance: T1DInsulinPumpManagementExample
InstanceOf: T1DInsulinPumpManagementObservation
Title: "T1D Insulin Pump Management Example"
Description: "Example of insulin pump site change frequency and dose adjustments"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#therapy
* code = T1DCodes#insulin-pump-management
* subject = Reference(T1DPatientExample)
* encounter = Reference(T1DEncounterExample)
* effectiveDateTime = "2024-01-15"
* performer = Reference(T1DProviderExample)
* valueInteger = 3

* component[siteChangeMethod].code = T1DCodes#pump-site-change-method
* component[siteChangeMethod].valueCodeableConcept = T1DDeviceUsageMethodCS#1 "Download"

* component[doseAdjustments].code = T1DCodes#insulin-dose-adjustments
* component[doseAdjustments].valueInteger = 2

// ============================================================================
// DEVICE USAGE EXAMPLES
// ============================================================================

Instance: T1DBGMUsageExample
InstanceOf: T1DBGMUsageObservation
Title: "T1D BGM Usage Example"
Description: "Example of blood glucose meter usage frequency"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code = T1DCodes#bgm-usage
* subject = Reference(T1DPatientExample)
* encounter = Reference(T1DEncounterExample)
* effectiveDateTime = "2024-01-15"
* performer = Reference(T1DProviderExample)
* valueQuantity.value = 4.2
* valueQuantity.unit = "checks per day"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #/d

* component[testFreqMethod].code = T1DCodes#bgm-test-freq-method
* component[testFreqMethod].valueCodeableConcept = T1DDeviceUsageMethodCS#1 "Download"

Instance: T1DCGMUsageExample
InstanceOf: T1DCGMUsageObservation
Title: "T1D CGM Usage Example"
Description: "Example of continuous glucose monitor usage with sensor tracking"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code = T1DCodes#cgm-usage
* subject = Reference(T1DPatientExample)
* encounter = Reference(T1DEncounterExample)
* effectiveDateTime = "2024-01-15"
* performer = Reference(T1DProviderExample)
* valueInteger = 1

* component[cgmUsePercentage].code = T1DCodes#cgm-use-percentage
* component[cgmUsePercentage].valueQuantity.value = 92
* component[cgmUsePercentage].valueQuantity.unit = "%"
* component[cgmUsePercentage].valueQuantity.system = "http://unitsofmeasure.org"
* component[cgmUsePercentage].valueQuantity.code = #%

* component[cgmUseReport].code = T1DCodes#cgm-use-report
* component[cgmUseReport].valueCodeableConcept = T1DDeviceUsageMethodCS#1 "Download"

* component[cgmBinary].code = T1DCodes#cgm-binary
* component[cgmBinary].valueBoolean = true

* component[sensorChangeFreq].code = T1DCodes#cgm-sensor-change-freq
* component[sensorChangeFreq].valueInteger = 10

Instance: T1DDeviceReportReviewExample
InstanceOf: T1DDeviceReportReviewObservation
Title: "T1D Device Report Review Example"
Description: "Example of patient reviewing device reports since last visit"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#social-history
* code = T1DCodes#device-report-review
* subject = Reference(T1DPatientExample)
* encounter = Reference(T1DEncounterExample)
* effectiveDateTime = "2024-01-15"
* performer = Reference(T1DProviderExample)
* valueBoolean = true

// ============================================================================
// INSULIN REGIMEN EXAMPLE (Enhanced)
// ============================================================================

Instance: T1DInsulinRegimenExample
InstanceOf: T1DMedicationRequest
Title: "T1D Insulin Regimen Example - Pump Therapy"
Description: "Example of insulin pump regimen with delivery method tracking"
* status = #active
* intent = #order
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#outpatient
* medicationCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#253182 "Insulin, regular, human"
* subject = Reference(T1DPatientExample)
* encounter = Reference(T1DEncounterExample)
* authoredOn = "2024-01-15"
* requester = Reference(T1DProviderExample)

* extension[insulinRegimen].valueCodeableConcept = T1DInsulinRegimenCS#1 "Insulin pump"
* extension[deliveryMethod].valueCodeableConcept = http://snomed.info/sct#33633005 "Prescription of drug"

* dosageInstruction.text = "Continuous subcutaneous insulin infusion via insulin pump with hybrid closed loop technology"
* dosageInstruction.route = http://snomed.info/sct#263887005 "Subcutaneous"
* dosageInstruction.method = http://snomed.info/sct#33633005 "Prescription of drug"