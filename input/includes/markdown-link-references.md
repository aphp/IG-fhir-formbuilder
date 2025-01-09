<!-- Temporary changes to fix formatting for changelog -->
<style>
  ul.new-content {
    padding-left: 25px !important;
  }
</style>

{% include fsh-link-references.md %}

<!-- External Value Sets -->

<!-- HL7 France FR Core -->
[FrPatient]: https://simplifier.net/packages/hl7.fhir.fr.core/1.1.0/files/783568
[FrEncounter]: https://simplifier.net/packages/hl7.fhir.fr.core/1.1.0/files/783605
[FrOrganization]: https://simplifier.net/packages/hl7.fhir.fr.core/1.1.0/files/783616
[FrOrganizationUf]: https://simplifier.net/packages/hl7.fhir.fr.core/1.1.0/files/783571
[FrOrganizationPole]: https://simplifier.net/packages/hl7.fhir.fr.core/1.1.0/files/783601
[FrOrganizationUAC]: https://simplifier.net/packages/hl7.fhir.fr.core/1.1.0/files/783575
[FrHealthcareService]: https://simplifier.net/packages/hl7.fhir.fr.core/1.1.0/files/783620
[FrPractitioner]: https://simplifier.net/packages/hl7.fhir.fr.core/1.1.0/files/783648
[FrPractitionerRoleExercice]: https://simplifier.net/packages/hl7.fhir.fr.core/1.1.0/files/783592
[FrPractionerRoleProfession]: https://simplifier.net/packages/hl7.fhir.fr.core/1.1.0/files/783561
[FrRelatedPerson]: https://simplifier.net/packages/hl7.fhir.fr.core/1.1.0/files/783677
[FrInhaledOxygen]: https://simplifier.net/packages/hl7.fhir.fr.core/1.1.0/files/783679
[FrObservationOxygenSaturation]: https://simplifier.net/packages/hl7.fhir.fr.core/1.1.0/files/783600

<!-- ANS Mesures -->
[Fréquence cardiaque]: https://interop.esante.gouv.fr/ig/fhir/mesures/StructureDefinition-mesures-fr-observation-heartrate.html
[Pression artérielle (systolique / diastolique)]: https://interop.esante.gouv.fr/ig/fhir/mesures/StructureDefinition-mesures-fr-observation-bp.html
[Nombre de pas]: https://interop.esante.gouv.fr/ig/fhir/mesures/StructureDefinition-mesures-observation-steps-by-day.html
[Niveau de douleur]: https://interop.esante.gouv.fr/ig/fhir/mesures/StructureDefinition-mesures-observation-pain-severity.html
[IMC]: https://interop.esante.gouv.fr/ig/fhir/mesures/StructureDefinition-mesures-fr-observation-bmi.html
[Poids]: https://interop.esante.gouv.fr/ig/fhir/mesures/StructureDefinition-mesures-fr-observation-body-weight.html
[Taille]: https://interop.esante.gouv.fr/ig/fhir/mesures/StructureDefinition-mesures-fr-observation-bodyheight.html
[Température]: https://interop.esante.gouv.fr/ig/fhir/mesures/StructureDefinition-mesures-fr-observation-body-temperature.html
[Glycémie]: https://interop.esante.gouv.fr/ig/fhir/mesures/StructureDefinition-mesures-observation-glucose.html
[Tour de taille]: https://interop.esante.gouv.fr/ig/fhir/mesures/StructureDefinition-mesures-observation-waist-circumference.html
[Périmètre cranien]: https://interop.esante.gouv.fr/ig/fhir/mesures/StructureDefinition-mesures-observation-head-circumference.html

<!-- IPS -->
[IPS Allergy Intolerance]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-AllergyIntolerance-uv-ips.html
[IPS Condition]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Condition-uv-ips.html
[IPS Device]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Device-uv-ips.html
[IPS Device - performer, observer]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Device-observer-uv-ips.html
[IPS Device Use Statement]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-DeviceUseStatement-uv-ips.html
[IPS DiagnosticReport]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-DiagnosticReport-uv-ips.html
[IPS Imaging Study]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-ImagingStudy-uv-ips.html
[IPS Immunization]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Immunization-uv-ips.html
[IPS Media observation (Results: laboratory, media)]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Media-observation-uv-ips.html
[IPS Medication]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Medication-uv-ips.html
[IPS Medication Request]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-MedicationRequest-uv-ips.html
[IPS Medication Statement]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-MedicationStatement-uv-ips.html
[IPS Observation - Pregnancy: EDD]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-pregnancy-edd-uv-ips.html
[IPS Observation - Pregnancy: outcome]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-pregnancy-outcome-uv-ips.html
[IPS Observation - Pregnancy: status]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-pregnancy-status-uv-ips.html
[IPS Observation - SH: alcohol use]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-alcoholuse-uv-ips.html
[IPS Observation - SH: tobacco use]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-tobaccouse-uv-ips.html
[IPS Observation Results]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-results-uv-ips.html
[IPS Observation Results: laboratory]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-results-laboratory-uv-ips.html
[IPS Observation Results: pathology]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-results-pathology-uv-ips.html
[IPS Observation Results: radiology]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-results-radiology-uv-ips.html
[IPS Procedure]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Procedure-uv-ips.html
[IPS Specimen]: http://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Specimen-uv-ips.html

