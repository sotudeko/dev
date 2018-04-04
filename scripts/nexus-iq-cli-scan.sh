#!/bin/bash

sfile=$1
app=$2

java -jar /opt/nexus-iq-cli/LATEST -i ${app} -s http://localhost:8070 -a admin:admin123 -t build ${sfile}


