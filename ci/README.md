# CI-FIG

_version:_ 2.1

Ce projet doit être utilisé en tant que submodule au sein des guides
d'implémentations pour permettre l'utilisation mutualisée du code permettant
le déploiement des IG.

## Ajout en tant que submodule

Le présent dépôt s'ajoute en tant que submodule d'un nouveau projet par la commande :

```bash
git submodule add https://gitlab.data.aphp.fr/ID/ed/dm/ig/ci-fig.git ci
```

## Utilisation au sein de `.gitlab-ci.yml`

Le fichier `.gitlab-ci.yml` du projet concerné doit contenir les lignes suivantes :

```yaml
include:
  - project: 'ID/ed/dm/ig/ci-fig'
    ref: main
    file: 'fig-build.yml'
```

Par défaut, le script utilise toujours la dernière version disponible de Sushi
et de l'IG Publisher. Ce comportement peut être changé en ajoutant :


```yaml
default:
  image: harbor.eds.aphp.fr/public/fhir-ig-builder:VERSION
```
où la `VERSION` de l'image doit être remplacée par une [version disponible d'image publiée](https://gitlab.data.aphp.fr/ID/ed/dm/ig/fhir-ig-builder/).


## Mise à jour

Les mises à jour de ce projet peuvent être appliquées dans les projets
qui l'utilisent en tant que submodule avec la commande suivante :
```bash
git submodule update --remote
```
