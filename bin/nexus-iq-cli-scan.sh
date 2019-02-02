#!/bin/bash

app=$1
sfile=$2

if [ $# -eq 3 ]; then
  stage=$3
else
  stage=build
fi

debug=
user=admin
passwd=admin123

java -jar /opt/nexus-iq/nexus-iq-cli -i ${app} -s http://localhost:8070 -a ${user}:${passwd} -t ${stage} ${sfile} ${debug}

