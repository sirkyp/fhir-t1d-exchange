Profile: T1DProvider
Parent: Practitioner
Id: t1d-provider
Title: "T1D Provider"
Description: "Provider profile for T1D Exchange including healthcare professionals and facilities"

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains
    npi 0..1 MS and
    pos 0..1 MS and
    dea 0..1 MS and
    other 0..1 MS and
    t1d-provider-id 1..1 MS

* identifier[npi] ^definition = "All provider codes (e.g., facility, physician, educator) will be identified in the data using their assigned National Provider Identification number (NPI), their CMS Provider of Service ID (POS), DEA number, or other nationally recognized active provider code."
* identifier[npi] ^short = "National Provider Identification number"
* identifier[npi] ^comment = "Priority: Medium, either 2,3,4or5 | Notes: 1st preference"
* identifier[npi].type = http://terminology.hl7.org/CodeSystem/v2-0203#NPI
* identifier[npi].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[npi].value 1..1 MS

* identifier[pos] ^definition = "Provider of Service ID (POS)"
* identifier[pos] ^short = "CMS Provider of Service number"
* identifier[pos] ^comment = "Priority: Medium, either 2,3,4or5 | Notes: 2nd preference"
* identifier[pos].type = http://terminology.hl7.org/CodeSystem/v2-0203#PRN
* identifier[pos].value 1..1 MS

* identifier[dea] ^definition = "Drug Enforcement Agency number"
* identifier[dea] ^short = "DEA number"
* identifier[dea] ^comment = "Priority: Medium, either 2,3,4or5 | Notes: 3rd preference"
* identifier[dea].type = http://terminology.hl7.org/CodeSystem/v2-0203#DEA
* identifier[dea].value 1..1 MS

* identifier[other] ^definition = "When using other_id, once it has been reported for a provider, it should not change from data submission to data submission. However, it would be acceptable if an Organization decided to change from reporting the other ID to reporting a standard provider code value from either the 1st, 2nd, or 3rd preferences listed above."
* identifier[other] ^short = "Other nationally recognized or Internal Health System ID"
* identifier[other] ^comment = "Priority: Medium, either 2,3,4or5 | Notes: 4th preference - Internal Health System ID"
* identifier[other].type = http://terminology.hl7.org/CodeSystem/v2-0203#PRN
* identifier[other].value 1..1 MS

* identifier[t1d-provider-id].type = http://t1dexchange.org/fhir/CodeSystem/t1d-identifier-type#T1D-PROVIDER-ID
* identifier[t1d-provider-id].system = "http://t1dexchange.org/fhir/provider-id"
* identifier[t1d-provider-id].value 1..1 MS

* active 1..1 MS
* name 1..* MS
* qualification MS
* qualification.code ^definition = "Type of provider"
* qualification.code ^short = "Type of provider"
* qualification.code ^comment = "Priority: Low"
* qualification.code from T1DProviderSpecialtyValueSet (preferred)

Profile: T1DOrganization
Parent: Organization
Id: t1d-organization
Title: "T1D Organization"
Description: "Organization profile for T1D Exchange healthcare facilities"

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains
    t1d-org-id 1..1 MS

* identifier[t1d-org-id] ^definition = "Submitting Member Organization ID, assigned from Coordinating Center"
* identifier[t1d-org-id] ^short = "Submitting Member Organization ID"
* identifier[t1d-org-id] ^comment = "Priority: High"
* identifier[t1d-org-id].type = http://t1dexchange.org/fhir/CodeSystem/t1d-identifier-type#T1D-ORG-ID
* identifier[t1d-org-id].system = "http://t1dexchange.org/fhir/organization-id"
* identifier[t1d-org-id].value 1..1 MS

* active 1..1 MS
* type MS
* type from T1DOrganizationTypeValueSet (preferred)
* name 1..1 MS