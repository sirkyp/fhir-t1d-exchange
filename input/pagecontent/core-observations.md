### Core Laboratory Observations

The T1D Exchange identifies 23 core laboratory observations that are of particular interest for Type 1 diabetes care and should be included when submitting data. These observations should be reported using the [T1DObservation](StructureDefinition-t1d-observation.html) profile with the appropriate LOINC codes.

#### Autoantibody Testing

| Observation | LOINC Codes |
|-------------|-------------|
| **HbA1c** | 4548-4, 4549-2, 17856-6 |
| **Anti-IA2/Islet Cell Antibodies** | 31209-0, 56718-0, 32636-3 |
| **Insulin Autoantibodies** | 8072-1 |
| **Zinc Transporter 8** | 76651-9 |
| **Anti-GAD** | 13926-1, 56540-8 |

#### Lipid Panel

| Observation | LOINC Codes |
|-------------|-------------|
| **Total Cholesterol** | 2093-3 |
| **HDL Cholesterol** | 2085-9 |
| **LDL Cholesterol** | 2089-1 (direct only, NOT 13457-7) |
| **Triglycerides** | 2571-8 |

#### Thyroid Function

| Observation | LOINC Codes |
|-------------|-------------|
| **TSH** | 3016-3 |
| **Free T4** | 3024-7 |
| **Total T4** | 3026-2 |
| **TPO Antibody** | 8099-4 |
| **Thyroglobulin Antibody** | 8098-6 |

#### Celiac Screening

| Observation | LOINC Codes |
|-------------|-------------|
| **TTG IgA** | 31017-7 |
| **TTG IgG** | 32998-7 |
| **Serum IgA** | 2458-8 |
| **Endomysial Antibodies** | 13092-2, 14708-2 |

#### Kidney Function

| Observation | LOINC Codes |
|-------------|-------------|
| **Urine Albumin** | 14957-5, 6942-7 |
| **Urine Creatinine** | 2161-8 |
| **Serum Creatinine** | 2160-0 |
| **Anion Gap** | 10466-1, 1863-0, 33037-3 |

#### Additional Tests

| Observation | LOINC Codes |
|-------------|-------------|
| **C-peptide** | 1986-9 |

#### Implementation Notes

- All observations should use the [T1DObservation](StructureDefinition-t1d-observation.html) profile
- Use the specific LOINC codes provided for each test
- Include observations in [T1DDataSubmissionBundle](StructureDefinition-t1d-data-submission-bundle.html) when available
- For LDL cholesterol, use direct measurement (2089-1) only, not calculated values
- Work with the T1D Exchange Coordinating Center for any labs not represented with correct codes