> **IMPLEMENTER NOTE**: This Implementation Guide is an early work in progress developed through human-AI collaboration. It requires expert review, testing, and validation before any production use. The profiles, terminology, and guidance should be considered draft and subject to significant revision based on clinical expert feedback and real-world testing.

This page describes the terminology resources (CodeSystems and ValueSets) defined in the T1D Exchange Implementation Guide.

### Code Systems

#### [T1DIdentifierType](CodeSystem-t1d-identifier-type.html)
**URL:** `http://t1dexchange.org/fhir/CodeSystem/t1d-identifier-type`

Defines identifier types used throughout the T1D Exchange system.

| Code | Display | Definition |
|------|---------|------------|
| T1D-ID | T1D Patient ID | T1D Exchange patient identifier |
| T1D-PROVIDER-ID | T1D Provider ID | T1D Exchange provider identifier |
| T1D-ORG-ID | T1D Organization ID | T1D Exchange organization identifier |
| T1D-ENCOUNTER-ID | T1D Encounter ID | T1D Exchange encounter identifier |

#### [T1DCodes](CodeSystem-t1d-codes.html)
**URL:** `http://t1dexchange.org/fhir/CodeSystem/t1d-codes`

T1D-specific codes for observations, measurements, and other clinical concepts.

| Code | Display | Definition |
|------|---------|------------|
| t1d-dx-dt | T1D Diagnosis Date | Date of Type 1 diabetes diagnosis |
| bgm-mean | BGM Mean | Blood glucose meter mean/average |
| cgm-high-above-180 | CGM High Above 180 | Percentage of time above 180 mg/dL |
| time-in-range | Time in Range | Percentage of time in target glucose range |
| ins-regimen | Insulin Regimen | Type of insulin regimen |
| bgm-company | BGM Company | Blood glucose meter manufacturer |
| cgm-company | CGM Company | Continuous glucose monitor manufacturer |
| documented-transition-plan | Documented Transition Plan | Transition plan from pediatric to adult care |
| transportation-insecurity | Transportation Insecurity | Transportation access challenges |
| housing-insecurity | Housing Insecurity | Housing stability challenges |

### Value Sets

#### Demographics

##### [T1DGenderValueSet](ValueSet-t1d-gender-valueset.html)
**URL:** `http://t1dexchange.org/fhir/ValueSet/t1d-gender-valueset`

Gender values including non-binary option for T1D Exchange.
- Includes all codes from `http://hl7.org/fhir/administrative-gender`
- Supports: male, female, other, unknown

##### [T1DRaceValueSet](ValueSet-t1d-race-valueset.html)
**URL:** `http://t1dexchange.org/fhir/ValueSet/t1d-race-valueset`

Race categories for T1D Exchange based on OMB standards.
- Includes codes from `urn:oid:2.16.840.1.113883.6.238` (Race and Ethnicity - CDC)

##### [T1DEthnicityValueSet](ValueSet-t1d-ethnicity-valueset.html)
**URL:** `http://t1dexchange.org/fhir/ValueSet/t1d-ethnicity-valueset`

Ethnicity categories for T1D Exchange based on OMB standards.
- Includes codes from `urn:oid:2.16.840.1.113883.6.238` (Race and Ethnicity - CDC)

##### [T1DEducationLevelValueSet](ValueSet-t1d-education-level-valueset.html)
**URL:** `http://t1dexchange.org/fhir/ValueSet/t1d-education-level-valueset`

Education level categories for patients or guardians.
- Elementary School
- Some secondary or high school education
- High School or secondary school degree complete
- Some College education
- College or baccalaureate degree complete
- Doctoral or post graduate education

#### Provider and Organization

##### T1DProviderSpecialtyValueSet
**URL:** `http://t1dexchange.org/fhir/ValueSet/t1d-provider-specialty-valueset`

Healthcare provider specialties relevant to T1D care.
- Endocrinology, Diabetes & Metabolism Physician
- Pediatrics Physician
- Internal Medicine Physician
- Nurse Practitioner
- Clinical Nurse Specialist
- Dietitian, Registered

##### T1DOrganizationTypeValueSet
**URL:** `http://t1dexchange.org/fhir/ValueSet/t1d-organization-type-valueset`

Types of healthcare organizations in T1D Exchange.
- Healthcare Provider
- Hospital Department
- Organizational team

#### Encounters

##### T1DEncounterClassValueSet
**URL:** `http://t1dexchange.org/fhir/ValueSet/t1d-encounter-class-valueset`

Encounter classes for T1D Exchange.
- ambulatory
- inpatient encounter
- emergency
- virtual

