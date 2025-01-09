# FHIR IG CapStatement

The projet est un extrait du projet [CapStatement](https://github.com/caspears/CapStatement) qui consiste à générer les ressources FHIR CapabilityStatment via des scripts python et de stemplate Jinja. 

C'est la version integré à l'IG Publisher qui est mise en oeuvre via le présent projet. 

# Exploitation de ce projet dans les IG. 

## Initialiser l'utilisation de CapStatement dans un IG. 

Dans le projet concerné : 
- Lancer la commande : `git submodule add https://gitlab.data.aphp.fr/ID/ed/dm/ig/capstatement.git liquid`. Cela aura pour effet de créer le dossier `liquid` à la racine du projet, et de mettre dedans les fichiers du présent projet (hors README.md)
- ajouter un parametre le fichier `sushi-config.yaml` :
```
parameters:
  path-liquid: liquid
```
- pousser cela sur le repo

## Exploiter un IG exploitant CapStatement

Dans le projet concerné : 
- récupérer le commit d'intéret
- initialiser le submodule via la commande : `git submodule update --init`

## Utiliser CapStatement pour le build de l'IG

L'utilisation est automatique via la tache gradle `buildIG` (pendant la tache `igPublisherBuild`)

