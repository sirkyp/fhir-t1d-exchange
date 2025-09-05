#!/usr/bin/env python3

import pandas as pd

def debug_diabetes_sheets():
    """Debug the Diabetes sheets to understand coded values structure"""
    
    file_path = 'QIDiabetesDataSpec_v_0_3_0.xlsx'
    sheets = ['Disease', 'Insulin', 'Monitoring', 'Glucose']
    
    for sheet_name in sheets:
        print(f"\n=== {sheet_name} Sheet ===")
        df = pd.read_excel(file_path, sheet_name=sheet_name, header=None)
        
        print(f"Shape: {df.shape}")
        print("First 30 rows:")
        
        for i in range(min(30, len(df))):
            row_data = []
            for j in range(min(6, len(df.columns))):
                cell_value = df.iloc[i, j]
                if pd.isna(cell_value):
                    row_data.append("NaN")
                else:
                    row_data.append(str(cell_value)[:25])
            print(f"Row {i:2d}: {' | '.join(row_data)}")
        
        # Look for coded values patterns
        print("\nLooking for coded values indicators:")
        for i in range(len(df)):
            row = df.iloc[i]
            for j, cell in enumerate(row):
                if pd.notna(cell):
                    cell_str = str(cell).lower()
                    if any(keyword in cell_str for keyword in ['allowed values', 'field name', 'variable number']):
                        print(f"  Row {i}, Col {j}: {cell}")

if __name__ == "__main__":
    debug_diabetes_sheets()