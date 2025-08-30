// T1D Exchange Operations
// Based on CGM IG operation patterns

Instance: submit-t1d-data
InstanceOf: OperationDefinition
Usage: #definition
Title: "Submit T1D Data"
Description: "Operation for submitting T1D Exchange data as a transaction bundle"

* url = "http://t1dexchange.org/fhir/OperationDefinition/submit-t1d-data"
* name = "SubmitT1DData"
* status = #active
* kind = #operation
* code = #submit-t1d-data
* resource = #Bundle
* system = false
* type = true
* instance = false
// * inputProfile = "http://t1dexchange.org/fhir/StructureDefinition/t1d-data-submission-bundle"

* parameter[0]
  * name = #resource
  * use = #in
  * min = 1
  * max = "1"
  * type = #Bundle
  * documentation = "A Bundle of type 'transaction' containing T1D Exchange data including patient demographics, encounters, observations, conditions, and medications."

* parameter[1]
  * name = #return
  * use = #out
  * min = 1
  * max = "1"
  * type = #Bundle
  * documentation = "A Bundle of type 'transaction-response' containing processing results for each submitted resource. Each entry corresponds to a submission entry with HTTP status codes, location headers for successful creations, and OperationOutcome for errors."

Instance: extract-patient-data
InstanceOf: OperationDefinition
Usage: #definition
Title: "Extract T1D Patient Data"
Description: "Operation for extracting comprehensive T1D data for a specific patient"

* url = "http://t1dexchange.org/fhir/OperationDefinition/extract-patient-data"
* name = "ExtractT1DPatientData"
* status = #active
* kind = #operation
* code = #extract-patient-data
* resource = #Patient
* system = false
* type = false
* instance = true

* parameter[0]
  * name = #start
  * use = #in
  * min = 0
  * max = "1"
  * type = #date
  * documentation = "Start date for data extraction (inclusive)"

* parameter[1]
  * name = #end
  * use = #in
  * min = 0
  * max = "1"
  * type = #date
  * documentation = "End date for data extraction (inclusive)"

* parameter[2]
  * name = #return
  * use = #out
  * min = 1
  * max = "1"
  * type = #Bundle
  * documentation = "A Bundle of type 'collection' containing comprehensive T1D data for the patient within the specified date range."