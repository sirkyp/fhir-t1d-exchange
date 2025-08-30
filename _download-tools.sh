#!/bin/bash
set -e

# Create input-cache directory if it doesn't exist
mkdir -p input-cache

# Download IG Publisher if not present
if [ ! -f "input-cache/publisher.jar" ]; then
    echo "Downloading IG Publisher..."
    curl -L https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar -o input-cache/publisher.jar
fi

# Download FHIR Validator if not present
if [ ! -f "input-cache/validator_cli.jar" ]; then
    echo "Downloading FHIR Validator..."
    curl -L https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar -o input-cache/validator_cli.jar
fi

echo "Prerequisites ready."