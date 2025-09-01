This page provides an overview of the FHIR profiles defined in the T1D Exchange Implementation Guide.

### Patient Profiles

#### [T1DPatient](StructureDefinition-t1d-patient.html)
The T1DPatient profile extends the base FHIR Patient resource to include T1D-specific demographic information and identifiers required for the T1D Exchange.

**Key Features:**
- Required T1D Exchange patient identifier

- Education level extension for patient or guardian
- Enhanced gender options including non-binary

**Must Support Elements:**
- identifier (T1D-ID and MRN)
- active status
- name
- gender
- birthDate
- education level extension

### Provider Profiles

#### [T1DProvider](StructureDefinition-t1d-provider.html)
The T1DProvider profile extends the FHIR Practitioner resource for healthcare professionals involved in T1D care.

**Key Features:**
- T1D Exchange provider identifier
- NPI support for US providers
- Specialty qualifications relevant to diabetes care

**Must Support Elements:**
- identifier (T1D-PROVIDER-ID and NPI)
- active status
- name
- qualification (with T1D specialty codes)

#### [T1DOrganization](StructureDefinition-t1d-organization.html)
The T1DOrganization profile extends the FHIR Organization resource for healthcare facilities and organizations.

**Key Features:**
- T1D Exchange organization identifier
- Organization type classification
- Contact and address information

**Must Support Elements:**
- identifier (T1D-ORG-ID)
- active status
- type (with T1D organization types)
- name

### Encounter Profiles

#### [T1DEncounter](StructureDefinition-t1d-encounter.html)
The T1DEncounter profile extends the FHIR Encounter resource to capture T1D-specific encounter information.

**Key Features:**
- T1D Exchange encounter identifier
- Encounter classification and types relevant to diabetes care
- Extensions for location and duration
- Links to T1D patients and providers

**Must Support Elements:**
- identifier (T1D-ENCOUNTER-ID)
- class (with T1D encounter classes)
- type (with T1D encounter types)
- subject (reference to T1DPatient)
- participant (reference to T1DProvider)
- period and start time
- reasonCode (with T1D reason codes)
- serviceProvider (reference to T1DOrganization)
- encounter duration extension

### Observation Profiles

#### [T1DObservation](StructureDefinition-t1d-observation.html) (Base)
The base observation profile for all T1D Exchange observations.

**Key Features:**
- Standardized categorization
- Required subject and effective date
- Support for T1D-specific codes

#### [T1DGlucoseObservation](StructureDefinition-t1d-glucose-observation.html)
Specialized profile for glucose measurements and monitoring data.

**Key Features:**
- Glucose measurement values with proper units
- Components for BGM mean, CGM metrics, and time in range
- Support for both mg/dL and mmol/L units

#### [T1DHbA1cObservation](StructureDefinition-t1d-hba1c-observation.html)
Specialized profile for Hemoglobin A1c laboratory results.

**Key Features:**
- Standardized HbA1c coding (LOINC 4548-4)
- Support for percentage and mmol/mol units
- Laboratory category classification

#### [T1DSDOHObservation](StructureDefinition-t1d-sdoh-observation.html)
Specialized profile for Social Determinants of Health observations.

**Key Features:**
- SDOH-specific codes for transportation and housing
- Support for various response types
- Social history categorization

### Condition Profiles

#### [T1DCondition](StructureDefinition-t1d-condition.html)
The T1DCondition profile extends the FHIR Condition resource for T1D and related conditions.

**Key Features:**
- T1D-specific condition codes
- Diagnosis date extension
- Transition plan documentation
- Support for complications and comorbidities

**Must Support Elements:**
- category (with T1D condition categories)
- code (with T1D condition codes)
- subject (reference to T1DPatient)
- encounter (reference to T1DEncounter)
- onset date/time
- diagnosis date extension
- transition plan extension

#### [T1DFamilyHistory](StructureDefinition-t1d-family-history.html)
The T1DFamilyHistory profile extends the FHIR FamilyMemberHistory resource for diabetes family history.

**Key Features:**
- Family relationship coding
- Diabetes-related condition codes
- Onset information

### Medication Profiles

#### [T1DMedicationRequest](StructureDefinition-t1d-medication-request.html)
The T1DMedicationRequest profile extends the FHIR MedicationRequest resource for T1D medications.

**Key Features:**
- Insulin and diabetes medication codes
- Insulin regimen extension
- Delivery method extension (pump, pen, syringe)
- Dosage and timing information

#### [T1DMedicationStatement](StructureDefinition-t1d-medication-statement.html)
The T1DMedicationStatement profile extends the FHIR MedicationStatement resource for documenting current medications.

**Key Features:**
- Current medication status
- Patient-reported medication information
- Dosage and adherence data

