Instance: FormBuilderBackEndRequirements
InstanceOf: CapabilityStatement
Usage: #definition

* name = "FormBuilderBackEndRequirements"
* title = "FormBuilder BackEnd Requirements"
* status = #active
* experimental = false
* date = "2024-09-19"
* description = "Liste des capabilities que doit avoir un serveur FHIR pour répondre aux besoins du FormBuilder."
* fhirVersion = #4.0.1
* kind = #requirements
* format = #json

* rest[+].mode = #server
* rest[=].documentation = "A FHIR server, to serve as AP-HP FormBuilder back end, **SHALL**:\n\n1. Support all profiles mentionned in this Capability Statement.\n1.  Implement the RESTful behavior according to the FHIR specification.\n1. Return the following response classes:\n   - (Status 400): invalid parameter\n   - (Status 401/4xx): unauthorized request\n   - (Status 403): insufficient scope\n   - (Status 404): unknown resource\n   - (Status 410): deleted resource.\n1. Support json source formats for all resources listed in this Capability Statement.\n1. Support searchParameters _sort, _count, _total, _format, url, individually or in combination.\n1. Support the $expand operation for ValueSets.\n\nA FHIR server, to serve as AP-HP FormBuilder back end,  **SHOULD**:\n\n1. Support searchParameters title, identifier, _content, name, code, status, context-type-value individually or in combination to ease the finding of relevant resources.\n1. Support the $validate operation for Questionnaire.\n"
// Security Section - Application ouverte, pas d'authentification requise
* rest[=].security.cors = false
* rest[=].security.description = "Ce serveur est public et ne nécessite pas d'authentification."

// Resource: Questionnaire
* rest[=].resource[+].type = #Questionnaire
* rest[=].resource[=].documentation = "Prend en charge la recherche et la lecture des ressources Questionnaire."
* rest[=].resource[=].versioning = #versioned-update
* rest[=].resource[=].updateCreate = true
* rest[=].resource[=].readHistory = true

* rest[=].resource[=].supportedProfile[0] = Canonical($aphp-sdc-questionnaire)
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].interaction[+].code = #history-instance
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #update

* rest[=].resource[=].operation[+].name = "validate"
* rest[=].resource[=].operation[=].definition = "http://hl7.org/fhir/OperationDefinition/Resource-validate"
* rest[=].resource[=].operation[=].documentation = "Opération de validation comprenant idéalement les profils et les extensions propre à l'APHP."
// search parameters for Questionnaire
* rest[=].resource[=].searchParam[+].name = "_sort"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].documentation = "Trier les résultats par un ou plusieurs critères, par exemple `-_lastUpdated` pour le tri par date de mise à jour décroissante"

* rest[=].resource[=].searchParam[+].name = "_count"
* rest[=].resource[=].searchParam[=].type = #number
* rest[=].resource[=].searchParam[=].documentation = "Nombre maximum de résultats à retourner"

* rest[=].resource[=].searchParam[+].name = "_total"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Mode de calcul du total des résultats (e.g., `accurate` pour un décompte précis)"

* rest[=].resource[=].searchParam[+].name = "_format"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Format de la réponse, on n'utilise que le format : `application/fhir+json`"

* rest[=].resource[=].searchParam[+].name = "title:contains"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].documentation = "Recherche des questionnaires dont le titre contient un texte donné."

* rest[=].resource[=].searchParam[+].name = "identifier:contains"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Recherche des questionnaires dont l'identifiant contient une chaîne donnée."

* rest[=].resource[=].searchParam[+].name = "name:contains"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].documentation = "Recherche des questionnaires dont le nom contient une chaîne donnée."

* rest[=].resource[=].searchParam[+].name = "_content"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].documentation = "Recherche des questionnaires en fonction du contenu."

* rest[=].resource[=].searchParam[+].name = "code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Recherche des questionnaires en fonction d'un code donné."

// Resource: CodeSystem
* rest[=].resource[+].type = #CodeSystem
* rest[=].resource[=].supportedProfile = Canonical($aphp-eds-code-system)
* rest[=].resource[=].versioning = #no-version

* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type

* rest[=].resource[=].operation[+].name = "validate"
* rest[=].resource[=].operation[=].definition = "http://hl7.org/fhir/OperationDefinition/Resource-validate"
* rest[=].resource[=].operation[=].documentation = "Opération de validation comprenant idéalement les profils et les extensions propre à l'APHP."
// search parameters for CodeSystem
* rest[=].resource[=].searchParam[+].name = "url"
* rest[=].resource[=].searchParam[=].type = #uri
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/conformance-url"
* rest[=].resource[=].searchParam[=].documentation = "Recherche par URL du CodeSystem, e.g., `https://aphp.fr/ig/fhir/eds/CodeSystem/aphp-eds-name-space-cs`."

