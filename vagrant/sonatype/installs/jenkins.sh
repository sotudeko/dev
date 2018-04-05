#!/usr/bin/env bash

jenkins_rpm="jenkins-2.89.4-1.1.noarch.rpm"

cd /vagrant/packages
yum -y localinstall ${jenkins_rpm}
service jenkins start





