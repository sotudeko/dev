#!/bin/bash

reportId=$1
curl --silent -u admin:admin123 -X GET http://localhost:8070/api/v2/applications/sampleapp/reports/${reportId} | python -m json.tool