### Profile Relationships

The profiles are designed to work together as a cohesive system:

```
T1DPatient
├── T1DEncounter
│   ├── T1DObservation
│   │   ├── T1DGlucoseObservation
│   │   ├── T1DHbA1cObservation
│   │   └── T1DSDOHObservation
│   ├── T1DCondition
│   └── T1DMedicationRequest
├── T1DFamilyHistory
└── T1DMedicationStatement
```

### Extensions

The implementation guide defines several extensions to capture T1D-specific information:

| Extension | Purpose | Used In |
|-----------|---------|---------|

| T1DEducationLevel | Education level | T1DPatient |
| T1DDiagnosisDate | T1D diagnosis date | T1DCondition |
| T1DTransitionPlan | Pediatric to adult transition | T1DCondition |
| T1DInsulinRegimen | Type of insulin regimen | T1DMedicationRequest |
| T1DInsulinDeliveryMethod | Insulin delivery method | T1DMedicationRequest |
| T1DEncounterLocation | Specific encounter location | T1DEncounter |
| T1DEncounterDuration | Encounter duration | T1DEncounter |

### Profile Constraints

All profiles include:
- Cardinality constraints
- Value set bindings
- Must Support flags (based on T1D Exchange data specification mappings)
- Invariants where applicable

#### Must Support Designation

Elements are marked as Must Support (MS) when they:
- Map directly to T1D Exchange data specification fields
- Are required for T1D Exchange quality metrics calculation
- Support critical T1D research and population health objectives

This ensures that all T1D Exchange-specific data elements are consistently supported across implementing systems.

### Bundle Profiles

The T1D Exchange IG defines three bundle profiles for efficient batch data exchange, following patterns from the HL7 CGM Implementation Guide.

#### T1DDataSubmissionBundle
The T1DDataSubmissionBundle profile supports comprehensive T1D data submission as a single transaction.

**Key Features:**
- Transaction type for atomic operations
- Conditional creates to prevent duplicates
- Organized entry slicing for different resource types
- Support for batch data upload from registries and EHR systems

**Use Cases:**
- Bulk data submission from T1D registries
- EHR integration for daily data sync
- Quality reporting data submission

**Entry Types:**
- Patient demographics (T1DPatient)
- Healthcare providers (T1DProvider)
- Organizations (T1DOrganization)
- Clinical encounters (T1DEncounter)
- Observations and measurements (T1DObservation)
- Conditions and diagnoses (T1DCondition)
- Medications and treatments (T1DMedicationRequest)

#### T1DPatientDataBundle
The T1DPatientDataBundle profile provides comprehensive data for a single patient.

**Key Features:**
- Collection type for read-only data retrieval
- Patient-centric organization
- Comprehensive coverage of all T1D-relevant data
- Support for date range filtering

**Use Cases:**
- Care coordination and transitions
- Longitudinal patient data for research
- Individual patient quality assessment
- Clinical decision support

**Entry Types:**
- Required patient demographics (T1DPatient)
- Clinical encounters (T1DEncounter)
- T1D observations and measurements (T1DObservation)
- Diagnoses and conditions (T1DCondition)
- Insulin and diabetes medications (T1DMedicationRequest)

#### T1DQualityReportBundle
The T1DQualityReportBundle profile supports population health reporting and benchmarking.

**Key Features:**
- Collection type for aggregate data
- Organization-centric reporting
- Support for quality measure reports
- De-identification for population analysis

**Use Cases:**
- Quality improvement collaborative reporting
- Population health benchmarking
- Aggregate outcome analysis
- Performance measurement

**Entry Types:**
- Reporting organization (T1DOrganization)
- Quality measure reports (MeasureReport)
- Aggregate observations (T1DObservation)
- De-identified patient data (T1DPatient)

### Bundle Operations

The implementation guide defines operations for working with bundles:

#### $submit-t1d-data
Processes T1D data submission bundles with transaction semantics.

**Input:** T1DDataSubmissionBundle
**Output:** Transaction-response bundle with processing results

#### $extract-patient-data
Retrieves comprehensive patient data as a bundle.

**Input:** Patient ID and optional date range
**Output:** T1DPatientDataBundle with all relevant patient data

### Implementation Guidance

#### Bundle Size Management
- Limit bundles to 1000 resources for optimal performance
- Split large datasets across multiple bundles
- Use pagination for large patient populations

#### Error Handling
- Process transaction-response bundles systematically
- Implement retry logic for transient failures
- Provide meaningful error messages

#### Data Quality
- Use consistent identifier schemes
- Implement deduplication strategies
- Follow profile constraints and requirements

For detailed implementation guidance and examples, see the [Bundle Patterns](bundles.html) page.