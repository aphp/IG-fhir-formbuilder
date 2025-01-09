#!/bin/bash
# 
# Script de deploiement
#
# Collecte les artefacts générés par le build pour les exposer sur
# GitLab Pages. L'URL utilisée dépend de la nature du build :
# - Si le build est issu d'un push sur la branche par défaut (main), il est
#   publié à la racine du GitLab Pages.
# - Si le build est issu d'un push sur une autre branche, il est publié dans
#   un sous-dossier de la racine, qui correspond à la slug de la branche.
#   Il s'agit du nom de la branche en minuscule où tous les caractères à
#   l'exception de 0-9 et a-z sont replacés par des tirets ; les tirets
#   initiaux et finaux sont supprimés et la slug est tronqué à 63 octets
#   (24 caractères ASCII, moins si Unicode étendu).
#   L'URL ainsi générée est affichée pour faciliter la navigation.

# Verbosité du script
set -x

# Détermination de la branche de push
if [ ${CI_COMMIT_BRANCH} == ${CI_DEFAULT_BRANCH} ]
then
    OUTPUT_DIR="public"
    FINAL_URL="${CI_PAGES_URL}"
else
    OUTPUT_DIR="public/${CI_COMMIT_REF_SLUG}"
    FINAL_URL="${CI_PAGES_URL}/${CI_COMMIT_REF_SLUG}"
fi

# Copie des fichiers vers le dossier dédié à GitLab Pages
mkdir -p ${OUTPUT_DIR}
cp -fr output/* ${OUTPUT_DIR}

# Affichage de l'URL de publication
echo -e "\e[104mPublié sur $FINAL_URL\e[0m"
