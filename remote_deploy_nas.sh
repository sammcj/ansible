#!/bin/bash
ansible-playbook -i hosts site.yml --skip-tags osx
