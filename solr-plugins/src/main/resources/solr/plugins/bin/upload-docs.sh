#!/usr/bin/bash

source common.sh

curl -X POST -H 'Content-Type: application/json' http://${SOLR_HOST}:${SOLR_PORT}/solr/${SOLR_COLLECTION}/update?commit=true --data-binary '
[
  {
    "id": "1",
    "clientName_s": "Johnson, Harry",
    "clientCity_s": "Chicago"
  },
  {
    "id": "2",
    "clientName_s": "Peterson, Moe",
    "clientCity_s": "Springfield"
  },
  {
    "id": "3",
    "clientName_s": "John, Smith",
    "clientCity_s": "Windsor"
  }
]'
