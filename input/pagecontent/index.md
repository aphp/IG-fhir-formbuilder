The AP-HP FormBuilder is a web application that allows the creation/edition of FHIR Questionnaire resources. It also embeds some features to allow CodeSystem and ValueSet use in Questionnaire.

Some features have been specifically added to equip [the semantic layer implementation in a clinical data warehouse](https://github.com/aphp/IG-fhir-dm), and especially the business model creation. 

This implementation guide provide information on how the AP-HP FormBuilder can be used in a delivery process context. 

Some features, curently under developpement, help formalizing metadata information that are necessary to identify precisely the information in the source. The aim is to ease/automatize the redaction of the StructureMaps. 

This tool is based on [an NLM project](https://github.com/LHNCBC/formbuilder-lhcforms), developped by the USA National Library of Medicine (NLM), 9.1.6 version. It therefor rely on the [lforms library](https://github.com/LHNCBC/lforms), also developped by the NLM. It is the 36.1.3 lforms version that is used in AP-HP FormBuilder. 