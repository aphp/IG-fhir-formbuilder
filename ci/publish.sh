#!/bin/bash
# 
# Script de publication
#
# Publie le package FHIR généré sur le registry commun :
# https://gitlab.data.aphp.fr/ID/ed/dm/ig/fig-registry

# Verbosité du script
set -x

# Nom du package, depuis la configuration Sushi
PACKAGE_NAME=$(sed -n 's/^id:\s\{1,\}\([^#\t ]*\).*$/\1/p' sushi-config.yaml)
echo "PACKAGE_NAME=${PACKAGE_NAME}"

# Version du package, depuis la configuration Sushi
PACKAGE_VERSION=$(sed  -n 's/^version:\s\{1,\}\([^#\t ]*\).*$/\1/p' sushi-config.yaml)
echo "PACKAGE_VERSION=${PACKAGE_VERSION}"

# URL de publication sur le regiistre
PACKAGE_URL="https://gitlab.data.aphp.fr/api/v4/projects/2190/packages/generic/${PACKAGE_NAME}/${PACKAGE_VERSION}/${PACKAGE_NAME}.tgz"
echo "PACKAGE_URL=${PACKAGE_URL}"

# Upload sur https://gitlab.data.aphp.fr/ID/ed/dm/ig/fig-registry
curl --fail-with-body --header "PRIVATE-TOKEN: $FIG_REGISTRY_TOKEN" --upload-file output/package.tgz "${PACKAGE_URL}"
