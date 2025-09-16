# AP-HP FormBuilder FHIR Implementation Guide

The AP-HP FormBuilder FHIR Implementation Guide is available on GitHub at: [https://aphp.github.io/IG-fhir-formbuilder](https://aphp.github.io/IG-fhir-formbuilder/)

It documents the web application "AP-HP FormBuilder", a demo of which is available at [https://github.com/aphp/formbuilder](https://github.com/aphp/formbuilder)

# FHIR IGs 

If you are new to the FHIR community, [this tutorial explain FHIR, profiling and IGs](https://fire.ly/blog/how-to-create-your-first-fhir-profile/)

## local IG build

### Requirements

1. [java](https://adoptium.net/)
2. [jekyll](https://jekyllrb.com/docs/installation/)

### Build

To build this IG localy, execute the following command:

- Linux/macOS: `./gradlew buildIG`
- Windows: `.\gradlew.bat buildIG`

It requires an active interne connection to download some resources: IG publisher, Sushi, necessary conformance resources...

When IG build is achieved, you can browse the IG from the `output/index.html` file.

## Troubleshooting

### Structure Definition is Missing Snapshot Error

Some non-HL7 FHIR packages are distributed without snapshot elements in their profiles. If your IG uses one of these profiles, SUSHI will report an error like the following:

Structure Definition http://interopsante.org/fhir/StructureDefinition/FrPatient is missing snapshot. Snapshot is required for import.

Since SUSHI does not implement its own snapshot generator, you must update the package in your FHIR cache so that its profiles include snapshot elements. Fortunately, the [Firely Terminal](https://fire.ly/products/firely-terminal/) provides a way to do this.

1. run : fhir install <package> (<version>), where <package> is the package id.
   e.g. fhir install hl7.fhir.fr.core 1.1.0
2. run sushi again, the error should have disapeared
