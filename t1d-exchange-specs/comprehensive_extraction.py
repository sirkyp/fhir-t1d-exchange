#!/usr/bin/env python3
"""
Comprehensive T1D Exchange Specification Variable & Metadata Extraction
Extracts ALL variables and metadata from both Excel specification files
"""

import pandas as pd
import json
from pathlib import Path

def extract_qicore_data(file_path):
    """Extract variables from QICoreDataSpec_v_0_3_0.xlsx"""
    
    sheets_to_process = ['Patients', 'Providers', 'Encounters', 'Observations', 'Conditions', 'Medications']
    extracted_data = {}
    
    for sheet_name in sheets_to_process:
        print(f"Processing QICore sheet: {sheet_name}")
        
        # Read the sheet, skipping the first 3 rows to get to actual data
        df = pd.read_excel(file_path, sheet_name=sheet_name, skiprows=3)
        
        # The columns should be: Column Position, Variable, Definition, Type, Format, Multiple, Data Mapping Priority, Notes, etc.
        # Let's rename them properly based on actual column count
        base_columns = [
            'column_position', 'variable', 'definition', 'type', 'format', 
            'multiple', 'data_mapping_priority', 'notes', 't1d_exchange_comments', 'clinic_comments'
        ]
        
        # Handle variable column counts by creating column names dynamically
        new_columns = []
        for i in range(len(df.columns)):
            if i < len(base_columns):
                new_columns.append(base_columns[i])
            else:
                new_columns.append(f'extra_column_{i}')
        
        df.columns = new_columns
        
        # Remove rows where variable is NaN
        df = df.dropna(subset=['variable'])
        
        # Convert to list of dictionaries
        variables = []
        for _, row in df.iterrows():
            var_data = {
                'variable': str(row.get('variable', '')).strip(),
                'definition': str(row.get('definition', '')).strip(),
                'type': str(row.get('type', '')).strip(),
                'format': str(row.get('format', '')).strip(),
                'multiple': str(row.get('multiple', '')).strip(),
                'data_mapping_priority': str(row.get('data_mapping_priority', '')).strip(),
                'notes': str(row.get('notes', '')).strip(),
                't1d_exchange_comments': str(row.get('t1d_exchange_comments', '')).strip(),
                'clinic_comments': str(row.get('clinic_comments', '')).strip(),
                'column_position': str(row.get('column_position', '')).strip(),
                'source_sheet': sheet_name,
                'source_file': 'QICoreDataSpec_v_0_3_0.xlsx'
            }
            
            # Clean up 'nan' strings
            for key, value in var_data.items():
                if value == 'nan':
                    var_data[key] = ''
                    
            variables.append(var_data)
        
        extracted_data[sheet_name] = variables
        print(f"  Extracted {len(variables)} variables from {sheet_name}")
    
    return extracted_data

def extract_diabetes_data(file_path):
    """Extract variables from QIDiabetesDataSpec_v_0_3_0.xlsx"""
    
    sheets_to_process = ['Disease', 'Insulin', 'Monitoring', 'Glucose']
    extracted_data = {}
    
    for sheet_name in sheets_to_process:
        print(f"Processing Diabetes sheet: {sheet_name}")
        
        # Read the sheet, skipping the first 2 rows to get to actual data
        df = pd.read_excel(file_path, sheet_name=sheet_name, skiprows=2)
        
        # The columns should be: Variable Number, Variable, Code System, Description, Value, Format, Data Mapping priority, Notes
        base_columns = [
            'variable_number', 'variable', 'code_system', 'description', 
            'value', 'format', 'data_mapping_priority', 'notes'
        ]
        
        # Handle variable column counts by creating column names dynamically
        new_columns = []
        for i in range(len(df.columns)):
            if i < len(base_columns):
                new_columns.append(base_columns[i])
            else:
                new_columns.append(f'extra_column_{i}')
        
        df.columns = new_columns
        
        # Remove rows where variable is NaN
        df = df.dropna(subset=['variable'])
        
        # Convert to list of dictionaries
        variables = []
        for _, row in df.iterrows():
            var_data = {
                'variable': str(row.get('variable', '')).strip(),
                'description': str(row.get('description', '')).strip(),
                'code_system': str(row.get('code_system', '')).strip(),
                'value': str(row.get('value', '')).strip(),
                'format': str(row.get('format', '')).strip(),
                'data_mapping_priority': str(row.get('data_mapping_priority', '')).strip(),
                'notes': str(row.get('notes', '')).strip(),
                'variable_number': str(row.get('variable_number', '')).strip(),
                'source_sheet': sheet_name,
                'source_file': 'QIDiabetesDataSpec_v_0_3_0.xlsx'
            }
            
            # Clean up 'nan' strings
            for key, value in var_data.items():
                if value == 'nan':
                    var_data[key] = ''
                    
            variables.append(var_data)
        
        extracted_data[sheet_name] = variables
        print(f"  Extracted {len(variables)} variables from {sheet_name}")
    
    return extracted_data

