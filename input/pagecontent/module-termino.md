### Présentation de l'outil
Le VocaBuilder est une fonctionalité integrée au FormBuilder qui permet : 
 - de générer et mettre à jour des ressources FHIR CodeSystem (JSON) à partir de système d'organisation des connaisance existant
 - de valider la conformité de ces CodeSystem 
 - de générer et mettre à jour des ressources FHIR ValueSet (JSON) à partir des CodeSystem précédement générés
 - d'uploader ces ressources sur un serveur FHIR. 

#### Interface
Cette fonctionnalitée se présente sous forme d'un assistant en 4 ou 5 étapes:

##### Resource and action selection
<div style="text-align:center">
    <a id="vb-step-1">
        <img src="wizard_step_1.png" alt="Interface de la première étape de gestion de ressource terminologique" width="67%" height="67%">
    </a>
</div>

A cette étape l'utilisateur choisi :
1. S'il veut travailler sur un CodeSystem uniquement ou s'il veut aussi générer des valueSet. Dans ce second cas, un valueSet est automatiquement généré pour chaque concept racine du CodeSystem. Ce ValueSet se compose de tous les descendants du concept racine (en intension)
2. S'il veut créer des ressources ou s'il veut mettre à jour des ressources existantes. 

##### CodeSystem selection (optionnel)
<div style="text-align:center">
    <a id="vb-step-2">
        <img src="wizard_step_2.png" alt="Interface de la deuxième étape (optionnelle) de gestion de ressource terminologique" width="67%" height="67%">
    </a>
</div>

En cas d'update seulement, l'utilisateur est invité à chercher et sélectionner le codesystem qu'il souhaite mettre à jour.

##### CodeSystem attributes definition and content
<div style="text-align:center">
    <a id="vb-step-3">
        <img src="wizard_step_3.png" alt="Interface de la troisième étape de gestion de ressource terminologique" width="67%" height="67%">
    </a>
</div>

