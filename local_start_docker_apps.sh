#!/bin/bash
ansible-playbook -i hosts dockerapps.yml --skip-tags=dockerinstall