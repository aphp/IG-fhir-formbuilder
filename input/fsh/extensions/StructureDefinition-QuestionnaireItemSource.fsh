Extension: QuestionnaireItemSource
Id: QuestionnaireItemSource
Title: "Application source de la réponse à l'item"
Description: "Cette extension permet d'identifier l'application du SI contenant l'information demandée par l'item courant (sa source)."
* ^status = #draft
* ^context[0].type = #element
* ^context[=].expression = "Questionnaire.item"

* . 0..1
* value[x] 0..0
* extension contains
    source 0..1 and
    comment 0..1

* extension[source] only Extension
* extension[source] ^short = "uri de l'application source"
* extension[source] ^definition = "Ce champ permet d'identifier précisément l'application qui contient les informations demandées par le porteur d'usage."
* extension[source].url only uri
* extension[source].value[x] 1..1
* extension[source].value[x] only uri
* extension[source].value[x] from APHPEDSValueSetSourceCode (example)

* extension[comment] only Extension
* extension[comment] ^short = "Commentaire sur la source"
* extension[comment] ^definition = "Cet extension permet au reconcepteur d'enregistrer des commentaires sur l'application source."
* extension[comment].url only uri
* extension[comment].value[x] 1..1
* extension[comment].value[x] only string


Instance: QuestionnaireItemSourceProvenance1
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

Instance: QuestionnaireItemSourceProvenance2
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
