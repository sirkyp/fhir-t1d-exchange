// T1D Measure Example

Instance: t1d-hba1c-control-measure
InstanceOf: Measure
Usage: #example
Title: "T1D HbA1c Control Measure"
Description: "Example quality measure for HbA1c control in T1D patients"

* url = "http://example.org/Measure/hba1c-control"
* version = "1.0.0"
* name = "T1DHbA1cControlMeasure"
* title = "T1D HbA1c Control Rate"
* status = #active
* experimental = true
* date = "2024-01-01"
* publisher = "T1D Exchange"
* description = "Percentage of T1D patients with HbA1c < 7%"
* scoring = http://terminology.hl7.org/CodeSystem/measure-scoring#proportion
* type = http://terminology.hl7.org/CodeSystem/measure-type#outcome
* improvementNotation = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase

* group
  * population[0]
    * code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
    * description = "All patients with Type 1 Diabetes"
    * criteria
      * language = #text/cql
      * expression = "Initial Population"
  * population[+]
    * code = http://terminology.hl7.org/CodeSystem/measure-population#denominator
    * description = "All T1D patients with at least one HbA1c result in measurement period"
    * criteria
      * language = #text/cql
      * expression = "Denominator"
  * population[+]
    * code = http://terminology.hl7.org/CodeSystem/measure-population#numerator
    * description = "T1D patients with most recent HbA1c < 7%"
    * criteria
      * language = #text/cql
      * expression = "Numerator"