#!/usr/bin/env bash

##########################################################################
# Adds Disqus comments to site
##########################################################################

diqusSite=$1

sed -i "s/disqus: /disqus: ${diqusSite}/g" mkdocs.yml

