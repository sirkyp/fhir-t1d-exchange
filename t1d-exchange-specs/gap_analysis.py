#!/usr/bin/env python3

import json
import re
from pathlib import Path

# Load extracted variables and coded values
with open('variables_metadata.json', 'r') as f:
    spec_data = json.load(f)

# Read all FSH files to analyze current implementation
fsh_dir = Path('../input/fsh')
fsh_content = ""
for fsh_file in fsh_dir.glob('*.fsh'):
    with open(fsh_file, 'r') as f:
        fsh_content += f.read() + "\n"

# Extract implemented elements from FSH files
implemented_elements = set()
implemented_codes = set()

# Find profile elements (lines with * element_name)
element_pattern = r'\* (\w+(?:\[\w+\])?(?:\.\w+)*)'
for match in re.finditer(element_pattern, fsh_content):
    implemented_elements.add(match.group(1))

# Find LOINC codes
loinc_pattern = r'http://loinc\.org#([\w-]+)'
for match in re.finditer(loinc_pattern, fsh_content):
    implemented_codes.add(match.group(1))

# Find SNOMED codes  
snomed_pattern = r'http://snomed\.info/sct#(\d+)'
for match in re.finditer(snomed_pattern, fsh_content):
    implemented_codes.add(match.group(1))

# Find custom codes
custom_pattern = r'http://t1dexchange\.org/fhir/CodeSystem/t1d-codes#([\w-]+)'
for match in re.finditer(custom_pattern, fsh_content):
    implemented_codes.add(match.group(1))

print("=== T1D Exchange Variable Gap Analysis ===")
# Count total variables and coded values across all sheets
total_variables = 0
total_coded_values = 0

for spec_type in ['qicore_specifications', 'diabetes_specifications']:
    if spec_type in spec_data:
        for sheet_name, sheet_data in spec_data[spec_type].items():
            if 'variables' in sheet_data:
                total_variables += len(sheet_data['variables'])
            if 'coded_values' in sheet_data:
                total_coded_values += len(sheet_data['coded_values'])

print(f"Specification Variables: {total_variables}")
print(f"Specification Coded Values: {total_coded_values}")
print(f"Implemented FSH Elements: {len(implemented_elements)}")
print(f"Implemented Codes: {len(implemented_codes)}")

# Analyze variable coverage
missing_variables = []
for spec_type in ['qicore_specifications', 'diabetes_specifications']:
    if spec_type in spec_data:
        for sheet_name, sheet_data in spec_data[spec_type].items():
            if 'variables' in sheet_data:
                for var in sheet_data['variables']:
                    var_name = var.get('variable', var.get('variable_name', '')).lower()
                    
                    # Check if variable is represented in FSH
                    found = False
                    for element in implemented_elements:
                        if var_name in element.lower():
                            found = True
                            break
                    
                    if not found:
                        missing_variables.append({
                            'variable_name': var.get('variable', var.get('variable_name', '')),
                            'definition': var.get('definition', var.get('description', '')),
                            'sheet': sheet_name,
                            'spec_type': spec_type
                        })

# Analyze coded value coverage
missing_coded_values = []
for spec_type in ['qicore_specifications', 'diabetes_specifications']:
    if spec_type in spec_data:
        for sheet_name, sheet_data in spec_data[spec_type].items():
            if 'coded_values' in sheet_data:
                for cv in sheet_data['coded_values']:
                    code_text = cv['code'].lower()
                    found = any(code_text in impl_code.lower() for impl_code in implemented_codes)
                    
                    if not found:
                        missing_coded_values.append({
                            'code': cv['code'],
                            'display': cv['display'],
                            'variable_name': cv.get('variable_name', ''),
                            'field_name': cv.get('field_name', ''),
                            'sheet': sheet_name,
                            'spec_type': spec_type
                        })

print(f"\n=== Missing Variables: {len(missing_variables)} ===")
for var in missing_variables[:10]:  # Show first 10
    print(f"- {var['variable_name']} ({var['sheet']}): {var['definition'][:50]}...")

print(f"\n=== Missing Coded Values: {len(missing_coded_values)} ===")
for cv in missing_coded_values[:10]:  # Show first 10
    print(f"- {cv['code']}: {cv['display']} ({cv['sheet']})")

# Save detailed gap analysis
gap_analysis = {
    'summary': {
        'spec_variables': total_variables,
        'spec_coded_values': total_coded_values,
        'implemented_elements': len(implemented_elements),
        'implemented_codes': len(implemented_codes),
        'missing_variables': len(missing_variables),
        'missing_coded_values': len(missing_coded_values)
    },
    'missing_variables': missing_variables,
    'missing_coded_values': missing_coded_values,
    'implemented_elements': list(implemented_elements),
    'implemented_codes': list(implemented_codes)
}

with open('gap_analysis.json', 'w') as f:
    json.dump(gap_analysis, f, indent=2)

print(f"\n=== Gap Analysis Complete ===")
print(f"Detailed results saved to gap_analysis.json")
print(f"Coverage: {((total_variables - len(missing_variables)) / total_variables * 100):.1f}% variables")
print(f"Coverage: {((total_coded_values - len(missing_coded_values)) / total_coded_values * 100):.1f}% coded values")