* rest[=].resource[=].searchParam[+].name = "_sort"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].documentation = "Trier les résultats par un ou plusieurs critères, par exemple `-_lastUpdated` pour le tri par date de mise à jour décroissante."

* rest[=].resource[=].searchParam[+].name = "_count"
* rest[=].resource[=].searchParam[=].type = #number
* rest[=].resource[=].searchParam[=].documentation = "Nombre maximum de résultats à retourner."

* rest[=].resource[=].searchParam[+].name = "_format"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "On n'utilise que le format : application/fhir+json"

* rest[=].resource[=].searchParam[+].name = "context"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-context"
* rest[=].resource[=].searchParam[=].type = #token

// Resource: ValueSet
* rest[=].resource[+].type = #ValueSet
* rest[=].resource[=].supportedProfile = Canonical($aphp-eds-value-set)
* rest[=].resource[=].versioning = #no-version

* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].interaction[+].code = #read

* rest[=].resource[=].operation[+].name = "expand"
* rest[=].resource[=].operation[=].definition = "http://hl7.org/fhir/OperationDefinition/ValueSet-expand"
* rest[=].resource[=].operation[=].documentation = "Idéalement l'expansion devrait : (i) récupérer la hiérarchisation du valueset, et (ii) le caractère `not-selectable` des concepts."
// search parameters for ValueSet
* rest[=].resource[=].searchParam[+].name = "url"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/conformance-url"
* rest[=].resource[=].searchParam[=].type = #uri
* rest[=].resource[=].searchParam[=].documentation = "Recherche par URL de la ValueSet, e.g., `https://aphp.fr/ig/fhir/eds/ValueSet/aphp-eds-name-space-vs`."

* rest[=].resource[=].searchParam[+].name = "_sort"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].documentation = "Trier les résultats par un ou plusieurs critères, par exemple `-_lastUpdated` pour le tri par date de mise à jour décroissante."

* rest[=].resource[=].searchParam[+].name = "_count"
* rest[=].resource[=].searchParam[=].type = #number
* rest[=].resource[=].searchParam[=].documentation = "Nombre maximum de résultats à retourner."

* rest[=].resource[=].searchParam[+].name = "_total"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Mode de calcul du total des résultats (e.g., `accurate` pour un décompte précis)."

* rest[=].resource[=].searchParam[+].name = "_format"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "On n'utilise que le format : application/fhir+json"

* rest[=].resource[=].searchParam[+].name = "title:contains"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].documentation = "Recherche des questionnaires dont le titre contient un texte donné."

* rest[=].resource[=].searchParam[+].name = "status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/conformance-status"
* rest[=].resource[=].searchParam[=].documentation = "Recherche par statut du ValueSet."

* rest[=].resource[=].searchParam[+].name = "context-type-value"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/conformance-context-type-value"
* rest[=].resource[=].searchParam[=].type = #composite

// Resource: Bundle
* rest[=].resource[+].type = #Bundle
* rest[=].resource[=].interaction[+].code = #create

// Server-level Operations and Interactions
* rest[=].interaction[+].code = #transaction
* rest[=].interaction[=].documentation = "Prise en charge des bundles de type transaction pour la création de ressources ValueSet multiples"

* rest[=].searchParam[+].name = "_getpages"
* rest[=].searchParam[=].type = #token
* rest[=].searchParam[=].documentation = "Récupère une page spécifique de résultats, utile pour la pagination des réponses à de grandes requêtes."

* rest[=].searchParam[+].name = "_getpagesoffset"
* rest[=].searchParam[=].type = #number
* rest[=].searchParam[=].documentation = "Indique l'offset de pagination pour les résultats paginés."

* rest[=].searchParam[+].name = "_count"
* rest[=].searchParam[=].type = #number
* rest[=].searchParam[=].documentation = "Nombre maximum de résultats à retourner par page."

* rest[=].searchParam[+].name = "_format"
* rest[=].searchParam[=].type = #token
* rest[=].searchParam[=].documentation = "Format de la réponse, tel que `application/fhir+json`."

* rest[=].searchParam[+].name = "_pretty"
* rest[=].searchParam[=].type = #string
* rest[=].searchParam[=].documentation = "Formatte la réponse pour la rendre plus lisible."

* rest[=].searchParam[+].name = "_bundletype"
* rest[=].searchParam[=].type = #token
* rest[=].searchParam[=].documentation = "Spécifie le type de bundle dans la réponse, par exemple `searchset`."
