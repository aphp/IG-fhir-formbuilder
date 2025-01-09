#!/bin/bash
# 
# Script de nettoyage du cache
#
# Ce script retire du cache persistant les rendus dont les branches n'existent
# plus sur le dépôt GitLab.

# Recupère la liste des branches
git fetch --all

# Liste des branches actuelles (construction des slugs équivalentes)
branches="$(git branch -r | cut -c 10-72 | tr '[:upper:]' '[:lower:]' | sed 's/[^0-9a-z]/-/g')"

# Pour chaque sous-dossier présent dans le cache (sauf assets)
for cached in $(find public/* -maxdepth 0 -type d -not -path 'public/assets' | cut -c 8-)
do
    if $(echo "$branches" | grep -w -q "$cached")
    then
        echo -e "\e[94mConservation du rendu de $cached\e[0m"
    else
        echo -e "\e[95mSuppression du rendu de $cached\e[0m"
        rm -fr "public/$cached"
    fi
done
