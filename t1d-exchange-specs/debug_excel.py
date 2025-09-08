#!/usr/bin/env python3
import pandas as pd

# Read the Patients sheet to understand the structure
df = pd.read_excel("QICoreDataSpec_v_0_3_0.xlsx", sheet_name="Patients", header=None)

print("First 30 rows of Patients sheet:")
for i in range(30):
    if i < len(df):
        row_data = []
        for j in range(min(5, len(df.columns))):  # First 5 columns
            cell_value = str(df.iloc[i, j]) if not pd.isna(df.iloc[i, j]) else ""
            row_data.append(f"'{cell_value}'")
        print(f"Row {i}: {', '.join(row_data)}")