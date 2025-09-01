

This page provides a comprehensive mapping of T1D Exchange specification variables to their corresponding FHIR Implementation Guide representations.

### Overview

The T1D Exchange data specifications define variables across multiple domains that have been mapped to FHIR resources and profiles in this Implementation Guide. This mapping ensures consistent data exchange and interoperability.

### Core Data Mappings

#### Patient Demographics (QICoreDataSpec - Patients)

| Variable | Description | FHIR Profile | FHIR Element | Value Set/Coding |
|----------|-------------|--------------|--------------|------------------|
| T1D_ID | T1D Exchange patient identifier | T1DPatient | identifier[t1d-id].value | - |
| MRN | Medical record number | T1DPatient | identifier[mrn].value | - |
| DOB | Date of birth | T1DPatient | birthDate | - |
| SEX | Patient gender | T1DPatient | gender | AdministrativeGender |
| RACE | Patient race | T1DPatient | extension[us-core-race] | OMB Race Categories |
| ETHNICITY | Patient ethnicity | T1DPatient | extension[us-core-ethnicity] | OMB Ethnicity Categories |
| EDUCATION | Education level | T1DPatient | extension[educationLevel] | T1DEducationLevelValueSet |

#### Provider Information (QICoreDataSpec - Providers)

| Variable | Description | FHIR Profile | FHIR Element | Value Set/Coding |
|----------|-------------|--------------|--------------|------------------|
| PROVIDER_ID | T1D Exchange provider identifier | T1DProvider | identifier[t1d-provider-id].value | - |
| NPI | National Provider Identifier | T1DProvider | identifier[npi].value | - |
| PROVIDER_NAME | Provider name | T1DProvider | name | - |
| SPECIALTY | Provider specialty | T1DProvider | qualification.code | T1DProviderSpecialtyValueSet |
| ORG_ID | Organization identifier | T1DOrganization | identifier[t1d-org-id].value | - |
| ORG_NAME | Organization name | T1DOrganization | name | - |
| ORG_TYPE | Organization type | T1DOrganization | type | T1DOrganizationTypeValueSet |

#### Clinical Encounters (QICoreDataSpec - Encounters)

| Variable | Description | FHIR Profile | FHIR Element | Value Set/Coding |
|----------|-------------|--------------|--------------|------------------|
| ENCOUNTER_ID | T1D Exchange encounter identifier | T1DEncounter | identifier[t1d-encounter-id].value | - |
| ENCOUNTER_DATE | Date of encounter | T1DEncounter | period.start | - |
| ENCOUNTER_TYPE | Type of encounter | T1DEncounter | type | T1DEncounterTypeValueSet |
| ENCOUNTER_LOCATION | Location of encounter | T1DEncounter | extension[encounterLocation] | - |
| ENCOUNTER_DURATION | Duration of encounter | T1DEncounter | extension[encounterDuration] | - |

#### Disease Information (QIDiabetesDataSpec - Disease)

| Variable | Description | FHIR Profile | FHIR Element | Value Set/Coding |
|----------|-------------|--------------|--------------|------------------|
| T1D_DIAGNOSIS_DATE | Date of T1D diagnosis | T1DCondition | onsetDateTime | - |
| T1D_DIAGNOSIS_DATE | Date of T1D diagnosis | T1DCondition | extension[diagnosisDate] | - |
| TRANSITION_PLAN | Adult care transition plan | T1DCondition | extension[transitionPlan] | SNOMED CT |

#### Insulin Management (QIDiabetesDataSpec - Insulin)

| Variable | Description | FHIR Profile | FHIR Element | Value Set/Coding |
|----------|-------------|--------------|--------------|------------------|
| INSULIN_TYPE | Type of insulin | T1DMedicationRequest | medicationCodeableConcept | T1DMedicationCodeValueSet |
| INSULIN_REGIMEN | Insulin regimen type | T1DMedicationRequest | extension[insulinRegimen] | T1DInsulinRegimenValueSet |
| DELIVERY_METHOD | Insulin delivery method | T1DMedicationRequest | extension[deliveryMethod] | T1DInsulinDeliveryValueSet |
| INSULIN_DOSE | Insulin dosage | T1DMedicationRequest | dosageInstruction.doseAndRate.doseQuantity | - |
| INSULIN_FREQUENCY | Dosing frequency | T1DMedicationRequest | dosageInstruction.timing.repeat.frequency | - |

