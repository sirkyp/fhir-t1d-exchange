

This page provides example instances demonstrating the proper use of T1D Exchange profiles.

### Patient Examples

#### T1DPatientExample
A comprehensive example of a T1D patient with all required and optional elements.

**Key Features Demonstrated:**
- T1D Exchange patient identifier
- Medical record number
- Demographic extensions (race, ethnicity, education level)
- Pediatric patient (born 2010)

```json
{
  "resourceType": "Patient",
  "id": "T1DPatientExample",
  "meta": {
    "profile": ["http://t1dexchange.org/fhir/StructureDefinition/t1d-patient"]
  },
  "identifier": [
    {
      "type": {
        "coding": [{
          "system": "http://t1dexchange.org/fhir/CodeSystem/identifier-type",
          "code": "T1D-ID"
        }]
      },
      "system": "http://t1dexchange.org/fhir/patient-id",
      "value": "T1D-12345"
    }
  ],
  "active": true,
  "name": [{
    "family": "Smith",
    "given": ["John"]
  }],
  "gender": "male",
  "birthDate": "2010-05-15"
}
```

### Provider Examples

#### T1DProviderExample
An endocrinologist specializing in diabetes care.

**Key Features Demonstrated:**
- T1D Exchange provider identifier
- NPI identifier
- Specialty qualification
- Complete name and demographics

#### T1DOrganizationExample
A pediatric diabetes center.

**Key Features Demonstrated:**
- T1D Exchange organization identifier
- Organization type classification
- Contact information

### Encounter Examples

#### T1DEncounterExample
A routine follow-up visit for T1D management.

**Key Features Demonstrated:**
- Ambulatory encounter class
- Follow-up encounter type
- Proper resource references
- Encounter timing and duration

### Observation Examples

#### T1DGlucoseObservationExample
A glucose measurement with additional monitoring data.

**Key Features Demonstrated:**
- LOINC coding for glucose measurement
- Proper units (mg/dL)
- Component data for BGM mean
- Reference to encounter and performer

**Clinical Context:**
- Patient glucose level: 150 mg/dL
- BGM average: 145 mg/dL
- Measured during routine visit

#### T1DHbA1cObservationExample
A laboratory HbA1c result.

**Key Features Demonstrated:**
- Standard LOINC code (4548-4)
- Laboratory category
- Percentage units
- Clinical interpretation

**Clinical Context:**
- HbA1c value: 7.2%
- Indicates room for improvement in glucose control
- Measured during routine visit

#### T1DSDOHObservationExample
Social determinants of health screening.

**Key Features Demonstrated:**
- SDOH-specific LOINC codes
- Social history category
- Boolean response values
- Multiple SDOH domains

### Condition Examples

#### T1DConditionExample
Type 1 diabetes mellitus diagnosis.

**Key Features Demonstrated:**
- SNOMED CT coding for T1D
- Active clinical status
- Confirmed verification status
- Diagnosis date extension
- Problem list categorization

**Clinical Context:**
- Diagnosed at age 5 (August 2010)
- Currently active condition
- Recorded during current encounter

#### T1DFamilyHistoryExample
Family history of diabetes.

**Key Features Demonstrated:**
- Family relationship coding
- Diabetes condition codes
- Onset information
- Patient reference

### Medication Examples

#### T1DMedicationRequestExample
Insulin prescription with T1D-specific extensions.

**Key Features Demonstrated:**
- RxNorm insulin coding
- Subcutaneous route
- Dosage instructions
- Insulin regimen extension (basal-bolus)
- Delivery method extension (insulin pen)

**Clinical Context:**
- Insulin prescription for basal-bolus regimen
- 10 units, 4 times daily
- Delivered via insulin pen
- Subcutaneous administration

#### T1DMedicationStatementExample
Current medication documentation.

**Key Features Demonstrated:**
- Active medication status
- Patient-reported information
- Dosage and timing
- Medication adherence data

### Bundle Examples

#### T1DPatientBundleExample
A complete patient record bundle containing related resources.

**Resources Included:**
- T1DPatient
- T1DEncounter
- T1DGlucoseObservation
- T1DHbA1cObservation
- T1DCondition
- T1DMedicationRequest

**Use Case:**
Demonstrates how to submit a complete patient encounter with all related clinical data in a single FHIR Bundle.

### Data Mapping Examples

#### Excel to FHIR Mapping

The following table shows how data elements from the original Excel specifications map to FHIR elements:

| Excel Column | FHIR Resource | FHIR Element | Example Value |
|--------------|---------------|--------------|---------------|
| patient_id | Patient | identifier[t1d-id].value | T1D-12345 |
| mrn | Patient | identifier[mrn].value | MRN-67890 |
| first_name | Patient | name.given | John |
| last_name | Patient | name.family | Smith |
| gender | Patient | gender | male |
| birth_date | Patient | birthDate | 2010-05-15 |
| race_1 | Patient | extension[race].valueCodeableConcept | 2106-3 |
| education_level | Patient | extension[educationLevel].valueCodeableConcept | ELEM |
| provider_id | Practitioner | identifier[t1d-provider-id].value | PROV-12345 |
| encounter_id | Encounter | identifier[t1d-encounter-id].value | ENC-12345 |
| encounter_date | Encounter | period.start | 2024-01-15T09:00:00Z |
| observation_id | Observation | identifier.value | OBS-12345 |
| code | Observation | code.coding.code | 2339-0 |
| value | Observation | valueQuantity.value | 150 |
| units | Observation | valueQuantity.unit | mg/dL |
| t1d_dx_dt | Condition | extension[diagnosisDate].valueDate | 2010-08-20 |
| bgm_mean | Observation | component[bgmMean].valueQuantity.value | 145 |
| ins_regimen | MedicationRequest | extension[insulinRegimen].valueCodeableConcept | basal-bolus |



### Testing Scenarios

#### Scenario 1: New Patient Registration
1. Create T1DPatient with demographics
2. Create T1DCondition for T1D diagnosis
3. Create initial T1DEncounter
4. Create baseline T1DHbA1cObservation

#### Scenario 2: Routine Follow-up Visit
1. Create T1DEncounter for follow-up
2. Create T1DGlucoseObservation with monitoring data
3. Update T1DMedicationRequest if needed
4. Create T1DSDOHObservation for screening

#### Scenario 3: Medication Management
1. Create T1DMedicationRequest for new insulin
2. Include insulin regimen and delivery method
3. Document dosage and timing
4. Link to prescribing encounter

These examples provide a foundation for implementing the T1D Exchange profiles in real-world scenarios. Use them as templates and modify according to your specific use cases and data requirements.