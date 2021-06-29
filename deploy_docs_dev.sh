#!/usr/bin/env bash

##########################################################################
# Deploying SSNG KB docs to dev server
##########################################################################


DOCS_SITE=$PWD/artifacts/docs
DOCS_DST=/opt/ssng/docs


echo "Deploying SSNG KB docs to ${DOCS_DST} started..."
sudo rm -rf ${DOCS_DST}/*
sudo cp -a ${DOCS_SITE}/* ${DOCS_DST}
echo "Deploying SSNG KB docs to ${DOCS_DST} completed."
