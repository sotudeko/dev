#!/bin/bash

cd /opt/nexus-iq
java -jar nexus-iq-server server config.yml
echo http://localhost:8070
