#!/usr/bin/bash

source common.sh

curl "http://${SOLR_HOST}:${SOLR_PORT}/solr/admin/collections?action=CREATE&name=.system&replicationFactor=2"
