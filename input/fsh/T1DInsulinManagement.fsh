// T1D Exchange Insulin Management Profiles
// Insulin dosing, regimen, and pump management observations

// ============================================================================
// INSULIN DOSING OBSERVATION
// ============================================================================

Profile: T1DInsulinDosingObservation
Parent: T1DObservation
Id: t1d-insulin-dosing-observation
Title: "T1D Exchange Insulin Dosing Observation"
Description: "Insulin dosing observation with decimal precision for total, basal, and bolus insulin units"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true

* code = T1DCodes#insulin-dosing
* code ^short = "Insulin dosing observation"
* code ^definition = "Observation for tracking daily insulin dosing with decimal precision"

* value[x] only Quantity
* valueQuantity 1..1 MS
* valueQuantity.value 1..1 MS
* valueQuantity.value ^short = "Total daily insulin dose"
* valueQuantity.value ^definition = "Total daily insulin dose in units to 1 decimal place (t_ins_daily)"
* valueQuantity.unit = "units"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #U

* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Insulin dosing components"

* component contains
    basalInsulinDaily 0..1 MS and
    bolusInsulinDaily 0..1 MS and
    basalInsulinInjections 0..1 MS and
    bolusInsulinInjections 0..1 MS

* component[basalInsulinDaily] ^short = "Daily basal insulin dose"
* component[basalInsulinDaily] ^definition = "Daily basal insulin dose in units to 1 decimal place (basal_ins_daily)"
* component[basalInsulinDaily].code = T1DCodes#basal-insulin-daily
* component[basalInsulinDaily].value[x] only Quantity
* component[basalInsulinDaily].valueQuantity.value 1..1
* component[basalInsulinDaily].valueQuantity.unit = "units"
* component[basalInsulinDaily].valueQuantity.system = "http://unitsofmeasure.org"
* component[basalInsulinDaily].valueQuantity.code = #U

* component[bolusInsulinDaily] ^short = "Daily bolus insulin dose"
* component[bolusInsulinDaily] ^definition = "Daily prandial/bolus insulin dose in units to 1 decimal place (bolus_ins_daily)"
* component[bolusInsulinDaily].code = T1DCodes#bolus-insulin-daily
* component[bolusInsulinDaily].value[x] only Quantity
* component[bolusInsulinDaily].valueQuantity.value 1..1
* component[bolusInsulinDaily].valueQuantity.unit = "units"
* component[bolusInsulinDaily].valueQuantity.system = "http://unitsofmeasure.org"
* component[bolusInsulinDaily].valueQuantity.code = #U

* component[basalInsulinInjections] ^short = "Daily basal insulin injections"
* component[basalInsulinInjections] ^definition = "Number of daily basal insulin injections (basal_ins_daily_inj)"
* component[basalInsulinInjections].code = T1DCodes#basal-insulin-injections
* component[basalInsulinInjections].value[x] only integer
* component[basalInsulinInjections].valueInteger 1..1

* component[bolusInsulinInjections] ^short = "Daily bolus insulin injections"
* component[bolusInsulinInjections] ^definition = "Number of daily bolus insulin injections (bolus_ins_daily_inj)"
* component[bolusInsulinInjections].code = T1DCodes#bolus-insulin-injections
* component[bolusInsulinInjections].value[x] only integer
* component[bolusInsulinInjections].valueInteger 1..1

// ============================================================================
// INSULIN PUMP MANAGEMENT OBSERVATION
// ============================================================================

Profile: T1DInsulinPumpManagementObservation
Parent: T1DObservation
Id: t1d-insulin-pump-management-observation
Title: "T1D Exchange Insulin Pump Management Observation"
Description: "Insulin pump management observation for site changes and dose adjustments"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true

* code = T1DCodes#insulin-pump-management
* code ^short = "Insulin pump management observation"
* code ^definition = "Observation for tracking insulin pump site changes and dose adjustments"

* value[x] only integer
* valueInteger 1..1 MS
* valueInteger ^short = "Pump site change frequency (days)"
* valueInteger ^definition = "Typical interval in days between insulin pump site changes (ins_pump_site_freq)"

* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Pump management components"

* component contains
    siteChangeMethod 0..1 MS and
    doseAdjustments 0..1 MS

* component[siteChangeMethod] ^short = "Site change frequency reporting method"
* component[siteChangeMethod] ^definition = "Method used to report pump site change frequency (ins_pump_site_freq_method)"
* component[siteChangeMethod].code = T1DCodes#pump-site-change-method
* component[siteChangeMethod].value[x] only CodeableConcept
* component[siteChangeMethod].valueCodeableConcept from T1DDeviceUsageMethodVS (required)

* component[doseAdjustments] ^short = "Insulin dose adjustments"
* component[doseAdjustments] ^definition = "Number of times insulin was adjusted since last visit (ins_dose_adjust)"
* component[doseAdjustments].code = T1DCodes#insulin-dose-adjustments
* component[doseAdjustments].value[x] only integer
* component[doseAdjustments].valueInteger 1..1

