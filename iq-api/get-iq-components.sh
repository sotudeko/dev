#!/bin/bash

#curl -u admin:admin123 -X GET "http://localhost:8070/api/v2/search/component?stageId=build&componentIdentifier=%7B%22format%22%3A%22maven%22%2C%22coordinates%22%3A%7B%22groupId%22%3A%22org%22%2C%22artifactId%22%3A%22*%22%2C%22version%22%3A%22*%22%2C%22extension%22%3A%22*%22%2C%22classifier%22%3A%22*%22%7D%7D"

#curl -u admin:admin123 -X GET "http://localhost:8070/api/v2/search/component?stageId=build&componentIdentifier={'format':'maven','coordinates':{'groupId':'tomcat','artifactId':'*','version':'*','extension':'*','classifier':'*'}}"

#curl --silent -u admin:admin123 -X GET http://localhost:8070/api/v2/search/component | python -m json.tool


#curl -u admin:admin123 -X POST -H "Content-Type: application/json" -d '{"components":[{"hash": null,"componentIdentifier": {"format":"maven","coordinates": {"artifactId":"tomcat-util","extension":"jar","groupId":"tomcat","version":"5.5.23"}}}]}' 'http://localhost:8070/api/v2/components/details' | python -m json.tool

curl -u admin:admin123 -X POST -H "Content-Type: application/json" -d '{"components":[{"hash": null,"componentIdentifier": {"format":"maven"}}]}' 'http://localhost:8070/api/v2/components/details' | python -m json.tool



