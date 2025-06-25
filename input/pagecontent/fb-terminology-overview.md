The AP-HP FormBuilder propose 3 different approach to manage lists of answer for (open-)choice items : 
1. When the toggle "Answer list source" is set to "Answer option", the list of possible answer is hardcoded as item.answerOption in the Questionnaire resource. This option is quite straightforward and therefor wont be detailed here.
2. When the toggle "Answer list source" is set to "Answer value set URI", the list of possible answer is formalized as a ValueSet, a dedicated and independant FHIR resource. The binding between an item and a ValueSet is formalized through the item.answerValueSet property
3. When the toggle "Answer list source" is set to "Answer expression", the list of possible answer is managed by a coded expression. This option is reserved for advanced user and won't be detailed here. 

We will focus on the second approach with the two following requirements in mind: 
1. the user can bind any ValueSet to an (open-)choice item
2. the user can define his own ValueSet and CodeSystem, to create answer lists dedicated to his needs. 

### Binding an existing ValueSet
The text field "Answer value set" can contain any ValueSet cannonical URL. 

If the corresponding ValueSet (and eventualy CodeSystem) are available in the AP-HP FormBuilder backend (by default [the R4 hapi test server](https://hapi.fhir.org/baseR4)), the concepts gather in the ValueSet will be available for initial value and for conditional display

If the corresponding ValueSet (and eventualy CodeSystem) are NOT available, the above-mentionned feature won't work. 

In both scenario, the ValueSet SHALL be available in the information system in which the Questionnaire will finally be used. 

### Create terminological resources on the fly
**Disclaimer** : the AP-HP FormBuilder is not a solution to manage properly terminological resources. the aim of this work is to provide a solution to create ValueSets on the fly for use in a Questionnaire for user that are not expert in terminology management. 

To make a concept available for use in a ValueSet it must exists in a CodeSystem. It is therefor necessary to have a solution that manage CodeSystem, ValueSet (and Questionnaire). 

The main idea was to formalize group of resources that cover a specific area of interest: 1 CodeSystem will contain all the concepts deemed as necessary, these concepts can be used to compose ValueSets, and these ValueSets can be bind to Choice item in any Questionnaire. 

The group is formalized by the useContext: the resources having the same useContext belong to the same group. 

To enjoy ValueSet creation with FormBuilder: 
- the user must associate a useContext to the Questionnaire 
- the user can then create ONE CodeSystem with the vocabulary module with the same useContext. 
- the user can create as much independant valueSet as he wants with this same useContext, the corresponding CodeSystem (i.e. with the same useContext) is updated to contain all the necessary concepts

It is still possible to bind a ValueSet without the corresponding useContext to any (open-)choice item in any ValueSet ([see the above paragraph](#binding-an-existing-valueset)). 

#### Technical aspects
The Use context field in the AP-HP FormBuilder lead to the creation of a usageContext which code is "program" and value is picked in the [ProgramExample ValueSet](ValueSet-ProgramExample.html), either in Questionnaire (for the form attribute field) or in CodeSystem (for the vocabulary module field), as follow : 

```
"useContext": [
  {
    "code": {
      "system": "http://terminology.hl7.org/CodeSystem/usage-context-type",
      "code": "program",
      "display": "Program"
    },
    "valueCodeableConcept": {
      "coding": [
        {
          "system": "https://aphp.fr/ig/fhir/formbuilder/CodeSystem/ProgramExample",
          "code": "obstetric",
          "display": "Obstetric"
        }
      ]
    }
  }
]
```

The ValueCodeableConcept binding is an example, you should define your own ValueSet of programs. 

#### Create CodeSystem (and ValueSets) with the vocabulary module

It is possible to create a CodeSystem with a useContext by any mean, the vocabulary module being such a mean. please refer to [the vocabulary module notice to know how]().

#### Transform Answer Options into ValueSet

If a CodeSystem with the same useContext than the current form existe, it is possible to transform the answer choices of answer options item in ValueSet using the `Generate the corresponding ValueSet` button beneath the answer choices table. This action has 3 effects : 
1. it enrich the CodeSystem with the same useContext as the current Questionnaire with a root item that has, as child, all the answer choices previously structured in the item interface of the AP-HP FormBuilder
2. it generates an intensional ValueSet defined by the [descendent-of](https://www.hl7.org/fhir/R4/codesystem-filter-operator.html#filter-operator-descendent-of) the root item previously created, with the same useContext
3. it changes the answer list source field in the item interface to Answer value set uri and fill the Answer value set field with the canonical url of the freshly created ValueSet. 

[Please refer to the notice for more information on how to generate ValueSets from answerOption]()

**warning** : the vocabulary module work as "cancel and replace". If you have transformed Answer Option into ValueSet, you can easily loose them all if you don't acte with cautious. In such scenario contact an advanced FHIR user that can retrieve easily the old version of your CodeSystem, with all the ValueSets.