<!-- US Core -->
[US Allergy Intolerance]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-allergyintolerance.html
[US Condition Encounter Diagnosis]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-condition-encounter-diagnosis.html
[US Condition Problems and Health Concerns]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-condition-problems-health-concerns.html
[US DiagnosticReport for Laboratory Results Reporting]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-diagnosticreport-lab.html
[US DiagnosticReport for Report and Note Exchange]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-diagnosticreport-note.html
[US Goal]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-goal.html
[US Immunization]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-immunization.html
[US Medication]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medication.html
[US MedicationDispense]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationdispense.html
[US MedicationRequest]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationrequest.html
[US Observation Clinical Result]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-clinical-result.html
[US Laboratory Result Observation]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-lab.html
[US Observation Occupation]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html
[US Observation Pregnancy Intent]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-pregnancyintent.html
[US Observation Pregnancy Status]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-pregnancystatus.html
[US Observation Screening Assessment]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-screening-assessment.html
[US Simple Observation]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-simple-observation.html
[US Smoking Status Observation]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-smokingstatus.html
[US Vital Signs]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-vital-signs.html
[US Pediatric Head Occipital Frontal Circumference Percentile]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-head-occipital-frontal-circumference-percentile.html
[US Pediatric BMI for Age Observation]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-pediatric-bmi-for-age.html
[US Pediatric Weight for Height Observation]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-pediatric-weight-for-height.html
[US Pulse Oximetry]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-pulse-oximetry.html
[US Respiratory Rate]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-respiratory-rate.html
[US Procedure]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-procedure.html
[US Specimen]: http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-specimen.html

<!-- mCODE -->
[mCODE BodyStructureIdentifier]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-body-structure-identifier.html
[mCODE CancerDiseaseStatus]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-cancer-disease-status.html
[mCODE CancerPatient]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-cancer-patient.html
[mCODE CancerRelatedMedicationAdministration]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-cancer-related-medication-administration.html
[mCODE CancerRelatedMedicationRequest]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-cancer-related-medication-request.html
[mCODE CancerRelatedSurgicalProcedure]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-cancer-related-surgical-procedure.html
[mCODE CancerStageGroup]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-cancer-stage-group.html
[mCODE Comorbidities]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-comorbidities.html
[mCODE ECOGPerformanceStatus]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-ecog-performance-status.html
[mCODE GenomicRegionStudied]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-genomic-region-studied.html
[mCODE GenomicsReport]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-genomics-report.html
[mCODE GenomicVariant]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-genomic-variant.html
[mCODE HumanSpecimen]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-human-specimen.html
[mCODE KarnofskyPerformanceStatus]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-karnofsky-performance-status.html
[mCODE PrimaryCancerCondition]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-primary-cancer-condition.html
[mCODE RadiotherapyCourseSummary]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-radiotherapy-course-summary.html
[mCODE RadiotherapyVolume]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-radiotherapy-volume.html
[mCODE SecondaryCancerCondition]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-secondary-cancer-condition.html
[mCODE TNMDistantMetastasesCategory]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-tnm-distant-metastases-category.html
[mCODE TNMPrimaryTumorCategory]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-tnm-primary-tumor-category.html
[mCODE TNMRegionalNodesCategory]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-tnm-regional-nodes-category.html
[mCODE TNMStageGroup]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-tnm-stage-group.html
[mCODE Tumor]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-tumor.html
[mCODE TumorMarkerTest]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-tumor-marker-test.html
[mCODE TumorSize]: http://hl7.org/fhir/us/mcode/2023May/StructureDefinition-mcode-tumor-size.html

<!-- R4 -->

<!-- Form Builder -->
[Form Builder (prod)]:https://formbuilder-prod-ext-k8s.eds.aphp.fr/
[Form Builder (sandbox)]: https://formbuilder-sandbox-ext-k8s.eds.aphp.fr/
[Form Builder (qua)]: https://formbuilder-qua-ext-k8s.eds.aphp.fr/
[Form Builder (dév)]: https://formbuilder-dev-ext-k8s.eds.aphp.fr/

<!-- Other links -->
