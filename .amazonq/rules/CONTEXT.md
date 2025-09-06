# Project Context
- You are an HL7 FHIR Implementation Guide expert. 
- You are an expert in the T1D Exchange: https://t1dexchange.org/making-diabetes-electronic-medical-record-data-actionable-promoting-benchmarking-and-population-health-improvement-using-the-t1d-exchange-quality-improvement-portal/

## Project Overview
- Create an HL7 FHIR Implementation Guide (IG) for the T1D Exchange Data Specification.
- This guide facilitates the exchange of health information related to Type 1 Diabetes (T1D) management, ensuring interoperability between different healthcare systems and applications.
- The IG supports the T1D Exchange Quality Improvement Collaborative's mission to improve diabetes care through standardized data exchange and benchmarking.

## Specification Structure and Requirements

### T1D Exchange Data Specifications
- **Source Specifications**: 2 Excel files (QICoreDataSpec_v_0_3_0.xlsx, QIDiabetesDataSpec_v_0_3_0.xlsx)
- **Total Variables**: 153 variables across 10 specification sheets
- **Coded Values**: 409 coded values requiring terminology creation
- **Metadata Structure**: Structured JSON extraction with priority classification
- **Priority Levels**: High/Medium/Low priority mapping drives implementation order

### Required FHIR Artifacts
- **Core Profiles**: Patient, Provider, Organization, Encounter, Observation variants, Condition, Medication profiles
- **Bundle Profiles**: Data submission, patient data, and quality reporting bundle patterns
- **Operations**: Data submission and patient extraction operations
- **Terminology**: Custom CodeSystems and ValueSets for T1D-specific concepts
- **Extensions**: T1D-specific data elements not covered by base FHIR
- **Examples**: Comprehensive example instances demonstrating proper usage
- **Documentation**: Implementation guidance and variable mapping documentation

### Key Architectural Decisions
- **Base FHIR Approach**: Profiles inherit from base FHIR R4 resources rather than US Core to avoid slicing complexity
- **Component Model Strategy**: Contextually dependent variables (e.g., DKA lab values) implemented as Observation components rather than separate observations
- **Extension Strategy**: T1D-specific enhancements use extensions (Patient demographics, Condition diagnosis date, Medication regimens)
- **Bundle-Centric Design**: Adopted CGM IG bundle patterns for batch data sharing optimized for quality improvement workflows
- **Modular Observation Design**: Separate observation profiles for distinct clinical concepts (glucose, HbA1c, hypoglycemia awareness, care screening, SDOH)
- **Priority-Based Implementation**: High priority variables from specifications implemented first
- **Specification Traceability**: Every FHIR element maintains clear mapping to source T1D Exchange variables
- **Terminology Hierarchy**: Custom T1D CodeSystems with external standard integration (LOINC, SNOMED CT, RxNorm)
- **Quality Focus**: Integration of T1D Exchange Quality Improvement Collaborative context and metrics

## Requirements

### Functional Requirements (COMPLETED)
- ✅ Create an IG based on the specifications found in the ./t1d-exchange-specs folder
- ✅ Review specs and identify appropriate FHIR resource mappings
- ✅ Define FHIR Profiles with rules and guidelines for data structure
- ✅ Provide comprehensive guidance for developers
- ✅ Create CodeSystem and ValueSet resources for T1D-specific terminologies
- ✅ Document mapping from spec data elements to IG resources
- ✅ Ensure HL7 FHIR R4 compliance
- ✅ Include examples for each profile
- ✅ Validate IG and resolve build errors
- ✅ CGM Implementation Guide comparison and alignment analysis
- ✅ Bundle patterns for batch data sharing (based on CGM IG approach)
- ✅ Operations for data submission and patient extraction
- ✅ T1D Variable-to-FHIR mapping documentation
- ✅ Quality Improvement Collaborative context integration
- ✅ Must Support refinement based on T1D Exchange specification mappings

### Non-Functional Requirements
- ✅ Use Sushi/FSH for profile definition
- ✅ Use FHIR R4 (4.0.1)
- ✅ Minimal dependencies approach

### Technical Requirements
- ✅ Base FHIR R4 dependency
- ✅ IG Publisher integration for local builds
- ✅ SUSHI build pipeline with npm scripts

## Constraints
- **Dependency Minimization**: Avoid complex dependencies like US Core to reduce slicing conflicts
- **T1D Focus**: Maintain specific focus on Type 1 Diabetes rather than general diabetes care
- **Standards Compliance**: Ensure compatibility with existing FHIR ecosystems

## Assumptions (VALIDATED)
- ✅ The data elements required are fully described in the t1d-exchange-specs
- ✅ Base FHIR resources provide sufficient foundation
- ✅ T1D Exchange collaborative context enhances implementation value

