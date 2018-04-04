#!/bin/bash

artifact_name=demo-package-1.0.2-SNAPSHOT.jar

gid=com.example
art=demo-package
ver=1.0.2-SNAPSHOT
repo=maven-snapshots

mvn deploy:deploy-file \
	-DgroupId=${gid} \
	-DartifactId=${art} \
	-Dversion=${ver} \
	-DgeneratePom=true \
	-Dpackaging=jar \
	-DrepositoryId=nexus \
	-Durl=http://localhost:8081/repository/${repo} \
	-Dfile=target/${artifact_name} \
	-s settings.xml

