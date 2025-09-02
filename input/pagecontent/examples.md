

> **IMPLEMENTER NOTE**: This Implementation Guide is an early work in progress developed through human-AI collaboration. It requires expert review, testing, and validation before any production use. The profiles, terminology, and guidance should be considered draft and subject to significant revision based on clinical expert feedback and real-world testing.

This page provides example instances demonstrating the proper use of T1D Exchange profiles.

### Patient Examples

#### T1DPatientExample
A comprehensive example of a T1D patient with all required and optional elements, including new specification-based extensions.

**Key Features Demonstrated:**
- T1D Exchange patient identifier with encryption requirements
- Medical record number
- Race and ethnicity extensions using NIH/HL7 standards
- Education level extension (High School graduate)
- Language preference (English)
- Primary insurance type (Extended Healthcare)
- Postal code with proper formatting
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
An endocrinologist specializing in diabetes care with multiple identifier types.

**Key Features Demonstrated:**
- T1D Exchange provider identifier
- NPI identifier (1st preference per specification)
- Multiple identifier support (NPI, POS, DEA, other)
- Provider type qualification with priority levels
- Complete name and demographics
- Specification-based identifier hierarchy

#### T1DOrganizationExample
A pediatric diabetes center.

**Key Features Demonstrated:**
- T1D Exchange organization identifier
- Organization type classification
- Contact information

### Encounter Examples

#### T1DEncounterExample
A routine follow-up visit for T1D management with enhanced tracking.

**Key Features Demonstrated:**
- Unique encounter ID with consistency requirements
- Ambulatory encounter class (Priority: High)
- Follow-up encounter type
- Proper resource references with T1D Exchange priorities
- Encounter timing and duration
- Epic-specific implementation guidance (HAR/CSN values)
- Status tracking with specification priorities

### Observation Examples

#### T1DGlucoseObservationExample
A glucose measurement with additional monitoring data and specification-based calculations.

**Key Features Demonstrated:**
- Unique observation ID with hash generation method
- LOINC coding for glucose measurement (Priority: High)
- Proper units (mg/dL) with conversion guidance
- Component data for BGM mean with rounding rules
- CGM metrics with percentage calculations
- Time in range calculations (70-180 mg/dL target)
- Reference ranges with abnormal thresholds
- Reference to encounter and performer with priorities

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
Type 1 diabetes mellitus diagnosis with enhanced tracking.

**Key Features Demonstrated:**
- Unique condition ID with hash generation (patient_id+ICD10Code+onset_date)
- SNOMED CT coding for T1D (Priority: High)
- Active clinical status with specification guidance
- Confirmed verification status
- Diagnosis date extension
- Problem list categorization (Priority: Low)
- Onset date tracking (Priority: Low)
- Recorded date documentation (Priority: Low)

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
Insulin prescription with T1D-specific extensions and specification priorities.

**Key Features Demonstrated:**
- Unique medication prescription ID with consistency requirements
- RxNorm insulin coding (Priority: High)
- Subcutaneous route
- Dosage instructions
- Insulin regimen extension (basal-bolus, Priority: High)
- Delivery method extension (insulin pen, Priority: High)
- Provider linkage (Priority: Low)
- Encounter reference (Priority: Low)
- Authorization date tracking (Priority: Low)

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

### Testing Scenarios

#### Scenario 1: New Patient Registration with Full Demographics
1. Create T1DPatient with demographics including race, ethnicity, language, insurance
2. Generate unique T1D Exchange patient ID (encrypted, no PHI)
3. Create T1DCondition for T1D diagnosis with unique condition ID
4. Create initial T1DEncounter with proper identifier consistency
5. Create baseline T1DHbA1cObservation with unique observation ID

#### Scenario 2: Routine Follow-up Visit with Enhanced Tracking
1. Create T1DEncounter for follow-up with status tracking
2. Create T1DGlucoseObservation with BGM mean and CGM metrics
3. Calculate time in range and percentage above 180 mg/dL
4. Update T1DMedicationRequest with insulin regimen and delivery method
5. Create T1DSDOHObservation for screening with proper categorization

#### Scenario 3: Provider and Organization Management
1. Create T1DProvider with multiple identifier types (NPI preferred)
2. Create T1DOrganization with coordinating center assignment
3. Link providers to organization with proper references
4. Maintain identifier consistency across submissions

#### Scenario 4: Comprehensive Data Submission
1. Use specification priority levels to determine required vs. optional elements
2. Implement unique ID generation methods for observations and conditions
3. Maintain cross-table identifier consistency
4. Follow Epic-specific guidance for encounter identifiers (HAR/CSN)

### Implementation Notes

**Specification Integration:**
All examples now include elements enhanced with T1D Exchange specification data:
- **Priority Levels**: High, Medium, Low priorities guide implementation focus
- **Unique ID Generation**: Hash-based methods for consistent identification
- **Cross-table Consistency**: Identifier management across multiple submissions
- **Epic Integration**: Specific guidance for HAR/CSN encounter values
- **Calculation Methods**: Detailed formulas for glucose metrics and ranges

**Data Quality Requirements:**
- Use encrypted patient IDs without PHI
- Maintain identifier consistency across all tables
- Follow rounding rules for glucose measurements
- Implement proper unit conversions (mmol/L to mg/dL)
- Apply reference ranges for abnormal value detection

These examples provide a foundation for implementing the T1D Exchange profiles in real-world scenarios with full specification compliance. Use them as templates and modify according to your specific use cases and data requirements.