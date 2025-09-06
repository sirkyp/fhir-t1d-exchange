### FHIR Artifact Creation Approach

This page documents the systematic approach used to create FHIR artifacts from the T1D Exchange data specifications.

#### T1D Exchange Specification Structure

The T1D Exchange data specifications consist of two primary Excel files containing comprehensive variable definitions:

**Source Files:**
- `QICoreDataSpec_v_0_3_0.xlsx` - Core demographic and clinical data specifications
- `QIDiabetesDataSpec_v_0_3_0.xlsx` - Diabetes-specific clinical and device data specifications

**Specification Structure (10 sheets total):**
- **Patients Sheet**: Demographics, insurance, education, race/ethnicity (28 variables)
- **Providers Sheet**: Healthcare provider identifiers and specialties (8 variables) 
- **Organizations Sheet**: Healthcare organization details (6 variables)
- **Encounters Sheet**: Clinical encounter information (12 variables)
- **Observations Sheet**: Laboratory results and vital signs (35 variables)
- **Disease Sheet**: T1D-specific disease management (23 variables)
- **Insulin Sheet**: Insulin therapy and device management (18 variables)
- **Monitoring Sheet**: BGM/CGM device usage and analytics (23 variables)

**Implementation Status:**
- **Core T1D Disease Management**: Complete (52 of 153 variables - 34% coverage)
- **Device Integration & Insulin Management**: In progress (targeting 77 of 153 variables - 50% coverage)

**Variable Metadata Structure:**
Each variable includes:
- `variable`: Variable name (e.g., `t1d_dx_dt`, `bgm_mean`)
- `description`: Clinical definition and usage context
- `code_system`: Terminology system (LOINC, SNOMED CT, T1D custom)
- `value`: Data type (Integer, Date, Coded, String)
- `format`: Precision requirements (e.g., "1 Decimal", "YYYYMMDD")
- `data_mapping_priority`: Implementation priority (High, Medium, Low)
- `notes`: Implementation guidance and clinical context
- `coded_values`: Allowed values for coded fields (409 total coded values)

#### FHIR Artifact Translation Process

**1. Variable Analysis and Grouping**

Variables were analyzed and grouped by clinical domain:
- **Core Demographics** → Patient profile extensions
- **Clinical Events** → Observation profiles with components
- **Device Information** → Observation profiles and terminology
- **Care Management** → Condition extensions and observation profiles

**2. Profile Design Decisions**

**Base FHIR Approach**: Profiles inherit from base FHIR R4 resources rather than US Core to avoid slicing complexity and maintain implementation simplicity.

**Component vs. Separate Observation Strategy**:
- **Components Used**: When variables are contextually dependent (e.g., DKA lab values during DKA events)
- **Separate Profiles Used**: When variables represent distinct clinical concepts (e.g., glucose vs. HbA1c observations)

**Extension Strategy**:
- **Patient Extensions**: Race, ethnicity, education, language, insurance
- **Condition Extensions**: T1D diagnosis date, transition planning
- **Medication Extensions**: Insulin regimen, delivery method
- **Encounter Extensions**: Location, duration

**3. Terminology Creation Process**

**External Standard Mapping**:
- **LOINC**: Laboratory observations (glucose, HbA1c, autoantibodies)
- **SNOMED CT**: Clinical conditions, procedures, family history
- **RxNorm**: Medications (insulin types, diabetes medications)
- **HL7 v3**: Demographics (race, ethnicity, education)
- **UCUM**: Units of measure (mg/dL, %, mmol/L)

**Custom Terminology Creation**:
- **T1D CodeSystem**: 25+ codes for T1D-specific concepts (BGM mean, time-in-range, device companies)
- **T1D ValueSets**: 31 ValueSets grouping related concepts (glucose codes, insulin regimens, device models)
- **Hypoglycemia Awareness CodeSystem**: 4 codes for awareness levels
- **SDOH Response CodeSystem**: 7 codes for screening responses

**4. Profile Enhancement with Specification Data**

**Element Definitions**: Full content from specification "Definition" column mapped to `StructureDefinition.element.definition`

**Element Short Descriptions**: 5-10 word summaries from Definition column for `element.short`

**Element Comments**: Combined specification data including:
- "Data Mapping Priority" (High/Medium/Low)
- "Notes" column content
- Implementation guidance
- Clinical context

**Must Support Determination**: Based on "Data Mapping Priority" from specifications:
- **High Priority** → Must Support = true
- **Medium/Low Priority** → Must Support based on clinical importance

**5. Example Creation Strategy**