#### Glucose Monitoring (QIDiabetesDataSpec - Monitoring)

| Variable | Description | FHIR Profile | FHIR Element | Value Set/Coding |
|----------|-------------|--------------|--------------|------------------|
| BGM_COMPANY | Blood glucose meter company | T1DObservation | valueString | - |
| BGM_MODEL | Blood glucose meter model | T1DObservation | valueString | - |
| CGM_COMPANY | Continuous glucose monitor company | T1DObservation | valueString | - |
| CGM_MODEL | Continuous glucose monitor model | T1DObservation | valueString | - |
| MONITORING_METHOD | Glucose monitoring method | T1DObservation | code | T1DObservationCodeValueSet |

#### Glucose Measurements (QIDiabetesDataSpec - Glucose)

| Variable | Description | FHIR Profile | FHIR Element | Value Set/Coding |
|----------|-------------|--------------|--------------|------------------|
| GLUCOSE_VALUE | Glucose measurement value | T1DGlucoseObservation | valueQuantity.value | - |
| GLUCOSE_UNIT | Glucose measurement unit | T1DGlucoseObservation | valueQuantity.unit | T1DGlucoseUnitsValueSet |
| BGM_MEAN | Blood glucose meter mean | T1DGlucoseObservation | component[bgmMean].valueQuantity | - |
| CGM_HIGH_ABOVE_180 | CGM readings above 180 mg/dL | T1DGlucoseObservation | component[cgmHighAbove180].valueQuantity | - |
| TIME_IN_RANGE | Time in target glucose range | T1DGlucoseObservation | component[timeInRange].valueQuantity | - |

#### Laboratory Results (QICoreDataSpec - Observations)

| Variable | Description | FHIR Profile | FHIR Element | Value Set/Coding |
|----------|-------------|--------------|--------------|------------------|
| HBA1C_VALUE | Hemoglobin A1c value | T1DHbA1cObservation | valueQuantity.value | - |
| HBA1C_UNIT | Hemoglobin A1c unit | T1DHbA1cObservation | valueQuantity.unit | T1DHbA1cUnitsValueSet |
| HBA1C_DATE | Date of HbA1c test | T1DHbA1cObservation | effectiveDateTime | - |

#### Social Determinants of Health (QIDiabetesDataSpec - Diabetes_Core_Observations)

| Variable | Description | FHIR Profile | FHIR Element | Value Set/Coding |
|----------|-------------|--------------|--------------|------------------|
| TRANSPORTATION_BARRIER | Transportation barriers to care | T1DSDOHObservation | valueCodeableConcept | T1DSDOHResponseValueSet |
| FOOD_INSECURITY | Food insecurity status | T1DSDOHObservation | valueCodeableConcept | T1DSDOHResponseValueSet |
| HOUSING_STABILITY | Housing stability status | T1DSDOHObservation | valueCodeableConcept | T1DSDOHResponseValueSet |
| FINANCIAL_STRAIN | Financial strain assessment | T1DSDOHObservation | valueCodeableConcept | T1DSDOHResponseValueSet |

#### Family History

| Variable | Description | FHIR Profile | FHIR Element | Value Set/Coding |
|----------|-------------|--------------|--------------|------------------|
| FAMILY_DIABETES_HISTORY | Family history of diabetes | T1DFamilyHistory | condition.code | SNOMED CT |
| RELATIONSHIP | Family member relationship | T1DFamilyHistory | relationship | v3-RoleCode |
| ONSET_AGE | Age of onset in family member | T1DFamilyHistory | condition.onsetAge | - |

### Usage Examples

For complete examples of how these mappings are implemented, see the [Examples](examples.html) page, which provides sample instances for each profile demonstrating proper variable mapping.