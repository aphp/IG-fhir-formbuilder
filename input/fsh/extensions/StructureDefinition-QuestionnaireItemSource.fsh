Extension: QuestionnaireItemSource
Id: QuestionnaireItemSource
Title: "Source application"
Description: "This item specific extension formalize the source for the information in an Information System"
* ^status = #draft
* ^context[0].type = #element
* ^context[=].expression = "Questionnaire.item"

* . 0..1
* value[x] 0..0
* extension contains
    source 0..1 and
    comment 0..1

* extension[source] only Extension
* extension[source] ^short = "Source URI"
* extension[source] ^definition = "This property allow the specific identification of the Source."
* extension[source].url only uri
* extension[source].value[x] 1..1
* extension[source].value[x] only Coding
* extension[source].value[x] from SourceExample (example)

* extension[comment] only Extension
* extension[comment] ^short = "Comment on source"
* extension[comment] ^definition = "To store any comment on the source"
* extension[comment].url only uri
* extension[comment].value[x] 1..1
* extension[comment].value[x] only string


Instance: 85acf55a-d4b3-4cb3-95d8-671600e2253b
InstanceOf: Provenance
Usage: #definition
Description: "Création de la ressource."
//* meta.source = "https://aphp.fr/eds"
* target[0] = Reference(StructureDefinition/QuestionnaireItemSource)
* occurredDateTime = "2024-10-23"
* reason.text = "Création d'une extension pour formaliser les sources applicatives des informations qu'on collige dans le modèle métier"
* activity = http://terminology.hl7.org/CodeSystem/v3-DataOperation#CREATE
* agent.type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#author
* agent.who.display = "Nicolas Griffon"
* recorded = "2024-10-23T10:00:00.000Z"

Instance: 57816c01-d1cb-4a4c-9b84-d30b45925ce2
InstanceOf: Provenance
Usage: #definition
Description: "Modification de la cardinalité de la sous extension source, trop contraignante."
//* meta.source = "https://aphp.fr/eds"
* target[0] = Reference(StructureDefinition/QuestionnaireItemSource)
* occurredDateTime = "2024-11-20"
* reason.text = "Rendre l'extension source obligtoire était trop contraignant, au moins dans un premier temps."
* activity = http://terminology.hl7.org/CodeSystem/v3-DataOperation#UPDATE
* agent.type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#author
* agent.who.display = "Nicolas Griffon"
* recorded = "2024-11-04T11:22:00.000Z"

Instance: 5dfca861-dd96-4394-b2e2-d1df94aa5c72
InstanceOf: Provenance
Usage: #definition
Description: "Transfert from aphp specific to public"
* target[0] = Reference(StructureDefinition/QuestionnaireItemSource)
* occurredDateTime = "2025-03-03"
* reason.text = "Transfert of this extension from the private to the public AP-HP FB IG"
* activity = http://terminology.hl7.org/CodeSystem/v3-DataOperation#UPDATE
* agent.type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#author
* agent.who.display = "Nicolas Griffon"
* recorded = "2025-03-03T16:43:00.000Z"