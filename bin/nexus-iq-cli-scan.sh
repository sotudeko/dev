#!/bin/bash

app=$1
sfile=$2

java -jar /opt/nexus-iq/nexus-iq-cli -i ${app} -s http://localhost:8070 -a admin:admin123 -t build ${sfile}
