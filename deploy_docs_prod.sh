#!/usr/bin/env bash

##########################################################################
# Deploying SSNG KB docs to prod server
##########################################################################

# 1 = remote user
# 2 = remote host name
# 3 = ssh port 
# 4 = root dir with artifacts
REMOTE_USER=$1
REMOTE_HOST=$2
REMOTE_PORT=$3
ARTIFACTS_ROOT=$4


echo "Deploy to prod (${REMOTE_HOST}) started..."

DOCS_ARTIFACTS=/home/${REMOTE_USER}/updates/ssng/kb
DOCS_SRC=/home/${REMOTE_USER}/updates/ssng/kb
DOCS_DEST=/opt/ssng/kb/

echo "Artifacts bin: ${DOCS_ARTIFACTS}"

echo "Backuping previous version: ${DOCS_SRC}"

ssh ${REMOTE_USER}@${REMOTE_HOST} -p ${REMOTE_PORT} "mkdir -p ${DOCS_SRC} && rm -rf ${DOCS_SRC}_backup && mv ${DOCS_SRC} ${DOCS_SRC}_backup && mkdir -p ${DOCS_SRC}"

echo "Copying docs to prod started..."

scp -P ${REMOTE_PORT} -r ${ARTIFACTS_ROOT}/artifacts/docs/* ${REMOTE_USER}@${REMOTE_HOST}:${DOCS_SRC} 

echo "Copying docs to prod completed."

echo "Copying data to nginx served dir..."

ssh ${REMOTE_USER}@${REMOTE_HOST} -p ${REMOTE_PORT} "sudo rm -rf ${DOCS_DEST} && sudo mkdir -p ${DOCS_DEST} && sudo cp -a ${DOCS_SRC}/* ${DOCS_DEST} && sudo chown -R ssng:ssng ${DOCS_DEST}/"

