#!/usr/bin/bash

/usr/bin/ansible-playbook main.yml -e "@configs/$1.yml"
