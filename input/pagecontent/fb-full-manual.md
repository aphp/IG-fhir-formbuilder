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

Some other extension were however necessary for the AP-HP FormBuilder to fulfill our needs: 
- First to ease the business modeling: 
  - extension [QuestionnaireItemSource](https://aphp.fr/ig/fhir/formbuilder/StructureDefinition/QuestionnaireItemSource) 
  - extension [itemControl](http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl)
- Second to allow a proper representation of the required data:
  - extension [referenceResource](http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource)
  - extension [maXDecimalPlaces](http://hl7.org/fhir/StructureDefinition/maxDecimalPlaces)
  - extension [variable](http://hl7.org/fhir/StructureDefinition/variable)
  - extension [answerExpression](http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression)
  - extension [calculatedExpression](http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression)
  - attribut 'effectivePeriod'
- Third allow definition-vased form data extraction, however, due to a switch toward structuremap-based fde, these features should soon be deprecated: 
  - attribut 'definition' 
  - extension [itemExtractionContext](http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext)
  - extension [initialExpression](http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression)
  - extension [hidden](http://hl7.org/fhir/StructureDefinition/questionnaire-hidden)
  - extension [isSubject](http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-isSubject)
  - extension [launchContext](http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext)

Last UX/UI was modified:
- addition of a help button (that lead to this guide)
- addition of a validation button (operation $validate)
- numbering management in conditional display
- Hard link toward one server (HAPI test server R4)
- duplication of a part of the tree. 

Sources are available [here](https://github.com/aphp/IG-fhir-formbuilder).