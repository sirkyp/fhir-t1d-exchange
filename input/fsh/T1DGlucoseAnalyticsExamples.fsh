// T1D Exchange Glucose Analytics Examples
// Examples for BGM/CGM statistical analysis and time-in-range calculations

// ============================================================================
// BGM STATISTICS EXAMPLES
// ============================================================================

Instance: T1DBGMStatisticsExample
InstanceOf: T1DBGMStatisticsObservation
Usage: #example
Title: "T1D BGM Statistics Example"
Description: "Example of BGM statistical analysis with mean, standard deviation, counts, and percentages"
* status = #final
* subject = Reference(T1DPatientExample)
* encounter = Reference(T1DEncounterExample)
* effectiveDateTime = "2024-01-15T09:15:00Z"
* performer = Reference(T1DProviderExample)

* component[bgmMean].code = T1DCodes#bgm-mean
* component[bgmMean].valueQuantity.value = 165
* component[bgmMean].valueQuantity.unit = "mg/dL"
* component[bgmMean].valueQuantity.system = "http://unitsofmeasure.org"
* component[bgmMean].valueQuantity.code = #mg/dL

* component[bgmStandardDeviation].code = T1DCodes#bgm-sd
* component[bgmStandardDeviation].valueQuantity.value = 45
* component[bgmStandardDeviation].valueQuantity.unit = "mg/dL"
* component[bgmStandardDeviation].valueQuantity.system = "http://unitsofmeasure.org"
* component[bgmStandardDeviation].valueQuantity.code = #mg/dL

* component[bgmHighCount].code = T1DCodes#bgm-high-count
* component[bgmHighCount].valueInteger = 12

* component[bgmLowCount].code = T1DCodes#bgm-low-count
* component[bgmLowCount].valueInteger = 3

* component[bgmHighPercentage].code = T1DCodes#bgm-high-perc
* component[bgmHighPercentage].valueQuantity.value = 28.5
* component[bgmHighPercentage].valueQuantity.unit = "%"
* component[bgmHighPercentage].valueQuantity.system = "http://unitsofmeasure.org"
* component[bgmHighPercentage].valueQuantity.code = #%

* component[bgmLowPercentage].code = T1DCodes#bgm-low-perc
* component[bgmLowPercentage].valueQuantity.value = 7.1
* component[bgmLowPercentage].valueQuantity.unit = "%"
* component[bgmLowPercentage].valueQuantity.system = "http://unitsofmeasure.org"
* component[bgmLowPercentage].valueQuantity.code = #%

// ============================================================================
// CGM STATISTICS EXAMPLES
// ============================================================================

Instance: T1DCGMStatisticsExample
InstanceOf: T1DCGMStatisticsObservation
Usage: #example
Title: "T1D CGM Statistics Example"
Description: "Example of CGM statistical analysis with comprehensive glucose metrics"
* status = #final
* subject = Reference(T1DPatientExample)
* encounter = Reference(T1DEncounterExample)
* effectiveDateTime = "2024-01-15T09:15:00Z"
* performer = Reference(T1DProviderExample)

* component[cgmMean].code = T1DCodes#cgm-mean
* component[cgmMean].valueQuantity.value = 158
* component[cgmMean].valueQuantity.unit = "mg/dL"
* component[cgmMean].valueQuantity.system = "http://unitsofmeasure.org"
* component[cgmMean].valueQuantity.code = #mg/dL

* component[cgmStandardDeviation].code = T1DCodes#cgm-sd
* component[cgmStandardDeviation].valueQuantity.value = 52
* component[cgmStandardDeviation].valueQuantity.unit = "mg/dL"
* component[cgmStandardDeviation].valueQuantity.system = "http://unitsofmeasure.org"
* component[cgmStandardDeviation].valueQuantity.code = #mg/dL

* component[cgmHighCount].code = T1DCodes#cgm-high-count
* component[cgmHighCount].valueInteger = 1248

* component[cgmLowCount].code = T1DCodes#cgm-low-count
* component[cgmLowCount].valueInteger = 156

* component[cgmHighPercentage].code = T1DCodes#cgm-high-perc
* component[cgmHighPercentage].valueQuantity.value = 32.4
* component[cgmHighPercentage].valueQuantity.unit = "%"
* component[cgmHighPercentage].valueQuantity.system = "http://unitsofmeasure.org"
* component[cgmHighPercentage].valueQuantity.code = #%

