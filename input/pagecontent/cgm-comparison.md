# CGM IG Comparison and Alignment

This page compares the T1D Exchange Implementation Guide with the HL7 Continuous Glucose Monitoring (CGM) Implementation Guide to identify alignment opportunities and complementary capabilities.

## Overview Comparison

| Aspect | T1D Exchange IG | HL7 CGM IG |
|--------|-----------------|------------|
| **Scope** | Comprehensive T1D care data | CGM-specific data exchange |
| **Focus** | Quality improvement & research | Device data submission |
| **Base Resources** | FHIR R4 core resources | FHIR R4 core resources |
| **Jurisdiction** | T1D Exchange collaborative | Universal (worldwide) |
| **Maturity** | Development | STU 1 Ballot |

## Key Architectural Differences

### Data Exchange Patterns

**T1D Exchange IG:**
- Traditional FHIR resource exchange
- Profile-based constraints
- Quality metric calculation support
- Multi-domain clinical data

**HL7 CGM IG:**
- Bundle-based data submission (`$submit-cgm-bundle` operation)
- Standing order mechanism for automated submissions
- Device-centric data flow
- CGM-specific focus

### Profile Structure Comparison

#### Glucose Observations

**T1D Exchange Approach:**
```fsh
Profile: T1DGlucoseObservation
Parent: T1DObservation
* category = vital-signs
* code from T1DGlucoseCodeValueSet
* component contains bgmMean 0..1, timeInRange 0..1
```

**HL7 CGM Approach:**
```json
// Separate profiles for each metric
- cgm-summary-mean-glucose-mass-per-volume
- cgm-summary-times-in-ranges  
- cgm-sensor-reading-mass-per-volume
```

## Complementary Capabilities

### T1D Exchange Strengths
- **Comprehensive Care Context**: Includes providers, encounters, medications, conditions
- **Quality Improvement Focus**: Built-in support for T1D care quality metrics
- **Social Determinants**: SDOH screening and family history
- **Care Transitions**: Pediatric to adult care planning
- **Research Integration**: Population health and benchmarking support

### HL7 CGM Strengths
- **Standardized CGM Metrics**: Detailed glucose range definitions with LOINC codes
- **Device Integration**: Robust device modeling and data submission workflows
- **Automated Submission**: Standing order mechanism for regular data updates
- **Precision Specifications**: Exact glucose range thresholds and calculations
- **International Standards**: HL7-approved universal CGM data exchange

## Alignment Opportunities

### 1. CGM Metric Standardization

The T1D Exchange IG could adopt HL7 CGM's standardized glucose range definitions:

**Current T1D Exchange:**
- Custom `time-in-range` component
- T1D-specific codes

**Potential Alignment:**
- Adopt HL7 CGM's five-range system (very low, low, target, high, very high)
- Use LOINC codes where available (e.g., `97510-2` for time in target range)
- Implement precise range thresholds as defined in CGM IG

### 2. Device Modeling

**Current T1D Exchange:**
- Basic device information in observations
- String-based device identification

**Enhancement Opportunity:**
- Adopt CGM IG's Device profile structure
- Include device metadata and capabilities
- Support device-specific data submission patterns

### 3. Data Submission Workflows

**Current T1D Exchange:**
- Traditional FHIR resource exchange
- Manual data collection processes

**Enhancement Opportunity:**
- Implement CGM IG's `$submit-cgm-bundle` operation
- Add standing order mechanism for automated CGM data collection
- Support scheduled data submission workflows

## Implementation Recommendations

### Short-term Alignment

1. **Adopt CGM Range Definitions**
   - Update T1DGlucoseObservation to use HL7 CGM's five glucose ranges
   - Include LOINC codes for standardized glucose metrics
   - Maintain backward compatibility with existing T1D codes

2. **Enhance Device Profiles**
   - Reference CGM IG's device modeling approach
   - Add device-specific extensions where needed for T1D context

### Long-term Integration

1. **Hybrid Approach**
   - Use HL7 CGM IG for pure CGM data exchange
   - Use T1D Exchange IG for comprehensive T1D care context
   - Create mapping guidance between the two IGs

2. **Operational Integration**
   - Implement CGM IG's submission operations within T1D Exchange workflows
   - Use CGM standing orders to populate T1D Exchange quality metrics
   - Maintain T1D-specific extensions for research and quality improvement

## Technical Considerations

### Code System Alignment

**Recommended Approach:**
```fsh
// Use LOINC where available, T1D codes as fallback
* code from T1DGlucoseCodeValueSet (extensible)
* code.coding contains
    loinc 0..1 and
    t1d-codes 0..1
```

### Bundle Structure

**CGM IG Pattern:**
- Transaction bundles with multiple related observations
- Batch submission of device data
- Automated processing workflows

**T1D Exchange Integration:**
- Adopt bundle patterns for CGM data within T1D encounters
- Maintain individual resource exchange for non-CGM data
- Support both patterns based on use case

## Conclusion

The T1D Exchange IG and HL7 CGM IG serve complementary purposes:

- **HL7 CGM IG**: Standardized, device-focused glucose monitoring data exchange
- **T1D Exchange IG**: Comprehensive T1D care quality improvement and research platform

**Recommended Strategy:**
1. Align glucose monitoring components with HL7 CGM standards
2. Maintain T1D Exchange's broader clinical context and quality focus
3. Support interoperability between both IGs through mapping and conversion utilities
4. Consider HL7 CGM IG as a dependency for glucose monitoring components

This alignment would provide T1D Exchange implementers with both standardized CGM data exchange capabilities and comprehensive T1D care management support.