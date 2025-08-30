Profile: T1DProvider
Parent: Practitioner
Id: t1d-provider
Title: "T1D Exchange Provider"
Description: "Provider profile for T1D Exchange including healthcare professionals and facilities"

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains
    npi 0..1 MS and
    t1d-provider-id 1..1 MS

* identifier[npi].type = http://terminology.hl7.org/CodeSystem/v2-0203#NPI
* identifier[npi].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[npi].value 1..1 MS

* identifier[t1d-provider-id].type = http://t1dexchange.org/fhir/CodeSystem/t1d-identifier-type#T1D-PROVIDER-ID
* identifier[t1d-provider-id].system = "http://t1dexchange.org/fhir/provider-id"
* identifier[t1d-provider-id].value 1..1 MS

* active 1..1 MS
* name 1..* MS
* telecom MS
* address MS
* gender MS
* birthDate MS
* qualification MS
* qualification.code from T1DProviderSpecialtyValueSet (preferred)

Profile: T1DOrganization
Parent: Organization
Id: t1d-organization
Title: "T1D Exchange Organization"
Description: "Organization profile for T1D Exchange healthcare facilities"

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains
    t1d-org-id 1..1 MS

* identifier[t1d-org-id].type = http://t1dexchange.org/fhir/CodeSystem/t1d-identifier-type#T1D-ORG-ID
* identifier[t1d-org-id].system = "http://t1dexchange.org/fhir/organization-id"
* identifier[t1d-org-id].value 1..1 MS

* active 1..1 MS
* type MS
* type from T1DOrganizationTypeValueSet (preferred)
* name 1..1 MS
* telecom MS
* address MS