* component[cgmLowPercentage].code = T1DCodes#cgm-low-perc
* component[cgmLowPercentage].valueQuantity.value = 4.1
* component[cgmLowPercentage].valueQuantity.unit = "%"
* component[cgmLowPercentage].valueQuantity.system = "http://unitsofmeasure.org"
* component[cgmLowPercentage].valueQuantity.code = #%

// ============================================================================
// TIME-IN-RANGE EXAMPLES
// ============================================================================

Instance: T1DTimeInRangeExample
InstanceOf: T1DTimeInRangeObservation
Usage: #example
Title: "T1D Time-in-Range Example"
Description: "Example of time-in-range analysis with standard glucose thresholds"
* status = #final
* subject = Reference(T1DPatientExample)
* encounter = Reference(T1DEncounterExample)
* effectiveDateTime = "2024-01-15T09:15:00Z"
* performer = Reference(T1DProviderExample)

* valueQuantity.value = 68.2
* valueQuantity.unit = "%"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #%

* component[timeBelow70].code = T1DCodes#cgm-low-below-70
* component[timeBelow70].valueQuantity.value = 4.1
* component[timeBelow70].valueQuantity.unit = "%"
* component[timeBelow70].valueQuantity.system = "http://unitsofmeasure.org"
* component[timeBelow70].valueQuantity.code = #%

* component[timeBelow54].code = T1DCodes#cgm-low-below-54
* component[timeBelow54].valueQuantity.value = 1.2
* component[timeBelow54].valueQuantity.unit = "%"
* component[timeBelow54].valueQuantity.system = "http://unitsofmeasure.org"
* component[timeBelow54].valueQuantity.code = #%

* component[timeAbove180].code = T1DCodes#cgm-high-above-180
* component[timeAbove180].valueQuantity.value = 27.7
* component[timeAbove180].valueQuantity.unit = "%"
* component[timeAbove180].valueQuantity.system = "http://unitsofmeasure.org"
* component[timeAbove180].valueQuantity.code = #%

* component[timeAbove250].code = T1DCodes#cgm-high-above-250
* component[timeAbove250].valueQuantity.value = 8.3
* component[timeAbove250].valueQuantity.unit = "%"
* component[timeAbove250].valueQuantity.system = "http://unitsofmeasure.org"
* component[timeAbove250].valueQuantity.code = #%

// ============================================================================
// COMPREHENSIVE GLUCOSE ANALYTICS EXAMPLE
// ============================================================================

Instance: T1DComprehensiveGlucoseAnalyticsExample
InstanceOf: T1DTimeInRangeObservation
Usage: #example
Title: "T1D Comprehensive Glucose Analytics Example"
Description: "Example showing optimal glucose control with excellent time-in-range metrics"
* status = #final
* subject = Reference(T1DPatientExample)
* encounter = Reference(T1DEncounterExample)
* effectiveDateTime = "2024-01-15T09:15:00Z"
* performer = Reference(T1DProviderExample)

// Excellent time-in-range (target >70%)
* valueQuantity.value = 78.5
* valueQuantity.unit = "%"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #%

// Low hypoglycemia risk (target <4% below 70, <1% below 54)
* component[timeBelow70].code = T1DCodes#cgm-low-below-70
* component[timeBelow70].valueQuantity.value = 2.8
* component[timeBelow70].valueQuantity.unit = "%"
* component[timeBelow70].valueQuantity.system = "http://unitsofmeasure.org"
* component[timeBelow70].valueQuantity.code = #%

* component[timeBelow54].code = T1DCodes#cgm-low-below-54
* component[timeBelow54].valueQuantity.value = 0.5
* component[timeBelow54].valueQuantity.unit = "%"
* component[timeBelow54].valueQuantity.system = "http://unitsofmeasure.org"
* component[timeBelow54].valueQuantity.code = #%

// Controlled hyperglycemia (target <25% above 180, <5% above 250)
* component[timeAbove180].code = T1DCodes#cgm-high-above-180
* component[timeAbove180].valueQuantity.value = 18.7
* component[timeAbove180].valueQuantity.unit = "%"
* component[timeAbove180].valueQuantity.system = "http://unitsofmeasure.org"
* component[timeAbove180].valueQuantity.code = #%

* component[timeAbove250].code = T1DCodes#cgm-high-above-250
* component[timeAbove250].valueQuantity.value = 2.1
* component[timeAbove250].valueQuantity.unit = "%"
* component[timeAbove250].valueQuantity.system = "http://unitsofmeasure.org"
* component[timeAbove250].valueQuantity.code = #%