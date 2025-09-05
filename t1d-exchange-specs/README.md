# T1D Exchange Specification Analysis

This directory contains the analysis tools and extracted data from the T1D Exchange specifications.

## Files

### Core Data Files
- `variables_metadata.json` - Complete extracted variables and coded values from both specification files
- `QICoreDataSpec_v_0_3_0.xlsx` - Original QI Core specification
- `QIDiabetesDataSpec_v_0_3_0.xlsx` - Original Diabetes specification

### Analysis Scripts
- `final_extraction.py` - Extracts variables and coded values from Excel specifications
- `coverage_gap_analysis.py` - Analyzes gaps between specifications and current IG implementation

### Analysis Results
- `coverage_gap_analysis.json` - Detailed gap analysis results
- `coverage_gap_report.md` - Formatted gap analysis report
- `phase2_coverage_gap_summary.md` - Executive summary with recommendations

## Usage

1. **Extract specification data**: `python final_extraction.py`
2. **Analyze coverage gaps**: `python coverage_gap_analysis.py`

## Current Status

- **153 variables** extracted from specifications
- **241 coded values** identified in specifications  
- **23.4% coded value coverage** in current IG implementation
- **400 missing coded values** to implement