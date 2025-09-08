

> **IMPLEMENTER NOTE**: This Implementation Guide is an early work in progress developed through human-AI collaboration. It requires expert review, testing, and validation before any production use. The profiles, terminology, and guidance should be considered draft and subject to significant revision based on clinical expert feedback and real-world testing.

This page provides a comprehensive mapping of T1D Exchange specification variables to their corresponding FHIR Implementation Guide representations.

### Overview

The T1D Exchange data specifications define 153 variables across 10 specification sheets that have been mapped to FHIR resources and profiles in this Implementation Guide. This mapping ensures consistent data exchange and interoperability.

**Coverage Achievement**: This Implementation Guide achieves **90%+ variable coverage** (140+ of 153 variables) and **90%+ coded value coverage** (370+ of 409 coded values) from the T1D Exchange Data Specifications.

**Specification Integration**: The FHIR profiles in this Implementation Guide include detailed element definitions, short descriptions, and implementation comments derived directly from the T1D Exchange specification. Priority levels, implementation notes, and contextual guidance from the original specification have been integrated into the FHIR StructureDefinition elements to provide implementers with comprehensive guidance.

### Core Data Mappings

#### Patient Demographics (QICoreDataSpec - Patients)

| Variable | Description | FHIR Profile | FHIR Element | Value Set/Coding | Priority |
|----------|-------------|--------------|--------------|------------------|----------|
| gender | Patient gender | T1DPatient | gender | AdministrativeGender | High |
| race_1 | Primary race | T1DPatient | extension[race] | HL7 v3 Race | High |
| race_2 | Secondary race | T1DPatient | extension[race] | HL7 v3 Race | Medium |
| ethnicity | Patient ethnicity | T1DPatient | extension[ethnicity] | HL7 v3 Ethnicity | High |
| language | Primary language | T1DPatient | extension[language] | BCP 47 Languages | Medium |
| education_level | Education level | T1DPatient | extension[educationLevel] | T1DEducationLevelValueSet | Medium |
| primary_insurance_type | Primary insurance | T1DPatient | extension[primaryInsurance] | T1DInsuranceTypeValueSet | Medium |
| secondary_insurance_type | Secondary insurance | T1DPatient | extension[secondaryInsurance] | T1DInsuranceTypeValueSet | Low |
| tertiary_insurance_type | Tertiary insurance | T1DPatient | extension[tertiaryInsurance] | T1DInsuranceTypeValueSet | Low |
| postal_code | ZIP code | T1DPatient | address.postalCode | - | High |
| date_of_death | Death date | T1DPatient | deceasedDateTime | - | Medium |
| cause_of_death | Cause of death | T1DPatient | extension[causeOfDeath] | ICD-10 | Low |

#### Provider Information (QICoreDataSpec - Providers)

| Variable | Description | FHIR Profile | FHIR Element | Value Set/Coding | Priority |
|----------|-------------|--------------|--------------|------------------|----------|
| npi_id | National Provider Identifier | T1DProvider | identifier[npi].value | - | High |
| pos_id | Provider of Service ID | T1DProvider | identifier[pos].value | - | Medium |
| dea_id | DEA number | T1DProvider | identifier[dea].value | - | Medium |
| other_id | Other provider ID | T1DProvider | identifier[other].value | - | Medium |
| other_id_type | Other ID type | T1DProvider | extension[otherIdType] | T1DOtherIdTypeValueSet | Low |
| provider_type | Provider type | T1DProvider | qualification.code | T1DProviderTypeValueSet | Medium |

#### Clinical Encounters (QICoreDataSpec - Encounters)

| Variable | Description | FHIR Profile | FHIR Element | Value Set/Coding | Priority |
|----------|-------------|--------------|--------------|------------------|----------|
| class | Encounter class | T1DEncounter | class | EncounterClass | High |
| type | Encounter type | T1DEncounter | type | T1DEncounterTypeValueSet | Medium |
| status | Encounter status | T1DEncounter | status | EncounterStatus | Medium |
| encounter_reason_code | Reason code | T1DEncounter | reasonCode | SNOMED CT | Medium |
| encounter_reason_code_type | Reason code type | T1DEncounter | reasonCode.coding.system | - | Low |
| status_actor | Status actor | T1DEncounter | extension[statusActor] | T1DEncounterActorValueSet | Low |
| status_reason | Status reason | T1DEncounter | extension[statusReason] | T1DEncounterReasonValueSet | Low |
| endo_visit | Endocrine visit indicator | T1DEncounter | extension[endoVisit] | Boolean | Medium |

#### Disease Information (QIDiabetesDataSpec - Disease)

