// Core Laboratory Observation Examples

Instance: T1DAutoantibodyGADExample
InstanceOf: T1DObservation
Usage: #example
Title: "T1D Anti-GAD Observation Example"
Description: "Example of Anti-GAD autoantibody test result"
* identifier.system = "http://t1dexchange.org/fhir/NamingSystem/t1d-observation-id"
* identifier.value = "obs-gad-001"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code = http://loinc.org#13926-1 "Glutamate decarboxylase 65 Ab [Units/volume] in Serum"
* subject = Reference(T1DPatientExample)
* encounter = Reference(T1DEncounterExample)
* effectiveDateTime = "2024-01-15"
* valueQuantity = 15.2 'U/mL' "U/mL"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H "High"
* referenceRange.high = 5.0 'U/mL' "U/mL"
* performer = Reference(T1DProviderExample)

Instance: T1DLipidCholesterolExample
InstanceOf: T1DObservation
Usage: #example
Title: "T1D Total Cholesterol Observation Example"
Description: "Example of total cholesterol lab result"
* identifier.system = "http://t1dexchange.org/fhir/NamingSystem/t1d-observation-id"
* identifier.value = "obs-chol-001"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code = http://loinc.org#2093-3 "Cholesterol [Mass/volume] in Serum or Plasma"
* subject = Reference(T1DPatientExample)
* encounter = Reference(T1DEncounterExample)
* effectiveDateTime = "2024-01-15"
* valueQuantity = 185 'mg/dL' "mg/dL"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#N "Normal"
* referenceRange.low = 100 'mg/dL' "mg/dL"
* referenceRange.high = 200 'mg/dL' "mg/dL"
* performer = Reference(T1DProviderExample)

Instance: T1DThyroidTSHExample
InstanceOf: T1DObservation
Usage: #example
Title: "T1D TSH Observation Example"
Description: "Example of thyroid stimulating hormone test result"
* identifier.system = "http://t1dexchange.org/fhir/NamingSystem/t1d-observation-id"
* identifier.value = "obs-tsh-001"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code = http://loinc.org#3016-3 "Thyrotropin [Units/volume] in Serum or Plasma"
* subject = Reference(T1DPatientExample)
* encounter = Reference(T1DEncounterExample)
* effectiveDateTime = "2024-01-15"
* valueQuantity = 2.1 'mU/L' "mU/L"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#N "Normal"
* referenceRange.low = 0.4 'mU/L' "mU/L"
* referenceRange.high = 4.0 'mU/L' "mU/L"
* performer = Reference(T1DProviderExample)

Instance: T1DCeliacTTGExample
InstanceOf: T1DObservation
Usage: #example
Title: "T1D TTG IgA Observation Example"
Description: "Example of tissue transglutaminase IgA antibody test"
* identifier.system = "http://t1dexchange.org/fhir/NamingSystem/t1d-observation-id"
* identifier.value = "obs-ttg-001"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code = http://loinc.org#31017-7 "Tissue transglutaminase IgA Ab [Units/volume] in Serum"
* subject = Reference(T1DPatientExample)
* encounter = Reference(T1DEncounterExample)
* effectiveDateTime = "2024-01-15"
* valueQuantity = 3.2 'U/mL' "U/mL"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#N "Normal"
* referenceRange.high = 20.0 'U/mL' "U/mL"
* performer = Reference(T1DProviderExample)