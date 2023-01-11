#!/usr/bin/bash

ansible-playbook /switch-conf-file-generator/main.yml -e "@backhaul_switch_config.yml"