def extract_diabetes_core_observations(file_path):
    """Extract core observations from Diabetes_Core_Observations sheet"""
    
    print("Processing Diabetes_Core_Observations sheet")
    
    # This sheet has a different structure, let's examine it more carefully
    df = pd.read_excel(file_path, sheet_name='Diabetes_Core_Observations')
    
    # Find where the actual data starts by looking for meaningful content
    observations = []
    for i, row in df.iterrows():
        # Look for rows that contain observation information
        if i < 3:  # Skip header rows
            continue
            
        # Extract any meaningful observation data
        row_data = {}
        for col in df.columns:
            value = str(row[col]).strip()
            if value and value != 'nan':
                row_data[col] = value
        
        if row_data:
            row_data['source_sheet'] = 'Diabetes_Core_Observations'
            row_data['source_file'] = 'QIDiabetesDataSpec_v_0_3_0.xlsx'
            observations.append(row_data)
    
    print(f"  Extracted {len(observations)} core observations")
    return observations

def main():
    """Main extraction function"""
    
    print("=== T1D Exchange Comprehensive Variable & Metadata Extraction ===\n")
    
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
    core_observations = extract_diabetes_core_observations(diabetes_file)
    
    # Combine all data
    comprehensive_data = {
        'extraction_info': {
            'source_files': [
                'QICoreDataSpec_v_0_3_0.xlsx',
                'QIDiabetesDataSpec_v_0_3_0.xlsx'
            ],
            'extraction_date': pd.Timestamp.now().isoformat(),
            'total_sheets_processed': len(qicore_data) + len(diabetes_data) + 1
        },
        'qicore_specifications': qicore_data,
        'diabetes_specifications': diabetes_data,
        'diabetes_core_observations': core_observations
    }
    
    # Calculate totals
    total_variables = 0
    for sheet_data in qicore_data.values():
        total_variables += len(sheet_data)
    for sheet_data in diabetes_data.values():
        total_variables += len(sheet_data)
    total_variables += len(core_observations)
    
    comprehensive_data['extraction_info']['total_variables_extracted'] = total_variables
    
    # Save to JSON
    output_file = Path("comprehensive_variables_metadata.json")
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(comprehensive_data, f, indent=2, ensure_ascii=False)
    
    print(f"\n=== Extraction Complete ===")
    print(f"Total variables extracted: {total_variables}")
    print(f"QICore sheets: {len(qicore_data)}")
    print(f"Diabetes sheets: {len(diabetes_data)}")
    print(f"Core observations: {len(core_observations)}")
    print(f"Output saved to: {output_file}")
    
    # Print summary by sheet
    print(f"\n=== Summary by Sheet ===")
    for sheet, variables in qicore_data.items():
        print(f"  QICore {sheet}: {len(variables)} variables")
    for sheet, variables in diabetes_data.items():
        print(f"  Diabetes {sheet}: {len(variables)} variables")
    print(f"  Diabetes Core Observations: {len(core_observations)} items")

if __name__ == "__main__":
    main()