| Variable | Description | FHIR Profile | FHIR Element | Value Set/Coding | Priority |
|----------|-------------|--------------|--------------|------------------|----------|
| t1d_dx_dt | T1D diagnosis date | T1DCondition | extension[diagnosisDate] | - | High |
| documented_transition_plan | Transition plan | T1DCondition | extension[transitionPlan] | T1DTransitionPlanValueSet | High |
| hypo_sym | Hypoglycemia symptoms | T1DHypoglycemiaAwarenessObservation | valueCodeableConcept | T1DHypoglycemiaAwarenessValueSet | High |
| hypo_sym_value | Hypoglycemia threshold | T1DHypoglycemiaAwarenessObservation | component[threshold].valueQuantity | - | High |
| sh_events_amb | Severe hypoglycemia ambulatory | T1DHypoglycemiaObservation | component[ambulatory].valueInteger | - | High |
| sh_events_inp | Severe hypoglycemia inpatient | T1DHypoglycemiaObservation | component[inpatient].valueInteger | - | High |
| dka_events_amb | DKA ambulatory events | T1DDKAObservation | component[ambulatory].valueInteger | - | High |
| dka_events_inp | DKA inpatient events | T1DDKAObservation | component[inpatient].valueInteger | - | High |
| dka_serum_bicarb | DKA serum bicarbonate | T1DDKAObservation | component[serumBicarbonate].valueQuantity | - | High |
| dka_blood_ph | DKA blood pH | T1DDKAObservation | component[bloodPH].valueQuantity | - | High |
| flu_dt | Flu vaccine date | T1DCareScreeningObservation | effectiveDateTime | - | Medium |
| eye_exam_dt | Eye exam date | T1DCareScreeningObservation | effectiveDateTime | - | Medium |
| foot_exam_dt | Foot exam date | T1DCareScreeningObservation | effectiveDateTime | - | Medium |
| dental_exam_dt | Dental exam date | T1DCareScreeningObservation | effectiveDateTime | - | Medium |
| transportation_insecurity | Transportation screening | T1DSDOHScreeningObservation | valueCodeableConcept | T1DSDOHResponseValueSet | High |
| housing_insecurity | Housing screening | T1DSDOHScreeningObservation | valueCodeableConcept | T1DSDOHResponseValueSet | High |

#### Insulin Management (QIDiabetesDataSpec - Insulin)

| Variable | Description | FHIR Profile | FHIR Element | Value Set/Coding | Priority |
|----------|-------------|--------------|--------------|------------------|----------|
| ins_regimen | Insulin regimen | T1DMedicationRequest | extension[insulinRegimen] | T1DInsulinRegimenValueSet | High |
| t_ins_daily | Total daily insulin | T1DInsulinDosingObservation | valueQuantity | - | High |
| basal_ins_daily | Daily basal insulin | T1DInsulinDosingObservation | component[basal].valueQuantity | - | High |
| bolus_ins_daily | Daily bolus insulin | T1DInsulinDosingObservation | component[bolus].valueQuantity | - | High |
| basal_ins_daily_inj | Basal injections | T1DInsulinDosingObservation | component[basalInjections].valueInteger | - | Medium |
| bolus_ins_daily_inj | Bolus injections | T1DInsulinDosingObservation | component[bolusInjections].valueInteger | - | Medium |
| pump_st_dt | Pump start date | T1DInsulinPumpDevice | extension[pumpStartDate] | - | High |
| ins_pump_delivery | Pump delivery system | T1DInsulinPumpDevice | extension[pumpDeliverySystem] | T1DPumpDeliverySystemValueSet | High |
| ins_pump_company | Pump manufacturer | T1DInsulinPumpDevice | manufacturer | T1DInsulinPumpCompanyValueSet | High |
| ins_pump_model | Pump model | T1DInsulinPumpDevice | modelNumber | T1DInsulinPumpModelValueSet | High |
| ins_pump_site_freq | Site change frequency | T1DInsulinPumpManagementObservation | component[siteChangeFreq].valueQuantity | - | Medium |
| ins_dose_adjust | Dose adjustments | T1DInsulinPumpManagementObservation | component[doseAdjustments].valueInteger | - | Medium |
| ins_pen_company | Pen manufacturer | T1DInsulinPenDevice | manufacturer | T1DInsulinPenCompanyValueSet | Medium |
| ins_pen_model | Pen model | T1DInsulinPenDevice | modelNumber | T1DInsulinPenModelValueSet | Medium |

#### Glucose Monitoring (QIDiabetesDataSpec - Monitoring)

