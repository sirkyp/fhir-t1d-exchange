#!/usr/bin/env python3
import pandas as pd
import os
import json

def extract_sheet_data(filepath, sheet_name):
    """Extract structured data from a specification sheet"""
    df = pd.read_excel(filepath, sheet_name=sheet_name)
    
    # Find the header row (contains 'Variable')
    header_row = None
    for i, row in df.iterrows():
        if 'Variable' in str(row.iloc[1]) or 'Variable' in str(row.iloc[0]):
            header_row = i
            break
    
    if header_row is None:
        return None
    
    # Set proper column names
    columns = df.iloc[header_row].fillna('').astype(str).tolist()
    data_df = df.iloc[header_row+1:].copy()
    data_df.columns = columns
    
    # Remove empty rows
    data_df = data_df.dropna(how='all')
    
    return data_df

def process_specifications():
    """Process both specification files and extract profile enhancement data"""
    
    specs_dir = os.path.dirname(os.path.abspath(__file__))
    
    # QI Core Data Spec sheets
    qi_core_file = os.path.join(specs_dir, "QICoreDataSpec_v_0_3_0.xlsx")
    qi_sheets = ['Patients', 'Providers', 'Encounters', 'Observations', 'Conditions', 'Medications']
    
    # QI Diabetes Data Spec sheets  
    qi_diabetes_file = os.path.join(specs_dir, "QIDiabetesDataSpec_v_0_3_0.xlsx")
    qi_diabetes_sheets = ['Disease', 'Insulin', 'Monitoring', 'Glucose']
    
    profile_data = {}
    
    # Process QI Core sheets
    for sheet in qi_sheets:
        print(f"Processing QI Core: {sheet}")
        data = extract_sheet_data(qi_core_file, sheet)
        if data is not None:
            profile_data[f"QICore_{sheet}"] = process_sheet_variables(data)
    
    # Process QI Diabetes sheets
    for sheet in qi_diabetes_sheets:
        print(f"Processing QI Diabetes: {sheet}")
        data = extract_sheet_data(qi_diabetes_file, sheet)
        if data is not None:
            profile_data[f"QIDiabetes_{sheet}"] = process_sheet_variables(data)
    
    return profile_data

def process_sheet_variables(df):
    """Process variables from a sheet and extract definition, priority, notes"""
    variables = []
    
    for _, row in df.iterrows():
        # Skip empty or header rows
        if pd.isna(row.iloc[1]) or str(row.iloc[1]).strip() == '':
            continue
            
        variable_data = {
            'variable': str(row.iloc[1]).strip(),
            'definition': '',
            'short': '',
            'comment': ''
        }
        
        # Extract definition (usually column 2 or 3)
        definition_col = None
        for i, col in enumerate(df.columns):
            if 'definition' in col.lower():
                definition_col = i
                break
        
        if definition_col is not None and len(row) > definition_col:
            definition = str(row.iloc[definition_col]).strip()
            if definition and definition != 'nan':
                variable_data['definition'] = definition
                # Create short description (5-10 words)
                words = definition.split()[:8]
                variable_data['short'] = ' '.join(words)
        
        # Extract priority and notes for comment
        comment_parts = []
        
        # Look for Data Mapping Priority or Data column
        priority_col = None
        for i, col in enumerate(df.columns):
            if 'data mapping priority' in col.lower() or col.lower() == 'data':
                priority_col = i
                break
        
        if priority_col is not None and len(row) > priority_col:
            priority = str(row.iloc[priority_col]).strip()
            if priority and priority != 'nan':
                comment_parts.append(f"Priority: {priority}")
        
        # Look for Notes column
        notes_col = None
        for i, col in enumerate(df.columns):
            if 'notes' in col.lower():
                notes_col = i
                break
        
        if notes_col is not None and len(row) > notes_col:
            notes = str(row.iloc[notes_col]).strip()
            if notes and notes != 'nan':
                comment_parts.append(f"Notes: {notes}")
        
        # Look for other contextual columns
        for i, col in enumerate(df.columns):
            col_lower = col.lower()
            if ('comment' in col_lower or 'question' in col_lower) and 'notes' not in col_lower:
                if len(row) > i:
                    context = str(row.iloc[i]).strip()
                    if context and context != 'nan':
                        comment_parts.append(f"{col}: {context}")
        
        variable_data['comment'] = ' | '.join(comment_parts)
        
        if variable_data['variable']:
            variables.append(variable_data)
    
    return variables

if __name__ == "__main__":
    profile_data = process_specifications()
    
    # Save to JSON for easy consumption
    output_file = os.path.join(os.path.dirname(__file__), 'profile_enhancement_data.json')
    with open(output_file, 'w') as f:
        json.dump(profile_data, f, indent=2)
    
    print(f"\nProfile enhancement data saved to: {output_file}")
    
    # Print summary
    for sheet, variables in profile_data.items():
        print(f"\n{sheet}: {len(variables)} variables")
        for var in variables[:3]:  # Show first 3 as examples
            print(f"  - {var['variable']}: {var['short'][:50]}...")