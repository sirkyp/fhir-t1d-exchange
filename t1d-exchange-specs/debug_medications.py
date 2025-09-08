#!/usr/bin/env python3

import pandas as pd
import sys

def debug_medications_sheet():
    """Debug the Medications sheet to find coded values"""
    
    try:
        # Read the QICore Excel file
        file_path = 'QICoreDataSpec_v_0_3_0.xlsx'
        
        # Read the Medications sheet
        df = pd.read_excel(file_path, sheet_name='Medications', header=None)
        
        print(f"Medications sheet shape: {df.shape}")
        print("\nFirst 50 rows of Medications sheet:")
        print("=" * 80)
        
        for i in range(min(50, len(df))):
            row_data = []
            for j in range(min(10, len(df.columns))):  # Show first 10 columns
                cell_value = df.iloc[i, j]
                if pd.isna(cell_value):
                    row_data.append("NaN")
                else:
                    row_data.append(str(cell_value)[:30])  # Truncate long values
            
            print(f"Row {i:2d}: {' | '.join(row_data)}")
        
        print("\n" + "=" * 80)
        print("Looking for coded values patterns...")
        
        # Look for rows that might contain coded values
        for i in range(len(df)):
            row = df.iloc[i]
            # Check if any cell contains common coded value indicators
            for j, cell in enumerate(row):
                if pd.notna(cell):
                    cell_str = str(cell).lower()
                    if any(keyword in cell_str for keyword in ['allowed values', 'field name', 'code', 'value', 'display']):
                        print(f"Potential coded value indicator at Row {i}, Col {j}: {cell}")
        
    except Exception as e:
        print(f"Error: {e}")
        return False
    
    return True

if __name__ == "__main__":
    debug_medications_sheet()