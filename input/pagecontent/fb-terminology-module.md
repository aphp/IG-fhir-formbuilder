The terminological module is a FormBuilder integrated feature that allows:
- CodeSystem creation and update
- CodeSystem $validation
- ValueSet creation and update based on the CodeSystem previously created.
- The upload of these resources on the server. 

### Interface
This feature look like a wizard with 4 or 5 steps: 

#### Resource and action selection
<div style="text-align:center">
    <a id="vb-step-1">
        <img src="wizard_step_1.png" alt="first step interface" width="67%" height="67%">
    </a>
</div>

At this step, the user choose:
1. if he want to work on CodeSystem only or if he also want to generate some ValueSet. In the last scenario, a ValueSet is generated for each root concept in the CodeSystem. The ValueSet is defined intensionaly by all the descendent of the root concept. du concept racine (en intension)
2. if he wants to create, or to update existing resources

##### CodeSystem selection (optionnal)
<div style="text-align:center">
    <a id="vb-step-2">
        <img src="wizard_step_2.png" alt="second step interface (optionnal)" width="67%" height="67%">
    </a>
</div>

Only in case of update, this interface allow the user to search and select the CodeSystem he wants to update. 

##### CodeSystem attributes definition and content
<div style="text-align:center">
    <a id="vb-step-3">
        <img src="wizard_step_3.png" alt="third step interface " width="67%" height="67%">
    </a>
</div>

The fields correspond to properties described in [FHIR official documentation](http://hl7.org/fhir/R4/codesystem.html), with the following specificity: 
- the url is build from the concatenation of:
  - the selected implementation guide
  - the created resourceType (CodeSystem or ValueSet)
  - the id of the resource, which is itself generated from 
    - CodeSystem title (for CodeSystem)
    - root concept codes (for ValueSet)
- fields with an * are mandatory. 
- the useContext field is important because it associates the CodeSystem, the ValueSets and the Questionnaire for terminology management. **There can only be one CodeSystem with one useContext**

In case of update, the fields are already filled (depending on the resource to update). Some value cannot be change: 
- id
- fhir implementation guide
- url

It is possible to export JSON file at this step (e.g. for preview reason) 

The fields 'File concepts.csv', 'File hierarchy.csv' and 'File properties.csv' await csv files following the below described format:

###### File concepts.csv
It is the only mandatory file. It declares all the concepts of the CodeSystem. 

It contains two columns, separated by `,`.
the header is: 
```
code,display
```
The code column contains the [concept.code](http://hl7.org/fhir/R4/codesystem-definitions.html#CodeSystem.concept.code). It must respect [FHIR code format](http://hl7.org/fhir/R4/datatypes.html#code).In case of ValueSet generation, root concept code SHALL also respect this regular expression: `[A-Z]([A-Za-z0-9]){0,63}`, namely: 
- begining with a capital letter
- containing only letter and figures
- containing 64 caracters or less

The display column contains [concept.display](http://hl7.org/fhir/R4/codesystem-definitions.html#CodeSystem.concept.display). It must respect the [FHIR string format](http://hl7.org/fhir/R4/datatypes.html#string)

Empty code or display are not allowed. 

###### File hierarchy.csv
This file declares the hierarchy between concepts. This hierarchy will be modelized as nested concept in the CodeSystem (not with a property). 

This file is optionnal. Without a hierarchy.csv file, the concepts will be flat in the CodeSystem.

It contains two columns, separated by `,`.
the header is: 
```
parent,child
```
The parent column contains the parent code, as declared in the concept.csv

The child column contains the child code, as declared in the concept.csv

Empty parent or child are not allowed.

###### File properties.csv
This file allow : 
1. the declaration of CodeSystem property
2. the instanciation of the CodeSystem property for the CodeSystem concepts. 

This file is optionnal. Without a properties.csv file, the concepts won't have any property. 

It contains four columns, separated by `,`.
the header is: 
```
code,key,value,type
```
Each distinct key/type couple lead to the creation of a CodeSystem property with the coresponding CodeSystem property type.

The key should conform to [FHIR code format](http://hl7.org/fhir/R4/datatypes.html#code).

The type should belong to the following list:
- code
- string
- integer
- boolean
- dateTime
- decimal

The four column are necessary for the instanciation of property at the concept level : 
- the `code`corresponds to a concept code as declared in the concepts.csv file. It identify the concept for which a property will be instanciated. 
- the `key` corresponds to `concept.property.code`
- the `type` defines the `concept.property.value[x]` datatype
- the `value` corresponds au `CodeSystem.concept.property.value[x]`. Depending on the type, the format shall be: 
  - [code](http://hl7.org/fhir/R4/datatypes.html#code). The referenced code are those declared in concepts.csv file. 
  - [string](http://hl7.org/fhir/R4/datatypes.html#string) 
  - [integer](http://hl7.org/fhir/R4/datatypes.html#integer)
  - [boolean](http://hl7.org/fhir/R4/datatypes.html#boolean)
  - [dateTime](http://hl7.org/fhir/R4/datatypes.html#dateTime)
  - [decimal](http://hl7.org/fhir/R4/datatypes.html#decimal)

Empty value are not allowed.

##### ValueSet generation
Choosing CodeSystem and ValueSets at step 1 lead to the creation/update of a ValueSet resource for each root concept in the CodeSystem. ValueSets are set up as follow:
- `ValueSet.status` : content of the status field. If root concept are withdrawn, the status is `retired`
- `ValueSet.immutable` : false
- `ValueSet.date` : content of the date field
- `ValueSet.experimental` : content of the experimental field
- `ValueSet.id` : root concept code
- `ValueSet.name` : root concept code
- `ValueSet.title` : root concept display
- `ValueSet.description` : "ValueSet generated with AP-HP FormBuilder"
- `ValueSet.url` : `[IG]/ValueSet/[ValueSet.id]`
- `ValueSet.useContext` : content of the useContext field
- `ValueSet.compose` : descendent-of root concept

##### Validation & Updating / Validation & Creation
<div style="text-align:center">
    <a id="vb-step-4">
        <img src="wizard_step_4.png" alt="fourth step interface" width="67%" height="67%">
    </a>
</div>
At this step, the wizard provide the $validation of the CodeSystem. The user should carefuly review the deviation from the norm.

##### Serveur acknowledgment
<div style="text-align:center">
    <a id="vb-step-5">
        <img src="wizard_step_5.png" alt="fifth step interface" width="67%" height="67%">
    </a>
</div>

The results of the action performed are provided to the user. 

A brief overview of the CodeSystem is provided in the "view CodeSystem" tab. The other tabs contains server acknowledgment messages. 