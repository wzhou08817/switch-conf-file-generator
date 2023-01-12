#!/bin/sh

set -e # fail fast
set -x # print commands

cd resource-generator
ansible-playbook main.yml -e "@configs/backhaul_switch_config.yml"
cd ..

cp resource-generator/backhaul-switch.conf resource-gist/backhaul-switch.conf

cd resource-gist
date >> backhaul-switch.conf
git status

git config --global user.email "wzhou.08817@gmail.com"
git config --global user.name "wzhou08817"

#git add .
git commit backhaul-switch.conf -m "backhaul_config_file"

