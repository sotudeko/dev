#!/usr/bin/env bash

tools_dir="/opt/sonatype"
iq_cli_dir=${tools_dir}/nexus-iq-cli

if [[ ! -d "${iq_cli_dir}" ]]; then
    mkdir -p ${iq_cli_dir}
    cp /vagrant/packages/nexus-iq-cli/* ${iq_cli_dir}
else
    echo "Nexus IQ cli already installed"
fi

