// T1D Exchange Glucose Analytics Profiles
// Statistical metrics and time-in-range calculations for BGM/CGM data

// ============================================================================
// BGM STATISTICAL OBSERVATION PROFILE
// ============================================================================

Profile: T1DBGMStatisticsObservation
Parent: T1DObservation
Id: t1d-bgm-statistics-observation
Title: "T1D BGM Statistics Observation"
Description: "Blood glucose meter statistical analysis including mean, standard deviation, counts, and percentages"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true

* category 1..1 MS
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs

* code 1..1 MS
* code = T1DCodes#bgm-statistics "BGM Statistical Analysis"

* value[x] 0..0
* valueQuantity 0..0

* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "BGM statistical components"

* component contains
    bgmMean 0..1 MS and
    bgmStandardDeviation 0..1 MS and
    bgmHighCount 0..1 MS and
    bgmLowCount 0..1 MS and
    bgmHighPercentage 0..1 MS and
    bgmLowPercentage 0..1 MS

* component[bgmMean] ^short = "BGM mean glucose value"
* component[bgmMean] ^definition = "Average blood glucose meter reading (bgm_mean)"
* component[bgmMean].code = T1DCodes#bgm-mean
* component[bgmMean].value[x] only Quantity
* component[bgmMean].valueQuantity from T1DGlucoseUnitsValueSet (required)

* component[bgmStandardDeviation] ^short = "BGM standard deviation"
* component[bgmStandardDeviation] ^definition = "Standard deviation of BGM readings (bgm_sd)"
* component[bgmStandardDeviation].code = T1DCodes#bgm-sd
* component[bgmStandardDeviation].value[x] only Quantity
* component[bgmStandardDeviation].valueQuantity from T1DGlucoseUnitsValueSet (required)

* component[bgmHighCount] ^short = "BGM high glucose count"
* component[bgmHighCount] ^definition = "Number of BGM readings above target range (bgm_high_count)"
* component[bgmHighCount].code = T1DCodes#bgm-high-count
* component[bgmHighCount].value[x] only integer

* component[bgmLowCount] ^short = "BGM low glucose count"
* component[bgmLowCount] ^definition = "Number of BGM readings below target range (bgm_low_count)"
* component[bgmLowCount].code = T1DCodes#bgm-low-count
* component[bgmLowCount].value[x] only integer

* component[bgmHighPercentage] ^short = "BGM high glucose percentage"
* component[bgmHighPercentage] ^definition = "Percentage of BGM readings above target range (bgm_high_perc)"
* component[bgmHighPercentage].code = T1DCodes#bgm-high-perc
* component[bgmHighPercentage].value[x] only Quantity
* component[bgmHighPercentage].valueQuantity.unit = "%"
* component[bgmHighPercentage].valueQuantity.system = "http://unitsofmeasure.org"
* component[bgmHighPercentage].valueQuantity.code = #%

* component[bgmLowPercentage] ^short = "BGM low glucose percentage"
* component[bgmLowPercentage] ^definition = "Percentage of BGM readings below target range (bgm_low_perc)"
* component[bgmLowPercentage].code = T1DCodes#bgm-low-perc
* component[bgmLowPercentage].value[x] only Quantity
* component[bgmLowPercentage].valueQuantity.unit = "%"
* component[bgmLowPercentage].valueQuantity.system = "http://unitsofmeasure.org"
* component[bgmLowPercentage].valueQuantity.code = #%

// ============================================================================
// CGM STATISTICAL OBSERVATION PROFILE
// ============================================================================

Profile: T1DCGMStatisticsObservation
Parent: T1DObservation
Id: t1d-cgm-statistics-observation
Title: "T1D CGM Statistics Observation"
Description: "Continuous glucose monitor statistical analysis including mean, standard deviation, counts, and percentages"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true

* category 1..1 MS
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs

* code 1..1 MS
* code = T1DCodes#cgm-statistics "CGM Statistical Analysis"

* value[x] 0..0
* valueQuantity 0..0

* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "CGM statistical components"

* component contains
    cgmMean 0..1 MS and
    cgmStandardDeviation 0..1 MS and
    cgmHighCount 0..1 MS and
    cgmLowCount 0..1 MS and
    cgmHighPercentage 0..1 MS and
    cgmLowPercentage 0..1 MS

* component[cgmMean] ^short = "CGM mean glucose value"
* component[cgmMean] ^definition = "Average continuous glucose monitor reading (cgm_mean)"
* component[cgmMean].code = T1DCodes#cgm-mean
* component[cgmMean].value[x] only Quantity
* component[cgmMean].valueQuantity from T1DGlucoseUnitsValueSet (required)

* component[cgmStandardDeviation] ^short = "CGM standard deviation"
* component[cgmStandardDeviation] ^definition = "Standard deviation of CGM readings (cgm_sd)"
* component[cgmStandardDeviation].code = T1DCodes#cgm-sd
* component[cgmStandardDeviation].value[x] only Quantity
* component[cgmStandardDeviation].valueQuantity from T1DGlucoseUnitsValueSet (required)