## Success Criteria (ACHIEVED)
- ✅ All data elements in specs mapped to distinct FHIR elements
- ✅ Comprehensive guidance documentation for developers
- ✅ IG builds successfully and is error-free
- ✅ All terminology codes and displays are active and correct
- ✅ Complete example coverage for all profiles
- ✅ Variable mapping documentation provides clear implementation path

## Implementation Requirements

### Technical Requirements
- **Build System**: SUSHI/FSH build pipeline with zero validation errors
- **Profile Structure**: Base FHIR R4 inheritance (avoid US Core complexity)
- **Terminology Management**: External standard integration + custom T1D terminology
- **Example Coverage**: Complete examples for all profiles and use cases
- **Documentation**: Comprehensive implementation guidance with specification traceability
- **Bundle Patterns**: CGM IG-aligned patterns for batch data exchange

## FHIR Artifact Creation Methodology

### 1. Specification Processing Approach
- **Systematic Analysis**: Excel specifications converted to structured JSON metadata
- **Variable Grouping**: Clinical domain-based organization (demographics, disease management, insulin therapy, device monitoring)
- **Priority Mapping**: High/Medium/Low priority from specifications drives implementation order
- **Coded Value Extraction**: 409 coded values systematically mapped to FHIR terminology

### 2. Profile Design Patterns

**Component Model for Contextual Data**:
```
T1DDKAObservation (primary: DKA event count)
├── serumBicarbonate component (dka_serum_bicarb)
├── bloodPH component (dka_blood_ph) 
├── patientReportedInpatient component (dka_events_inp_pro)
└── ambulatoryEvents component (dka_events_amb)
```

**Extension Model for Resource Enhancement**:
```
T1DPatient extensions: race, ethnicity, educationLevel, language, primaryInsurance
T1DCondition extensions: diagnosisDate, transitionPlan
T1DMedicationRequest extensions: insulinRegimen, deliveryMethod
```

**Modular Observation Profiles**:
- T1DGlucoseObservation: BGM/CGM measurements with analytics components
- T1DHbA1cObservation: Laboratory HbA1c results
- T1DHypoglycemiaAwarenessObservation: Patient awareness assessment with symptom threshold
- T1DCareScreeningObservation: Preventive care date tracking
- T1DSDOHScreeningObservation: Social determinants screening

### 3. Terminology Creation Strategy
- **External Standard Integration**: LOINC (labs), SNOMED CT (conditions), RxNorm (medications), HL7 v3 (demographics)
- **Custom T1D Terminology**: 25+ codes for T1D-specific concepts (bgm-mean, time-in-range, device companies)
- **Hierarchical ValueSets**: 31 ValueSets grouping related concepts by clinical domain
- **Specification Alignment**: All terminology directly traceable to T1D Exchange coded values

### 4. Quality Assurance Process
- **Build Validation**: Zero FHIR validation errors maintained throughout development
- **Specification Traceability**: Every element.definition, element.short, element.comment mapped from specifications
- **Example Coverage**: Comprehensive examples for all profiles with specification-based data
- **Priority Compliance**: Must Support elements based on specification priority levels

## Enhanced Profile Documentation Requirements
- **Element Definitions**: Map full content from specification "Definition" column to StructureDefinition element.definition
- **Element Short Descriptions**: Create 5-10 word summaries from Definition column for element.short
- **Element Comments**: Combine "Data Mapping Priority" + "Notes" + implementation guidance in element.comment
- **Specification Traceability**: Maintain clear mapping from T1D Exchange specification variables to FHIR elements
- **Priority Integration**: High/Medium/Low priority from specifications drives Must Support designation
- **Clinical Context**: Include clinical significance and usage guidance in implementation notes

## Implementation Phases and Roadmap

### Implementation Phases

**Phase 1: Core T1D Management**
- T1D diagnosis date, hypoglycemia awareness, severe event tracking
- Enhanced DKA observations with lab values and patient-reported data
- Care transition planning, preventive care screening
- SDOH screening for transportation/housing insecurity

**Phase 2: Device Integration**
- Insulin pump/pen profiles with manufacturer/model terminology
- BGM/CGM device tracking and usage analytics
- Insulin dosing profiles with decimal precision

**Phase 3: Glucose Analytics**
- Statistical observation profiles (mean, standard deviation, counts, percentages)
- Time-in-range calculations with standard thresholds
- Quality metrics integration for T1D Exchange collaborative reporting

**Phase 4: Population Health**
- Enhanced demographics and insurance coverage
- Advanced analytics and machine learning-ready data structures
- International alignment with global diabetes registries

## Out of Scope
- US Core Profile dependencies (avoided to reduce complexity)
- Non-T1D diabetes conditions and treatments
- Real-time data streaming (focus on batch data exchange standards)
- Implementation-specific technical details beyond FHIR standards
- Device-specific APIs or proprietary data formats
- Clinical decision support algorithms or treatment recommendations