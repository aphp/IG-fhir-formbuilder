Le FormBuilder peut être utilisé pour formaliser les besoins en données exprimées par un utilisateur final. 

à ce titre, le formbuilder permet au chef de projet de l'équipe "Front" de construire, avec le porteur de besoin, un questionnaire qui organisera l'ensemble des données souhaitées. 

à cette étape, il est ainsi souhaitable de pouvoir recueillir dans le formbuilder, pour chaque donnée espérée : 
- la source de laquelle le porteur de projet pense intéressant de récupérer la donnée
- la définition de la donnée (au delà de ce que l'on peut mettre dans le champs text)
- l'importance qu'il accorde au fait de récupérer cette donnée

### Source de la donnée
Au stade de la définition du modèle métier, le porteur de besoin renseigne le chef de projet sur le processus de saisie de cette information dans le SI et notamment l'application dans laquelle cette information est saisie. 

A cette fin, on a ajouté un champ de type tableau avec : 
- un sous-champ selecteur dans une liste d'application source
- un sous-champ texte libre permettant au chef de projet d'ajouter des précision quant à la source

Ce nouveau champ repose sur l'extension [QuestionnaireItemSource].

La valuation de ce champ génère automatiquement une extension complexe dans l'item d'intérêt, comme suit : 
```
"item": [
  {
    "type": "[any]",
    "linkId": "[any]",
    "extension": [
      {
        "url": "https://aphp.fr/ig/fhir/formbuilder/StructureDefinition/QuestionnaireItemSource",
        "extension": [
            {
            "url": "source",
            "valueUri": "[contenue de la colonne Source]"
          },
          {
            "url": "comment",
            "valueUri": "[contenue de la colonne Comments]"
          }
        ]
      }
    ]
  }
]
```

### Définition de la donnée
Le libellé d'une information est souvent insuffisant pour que son interprétation soit non ambigue. Le champ `définition`, de type `text` ajouté dans le formbuilder:
 - permet de palier cette difficulté
 - alimente l'extension [item-control](http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl) proposée par HL7. 

La valuation de ce champ génère automatiquement un item fils à l'item d'intérêt contenant l'extension ci-dessus mentionnées, comme suit:
```
"item": [{
    "linkId": "95348451684515",
    "type": "integer",
    "text": "Item à définir",
    "item": [{
        "text": "[Contenu du champ définition]",
        "type": "display",
        "linkId": "359206201660",
        "extension": [{
            "url": "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
            "valueCodeableConcept": {
              "text": "Help-Button",
              "coding": [{
                  "code": "help",
                  "display": "Help-Button",
                  "system": "http://hl7.org/fhir/questionnaire-item-control"
              }]
            }
        }]
    }]
}]
```

### Importance de la donnée pour le porteur de besoin (à faire)





{% include markdown-link-references.md %}