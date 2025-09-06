# T1D Exchange FHIR Implementation Guide

**IMPLEMENTER NOTE**: This Implementation Guide is an early work in progress developed through human-AI collaboration. It requires expert review, testing, and validation before any production use. The profiles, terminology, and guidance should be considered draft and subject to significant revision based on clinical expert feedback and real-world testing.

This repository contains the FHIR Implementation Guide (IG) for the T1D Exchange Data Specification, facilitating standardized exchange of Type 1 Diabetes health information.

## Overview

The T1D Exchange Implementation Guide provides:
- 30 FHIR R4 profiles with specification-based constraints and detailed implementation guidance
- 15 extensions for capturing T1D-specific information including demographics, clinical data, device management, and care coordination
- 3 bundle profiles for comprehensive data exchange patterns
- 2 operations for data submission and patient extraction
- 45 value sets and 16 code systems for consistent T1D terminology including comprehensive device manufacturer/model codes
- Comprehensive implementation guidance with priority levels from T1D Exchange specifications
- Complete examples demonstrating proper profile usage

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
│   │   ├── T1DExamples.fsh
│   │   └── T1DBundleExamples.fsh
│   └── pagecontent/          # IG documentation pages
│       ├── index.md
│       ├── overview.md
│       ├── implementation.md
│       ├── profiles.md
│       ├── bundles.md
│       ├── workflows.md
│       ├── quality-metrics.md
│       ├── security.md
│       ├── terminology.md
│       ├── examples.md
│       ├── mapping.md
│       ├── cgm-comparison.md
│       └── downloads.md
├── t1d-exchange-specs/       # Original Excel specifications and data extraction scripts
│   ├── QICoreDataSpec_v_0_3_0.xlsx
│   ├── QIDiabetesDataSpec_v_0_3_0.xlsx
│   ├── extract_profile_data.py
│   └── profile_enhancement_data.json
├── .amazonq/rules/CONTEXT.md # Project requirements and context
└── blog.md                  # Development collaboration story
```

## Key Profiles

### Core Profiles (30 total)
- **T1DPatient**: Patient demographics with race, ethnicity, language, insurance, and education extensions
- **T1DProvider**: Healthcare providers with multiple identifier types (NPI, POS, DEA, other)
- **T1DOrganization**: Healthcare organizations with T1D Exchange coordination
- **T1DEncounter**: Clinical encounters with unique ID tracking and Epic-specific guidance
- **T1DObservation**: Base observation with unique ID generation and reference ranges
  - **T1DGlucoseObservation**: Glucose measurements with BGM/CGM metrics and time-in-range calculations
  - **T1DHbA1cObservation**: Hemoglobin A1c laboratory results
  - **T1DSDOHObservation**: Social determinants of health screening
  - **T1DInsulinDosingObservation**: Daily insulin dosing with decimal precision
  - **T1DInsulinPumpManagementObservation**: Pump site changes and dose adjustments
  - **T1DBGMUsageObservation**: Blood glucose meter usage frequency
  - **T1DCGMUsageObservation**: CGM usage with sensor tracking
  - **T1DDeviceReportReviewObservation**: Patient device report review tracking
- **T1DCondition**: T1D diagnosis with unique condition ID and transition planning
- **T1DMedicationRequest**: Insulin prescriptions with regimen and delivery method tracking
- **T1DMedicationStatement**: Current medication documentation
- **T1DFamilyHistory**: Family diabetes history
- **T1DDevice**: Base device profile with manufacturer and model tracking
  - **T1DInsulinPumpDevice**: Insulin pump with delivery system and start date
  - **T1DCGMDevice**: Continuous glucose monitor with usage tracking
  - **T1DBGMDevice**: Blood glucose meter device
  - **T1DInsulinPenDevice**: Insulin pen device

### Bundle Profiles (3 total)
- **T1DDataSubmissionBundle**: Comprehensive data submission for registries
- **T1DPatientDataBundle**: Patient-centric data extraction
- **T1DQualityReportBundle**: Population health and quality reporting

### Extensions (15 total)
- Demographics: Race, Ethnicity, Education Level, Language, Insurance
- Clinical: Diagnosis Date, Transition Plan, Insulin Regimen, Delivery Method
- Encounter: Location, Duration
- Device: Pump Start Date, Pump Delivery System, Pump Site Change Frequency, CGM Start Date

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
```

## Implementation

### Quick Start