Les champs se rapportent aux attributs FHIR décrit dans la [documentation FHIR officielle](http://hl7.org/fhir/R4/codesystem.html). à noter néanmoins : 
- l'url est construite à partir :
  - du FHIR IG sélectionné 
  - du type de ressource créé (CodeSystem ou ValueSet)
  - de l'id de la ressource généré à partir du title pour les CodeSystem et à partir des codes des concepts racines pour les ValueSet
- les champs avec une * sont obligatoires. 
- l'attribut UseContext est important car il permet de "ranger" différents types de ressource (CodeSystem, ValueSet, Questionnaire...) dans un domaine tel que défini dans le delivery process. **Il ne peut y avoir qu'un CodeSystem pour un usecontext.**

En cas d'update, les champs sont préremplis avec les informations correspondantes aux codesystem sélectionné à l'étape 2. Certaines valeurs ne sont pas modifiable : 
- id
- FHIR IG
- URL

Lors de cette étape, il est possible d'exporter au format JSON les ressources en cours de création. 

Les champs File concepts.csv, File hierarchy.csv et File properties.csv attendent des fichiers au format csv décrit ci dessous. 

###### fichier concepts.csv
Ce fichier permet de déclarer les concepts contenus dans le CodeSystem. Il est obligatoire. 

Le separateur est une `,`.

Il contient deux colonnes avec l'entête de colonne suivante : 
```
code,display
```

- La colonne `code` contient le [concept.code](http://hl7.org/fhir/R4/codesystem-definitions.html#CodeSystem.concept.code). Il doit respecter le format [code FHIR](http://hl7.org/fhir/R4/datatypes.html#code). En cas de génération de ValueSet à partir des concept racine, les codes des concepts racine doivent en outre respecter l'expression régulière suivante : `[A-Z]([A-Za-z0-9]){0,63}`, à savoir : 
  - commencer par une lettre majuscule
  - ne contenir que des lettres et des chiffres
  - faire 64 caractères ou moins
- La colonne `display` contient le [concept.display](http://hl7.org/fhir/R4/codesystem-definitions.html#CodeSystem.concept.display). Il doit respecter le format [string FHIR](http://hl7.org/fhir/R4/datatypes.html#string)

Les valeurs vides ne sont pas acceptées. 

###### fichier hierarchy.csv
Ce fichier permet de déclarer la hiérarchie entre les concepts. Cette hiérarchie sera mise en forme, dans la ressource fhir, par l'emboitement des concepts les uns dans les autres (`concept.concept`). Ce fichier est facultatif. En son absence, les concept sont "à plat" dans le CodeSystem. 

Le separateur est une `,`.

Ce fichier contient deux colonnes avec l'entête de colonne suivante : 
```
parent,child
```

- La colonne `parent` contient le code du père
- La colonne `child` contient le code du fils 

Les codes (`parent` comme `child`) sont ceux déclarés dans le fichier concepts.csv. 

Les valeurs vides ne sont pas acceptées. 

###### fichier properties.csv
Ce fichier permet : 
1. de déclarer les propriétés qui peuvent être associées aux concepts au niveau du CodeSystem
2. d'instancier les propriétés déclarées au niveau de chaque concept

Ce fichier est facultatif. En son absence, les concepts du codeSystem n'ont pas de propriété. 

Le separateur est une `,`.

Ce fichier contient quatre colonnes avec l'entête de colonne suivante : 
```
code,key,value,type
```
Les colonnes `key` et `type` servent à la déclaration des propriétés (`CodeSystem.property.code` et `CodeSystem.property.type`, respectivement). Seules les valeurs distinctes donnent lieu à la déclaration d'une property. 

- La `key` doit être conforme au format [code FHIR](http://hl7.org/fhir/R4/datatypes.html#code).
- Le `type` doit appartenir à la liste suivante : 
    - code
    - Coding <- non encore pris en charge.
    - string
    - integer
    - boolean
    - dateTime
    - decimal

Les quatres colonnes sont nécessaire à l'instanciation des propriété au niveau des concepts : 
- le `code` correspond à un code déclaré dans le fichier concepts.csv. Il permet d'identifier le concept pour lequel il faut instancier la propriété
- la `key` correspond au `CodeSystem.concept.property.code`
- le `type` définit le datatype de `CodeSystem.concept.property.value[x]`
- la `value` correspond au `CodeSystem.concept.property.value[x]`. Selon le type elle doit être au format : 
  - [code](http://hl7.org/fhir/R4/datatypes.html#code)
  - [string](http://hl7.org/fhir/R4/datatypes.html#string) 
  - [integer](http://hl7.org/fhir/R4/datatypes.html#integer)
  - [boolean](http://hl7.org/fhir/R4/datatypes.html#boolean)
  - [dateTime](http://hl7.org/fhir/R4/datatypes.html#dateTime)
  - [decimal](http://hl7.org/fhir/R4/datatypes.html#decimal)

Les `code` sont ceux déclarés dans le fichier concepts.csv. 

Les valeurs vides ne sont pas acceptées. 

###### Génération des ValueSet
La sélection de l'option CodeSytem et ValueSet(s) à l'étape 1 conduit à la création / mise à jour d'une ressource ValueSet par concept racine dans le CodeSysteme. Ce ValueSet est définit comme suit : 
- `ValueSet.status` : contenu du champ Status. Si des concepts racines disparaissent, le status du ValueSet associé passe à `retired`
- `ValueSet.immutable` : forcé à false
- `ValueSet.date` : contenu du champ Date
- `ValueSet.experimental` : contenu du champ Experimental
- `ValueSet.id` : code du concept racine
- `ValueSet.name` : code du concept racine
- `ValueSet.title` : display du concept racine
- `ValueSet.description` : forcé à "ValueSet généré avec le FormBuilder"
- `ValueSet.url` : `[IG]/ValueSet/[ValueSet.id]`
- `ValueSet.useContext` : contenu du champ useContext
- `ValueSet.compose` : les fils du concept racine (en intention)

##### Validation & Updating / Validation & Creation
<div style="text-align:center">
    <a id="vb-step-4">
        <img src="wizard_step_4.png" alt="Interface de la quatrième étape de gestion de ressource terminologique" width="67%" height="67%">
    </a>
</div>

Lors de cette étape, l'assitant renvoit le résultat de l'opération de validation de la conformité du CodeSystem (pas des valueSet). Charge à l'utilisateur de s'assurer que les problèmes remontés sont acceptables dans le context qui est le sien. 

##### Serveur acknowledgment
<div style="text-align:center">
    <a id="vb-step-5">
        <img src="wizard_step_5.png" alt="Interface de la cinquième étape de gestion de ressource terminologique" width="67%" height="67%">
    </a>
</div>

Un message permet à l'utilisateur de savoir les opérations qui ont pu être menée à bien sur le serveur. La ressource codesystem est briévement présenté dans l'onglet "View CodeSystem", tandis que les onglets "View server reply..." révèlent les messages d'acquitement produit par le serveur. 