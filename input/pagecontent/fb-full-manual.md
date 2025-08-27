### The FormBuilder

The AP-HP FormBuilderis a fork from [the LHC Form Builder](https://github.com/lhncbc/formbuilder-lhcforms) developped by [the Lister Hill National Center for Biomedical Communication (LHC)](https://lhncbc.nlm.nih.gov/LHC-research/LHC-projects/health-information/lhc-forms.html). 

This tool allows creation/edition of FHIR Questionnaire (FHIR R4). It also embeds some features to allow CodeSystem and ValueSet use in Questionnaire. Lastly, it takes advantage of other tools developped by the LHC (lforms, preview...). 

LHC Form Builder manage some of the FHIR extension detailled in the [Structured Data Capture (SDC) Implementation Guide](http://hl7.org/fhir/uv/sdc/):
- [questionnaire-unit](http://hl7.org/fhir/StructureDefinition/questionnaire-unit)
- [questionnaire-unitOption](http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption)
- [ordinalValue](http://hl7.org/fhir/R4/extension-ordinalvalue.html)
- [regex](http://hl7.org/fhir/R4/extension-regex.html)
- [minLength](http://hl7.org/fhir/StructureDefinition/minLength)
- [minValue](http://hl7.org/fhir/StructureDefinition/minValue)
- [maxValue](http://hl7.org/fhir/StructureDefinition/maxValue)

Some other extension were however necessary for the AP-HP FormBuilder to equip a CDW integration pipeline. 
- To ease the business modeling: 
  - extension [QuestionnaireItemSource](StructureDefinition-QuestionnaireItemSource.html) 
  - extension [itemControl](http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl)
- To allow a proper representation of the required data:
  - extension [referenceResource](http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource)
  - extension [maXDecimalPlaces](http://hl7.org/fhir/StructureDefinition/maxDecimalPlaces)
  - extension [variable](http://hl7.org/fhir/StructureDefinition/variable)
  - extension [answerExpression](http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression)
  - extension [calculatedExpression](http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression)
  - attribut [effectivePeriod](https://www.hl7.org/fhir/R4/questionnaire-definitions.html#Questionnaire.effectivePeriod)
- To allow definition-based form data extraction, however, due to a switch toward structuremap-based fde, these features should soon be deprecated: 
  - attribut [definition](https://www.hl7.org/fhir/R4/questionnaire-definitions.html#Questionnaire.item.definition)
  - extension [itemExtractionContext](http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext)
  - extension [initialExpression](http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression)
  - extension [hidden](http://hl7.org/fhir/StructureDefinition/questionnaire-hidden)
  - extension [isSubject](http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-isSubject)
  - extension [launchContext](http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext)
- [To manage terminological resources for Questionnaire](fb-terminology-module.html)

Plus, the UX/UI was modified:
- the landing page was simplified, to fluidify the navigation through the FormBuilder 
- some quick action were added to the interface: 
  - a help button (that lead to this guide)
  - a validation button (tha execute the $validate operation)
- numbering management in conditional display
- Hard link toward one server (HAPI test server R4)
- duplication of a part of the item tree. 

Sources are available [here](https://github.com/aphp/IG-fhir-formbuilder).

### Using the FormBuilder

[The FormBuilder repository](https://github.com/aphp/formbuilder) indicates how you can run the FormBuilder. 

**Warning:** by default the FormBuilder back end is set to [the R4 public demo instance of HAPI](https://hapi.fhir.org/baseR4). It is therefeor not possible to ensure that all the backend requirement are and will be fullfilled at any time to any user. That may explain some issue using the FormBuilder. 

#### Open a Questionnaire

The landing page offers the opportunity to:
- load a Questionnaire from the server: a dedicated search engine allow you to find your Questionnaire. 
- create a new Questionnaire with a "+" button. In such case a dialog box will require a title from you.  

<div style="text-align:center">
    <a id="landingPage">
        <img src="FB_landing_page.png" alt="landing page">
    </a>
</div>
<br/>

##### Advanced option

<span>Using this button: <img src="three-dot-button.png" alt="Advanced options button"> on the top right of the landing page, the user may:</span>
- resume the last form.
- import a Questionnaire from a local JSON file

#### The quick action bar

Once a form is open, there is a bar on top of the screen that gather some quick actions: 
1. save/load Questionnaire on/from the server
2. switch between the "attribute form page" and the "item page"
3. allow access to the terminological module
4. access some advanced option
   - Questionnaire duplication
   - import from local JSON
   - export to local JSON
   - validation of theQuestionnaire [$validate operation](http://hl7.org/fhir/R4/resource-operation-validate.html)
5. see a preview of your form
6. access to the user manual (the current FHIR Implementation Guide)
7. close the current form and go back to the landing page.

<div style="text-align:center">
    <a id="QuickAction">
        <img src="quick_action_bar.png" alt="Quick actions" width="67%" height="67%">
    </a>
</div>

#### Item interface

<div style="text-align:center">
    <a id="item_interface">
        <img src="questions_interface.png" alt="interface items" width="80%" height="80%">
    </a>
</div>
<br/>

This is the main working interface

On the left part of the screen, there is the Questionnaire items tree. It allows :
- the selection of the active item which is displayed on the right part of the screen (see below)
- the rearrangement of Items, through drag-and-drop
- the search of an item, either by Question text or link id
- insertion, deletion, duplication of an item (and its descendents) throught the "More option" button. 

On the right part of the screen, the details of the selected item are displayed and can be modified. Main item properties are:

<table>
  <caption>
    Item properties
  </caption>
  <thead>
    <tr>
      <th scope="col">Field designation</th>
      <th scope="col">Sub-field / button</th>
      <th scope="col">FHIR Item property</th>
      <th scope="Comment">Comment</th>
      <th scope="Comment">Condition</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Question text</td>
      <td></td>
      <td>text</td>
      <td>It is the label of the item for the respondant, and in the item hierarchy</td>
      <td></td>
    </tr>
    <tr>
      <td>Link id</td>
      <td></td>
      <td>linkId</td>
      <td>Unique id for the item in the Questionnaire. The AP-HP FormBuilder generates it</td>
      <td>Mandatory <br/> read only</td>
    </tr>
    <tr>
      <td>Question code</td>
      <td></td>
      <td>code</td>
      <td>Concept that represents the overall questionnaire</td>
      <td></td>
    </tr>
    <tr>
      <td rowspan="2">Source</td>
      <td>Source application</td>
      <td>extension:QuestionnaireItemSource.<br/>extension:source.valueUri</td>
      <td>Identification of the software that should contain the information required for this item. This field rely on a ValueSet, to set up, that agregate the software of interest in the information system </td>
      <td></td>
    </tr>
    <tr>
      <td>Comment</td>
      <td>extension:QuestionnaireItemSource.<br/>extension:comment.valueString</td>
      <td>Provide more information on the source software</td>
      <td></td>
    </tr>
    <tr>
      <td>Intention</td>
      <td></td>
      <td>item.text (based on the <a href="http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl">questionnaire-itemControl extension</a>)</td>
      <td>Provide additional information on the meaning of the item, when the text is not clear enough</td>
      <td></td>
    </tr>
    <tr>
      <td>Data type</td>
      <td></td>
      <td>type</td>
      <td>It is the item type ('boolean', 'choice', 'decimal'...)</td>
      <td>Mandatory</td>
    </tr>
    <tr>
      <td>Reference resource</td>
      <td></td>
      <td>extension:questionnaire-referenceResource.<br/>valueCode</td>
      <td>Resource type for the expected reference</td>
      <td>If "Data type = Reference" </td>
    </tr>
    <tr>
      <td>Answer list source</td>
      <td></td>
      <td>NA</td>
      <td>
        Setup modality of (open-)choice items:<br/>
        <ul>
          <li>"Answer options" leads to a list of choice hard coded in the Questionnaire</li>
          <li>"Answer value set URI" lead to a list of choice based on a ValueSet</li>
          <li>"Answer expression" leads to a list of choice defined by a coded expression</li>
        </ul>
      </td>
      <td></td>
      </tr>
    <tr>
      <td rowspan="6">Answer choices</td>
      <td>System</td>
      <td>answerOption.<br/>valueCoding.system</td>
      <td>Canonical url of the CodeSystem in which this answer is coded</td>
      <td>If "Answer list source = Answer options" </td>
    </tr>
    <tr>
      <td>Code </td>
      <td>answerOption.<br/>valueCoding.code </td>
      <td>Code of this answer in the specified CodeSystem </td>
      <td>If "Answer list source = Answer options" </td>
      </tr>
    <tr>
      <td>Display</td>
      <td>answerOption.<br/>valueCoding.display</td>
      <td>Label that is displayed to the user (not necessarily the main CodeSystem label for this code) </td>
      <td>If "Answer list source = Answer options" </td>
      </tr>
    <tr>
      <td>Default</td>
      <td>answerOption.<br/>initialSelected</td>
      <td>Identify the answer initialy selected for this item </td>
      <td>If "Answer list source = Answer options" </td>
      </tr>
    <tr>
      <td>Add another answer </td>
      <td>NA</td>
      <td>Add a row in the answer choices table </td>
      <td>If "Answer list source = Answer options" </td>
      </tr>
    <tr>
      <td>Generate the corresponding ValueSet</td>
      <td>NA</td>
      <td>Create a ValueSet from the information available in the Answer choice table (see the terminology management pages, and especially, the <a href="#valueset-creation">AnswerOption to ValueSet switch</a>)</td>
      <td>If "Answer list source = Answer options" </td>
      </tr>
    <tr>
      <td rowspan="2">Answer value set</td>
      <td> </td>
      <td>answerValueSet</td>
      <td>Canonical url of the ValueSet that contains the possible answer for this item </td>
      <td>If "Answer list source = Answer value set URI" </td>
      </tr>
    <tr>
      <td>Edit answer value set</td>
      <td>NA</td>
      <td>This button lead to a ValueSet search engine. Selecting a ValueSet through this search engine will set the "Answer value set" field with the corresponding cannonical url (<a href="#valueset-selection">see the ValueSet selector section</a>)</td>
      <td>If "Answer list source = Answer value set URI" </td> 
      </tr>
    <tr>
      <td rowspan="3">Answer expression</td>
      <td>description</td>
      <td>extension:sdc-questionnaire-answerExpression.<br/>valueExpression.description</td>
      <td>A human friendly description of the logic that drive the list of choice for the current item</td>
      <td>If "Answer list source = Answer expression"</td>
    </tr>
    <tr>
      <td>language </td>
      <td>extension:sdc-questionnaire-answerExpression.<br/>valueExpression.language </td>
      <td>The language in which the logic is coded</td>
      <td>If "Answer list source = Answer expression" <br/> Mandatory</td>
    </tr>
    <tr>
      <td>expression </td>
      <td>extension:sdc-questionnaire-answerExpression.<br/>valueExpression.expression </td>
      <td>The coded expression that is executed to construct the list of choice </td>
      <td>If "Answer list source = Answer expression"</td>
    </tr>
    <tr>
      <td>Initial</td>
      <td> </td>
      <td>NA</td>
      <td>
        Setup modality of the initial value <br/>
        <ul>
          <li>"No" leads to no initial value</li>
          <li>"Value" lead to a hard coded initial value</li>
          <li>"Expression" leads to an initial value defined by a coded expression</li>
        </ul>
      </td>
      <td> </td>
    </tr>
    <tr>
      <td rowspan="3">Initial value</td>
      <td>(Value)</td>
      <td>initial.value[x]</td>
      <td>A fixed initial value </td>
      <td>If "Initial = Value" </td>
    </tr>
    <tr>
      <td>Unit </td>
      <td>
        initial.valueQuantity.unit<br/> 
        initial.valueQuantity.system<br/>
        initial.valueQuantity.code
      </td>
      <td>The unit of the initial value (UCUM expressed)</td>
      <td>If "Data type = quantity and Initial = Value"</td>
    </tr>
    <tr>
      <td>Add another value</td>
      <td>NA</td>
      <td>Add an initial value</td>
      <td>If "Initial = Value and Allow repeating question? = Yes" </td>
    </tr>
    <tr>
      <td rowspan="3">Initial expression</td>
      <td>description</td>
      <td>extension:sdc-questionnaire-initialExpression.<br/>valueExpression.description </td>
      <td>A human friendly description of the logic that drive the variable initial value for the current item</td>
      <td>If "Initial = Expression"</td>
    </tr>
    <tr>
      <td>language </td>
      <td>extension:sdc-questionnaire-initialExpression.<br/>valueExpression.language</td>
      <td>The language in which the logic is coded</td>
      <td>If "Initial = Expression" <br/> mandatory</td>
    </tr>
    <tr>
      <td>expression </td>
      <td>extension:sdc-questionnaire-initialExpression.<br/>valueExpression.expression</td>
      <td>The coded expression that is executed to set up the initial value </td>
      <td>If "Initial = Expression"</td>
    </tr>
    <tr>
      <td>Units</td>
      <td> </td>
      <td>extension:questionnaire-unit.valueCoding</td>
      <td>
        For decimal and integer : hard coding of the unit (UCUM expressed)<br/>
        For quantity, multiple unit (UCUM expressed) from which the respondant will select one. 
      </td>
      <td>If "Data type in (decimal, integer, quantity)" </td>
    </tr>
    <tr>
      <td>Allow repeating question?</td>
      <td> </td>
      <td>repeats </td>
      <td>If the respondant can provide more than one answer to the item</td>
      <td> </td>
    </tr>
    <tr>
      <td>Answer required</td>
      <td> </td>
      <td>required</td>
      <td>If an answer SHALL be provided by the respondant</td>
      <td> </td>
    </tr>
    <tr>
      <td>Read Only</td>
      <td> </td>
      <td>readOnly</td>
      <td>If the respondant cannot modify the field content </td>
      <td> </td>
    </tr>
    <tr>
      <td rowspan="3">Use restrictions?</td>
      <td>No / Yes </td>
      <td>NA</td>
      <td>Is there a restriction on the value that are acceptable from the respondant ? </td>
      <td>If "Data type not in (boolean, date, dateTime, time, choice, attachment, header)"</td>
    </tr>
    <tr>
      <td>Restriction</td>
      <td>NA</td>
      <td>The kind of restriction to set up </td>
      <td>If "Use restriction?.No / Yes = Yes" </td>
    </tr>
    <tr>
      <td>Value</td>
      <td>
        maxLength<br/>
        extension:minLength.valueInteger<br/>
        extension:regex.valueString<br/>
        extension:maxDecimalPlaces.valueInteger<br/>
        extension:minValue.valueDecimal<br/>
        extension:maxValue.valueDecimal
      </td>
      <td>The value of the restriction</td>
      <td>If "Use restriction?.No / Yes = Yes" </td>
    </tr>
    <tr>
      <td>Value for item extraction context</td>
      <td> </td>
      <td>NA</td>
      <td>
        Setup context for item extraction : <br/>
        <ul>
          <li>"No" leads to no form data extraction </li>
          <li>"Value" lead to the creation of the specified resource </li>
          <li>"Expression" leads to the update of the specified resource</li>
        </ul>
      </td>
      <td> </td>
    </tr>
    <tr>
      <td>Code</td>
      <td> </td>
      <td>extension:sdc-questionnaire-itemExtractionContext.<br/>valueCode </td>
      <td>The resource type to be extracted </td>
      <td>If "Value for item extraction context = Value" </td>
    </tr>
    <tr>
      <td rowspan="3">Expression</td>
      <td>description</td>
      <td>extension:sdc-questionnaire-itemExtractionContext.<br/>valueExpression.description </td>
      <td>The human friendly description of the resource that SHOULD be updated </td>
      <td>If "Value for item extraction context = Expression"</td>
    </tr>
    <tr>
      <td>language </td>
      <td>extension:sdc-questionnaire-itemExtractionContext.<br/>valueExpression.language</td>
      <td>The language in which the item extraction logic is coded</td>
      <td>If "Value for item extraction context = Expression"</td>
    </tr>
    <tr>
      <td>expression </td>
      <td>extension:sdc-questionnaire-itemExtractionContext.<br/>valueExpression.expression</td>
      <td>The coded expression that is executed to select the resource to update</td>
      <td>If "Value for item extraction context = Expression"</td>
    </tr>
    <tr>
      <td rowspan="2">Definition</td>
      <td>URL structure de definition</td>
      <td>definition</td>
      <td>Canonical url of the resource type that should be extracted </td>
      <td> </td>
    </tr>
    <tr>
      <td>Fhirpath </td>
      <td>definition</td>
      <td>Resource property that should be filled with the item answer</td>
      <td> </td>
    </tr>
    <tr>
      <td>Subject item</td>
      <td> </td>
      <td>extension:sdc-questionnaire-isSubject.<br/>valueBoolean</td>
      <td>Indicates that the subject of the item is or not the subject of the QuestionnaireResponse </td>
      <td>If "Data type" = "Reference" </td>
    </tr>
    <tr>
      <td rowspan="4">Variables</td>
      <td>Name </td>
      <td>extension:variable.<br/>valueExpression.name </td>
      <td>The name of the variable that can be used in any coded expression (under the current item only) </td>
      <td> </td>
    </tr>
    <tr>
      <td>Language </td>
      <td>extension:variable.<br/>valueExpression.language </td>
      <td>The language in which the evaluation of the variable is coded </td>
      <td>Mandatory</td>
    </tr>
    <tr>
      <td>Expression </td>
      <td>extension:variable.<br/>valueExpression.expression </td>
      <td>The coded expression that is executed to evaluate the variable</td>
      <td> </td>
    </tr>
    <tr>
      <td>Add</td>
      <td>NA</td>
      <td>Add another variable</td>
      <td> </td>
    </tr>
    <tr>
      <td rowspan="3">Conditional display</td>
      <td>Question </td>
      <td>enableWhen.question </td>
      <td>Define the item whose response will be evaluated (left operand) </td>
      <td> </td>
    </tr>
    <tr>
      <td>Operator </td>
      <td>enableWhen.operator <br/> enableWhen.answerBoolean </td>
      <td>Define the operator that will serve to compare left and right operand </td>
      <td> </td>
    </tr>
    <tr>
      <td>Answer </td>
      <td>enableWhen.answer[x]</td>
      <td>Define the right operand for the condition evaluation </td>
      <td> </td>
    </tr>
    <tr>
      <td>Show this item when</td>
      <td> </td>
      <td>enableBehavior</td>
      <td>Specify if all the condition previously specified must be respected or only one </td>
      <td> </td>
    </tr>
    <tr>
      <td>Hidden item</td>
      <td> </td>
      <td>extension:questionnaire-hidden.<br/>valueBoolean </td>
      <td>If yes, the curent item, and all its descendant are not shown to the respondant. These items may contain information that are relevant for data extraction, score computation...</td>
      <td> </td>
    </tr>
    <tr>
      <td>Calculated</td>
      <td> </td>
      <td>NA</td>
      <td>
        Set up the dynamic calculated value<br/>
        <ul>
          <li>"No" leads to no calculated value </li>
          <li> "Expression" leads to a calculated value defined by a coded expression</li>
        </ul>
      </td>
      <td> </td>
    </tr>
    <tr>
      <td rowspan="3">Expression</td>
      <td>description</td>
      <td>extension:sdc-questionnaire-calculatedExpression.<br/>valueExpression.description</td>
      <td>A human friendly description of the logic that drive the calculated value for the current item</td>
      <td>If "Calculated = Expression" </td>
    </tr>
    <tr>
      <td>language </td>
      <td>extension:sdc-questionnaire-calculatedExpression.<br/>valueExpression.language </td>
      <td>The language in which the logic is coded</td>
      <td>
        If "Calculated = Expression"<br/>
        Mandatory
      </td>
    </tr>
    <tr>
      <td>expression </td>
      <td>extension:sdc-questionnaire-calculatedExpression.<br/>valueExpression.expression </td>
      <td>The coded expression that is executed to set up the calculated value</td>
      <td>If "Calculated = Expression" </td>
    </tr>
  </tbody>
</table>

##### ValueSet creation - <i>not fully implemented and therefor unavailable yet</i>

The AP-HP FormBuilder offers the possibility to generate a ValueSet from the specified answer choices. 

The conditions are the following: 
- the form is associated to a useContext
- there is one, and only one CodeSystem with this useContext
- type choice item with answerOption
- at least one answerOption
- answerOptions SHALL have a display
- answerOption MAY have a code, this code SHALL be different from those already existing in the CodeSystem (unique)
- answerOption MAY have a system, this system SHALL be the CodeSystem with this useContext
- answerOption SHALL NOT have score

It is possible to transform the answer choices of answer options item in ValueSet using the `Generate the corresponding ValueSet` button beneath the answer choices table. This action has 3 effects : 
1. it enrich the CodeSystem with the same useContext as the current Questionnaire with a root item that has, as child, all the answer choices previously structured in the item interface of the AP-HP FormBuilder
2. it generates an intensional ValueSet defined by the [descendent-of](https://www.hl7.org/fhir/R4/codesystem-filter-operator.html#filter-operator-descendent-of) the root item previously created, with the same useContext
3. it changes the answer list source field in the item interface to Answer value set uri and fill the Answer value set field with the canonical url of the freshly created ValueSet. 

[More information on the resources created are available in the Terminological resources management page](fb-terminology-overview.html#transform-answer-options-into-valueset)


##### ValueSet selection

For '(open-)choice' item with 'Answer value set URI', it is possible to call the "ValueSet selector" using the button on the right side of the field. 

<div style="text-align:center">
    <a id="valuesetSelectorCall">
        <img src="valueset_selector_call.png" alt="calling valueset selector" width="75%" height="75%">
    </a>
</div>
<br/>
the "ValueSet selector" allows search for the 'value set' to bind to the current item. 

Three properties of ValueSet are searchable:

- title
- status

<div style="text-align:center">
    <a id="valueset_selector">
        <img src="valueset_selector.png" alt="valueset_selector" width="50%" height="50%">
    </a>
</div>

Clicking on the ValueSet tile of interest will lead the user to the item page with the answer value set field filled with the selected ValueSet canonical url.

##### Item manipulation

###### Addition

There is two way to add an item in the item tree:

1. Using one of the `...` buton in the item tree
2. Using the 'Add new item' buton either the one above, or the one below the Current item frame. 

###### Deletion

There is two way to delete an item (and its descendent) in the item tree:

1. Using one of the `...` buton in the item tree
2. Using the 'Delete this item' buton below the Current item frame.

###### modifiing item order

There is two way to move an item (and its descendent) in the item tree:

1. Using one of the `...` buton in the item tree
2. drag-and-frop item in the item tree.

###### duplicate item

The `...` butons in the item tree provide a duplicate feature. The duplicates are strictly the same as the duplicated item (conditional display for exemple), except for the linkId.

#### Questionnaire properties interface

<div style="text-align:center">
    <a id="interface formulaire">
        <img src="form_attributes_interface.png" alt="interface formulaire" width="80%" height="80%">
    </a>
</div>
<br/>

This interface allows the modification of the main Questionnaire properties.

<table>
  <caption>
    Questionnaire properties
  </caption>
  <thead>
    <tr>
      <th scope="col">Field designation</th>
      <th scope="col">Sub-field / button</th>
      <th scope="col">FHIR Item property</th>
      <th scope="Comment">Comment</th>
      <th scope="Comment">Condition</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Title</td>
      <td></td>
      <td><a href="https://www.hl7.org/fhir/R4/questionnaire-definitions.html#Questionnaire.title">title</a></td>
      <td>Usefull to search for the Questionnaire in FormBuilder</td>
      <td></td>
    </tr>
    <tr>
      <td>Id</td>
      <td></td>
      <td><a href="https://www.hl7.org/fhir/R4/resource-definitions.html#Resource.id">id</a></td>
      <td>Proposed automaticaly at Questionnaire creation from the title. It cannot be modified after creation. It is interesting to have Questionnaire.id that provide a minimal amount of information about content.</td>
      <td>Read only</td>
    </tr>
    <tr>
      <td>Use context</td>
      <td></td>
      <td><a href="https://www.hl7.org/fhir/R4/questionnaire-definitions.html#Questionnaire.useContext">useContext</a></td>
      <td>This field allow the association of a Questionnaire to a program, which is also associated with CodeSystem and ValueSet. It is useful for vocabulary management with AP-HP FormBuilder</td>
      <td>It is necessary to value this field to allow ValueSet creation.</td>
    </tr>
    <tr>
      <td>Code</td>
      <td></td>
      <td><a href="https://www.hl7.org/fhir/R4/questionnaire-definitions.html#Questionnaire.code">code</a></td>
      <td>Usefull if the Questionnaire is the FHIR translation of a form that is already identified in any codesystem, or to represent the Questionnaire in a CodeSystem</td>
      <td></td>
    </tr>
    <tr>
      <td>Status</td>
      <td></td>
      <td><a href="https://www.hl7.org/fhir/R4/questionnaire-definitions.html#Questionnaire.status">status</a></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Version</td>
      <td></td>
      <td><a href="https://www.hl7.org/fhir/R4/questionnaire-definitions.html#Questionnaire.version">version</a></td>
      <td>The business version of the Questionnaire. Each new business version of a Questionnaire SHOULD lead to the creation of a new Questionnaire instance with the same url but a new version.</td>
      <td>Couple url/version SHALL be unique.</td>
    </tr>
    <tr>
      <td>Description</td>
      <td></td>
      <td><a href="https://www.hl7.org/fhir/R4/questionnaire-definitions.html#Questionnaire.description">description</a></td>
      <td>A short description of Questionnaire content</td>
      <td></td>
    </tr>
    <tr>
      <td>Purpose</td>
      <td></td>
      <td><a href="https://www.hl7.org/fhir/R4/questionnaire-definitions.html#Questionnaire.purpose">purpose</a></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Publisher</td>
      <td></td>
      <td><a href="https://www.hl7.org/fhir/R4/questionnaire-definitions.html#Questionnaire.publisher">publisher</a></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Date</td>
      <td></td>
      <td><a href="https://www.hl7.org/fhir/R4/questionnaire-definitions.html#Questionnaire.date">date</a></td>
      <td>It is the date corresponding to the last change in the questionnaire (business perspective)</td>
      <td>Mandatory except for draft questionnaire</td>
    </tr>
    <tr>
      <td>Last review date</td>
      <td></td>
      <td><a href="https://www.hl7.org/fhir/R4/questionnaire-definitions.html#Questionnaire.lastReviewDate">lastReviewDate</a></td>
      <td>The date corresponding to the last review of the Questionnaire by business, whether it led to a change in Questionnaire or not.</td>
      <td></td>
    </tr>
    <tr>
      <td rowspan="3">Identifiers</td>
      <td>System</td>
      <td><a href="https://www.hl7.org/fhir/R4/questionnaire-definitions.html#Questionnaire.identifier">identifier.system</a></td>
      <td rowspan="3">A Questionnaire may have multiple identifier, in multiple namespace.</td>
      <td></td>
    </tr>
    <tr>
      <td>Value</td>
      <td><a href="https://www.hl7.org/fhir/R4/questionnaire-definitions.html#Questionnaire.identifier">identifier.value</a></td>
      <td></td>
    </tr>
    <tr>
      <td>Add</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td rowspan="2">Effective period</td>
      <td>Start</td>
      <td><a href="https://www.hl7.org/fhir/R4/questionnaire-definitions.html#Questionnaire.effectivePeriod">effectivePeriod.start</a></td>
      <td rowspan="2"></td>
      <td></td>
    </tr>
    <tr>
      <td>End</td>
      <td><a href="https://www.hl7.org/fhir/R4/questionnaire-definitions.html#Questionnaire.effectivePeriod">effectivePeriod.end</a></td>
      <td></td>
    </tr>
    <tr>
      <td>Url</td>
      <td></td>
      <td><a href="https://www.hl7.org/fhir/R4/questionnaire-definitions.html#Questionnaire.url">url</a></td>
      <td></td>
      <td>Couple url/version SHALL be unique.</td>
    </tr>
    <tr>
      <td>Meta source</td>
      <td></td>
      <td><a href="https://www.hl7.org/fhir/R4/resource.html#Meta">meta.source</a></td>
      <td>provide minimal information on Questionnaire provenance</td>
      <td></td>
    </tr>
    <tr>
      <td rowspan="4">Launch context</td>
      <td>Name</td>
      <td><a href="https://hl7.org/fhir/uv/sdc/StructureDefinition-sdc-questionnaire-launchContext-definitions.html#Extension.extension:name">extension:sdc-questionnaire-launchContext.<br/>extension:name.valueCoding</a></td>
      <td rowspan="4">Contextual element loaded for QuestionnaireResponse instanciation</td>
      <td></td>
    </tr>
    <tr>
      <td>Type</td>
      <td><a href="https://hl7.org/fhir/uv/sdc/StructureDefinition-sdc-questionnaire-launchContext-definitions.html#Extension.extension:type">extension:sdc-questionnaire-launchContext.<br/>extension:type.valueCode</a></td>
      <td></td>
    </tr>
    <tr>
      <td>Description</td>
      <td><a href="https://hl7.org/fhir/uv/sdc/StructureDefinition-sdc-questionnaire-launchContext-definitions.html#Extension.extension:description">extension:sdc-questionnaire-launchContext.<br/>extension:description.valueString</a></td>
      <td></td>
    </tr>
    <tr>
      <td>Add</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td rowspan="4">Variables</td>
      <td>Name</td>
      <td><a href="http://hl7.org/fhir/R4/extension-variable-definitions.html#extension.Extension.value[x]">extension:variable.<br/>valueExpression.name</a></td>
      <td rowspan="4">Allow the definition of variable that can be used for intial expression, calculated expression, pre-population... of a QuestionnaireResponse.</td>
      <td></td>
    </tr>
    <tr>
      <td>Language</td>
      <td><a href="http://hl7.org/fhir/R4/extension-variable-definitions.html#extension.Extension.value[x]">extension:variable.<br/>valueExpression.language</a></td>
      <td></td>
    </tr>
    <tr>
      <td>Expression</td>
      <td><a href="http://hl7.org/fhir/R4/extension-variable-definitions.html#extension.Extension.value[x]">extension:variable.<br/>valueExpression.expression</a></td>
      <td></td>
    </tr>
    <tr>
      <td>Add</td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>

#### Questionnaire preview

<div style="text-align:center">
    <a id="preview_interface">
        <img src="preview_interface.png" alt="interface preview" width="80%" height="80%">
    </a>
</div>
<br/>
A frugal representation of the Questionnaire can be simulated. It is also possible to preview the JSON representation of the Questionnaire.

**Warning:** This feature rely on another library

#### Save
<span>The cloud_up button <img src="cloud_up.png" alt="sauvegarde" width="4%" height="4%"> save the form on the server. It is acknowledge by a pop-up that contains many Questionnaire top information</span>

<div style="text-align:center">
    <a id="acquittementSav">
        <img src="acquitement_sav.png" alt="acquittement sauvegarde" width="55%" height="55%">
    </a>
</div>

#### Load
<span>The cloud_down button <img src="cloud_down.png" alt="chargement" width="4%" height="4%"> open a pop-up similar to the landing page that provide: </span>
- a list of the last modified Questionnaire
- a search engine to find your Questionnaire

<div style="text-align:center">
    <a id="importForm">
        <img src="FB_import_from_server.png" alt="moteur de recherche de formulaire" width="67%" height="67%">
    </a>
</div>

#### Advanced features

##### Questionnaire duplication

While the save operation update the instance of Questionnaire instance on the server, the duplication operation let the existing instance as is and create a new Questionnaire instance. It is usefull to create a new version of a Questionnaire. 

##### Import local JSON

This feature allow the loading of a Questionnaire from a JSON file, not necessarily available on the server.

##### Export as JSON

To retrieve the JSON on your computer. 

##### Validation

This feature execute the [$validation operation](https://www.hl7.org/fhir/R4/resource-operation-validate.html) on the current Questionnaire.
The validation results are acknowledged by a pop-up that lists all the deviation from the norm. 

#### Vocabulary module

This module allow the creation of CodeSystem/ValueSets from CSV files. It is not a full terminology management service...
It is well described in the [terminological module page](module-termino.html)

#### Help

The Question mark buton in the quick action bar lead the user to this implementation guide. 

#### Bug report

The bug buton in the quick action bar lead the user to the github of the project where he can leave an issue. 

{% include markdown-link-references.md %}