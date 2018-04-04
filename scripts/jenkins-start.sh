#!/bin/bash

# start jenkins on localhost:8080

cd /opt/jenkins-2.89.3
java -jar jenkins-2.war
echo http://localhost:8080
