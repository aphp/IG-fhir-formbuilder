Profile: FBValueSet
Parent: ValueSet
Title: "AP-HP FormBuilder ValueSet"
Description: "Profil de ValueSet pour la pleine utilisation du FormBuilder (et de ses fonctionalités terminologiques)"

* useContext ^slicing.discriminator[+].type = #value
* useContext ^slicing.discriminator[=].path = "code"
* useContext ^slicing.rules = #open
* useContext ^slicing.description = "Defines a slice which allows to group together all the resources (Questionnaire, CodeSystem, ValueSet) of a program"
* useContext contains 
    program 0..1 

* useContext[program].code = http://terminology.hl7.org/CodeSystem/usage-context-type#program
* useContext[program].value[x] only CodeableConcept
* useContext[program].valueCodeableConcept from ProgramExample (example)