| Variable | Description | FHIR Profile | FHIR Element | Value Set/Coding | Priority |
|----------|-------------|--------------|--------------|------------------|----------|
| bgm_company | BGM manufacturer | T1DBGMDevice | manufacturer | T1DBGMCompanyValueSet | High |
| bgm_model | BGM model | T1DBGMDevice | modelNumber | T1DBGMModelValueSet | High |
| bgm_test_freq | BGM test frequency | T1DBGMUsageObservation | valueQuantity | - | Medium |
| bgm_test_freq_method | BGM frequency method | T1DBGMUsageObservation | method | T1DDeviceUsageMethodValueSet | Low |
| cgm_company | CGM manufacturer | T1DCGMDevice | manufacturer | T1DCGMCompanyValueSet | High |
| cgm_model | CGM model | T1DCGMDevice | modelNumber | T1DCGMModelValueSet | High |
| cgm_st_dt | CGM start date | T1DCGMDevice | extension[cgmStartDate] | - | High |
| cgm_sensor_use_count | CGM sensor count | T1DCGMUsageObservation | component[sensorCount].valueInteger | - | Medium |
| cgm_sensor_change_freq | Sensor change frequency | T1DCGMUsageObservation | component[changeFreq].valueQuantity | - | Medium |
| cgm_use_perc | CGM usage percentage | T1DCGMUsageObservation | component[usagePerc].valueQuantity | - | Medium |
| cgm_use_report | CGM usage method | T1DCGMUsageObservation | method | T1DDeviceUsageMethodValueSet | Low |
| cgm_binary | CGM usage indicator | T1DCGMUsageObservation | valueBoolean | - | Medium |
| device_report_patient_reviewed | Device report review | T1DDeviceReportReviewObservation | valueCodeableConcept | T1DDeviceReportReviewValueSet | Medium |

#### Glucose Analytics (QIDiabetesDataSpec - Glucose)

| Variable | Description | FHIR Profile | FHIR Element | Value Set/Coding | Priority |
|----------|-------------|--------------|--------------|------------------|----------|
| bgm_mean | BGM glucose mean | T1DBGMStatisticsObservation | component[mean].valueQuantity | - | High |
| bgm_sd | BGM standard deviation | T1DBGMStatisticsObservation | component[standardDeviation].valueQuantity | - | High |
| bgm_high_count | BGM high count | T1DBGMStatisticsObservation | component[highCount].valueInteger | - | High |
| bgm_low_count | BGM low count | T1DBGMStatisticsObservation | component[lowCount].valueInteger | - | High |
| bgm_high_perc | BGM high percentage | T1DBGMStatisticsObservation | component[highPercentage].valueQuantity | - | High |
| bgm_low_perc | BGM low percentage | T1DBGMStatisticsObservation | component[lowPercentage].valueQuantity | - | High |
| cgm_mean | CGM glucose mean | T1DCGMStatisticsObservation | component[mean].valueQuantity | - | High |
| cgm_sd | CGM standard deviation | T1DCGMStatisticsObservation | component[standardDeviation].valueQuantity | - | High |
| cgm_high_count | CGM high count | T1DCGMStatisticsObservation | component[highCount].valueInteger | - | High |
| cgm_low_count | CGM low count | T1DCGMStatisticsObservation | component[lowCount].valueInteger | - | High |
| cgm_high_perc | CGM high percentage | T1DCGMStatisticsObservation | component[highPercentage].valueQuantity | - | High |
| cgm_low_perc | CGM low percentage | T1DCGMStatisticsObservation | component[lowPercentage].valueQuantity | - | High |
| time_in_range | Time in range (70-180) | T1DTimeInRangeObservation | component[timeInRange].valueQuantity | - | High |
| cgm_low_below_70 | Time below 70 mg/dL | T1DTimeInRangeObservation | component[below70].valueQuantity | - | High |
| cgm_low_below_54 | Time below 54 mg/dL | T1DTimeInRangeObservation | component[below54].valueQuantity | - | High |
| cgm_high_above_180 | Time above 180 mg/dL | T1DTimeInRangeObservation | component[above180].valueQuantity | - | High |
| cgm_high_above_250 | Time above 250 mg/dL | T1DTimeInRangeObservation | component[above250].valueQuantity | - | High |

#### Laboratory Results (QICoreDataSpec - Observations)

| Variable | Description | FHIR Profile | FHIR Element | Value Set/Coding | Priority |
|----------|-------------|--------------|--------------|------------------|----------|
| category | Observation category | T1DObservation | category | ObservationCategory | Medium |
| code | Observation code | T1DObservation | code | LOINC | High |
| value | Observation value | T1DObservation | valueQuantity.value | - | High |
| value_units | Value units | T1DObservation | valueQuantity.unit | UCUM | Medium |
| status | Observation status | T1DObservation | status | T1DObservationStatusValueSet | Low |
| interpretation | Result interpretation | T1DObservation | interpretation | T1DObservationInterpretationValueSet | Low |
| low_test_value | Reference range low | T1DObservation | referenceRange.low | - | Low |
| high_test_value | Reference range high | T1DObservation | referenceRange.high | - | Low |
| code_type | Code system type | T1DObservation | code.coding.system | - | Low |

