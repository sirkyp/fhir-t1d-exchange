#!/usr/bin/env python3

import pandas as pd

# Read the Diabetes_Core_Observations sheet
df = pd.read_excel('QIDiabetesDataSpec_v_0_3_0.xlsx', sheet_name='Diabetes_Core_Observations')

print("=== Diabetes_Core_Observations Sheet Structure ===")
print(f"Shape: {df.shape}")
print(f"Columns: {list(df.columns)}")
print("\n=== First 20 rows ===")
print(df.head(20).to_string())

print("\n=== Non-null data summary ===")
for col in df.columns:
    non_null_count = df[col].notna().sum()
    if non_null_count > 0:
        print(f"{col}: {non_null_count} non-null values")
        unique_values = df[col].dropna().unique()
        if len(unique_values) <= 10:
            print(f"  Unique values: {list(unique_values)}")
        else:
            print(f"  Sample values: {list(unique_values[:5])}")