#!/usr/bin/env bash

tools_dir="/opt/sonatype"
nexus3_home="${tools_dir}/nexus3"

if [[ ! -d ${nexus3_home} ]]; then
    tar xvzf /vagrant/packages/nexus-LATEST -C ${tools_dir} 
    sudo echo '' >> ${nexus3_home}/bin/nexus.rc
    sudo echo 'run_as_user="vagrant"' >> ${nexus3_home}/bin/nexus.rc
    sudo ln -s ${nexus3_home}/bin/nexus /etc/init.d/nexus
    cd /etc/init.d
    sudo chkconfig --add nexus
    sudo chkconfig --levels 345 nexus on
    sudo service nexus start
else
    echo "Nexus3 is running"
fi

