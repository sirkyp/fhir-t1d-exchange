#!/usr/bin/env python3
"""
Corrected T1D Exchange Specification Variable & Metadata Extraction
Properly separates variables from coded values by detecting 'Allowed Values' sections
"""

import pandas as pd
import json
from pathlib import Path

def extract_qicore_data(file_path):
    """Extract variables and coded values from QICoreDataSpec_v_0_3_0.xlsx"""
    
    sheets_to_process = ['Patients', 'Providers', 'Encounters', 'Observations', 'Conditions', 'Medications']
    extracted_data = {}
    
    for sheet_name in sheets_to_process:
        print(f"Processing QICore sheet: {sheet_name}")
        
        # Read the entire sheet to process both variables and coded values
        df_raw = pd.read_excel(file_path, sheet_name=sheet_name, header=None)
        
        variables = []
        coded_values = []
        variable_names = []
        in_coded_section = False
        current_field_name = ''
        current_variable = ''
        
        # Process each row
        for i, row in df_raw.iterrows():
            if i < 4:  # Skip header rows
                continue
                
            col_a = str(row.iloc[0]).strip() if not pd.isna(row.iloc[0]) else ''
            col_b = str(row.iloc[1]).strip() if not pd.isna(row.iloc[1]) else ''
            col_c = str(row.iloc[2]).strip() if not pd.isna(row.iloc[2]) else ''
            
            # Skip empty rows
            if not col_a and not col_b and not col_c:
                continue
                
            # Check if we've hit the coded values section
            if col_a == 'Field Name' and ('Allowed Values' in col_b or 'Allowed Value' in col_b):
                in_coded_section = True
                continue
                
            if in_coded_section:
                # If column A has a value, it's a new field name
                if col_a and col_a != 'nan':
                    current_field_name = col_a
                    current_variable = find_matching_variable(current_field_name, variable_names)
                
                # If column B has a value, it's a coded value
                if col_b and col_b != 'nan':
                    coded_value = {
                        'code': col_b,
                        'display': col_c,
                        'field_name': current_field_name,
                        'variable_name': current_variable,
                        'notes': str(row.iloc[3]).strip() if len(row) > 3 and not pd.isna(row.iloc[3]) else '',
                        'source_sheet': sheet_name,
                        'source_file': 'QICoreDataSpec_v_0_3_0.xlsx'
                    }
                    
                    # Clean up 'nan' strings
                    for key, value in coded_value.items():
                        if value == 'nan':
                            coded_value[key] = ''
                    
                    coded_values.append(coded_value)
            else:
                # This is a variable row
                if col_b and col_b != 'nan':  # Column B should have the variable name
                    var_data = {
                        'variable': col_b,
                        'definition': col_c,
                        'type': str(row.iloc[3]).strip() if len(row) > 3 and not pd.isna(row.iloc[3]) else '',
                        'format': str(row.iloc[4]).strip() if len(row) > 4 and not pd.isna(row.iloc[4]) else '',
                        'multiple': str(row.iloc[5]).strip() if len(row) > 5 and not pd.isna(row.iloc[5]) else '',
                        'data_mapping_priority': str(row.iloc[6]).strip() if len(row) > 6 and not pd.isna(row.iloc[6]) else '',
                        'notes': str(row.iloc[7]).strip() if len(row) > 7 and not pd.isna(row.iloc[7]) else '',
                        't1d_exchange_comments': str(row.iloc[8]).strip() if len(row) > 8 and not pd.isna(row.iloc[8]) else '',
                        'clinic_comments': str(row.iloc[9]).strip() if len(row) > 9 and not pd.isna(row.iloc[9]) else '',
                        'column_position': col_a,
                        'source_sheet': sheet_name,
                        'source_file': 'QICoreDataSpec_v_0_3_0.xlsx'
                    }
                    
                    # Clean up 'nan' strings
                    for key, value in var_data.items():
                        if value == 'nan':
                            var_data[key] = ''
                    
                    variables.append(var_data)
                    variable_names.append(col_b)
        
        extracted_data[sheet_name] = {
            'variables': variables,
            'coded_values': coded_values
        }
        print(f"  Extracted {len(variables)} variables and {len(coded_values)} coded values from {sheet_name}")
    
    return extracted_data

