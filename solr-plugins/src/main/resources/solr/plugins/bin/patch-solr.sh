#!/usr/bin/bash

source common.sh

curl -X POST -H 'Content-type: application/json' http://${SOLR_HOST}:${SOLR_PORT}/solr/.system/update -d '{
    "delete": {
        "query": "blobName:solr_plugin_v1"
    },
    "commit": {}
}'

curl -X POST -H 'Content-type: application/octet-stream' --data-binary @../../../../../../target/solr.plugins-1.0-SNAPSHOT.jar http://${SOLR_HOST}:${SOLR_PORT}/solr/.system/blob/solr_plugin_v1

curl -X POST -H 'Content-type: application/json' http://${SOLR_HOST}:${SOLR_PORT}/solr/${SOLR_COLLECTION}/config -d '{
    "create-runtimelib": {
        "name": "solr_plugin_v1",
        "version": 1
    }
}'

curl -X POST -H 'Content-type: application/json' http://${SOLR_HOST}:${SOLR_PORT}/solr/${SOLR_COLLECTION}/config -d '{
    "create-requesthandler": {
        "name": "/custom_rh_v1",
        "class": "com.github.pvasilyev.solr.plugins.CustomSearchHandler",
        "components": [
            "query",
            "debug"
        ],
        "runtimeLib": "true",
        "version": "1",
        "custom.property.one.can.read.from.named.list": "this is silly message text"
    }
}'

curl -X POST -H 'Content-type: application/json' http://${SOLR_HOST}:${SOLR_PORT}/solr/${SOLR_COLLECTION}/config -d '{
    "create-requesthandler": {
        "name": "custom_qp_v1",
        "class": "com.github.pvasilyev.solr.plugins.CustomQParserPlugin",
        "runtimeLib": "true",
        "version": "1"
    }
}'