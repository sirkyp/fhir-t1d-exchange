# T1D Exchange FHIR Implementation Guide

This repository contains the FHIR Implementation Guide (IG) for the T1D Exchange Data Specification, facilitating standardized exchange of Type 1 Diabetes health information.

## Overview

The T1D Exchange Implementation Guide provides:
- FHIR R4 profiles for T1D-specific data elements
- Extensions for capturing T1D-specific information
- Terminology and value sets for consistent coding
- Implementation guidance and examples

## Project Structure

```
├── sushi-config.yaml          # SUSHI configuration
├── package.json              # Node.js dependencies
├── input/
│   ├── fsh/                  # FSH profile definitions
│   │   ├── T1DPatient.fsh
│   │   ├── T1DProvider.fsh
│   │   ├── T1DEncounter.fsh
│   │   ├── T1DObservations.fsh
│   │   ├── T1DCondition.fsh
│   │   ├── T1DMedication.fsh
│   │   ├── T1DTerminology.fsh
│   │   ├── T1DTerminologyAdditional.fsh
│   │   └── T1DExamples.fsh
│   ├── pagecontent/          # IG documentation pages
│   │   ├── index.md
│   │   ├── guidance.md
│   │   ├── profiles.md
│   │   ├── terminology.md
│   │   └── examples.md
│   └── examples/             # Example instances
├── t1d-exchange-specs/       # Original Excel specifications
└── CONTEXT.md               # Project requirements
```

## Key Profiles

- **T1DPatient**: Patient demographics with T1D-specific extensions
- **T1DProvider**: Healthcare providers specializing in diabetes care
- **T1DOrganization**: Healthcare organizations and facilities
- **T1DEncounter**: Clinical encounters for T1D care
- **T1DObservation**: Base observation profile with specialized variants:
  - T1DGlucoseObservation: Glucose measurements and monitoring
  - T1DHbA1cObservation: Hemoglobin A1c laboratory results
  - T1DSDOHObservation: Social determinants of health
- **T1DCondition**: T1D diagnosis and related conditions
- **T1DMedicationRequest**: Insulin and diabetes medications

## Data Mapping

The IG maps data elements from the T1D Exchange specifications:

| Specification | FHIR Resource | Profile |
|---------------|---------------|---------|
| Patients | Patient | T1DPatient |
| Providers | Practitioner/Organization | T1DProvider/T1DOrganization |
| Encounters | Encounter | T1DEncounter |
| Observations | Observation | T1DObservation variants |
| Conditions | Condition | T1DCondition |
| Medications | MedicationRequest | T1DMedicationRequest |

## Building the IG

### Prerequisites

1. Install Node.js (v14 or later)
2. Install SUSHI: `npm install -g fsh-sushi`
3. Install HL7 FHIR IG Publisher

### Build Commands

```bash
# Install dependencies
npm install

# Run SUSHI to generate FHIR artifacts
npm run sushi

# Build complete IG (requires IG Publisher)
npm run build

# Validate examples
npm run validate
```

## Implementation

### Quick Start

1. Review the [Implementation Guidance](input/pagecontent/guidance.md)
2. Examine the [Profiles](input/pagecontent/profiles.md)
3. Study the [Examples](input/pagecontent/examples.md)
4. Use the provided terminology resources

### Key Requirements

- FHIR R4 (4.0.1) compliance
- Required T1D Exchange identifiers
- Must Support element implementation
- Proper terminology binding

### Validation

Use the FHIR validator with this IG:

```bash
java -jar validator_cli.jar -ig t1d-exchange -profile http://t1dexchange.org/fhir/StructureDefinition/t1d-patient patient-example.json
```

## Terminology

The IG defines custom terminology for T1D-specific concepts:

- **T1DIdentifierType**: T1D Exchange identifier types
- **T1DCodes**: T1D-specific observation and measurement codes
- **Value Sets**: Comprehensive value sets for demographics, clinical data, and medications

External terminologies used:
- LOINC (laboratory and observations)
- SNOMED CT (clinical concepts)
- RxNorm (medications)
- UCUM (units of measure)

## Examples

Complete examples are provided for all profiles:
- Patient registration with demographics
- Provider and organization setup
- Clinical encounters and observations
- Condition and medication documentation
- SDOH screening and family history

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make changes to FSH files
4. Test with SUSHI
5. Submit a pull request

## Support

For questions or support:
- Review the implementation guidance
- Check the examples
- Contact the T1D Exchange team

## License

This implementation guide is licensed under CC0-1.0.

## Acknowledgments

Based on the T1D Exchange Data Specification and developed in collaboration with the T1D Exchange research initiative.