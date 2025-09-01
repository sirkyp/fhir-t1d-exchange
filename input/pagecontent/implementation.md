### Technical Implementation Requirements

This page provides detailed technical requirements for implementing T1D Exchange profiles.

### Must Support Elements

#### Must Support Definition
Elements marked as "Must Support" (MS) in the T1D Exchange profiles represent data elements that have direct mappings to the T1D Exchange data specifications. These elements are critical for T1D Exchange quality improvement and research objectives.

#### Must Support Criteria

An element is flagged as Must Support if:
1. **Direct T1D Exchange Mapping**: The element maps to a specific data field in the T1D Exchange specifications
2. **Quality Metric Dependency**: The element is required for calculating T1D Exchange quality metrics
3. **Research Critical**: The element is essential for T1D Exchange research and population health analysis
4. **Interoperability Requirement**: The element is necessary for consistent data exchange between T1D Exchange participants

#### Must Support Obligations

Systems claiming conformance to T1D Exchange profiles must:

- **Sender Systems**: Must be capable of sending the element if data is available in their system
- **Receiver Systems**: Must be capable of receiving, processing, and storing the element
- **Data Persistence**: Must store Must Support elements for future retrieval and reporting
- **Quality Reporting**: Must include Must Support elements in T1D Exchange quality reports when applicable

#### Missing Must Support Data

When Must Support data is not available:
- **Optional Elements (0..1, 0..*)**: May be omitted from the resource
- **Required Elements (1..1, 1..*)**: Must be present; use appropriate null flavors or data absent reasons if actual values are unknown
- **Quality Impact**: Missing Must Support data may affect quality metric calculations and should be minimized

### Identifier Requirements

Some profiles require specific identifiers:
- **T1DPatient**: Must include T1D-ID, may include MRN
- **T1DProvider**: Must include T1D-PROVIDER-ID, may include NPI
- **T1DOrganization**: Must include T1D-ORG-ID
- **T1DEncounter**: Must include T1D-ENCOUNTER-ID

All T1D Exchange identifiers use consistent system URIs:
- **Patient IDs**: `http://t1dexchange.org/fhir/patient-id`
- **Provider IDs**: `http://t1dexchange.org/fhir/provider-id`
- **Organization IDs**: `http://t1dexchange.org/fhir/organization-id`
- **Encounter IDs**: `http://t1dexchange.org/fhir/encounter-id`

### Data Collection Standards

#### Date Formats
- Use YYYY-MM-DD format for dates
- Include time zones for dateTime elements
- Support partial dates (YYYY-MM or YYYY) where specified
- **Research Note**: Consistent date formatting is critical for longitudinal analysis and care transition tracking

#### Coding Requirements

##### Standard Terminologies
The IG uses standard terminologies where available:
- **LOINC**: Laboratory and clinical observations
- **SNOMED CT**: Clinical concepts and conditions
- **RxNorm**: Medications
- **UCUM**: Units of measure
- **HL7 v3**: Administrative codes

##### Custom Terminologies
T1D-specific concepts use custom CodeSystems:
- `http://t1dexchange.org/fhir/CodeSystem/t1d-codes`
- `http://t1dexchange.org/fhir/CodeSystem/t1d-identifier-type`

- Use specified value sets for coded elements
- Include both code and display values
- Support multiple coding systems where applicable
- **Quality Note**: Standardized coding enables accurate aggregation and comparison across participating sites

#### Units of Measure
- Use UCUM codes for all quantities
  - Glucose: `mg/dL` (preferred) or `mmol/L`
  - HbA1c: `%` or `mmol/mol`
  - Time: `min`, `h`, `d`
  - Percentages: `%`
- Round glucose means to nearest integer
- **Clinical Note**: Consistent units support accurate clinical decision-making and quality metric calculation

### FHIR Technical Requirements

#### FHIR Version
This IG is based on FHIR R4 (4.0.1). Ensure your FHIR server supports this version.

#### Profile Conformance
Ensure resources conform to the appropriate T1D Exchange profiles by following the constraints and requirements defined in each profile.

### Data Submission Guidelines

#### File Organization
Organize data submissions according to the original specification structure:
- One file per resource type
- Include organization ID in filename
- Use version identifier in filename

#### Bundle Processing
For T1D Exchange data submissions, see the [Bundle Patterns](bundles.html) page for detailed guidance on:
- Bundle profiles and their specific use cases
- Performance optimization and size management
- Error handling and validation strategies

#### Error Handling
Implement robust error handling:
- Check resource conformance before submission
- Handle partial failures gracefully
- Provide meaningful error messages

### Testing

#### Testing Requirements
- Test against provided examples
- Test with edge cases and boundary conditions
- Perform integration testing with T1D Exchange systems

#### Common Implementation Issues
- Missing required identifiers
- Incorrect value set bindings
- Invalid reference targets
- Missing must-support elements

For additional support, consult the FHIR specification documentation.