1. Review the [Overview](input/pagecontent/overview.md) and [Implementation Guidance](input/pagecontent/implementation.md)
2. Examine the [Profiles](input/pagecontent/profiles.md) with specification-based constraints
3. Study the [Bundle Patterns](input/pagecontent/bundles.md) for data exchange
4. Review [Examples](input/pagecontent/examples.md) with enhanced elements
5. Check [Quality Metrics](input/pagecontent/quality-metrics.md) for T1D Exchange requirements

### Key Features
- **Specification Integration**: All profiles include detailed definitions, priority levels, and implementation notes from T1D Exchange specifications
- **Unique ID Management**: Hash-based generation methods for consistent cross-table identification
- **Priority Guidance**: High/Medium/Low priority levels guide implementation focus
- **Epic Integration**: Specific guidance for HAR/CSN encounter values
- **CGM Alignment**: Bundle patterns adapted from HL7 CGM Implementation Guide

## Terminology

The IG defines custom terminology for T1D-specific concepts:

### Custom Code Systems (16 total)
- **T1DIdentifierType**: T1D Exchange identifier types (T1D-ID, T1D-PROVIDER-ID, T1D-ORG-ID, T1D-ENCOUNTER-ID)
- **T1DCodes**: T1D-specific observation and measurement codes (BGM mean, CGM metrics, time-in-range, insulin dosing)
- **Device Terminology**: Comprehensive device manufacturer and model codes
  - **T1DInsulinPumpCompany**: 10 insulin pump manufacturers
  - **T1DInsulinPumpModel**: 30+ insulin pump models
  - **T1DCGMCompany**: 6 CGM manufacturers
  - **T1DCGMModel**: 10+ CGM models
  - **T1DBGMCompany**: 14 BGM manufacturers
  - **T1DBGMModel**: 40+ BGM models
  - **T1DInsulinPenCompany**: 9 insulin pen manufacturers
  - **T1DInsulinPenModel**: 15+ insulin pen models
  - **T1DPumpDeliverySystem**: 7 delivery system types
  - **T1DDeviceUsageMethod**: 4 reporting methods
  - **T1DInsulinRegimen**: 8 insulin regimen types

### Value Sets (45 total)
- **Demographics**: Gender, race, ethnicity, education level, language, insurance types
- **Clinical**: Observation categories, glucose codes/units, HbA1c units, condition categories
- **Medications**: Insulin regimens, delivery methods, medication categories
- **Encounters**: Classes, types, reasons, status values
- **SDOH**: Social determinants codes and responses
- **Devices**: Comprehensive manufacturer/model ValueSets for all T1D device types

### External Terminologies
- **LOINC**: Laboratory and observations (glucose, HbA1c, SDOH screening)
- **SNOMED CT**: Clinical concepts (conditions, procedures, family history)
- **RxNorm**: Medications (insulin types, diabetes medications)
- **UCUM**: Units of measure (mg/dL, %, mmol/L)
- **HL7 v3**: Race, ethnicity, education level, provider types

## Examples

Complete examples demonstrate specification-enhanced profiles:
- **T1DExamples.fsh**: Enhanced examples with race, ethnicity, language, insurance, unique IDs, and priority-based elements
- **T1DBundleExamples.fsh**: Bundle examples for comprehensive data exchange patterns
- **T1DDeviceExamples.fsh**: Device examples including insulin pumps, CGMs, BGMs, insulin pens, and usage observations
- **Specification Integration**: Examples include hash-generated IDs, calculation methods, and Epic-specific guidance
- **Priority Demonstration**: Examples show High/Medium/Low priority elements from T1D Exchange specifications
- **Device Integration**: Examples demonstrate comprehensive device manufacturer/model tracking and usage patterns
- Examples are compiled by SUSHI into JSON format in `fsh-generated/resources/`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make changes (FSH or page content files)
4. Test with SUSHI and IG Publisher
5. Submit a pull request

## Support

For questions or support:
- Review the implementation guidance
- Check the examples
- Contact the T1D Exchange team

## License

This implementation guide is licensed under CC0-1.0.

## Published Implementation Guide

- **Live IG**: https://sirkyp.github.io/fhir-t1d-exchange/
- **GitHub Repository**: https://github.com/sirkyp/fhir-t1d-exchange

## Acknowledgments

Based on the T1D Exchange Data Specification and developed through human-AI collaboration with Amazon Q Developer. The IG integrates detailed specification data including definitions, priority levels, and implementation guidance from the original T1D Exchange Excel specifications.

Developed in collaboration with the T1D Exchange research initiative and T1D Exchange Quality Improvement Collaborative.
