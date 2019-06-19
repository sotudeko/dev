#!/bin/bash

datafile=role.json

curl -v -X POST -u admin:admin123 --header "Content-Type: text/plain" -d @$datafile "http://localhost:8081/service/rest/v1/script/demo_role_create/run"