def find_matching_variable(field_name, variable_names):
    """Find matching variable name for a field name"""
    field_lower = field_name.lower().strip()
    
    # Direct match
    for var in variable_names:
        if var.lower() == field_lower:
            return var
    
    # Partial match
    for var in variable_names:
        if field_lower in var.lower() or var.lower() in field_lower:
            return var
    
    # Special cases for common patterns
    field_mappings = {
        'gender': 'gender',
        'race': 'race_1',
        'ethnicity': 'ethnicity', 
        'language': 'language',
        'primary_insurance_type': 'primary_insurance_type',
        'secondary_insurance_type': 'secondary_insurance_type',
        'tertiary_insurance_type': 'tertiary_insurance_type',
        'education_level': 'education_level',
        'provider_type': 'provider_type',
        'class': 'class',
        'status': 'status',
        'category': 'category'
    }
    
    for pattern, var_name in field_mappings.items():
        if pattern in field_lower:
            return var_name
    
    return field_name  # Return original if no match found

def extract_diabetes_data(file_path):
    """Extract variables and coded values from QIDiabetesDataSpec_v_0_3_0.xlsx"""
    
    sheets_to_process = ['Disease', 'Insulin', 'Monitoring', 'Glucose']
    extracted_data = {}
    
    for sheet_name in sheets_to_process:
        print(f"Processing Diabetes sheet: {sheet_name}")
        
        # Read the entire sheet to process both variables and coded values
        df_raw = pd.read_excel(file_path, sheet_name=sheet_name, header=None)
        
        variables = []
        coded_values = []
        variable_number_to_name = {}  # Map variable numbers to variable names
        in_coded_section = False
        current_variable_number = ''
        current_variable_name = ''
        
        # Process each row
        for i, row in df_raw.iterrows():
            if i < 3:  # Skip header rows
                continue
                
            col_a = str(row.iloc[0]).strip() if not pd.isna(row.iloc[0]) else ''
            col_b = str(row.iloc[1]).strip() if not pd.isna(row.iloc[1]) else ''
            col_c = str(row.iloc[2]).strip() if not pd.isna(row.iloc[2]) else ''
            col_d = str(row.iloc[3]).strip() if len(row) > 3 and not pd.isna(row.iloc[3]) else ''
            
            # Skip empty rows
            if not col_a and not col_b and not col_c:
                continue
                
            # Check if we've hit the coded values section
            if col_a == 'Variable Number' and col_b == 'Field Name' and col_c == 'Allowed Values':
                in_coded_section = True
                continue
                
            if in_coded_section:
                # If column A has a variable number, it's a new variable section
                if col_a and col_a.isdigit():
                    current_variable_number = col_a
                    current_variable_name = variable_number_to_name.get(col_a, col_b)  # Use field name if mapping not found
                
                # If column C has a value, it's a coded value
                if col_c and col_c != 'nan':
                    coded_value = {
                        'code': col_c,
                        'display': col_d,
                        'field_name': current_variable_name,
                        'variable_name': current_variable_name,
                        'notes': str(row.iloc[4]).strip() if len(row) > 4 and not pd.isna(row.iloc[4]) else '',
                        'source_sheet': sheet_name,
                        'source_file': 'QIDiabetesDataSpec_v_0_3_0.xlsx'
                    }
                    
                    # Clean up 'nan' strings
                    for key, value in coded_value.items():
                        if value == 'nan':
                            coded_value[key] = ''
                    
                    coded_values.append(coded_value)
            else:
                # This is a variable row
                if col_a.isdigit() and col_b and col_b != 'nan':  # Variable number and variable name
                    variable_number_to_name[col_a] = col_b  # Store mapping
                    
                    var_data = {
                        'variable': col_b,
                        'description': col_d,
                        'code_system': col_c,
                        'value': str(row.iloc[4]).strip() if len(row) > 4 and not pd.isna(row.iloc[4]) else '',
                        'format': str(row.iloc[5]).strip() if len(row) > 5 and not pd.isna(row.iloc[5]) else '',
                        'data_mapping_priority': str(row.iloc[6]).strip() if len(row) > 6 and not pd.isna(row.iloc[6]) else '',
                        'notes': str(row.iloc[7]).strip() if len(row) > 7 and not pd.isna(row.iloc[7]) else '',
                        'variable_number': col_a,
                        'source_sheet': sheet_name,
                        'source_file': 'QIDiabetesDataSpec_v_0_3_0.xlsx'
                    }
                    
                    # Clean up 'nan' strings
                    for key, value in var_data.items():
                        if value == 'nan':
                            var_data[key] = ''
                    
                    variables.append(var_data)
        
        extracted_data[sheet_name] = {
            'variables': variables,
            'coded_values': coded_values
        }
        print(f"  Extracted {len(variables)} variables and {len(coded_values)} coded values from {sheet_name}")
    
    return extracted_data

