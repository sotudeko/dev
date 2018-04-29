#!/bin/bash

sfile=$1

java -jar /opt/nexus-iq/nexus-iq-cli -s http://localhost:8070 -a admin:admin123 -t build ${sfile}


