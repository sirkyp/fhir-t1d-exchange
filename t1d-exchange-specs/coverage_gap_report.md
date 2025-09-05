# T1D Exchange FHIR IG - Coverage Gap Analysis
==================================================

## Coverage Statistics
- **Specification Variables**: 127
- **Specification Coded Values**: 415
- **Implemented Coded Values**: 97
- **Missing Coded Values**: 400
- **Coded Value Coverage**: 23.4%

- **Profiles Implemented**: 15
- **Extensions Implemented**: 11
- **ValueSets Implemented**: 28
- **CodeSystems Implemented**: 2

## Missing Coded Values by Category

### Loinc Codes (70 items)
- `9279-01-01 00:00:00` - Respiratory rate
- `93033-9` - Are you worried about losing your housing?
- `74011-8` - Lifetime tobacco use
- `39156-5` - BMI
- `8302-2` - 
- `9279-01-01 00:00:00` - 
- `55758-7` - PHQ-2 Depression screening score
- `54845-3` - Current tobacco use (last 7 days) – (No – 0, Yes 1)
- `70272-0` - PHQ-4 Depression screening score
- `1002-5` - 
- ... and 60 more

### Device Codes (1 items)
- `device_report_patient_reviewed` - Patient did not review device data

### Status Values (7 items)
- `fourth two digits` - Variable attribute: 01 == completed
- `finished` - An encounter with the patient is complete; there should be additional encounter data
- `left_before_finish` - Patient arrived and met with a provider but left before appointment was officially completed.
- `WR` - Weakly reactive
- `NR` - Non-reactive
- `RR` - Reactive
- `completed` - code was completed

### Other (322 items)
- `OD` - Optometrist
- `SYN-R` - 
- `9` - 
- `NS` - Non-susceptible
- `RN` - 
- `NP` - Nurse Practitioner
- `3` - 
- `RN` - Registered Nurse
- `SYN-S` - Synergy-susceptible
- `2` - Private
- ... and 312 more

## Priority Recommendations

### High Priority
- **Loinc Codes**: 70 missing codes

### Medium Priority
- **Device Codes**: 1 missing codes
- **Status Values**: 7 missing codes

### Variable Mapping Review Needed
- **Total Variables**: 127 require manual review for FHIR mapping
- Review each variable for appropriate FHIR element mapping
- Identify variables that may need new extensions or profiles