* component[cgmHighCount] ^short = "CGM high glucose count"
* component[cgmHighCount] ^definition = "Number of CGM readings above target range (cgm_high_count)"
* component[cgmHighCount].code = T1DCodes#cgm-high-count
* component[cgmHighCount].value[x] only integer

* component[cgmLowCount] ^short = "CGM low glucose count"
* component[cgmLowCount] ^definition = "Number of CGM readings below target range (cgm_low_count)"
* component[cgmLowCount].code = T1DCodes#cgm-low-count
* component[cgmLowCount].value[x] only integer

* component[cgmHighPercentage] ^short = "CGM high glucose percentage"
* component[cgmHighPercentage] ^definition = "Percentage of CGM readings above target range (cgm_high_perc)"
* component[cgmHighPercentage].code = T1DCodes#cgm-high-perc
* component[cgmHighPercentage].value[x] only Quantity
* component[cgmHighPercentage].valueQuantity.unit = "%"
* component[cgmHighPercentage].valueQuantity.system = "http://unitsofmeasure.org"
* component[cgmHighPercentage].valueQuantity.code = #%

* component[cgmLowPercentage] ^short = "CGM low glucose percentage"
* component[cgmLowPercentage] ^definition = "Percentage of CGM readings below target range (cgm_low_perc)"
* component[cgmLowPercentage].code = T1DCodes#cgm-low-perc
* component[cgmLowPercentage].value[x] only Quantity
* component[cgmLowPercentage].valueQuantity.unit = "%"
* component[cgmLowPercentage].valueQuantity.system = "http://unitsofmeasure.org"
* component[cgmLowPercentage].valueQuantity.code = #%

// ============================================================================
// TIME-IN-RANGE OBSERVATION PROFILE
// ============================================================================

Profile: T1DTimeInRangeObservation
Parent: T1DObservation
Id: t1d-time-in-range-observation
Title: "T1D Time-in-Range Observation"
Description: "Time-in-range calculations with standard glucose thresholds for T1D management"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true

* category 1..1 MS
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs

* code 1..1 MS
* code = T1DCodes#time-in-range "Time in Range"

* value[x] 1..1 MS
* value[x] only Quantity
* valueQuantity.unit = "%"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #%
* valueQuantity ^short = "Time in target range (70-180 mg/dL)"
* valueQuantity ^definition = "Percentage of time glucose values are in target range 70-180 mg/dL (time_in_range)"

* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Time-in-range threshold components"

* component contains
    timeBelow70 0..1 MS and
    timeBelow54 0..1 MS and
    timeAbove180 0..1 MS and
    timeAbove250 0..1 MS

* component[timeBelow70] ^short = "Time below 70 mg/dL"
* component[timeBelow70] ^definition = "Percentage of time glucose values are below 70 mg/dL (cgm_low_below_70)"
* component[timeBelow70].code = T1DCodes#cgm-low-below-70
* component[timeBelow70].value[x] only Quantity
* component[timeBelow70].valueQuantity.unit = "%"
* component[timeBelow70].valueQuantity.system = "http://unitsofmeasure.org"
* component[timeBelow70].valueQuantity.code = #%

* component[timeBelow54] ^short = "Time below 54 mg/dL"
* component[timeBelow54] ^definition = "Percentage of time glucose values are below 54 mg/dL (cgm_low_below_54)"
* component[timeBelow54].code = T1DCodes#cgm-low-below-54
* component[timeBelow54].value[x] only Quantity
* component[timeBelow54].valueQuantity.unit = "%"
* component[timeBelow54].valueQuantity.system = "http://unitsofmeasure.org"
* component[timeBelow54].valueQuantity.code = #%

* component[timeAbove180] ^short = "Time above 180 mg/dL"
* component[timeAbove180] ^definition = "Percentage of time glucose values are above 180 mg/dL (cgm_high_above_180)"
* component[timeAbove180].code = T1DCodes#cgm-high-above-180
* component[timeAbove180].value[x] only Quantity
* component[timeAbove180].valueQuantity.unit = "%"
* component[timeAbove180].valueQuantity.system = "http://unitsofmeasure.org"
* component[timeAbove180].valueQuantity.code = #%

* component[timeAbove250] ^short = "Time above 250 mg/dL"
* component[timeAbove250] ^definition = "Percentage of time glucose values are above 250 mg/dL (cgm_high_above_250)"
* component[timeAbove250].code = T1DCodes#cgm-high-above-250
* component[timeAbove250].value[x] only Quantity
* component[timeAbove250].valueQuantity.unit = "%"
* component[timeAbove250].valueQuantity.system = "http://unitsofmeasure.org"
* component[timeAbove250].valueQuantity.code = #%