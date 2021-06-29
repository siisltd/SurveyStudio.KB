#!/usr/bin/env bash

##########################################################################
# Building  docs
##########################################################################

echo "Building SSNG KB docs..."

docs_dir=$PWD/docs/
site_dir=$PWD/site

echo $PWD
sudo mkdocs build --clean

echo "Building SSNG KB docs completed."


echo "Copying docs to artifacts..."

result_dir=$PWD/artifacts/docs/

rm -rf result_dir 
mkdir -p ${result_dir}
cp -a ${site_dir}/* ${result_dir}
sudo rm -rf ${site_dir}/

echo "Copying docs to artifacts completed"