def main():
    """Main extraction function"""
    
    print("=== T1D Exchange Corrected Variable & Coded Values Extraction ===\n")
    
    # File paths
    qicore_file = Path("QICoreDataSpec_v_0_3_0.xlsx")
    diabetes_file = Path("QIDiabetesDataSpec_v_0_3_0.xlsx")
    
    # Check files exist
    if not qicore_file.exists():
        print(f"Error: {qicore_file} not found")
        return
    if not diabetes_file.exists():
        print(f"Error: {diabetes_file} not found")
        return
    
    # Extract data from both files
    qicore_data = extract_qicore_data(qicore_file)
    diabetes_data = extract_diabetes_data(diabetes_file)
    
    # Combine all data
    comprehensive_data = {
        'extraction_info': {
            'source_files': [
                'QICoreDataSpec_v_0_3_0.xlsx',
                'QIDiabetesDataSpec_v_0_3_0.xlsx'
            ],
            'extraction_date': pd.Timestamp.now().isoformat(),
            'total_sheets_processed': len(qicore_data) + len(diabetes_data)
        },
        'qicore_specifications': qicore_data,
        'diabetes_specifications': diabetes_data
    }
    
    # Calculate totals
    total_variables = 0
    total_coded_values = 0
    
    for sheet_data in qicore_data.values():
        total_variables += len(sheet_data['variables'])
        total_coded_values += len(sheet_data['coded_values'])
    
    for sheet_data in diabetes_data.values():
        total_variables += len(sheet_data['variables'])
        total_coded_values += len(sheet_data['coded_values'])
    
    comprehensive_data['extraction_info']['total_variables_extracted'] = total_variables
    comprehensive_data['extraction_info']['total_coded_values_extracted'] = total_coded_values
    
    # Save to JSON
    output_file = Path("variables_metadata.json")
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(comprehensive_data, f, indent=2, ensure_ascii=False)
    
    print(f"\n=== Extraction Complete ===")
    print(f"Total variables extracted: {total_variables}")
    print(f"Total coded values extracted: {total_coded_values}")
    print(f"QICore sheets: {len(qicore_data)}")
    print(f"Diabetes sheets: {len(diabetes_data)}")
    print(f"Output saved to: {output_file}")
    
    # Print summary by sheet
    print(f"\n=== Summary by Sheet ===")
    for sheet, data in qicore_data.items():
        print(f"  QICore {sheet}: {len(data['variables'])} variables, {len(data['coded_values'])} coded values")
    for sheet, data in diabetes_data.items():
        print(f"  Diabetes {sheet}: {len(data['variables'])} variables, {len(data['coded_values'])} coded values")

if __name__ == "__main__":
    main()