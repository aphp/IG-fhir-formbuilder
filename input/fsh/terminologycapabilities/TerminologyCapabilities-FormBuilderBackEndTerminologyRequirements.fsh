Instance: FormBuilderBackEndTerminologyRequirements
InstanceOf: TerminologyCapabilities
Usage: #definition

* name = "FormBuilderBackEndTerminologyRequirements"
* title = "FormBuilder BackEnd Terminology Requirements"
* status = #active
* experimental = false
* date = "2024-10-23"
* description = "Liste les CodeSystem et les opération que doit fournir un serveur de terminologie FHIR pour répondre aux besoins du FormBuilder."
* kind = #requirements
* codeSystem[+]
  * uri = "https://aphp.fr/ig/fhir/eds/CodeSystem/aphp-eds-name-space-cs"
* codeSystem[+]
  * uri = "https://aphp.fr/ig/fhir/eds/CodeSystem/aphp-eds-identifier-type-cs"
* expansion
  * hierarchical = true
  * parameter.name = #url