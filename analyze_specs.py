#!/usr/bin/env python3
import pandas as pd
import os

def analyze_excel_file(filepath):
    print(f"\n=== Analyzing {os.path.basename(filepath)} ===")
    
    # Read all sheets
    xl_file = pd.ExcelFile(filepath)
    print(f"Sheets: {xl_file.sheet_names}")
    
    for sheet_name in xl_file.sheet_names:
        print(f"\n--- Sheet: {sheet_name} ---")
        df = pd.read_excel(filepath, sheet_name=sheet_name)
        print(f"Columns: {list(df.columns)}")
        print(f"Rows: {len(df)}")
        
        # Show first few rows
        if len(df) > 0:
            print("Sample data:")
            print(df.head(3).to_string())

# Analyze both Excel files
specs_dir = "/Users/kmpower/Documents/GitHub/t1de-exchange/t1d-exchange-specs"
excel_files = [
    "QICoreDataSpec_v_0_3_0.xlsx",
    "QIDiabetesDataSpec_v_0_3_0.xlsx"
]

for excel_file in excel_files:
    filepath = os.path.join(specs_dir, excel_file)
    if os.path.exists(filepath):
        analyze_excel_file(filepath)