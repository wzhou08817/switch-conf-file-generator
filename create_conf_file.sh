#!/bin/sh

set -e # fail fast
set -x # print commands

git clone resource-generator
cd resource-generator
ansible-playbook main.yml -e "@configs/backhaul_switch_config.yml"
cd ..

git clone resource-gist updated-gist
cp resource-generator/backhaul-switch.conf updated-gist/backhaul-switch.conf

cd updated-gist

git config --global user.email "wzhou.08817@gmail.com"
git config --global user.name "wzhou08817"

git add .
git commit -m "backhaul config file"