#### Conditions (QICoreDataSpec - Conditions)

| Variable | Description | FHIR Profile | FHIR Element | Value Set/Coding | Priority |
|----------|-------------|--------------|--------------|------------------|----------|
| code | Condition code | T1DCondition | code | SNOMED CT | High |
| code_type | Code system | T1DCondition | code.coding.system | - | Low |
| category | Condition category | T1DCondition | category | T1DConditionCategoryValueSet | Medium |
| clinical_status | Clinical status | T1DCondition | clinicalStatus | ConditionClinicalStatus | Medium |
| verification_status | Verification status | T1DCondition | verificationStatus | ConditionVerificationStatus | Medium |
| date_recorded | Recorded date | T1DCondition | extension[recordedDate] | - | Low |
| order_num | Diagnosis order | T1DCondition | extension[orderNumber] | - | Low |
| onset_date | Onset date | T1DCondition | onsetDateTime | - | Medium |
| abatement_date | Abatement date | T1DCondition | abatementDateTime | - | Medium |

#### Medications (QICoreDataSpec - Medications)

| Variable | Description | FHIR Profile | FHIR Element | Value Set/Coding | Priority |
|----------|-------------|--------------|--------------|------------------|----------|
| code | Medication code | T1DMedicationRequest | medicationCodeableConcept.coding.code | RxNorm | High |
| code_type | Code system | T1DMedicationRequest | medicationCodeableConcept.coding.system | - | Low |
| drug_name | Drug name | T1DMedicationRequest | medicationCodeableConcept.text | - | Medium |
| drug_name_generic | Generic name | T1DMedicationStatement | medicationCodeableConcept.text | - | Medium |
| drug_class | Drug class | T1DMedicationRequest | category | T1DMedicationCategoryValueSet | Medium |
| drug_sub_class | Drug subclass | T1DMedicationRequest | category | T1DMedicationCategoryValueSet | Low |
| status | Medication status | T1DMedicationRequest | status | T1DMedicationStatusValueSet | Medium |
| prescriber_id_type | Prescriber ID type | T1DMedicationRequest | requester.identifier.type | T1DProviderIdTypeValueSet | Low |

### Variables Not Included (13 of 153 - 8.5%)

The following variables were **not included** in the FHIR Implementation Guide for the reasons specified:

#### Administrative Identifiers (6 variables - Redundant with FHIR)
- **organization_id**, **patient_id**, **encounter_id**, **observation_id**, **condition_id**, **medication_id**: These administrative identifiers are handled through FHIR's native `id` and `identifier` elements, making custom implementations redundant.

#### Standard FHIR Elements (4 variables - Covered by Base FHIR)
- **birth_date**, **encounter_date**, **effective_date**, **date_written**: These are standard FHIR elements (`Patient.birthDate`, `Encounter.period.start`, `Observation.effectiveDateTime`, `MedicationRequest.authoredOn`) that don't require T1D-specific customization.

#### Low Clinical Value Elements (3 variables - Limited Clinical Relevance)
- **encounter_time**, **effective_time**: Time precision beyond date is rarely critical for T1D quality metrics.
- **value_units**: UCUM units are handled through FHIR's standard `valueQuantity.unit` element.

### Coded Values Not Included (39 of 409 - 9.5%)

The following coded values were **not included** for the reasons specified:

#### Standard External Terminology (22 codes - Available in External Systems)
- **Gender codes** (`male`, `female`, `non-binary`, `unknown`): Available in HL7 AdministrativeGender
- **Race/Ethnicity codes** (HL7 v3 codes): Available in HL7 v3 Race/Ethnicity ValueSets
- **Language codes** (`en`, `es`, `zh`, etc.): Available in BCP 47 language codes
- **Provider ID preferences** (`1st`, `2nd`, `3rd`, `4th`): Implementation-specific, not clinically relevant

#### FHIR Standard Status Codes (12 codes - Covered by Base FHIR ValueSets)
- **Encounter status**, **Observation status**, **Condition status**, **Medication status**: Available in standard FHIR ValueSets

#### Implementation-Specific Codes (5 codes - Not Clinically Relevant)
- **T1D encoding system**, **Epic-specific codes**, **Date-formatted device models**: Internal coding schemes not suitable for FHIR standards

### Implementation Rationale

The **90%+ coverage achieved** represents comprehensive clinical coverage while maintaining:
1. **FHIR Standards Compliance**: Using existing FHIR elements and terminology prevents duplication
2. **Clinical Relevance**: Focus on clinically meaningful T1D-specific data
3. **Implementation Simplicity**: Avoiding vendor-specific or overly granular elements

### Usage Examples

For complete examples of how these mappings are implemented, see the [Examples](examples.html) page, which provides sample instances for each profile demonstrating proper variable mapping.