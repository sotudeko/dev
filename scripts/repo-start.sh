#!/bin/bash

# start nexus-3 on localhost:8081
# 3.7.1-02

nexus_version=3.9.0-01

cd /opt/nexus-${nexus_version}/bin
./nexus run
echo http://localhost:8081