**Specification-Based Examples**:
- Hash-generated IDs using specification algorithms
- Priority-based element population (High priority elements included)
- Epic-specific guidance integration (HAR/CSN values)
- Clinical scenario coverage (DKA events, hypoglycemia awareness)

**Bundle Pattern Examples**:
- Adapted from HL7 CGM Implementation Guide patterns
- T1D Exchange quality reporting workflows
- Batch data submission scenarios

#### Key Design Patterns and Architectural Decisions

**1. Component Model for Contextual Data**

For variables that are contextually dependent on a primary clinical event, we use FHIR Observation components:

```
T1DDKAObservation (primary: DKA event count)
├── serumBicarbonate component (dka_serum_bicarb)
├── bloodPH component (dka_blood_ph)
├── patientReportedInpatient component (dka_events_inp_pro)
└── patientReportedEventDate component (dka_events_pro_dt)
```

**Rationale**: Lab values are specifically "during DKA" not general lab results, maintaining clinical context and implementation simplicity.

**2. Extension Strategy for Resource Enhancement**

T1D-specific data elements that extend base FHIR resources use extensions:

```
T1DPatient
├── race extension (race)
├── ethnicity extension (ethnicity) 
├── educationLevel extension (education_level)
├── language extension (language)
└── primaryInsurance extension (primary_insurance_type)

T1DCondition
├── diagnosisDate extension (t1d_dx_dt)
└── transitionPlan extension (documented_transition_plan)
```

**3. Modular Observation Profiles**

Distinct clinical concepts use separate observation profiles:
- **T1DGlucoseObservation**: Glucose measurements with BGM/CGM analytics
- **T1DHbA1cObservation**: Laboratory HbA1c results
- **T1DHypoglycemiaAwarenessObservation**: Patient awareness assessment
- **T1DCareScreeningObservation**: Preventive care tracking
- **T1DSDOHScreeningObservation**: Social determinants screening
- **T1DInsulinDosingObservation**: Daily insulin dosing with decimal precision
- **T1DInsulinPumpManagementObservation**: Pump site changes and dose adjustments
- **T1DBGMUsageObservation**: Blood glucose meter usage frequency
- **T1DCGMUsageObservation**: CGM usage with sensor tracking
- **T1DDeviceReportReviewObservation**: Patient device report review tracking

**4. Terminology Hierarchy**

```
T1D Custom Terminology
├── T1DCodes CodeSystem (45+ codes)
│   ├── Clinical concepts (bgm-mean, time-in-range)
│   ├── Device concepts (bgm-company, cgm-company, insulin-pump)
│   ├── Care concepts (flu-dt, transportation-insecurity)
│   └── Insulin/device management (insulin-dosing, cgm-usage)
├── T1DHypoglycemiaAwareness CodeSystem (4 codes)
├── T1DSDOHResponses CodeSystem (7 codes)
├── Device Terminology:
│   ├── T1DInsulinPumpCompany CodeSystem (10 manufacturers)
│   ├── T1DInsulinPumpModel CodeSystem (30+ pump models)
│   ├── T1DCGMCompany CodeSystem (6 manufacturers)
│   ├── T1DCGMModel CodeSystem (10+ CGM models)
│   ├── T1DBGMCompany CodeSystem (14 manufacturers)
│   ├── T1DBGMModel CodeSystem (40+ BGM models)
│   ├── T1DInsulinPenCompany CodeSystem (9 manufacturers)
│   ├── T1DInsulinPenModel CodeSystem (15+ pen models)
│   ├── T1DPumpDeliverySystem CodeSystem (7 delivery types)
│   └── T1DDeviceUsageMethod CodeSystem (4 reporting methods)
└── 45+ ValueSets grouping related concepts
```

**5. Bundle Patterns for Data Exchange**

Adapted from HL7 CGM Implementation Guide:
- **T1DDataSubmissionBundle**: Comprehensive registry submission
- **T1DPatientDataBundle**: Patient-centric data extraction  
- **T1DQualityReportBundle**: Population health reporting

**6. Specification Traceability**

Every FHIR element maintains traceability to source specifications:
- **Element.definition**: Full specification definition text
- **Element.short**: Concise 5-10 word summary
- **Element.comment**: Priority level + notes + implementation guidance
- **Must Support**: Based on specification priority levels

#### Quality Assurance Process

**Build Validation**:
- Zero FHIR validation errors maintained
- Comprehensive SUSHI/FSH build pipeline
- Automated terminology validation
- Example coverage for all profiles

**Specification Compliance**:
- 100% variable mapping documentation
- Priority-based implementation tracking
- Clinical expert review integration points
- Version control with specification alignment