##### T1DEncounterTypeValueSet
**URL:** `http://t1dexchange.org/fhir/ValueSet/t1d-encounter-type-valueset`

Types of encounters for T1D care.
- Encounter for check up
- Follow-up encounter
- Encounter for problem
- Consultation

#### Observations

##### T1DGlucoseCodeValueSet
**URL:** `http://t1dexchange.org/fhir/ValueSet/t1d-glucose-code-valueset`

Glucose measurement codes from LOINC.
- 2339-0: Glucose [Mass/volume] in Blood
- 6689-4: Glucose [Mass/volume] in Plasma
- 15074-8: Glucose [Moles/volume] in Blood
- 33747-0: Glucose [Mass/volume] in Capillary blood

##### T1DGlucoseUnitsValueSet
**URL:** `http://t1dexchange.org/fhir/ValueSet/t1d-glucose-units-valueset`

Units for glucose measurements.
- mg/dL (preferred for T1D Exchange)
- mmol/L

##### T1DHbA1cUnitsValueSet
**URL:** `http://t1dexchange.org/fhir/ValueSet/t1d-hba1c-units-valueset`

Units for HbA1c measurements.
- % (percentage)
- mmol/mol

##### T1DSDOHCodeValueSet
**URL:** `http://t1dexchange.org/fhir/ValueSet/t1d-sdoh-code-valueset`

Social determinants of health codes from LOINC.
- 93030-5: Transportation concerns
- 93033-9: Housing concerns
- 97063-2: Family history of diabetes

#### Conditions

##### T1DConditionCodeValueSet
**URL:** `http://t1dexchange.org/fhir/ValueSet/t1d-condition-code-valueset`

Condition codes relevant to T1D Exchange from SNOMED CT.
- 46635009: Type 1 diabetes mellitus
- 4855003: Retinopathy due to diabetes mellitus
- 127013003: Diabetic nephropathy
- 230572002: Diabetic neuropathy
- 421895002: Diabetic ketoacidosis

#### Medications

##### T1DMedicationCodeValueSet
**URL:** `http://t1dexchange.org/fhir/ValueSet/t1d-medication-code-valueset`

Medications relevant to T1D treatment from RxNorm.
- Insulin (all types)
- Metformin
- Glucagon

##### T1DInsulinRegimenValueSet
**URL:** `http://t1dexchange.org/fhir/ValueSet/t1d-insulin-regimen-valueset`

Types of insulin regimens for T1D patients.
- Basal-Bolus
- Insulin Pump
- Mixed Insulin
- Other

##### T1DInsulinDeliveryValueSet
**URL:** `http://t1dexchange.org/fhir/ValueSet/t1d-insulin-delivery-valueset`

Methods of insulin delivery from SNOMED CT.
- Insulin pump
- Insulin pen
- Syringe

### External Terminologies

The T1D Exchange IG leverages several external terminology systems:

#### LOINC
Used for laboratory tests and clinical observations.
- **URL:** `http://loinc.org`
- **Key codes:** HbA1c, glucose measurements, SDOH questions

#### SNOMED CT
Used for clinical concepts, conditions, and procedures.
- **URL:** `http://snomed.info/sct`
- **Key codes:** Diabetes conditions, medications, procedures

#### RxNorm
Used for medication coding.
- **URL:** `http://www.nlm.nih.gov/research/umls/rxnorm`
- **Key codes:** Insulin products, diabetes medications

#### UCUM
Used for units of measure.
- **URL:** `http://unitsofmeasure.org`
- **Key units:** mg/dL, mmol/L, %, units

#### HL7 Terminologies
Used for administrative and structural codes.
- **Administrative Gender:** `http://hl7.org/fhir/administrative-gender`
- **Observation Categories:** `http://terminology.hl7.org/CodeSystem/observation-category`
- **Condition Categories:** `http://terminology.hl7.org/CodeSystem/condition-category`

### Usage Guidelines

#### Preferred Terminologies
- Use LOINC for all laboratory and observation codes
- Use SNOMED CT for clinical conditions and procedures
- Use RxNorm for medication identification
- Use UCUM for all units of measure

#### Code Selection
- Always include both code and display values
- Use the most specific code available
- Include system URLs in all coding elements
- Support multiple coding systems where applicable

#### Value Set Binding Strength
- **Required:** Must use codes from the specified value set
- **Extensible:** Should use codes from the value set, but may use others if needed
- **Preferred:** Encouraged to use codes from the value set
- **Example:** Value set provides examples, but any appropriate code may be used

#### Localization
- All display values are provided in English
- Implementers may provide translations for local use
- Code values remain constant across languages