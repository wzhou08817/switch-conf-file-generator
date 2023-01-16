#!/bin/sh

set -e # fail fast
set -x # print commands

git clone resource-output updated-output

cd resource-generator
ansible-playbook main.yml -e "@configs/backhaul_switch_config.yml"
cd ..

cp resource-generator/backhaul-switch.conf updated-output/backhaul-switch.conf

cd updated-output
git pull

date >> backhaul-switch.conf

git config --global user.email "wzhou.08817@gmail.com"
git config --global user.name "wzhou08817"

git add .
git commit -m "backhaul_config_updated"

