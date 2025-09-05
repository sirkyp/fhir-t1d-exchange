#!/usr/bin/env python3
"""
Coverage Gap Analysis for T1D Exchange FHIR IG
Compares extracted specification data against current IG implementation
"""

import json
import os
import re
from pathlib import Path

def load_extracted_data():
    """Load the extracted specification data"""
    with open('variables_metadata.json', 'r') as f:
        return json.load(f)

def scan_fsh_files():
    """Scan FSH files to identify implemented elements"""
    fsh_dir = Path('../input/fsh')
    implemented = {
        'variables': set(),
        'coded_values': set(),
        'profiles': set(),
        'extensions': set(),
        'valuesets': set(),
        'codesystems': set()
    }
    
    for fsh_file in fsh_dir.glob('*.fsh'):
        content = fsh_file.read_text()
        
        # Extract profile names
        profiles = re.findall(r'Profile:\s*(\w+)', content)
        implemented['profiles'].update(profiles)
        
        # Extract extension names
        extensions = re.findall(r'Extension:\s*(\w+)', content)
        implemented['extensions'].update(extensions)
        
        # Extract ValueSet names
        valuesets = re.findall(r'ValueSet:\s*(\w+)', content)
        implemented['valuesets'].update(valuesets)
        
        # Extract CodeSystem names
        codesystems = re.findall(r'CodeSystem:\s*(\w+)', content)
        implemented['codesystems'].update(codesystems)
        
        # Extract coded values from ValueSet includes
        coded_values = re.findall(r'#(\w+)\s*"([^"]*)"', content)
        for code, display in coded_values:
            implemented['coded_values'].add(f"{code}|{display}")
        
        # Extract LOINC codes
        loinc_codes = re.findall(r'http://loinc\.org#(\d+-\d+)', content)
        implemented['coded_values'].update(loinc_codes)
        
        # Extract SNOMED codes
        snomed_codes = re.findall(r'http://snomed\.info/sct#(\d+)', content)
        implemented['coded_values'].update(snomed_codes)
    
    return implemented

def analyze_coverage_gaps(extracted_data, implemented):
    """Analyze gaps between specification and implementation"""
    gaps = {
        'missing_variables': [],
        'missing_coded_values': [],
        'unmapped_variables': [],
        'coverage_stats': {}
    }
    
    # Check variable coverage from both QI Core and Diabetes specs
    spec_variables = set()
    
    # Process QI Core specifications
    if 'qicore_specifications' in extracted_data:
        for sheet_name, sheet_data in extracted_data['qicore_specifications'].items():
            if 'variables' in sheet_data:
                for var in sheet_data['variables']:
                    spec_variables.add(var.get('variable', ''))
    
    # Process Diabetes specifications
    if 'diabetes_specifications' in extracted_data:
        for sheet_name, sheet_data in extracted_data['diabetes_specifications'].items():
            if 'variables' in sheet_data:
                for var in sheet_data['variables']:
                    spec_variables.add(var.get('variable', ''))
    
    # Check coded value coverage
    spec_coded_values = set()
    
    # Process QI Core coded values
    if 'qicore_specifications' in extracted_data:
        for sheet_name, sheet_data in extracted_data['qicore_specifications'].items():
            if 'coded_values' in sheet_data:
                for coded_val in sheet_data['coded_values']:
                    code = coded_val.get('code', '')
                    display = coded_val.get('display', '')
                    if code:
                        spec_coded_values.add(code)
                        if display:
                            spec_coded_values.add(f"{code}|{display}")
    
    # Process Diabetes coded values
    if 'diabetes_specifications' in extracted_data:
        for sheet_name, sheet_data in extracted_data['diabetes_specifications'].items():
            if 'coded_values' in sheet_data:
                for coded_val in sheet_data['coded_values']:
                    code = coded_val.get('code', '')
                    display = coded_val.get('display', '')
                    if code:
                        spec_coded_values.add(code)
                        if display:
                            spec_coded_values.add(f"{code}|{display}")
    
    # Remove empty strings
    spec_variables.discard('')
    spec_coded_values.discard('')
    
    # Find missing variables (conceptual - need manual mapping review)
    gaps['unmapped_variables'] = list(spec_variables)
    
    # Find missing coded values
    gaps['missing_coded_values'] = list(spec_coded_values - implemented['coded_values'])
    
    # Calculate coverage statistics
    gaps['coverage_stats'] = {
        'total_spec_variables': len(spec_variables),
        'total_spec_coded_values': len(spec_coded_values),
        'implemented_coded_values': len(implemented['coded_values']),
        'missing_coded_values_count': len(gaps['missing_coded_values']),
        'coded_value_coverage_pct': round((len(implemented['coded_values']) / len(spec_coded_values)) * 100, 1) if spec_coded_values else 0,
        'profiles_implemented': len(implemented['profiles']),
        'extensions_implemented': len(implemented['extensions']),
        'valuesets_implemented': len(implemented['valuesets']),
        'codesystems_implemented': len(implemented['codesystems'])
    }
    
    return gaps

