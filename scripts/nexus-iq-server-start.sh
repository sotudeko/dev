#!/bin/bash

# start nexus-iq-server on localhost:8070

cd /opt/nexus-iq-server
java -jar LATEST server config.yml
echo http://localhost:8070
