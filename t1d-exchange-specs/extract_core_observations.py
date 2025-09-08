#!/usr/bin/env python3

import pandas as pd
import json

# Read the Diabetes_Core_Observations sheet
df = pd.read_excel('QIDiabetesDataSpec_v_0_3_0.xlsx', sheet_name='Diabetes_Core_Observations')

# Extract structured data starting from row 4 (Variable Number header)
observations = []
current_obs = None

for idx, row in df.iterrows():
    if idx < 4:  # Skip header rows
        continue
    
    var_num = row.iloc[0]  # Variable Number column
    name = row.iloc[1]     # Name column  
    definition = row.iloc[2]  # Definition column
    codes = row.iloc[3]    # Relevant Codes column
    
    # If we have a variable number, start a new observation
    if pd.notna(var_num) and isinstance(var_num, (int, float)):
        if current_obs:
            observations.append(current_obs)
        
        current_obs = {
            'variable_number': int(var_num),
            'name': name if pd.notna(name) else '',
            'definition': definition if pd.notna(definition) else '',
            'codes': []
        }
        
        # Add first code if present
        if pd.notna(codes):
            current_obs['codes'].append(codes)
    
    # If we have additional codes for current observation
    elif current_obs and pd.notna(codes):
        current_obs['codes'].append(codes)

# Add the last observation
if current_obs:
    observations.append(current_obs)

print("=== Extracted Core Observations ===")
for obs in observations:
    print(f"\n{obs['variable_number']}. {obs['name']}")
    if obs['definition']:
        print(f"   Definition: {obs['definition']}")
    print(f"   Codes ({len(obs['codes'])}):")
    for code in obs['codes']:
        print(f"     - {code}")

# Save to JSON
with open('core_observations.json', 'w') as f:
    json.dump(observations, f, indent=2)

print(f"\n=== Summary ===")
print(f"Total core observations: {len(observations)}")
print(f"Saved to core_observations.json")