def categorize_missing_coded_values(missing_coded_values, extracted_data):
    """Categorize missing coded values by type and priority"""
    categories = {
        'loinc_codes': [],
        'snomed_codes': [],
        'custom_codes': [],
        'device_codes': [],
        'status_values': [],
        'units': [],
        'other': []
    }
    
    for coded_value in missing_coded_values:
        if '|' in coded_value:
            code, display = coded_value.split('|', 1)
        else:
            code, display = coded_value, ''
        
        # Categorize by pattern
        if re.match(r'\d+-\d+', code):  # LOINC pattern
            categories['loinc_codes'].append({'code': code, 'display': display})
        elif code.isdigit() and len(code) > 5:  # SNOMED pattern
            categories['snomed_codes'].append({'code': code, 'display': display})
        elif 'device' in display.lower() or 'manufacturer' in display.lower():
            categories['device_codes'].append({'code': code, 'display': display})
        elif any(status in display.lower() for status in ['active', 'inactive', 'complete', 'pending']):
            categories['status_values'].append({'code': code, 'display': display})
        elif any(unit in display.lower() for unit in ['mg/dl', 'mmol/l', '%', 'unit']):
            categories['units'].append({'code': code, 'display': display})
        else:
            categories['other'].append({'code': code, 'display': display})
    
    return categories

def generate_gap_report(gaps, categorized_missing):
    """Generate comprehensive gap analysis report"""
    report = []
    
    report.append("# T1D Exchange FHIR IG - Coverage Gap Analysis")
    report.append("=" * 50)
    report.append("")
    
    # Coverage Statistics
    stats = gaps['coverage_stats']
    report.append("## Coverage Statistics")
    report.append(f"- **Specification Variables**: {stats['total_spec_variables']}")
    report.append(f"- **Specification Coded Values**: {stats['total_spec_coded_values']}")
    report.append(f"- **Implemented Coded Values**: {stats['implemented_coded_values']}")
    report.append(f"- **Missing Coded Values**: {stats['missing_coded_values_count']}")
    report.append(f"- **Coded Value Coverage**: {stats['coded_value_coverage_pct']}%")
    report.append("")
    report.append(f"- **Profiles Implemented**: {stats['profiles_implemented']}")
    report.append(f"- **Extensions Implemented**: {stats['extensions_implemented']}")
    report.append(f"- **ValueSets Implemented**: {stats['valuesets_implemented']}")
    report.append(f"- **CodeSystems Implemented**: {stats['codesystems_implemented']}")
    report.append("")
    
    # Missing Coded Values by Category
    report.append("## Missing Coded Values by Category")
    report.append("")
    
    for category, items in categorized_missing.items():
        if items:
            report.append(f"### {category.replace('_', ' ').title()} ({len(items)} items)")
            for item in items[:10]:  # Show first 10
                report.append(f"- `{item['code']}` - {item['display']}")
            if len(items) > 10:
                report.append(f"- ... and {len(items) - 10} more")
            report.append("")
    
    # Priority Recommendations
    report.append("## Priority Recommendations")
    report.append("")
    
    high_priority = ['loinc_codes', 'snomed_codes', 'units']
    medium_priority = ['device_codes', 'status_values']
    
    report.append("### High Priority")
    for category in high_priority:
        if categorized_missing[category]:
            report.append(f"- **{category.replace('_', ' ').title()}**: {len(categorized_missing[category])} missing codes")
    
    report.append("")
    report.append("### Medium Priority")
    for category in medium_priority:
        if categorized_missing[category]:
            report.append(f"- **{category.replace('_', ' ').title()}**: {len(categorized_missing[category])} missing codes")
    
    report.append("")
    report.append("### Variable Mapping Review Needed")
    report.append(f"- **Total Variables**: {len(gaps['unmapped_variables'])} require manual review for FHIR mapping")
    report.append("- Review each variable for appropriate FHIR element mapping")
    report.append("- Identify variables that may need new extensions or profiles")
    
    return "\n".join(report)

def main():
    print("Starting Coverage Gap Analysis...")
    
    # Load data
    extracted_data = load_extracted_data()
    implemented = scan_fsh_files()
    
    # Analyze gaps
    gaps = analyze_coverage_gaps(extracted_data, implemented)
    categorized_missing = categorize_missing_coded_values(gaps['missing_coded_values'], extracted_data)
    
    # Generate report
    report = generate_gap_report(gaps, categorized_missing)
    
    # Save results
    with open('coverage_gap_analysis.json', 'w') as f:
        json.dump({
            'gaps': gaps,
            'categorized_missing': categorized_missing,
            'implemented': {k: list(v) if isinstance(v, set) else v for k, v in implemented.items()}
        }, f, indent=2)
    
    with open('coverage_gap_report.md', 'w') as f:
        f.write(report)
    
    print(f"Analysis complete!")
    print(f"- Total specification variables: {gaps['coverage_stats']['total_spec_variables']}")
    print(f"- Total specification coded values: {gaps['coverage_stats']['total_spec_coded_values']}")
    print(f"- Missing coded values: {gaps['coverage_stats']['missing_coded_values_count']}")
    print(f"- Coded value coverage: {gaps['coverage_stats']['coded_value_coverage_pct']}%")
    print(f"\nResults saved to:")
    print(f"- coverage_gap_analysis.json")
    print(f"- coverage_gap_report.md")

if __name__ == "__main__":
    main()