// ============================================================================
// BGM USAGE OBSERVATION
// ============================================================================

Profile: T1DBGMUsageObservation
Parent: T1DObservation
Id: t1d-bgm-usage-observation
Title: "T1D Exchange BGM Usage Observation"
Description: "Blood glucose meter usage observation with frequency tracking"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true

* code = T1DCodes#bgm-usage
* code ^short = "BGM usage observation"
* code ^definition = "Observation for tracking blood glucose meter usage frequency"

* value[x] only Quantity
* valueQuantity 1..1 MS
* valueQuantity.value 1..1 MS
* valueQuantity.value ^short = "BGM test frequency per day"
* valueQuantity.value ^definition = "Average number of BG checks daily to 1 decimal place (bgm_test_freq)"
* valueQuantity.unit = "checks per day"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #/d

* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "BGM usage components"

* component contains
    testFreqMethod 0..1 MS

* component[testFreqMethod] ^short = "BGM test frequency reporting method"
* component[testFreqMethod] ^definition = "Method used to report BGM test frequency (bgm_test_freq_method)"
* component[testFreqMethod].code = T1DCodes#bgm-test-freq-method
* component[testFreqMethod].value[x] only CodeableConcept
* component[testFreqMethod].valueCodeableConcept from T1DDeviceUsageMethodVS (required)

// ============================================================================
// CGM USAGE OBSERVATION
// ============================================================================

Profile: T1DCGMUsageObservation
Parent: T1DObservation
Id: t1d-cgm-usage-observation
Title: "T1D Exchange CGM Usage Observation"
Description: "Continuous glucose monitor usage observation with sensor tracking"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true

* code = T1DCodes#cgm-usage
* code ^short = "CGM usage observation"
* code ^definition = "Observation for tracking continuous glucose monitor usage"

* value[x] only integer
* valueInteger 1..1 MS
* valueInteger ^short = "CGM sensors used per 2 weeks"
* valueInteger ^definition = "Average number of sensors used in a two week period (cgm_sensor_use_count)"

* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "CGM usage components"

* component contains
    cgmUsePercentage 0..1 MS and
    cgmUseReport 0..1 MS and
    cgmBinary 0..1 MS and
    sensorChangeFreq 0..1 MS

* component[cgmUsePercentage] ^short = "CGM use percentage"
* component[cgmUsePercentage] ^definition = "Percentage of time CGM used per 2 weeks (0-100) (cgm_use_perc)"
* component[cgmUsePercentage].code = T1DCodes#cgm-use-percentage
* component[cgmUsePercentage].value[x] only Quantity
* component[cgmUsePercentage].valueQuantity.value 1..1
* component[cgmUsePercentage].valueQuantity.unit = "%"
* component[cgmUsePercentage].valueQuantity.system = "http://unitsofmeasure.org"
* component[cgmUsePercentage].valueQuantity.code = #%

* component[cgmUseReport] ^short = "CGM use reporting method"
* component[cgmUseReport] ^definition = "Method used to report CGM usage (cgm_use_report)"
* component[cgmUseReport].code = T1DCodes#cgm-use-report
* component[cgmUseReport].value[x] only CodeableConcept
* component[cgmUseReport].valueCodeableConcept from T1DDeviceUsageMethodVS (required)

* component[cgmBinary] ^short = "CGM binary indicator"
* component[cgmBinary] ^definition = "Binary indicator if patient is on CGM as of latest visit (cgm_binary)"
* component[cgmBinary].code = T1DCodes#cgm-binary
* component[cgmBinary].value[x] only boolean
* component[cgmBinary].valueBoolean 1..1

* component[sensorChangeFreq] ^short = "CGM sensor change frequency"
* component[sensorChangeFreq] ^definition = "Frequency of CGM sensor changes in days (cgm_sensor_change_freq)"
* component[sensorChangeFreq].code = T1DCodes#cgm-sensor-change-freq
* component[sensorChangeFreq].value[x] only integer
* component[sensorChangeFreq].valueInteger 1..1

// ============================================================================
// DEVICE REPORT REVIEW OBSERVATION
// ============================================================================

Profile: T1DDeviceReportReviewObservation
Parent: T1DObservation
Id: t1d-device-report-review-observation
Title: "T1D Exchange Device Report Review Observation"
Description: "Observation for tracking if patient reviewed device reports since last visit"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true

* code = T1DCodes#device-report-review
* code ^short = "Device report review observation"
* code ^definition = "Observation for tracking if patient reviewed BGM, CGM, or pump device reports"

* value[x] only boolean
* valueBoolean 1..1 MS
* valueBoolean ^short = "Patient reviewed device report"
* valueBoolean ^definition = "If patient reviewed BGM, CGM, or pump device report since last visit (device_report_patient_reviewed)"