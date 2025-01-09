
// Package hl7.terminology#3.1.0 based on FHIR 4.0.1. Generated 2021-03-06

// External Code Systems with a canonical recognized by terminology.hl7.org
Alias: $loinc                               = http://loinc.org
Alias: $sct                                 = http://snomed.info/sct
//Alias:   SCT = http://snomed.info/sct|http://snomed.info/sct/731000124108   // latest US edition (see exp-params.json)
//Alias:   SCT = http://snomed.info/sct|http://snomed.info/sct/900000000000207008   // Latest international edition
Alias:   SCT_TBD = http://hl7.org/fhir/us/mcode/CodeSystem/snomed-requested-cs
Alias:   $unitsofmeasure = http://unitsofmeasure.org
Alias:   ICD10CM = http://hl7.org/fhir/sid/icd-10-cm
Alias:   ICD10PCS = http://www.cms.gov/Medicare/Coding/ICD10
Alias:   RXN = http://www.nlm.nih.gov/research/umls/rxnorm
Alias:   CPT = http://www.ama-assn.org/go/cpt
Alias:   HGNC = http://www.genenames.org
Alias:   HGVS = http://varnomen.hgvs.org

// Code systems lacking a recognized canonical at terminology.hl7.org
Alias:   GTR = http://www.ncbi.nlm.nih.gov/gtr
Alias:   CLINVAR = http://www.ncbi.nlm.nih.gov/clinvar
Alias:   SO = http://www.sequenceontology.org/
Alias:   AJCC = http://cancerstaging.org
Alias:   ENTREZ = https://www.ncbi.nlm.nih.gov/gene

// Code systems URLs from HL7 Terminology Authority that conflict with terminology.hl7.org
Alias:   NCI = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl

// From terminology.hl7.org
Alias:   OmbRaceCat = urn:oid:2.16.840.1.113883.6.238
Alias:   ICDO3 = http://terminology.hl7.org/CodeSystem/icd-o
Alias:   UMLS = http://terminology.hl7.org/CodeSystem/umls
Alias:   IDTYPE = http://terminology.hl7.org/CodeSystem/v2-0203
Alias:   SPTY = http://terminology.hl7.org/CodeSystem/v2-0487
Alias:   VerStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status
Alias:   ObsInt = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation
Alias:   DiagnosticService = http://terminology.hl7.org/CodeSystem/v2-0074
Alias:   TimingAbbreviation = http://terminology.hl7.org/CodeSystem/v3-GTSAbbreviation
Alias:   MedReqStatus = http://hl7.org/fhir/CodeSystem/medicationrequest-status
Alias:   MedReqIntent = http://hl7.org/fhir/CodeSystem/medicationrequest-intent
Alias:   MedReqCat = 	http://terminology.hl7.org/CodeSystem/medicationrequest-category
Alias:   RefMeaning = http://terminology.hl7.org/CodeSystem/referencerange-meaning
Alias:   AbsentReason = http://terminology.hl7.org/CodeSystem/data-absent-reason

Alias: $v3-ActCode                          = http://terminology.hl7.org/CodeSystem/v3-ActCode
Alias: $observation-category                = http://terminology.hl7.org/CodeSystem/observation-category
Alias: $observation-status                  = http://hl7.org/fhir/observation-status
Alias: $condition-clinical                  = http://terminology.hl7.org/CodeSystem/condition-clinical
Alias: $condition-category                  = http://terminology.hl7.org/CodeSystem/condition-category
Alias: $episode-of-care-status              = http://hl7.org/fhir/episode-of-care-status
Alias: $provenance-participant-type         = http://terminology.hl7.org/CodeSystem/provenance-participant-type
Alias: $event-status                        = http://hl7.org/fhir/event-status

// From HL7
Alias: $variable                                 = http://hl7.org/fhir/StructureDefinition/variable
Alias: $questionnaire-unit                       = http://hl7.org/fhir/StructureDefinition/questionnaire-unit
Alias: $questionnaire-unit-option                = http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption
Alias: $questionnaire-unit-valueset              = http://hl7.org/fhir/StructureDefinition/questionnaire-unitValueSet
Alias: $operationDefinitionAllowedType           = http://hl7.org/fhir/StructureDefinition/operationdefinition-allowed-type
Alias: $fhir-resource-types                      = http://hl7.org/fhir/R4/valueset-resource-types.html
Alias: $fhir-observation-category                = http://hl7.org/fhir/R4/valueset-observation-category.html
Alias: $fhir-event-status                        = http://hl7.org/fhir/R4/valueset-event-status.html
Alias: $identifier-use                           = http://hl7.org/fhir/R4/valueset-event-status.html

// From HL7 SDC
Alias: $sdc-questionnaire-assemble-expectation  = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assemble-expectation
Alias: $sdc-questionnaire-assemble-context      = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext
Alias: $sdc-sub-questionnaire                   = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-subQuestionnaire
Alias: $sdc-questionnaire-calculated-expression = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression
Alias: $sdc-valueset                            = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-valueset
Alias: $sdc-questionnaire-observationExtract    = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract
Alias: $sdc-questionnaire-observationExtractCat = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observation-extract-category
Alias: $launchContext-cs                        = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext
Alias: $launchContext-vs                        = http://hl7.org/fhir/uv/sdc/ValueSet/launchContext
Alias: $sdc-questionnaire-launchContext         = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext

// From AP-HP EDS
Alias: $aphp-eds-identifier-type-cs             = https://aphp.fr/ig/fhir/eds/CodeSystem/aphp-eds-identifier-type-cs
Alias: $aphp-eds-patient                        = https://aphp.fr/ig/fhir/eds/StructureDefinition/aphp-eds-patient
Alias: $aphp-eds-value-set                      = https://aphp.fr/ig/fhir/eds/StructureDefinition/APHPEDSValueSet
Alias: $aphp-eds-code-system                    = https://aphp.fr/ig/fhir/eds/StructureDefinition/APHPEDSCodeSystem
Alias: $aphp-name-space-cs                      = https://aphp.fr/ig/fhir/eds/CodeSystem/aphp-eds-name-space-cs
Alias: $aphp-sdc-questionnaire                  = https://aphp.fr/ig/fhir/eds/StructureDefinition/aphp-eds-questionnaire
