#!/bin/sh

set -e # fail fast
set -x # print commands

cd resource-generator
ansible-playbook main.yml -e "@configs/backhaul_switch_config.yml"
cd ..

cp resource-generator/backhaul-switch.conf resource-gist/backhaul-switch.conf

cd resource-gist

git config --global user.email "wzhou.08817@gmail.com"
git config --global user.name "wzhou08817"

git add .
git commit * -m "backhaul config file"

