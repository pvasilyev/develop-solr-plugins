#!/usr/bin/bash

source common.sh

curl -X POST -H 'Content-type: application/json' http://${SOLR_HOST}:${SOLR_PORT}/solr/${SOLR_COLLECTION}/config -d '{
    "delete-runtimelib": "solr_plugin_v1"
}'

curl -X POST -H 'Content-type: application/json' http://${SOLR_HOST}:${SOLR_PORT}/solr/${SOLR_COLLECTION}/config -d '{
    "delete-requesthandler": "/custom_rh_v1"
}'

curl -X POST -H 'Content-type: application/json' http://${SOLR_HOST}:${SOLR_PORT}/solr/${SOLR_COLLECTION}/config -d '{
    "delete-requesthandler": "custom_qp_v1"
}'

curl "http://${SOLR_HOST}:${SOLR_PORT}/solr/admin/collections?action=DELETE&name=.system"
curl "http://${SOLR_HOST}:${SOLR_PORT}/solr/admin/collections?action=DELETE&name=gettingstarted"